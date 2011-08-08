# # Functions (and their Interfaces)
# 
# Functions (also those only implemented by macros in C) can be accessed as module functions of the Module Ncurses. They take exactly the same arguments as their C counterparts. Some of the C functions return additional arguments through pointer arguments. These are implemented as follows:
# 
# ## Functions expecting pointers to integer types
# 
# When the C-function expects a pointer to int, short, chtype, or attr_type, You should use a variable containing an empty array as the argument to the ruby function. This is because ruby passes these types (ints) "by value" instead of "by reference"; but arrays are passed by reference, so that you can see the changes to them. Attention: some macro-only functions like getsyx accept variables of type int, but, being macros, they write values to their arguments. Thus, they also need empty array arguments when called from ruby.
# 
# Example: 
# 	color_pair_number = 4
# 	foreground_color  = []
# 	background_color  = []
# 	if (Ncurses.pair_content(color_pair_number, foreground_color,
# 			         background_color) != Ncurses::ERR)
# 	  "color pair number #{color_pair_number} contains color number " +
# 	  "#{foreground_color[0]} as the foreground color, and color "    +
# 	  "number #{background_color[0]} as the background color")
# 	end
# 
# There are 2 functions that read a value from the location pointed to by a
# pointer to int, and store another value at those locations. These functions are
# mouse_trafo and wmouse_trafo. When calling these functions, you have to provide
# 2 arrays, each filled with exacly one Integer. The values contained in these
# arrays will then be changed by the ruby module function.
# 
# ## Functions expecting (non-const) pointers to char
# 
# When the C-function expects a pointer to char, you should use a variable
# containing an empty string as the argument to the ruby function.
# Example:
# 	line2 = ""
# 	if (Ncurses.mvwinnstr(Ncurses.stdscr, y=2, x=0, line2,
# 			      Ncurses.getmaxx(Ncurses.stdscr)) == Ncurses::ERR)
# 		raise "could not scan 3rd line"
# 	else
# 		Ncurses.beep if line2.index("|")
# 	end
# The string that the C function would store at the pointer-to-char location
# will be appended to the given string.
# 
# Functions expecting const pointers to char do not modify the string they
# receive, you can pass any string to them.
# 
# ## Functions expecting pointers to structs
# 
# When the C-function expects a pointer to WINDOW, SCREEN, MEVENT,
# PANEL, FORM, FIELD or FIELDTYPE then simply pass it the corresponding,
# already existing ruby object.
# 
# ## scanf style functions expecting various pointers
# 
# namely scanw, mvscanw, wscanw, mvwscanw.  Use an array after the format string.
# The scanned values will be placed there.  Remember, you need scanf for ruby
# installed for these functions to work.

def Ncurses.inchnstr(str,n)
  Ncurses.winchnstr(Ncurses.stdscr, str, n)
end

def Ncurses.inchstr(str)
  Ncurses.winchstr(Ncurses.stdscr, str)
end

def Ncurses.mvinchnstr(y,x, str, n)
  Ncurses.mvwinchnstr(Ncurses.stdscr, y,x, str, n)
end

def Ncurses.mvinchstr(y,x, str)
  Ncurses.mvwinchstr(Ncurses.stdscr, y,x, str)
end

def Ncurses.mvwinchnstr(win, y,x, str, n)
  if (Ncurses.wmove(win,y,x) == Ncurses::ERR) 
    Ncurses::ERR
  else
    Ncurses.winchnstr(win,str,n)
  end
end

def Ncurses.mvwinchstr(win, y,x, str)
  maxy = []; maxx = []; getmaxyx(win, maxy,maxx)
  return Ncurses::ERR if (maxx[0] == Ncurses::ERR)
  Ncurses.mvwinchnstr(win, y,x, str, maxx[0]+1)
end

def Ncurses.winchstr(win, str)
  maxy = []; maxx = []; getmaxyx(win, maxy,maxx)
  return Ncurses::ERR if (maxx[0] == Ncurses::ERR)
  Ncurses.winchnstr(win, str, maxx[0]+1)
end

def Ncurses.getnstr(str,n)
  Ncurses.wgetnstr(Ncurses.stdscr, str, n)
end

def Ncurses.mvgetnstr(y,x, str, n)
  Ncurses.mvwgetnstr(Ncurses.stdscr, y,x, str, n)
end

def Ncurses.mvwgetnstr(win, y,x, str, n)
  if (Ncurses.wmove(win,y,x) == Ncurses::ERR) 
    Ncurses::ERR
  else
    Ncurses.wgetnstr(win,str,n)
  end
end

def Ncurses.innstr(str,n)
  Ncurses.winnstr(Ncurses.stdscr, str, n)
end

def Ncurses.instr(str)
  Ncurses.winstr(Ncurses.stdscr, str)
end

def Ncurses.mvinnstr(y,x, str, n)
  Ncurses.mvwinnstr(Ncurses.stdscr, y,x, str, n)
end

def Ncurses.mvinstr(y,x, str)
  Ncurses.mvwinstr(Ncurses.stdscr, y,x, str)
end

def Ncurses.mvwinnstr(win, y,x, str, n)
  if (Ncurses.wmove(win,y,x) == Ncurses::ERR) 
    Ncurses::ERR
  else
    Ncurses.winnstr(win,str,n)
  end
end

def Ncurses.mvwinstr(win, y,x, str)
  maxy = []; maxx = []; getmaxyx(win, maxy,maxx)
  return Ncurses::ERR if (maxx[0] == Ncurses::ERR)
  Ncurses.mvwinnstr(win, y,x, str, maxx[0]+1)
end

def Ncurses.winstr(win, str)
  maxy = []; maxx = []; getmaxyx(win, maxy,maxx)
  return Ncurses::ERR if (maxx[0] == Ncurses::ERR)
  Ncurses.winnstr(win, str, maxx[0]+1)
end

def Ncurses.mouse_trafo(pY, pX, to_screen)
  Ncurses.wmouse_trafo(Ncurses.stdscr, pY, pX, to_screen)
end

def Ncurses.getcurx(win)
  x = []; y = []; Ncurses.getyx(win, y,x); x[0]
end

def Ncurses.getcury(win)
  x = []; y = []; Ncurses.getyx(win, y,x); y[0]
end

def Ncurses.getbegx(win)
  x = []; y = []; Ncurses.getbegyx(win, y,x); x[0]
end

def Ncurses.getbegy(win)
  x = []; y = []; Ncurses.getbegyx(win, y,x); y[0]
end

def Ncurses.getmaxx(win)
  x = []; y = []; Ncurses.getmaxyx(win, y,x); x[0]
end

def Ncurses.getmaxy(win)
  x = []; y = []; Ncurses.getmaxyx(win, y,x); y[0]
end

def Ncurses.getparx(win)
  x = []; y = []; Ncurses.getparyx(win, y,x); x[0]
end

def Ncurses.getpary(win)
  x = []; y = []; Ncurses.getparyx(win, y,x); y[0]
end

def Ncurses.erase
  Ncurses.werase(Ncurses.stdscr)
end

def Ncurses.getstr(str)
  Ncurses.getnstr(str, Ncurses::GETSTR_LIMIT)
end

def Ncurses.mvgetstr(y,x, str)
  Ncurses.mvgetnstr(y,x, str, Ncurses::GETSTR_LIMIT)
end

def Ncurses.mvwgetstr(win, y,x, str)
  Ncurses.mvwgetnstr(win, y,x, str, Ncurses::GETSTR_LIMIT)
end

def Ncurses.wgetstr(win, str)
  Ncurses.wgetnstr(win, str, Ncurses::GETSTR_LIMIT)
end

def Ncurses.scanw(format, result)
  Ncurses.wscanw(Ncurses.stdscr, format, result)
end

def Ncurses.mvscanw(y,x, format, result)
  Ncurses.mvwscanw(Ncurses.stdscr, y,x, format, result)
end

def Ncurses.mvwscanw(win, y,x, format, result)
  if (Ncurses.wmove(win, y,x) == Ncurses::ERR) 
    Ncurses::ERR
  else
    Ncurses.wscanw(win, format, result)
  end
end

def Ncurses.wscanw(win, format, result)
  str = ""
  if (Ncurses.wgetstr(win, str) == Ncurses::ERR) 
    Ncurses::ERR
  else
    require "scanf.rb" # Use ruby's implementation of scanf
    result.replace(str.scanf(format))
  end
end

def Ncurses.mvprintw(*args)
  Ncurses.mvwprintw(Ncurses.stdscr, *args)
end

def Ncurses.mvwprintw(win, y,x, *args)
  if (Ncurses.wmove(win,y,x) == Ncurses::ERR) 
    Ncurses::ERR
  else
    wprintw(win, *args)
  end
end

def Ncurses.printw(*args)
  Ncurses.wprintw(Ncurses.stdscr, *args)
end

def Ncurses.touchline(win, start, count)
  Ncurses.wtouchln(win, start, count, 1)
end

def Ncurses.touchwin(win)
  wtouchln(win, 0, getmaxy(win), 1)
end

module Ncurses
  Ncurses = self # for accessing Ncurses from a Module that includes Ncurses

  # Some users like to include ncurses names despite namespace pollution
  # This module is for them
  module Namespace
    def self.append_features(target)
      # include constants
      unless target.ancestors.member?(Ncurses)
        target.__send__(:include, Ncurses)
      end
      
      # make methods available
      unless target.respond_to?(:pre_Ncurses_method_missing)
        target.module_eval{
          alias pre_Ncurses_method_missing method_missing
          def method_missing(name, *args)
            if Ncurses.respond_to?(name)
              Ncurses.send(name, *args)
            else
              pre_Ncurses_method_missing(name, *args)
            end
          end
        }
      end
    end

    def self.entend_object(object)
      class << object
        self
      end.__send__(:include, self)
    end
  end
end
