require 'spec_helper'

describe "options/new" do
  before(:each) do
    assign(:option, stub_model(Option,
      :use_news => false,
      :use_community => false,
      :use_about => false,
      :title => "MyString",
      :tagline => "MyString",
      :about_page => "MyString",
      :leader_title => "MyString",
      :leader_name => "MyString",
      :leader_contactmethods => "",
      :leader_phone => "MyString",
      :leader_email => "MyString",
      :leader_address => "MyString",
      :leader_image => "MyString"
    ).as_new_record)
  end

  it "renders new option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => options_path, :method => "post" do
      assert_select "input#option_use_news", :name => "option[use_news]"
      assert_select "input#option_use_community", :name => "option[use_community]"
      assert_select "input#option_use_about", :name => "option[use_about]"
      assert_select "input#option_title", :name => "option[title]"
      assert_select "input#option_tagline", :name => "option[tagline]"
      assert_select "input#option_about_page", :name => "option[about_page]"
      assert_select "input#option_leader_title", :name => "option[leader_title]"
      assert_select "input#option_leader_name", :name => "option[leader_name]"
      assert_select "input#option_leader_contactmethods", :name => "option[leader_contactmethods]"
      assert_select "input#option_leader_phone", :name => "option[leader_phone]"
      assert_select "input#option_leader_email", :name => "option[leader_email]"
      assert_select "input#option_leader_address", :name => "option[leader_address]"
      assert_select "input#option_leader_image", :name => "option[leader_image]"
    end
  end
end
