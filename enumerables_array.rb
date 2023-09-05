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

end


p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


   