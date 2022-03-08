require "sa_vat_validation/version"


module SaVatValidation
  def self.valid?(vat_number)
    digits = vat_number.to_s.split(//).map(&:to_i)

    # As per SARS
    # A VAT Number is a unique number, which comprises of 10 digits and starts with the number 4
    return false unless digits.first.to_i == 4
    return false unless digits.size == 10 && vat_number.to_s.is_numeric?

    check_digit = digits.pop

    sum = 0
    digits.each_with_index do |digit, i|
      if i.even?
        result = digit * 2
        if result >= 10
          result = first_digit(result) + last_digit(result)
        end
        sum += result
      else
        sum += digit.to_i
      end
    end
    if (last_digit(sum)).zero?
      calculated_digit = last_digit(sum)
    else
      calculated_digit = 10 - last_digit(sum)
    end

    return check_digit == calculated_digit

  def self.last_digit(a)
    a.to_s.chars.last.to_i
  end

  def self.first_digit(a)
    a.to_s.chars.first.to_i
  end
class String
  def valid_sa_vat_number?
    SaVatValidation::valid?(self)
  end

  def is_numeric?
    Float self rescue false
  end
end

class Numeric
  def valid_sa_vat_number?
    SaVatValidation::valid?(self)
  end
end
