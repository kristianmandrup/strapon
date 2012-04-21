require 'spec_helper'

describe "campaign landing page" do

  #let(:profile) { FactoryGirl.create(:profile) }

  context "enter typical information in a campaign form" do
    before do
      #do some setup stuff
    end

    it "attempts to register" do
      visit root_path
      fill_in "Email"                 , :with => "elvis@crd.dk"
      fill_in "Email confirmation"    , :with => "elvis@crd.dk"
      fill_in "Code"                  , :with => "123456789"
      fill_in "Code confirmation"     , :with => "123456789"
      click_button "Register"
      #flash_notice!("Choice")
    end
  end

  #context "admin" do
    #before do
      #sign_in(admin)
      #FactoryGirl.create(:page_layout)
    #end

    #it "creates a new page" do
      ##puts page_layout.inspect
      #visit admin_pages_path
      #click_link "New Page"
      #fill_in "Title",          :with => "layout title"
      #fill_in "Body",           :with => "layout body"
      #fill_in "Url",            :with => "/index.html"
      #select('application',     :from => 'Page layout')
      #click_button "Opret Page"
      #flash_notice!("Page has been created!")
    #end
  #end

end
