module Ncurses
  
  # # The panel Library
  # 
  # The panel library has also been wrapped. All panel functions are
  # implemented as module functions of the module Ncurses::Panel.
  # 
  # Most of these functions are also implemented as methods of class
  # Ncurses::Panel::PANEL, once with their original name and once with the
  # subword "panel" and an adjacent underscore removed.
  module Panel
    class PANEL
    end
  end
end