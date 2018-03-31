//
//  SLVPersonVCCell.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 10/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

protocol SLVPersonVCCellDelegate {
	func cellDidEndEnteringName(cell:SLVPersonVCCell)
	func cellDidBeginEnteringName(cell:SLVPersonVCCell)
}


class SLVPersonVCCell: UITableViewCell, UITextFieldDelegate {
	
	static let reuseId = "SLVPersonVCCell"
	static let cellHeight = CGFloat(80)
	
	public var person : SLVPerson?
	
	public var avatarView = UILabel()
	public var nameLabel = UITextField()
	
	public var delegate: SLVPersonVCCellDelegate?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.avatarView.translatesAutoresizingMaskIntoConstraints = false
		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.avatarView.layer.cornerRadius = 32
		self.avatarView.layer.masksToBounds = true
		self.avatarView.font = UIFont.systemFont(ofSize: 50)
		self.avatarView.textAlignment = .center
		self.contentView.addSubview(self.avatarView)
		
		self.nameLabel.font = UIFont.systemFont(ofSize: 32)
		self.nameLabel.adjustsFontSizeToFitWidth = true
		//self.nameLabel.returnKeyType = .return
		self.nameLabel.delegate = self
		self.contentView.addSubview(self.nameLabel)
	}
	
	public func setAvatar(avatar: SLVAvatar) {
		self.avatarView.text = avatar.text
		self.avatarView.backgroundColor = avatar.color
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
	
	override func prepareForReuse() {
		super.prepareForReuse()
		self.nameLabel.text = nil
		self.avatarView.text = nil
		self.person = nil
	}
	
	//MARK: UITextFieldDelegate
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.delegate?.cellDidBeginEnteringName(cell: self)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.delegate?.cellDidEndEnteringName(cell: self)
		return false
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		guard let text = textField.text else {
			print("no text entered"); return;
		}
		self.person?.name = text
	}
	
	override func resignFirstResponder() -> Bool {
		self.nameLabel.resignFirstResponder()
		return true
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	//	self.nameLabel.becomeFirstResponder()
	}
	
}
