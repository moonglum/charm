# # The old interface
# 
# This explains how to use the old ncurses ruby interface. It is assumed that the reader has a rough understanding of what the ncurses library is and how to use it from the C language. It then goes into detail, explaining what is covered by the ruby interface, and the rules that were followed in translating the C interface into a ruby interface.
# 
# This ncurses interface provides access to the functions, macros, global variables and constants of the ncurses library.  These are mapped to a Ruby Module named "Ncurses": Functions and external variables are implemented as singleton functions of the Module Ncurses.
# 
# ## Ncurses and Ruby Threads
# 
# The ncurses library is not thread-safe. Your application must properly
# serialize calls into ncurses.
# 
# Prior to release 0.9.2, the getch and wgetch calls used to block the
# complete ruby interpreter, all threads. This is no longer so. Other
# threads should now continue to run during blocking calls to getch and
# wgetch.
# 
# ## Unwrapped functions
# 
# This is the complete list of functions present in ncurses that have not yet been wrapped by ncurses-ruby:
# 
# * **terminfo functions:** setupterm, setterm, set_curterm, del_curterm, restartterm, tparm, tputs, vidputs
# * **termcap fuctions:**   tgetent, tgetflag, tgetnum, tgetstr, tgoto
# * **ncurses kernel functions:**   ripoffline
# * **No sense in wrapping these:**     vw_printw, vwprintw, vwscanw
module Ncurses
end

require "ncurses_bin.so"

require "ncurses/constants"
require "ncurses/destroy_checker"
require "ncurses/window"
require "ncurses/screen"
require "ncurses/mvevent"
require "ncurses/panel"
require "ncurses/form"
require "ncurses/menu"
require "ncurses/functions"


