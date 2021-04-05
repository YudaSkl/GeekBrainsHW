import UIKit


let queueInt = Queue<Int>()
let queueBook = Queue<Book>()

for i in 1...10{
    queueInt.push(element: i)
}
for i in 1...10{
    queueBook.push(element: Book(name: "book \(i)", author: "author \(i)"))
}

print(queueInt.pop()! as Int)
print(queueInt.pop()! as Int)
print(queueBook.pop()!.getString())
print(queueBook.pop()!.getString())
print(queueInt.filterByIndex(predicate: {(value)->Bool in
    return value % 2 == 0
}))
let filteredBooks: [Book] = queueBook.filterByIndex(predicate: {(value)->Bool in
    return value % 5 == 0
})
var filteredBooksString: String = "Filtered by index books:\n"
for book in filteredBooks{
    filteredBooksString.append("\(book.getString())\n")
}
print(filteredBooksString)


class Book{
    let name: String
    let author: String
    
    init(name:String, author:String){
        self.name = name
        self.author = author
    }
    func getString() -> String{
        return "name: \(self.name) author: \(self.author)"
    }
}


public class Queue<T> {
    private var elements: [T] = []
    
    func push(element: T){
        self.elements.append(element)
    }
    
    func pop() -> T? {
        guard !self.elements.isEmpty else{return nil}
        return self.elements.removeFirst()
    }
    
    func filterByIndex(predicate: (Int) -> (Bool)) -> [T]{
        var filteredArr: [T] = []
        for (index,elem) in self.elements.enumerated(){
            if predicate(index){
                filteredArr.append(elem)
            }
        }
        return filteredArr
    }
    
    subscript(index: Int) -> T?{
        guard index<0 && index>=elements.count && !elements.isEmpty else{return nil}
        return self.elements[index]
    }
}
