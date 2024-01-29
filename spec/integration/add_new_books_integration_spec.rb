require 'rails_helper'

RSpec.describe "AddNewBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'adding a book' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello, World!'
    fill_in 'Publisher', with: 'Hello, World!'
    fill_in 'Pages', with: 537
    fill_in 'Release date', with: '2003-07-04'
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.title).to eq('Hello, World!')
  end

  it 'adding a book with blank title' do
    visit '/books/new'
    fill_in 'Title', with: ''
    fill_in 'Publisher', with: 'Hello, World!'
    fill_in 'Pages', with: 537
    fill_in 'Release date', with: '2003-07-04'
    click_on 'Add Book'
    expect(page).to have_content('Failed to add the book, check your inputs.')
  end
end
