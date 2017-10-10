//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Nathan Standage on 10/8/17.
//  Copyright © 2017 Treehouse Island, Inc. All rights reserved.
//

import Foundation

// Mark: - Protocols for Vending Machine

///List of available items
enum VendingSelection {
    case soda
    case dietSoda
    case chips
    case cookie
    case sandwich
    case wrap
    case candyBar
    case popTart
    case water
    case fruitJuice
    case sportsDrink
    case gum
}


protocol VendingMachine {
    var selection: [VendingSelection] { get }
    var inventory: [VendingSelection: VendingItem] { get set }
    var amountDeposited: Double { get set }
    
    init(inventory: [VendingSelection: VendingItem])
    func vend(selection: VendingSelection,   quantity: Int) throws
    
    func deposit(_ amount: Double)
}


protocol VendingItem {
    var price: Double { get }
    var quantity: Int { get set }
}


struct Item: VendingItem {
    var price: Double
    var quantity: Int
}


class FoodVendingMachine: VendingMachine {
    
    let selection: [VendingSelection] = [.soda, .dietSoda, .chips, .cookie, .sandwich, .wrap, .candyBar, .popTart, .water, .fruitJuice, .sportsDrink, .gum]
    
    var inventory: [VendingSelection : VendingItem]
    
    var amountDeposited: Double = 10.0
    
    required init(inventory: [VendingSelection : VendingItem]) {
        self.inventory = inventory
    }
    
    func vend(selection: VendingSelection, quantity: Int) throws {
    }
    
    func deposit(_ amount: Double) {
        amountDeposited += amount
    }
}

enum InventoryError: Error {
    case invalidResource
    case conversionFailure
}

class PlistConverter {
    static func dictionary(fromFile name: String, ofType type: String) throws -> [String:AnyObject] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw InventoryError.invalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String:AnyObject] else {
           throw InventoryError.conversionFailure
        }

        return dictionary
    }
}

class InventoryUnarchiver {
    static func vendingInventory(fromDictionary dictionary: [String: AnyObject]) ->  [VendingSelection:VendingItem] {
    var inventory: [VendingSelection:VendingItem] = [:]
    
    for (key, value) in dictionary {

    if let itemDictionary = value as? [String:Any], let price = itemDictionary["price"] as? Double, let quantity = itemDictionary["quantity"] as? Int {
    
        let item = Item(price: price, quantity: quantity)
    }
    
    
    }
        
        return inventory
    }

}
    















