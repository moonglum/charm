module Ncurses
  # # The form Library
  # 
  # The form library was wrapped inside the Ncurses:Form module. All
  # form functions are implemented as module functions on the module
  # Ncurses::Form. In addition, all function for which the first
  # parameter is one of the objects are also implemented as an instance 
  # method of the respective class. For example, instead of calling
  # post_form(form), you can use form.post_form().
  # 
  # Three objects are defined in the Ncurses:Form module:
  # 	1. FORM
  # 	2. FIELD
  # 	3. FIELDTYPE
  # 
  # They are wrapping actual ncurses pointers and should be use whenever a
  # pointer to one of these types is expected in function calls.
  # 
  # All form constants are defined in the module as Ruby constants with
  # the same name as the curses constants.
  # 
  # Constructors for FORM, FIELD and FIELDTYPE objects are also provided,
  # and they expect the same parameters as new_form, new_field and
  # new_fieldtype curses functions.
  # 
  # Field validation is implemented using Ruby Proc objects. You must
  # provide a Ruby block whenever a function pointer is expected in curses
  # function arguments. See the example form2.rb for more details.
  # 
  # The functions form_userptr and field_userptr are not supported. Use
  # form.user_object and field.user_object to store Ruby objects instead.
  module Form
    class FORM
      attr_reader :user_object

      # This placeholder replaces the form_userptr function in curses
      def user_object=(obj)
        @user_object = obj
      end
    end
    
    class FIELD
      attr_reader :user_object

      # This placeholder replaces the field_userptr function in curses
      def user_object=(obj)
        @user_object = obj
      end
    end

    class FIELDTYPE
    end
  end
end