Fabricator(:album) do
  collection
  title { Faker::Name.title }
end
