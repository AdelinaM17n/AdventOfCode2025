input = read("inputs/d3.txt", String)

joltageList = Int[]

for line in eachsplit(strip(input), "\n")
    firstDigitIndex = 1
    firstDigit = 0
    secondDigit = 0
    digitCount = length(strip(line))
    numList = Int[]

    for i in 1:digitCount
        num = parse(Int,line[i])
        push!(numList, num)
        if(num > firstDigit && i != digitCount)
            firstDigit = num
            firstDigitIndex = i
        end 
    end

    #println("$numList")

    for j in (firstDigitIndex+1):length(numList)
        digit = numList[j]
        
        if(digit > secondDigit)
            secondDigit = digit
        end
    end

    push!(joltageList, ((firstDigit*10) + secondDigit))
end 

println(reduce(+,joltageList))