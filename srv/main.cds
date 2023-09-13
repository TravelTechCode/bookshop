using bookshop from '../db/schema';

service BookshopService{
    entity Books as projection on bookshop.Books;
    entity Authors as projection on bookshop.Authors;

    action submitOrder (book:Books:BookID,quantity :Integer);

}