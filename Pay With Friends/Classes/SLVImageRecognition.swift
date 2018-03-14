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

	/// Функция, распознающая чек и отдающая массив
	/// элементов чека. При этом, если элемент встречается два
	/// раза, массив должен содержать этот элемент два раза
	///
	/// - Parameter image: Картинка, которую распознаем
	/// - Returns: массив элементов чека
	public func recogniseImage(_ image:UIImage!) -> [SLVItem] {
		var result = [SLVItem]()
		// вот сюда приделывай вызовы CoreML и тд.
		// приделаю
		return result
	}
}
