//
//  SLVAvatarCreator.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 31/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

class SLVAvatar: NSObject {
	
	public var color: UIColor
	public var text: String
	
	override init() {
		let result = arc4random_uniform(_:6)
		switch result {
		case 0:
			self.text = "🐯"
			self.color =  UIColor.green.withAlphaComponent(0.2)
		case 1:
			self.text = "🙊"
			self.color =  UIColor.yellow.withAlphaComponent(0.2)
		case 2:
			self.text = "🐳"
			self.color =  UIColor.blue.withAlphaComponent(0.2)
		case 3:
			self.text = "🐸"
			self.color =  UIColor.gray.withAlphaComponent(0.2)
		case 4:
			self.text = "🦀"
			self.color =  UIColor.magenta.withAlphaComponent(0.2)
		default:
			self.text = "🦄"
			self.color =  UIColor.red.withAlphaComponent(0.2)
		}
		super.init()

	}
	
	func createAvatar() {
		
	}
}
