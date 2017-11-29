require 'rails_helper'

RSpec.describe Bug, type: :model do

  let(:project) {Project.create(name: 'p-name', description: 'p-description')}

  it "is invalid without a name" do
    bug = Bug.new(description: 'description', project_id: project.id, name: '')
    expect(bug.valid?).to be_falsey
    # puts bug.errors.inspect
    expect(bug.errors[:name]).to be_present
      # expect do
      #   bug = Bug.new(description: 'description', project_id: project.id, name: '')
      #   bug_saved = bug.save
      # end.to change(Bug, :count).by(0)
      # puts bug.inspect, bug.errors.full_messages, project.inspect, project.new_record?
      # puts bug_saved
  end

  it 'is invalid without a priority' do
    bug = Bug.new(name: 'bug1',description: 'description', project_id: project.id, priority: '')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
    # expect(bug.errors[:priority]).to be_present

  end

  it 'can have only three types of priority present low, medium, high' do
    bug = Bug.new(name: 'bug1',description: 'description', project_id: project.id, priority: 'something else')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
  end

  it 'is invalid without a description presence' do
    bug = Bug.new(name: 'bug1',description: '', project_id: project.id, priority: 'low')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
  end

  it 'will have atleast 15 character in its description' do
    bug = Bug.new(description: "a" * 14 ,name: 'bug1', project_id: project.id, priority: 'low')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
  end

  it 'is invalid without a status presence' do
    bug = Bug.new(description: "a" * 16 ,name: 'bug1', project_id: project.id, priority: 'low', status: '')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
  end

  it 'han only two types of status present open, closed' do
    bug = Bug.new(description: "a" * 16 ,name: 'bug1', project_id: project.id, priority: 'low', status: 'something')
    expect(bug.valid?).to be_falsey
    puts bug.valid?
    puts bug.inspect, bug.errors.full_messages
  end


  # it 'validates its assosiation with an existing user' do
  # end

end
