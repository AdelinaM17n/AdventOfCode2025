input = read("inputs/d4.txt", String)

uneditedRollMap = map(line -> map(char -> char == '@', collect(strip(line))), eachsplit(strip(input), "\n"))

function getRemovables(rollMap, part2)
    count = 0
    removed = 0
    while true
        for y in eachindex(rollMap)
            for x in eachindex(rollMap[y])
                if (!rollMap[y][x])
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
                if (canRemove && part2)
                    rollMap[y][x] = false
                    removed += 1
                end
                count += canRemove
            end
        end
        if removed == 0
            break
        end
        removed = 0
    end
    return count
end

println("Part 1 : ", getRemovables(copy(uneditedRollMap),false))
println("Part 2 : ", getRemovables(copy(uneditedRollMap),true))


