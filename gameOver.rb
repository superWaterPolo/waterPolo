
def gameOver(px,py,gx,gy)
    if (px-gx).abs<32&&(py-gy).abs<32
        puts "Game Over!"
        return true
    end
end