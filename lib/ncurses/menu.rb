module Ncurses
  # # The menu Library
  # 
  # The menu library was wrapped inside the Ncurses:Menu module. All
  # menu functions are implemented as module functions in the module
  # Ncurses::Menu. In addition, all functions for which the first
  # parameter is one of the objects are also implemented as an instance 
  # method of the respective class. For example, instead of calling
  # post_menu(menu), you can use menu.post_menu().
  # 
  # Two objects are defined in the Ncurses:Menu module:
  # 	1. MENU
  # 	2. ITEM
  # 
  # They are wrapping actual ncurses pointers and should be use whenever a
  # pointer to one of these types is expected in function calls.
  # 
  # All menu constants are defined in the module as Ruby constants with
  # the same name as the curses constants.
  # 
  # Constructors for MENU and ITEM objects are also provided, and they
  # expect the same parameters as new_menu and new_item curses functions.
  # 
  # You must provide a Ruby block whenever a function pointer is expected
  # in curses function arguments.
  # 
  # The functions menu_userptr and item_userptr are not supported. Use
  # menu.user_object and item.user_object to store Ruby objects instead.
  module Menu
    class MENU
      attr_reader :user_object

      # This placeholder replaces the menu_userptr function in curses
      def user_object=(obj)
        @user_object = obj
      end
    end
    
    class ITEM
      attr_reader :user_object

      # This placeholder replaces the item_userptr function in curses
      def user_object=(obj)
        @user_object = obj
      end
    end
  end
end