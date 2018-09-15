module IngredientsHelper

  def round(size)
    size.is_a?(String) ? round_string(size) : round_number(size)
  end

  def round_string(size)
    match = size.match(/[0-9.]+/)
    return size unless match
    number = match[0]
    round_number = number_with_precision number, strip_insignificant_zeros: true
    size.sub(number, round_number.to_s)
  end

  def round_number(size)
    number_with_precision size, precision: 1, strip_insignificant_zeros: true
  end
end
