input = read("inputs/d4.txt", String)

rollMap = map(line -> map(char -> char == '@', collect(strip(line))), eachsplit(strip(input), "\n"))
count = 0

for y in eachindex(rollMap)
    for x in eachindex(rollMap[y])
        if(!rollMap[y][x])
            continue
        end
        xEdgeLower = (x == 1)
        yEdgeLower = (y == 1)
        xEdgeHigher = (x == length(rollMap[y])) 
        yEdgeHigher = (y == length(rollMap))

        left = xEdgeLower || !rollMap[y][x-1]
        right = xEdgeHigher || !rollMap[y][x+1]
        up = yEdgeLower || !rollMap[y-1][x]
        down = yEdgeHigher || !rollMap[y+1][x]

        leftUp = (xEdgeLower || yEdgeLower) || !rollMap[y-1][x-1]
        leftDown = (xEdgeLower || yEdgeHigher) || !rollMap[y+1][x-1]
        rightUp = (xEdgeHigher || yEdgeLower) || !rollMap[y-1][x+1]
        rightDown = (xEdgeHigher || yEdgeHigher) || !rollMap[y+1][x+1]
        
        canRemove = 4 < (left + right + up + down + leftUp + leftDown + rightDown + rightUp)
        global count += canRemove
    end
end

println(count)
