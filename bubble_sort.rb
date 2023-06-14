# Build a method #bubble_sort that takes an array and returns a sorted array. 
# It must use the bubble sort methodology

def bubble_sort(array)
    array.each_with_index{ |a, index|
        if array[index+1] != nil
            first = array.fetch(index)
            second = array.fetch(index + 1)

            if second < first
                array[index], array[index + 1] = array[index + 1], array[index]
                bubble_sort(array) 
            end  
        end
    }
end