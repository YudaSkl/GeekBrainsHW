import UIKit
print("Четное ли число: ")
print(isEven(value: 7))
print("Кратно ли трем число: ")
print(isDivThree(value: 9))
print("Массив из 100 числел по возрастанию: ")
var array = arrayCreate(length: 100,min: 60,max: 500)
print(array)

print("Массив очищенный от четных и не кратных трем: ")
var clearedArr = arrayClear(arr: array)
print(clearedArr)

var fibEditArr = fibAdd(array: clearedArr, fibLength: 10)
print("Массив с добалением числел Фибоначи: ")
print(fibEditArr)

var simpleEditArr = simpleAdd(array:clearedArr, maxsimple:35)
print("Массив с добавлением простых чисел: ")
print(simpleEditArr)

func isEven(value:Int)->Bool{
    if value%2==0{
        return true
    }
    else{
        return false
    }
}

func isDivThree(value:Int)->Bool{
    if value%3==0{
        return true
    }
    else{
        return false
    }
}

func arrayCreate(length:Int, min:Int, max:Int) -> [Int]{
    var arr: [Int] = []
    for _ in 1...length{
        let randNum = Int.random(in: min...max)
        arr = sortInsert(arrForAdd:arr, value:randNum)
    }
    return arr
}

func sortInsert(arrForAdd:[Int], value:Int)->[Int]{
    var arr:[Int] = arrForAdd
    if(arr.isEmpty){
        arr.append(value)
    }
    else{
        var index = 0
        for i in 0..<arr.count{
            if(value <= arr[i]){
                index = i
                break
            }
            else{
                index = i+1
            }
        }
        if(index<=0){
            arr.insert(value, at: 0)
        }
        else if(index>=arr.count){
            arr.append(value)
        }
        else{
            arr.insert(value, at: index)
        }
    }
    return arr
}
    
func arrayClear(arr: [Int])->[Int]{
    var arr = arr
    let length = arr.count
    for i in (0..<length).reversed(){
        if(isEven(value: arr[i]) || !isDivThree(value: arr[i])){
            arr.remove(at: i)
        }
    }
    return arr
}

func fibAdd(array:[Int], fibLength:Int)->[Int]{
    var elem1 = 0
    var elem2 = 1
    var elem_next = 0
    var fibArr:[Int] = array
    var fibOnly:[Int] = []
    fibOnly.append(elem1)
    fibOnly.append(elem2)
    fibArr = sortInsert(arrForAdd: fibArr, value: elem1)
    fibArr = sortInsert(arrForAdd: fibArr, value: elem2)
    for _ in 2...fibLength{
        elem_next = elem1 + elem2
        elem1 = elem2
        elem2 = elem_next
        fibOnly.append(elem_next)
        fibArr = sortInsert(arrForAdd: fibArr, value: elem_next)
    }
    print("Числа Фибоначи: ")
    print(fibOnly)
    
    return fibArr
}

func simpleAdd(array:[Int], maxsimple:Int)->[Int]{
    var arr = array
    var dicNat = [Int: Bool]()
    for i in 2...maxsimple{
        dicNat[i] = true
    }
    var step: Int = 2
    var temp_elem: Int = 2
    while true {
        while true{
            temp_elem += step
            if (dicNat[temp_elem] != nil){
                dicNat[temp_elem] = false
            }
            else{
                break
            }
        }
        let oldStep = step
        for key in 0..<dicNat.count{
            if dicNat[key] != nil && key > step && dicNat[key] != false{
                step=key
                break
            }
        }
        if(oldStep == step){
            break
        }
        temp_elem = step
    }
    print("Простые числа:")
    dicPrint(dic: dicNat)
    
    for key in 0..<dicNat.count{
        if dicNat[key] != nil && dicNat[key] != false{
            arr = sortInsert(arrForAdd:arr, value:key)
        }
    }
    return arr
}

func dicPrint(dic:[Int: Bool]){
    var str: String = ""
    for key in 0..<dic.count{
        if dic[key] != nil && dic[key] != false{
            str += String(key) + " "
        }
    }
    print(str)
}
