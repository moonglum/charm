module Ncurses
  class SCREEN
    include Destroy_checker
  
    def del
      Ncurses.delscreen(self)
    end
  
    alias delete del
  end
end