//
//  SLVCameraGreetingVCButton.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 02/04/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

class SLVCameraGreetingVCButton: UIButton {

	init() {
		super.init(frame: .zero)
		self.layer.borderWidth = 1
		
		self.layer.borderColor = UIColor.zeplinColor(red: 151, green: 151, blue: 151, alpha: 0.5).cgColor
		self.backgroundColor = UIColor.zeplinColor(red: 216, green: 216, blue: 216, alpha: 0.5)
		
		self.layer.shadowRadius = 1
		self.layer.shadowOffset = CGSize(width: 1, height: 2)
		
		self.setTitleColor(.darkText, for: .normal)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.layer.cornerRadius = self.bounds.height / 2
	}
}
