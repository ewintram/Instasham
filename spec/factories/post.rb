FactoryGirl.define do
  factory :post do
    caption "Chihuahua... or blueberry muffin?"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/chihuahua-or-muffin.jpg', 'image/jpg')
  end
end
