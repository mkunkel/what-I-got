Fabricator(:book) do
  title { Faker::Name.title }
  author { Faker::Name.name }
  # collection(count: 2)
end
