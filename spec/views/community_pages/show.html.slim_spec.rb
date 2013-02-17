require 'spec_helper'

describe "community_pages/show" do
  before(:each) do
    @community_page = assign(:community_page, stub_model(CommunityPage,
      :title => "Title",
      :image => "Image",
      :content => "Content",
      :identifier => "Identifier"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Image/)
    rendered.should match(/Content/)
    rendered.should match(/Identifier/)
  end
end
