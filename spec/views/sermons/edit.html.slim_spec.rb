require 'spec_helper'

describe "sermons/edit" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :description => "MyString"
    ))
  end

  it "renders the edit sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sermons_path(@sermon), :method => "post" do
      assert_select "input#sermon_description", :name => "sermon[description]"
    end
  end
end
