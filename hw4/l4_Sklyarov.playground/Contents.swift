import UIKit

var carIvan = TrunkCar(carMark:.mercedess, maxBagVolume: 10000)
var carLeo = SportCar(carMark:.audi, maxSpeed: 320)

print("\nIvan car test")
carIvan.action(action: .engineOn)
carIvan.action(action: .engineOn)
carIvan.action(action: .unloadBag(1000))
carIvan.action(action: .uploadBag(4000))
carIvan.action(action: .unloadBag(3560))

print("\nLeo car test")
carLeo.action(action: .speedUp(100))
carLeo.action(action: .engineOn)
carLeo.action(action: .engineOn)
carLeo.action(action: .speedUp(136))
carLeo.action(action: .speedDown(100))
carLeo.action(action: .speedDown(300))

enum CarMark{
    case audi
    case bmw
    case mercedess
    case cadillac
    case dodge
    case lada
    case citroen
    case hyundai
    case kia
}

enum CarAction{
    case speedUp(Int)
    case speedDown(Int)
    case uploadBag(Int)
    case unloadBag(Int)
    case engineOn
    case engineOff
}

class Car{
    var carMark: CarMark
    var isEngineRun: Bool
    
    init(carMark: CarMark){
        self.carMark = carMark
        isEngineRun = false
    }
    func action(action:CarAction){}
}

class SportCar: Car{
    var currSpeed: Int
    var maxSpeed: Int
    init(carMark: CarMark, maxSpeed: Int){
        self.maxSpeed = maxSpeed
        currSpeed = 0
        super.init(carMark: carMark)
    }
    override func action(action:CarAction) {
        switch action{
        case .engineOn:
            if isEngineRun{
                print("Already running")
            }
            else {
                isEngineRun = true
                print("Engine started")
            }
        case .engineOff:
            if isEngineRun{
                isEngineRun = false
                print("Engine stopped")
            }
            else {
                print("Already stopped")
            }
        case .speedUp(let value):
            if isEngineRun{
                currSpeed+=value
                if currSpeed>maxSpeed{
                    currSpeed = maxSpeed
                    print("U got max speed")
                }
                else {
                    print("U got more speed")
                }
            }
            else{
                print("Engine is off")
            }
        case .speedDown(let value):
            currSpeed-=value
            if currSpeed<0{
                currSpeed = 0
                print("U stopped")
            }
            else {
                print("U got less speed")
            }
        case .uploadBag(_):
            print("This is nit about sport cars")
        case .unloadBag(_):
            print("This is nit about sport cars")
        }
        return
    }
}
class TrunkCar: Car{
    var bagVolume: Int
    let maxBagVolume: Int
    init(carMark: CarMark, maxBagVolume: Int){
        self.maxBagVolume = maxBagVolume
        bagVolume = 0
        super.init(carMark: carMark)
    }
    override func action(action:CarAction) {
        switch action{
        case .engineOn:
            if isEngineRun{
                print("Already running")
            }
            else {
                isEngineRun = true
                print("Engine started")
            }
        case .engineOff:
            if isEngineRun{
                isEngineRun = false
                print("Engine stopped")
            }
            else {
                print("Already stopped")
            }
        case .uploadBag(let value):
            bagVolume+=value
            if bagVolume >= maxBagVolume{
                bagVolume = maxBagVolume
                print("Bag is full now")
            }
            else{
                print("Uploaded for \(value), now \(bagVolume)")
            }
        case .unloadBag(let value):
            bagVolume-=value
            if bagVolume <= 0{
                bagVolume = 0
                print("Bag is empty now")
            }
            else{
                print("Unloaded for \(value), now \(bagVolume)")
            }
        case .speedUp(_):
            print("This is nit about trunk cars")
        case .speedDown(_):
            print("This is nit about trunk cars")
    }
    }
}
