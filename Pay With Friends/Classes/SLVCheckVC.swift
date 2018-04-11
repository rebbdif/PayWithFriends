//
//  SLVCheckVC.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 03/04/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit

class SLVCheckVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	var image: UIImage?
	let imageView = UIImageView()
	let imageRecognition = SLVImageRecognition()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		imageView.frame = view.frame
		imageView.contentMode = .scaleAspectFit
		
    }
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		image = info["UIImagePickerControllerEditedImage"] as? UIImage
		imageView.image = image
		picker.dismiss(animated: true, completion: nil)
		imageRecognition.recogniseImage(image) { (results) in
			self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		
	}


}
