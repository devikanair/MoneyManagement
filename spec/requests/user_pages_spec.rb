require 'spec_helper'

describe "UserPages" do
  describe "Signup page" do
    it "should have content 'Money Management'" do
      visit signup_path
      page.should have_selector('title',
                                :text => "Money Management | Sign up")
    end
  end
end