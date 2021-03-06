require 'spec_helper'

describe "lecturers/new" do
  before(:each) do
    assign(:lecturer, stub_model(Lecturer,
      :name => "MyString",
      :email => "MyString",
      :oid => 1,
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new lecturer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lecturers_path, "post" do
      assert_select "input#lecturer_name[name=?]", "lecturer[name]"
      assert_select "input#lecturer_email[name=?]", "lecturer[email]"
      assert_select "input#lecturer_oid[name=?]", "lecturer[oid]"
      assert_select "input#lecturer_picture[name=?]", "lecturer[picture]"
    end
  end
end
