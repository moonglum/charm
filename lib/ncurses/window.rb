module Ncurses
  
  ### The WINDOW class
  # 
  # The class WINDOW implements method_missing and tries to map invoked
  # methods to Ncurses module functions using a simple heuristic:
  # 
  # If the method name starts with "mv", it looks for a Ncurses module
  # function that starts with "mvw", and if it exists, adds itself to the
  # argument list and calls this function.
  # If no such module function exists, or the name of the invoked method
  # does not start with "mv", it looks if there is a module function with
  # the name "w" + methodname, and if it exists, adds itself again to the
  # argument list and calls this function.
  # If this module function did not exist either, then, as a last step, it
  # invokes a module function with the same name as the method, adding
  # itself to the argument list.
  # 
  # Example: If you invoke win.mvaddch(y,x,ch) on an Ncurses::WINDOW
  # object, it will delegate the method call to
  # Ncurses.mvwaddch(win,y,x,ch).
  # 
  # Other examples:
  #  
  #  win.printw("hello") =>  Ncurses.wprintw(win, "hello")
  #  
  #  win.getmaxyx(y=[],
  #               x=[])  =>  Ncurses.getmaxyx(win,y,x)
  #  
  #  win.delwin()        =>  Ncurses.delwin(win)          # win cannot be used
  #                                                       # after this call
  class WINDOW

    include Destroy_checker
    
    def method_missing(name, *args)
      name = name.to_s
      if (name[0,2] == "mv")
        test_name = name.dup
        test_name[2,0] = "w" # insert "w" after"mv"
        if (Ncurses.respond_to?(test_name))
          return Ncurses.send(test_name, self, *args)
        end
      end
      test_name = "w" + name
      if (Ncurses.respond_to?(test_name))
        return Ncurses.send(test_name, self, *args)
      end
      Ncurses.send(name, self, *args)
    end
    
    def respond_to?(name)
      name = name.to_s
      if (name[0,2] == "mv" && Ncurses.respond_to?("mvw" + name[2..-1]))
        return true
      end
      Ncurses.respond_to?("w" + name) || Ncurses.respond_to?(name)
    end
    
    def del
      Ncurses.delwin(self)
    end
    
    alias delete del
    
    def WINDOW.new(*args)
      Ncurses.newwin(*args)
    end
  end
end
