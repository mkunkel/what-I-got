RSpec::Matchers.define :have_error do |expected, options|
  match do |page|
    expect(page.find_field(options[:on]).parent).to have_css(".error", text: expected)
  end
end

RSpec::Matchers.define :have_collection_error do |expected, options|
  match do |page|
    expect(page.find("." + options[:on]).parent).to have_css(".error", text: expected)
  end
end
