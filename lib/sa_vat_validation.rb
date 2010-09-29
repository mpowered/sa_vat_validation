class Fixnum
  def last_digit
    self.to_s.last.to_i
  end

  def first_digit
    self.to_s.first.to_i 
  end
end

class SaVatValidation
  def self.valid?(vat_number)
    digits = vat_number.to_s.split(//).map(&:to_i)
    check_digit = digits.pop

    sum = 0
    digits.each_with_index do |digit, i|
      if i.even?
        result = digit * 2
        if result >= 10
          result = result.first_digit + result.last_digit
        end
        sum += result
      else
        sum += digit.to_i
      end
    end
    if sum.last_digit.zero?
      calculated_digit = sum.last_digit
    else
      calculated_digit = 10 - sum.last_digit
    end

    return check_digit == calculated_digit
  end
end

class Object
  def valid_sa_vat_number?
    SaVatValidation::valid?(self)
  end
end