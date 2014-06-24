Fabricator(:collection) do
  user
  title { Faker::Name.title }
end
