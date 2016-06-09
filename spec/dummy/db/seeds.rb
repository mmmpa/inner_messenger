if Rails.env.development?
  Account.destroy_all
  10.times do |n|
    Account.create!(name: (:a..:z).to_a[n])
  end
end