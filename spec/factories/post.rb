FactoryGirl.define do
  factory :post do
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/chihuahua-or-muffin.jpg', 'image/jpg')
  end
end
