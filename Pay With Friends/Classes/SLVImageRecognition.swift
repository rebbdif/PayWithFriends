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

// НАДО НЕ ЗАБЫТЬ ПРО ЧАЕВЫЕ
// буду сюда считывать
public class SLVItemDetailed: NSObject {
	var name: String
	var number: Int //количество. потом надо изменить массив так, чтобы везде стало единицей (повторить значения, где оно не 1)
	var price: Double
	var info: String
	var person: [String]
	
	init(name: String, number: Int, price: Double, info: String, person: [String]) {
		self.name = name
		self.number = number
		self.price = price
		self.info = info
		self.person = person
	}
	public override func isEqual(_ object: Any?) -> Bool {
		guard let second = object as? SLVItemDetailed else { return false }
		
		return second.name == self.name &&
		second.number == self.number &&
		second.price == self.price &&
		second.info == self.info &&
		second.person == self.person
		
	}
	
}
