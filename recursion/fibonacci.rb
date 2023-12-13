def fibs (number)
    num_arr = [0,1]
    number.times do 
        first_num = 0
        next_num = 1
        first_num = next_num
        next_num = first_num + next_num
    end
end

fibs(8)