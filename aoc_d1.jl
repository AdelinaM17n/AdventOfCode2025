input = read("inputs/d1.txt", String)

function calculate(part2)
    zero_count = 0
    dial_position = 50

    for line in eachsplit(strip(input), "\n")
        dialTurnDir = line[1]
        turnNum = parse(Int, SubString(line, 2))
        startingPos = copy(dial_position)

        if(dialTurnDir == 'R')
            wouldBeCount = dial_position + turnNum
            dial_position = wouldBeCount % 100
            dialZero = (dial_position == 0) 

            if(part2)
                fullRotations = div(turnNum, 100, RoundDown)
                minorRotation = (turnNum % 100)
                distanceToZero = 100 - startingPos

                if(fullRotations > 0)
                    zero_count += fullRotations
                end
                if(minorRotation >= distanceToZero)
                    zero_count += 1
                end 
            else 
                zero_count += 1*dialZero
            end

            #print("R$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
        else
            wouldBeCount = dial_position - turnNum
            dial_position = wouldBeCount % 100
            if(dial_position < 0)
                dial_position += 100    
            end
            dialZero = (dial_position == 0) 

            if(part2)
                fullRotations = div(turnNum, 100, RoundDown)
                minorRotation = (turnNum % 100)
                distanceToZero = startingPos

                if(fullRotations > 0)
                    zero_count += fullRotations
                end
                if(minorRotation >= distanceToZero && distanceToZero != 0)
                    zero_count += 1
                end 
            else 
                zero_count += 1*dialZero
            end

            #print("L$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
        end
    end
    return zero_count
end

println("Part 1 : ", calculate(false))
println("Part 2 : ", calculate(true))
