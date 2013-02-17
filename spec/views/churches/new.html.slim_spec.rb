require 'spec_helper'

describe "churches/new" do
  before(:each) do
    assign(:church, stub_model(Church,
      :image => "MyString",
      :name => "MyString",
      :services_description => "MyString",
      :address => "MyString",
      :map_address => "MyString"
    ).as_new_record)
  end

  it "renders new church form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => churches_path, :method => "post" do
      assert_select "input#church_image", :name => "church[image]"
      assert_select "input#church_name", :name => "church[name]"
      assert_select "input#church_services_description", :name => "church[services_description]"
      assert_select "input#church_address", :name => "church[address]"
      assert_select "input#church_map_address", :name => "church[map_address]"
    end
  end
end
