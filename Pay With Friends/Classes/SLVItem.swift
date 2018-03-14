//
//  SLVItem.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 09/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import Foundation

public class SLVItem: NSObject {
	var name: String
	var price: Double
	
	init(name: String, price: Double) {
		self.name = name
		self.price = price
	}

	public override func isEqual(_ object: Any?) -> Bool {
		guard let second = object as? SLVItem else { return false }
		
	return second.name == self.name &&
		second.price == self.price
	}
}
