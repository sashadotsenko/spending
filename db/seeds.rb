require 'faker'

FactoryBot.create(:category, :traveling)
FactoryBot.create(:category, :clothing)
FactoryBot.create(:category, :taxi)
FactoryBot.create(:category, :cafes)
FactoryBot.create(:category, :shops)
FactoryBot.create(:category, :other)


(1..5).each do |i|
  user = FactoryBot.create(:user, :fake_user)

  (1..5).each do |c|
    FactoryBot.create(:cost, :fake_cost, user: user, category: Category.find(c))
  end
end

test_user = FactoryBot.create(:user, :test_user)

(1..5).each do |c|
  FactoryBot.create(:cost, :fake_cost, user: test_user, category: Category.find(c))
end
