require 'spec_helper'

describe "admins" do

  pending "add admins functionality"

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  context "cms users" do
    before do
      sign_in(user)
    end

    it "attempts to create new user" do
      pending "not implemeted"
      visit admin_admins_path
      flash_alert!("You must be an administrator to access this area!")
    end

  end


  #context "admin users" do
    #before do
      #sign_in(admin)
    #end

    #it "creating a new one" do
      #visit admin_admins_path
      #click_link "New User"
      #fill_in "Login",                    :with => "elvis"
      #fill_in "Email",                    :with => "mam@crd.dk"
      #fill_in "Password",                 :with => "password"
      #fill_in "Password confirmation",    :with => "password"
      #click_button "Opret User"

      #flash_notice!("User has been created!")
      ##within "#profile" do
      ##  page.should have_content("mam@crd.dk")
      ##end
    #end
  #end
end

