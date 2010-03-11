require "spec_helper"

describe "Comment class" do
  before(:each) do
    Note.delete_all
    Comment.delete_all
    @note = Note.create!(:name => "One")
    @first_comment = Comment.new(:details => "First comment about One")
    @note.comments << @first_comment
  end

  it "should create a note with a comment" do
    @note.should have(1).comments
    @note.comments.last.should == @first_comment
    @first_comment.note.should == @note
  end

  it "should allow more than one comment in a note"  do
    second_comment = Comment.new(:details => "Second comment about One")
    @note.comments << second_comment
    @note.should have(2).comments
    @note.comments.should be_include(@first_comment)
    @note.comments.should be_include(second_comment)
  end
end