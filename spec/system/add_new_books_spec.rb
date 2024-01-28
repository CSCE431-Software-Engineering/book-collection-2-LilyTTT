require 'rails_helper'

RSpec.describe "AddNewBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'adding a book' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello, World!'
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.title).to eq('Hello, World!')
  end

  it 'adding a book with blank title' do
    visit '/books/new'
    fill_in 'Title', with: ''
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.title).to eq('')
  end
end
