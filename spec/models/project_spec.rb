require 'rails_helper'

RSpec.describe Project, type: :model do

  it 'validates its name presence' do
    project = Project.new(description: 'description').save
    expect(project).to eq(false)
  end

  it 'validates its names maximum length' do
    project = Project.new(name: 'a' * 51).save
    expect(project).to eq(false)
  end

  it 'validates its description presence' do
    project = Project.new(name: 'name').save
    expect(project).to eq(false)
  end

  it 'validates its description maximum length' do
    project = Project.new(description: 'a' * 151).save
    expect(project).to eq(false)
  end

  it 'should save successfully' do
    project = Project.new(name: 'name', description: 'description').save
    expect(project).to eq(true)
  end

end
