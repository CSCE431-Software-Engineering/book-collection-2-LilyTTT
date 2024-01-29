require 'rails_helper'

  RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', pages: 437, publisher: "test", release_date:"2001-01-01")
    end

    it 'is not valid without pages' do
      subject.pages = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without publisher' do
        subject.publisher = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without release_date' do
        subject.release_date = nil
        expect(subject).not_to be_valid
    end

end

