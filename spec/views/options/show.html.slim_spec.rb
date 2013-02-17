require 'spec_helper'

describe "options/show" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :use_news => false,
      :use_community => false,
      :use_about => false,
      :title => "Title",
      :tagline => "Tagline",
      :about_page => "About Page",
      :leader_title => "Leader Title",
      :leader_name => "Leader Name",
      :leader_contactmethods => "",
      :leader_phone => "Leader Phone",
      :leader_email => "Leader Email",
      :leader_address => "Leader Address",
      :leader_image => "Leader Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Title/)
    rendered.should match(/Tagline/)
    rendered.should match(/About Page/)
    rendered.should match(/Leader Title/)
    rendered.should match(/Leader Name/)
    rendered.should match(//)
    rendered.should match(/Leader Phone/)
    rendered.should match(/Leader Email/)
    rendered.should match(/Leader Address/)
    rendered.should match(/Leader Image/)
  end
end
