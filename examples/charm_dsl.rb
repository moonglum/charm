require 'charm'

window = Canvas.new # by default Canvas has the size of the entire window and is transparent
# to do a split screen, you can add coordinates including width and height

window.put_char "x", :x => 13, :y => 2

window.draw_circle :x => 15, :y => 20, :radius => 5

window = Canvas.new :scrollable => true
