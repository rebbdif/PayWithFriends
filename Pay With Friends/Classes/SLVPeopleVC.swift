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
class SLVPeopleVC: UITableViewController, SLVPersonVCCellDelegate
{
	var people = [SLVPerson]()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		self.people = []
		//[SLVPerson(name: "Mike"), SLVPerson(name: "Julia"), SLVPerson(name: "Jerom")]
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .lightGray
		self.navigationItem.title = "Люди"
		let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(done))
		self.navigationItem.rightBarButtonItem = rightButton
		self.configureTableView()
	}
	
	func configureTableView() {
		self.tableView = UITableView(frame: self.view.frame, style:.plain)
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(SLVPersonVCCell.self, forCellReuseIdentifier: SLVPersonVCCell.reuseId)
		self.tableView.rowHeight = SLVPersonVCCell.cellHeight
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	override func viewDidAppear(_ animated: Bool) {
		self.addNewCell()
	}
	
	
	//MARK: Table View Delegate and DataSource
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.people.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SLVPersonVCCell.reuseId) as! SLVPersonVCCell
		cell.delegate = self
		
		let person = self.people[indexPath.row]
		cell.person = person;
		cell.nameLabel.text = person.name
		cell.setAvatar(avatar:person.avatar)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
		_ = self.resignFirstResponder()
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == .delete) {
			tableView.beginUpdates()
			self.people.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
			tableView.endUpdates()
			if self.people.isEmpty {
				let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addNewCell))
				self.navigationItem.rightBarButtonItem = rightButton
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	@objc
	func done() {
		let rightButton = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(goToNextScreen))
		self.navigationItem.rightBarButtonItem = rightButton
		
		_ = self.resignFirstResponder()
		self.endAddingPeople()
		
	}
	
	@objc
	func goToNextScreen() {
		self.navigationController?.pushViewController(SLVCameraGreetingVC(), animated: true)
	}
	
	@objc
	func addNewCell () {
		self.people.append(SLVPerson(name: ""))
		
		let newCellIndexPath = IndexPath(row: self.people.count - 1, section: 0)
		self.tableView.beginUpdates()
		self.tableView.insertRows(at: [newCellIndexPath], with: .automatic)
		self.tableView.endUpdates()
		
		guard let cell = self.tableView.cellForRow(at: newCellIndexPath) as? SLVPersonVCCell else {
			return }
		cell.nameLabel.becomeFirstResponder()
	}
	
	
	//MARK: Cell's delegate
	
	func cellDidBeginEnteringName(cell: SLVPersonVCCell) {
		let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(done))
		self.navigationItem.rightBarButtonItem = rightButton
	}
	
	func cellDidEndEnteringName(cell: SLVPersonVCCell) {
	//	_ = cell.resignFirstResponder()
//		guard let name = cell.nameLabel.text else { print("no name entered"); return}
//		cell.person?.name = name
		
		self.isLastCell(cell: cell) ?
			self.addNewCell() :
			self.endAddingPeople()
	}
	
	func isLastCell(cell: SLVPersonVCCell) -> Bool {
		if self.people.count == 0 { return true }
		if cell.person == self.people[self.people.count - 1] {
			return true
		}
		return false
	}
	
	func endAddingPeople() {
		_ = self.resignFirstResponder()
		self.hideKeyboard()
		removeLastCellIfItHasNoName()
	}
	
	func removeLastCellIfItHasNoName()  {
		if self.people.last?.name == "" {
			self.tableView.beginUpdates()
			self.people.removeLast()
			let indexPath = IndexPath(row: self.people.count, section: 0)
			self.tableView.deleteRows(at: [indexPath], with: .automatic)
			self.tableView.endUpdates()
			if self.people.isEmpty {
				let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addNewCell))
				self.navigationItem.rightBarButtonItem = rightButton
			}
		}
	}
	
	func hideKeyboard() {
		_ = self.resignFirstResponder()
	}
	
	override func resignFirstResponder() -> Bool {
		super.resignFirstResponder()
		let visivleCells = self.tableView.visibleCells
		for cell in visivleCells {
			cell.resignFirstResponder()
		}
		return true
	}
	
}

