
def pacmanMove(x, y, speed)
    if Input.key_down?(K_LEFT)
        x -= speed
    elsif Input.key_down?(K_RIGHT)
        x += speed
    elsif Input.key_down?(K_UP)
        y -= speed
    elsif Input.key_down?(K_DOWN)
        y += speed
    end
    return x, y
end