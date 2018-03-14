//
//  Pay_With_FriendsTests.swift
//  Pay With FriendsTests
//
//  Created by Леонид Серебряный on 09/03/2018.
//  Copyright © 2018 Леонид Серебряный. All rights reserved.
//

import XCTest
@testable import Pay_With_Friends


/// Тесты на класс SLVImageRecognition
class SLVImageRecognitionTests: XCTestCase {
	
	/// Первый тест
    func testImageRecognition1() {
		
		/// Начальные условия
		let imageRecognition = SLVImageRecognition()
		let imageName = "check1"
		guard let image = UIImage(named: imageName) else {
			print("Нет картинки с таким именем")
			XCTFail()
			return
		}
		
		/// Вызов тестируемого метода
		let result = imageRecognition.recogniseImage(image)
		
		/// Проверка полученного результата
		print(result)
		
		///включи, чтобы проверять количество элементов
		let checkNumber = true
		if (checkNumber) {
			let expectedNumberOfElements = 4
			XCTAssertTrue(result.count == expectedNumberOfElements)
		}
		
		///включи, чтобы проверять точный результат
		let checkWithExpectedResult = true
		if (checkWithExpectedResult) {
			let expectedResult = [
				SLVItem(name: "сок", price: 70),
				SLVItem(name: "сок", price: 70),
				SLVItem(name: "картоха", price: 90),
				SLVItem(name: "суп", price: 87),
				]
			
			let equal = result.elementsEqual(expectedResult)
			XCTAssertTrue(equal)
		}
		
	}
	
	
}
