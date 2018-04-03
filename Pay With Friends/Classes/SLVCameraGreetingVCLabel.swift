//
//  SLVCameraGreetingVCLabel.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 02/04/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit


class SLVCameraGreetingVCLabel : UILabel {
	
	init() {
		super.init(frame: .zero)
		self.layer.borderWidth = 1
		
		self.layer.borderColor = UIColor.zeplinColor(red: 151, green: 151, blue: 151, alpha: 0.5).cgColor
		self.backgroundColor = UIColor.zeplinColor(red: 216, green: 216, blue: 216, alpha: 0.5)
		self.textAlignment = .center
		self.numberOfLines = 0
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
