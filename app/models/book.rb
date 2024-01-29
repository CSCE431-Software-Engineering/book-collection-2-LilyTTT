class Book < ApplicationRecord
    validates :title, presence: true
    validates :pages, presence: true
    validates :release_date, presence: true
    validates :publisher, presence: true
end
