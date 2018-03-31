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
class SLVPeopleVC: UIViewController, SLVPersonVCCellDelegate , UITableViewDelegate, UITableViewDataSource
{
    var people = [SLVPerson]()
	var tableView = UITableView()
//	var addingNewPeople = false
	
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
		let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(goToNextScreen))
		self.navigationItem.rightBarButtonItem = rightButton
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.configureTableView()
	self.createAddView()
    }
	
	func configureTableView() {
		self.tableView = UITableView(frame: self.view.frame)
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(SLVPersonVCCell.self, forCellReuseIdentifier: SLVPersonVCCell.reuseId)
		self.tableView.rowHeight = SLVPersonVCCell.cellHeight
		self.view.addSubview(self.tableView)
	}
	
	func createNextButton() {
		let height = CGFloat(44)
		let rect = CGRect(x: 0, y: self.view.frame.height - height , width: self.view.frame.width, height: height)
		let nextView = UIButton(frame:rect)
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.alignment = .left
		let attributes: [NSAttributedStringKey: Any] = [
			.strokeColor : UIColor.darkText,
			.foregroundColor : UIColor.darkText,
			.font : UIFont.boldSystemFont(ofSize: 18),
			.paragraphStyle: paragraphStyle
			]
		let title = NSAttributedString(string: "Дальше", attributes:attributes )
		nextView.setAttributedTitle(title, for: .normal)
		nextView.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
		nextView.backgroundColor = UIColor.white//.withAlphaComponent(0.5)
		self.view.addSubview(nextView)
	}
	
	
	//MARK: Table View Delegate and DataSource
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.people.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SLVPersonVCCell.reuseId) as! SLVPersonVCCell
		
		cell.nameLabel.text = self.people[indexPath.row].name
		cell.delegate = self
		cell.indexPath = indexPath;
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == .delete) {
			self.people.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	@objc
	func goToNextScreen() {
		
	}
	
	
	//MARK: Cell's delegate
	
	func didEndEnteringName(textField: UITextField) {
		textField.resignFirstResponder()
		self.addNewCell()
	}
	
	func addNewCell () {
		self.people.append(SLVPerson(name: ""))

		self.tableView.beginUpdates()
		let newCellIndexPath = IndexPath(row: self.people.count - 1, section: 0)
		self.tableView.insertRows(at: [newCellIndexPath], with: .automatic)
		self.tableView.endUpdates()
		
		guard let cell = self.tableView.cellForRow(at: newCellIndexPath) as? SLVPersonVCCell else {
			return }
		cell.nameLabel.becomeFirstResponder()
		self.tableView.scrollToRow(at: newCellIndexPath, at: .middle, animated: true)
	}
	
	func didBeginEnteringName(indexPath: IndexPath) {
		
	}
	
}

