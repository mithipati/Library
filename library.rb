
class Book
  attr_reader :title
  attr_reader :author
  attr_accessor :id
  attr_accessor :status

  def initialize(title, author)
    @title = title
    @author = author
    @id = nil
    @status = "available"
  end

  def check_out
    if @status == "available"
      @status = "checked_out"
      true
    else
      false
    end
  end

  def check_in
    if @status == "checked_out"
      @status = "available"
      true
    else
      false
    end
  end



end

class Borrower
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Library
  attr_reader :books

  def initialize
    @books = []
    @borrowers = []
  end

  def register_new_book(new_book)
    @books << new_book
    new_book.id = SecureRandom.uuid
  end

  def check_out_book(book_id, borrower)
    @books.each do |book|
      if book.status == "available"
        if book.id == book_id
          @borrowers << { borrower.name => book_id }
          book.check_out
          return book
        end
      end
    end
    return nil
  end

  def check_in_book(book)
    book.check_in
  end


  def get_borrower(book_id)
    @borrowers.each do |borrower_hash|
      borrower_hash.each do |k,v|
        if v == book_id
          return k
        else
          puts "This book has not been checked out yet"
        end
      end
    end
  end




  def available_books
  end

  def borrowed_books
  end
end
