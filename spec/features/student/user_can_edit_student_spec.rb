require 'rails_helper'

describe 'user can' do
  it 'edit student' do
    s1 = Student.create(name: 'Ian')
    new_name = 'Aaron'
    visit student_path(s1)

    click_on 'Edit'
    expect(current_path).to eq edit_student_path(s1)

    fill_in 'student[name]', with: new_name
    click_on 'Update Student'

    expect(current_path).to eq students_path(Student.last)
    expect(page).to have_content(new_name)
  end
end
