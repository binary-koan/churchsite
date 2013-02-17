require 'spec_helper'

describe "community_pages/index" do
  before(:each) do
    assign(:community_pages, [
      stub_model(CommunityPage,
        :title => "Title",
        :image => "Image",
        :content => "Content",
        :identifier => "Identifier"
      ),
      stub_model(CommunityPage,
        :title => "Title",
        :image => "Image",
        :content => "Content",
        :identifier => "Identifier"
      )
    ])
  end

  it "renders a list of community_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  end
end
