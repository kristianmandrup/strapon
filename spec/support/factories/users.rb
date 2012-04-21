FactoryGirl.define do
  factory :user, :class => User do |f|
    f.email { "bob#{rand(100000)}@boblaw.com" }
    f.password "password"
    f.password_confirmation "password"
  end
end
