namespace bookshop;
using {managed} from '@sap/cds/common';

entity Books : managed {
    key BookID:Integer;
    title:String;
}

entity Authors: managed{
    key AuthorID:Integer;
    name:String;
}

entity Books_Authors{ 
    toBook  : Association to bookshop.Books;
    toAuthor : Association to bookshop.Authors;
}