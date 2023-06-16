require 'dxruby'
require_relative 'conflict'
require_relative 'draw'
require_relative 'gameOver'
require_relative 'ghostMove'
require_relative 'pacmanMove'
require_relative 'item'
 
font = Font.new(32)
count = 1

Window.width = 640
Window.height = 480

# パックマンの初期位置と速度
pacman_x = 320
pacman_y = 240
pacman_speed = 2

# ゴーストの初期位置と速度
ghost_x = 160
ghost_y = 160
ghost_speed = 1

# 迷路データ（仮のデータ）
maze = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]

Window.loop do
  pacman_x, pacman_y = pacmanMove(pacman_x, pacman_y, pacman_speed)

  ghost_x, ghost_y = ghostMove(ghost_x, ghost_y, ghost_speed, pacman_x, pacman_y)

  if gameOver(pacman_x, pacman_y, ghost_x, ghost_y)
    break
  end
  

  # 迷路を描画
  maze.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      if cell == 1
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