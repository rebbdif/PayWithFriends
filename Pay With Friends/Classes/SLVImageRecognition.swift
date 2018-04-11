//
//  SLVImageRecognition.swift
//  Pay With Friends
//
//  Created by Леонид Серебряный on 10/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import UIKit
import CoreML
import Vision

/// Класс, занимающийся распознаванием изображений
class SLVImageRecognition: NSObject {

	/// Кусок кода, который вызовется по окончании обработки картинок
	typealias ImageRecognitionCompletion = (_ result: [SLVItem]) -> Void

	
	/// Функция, распознающая чек и отдающая массив
	/// элементов чека. При этом, если элемент встречается два
	/// раза, массив должен содержать этот элемент два раза
	///
	/// - Parameters:
	///   - image: Картинка, которую распознаем
	///   - completion: Кусок кода, который вызовется по окончании обработки картинок
	public func recogniseImage(_ image:UIImage!, completion: ImageRecognitionCompletion? ){
		let result = [SLVItem]()
		// вот сюда приделывай вызовы CoreML и тд.
		
		if completion != nil {completion!(result)}
	}
}
