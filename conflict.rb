
def conflict(map, w, h, state)
    case state
    when 0
        if map[h][w]=="#"
            return false
        else
            return true
        end
    when 1
        if map[h][w+1]=="#"
            return false
        else
            return true
        end
    when 2
        if map[h+1][w]=="#"
            return false
        else
            return true
        end
    when 3
        if map[h][w]=="#"
            return false
        else
            return true
        end
    end
end