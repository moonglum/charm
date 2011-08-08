# # Constants (static C Preprocessor macros)
# 
# Constants are implemented as module constants in the Ncurses module, if possible. Ruby constants can not start with an underscore, so these constants have been renamed (they lost the leading underscore). There are, however, module functions with the same name as these constants, that also return the constant's value, when invoked (e.g. "Ncurses._ENDLINE" returns the value of the constant "Ncurses::ENDLINE", which has the same value as the C constant "_ENDLINE").
# 
# Note: The ncurses macros starting with ACS_ are not constants, their value depends on the terminal in use.  Nevertheless, they are implemented as constants of the Ncurses module, but since they depend on the terminal, they are not initialized before initscr() has been called. If you need more than one terminal in a single program, you can access the ACS_ values through member functions of class SCREEN.
# 
### External Variables
# 
# External variables are accessed read-only, by module functions taking no arguments.  They are spelled exactly like their C counterparts. Sometimes, this leads to module functions beginning with an uppercase letter (e.g. Ncurses.LINES).
# 
# One of these external variables, ESCDELAY, is also settable with a ruby method (Ncurses.ESCDELAY=).
# 
# Another external variable, Ncurses.RESIZEDELAY is introduced by this wrapper. It contains # the maximum milliseconds delay with which terminal resizesings are recognized.
# 
# ## Locale handling
# 
# The C library function setlocale is not technically an Ncurses function.
# However, it is used by many ncurses programs, and for this purpose,
# a wrapper for this function is also included in ncurses-ruby.
# 
# The function is implemented as a module function Ncurses.ruby, and
# expects two arguments, an Integer and a String.  It returns a string. 
# The constants that can be used as the Integer argument are also wrapped
# as constants in the Ncurses module.  See the manual page for setlocale
# for documentation of this function.


def Ncurses._XOPEN_CURSES
  Ncurses::XOPEN_CURSES
end

def Ncurses._SUBWIN
  Ncurses::SUBWIN
end

def Ncurses._ENDLINE
  Ncurses::ENDLINE
end

def Ncurses._FULLWIN
  Ncurses::FULLWIN
end

def Ncurses._SCROLLWIN
  Ncurses::SCROLLWIN
end

def Ncurses._ISPAD
  Ncurses::ISPAD
end

def Ncurses._HASMOVED
  Ncurses::HASMOVED
end

def Ncurses._WRAPPED
  Ncurses::WRAPPED
end

def Ncurses._NOCHANGE
  Ncurses::NOCHANGE
end

def Ncurses._NEWINDEX
  Ncurses::NEWINDEX
end

module Ncurses
  GETSTR_LIMIT = 1024
end