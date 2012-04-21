module SignInHelpers

  #TODO need a if CMS pages created helper
  def sign_in(admin)
    visit new_admin_session_path
    fill_in 'admin_email',          :with => admin.email
    fill_in 'admin_password',       :with => 'password'
    click_button 'Log in'
    page.should have_content("Sites")
    #TODO this does not work if no pages exist in the site, need to create some dummy pages in 
    #another resquest spec helper
    #page.should have_content("Signed in successfully.")
  end

  def sign_out
    click_link 'Log out'
    page.should have_content("E-mail")
  end
end

RSpec.configure do |c|
  c.include SignInHelpers, :type => :request
end
