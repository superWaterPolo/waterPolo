require 'dxruby'

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
  [1, 1, 1, 1, 1, 1, 1, 1],
  [1, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 1, 1, 1, 1, 0, 1],
  [1, 0, 1, 0, 0, 0, 0, 1],
  [1, 0, 1, 0, 1, 0, 0, 1],
  [1, 0, 0, 0, 1, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1],
]

Window.loop do
  # パックマンの移動処理
  if Input.key_down?(K_LEFT)
    pacman_x -= pacman_speed
  elsif Input.key_down?(K_RIGHT)
    pacman_x += pacman_speed
  elsif Input.key_down?(K_UP)
    pacman_y -= pacman_speed
  elsif Input.key_down?(K_DOWN)
    pacman_y += pacman_speed
  end

  # ゴーストの移動処理（ランダムな移動）
  if ghost_x < pacman_x
    ghost_x += ghost_speed
  elsif ghost_x > pacman_x
    ghost_x -= ghost_speed
  else
    if ghost_y < pacman_y
      ghost_y += ghost_speed
    elsif ghost_y > pacman_y
      ghost_y -= ghost_speed
    end
  end

  # 衝突判定（仮の判定）
  if pacman_x == ghost_x && pacman_y == ghost_y
    # ゲームオーバー処理
    puts "Game Over"
    break
  end

  # 描画処理
  Window.draw(pacman_x, pacman_y, Image.new(32, 32, C_YELLOW)) # パックマンを描画
  Window.draw(ghost_x, ghost_y, Image.new(32, 32, C_RED)) # ゴーストを描画

  # 迷路を描画
  maze.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      if cell == 1
        Window.draw(x * 32, y * 32, Image.new(32, 32, C_WHITE))
      else
        Window.draw(x * 32, y * 32, Image.new(32, 32, C_BLACK))
      end
    end
  end
end
