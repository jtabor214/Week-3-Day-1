class Array

    def my_each(&block)
        i = 0

            while i < self.length
                block.call(self[i])
            i += 1
            end
        self
    end 

    def my_select(&block)
    array = []
        self.my_each do |ele|
            if block.call(ele)
                array << ele 
            end
        end
        array
    end
    
    def my_reject(&block)
        array = []

            self.my_each do |ele|
                if !block.call(ele)
                    array << ele
                end
            end
        array
    end

    def my_any?(&block)
        
        self.my_each do |ele|
            if block.call(ele)
                return true
            end
        end
    return false
    end

    def my_all?(&block)

        self.my_each do |ele|
            if !block.call(ele)
                return false
            end
        end
    return true
    end

    def my_flatten
    flattened = []

        self.my_each do |ele|
            if !ele.is_a?(Array)
                flattened << ele
            else    
                flattened.concat(ele.my_flatten)
            end
        end
        flattened
    end

    def my_zip(*arg)
    array = Array.new(self.length) {Array.new(arg.length + 1)}

        arg.each_with_index do |subArr, idx|
            array <<  subArr[idx]
        end

        array
    end


end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


   