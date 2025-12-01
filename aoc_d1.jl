input = read("inputs/d1.txt", String)

dial_position = 50
zero_count = 0

for line in eachsplit(strip(input), "\n")
    dialTurnDir = line[1]
    turnNum = parse(Int, SubString(line, 2))

    if(dialTurnDir == 'R')
        wouldBeCount = dial_position + turnNum
        global dial_position = wouldBeCount % 100
        zero_count = zero_count + 1*(dial_position == 0)
        print("R$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
    else
        wouldBeCount = dial_position - turnNum
        global dial_position = wouldBeCount > 99 ? 100 - (wouldBeCount % 100) : wouldBeCount % 100
        global zero_count = zero_count + 1*(dial_position == 0)
        print("L$turnNum,$wouldBeCount, $dial_position, $zero_count \n")
    end

end

print("$zero_count \n")
