require 'spec_helper'

describe "sermons/new" do
  before(:each) do
    assign(:sermon, stub_model(Sermon,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sermons_path, :method => "post" do
      assert_select "input#sermon_description", :name => "sermon[description]"
    end
  end
end
