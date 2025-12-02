input = read("inputs/d2.txt", String)
idList = Array{Int}(undef, 0)

function isInvalid(str)
    strLength = length(str)
    if(strLength % 2 == 0)
        halfLength = div(strLength,2)
        firstHalf = strip(first(str,halfLength))
        secondHalf = strip(last(str,halfLength))
        if(firstHalf == secondHalf)
            return true
        end
    end
    return false
end

for rangeVal in eachsplit(strip(input), ",")
    splitRange = split(strip(rangeVal), "-")
    rangeStart = parse(Int,strip(splitRange[1]))
    rangeEnd = parse(Int,strip(splitRange[2]))

    for i in rangeStart:rangeEnd
        stringRep = string(i)
        if(isInvalid(stringRep))
            append!(idList, i)
        end
    end
end

print(reduce(+, idList))