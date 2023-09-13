using bookshop from '../db/schema';
using BookshopService from './main';

extend bookshop.Books with {
   // toAuthor: Association to bookshop.Authors;
    // toAuthors : Association to many Book_Authors on toAuthors.toBook.ID = ID;
    toAuthors : Association to many bookshop.Books_Authors on toAuthors.toBook = $self;
}
extend bookshop.Authors with{
   // toBook:Association to bookshop.Books on toBook.toAuthor = $self;
  //  toBook:Association to bookshop.Books on toBook.toAuthor.AuthorID = AuthorID;
   // toBooks: Association to many bookshop.Books on toBooks.toAuthor.AuthorID = AuthorID ;
   // toBooks: Association to many bookshop.Books on toBooks.toAuthor = $self ;
  // toBook: Association to bookshop.Books;
     toBooks: Association to many bookshop.Books_Authors on toBooks.toAuthor = $self;
}


extend service BookshopService with {
     entity LinkEntity as projection on bookshop.Books_Authors;
}