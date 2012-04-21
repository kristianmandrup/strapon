require "spec_helper"

describe "admin sign out" do

  let(:admin) { FactoryGirl.create(:admin) }

  before do
    sign_in(admin)
  end

  it "allows admins to sign out" do
    sign_out
  end
end

