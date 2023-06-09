def map(height, width)
    maze = Array.new(height){Array.new(width, 1)}
    start_x = rand(1..(width-2))
    start_y = rand(1..(height-2))
    maze[start_y][start_x] = " "

    stack = [[start_x, start_y]]
    while !stack.empty?
        x, y = stack.last

        neighbors = []
        if x >= 3 and maze[y][x-2] == 1
            neighbors << [x-2, y]
        end
        if x <= width-4 and maze[y][x+2] == 1
            neighbors << [x+2, y]
        end
        if y >= 3 and maze[y-2][x] == 1
            neighbors << [x, y-2]
        end
        if y <= height-4 and maze[y+2][x] == 1
            neighbors << [x, y+2]
        end

        if neighbors.empty?
            stack.pop
        else
            nx, ny = neighbors.sample
            maze[ny][nx] = " "
            maze[ny + (y-ny)/2][nx + (x-nx)/2] = " "
            stack << [nx, ny]
        end
    end
    return maze
end