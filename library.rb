
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
    @status = "available"
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
  end

  def register_new_book(new_book)
    @books << new_book
    new_book.id = SecureRandom.uuid
  end

  def check_out_book(book_id, borrower)
  end

  def check_in_book(book)
  end

  def available_books
  end

  def borrowed_books
  end
end
