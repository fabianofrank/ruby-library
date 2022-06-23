require_relative '../book'

describe Book do
  context 'When instantiating the Book class' do
    it 'should initiate title and author parameters and be able to access them.' do
      book = Book.new('Title', 'Author')
      expect(book.title).to eq 'Title'
      expect(book.author).to eq 'Author'
    end
  end
end
