require 'spec_helper'

describe ::CourseDirectory do
  subject { described_class.new(db) }

  let(:course) {
    ::Course.new( :guid => 'CRS-1234',
      :name => 'Trafalga Lehi Outside',
      :created_at => Time.current,
      :updated_at => Time.current )
  }

  it "adds a new course" do
    expect{
      subject.add(course)
    }.to change{
      db[:courses].count
    }.by(1)
  end

  it "can lookup a course by guid" do
    subject.add(course)
    expect(subject.lookup_by_guid(course.guid)).to eq(course)
  end
end
