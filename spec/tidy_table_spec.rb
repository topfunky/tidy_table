require File.dirname(__FILE__) + '/spec_helper'

class RecordStruct < Struct.new(:title, :description); end

describe TidyTable do
    
  before do
    @records = [RecordStruct.new("Cheese", "A sample of fine cheeses")]
  end
    
  it "should initialize with defaults" do
    t = TidyTable.new(@records)
    t.to_html([:title, :description]) {|row| [row.title, row.description]}.should match(/Cheese/)
  end

  it "should run without block" do
    t = TidyTable.new(@records)
    t.to_html([:title, :description]).should match(/Cheese/)    
  end

  it "should merge options" do
    t = TidyTable.new(@records, :table_class => "cheese_table_class")
    t.to_html([:title, :description]).should match(/cheese_table_class/)    
  end

  it "should tag with last_column CSS class" do
    t = TidyTable.new(@records)
    t.to_html([:title, :description]).should match(/last_column/)    
  end

  it "should tag with custom last_column CSS class" do
    t = TidyTable.new(@records, :last_column_class => "the_end_my_friend")
    content = t.to_html([:title, :description])
    content.should_not match(/last_column/)
    content.should match(/the_end_my_friend/)
  end

  it "should set row title" do
    t = TidyTable.new(@records) 
    t.to_html([:title, :description]) do |record|
      {:id => "cheese_1", :data => [record.title, record.description]}
    end.should match(/tr class="even" id="cheese_1"/)
  end
  
  it "should set row class" do
    t = TidyTable.new(@records)
    t.to_html([:title, :description]) do |record|
      {:class => "cheese_class", :data => [record.title, record.description]}
    end.should match(/tr class="even cheese_class"/)
  end
  
  it "should raise if wrong argument passed from block" do
    t = TidyTable.new(@records)
    lambda {
      t.to_html([:title, :description]) do |record|
        Date.new
      end
    }.should raise_error(ArgumentError)
  end

  it "should show title" do
    t = TidyTable.new(@records, :title => "Report of Doom")
    output = t.to_html([:title, :description])
    output.should match(/Report of Doom/)
  end

end
