require "spec_helper"

describe "admin sign in" do
  it "allows users to sign in after they have registered" do
    admin = Admin.create(:email     => "fred@dagg.com",
                       :password    => "getinbehind")

    visit new_admin_session_path

    page.should have_content("E-mail")

    #capybara debugging
    save_and_open_page
    #print page.html

    fill_in "admin_email",    :with => "elvis@example.com"
    fill_in "admin_password",  :with => "ilovepies"

    click_button "Log in"

  end
end
