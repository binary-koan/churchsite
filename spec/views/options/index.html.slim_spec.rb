require 'spec_helper'

describe "options/index" do
  before(:each) do
    assign(:options, [
      stub_model(Option,
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
      ),
      stub_model(Option,
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
      )
    ])
  end

  it "renders a list of options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Tagline".to_s, :count => 2
    assert_select "tr>td", :text => "About Page".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Title".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Email".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Address".to_s, :count => 2
    assert_select "tr>td", :text => "Leader Image".to_s, :count => 2
  end
end
