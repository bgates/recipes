class SizeConversion < ApplicationRecord
  belongs_to :ingredient

  # the json has label, equiv, eunit, qty
  # eg qty 1, label tbsp, equiv 14.2, eunit g => 14.2g:1tbsp
  # assume qty is 1 and eunit is g; probably raise otherwise
end
