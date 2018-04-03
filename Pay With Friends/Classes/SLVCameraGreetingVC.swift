//
//  SLVCameraGreetingVC.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 31/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class SLVCameraGreetingVC: UIViewController {

	var cameraAuthStatus: AVAuthorizationStatus {
		return AVCaptureDevice.authorizationStatus(for: .video)
	}
	
	var libraryAuthStatus: PHAuthorizationStatus {
		return PHPhotoLibrary.authorizationStatus()
	}
	
	let cameraLabel = SLVCameraGreetingVCLabel()
	let cameraButton = SLVCameraGreetingVCButton()
	let libryaryLabel = SLVCameraGreetingVCLabel()
	let libryaryButton = SLVCameraGreetingVCButton()
	let manuallyButton = SLVCameraGreetingVCButton()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		
		view.addSubview(cameraButton)
		view.addSubview(cameraLabel)
		view.addSubview(libryaryButton)
		view.addSubview(libryaryLabel)
		view.addSubview(manuallyButton)
		
		manuallyButton.setTitle("Ввести вручную", for: .normal)
		manuallyButton.setTitleColor(.lightGray, for: .normal)
		manuallyButton.backgroundColor = .white
		manuallyButton.addTarget(self, action: #selector(manually), for: .touchUpInside)
		
		addConstraints()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.prefersLargeTitles = false
		super.viewWillAppear(animated)
		updateCameraControls()
		updatePhotoLibraryControls()
	}
	
	
	@objc
	func openCamera() {
		
	}
	
	@objc
	func openPhotoLibrary() {
		
	}
	
	@objc
	func manually() {
		
	}
}


private extension SLVCameraGreetingVC {
	
	func updatePhotoLibraryControls() {
		switch self.libraryAuthStatus {
		case .restricted: do {
			libryaryLabel.text = "Чтобы распознать уже имеющееся фото счета,\nразрешите приложению\nдоступ к фотоплёнке"
			libryaryButton.setTitle("Разрешить", for: .normal)
			libryaryButton.addTarget(self, action: #selector(askToReconsiderRestrictionForLibrary), for: .touchUpInside)
			}
		case .notDetermined: do {
			libryaryLabel.text = "Чтобы распознать уже имеющееся фото счета,\nразрешите приложению\nдоступ к фотоплёнке"
			libryaryButton.setTitle("Разрешить", for: .normal)
			libryaryButton.addTarget(self, action: #selector(askPermissionForLibrary), for: .touchUpInside)
			}
		case .denied: do {
			libryaryLabel.text = "Чтобы распознать уже имеющееся фото счета,\nразрешите приложению\nдоступ к фотоплёнке"
			libryaryButton.setTitle("Разрешить", for: .normal)
			libryaryButton.addTarget(self, action: #selector(askToReconsiderRestrictionForLibrary), for: .touchUpInside)
			}
		case .authorized: do {
			libryaryLabel.text = "Нажмите, чтобы перейти в фотопленку\nи выбрать счет"
			libryaryButton.setTitle("Перейти в фотоплёнку", for: .normal)
			libryaryButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
			}
		}
	}
	
	@objc
	func askToReconsiderRestrictionForLibrary() {
		let alert = UIAlertController(title: nil, message: "Чтобы разрешить доступ к фотопленке\nперейдите в настройки", preferredStyle: .actionSheet)
		let act = UIAlertAction(title: "В Настройки", style: .default) { (action) in
			UIApplication.shared.open(NSURL(string: UIApplicationOpenSettingsURLString)! as URL, options: [:], completionHandler: nil)
		}
		let cancel = UIAlertAction(title: "Отмена", style: .cancel)
		alert.addAction(act)
		alert.addAction(cancel)
	}
	
	@objc
	func askPermissionForLibrary() {
		PHPhotoLibrary.requestAuthorization { (status) in
			if status == .authorized {
				self.openPhotoLibrary()
			} else {
				self.updatePhotoLibraryControls()
			}
		}
	}
}


private extension SLVCameraGreetingVC {
	func updateCameraControls() {
		switch self.cameraAuthStatus {
		case .restricted: do {
			cameraLabel.text = "Чтобы распознать счет,\nразрешите приложению\nдоступ к камере"
			cameraButton.setTitle("Разрешить", for: .normal)
			cameraButton.addTarget(self, action: #selector(askToReconsiderRestrictionForCamera), for: .touchUpInside)
			}
		case .notDetermined: do {
			cameraLabel.text = "Чтобы распознать счет,\nразрешите приложению\nдоступ к камере"
			cameraButton.setTitle("Разрешить", for: .normal)
			cameraButton.addTarget(self, action: #selector(askPermissionForCamera), for: .touchUpInside)
			}
		case .denied: do {
			cameraLabel.text = "Чтобы распознать счет,\nразрешите приложению\nдоступ к камере"
			cameraButton.setTitle("Разрешить", for: .normal)
			cameraButton.addTarget(self, action: #selector(askToReconsiderRestrictionForCamera), for: .touchUpInside)
			}
		case .authorized: do {
			cameraLabel.text = "Нажмите, чтобы открыть камеру\nи распознать счет"
			cameraButton.setTitle("Открыть камеру 📷", for: .normal)
			cameraButton.setTitle("Открыть камеру 📸", for: .highlighted)
			cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
			}
		}
	}
	
	@objc
	func askToReconsiderRestrictionForCamera() {
		let alert = UIAlertController(title: nil, message: "Чтобы разрешить доступ к камере\nперейдите в настройки", preferredStyle: .actionSheet)
		let act = UIAlertAction(title: "В Настройки", style: .default) { (action) in
			UIApplication.shared.open(NSURL(string: UIApplicationOpenSettingsURLString)! as URL, options: [:], completionHandler: nil)
		}
		let cancel = UIAlertAction(title: "Отмена", style: .cancel)
		alert.addAction(act)
		alert.addAction(cancel)
	}
	
	@objc
	func askPermissionForCamera() {
		AVCaptureDevice.requestAccess(for: .video) { (granted) in
			if granted { self.openCamera() }
		}
	}
}


private extension SLVCameraGreetingVC {
	
	private static let labelHorisontalOffset = CGFloat(55)
	private static let buttonHorisontalOffset = CGFloat(100)
	private static let buttonHeight = CGFloat(60)
	private static let labelToButton = CGFloat(17)
	
	func addConstraints() {
		let labelOffset = SLVCameraGreetingVC.labelHorisontalOffset
		let buttonOffset = SLVCameraGreetingVC.buttonHorisontalOffset
		let buttonHeight = SLVCameraGreetingVC.buttonHeight
		let labelToButton = SLVCameraGreetingVC.labelToButton

		cameraLabel.translatesAutoresizingMaskIntoConstraints = false
		cameraLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		cameraLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelOffset).isActive = true
		cameraLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -labelOffset).isActive = true
		cameraLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35).isActive = true
		cameraLabel.bottomAnchor.constraint(equalTo: cameraButton.topAnchor, constant: -labelToButton).isActive = true
		cameraLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
		
		cameraButton.translatesAutoresizingMaskIntoConstraints = false
		cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		cameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonOffset).isActive = true
		cameraButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonOffset).isActive = true
		cameraButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
		
		libryaryLabel.translatesAutoresizingMaskIntoConstraints = false
		libryaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		libryaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelOffset).isActive = true
		libryaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -labelOffset).isActive = true
		libryaryLabel.topAnchor.constraint(equalTo: cameraButton.layoutMarginsGuide.bottomAnchor, constant: 80).isActive = true
		libryaryLabel.bottomAnchor.constraint(equalTo: libryaryButton.topAnchor, constant: -labelToButton).isActive = true
		libryaryLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true

		libryaryButton.translatesAutoresizingMaskIntoConstraints = false
		libryaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		libryaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: buttonOffset).isActive = true
		libryaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -buttonOffset).isActive = true
		libryaryButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
		libryaryButton.bottomAnchor.constraint(equalTo: manuallyButton.topAnchor, constant: 68)
		
		manuallyButton.translatesAutoresizingMaskIntoConstraints = false
		manuallyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		manuallyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelOffset).isActive = true
		manuallyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -labelOffset).isActive = true
		manuallyButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
		manuallyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
	}
}
