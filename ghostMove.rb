
def ghostMove(ghost_x, ghost_y, ghost_speed, pacman_x, pacman_y)
    if (pacman_x-ghost_x).abs>(pacman_y-ghost_y).abs
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
        return ghost_x, ghost_y
    else
        if ghost_y < pacman_y
            ghost_y += ghost_speed
        elsif ghost_y > pacman_y
            ghost_y -= ghost_speed
        else
            if ghost_x < pacman_x
                ghost_x += ghost_speed
            elsif ghost_x > pacman_x
                ghost_x -= ghost_speed
            end
        end
        return ghost_x, ghost_y
    end
end