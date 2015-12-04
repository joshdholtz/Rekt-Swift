//
//  RektTests.swift
//  RektTests
//
//  Created by Josh Holtz on 12/4/15.
//  Copyright © 2015 RokkinCat. All rights reserved.
//

import XCTest
@testable import Rekt

class RektTests: XCTestCase {
	
	let testRect = CGRect(x: 10, y: 5, width: 200, height: 100)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAlterAllInout() {
		let rect = CGRectZero.alter({ (x, y, width, height) -> Void in
			x += 10
			y += 5
			width = 200
			height = 100
			return
		})
		
		assert(rect == testRect)
    }
	
	func testAlterAll() {
		let rect = CGRectZero.alter { (x, y, width, height) -> Rekt in
			(x+10,y+5,200,100)
		}
		
		assert(rect == testRect)
	}
	
	func testAlterIndividual() {
		let rect = CGRectZero.alterX({$0+10})
			.alterY({$0+5})
			.alterWidth({$0+200})
			.alterHeight({$0+100})
		
		assert(rect == testRect)
	}
	
	func testAlterIndividualValue() {
		let rect = CGRectZero.alterX(10)
			.alterY(5)
			.alterWidth(200)
			.alterHeight(100)
		
		assert(rect == testRect)
	}
	
}
