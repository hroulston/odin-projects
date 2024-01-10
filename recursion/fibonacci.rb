# fibs using iteration
# def fibs (number)
#     num_arr = [0,1]
#     num1 = num_arr[0]
#     num2 = num_arr[1]
#     number.times do
#         new_num = num1 + num2
#         num_arr.push(new_num)
#         num1 = num2
#         num2 = new_num
#     end
#     puts num_arr
# end

# fibs(12)

# fibs using recursion

def fibs_rec (number)
   if number > 2
    return (fibs_rec(number-1) + fibs_rec(number-2))
   else
    return 1
   end
end

fibs_rec(8)