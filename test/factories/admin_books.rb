FactoryBot.define do
  factory :admin_book do
    user_id { "1" }
    book_id { "1" }
    want_read { "false" }
    have_read { "false" }
    post_id { "1" }
  end
end
