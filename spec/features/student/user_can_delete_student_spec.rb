require 'rails_helper'

describe 'user can' do
  it 'delete student' do
    s1 = Student.create(name: 'Ian')
    visit students_path

    click_on 'Delete'
    expect(current_path).to eq students_path
    expect(page).to_not have_content(s1.name)
  end
end
