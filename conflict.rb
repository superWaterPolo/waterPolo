
def conflict(a_x, a_y, b_x, b_y)
    if (a_x-b_x).abs <= 32
        if (a_y-b_y).abs <= 32
            return 0
        end
    end
end