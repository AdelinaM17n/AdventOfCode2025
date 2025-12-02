input = read("inputs/d1.txt", String)

function calculate(part2)
    zeroCount = 0
    dialPosition = 50

    for line in eachsplit(strip(input), "\n")
        dialTurnDir = line[1]
        turnNum = parse(Int, SubString(line, 2))
        startingPos = copy(dialPosition)

        if (dialTurnDir == 'R')
            wouldBeCount = dialPosition + turnNum
            dialPosition = wouldBeCount % 100

            if (part2)
                fullRotations = div(turnNum, 100, RoundDown)
                minorRotation = (turnNum % 100)
                distanceToZero = 100 - startingPos

                if (fullRotations > 0)
                    zeroCount += fullRotations
                end

                if (minorRotation >= distanceToZero)
                    zeroCount += 1
                end
            else
                zeroCount += 1 * (dialPosition == 0)
            end

            #print("R$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
        else
            wouldBeCount = dialPosition - turnNum
            dialPosition = wouldBeCount % 100
            if (dialPosition < 0)
                dialPosition += 100
            end

            if (part2)
                fullRotations = div(turnNum, 100, RoundDown)
                minorRotation = (turnNum % 100)
                distanceToZero = startingPos

                if (fullRotations > 0)
                    zeroCount += fullRotations
                end

                if (minorRotation >= distanceToZero && distanceToZero != 0)
                    zeroCount += 1
                end
            else
                zeroCount += 1 * (dialPosition == 0)
            end

            #print("L$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
        end
    end
    return zeroCount
end

println("Part 1 : ", calculate(false))
println("Part 2 : ", calculate(true))
