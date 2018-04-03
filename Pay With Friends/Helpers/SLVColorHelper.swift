//
//  SLVColorHelper.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 02/04/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
	
	static func zeplinColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor
	{
		let color = UIColor(red: red / 255.0 , green: green / 255.0, blue: blue / 255.0, alpha: alpha)
		return color
	}
	
}
