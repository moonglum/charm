require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  rows, cols = [], []
  window.getmaxyx rows, cols
  rows, cols = rows.first, cols.first
  
  window.addstr "Hit enter to see text being added with scrolling disabled"
  window.refresh
  window.getch
  
  text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

  window.scrollok(false) # this is the default setting
  text.split(/ /).each do |word|
    window.addstr "#{word}\n"
    window.refresh
    Ncurses.napms 25
  end
  window.clear
  
  window.addstr "Hit enter to see text being added with scrolling enabled"
  window.refresh
  window.getch

  window.scrollok(true)
  text.split(/ /).each do |word|
    window.addstr "#{word}\n"
    window.refresh
    Ncurses.napms 25
  end
  window.clear
  
  window.addstr "Hit enter to see text being added with scrolling disabled in a new window"
  window.refresh
  window.getch
  window2 = Ncurses.newwin(20, 20, 20, 20)
  text.split(/ /).each do |word|
    window2.addstr "#{word}\n"
    window2.refresh
    Ncurses.napms 25
  end

  
  window.addstr "Hit enter to see text being added with scrolling enabled in a new window"
  window.refresh
  window.getch
  window2.scrollok true
  text.split(/ /).each do |word|
    window2.addstr "#{word}\n"
    window2.refresh
    Ncurses.napms 25
  end
  
ensure
  Ncurses.endwin
end