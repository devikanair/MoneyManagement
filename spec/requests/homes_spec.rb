require 'spec_helper'

describe "Homes" do
  describe "About page" do
    it "should have content 'Money Management'" do
      visit about_path
      page.should have_content('Welcome to Money Management')
      page.should have_selector('title',
                                :text => "Money Management | About")
    end
  end

  describe "Help page" do
    it "should have content 'Money Management'" do
      visit help_path
        page.should have_content('Help: Using Money Management')
    end
  end
  describe "Help page" do
     it "should have title 'Money Management'" do
      visit help_path
      page.should have_selector('title',
                                :text => "Money Management | Help")
    end
  end

  describe "Help page" do
    it "should have content 'Money Management'" do
      visit root_path
      page.should have_content('Welcome to Money Management')
      page.should have_content('Sign up')
    end
  end
  describe "Help page" do
    it "should have title 'Money Management'" do
      visit root_path
      page.should have_selector('title',
                                :text => "Money Management")
    end
  end
end

