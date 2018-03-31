//
//  SLVPersonVCFooterView.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 27/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit


protocol SLVPersonVCFooterViewDelegate {
	func didEndEnteringNameInFooter(textField:UITextField)
}


class SLVPersonVCFooterView: UIView, UITextFieldDelegate, UIGestureRecognizerDelegate  {
	
	public var avatarView = UILabel()
	public var nameLabel = UITextField()
	public var delegate: SLVPersonVCFooterViewDelegate?
	
	 init() {
		super.init(frame:.zero)
		sizeToFit()
		self.backgroundColor = .green;
		self.configureViews()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configureViews()
		self.backgroundColor = .green;
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
		self.avatarView.translatesAutoresizingMaskIntoConstraints = false
		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		self.nameLabel.backgroundColor = .blue
		
		self.avatarView.layer.cornerRadius = 32
		self.avatarView.layer.masksToBounds = true
		self.avatarView.text = "+"
		self.avatarView.font = UIFont.systemFont(ofSize: 50)
		self.avatarView.textAlignment = .center
		self.addSubview(self.avatarView)
		
		self.nameLabel.font = UIFont.systemFont(ofSize: 32)
		self.nameLabel.adjustsFontSizeToFitWidth = true
		self.nameLabel.returnKeyType = .done
		self.nameLabel.delegate = self
		self.addSubview(self.nameLabel)
		
		self.isUserInteractionEnabled = true
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
		tapGesture.numberOfTapsRequired = 1
		self.addGestureRecognizer(tapGesture)
	}
	
	
	//MARK: Constraints
	
	override func updateConstraints() {
		let margins = self.layoutMarginsGuide
		self.avatarView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant:8).isActive = true
		self.avatarView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
		self.avatarView.widthAnchor.constraint(equalToConstant: 64).isActive = true
		self.avatarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
		
		self.nameLabel.leadingAnchor.constraint(equalTo: self.avatarView.trailingAnchor, constant: 16).isActive = true
		self.nameLabel.centerYAnchor.constraint(equalTo: self.avatarView.centerYAnchor, constant: -8).isActive = true
		self.nameLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		self.nameLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
		
		super.updateConstraints()
	}
	
	override class var requiresConstraintBasedLayout: Bool { return true }
	
	
	//MARK: UITextFieldDelegate
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		self.delegate?.didEndEnteringNameInFooter(textField: self.nameLabel)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.nameLabel.endEditing(true)
		return false
	}
	
	
	@objc
	func cellTapped ()
	{
		self.nameLabel.becomeFirstResponder()
		self.nameLabel.inputAccessoryView = self
	}
	
	
}

