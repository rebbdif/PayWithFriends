//
//  SLVPersonVCCell.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 10/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

protocol SLVPersonVCCellDelegate {
	func didEndEnteringName(textField:UITextField)
}


class SLVPersonVCCell: UITableViewCell, UITextFieldDelegate {
	
	static let reuseId = "SLVPersonVCCell"
	
	public var avatarView = UILabel()
	public var nameLabel = UITextField()
	
	public var delegate: SLVPersonVCCellDelegate?

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
	self.avatarView.translatesAutoresizingMaskIntoConstraints = false
	self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.avatarView.layer.cornerRadius = 32
		self.avatarView.layer.masksToBounds = true
		let result = arc4random_uniform(_:4)
		switch result {
		case 0:
			self.avatarView.text = "🐯"
			self.avatarView.backgroundColor =  UIColor.green.withAlphaComponent(0.2)
		case 1:
			self.avatarView.text = "🙊"
			self.avatarView.backgroundColor =  UIColor.yellow.withAlphaComponent(0.2)
		case 2:
			self.avatarView.text = "🐳"
			self.avatarView.backgroundColor =  UIColor.blue.withAlphaComponent(0.2)
		default:
			self.avatarView.text = "🦄"
			self.avatarView.backgroundColor =  UIColor.red.withAlphaComponent(0.2)
		}
		self.avatarView.font = UIFont.systemFont(ofSize: 50)
		self.avatarView.textAlignment = .center
		self.contentView.addSubview(self.avatarView)
		
		self.nameLabel.font = UIFont.systemFont(ofSize: 32)
		self.nameLabel.adjustsFontSizeToFitWidth = true
		self.nameLabel.returnKeyType = .done
		self.nameLabel.delegate = self
		self.contentView.addSubview(self.nameLabel)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//MARK: Constraints

	override func updateConstraints() {
		let margins = self.contentView.layoutMarginsGuide
		
		self.avatarView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
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
		self.delegate?.didEndEnteringName(textField: self.nameLabel)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.nameLabel.endEditing(true)
		return false
	}
	

}
