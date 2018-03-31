//
//  SLVPerson.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 09/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import Foundation

public class SLVPerson: NSObject {
	var name = ""
	var debt = ""
	var items = [SLVItem]()
	var avatar = SLVAvatar()
	let uid = UUID()
	
	init(name:String) {
		super.init()
		self.name = name
	}
	
	
}

