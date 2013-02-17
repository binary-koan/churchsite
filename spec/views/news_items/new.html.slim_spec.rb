require 'spec_helper'

describe "news_items/new" do
  before(:each) do
    assign(:news_item, stub_model(NewsItem,
      :title => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path, :method => "post" do
      assert_select "input#news_item_title", :name => "news_item[title]"
      assert_select "input#news_item_content", :name => "news_item[content]"
    end
  end
end
