class Array
  def common_elements(array)
    self_hash = Hash.new(0)
    self.each { |v| self_hash[v] += 1 }

    param_hash = Hash.new(0)
    array.each { |v| param_hash[v] += 1 }

    lesser_values = []

    self_hash.each_key do |key|
      if (param_hash[key] <=> self_hash[key]) == -1
        lesser_values << param_hash[key]
      elsif (param_hash[key] <=> self_hash[key]) == 0
        lesser_values << param_hash[key]
      elsif (param_hash[key] <=> self_hash[key]) == 1
        lesser_values << self_hash[key]
      end
    end
    lesser_values.reduce(:+)
  end
end
