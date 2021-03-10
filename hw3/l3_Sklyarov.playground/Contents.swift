import UIKit

var carMy = Car(type: .casual, mark: .audi, year: 2015, bagVolume: 350, fuelTank: 1000)
var carIvan = Car(type: .trunk, mark: .mercedess, year: 2000, bagVolume: 5000, fuelTank: 10000)
var carLeo = Car(type: .sport, mark: .dodge, year: 2020, bagVolume: 100, fuelTank: 1000)
var carJohn = Car(type: .jeep, mark: .cadillac, year: 2007, bagVolume: 500, fuelTank: 5000)

print("\nMy car test")
carMy.action(action: .engineOn)
carMy.action(action: .refuel(100))
carMy.action(action: .refuel(273))
carMy.action(action: .engineOn)

print("\nIvan car test")
carIvan.action(action: .engineOn)
carIvan.action(action: .refuel(5000))
carIvan.action(action: .engineOn)
carIvan.action(action: .unloadBag(1000))
carIvan.action(action: .uploadBag(4000))
carIvan.action(action: .unloadBag(3560))

print("\nLeo car test")
carLeo.action(action: .uploadBag(500))

print("\nJohn car test")
carJohn.action(action: .engineOff)
carJohn.action(action: .windowsClose)
carJohn.action(action: .windowsOpen)
carJohn.action(action: .windowsOpen)
carJohn.action(action: .windowsClose)

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

enum CarType{
    case sport
    case casual
    case jeep
    case trunk
}

enum CarAction{
    case refuel(Double)
    case uploadBag(Double)
    case unloadBag(Double)
    case engineOn
    case engineOff
    case windowsOpen
    case windowsClose
}

struct Car{
    let type: CarType
    let mark: CarMark
    let year: Int
    let bagVolume: Double
    let fuelTank: Double
    var bagFullness: Double
    var isEngineRun: Bool
    var isWindowOpened: Bool
    var fuelTankFullness: Double
    
    init (type: CarType, mark: CarMark, year: Int, bagVolume: Double, fuelTank: Double){
        if bagVolume > 0 && fuelTank>0{
            self.bagVolume = bagVolume
            self.fuelTank = fuelTank
        }
        else{
            print("Fuel and Bag should be positive and greater than zero. Now it is set to 1 and 1")
            self.bagVolume = 1
            self.fuelTank = 1
        }
        self.type = type
        self.mark = mark
        self.year = year
        bagFullness = 0
        fuelTankFullness = 0
        isEngineRun = false
        isWindowOpened = false
    }
    
    mutating func action(action:CarAction){
        switch action{
        case .engineOn:
            if isEngineRun{
                print("Already running")
            }
            else {
                if fuelTankFullness == 0{
                    print("No fuel")
                }
                else{
                    isEngineRun = true
                    print("Engine started")
                }
            }
        case .engineOff:
            if isEngineRun{
                isEngineRun = false
                print("Engine stopped")
            }
            else {
                print("Already stopped")
            }
        case .refuel(let value):
            if fuelTankFullness == fuelTank{
                print("Fuel tank is already full")
            }
            else if fuelTankFullness+value > fuelTank{
                fuelTankFullness = fuelTank
                print("Too much... But i have refueled to maximum")
            }
            else{
                fuelTankFullness+=value
                print("Refueld for \(value), now \(fuelTankFullness)")
            }
        case .uploadBag(let value):
            if bagFullness == bagVolume{
                print("Bag is already full")
            }
            else if bagFullness+value > bagVolume{
                bagFullness = bagVolume
                print("Too much... But i have uploaded to maximum")
            }
            else{
                bagFullness+=value
                print("Uploaded for \(value), now \(bagFullness)")
            }
        case .unloadBag(let value):
            if bagFullness == 0{
                print("Bag is already empty")
            }
            else if bagFullness-value < 0{
                bagFullness = 0
                print("Unloaded. Now the bag is empty")
            }
            else{
                bagFullness-=value
                print("Unloaded for \(value), now \(bagFullness)")
            }
        case .windowsOpen:
            if isWindowOpened{
                print("Windows are already opened")
            }
            else {
                isWindowOpened = true
                print("Windows opened")
            }
        case .windowsClose:
            if isWindowOpened{
                isWindowOpened = false
                print("Windows closed")
            }
            else {
                print("Windows are already closed")
            }
        }
        return
    }
}
