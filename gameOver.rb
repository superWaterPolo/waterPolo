
def gameOver(px,py,gx,gy)
    if (px-gx).abs<30&&(py-gy).abs<30
        puts "Game Over!"
        return true
    end
end