input = read("inputs/d5.txt", String)

ranges = UnitRange[]
itemIds = Int[]

function extractStuff(stringPart)
    foreach(
        function (line)
            if (contains(strip(line), "-"))
                rangeBounds = collect(split(strip(line), "-"))
                if (length(rangeBounds) > 1)
                    push!(
                        ranges,
                        UnitRange(
                            parse(Int, strip(rangeBounds[1])),
                            parse(Int, strip(rangeBounds[2]))
                        )
                    )
                end
            else
                push!(itemIds, parse(Int, strip(line)))
            end
        end,
        collect(split(stringPart, "\r\n", keepempty=false))
    )
end

foreach(stringPart -> extractStuff(strip(stringPart)), collect(split(strip(input), " ")))
println(length(findall(id -> any(range -> id in range, ranges), itemIds)))