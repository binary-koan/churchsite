require 'spec_helper'

describe "sermons/show" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
