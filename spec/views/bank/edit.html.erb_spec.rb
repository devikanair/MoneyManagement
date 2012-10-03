require 'spec_helper'

describe "Help page" do
  it "should have title 'Money Management'" do
    visit root_path
    page.should have_selector('title',
                              :text => "Money Management")
  end
end

