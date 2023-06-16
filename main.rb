require 'dxruby'
require_relative 'draw'
require_relative 'gameOver'
require_relative 'ghostMove'
require_relative 'pacmanMove'
require_relative 'map'
require_relative 'directory'
require_relative 'item'

font = Font.new(32)
count = 1
Window.width = 640
Window.height = 480



# ゴーストの初期位置と速度
ghost_x = 160
ghost_y = 160
ghost_speed = 1

# 迷路データ（仮のデータ）
maze = maze = Array.new(15) { Array.new(21, "#") }
maze = generate_maze(maze, 3, 5)

# パックマンの初期位置と速度
r=rand(15)
c=rand(15)
maze[c][r]=' '

pacman_x=c*32
pacman_y=r*32
pacman_speed=2

Window.loop do
  print "\r#{directory(pacman_x, pacman_y)}"
  pacman_x, pacman_y = pacmanMove(pacman_x, pacman_y, pacman_speed, maze)

  ghost_x, ghost_y = ghostMove(ghost_x, ghost_y, ghost_speed, pacman_x, pacman_y)
  if gameOver(pacman_x, pacman_y, ghost_x, ghost_y)
    break
  end

  # 迷路を描画
  maze.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      if cell == "#"
        draw(x * 32, y * 32, C_WHITE)
      else
        draw(x * 32, y * 32, C_BLACK)
      end
    end
  end
  #item
  pacman_speed = item(pacman_x,pacman_y,pacman_speed)


  # 描画処理
  draw(pacman_x, pacman_y, C_YELLOW)
  draw(ghost_x, ghost_y, C_RED)

  Window.draw_font(32,32,"score:#{count}",font)
  count=count+1  
end