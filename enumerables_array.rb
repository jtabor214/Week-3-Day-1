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
    


end


a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

   