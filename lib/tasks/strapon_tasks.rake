# desc "Explaining what the task does"
# task :strapon do
#   # Task goes here
# end

desc "Setup an admin account"
task :setup => :environment do

  email = "admin@admin.com"
  if Rails.env.development?
    password = "password"
  else
    password = Digest::MD5.hexdigest(Time.now.to_s)[0..5]
  end

  Admin.create!(:email                 => email,
                :password              => password,
                :password_confirmation => password,
                :is_admin             => true)
  puts "#{'*'*70}"
  puts "Administrator created with these credentials:"
  puts "e-mail:   #{email}"
  puts "password: #{password}"
end
