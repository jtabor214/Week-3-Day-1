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

end


a = [1, 2, 3]
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

   