require 'spec_helper'

describe "community_pages/edit" do
  before(:each) do
    @community_page = assign(:community_page, stub_model(CommunityPage,
      :title => "MyString",
      :image => "MyString",
      :content => "MyString",
      :identifier => "MyString"
    ))
  end

  it "renders the edit community_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => community_pages_path(@community_page), :method => "post" do
      assert_select "input#community_page_title", :name => "community_page[title]"
      assert_select "input#community_page_image", :name => "community_page[image]"
      assert_select "input#community_page_content", :name => "community_page[content]"
      assert_select "input#community_page_identifier", :name => "community_page[identifier]"
    end
  end
end
