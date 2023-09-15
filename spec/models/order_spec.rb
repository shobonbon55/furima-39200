require 'rails_helper'

RSpec.describe Order, type: :model do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
  end
end

