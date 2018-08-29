require 'rails_helper'

describe 'user can' do
  it 'create new address' do
    student = Student.create(name: 'Eve')
    description = 'Primary'
    street = 'Hawthorn St.'
    city = 'LA'
    state = 'CA'
    zip = 89000

    visit student_path(student)
    click_on 'New Address'

    fill_in 'address[description]', with: description
    fill_in 'address[street]', with: street
    fill_in 'address[city]', with: city
    fill_in 'address[state]', with: state
    fill_in 'address[zip]', with: zip

    click_on 'Create Address'

    expect(current_path).to eq student_path(student)
    expect(page).to have_content(description)
    expect(page).to have_content(street)
    expect(page).to have_content(state)
    expect(page).to have_content(zip)
  end
  # it 'delete student' do
  #   s1 = Student.create(name: 'Ian')
  #   visit students_path
  #
  #   click_on 'Delete'
  #   expect(current_path).to eq students_path
  #   expect(page).to_not have_content(s1.name)
  # end
end
