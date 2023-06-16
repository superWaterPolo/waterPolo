require_relative 'conflict'
require_relative 'directory'

def pacmanMove(x, y, speed, map)
    r, c=directory(x, y)
    if Input.key_down?(K_LEFT)
        if conflict(map, r, c, 3)
            x -= speed
        end
    elsif Input.key_down?(K_RIGHT)
        if conflict(map, r, c, 1)
            x += speed
        end
    elsif Input.key_down?(K_UP)
        if conflict(map, r, c, 0)
            y -= speed
        end
    elsif Input.key_down?(K_DOWN)
        if conflict(map, r, c, 2)
            y += speed
        end
    end
    return x, y
end