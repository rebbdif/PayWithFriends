//
//  SLVPeopleVC.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 09/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import Foundation
import UIKit


/// Контроллер добавления людей
class SLVPeopleVC: UITableViewController, SLVPersonVCCellDelegate // UITableViewDelegate, UITableViewDataSource
{
	
    var people = [SLVPerson]()
//	var tableView = UITableView()
	var addingNewPeople = false
	
	init() {
		super.init(nibName: nil, bundle: nil)
		self.people = [SLVPerson(name: "Mike"),
					   SLVPerson(name: "Julia"),
					   SLVPerson(name: "Jerom Klapka Jerom")]
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .lightGray
		self.navigationItem.title = "Люди"
		let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(add))
		self.navigationItem.rightBarButtonItem = rightButton
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.configureTableView()
		
//		NotificationCenter.default.addObserver(
//			self,
//			selector: #selector(keyboardWillShow(_:)),
//			name: Notification.Name.UIKeyboardWillShow,
//			object: nil
//		)
//		NotificationCenter.default.addObserver(
//			self,
//			selector: #selector(keyboardWillHide(_:)),
//			name: Notification.Name.UIKeyboardWillHide,
//			object: nil
//		)
    }
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	
	//MARK: Table View

	func configureTableView() {
		self.tableView = UITableView(frame: self.view.frame)
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(SLVPersonVCCell.self, forCellReuseIdentifier: SLVPersonVCCell.reuseId)
		self.tableView.rowHeight = 80
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.people.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SLVPersonVCCell.reuseId) as! SLVPersonVCCell
		
		cell.nameLabel.text = self.people[indexPath.row].name
		cell.delegate = self
		
		if (self.addingNewPeople)
		{
			cell.nameLabel.becomeFirstResponder()
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == .delete) {
			self.people.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	
	//MARK: Adding People
	@objc
	func add () {
		self.addingNewPeople = true

		self.people.append(SLVPerson(name: ""))
		
		self.tableView.beginUpdates()
		
		let newCellIndexPath = IndexPath(row: self.people.count - 1, section: 0)
		self.tableView.insertRows(at: [newCellIndexPath], with: .automatic)
		self.tableView.endUpdates()
	}
	
	
	//MARK: Cell's delegate
	
	func didEndEnteringName(textField: UITextField) {
		textField.resignFirstResponder()
		self.addingNewPeople = false
	}
	
	//MARK: Keyboard

//	func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
//		let userInfo = notification.userInfo ?? [:]
//		let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//		let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
//		self.tableView.contentInset.bottom += adjustmentHeight
//		self.tableView.scrollIndicatorInsets.bottom += adjustmentHeight
//	}
	
//	@objc func keyboardWillShow(_ notification: Notification) {
//		if (self.addingNewPeople == true) {
//		adjustInsetForKeyboardShow(true, notification: notification)
//
//		}
//
//	}
//
//	@objc func keyboardWillHide(_ notification: Notification) {
//		adjustInsetForKeyboardShow(false, notification: notification)
//		self.addingNewPeople = false
//	}
	
	
}

