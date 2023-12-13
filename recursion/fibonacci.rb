def fibs (number)
    num_arr = [0,1]
    num1 = num_arr[0]
    num2 = num_arr[1]
    number.times do
        new_num = num1 + num2
        num_arr.push(new_num)
        num1 = num2
        num2 = new_num
    end
    puts num_arr
end

fibs(12)