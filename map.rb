def generate_maze(maze,x, y)
    maze[y][x] = " "

    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    directions.shuffle!

    directions.each do |dx, dy|
        nx = x + (dx * 2)
        ny = y + (dy * 2)

        if nx.between?(1, maze[0].size - 2) && ny.between?(1, maze.size - 2) && maze[ny][nx] == "#"
            maze[y + dy][x + dx] = " "
            generate_maze(maze, nx, ny)
        end
    end
    return maze
end