# See the link below for FactoryGirl documentation
# https://github.com/thoughtbot/factory_girl/wiki
FactoryGirl.define do
  factory :user, :class => Admin do |f|
    f.email { "bob#{rand(100000)}@boblaw.com" }
    f.password "password"
    f.password_confirmation "password"
  end
end
