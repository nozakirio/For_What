FactoryBot.define do
  factory :admin_book do
    want_read { "false" }
    have_read { "false" }
  end
end
