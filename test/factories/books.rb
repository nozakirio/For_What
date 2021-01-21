FactoryBot.define do
  factory :book do
    title { "人間失格" }
    author { "太宰治" }
    isbn { "9784041099124" }
    publication_date { "2007年06月23日頃" }
    book_image_id { "https://ccc" }
    book_image_large_id { "https:bbb" }
    item_url { "https://aaa/" }
  end
end
