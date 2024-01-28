require 'rails_helper'

RSpec.describe "AddNewBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'adding a book with publisher' do
    visit '/books/new'
    fill_in 'Publisher', with: 'Hello, World!'
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.publisher).to eq('Hello, World!')
  end

  it 'adding a book with pages' do
    visit '/books/new'
    fill_in 'Pages', with: 537
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.pages).to eq(537)
  end

  it 'adding a book with release date' do
    visit '/books/new'
    fill_in 'Release date', with: '2003-07-04'
    click_on 'Add Book'
    expect(page).to have_content('Book was successfully added.')
    book = Book.order("id").last
    expect(book.release_date).to eq(Date.new(2003, 7, 4))
  end
end
