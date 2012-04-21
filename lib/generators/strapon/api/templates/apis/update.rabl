object @profile

attributes :email,
           :first_name,
           :last_name,
           :address,
           :updated_at

code :permission_given do |profile|
  profile.permission_given?
end
