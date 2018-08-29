require 'rails_helper'

describe 'Student Details' do
  it 'should show all students' do
    s1 = Student.create!(name:'Eve')
    s2 = Student.create!(name:'Ian')
    s3 = Student.create!(name:'Kat')

    visit students_path

    expect(page).to have_content(s1.name)
    expect(page).to have_content(s2.name)
    expect(page).to have_content(s3.name)
  end
  it 'should show a student' do
    s1 = Student.create!(name:'Eve')

    visit student_path(s1)

    expect(page).to have_content(s1.name)
  end
  it 'should show student addresses' do
    s1 = Student.create!(name:'Eve')
    a1 = s1.addresses.create(description: "home", street: "fenton", city: "lakewood", state: "co", zip: 80232)
    a2 = s1.addresses.create(description: "mailing", street: "ton", city: "lake", state: "il", zip: 60232)

    visit student_path(s1)

    expect(page).to have_content(a1.description)
    expect(page).to have_content(a1.street)
    expect(page).to have_content(a1.city)
    expect(page).to have_content(a1.state)
    expect(page).to have_content(a1.zip)
    expect(page).to have_content(a2.description)
    expect(page).to have_content(a2.street)
    expect(page).to have_content(a2.city)
    expect(page).to have_content(a2.state)
    expect(page).to have_content(a2.zip)
  end
  it 'should show student courses' do
    s1 = Student.create!(name:'Eve')
    c1 = s1.courses.create(name: 'Math')
    c2 = s1.courses.create(name: 'English')

    visit student_path(s1)

    expect(page).to have_content(c1.name)
    expect(page).to have_content(c2.name)
  end
end
