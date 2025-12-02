input = read("inputs/d2.txt", String)

function isInvalid(str)
    strLength = length(str)

    if (strLength % 2 == 0)
        halfLength = div(strLength, 2)
        firstHalf = strip(first(str, halfLength))
        secondHalf = strip(last(str, halfLength))
        if (firstHalf == secondHalf)
            return true
        end
    end

    return false
end

function isInvalid2(str)
    strLength = length(str)

    for i in range(start=1, stop=div(strLength, 2))
        if (strLength % i == 0)
            repCount = div(strLength, i)
            if (repeat(SubString(str, 1, i), repCount) == str)
                return true
            end
        end
    end

    return false
end

function getResult(part2)
    idList = Array{Int}(undef, 0)

    for rangeVal in eachsplit(strip(input), ",")
        splitRange = split(strip(rangeVal), "-")
        rangeStart = parse(Int, strip(splitRange[1]))
        rangeEnd = parse(Int, strip(splitRange[2]))

        for i in rangeStart:rangeEnd
            stringRep = string(i)
            if (part2 ? isInvalid2(stringRep) : isInvalid(stringRep))
                append!(idList, i)
            end
        end
    end

    return reduce(+, idList)
end


println("Part 1 :", getResult(false))
print("Part 2 :", getResult(true))