require 'spec_helper'

describe "UserPages" do
  describe "Signup page" do
    it "should have content 'Money Management'" do
      visit signup_path
      page.should have_selector('title',
                                :text => "Money Management | Sign up")
    end
  end
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
end