require 'spec_helper'

describe "Homes" do
  describe "About page" do
    #it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get homes_path
      #response.status.should be(200)
    #end
    it "should have content 'Money Management'" do
      visit '/home/about'
      page.should have_content('Welcome to Money Management')
      page.should have_selector('title',
                                :text => "Money Management | About")
    end
  end

  describe "Help page" do
    it "should have content 'Money Management'" do
      visit '/home/help'
        page.should have_content('Help: Using Money Management')
    end
  end
  describe "Help page" do
     it "should have title 'Money Management'" do
      visit '/home/help'
      page.should have_selector('title',
                                :text => "Money Management | Help")
    end
  end
end

