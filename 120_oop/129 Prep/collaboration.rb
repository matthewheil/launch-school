# Collaborator objects occur in an object that’s state references another object.
# Collaboration is the relationship with an object’s state and another object.
# An instance variable is bound to another object.

class Book; end

class Library
  attr_reader :books

  def initialize
    @books = [] # collaborator object is Array and part of the state of a Library object; don't inherit from standard classes. Use collaborators.
  end

  def add_book(book)
    books << book # collaborator object is a Book object. This is a relationship of association.
  end
end

great_gatsby = Book.new
local_library = Library.new
local_library.add_book(great_gatsby)
p local_library
