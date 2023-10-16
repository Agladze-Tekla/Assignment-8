import UIKit

//1
protocol Cannon {
    var cannonsCount: Int { get }
    func cannonCount()
    func fireCannon(count: Int)
}

protocol CargoManaging {
    var cargo: [String: Int] { get }
    func addCargo(cargoName: String, amount: Int)
    func removeCargo(cargoName: String)
    func listCargo()
}

protocol CrewManagment {
    var crew: [String] { get }
    func addCrew(pirate: String)
    func removeCrew(pirate: String)
    func listCrew()
}

class PirateShip: Cannon {
    let name: String
    internal var cannonsCount: Int
    
    init(name: String, cannonsCount: Int) {
        self.name = name
        self.cannonsCount = cannonsCount
    }
    
    func cannonCount() {
        print("The amount of cannons in the inventory: \(cannonsCount).")
    }
    
    func fireCannon(count: Int) {
        for _ in 1...count {
            print("Firing the cannon!")
            print("BOOM!")
            cannonsCount -= 1
        }
    }
}
    

class CargoManager: PirateShip {
    private var cargo: [String: Int] = [:]
    
    func addCargo(cargoName: String, amount: Int) {
        if cargo[cargoName] == nil {
            cargo[cargoName] = amount
        } else {
            cargo[cargoName]! += amount
        }
    }
    
    func removeCargo(cargoName: String) {
        if cargo[cargoName] != nil {
            cargo[cargoName] = nil
        } else {
          print("We don't have that in our cargo.")
        }
    }

    /*
     This version would be too unorginized and not very clean, but still.
    func removeCargo(cargoName: String, amount: Int) {
        if cargo[cargoName] != nil {
            if amount <= cargo[cargoName]!{
                cargo[cargoName] -= amount
            } else {
                print("Not enough \(cargoName)")
            }
        } else {
          print("We don't have that in our cargo.")
        }
    }
    */
    
    func listCargo() {
        print("\(name)'s cargo: \(cargo).")
    }
}

class CrewManager: PirateShip {
    private var crew: [String] = []

    func addCrew(pirate: String) {
        crew.append(pirate)
        print("New pirate: \(pirate).")
    }
    
    func removeCrew(pirate: String) {
        crew.removeAll { $0 == pirate }
        print("\(pirate) ha left us.")
    }
    
    func listCrew() {
        print("\(name)'s crew: \(crew).")
    }
}

//2
class TreasureMap {
    private let x: Double = 103.56
    private let y: Double = 87.34
    
    func hintToTreasure(xCord: Double, yCord: Double) {
        if x != xCord || y != yCord {
            print("The treasure is not there.")
            print("HINT: x coordinate is \(x - xCord) far away, the y coordinate is \(y - yCord) far away.")
        } else {
            print("CONGRADULATIONS! You found the treasure!")
        }
    }
}



//3
class SeaAdventure {
    let adventureType: String
    
    init (adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("It's Adventure Time!")
        print("Adventure type: \(adventureType).")
    }
}


//4
class PirateCode {
    private func discussTerms(term: String) {
        print("The discussion has started.")
        print(term)
    }
    
    func parley(terms: String) {
        discussTerms(term: terms)
        print("So we have settled on an agreement.")
    }
    
    func mutiny(terms: String) {
        discussTerms(term: terms)
        print("It seems as though we could not reach an agreement.")
        print("* Weapons are drawn out, canonn balls are prepared for firing *")
    }
}

let pirateShip = PirateShip(name: "Umm, I'll think of this later", cannonsCount: 12)
let crew = CrewManager(name: "Umm, I'll think of this later", cannonsCount: 12)
let cargo = CargoManager(name: "Umm, I'll think of this later", cannonsCount: 12)

crew.addCrew(pirate: "URRR")
crew.addCrew(pirate: "WOW")
crew.addCrew(pirate: "Yep")

cargo.addCargo(cargoName: "Weapons", amount: 5)
cargo.addCargo(cargoName: "Meals", amount: 19)

let map = TreasureMap()
let adventure = SeaAdventure(adventureType: "Encounter with the Flying Dutchman.")
let pirateCode = PirateCode()

map.hintToTreasure(xCord: 100.9, yCord: 32.0)
map.hintToTreasure(xCord: 103.56, yCord: 87.34)
cargo.addCargo(cargoName: "Treasure Box", amount: 1)

adventure.encounter()

var terms = "We put ya'll in jail and take the treasure you acquired, sounds about right eey??"
pirateCode.mutiny(terms: terms)
pirateShip.fireCannon(count: 5)
pirateShip.cannonCount()

//Or
terms = "Okay, so since ya'll have canons and frankly I don't wanna die, we'll let ya'll go."
pirateCode.parley(terms: terms)



