require 'spec_helper'

describe "sermons/index" do
  before(:each) do
    assign(:sermons, [
      stub_model(Sermon,
        :description => "Description"
      ),
      stub_model(Sermon,
        :description => "Description"
      )
    ])
  end

  it "renders a list of sermons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
