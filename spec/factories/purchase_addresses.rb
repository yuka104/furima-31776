FactoryBot.define do
  factory :purchase_address do
    postal_code   {'123-4567'}
    state_id      {'2'}
    city          {'横浜市緑区'}
    block_number  {'青山1−1−1'}
    phone_number  {'09012345678'}
    token         {"tok_abcdefghijk00000000000000000"} 
  end
end
