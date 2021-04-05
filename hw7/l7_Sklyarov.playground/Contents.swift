import UIKit

let msuLibrary = Library(name: "MSU Lib")
msuLibrary.addBook(newBook: Book(name: "Nemesis", accessLvl: 2))
msuLibrary.addBook(newBook: Book(name: "Star Wars", accessLvl: 0))
msuLibrary.addBook(newBook: Book(name: "The Lord Of The Rings", accessLvl: 1))
msuLibrary.addBook(newBook: Book(name: "Flowers", accessLvl: 0))
msuLibrary.addBook(newBook: Book(name: "Metro 2021", accessLvl: 1))

let userVal = LibUser(name: "Valeriy")

try userVal.rentBook(lib: msuLibrary, bookName: "Flowers")
try userVal.rentBook(lib: msuLibrary, bookName: "The Lord Of The Rings")
userVal.accessLvl = 1
try userVal.rentBook(lib: msuLibrary, bookName: "The Lord Of The Rings")
try userVal.rentBook(lib: msuLibrary, bookName: "Nemesis")
try userVal.rentBook(lib: msuLibrary, bookName: "Metro 2021")

userVal.showBooks()

enum LocalErrors: Error{
    case lowAccessLvl
    case noBookHere
}

class LibUser{
    let name: String
    var rentedBooks: [Book] = []
    var accessLvl: Int
    
    init(name: String){
        self.name = name
        self.accessLvl = 0
    }
    
    func rentBook(lib: Library, bookName: String) throws{
        do{
            let book: Book = try lib.rentBook(bookName: bookName, userName: self.name, userAccessLvl: self.accessLvl)
            self.rentedBooks.append(book)
            print("Book is rented")
        }catch{
            print("Some problems with renting...")
        }
    }
    
    func showBooks(){
        print("Rented books by \(self.name)")
        for book in rentedBooks{
            print(book.name)
        }
    }
}

class Book{
    let name: String
    var accessLvl: Int
    
    init(name: String, accessLvl: Int){
        self.name = name
        self.accessLvl = accessLvl
    }
}

class Library{
    let name: String
    var listOfBooks: [Book] = []
    
    init(name: String){
        self.name = name
    }
    
    func addBook(newBook: Book){
        for book in listOfBooks{
            if newBook.name == book.name{
                return
            }
        }
        self.listOfBooks.append(newBook)
    }
    
    func removeBook(name: String) throws{
        for (index,book) in listOfBooks.enumerated(){
            if name == book.name{
                self.listOfBooks.remove(at: index)
                return
            }
        }
        throw LocalErrors.noBookHere
    }
    
    func rentBook(bookName: String, userName: String, userAccessLvl: Int) throws -> Book {
        for (index, book) in listOfBooks.enumerated(){
            if bookName == book.name{
                guard checkAccess(userAccess: userAccessLvl, bookAccess: book.accessLvl)else{
                    throw LocalErrors.lowAccessLvl
                }
                return self.listOfBooks.remove(at: index)
            }
        }
        throw LocalErrors.noBookHere
    }
    
    func checkAccess(userAccess: Int, bookAccess: Int) ->Bool{
        return userAccess>=bookAccess
    }
}
