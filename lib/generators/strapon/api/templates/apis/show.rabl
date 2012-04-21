object @profile

attributes :email,
           :first_name,
           :last_name,

code :permission_given do |profile|
  profile.permission_given?
end
