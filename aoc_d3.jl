input = read("inputs/d3.txt", String)

function partOne()
    joltageList = Int[]

    for line in eachsplit(strip(input), "\n")
        firstDigitIndex = 1
        firstDigit = 0
        secondDigit = 0
        digitCount = length(strip(line))
        numList = Int[]

        for i in 1:digitCount
            num = parse(Int, line[i])
            push!(numList, num)
            if (num > firstDigit && i != digitCount)
                firstDigit = num
                firstDigitIndex = i
            end
        end

        for j in (firstDigitIndex+1):length(numList)
            digit = numList[j]
            if (digit > secondDigit)
                secondDigit = digit
            end
        end

        push!(joltageList, ((firstDigit * 10) + secondDigit))
    end

    return reduce(+, joltageList)
end

function partTwo()
    joltageList = Int[]
    for line in eachsplit(strip(input), "\n")
        numList = map(char -> parse(Int, char), collect(strip(line)))
        nlLength = length(numList)
        digitList = Int[]
        joltage = 0

        skips = nlLength - 12
        skipsTaken = 0

        for i in 1:12
            startIndex = i + skipsTaken
            lastIndex = skips + i
            maxDigit = 0
            hitIndex = 0

            for j in startIndex:lastIndex
                digit = numList[j]
                if (maxDigit < digit)
                    maxDigit = digit
                    hitIndex = j
                end
            end

            skipsTaken += hitIndex - startIndex
            push!(digitList, maxDigit)
        end

        for n in 1:12
            joltage += digitList[n] * 10^(12 - n)
        end

        push!(joltageList, joltage)
    end
    return reduce(+, joltageList)
end

println("Part 1 : ", partOne())
println("Part 2 : ", partTwo())