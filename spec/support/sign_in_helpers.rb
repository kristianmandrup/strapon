module SignInHelpers
  def sign_in(user)
    visit '/admin/users/sign_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    page.should have_content("Du er nu logget ind.")
  end

  def sign_out
    click_link 'Sign out'
    page.should have_content("Du er nu logget ud.")
  end
end

RSpec.configure do |c|
  c.include SignInHelpers, :type => :request
end
