sample_categories = [
  { name: 'Traveling' },
  { name: 'Clothing' },
  { name: 'Taxi' },
  { name: 'Cafes' },
  { name: 'Shops' },
  { name: 'Other' }
].freeze

Category.create!(sample_categories)


(1..5).each do |i|
  user = User.create!(
          login: Faker::Name.first_name,
          password: '123456'
  )
  (1..5).each do |c|
    user.costs.create!(
      description: 'Some description' ,
      amount: Faker::Commerce.price,
      category_id: Category.find(c).id
    )
  end
end

test_user = User.create!(
              login: 'test_user',
              password: '123456'
)

(1..5).each do |c|
  test_user.costs.create!(
    description: 'Some description' ,
    amount: Faker::Commerce.price,
    category_id: Category.find(c).id
  )
end
