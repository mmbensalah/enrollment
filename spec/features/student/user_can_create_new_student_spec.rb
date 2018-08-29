require 'rails_helper'

describe 'user can' do
  it 'create new student' do
    s_name = 'Eve'
    visit new_student_path

    fill_in 'student[name]', with: s_name
    click_on 'Create Student'

    expect(current_path).to eq students_path(Student.last)
    expect(page).to have_content(s_name)
  end
  it 'delete student' do
    s1 = Student.create(name: 'Ian')
    visit students_path

    click_on 'Delete'
    expect(current_path).to eq students_path
    expect(page).to_not have_content(s1.name)
  end
end
