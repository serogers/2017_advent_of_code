=begin
  The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list.
  The list is circular, so the digit after the last digit is the first digit in the list.

  For example:

  1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
  1111 produces 4 because each digit (all 1) matches the next.
  1234 produces 0 because no digit matches the next.
  91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
  What is the solution to your captcha?
=end

def sum_matching_digits(raw_digits)
  digits = raw_digits.to_s.chars.map {|char| char.to_i}

  return 0 unless digits && digits.length > 0
  return digits[0] if digits.length == 1

  sum = 0

  digits.each_with_index do |digit, index|
    if index + 1 == digits.length
      next_digit = digits.first
    else
      next_digit = digits[index + 1]
    end

    if digit == next_digit
      sum += digit
    end
  end

  sum
end

puts sum_matching_digits(1122)
puts sum_matching_digits(1111)
puts sum_matching_digits(1234)
puts sum_matching_digits(91212129)