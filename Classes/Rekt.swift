//
//  Rekt.swift
//  Rekt
//
//  Created by Josh Holtz on 12/4/15.
//  Copyright © 2015 RokkinCat. All rights reserved.
//

import UIKit

public typealias Rekt = (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)

extension CGRect {
	
	public typealias AlterAllInout = (inout x: CGFloat, inout y: CGFloat, inout width: CGFloat, inout height: CGFloat) -> Void
	public typealias AlterAll = (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Rekt
	public typealias Alter = (_: CGFloat) -> CGFloat
	
	public var x: CGFloat {
		return origin.x
	}
	
	public var y: CGFloat {
		return origin.x
	}
	
	private var rekt: Rekt {
		return (x,y,width,height)
	}
	
	public func alter(alter: AlterAllInout) -> CGRect {
		var (x,y,width,height) = rekt
		alter(x: &x, y: &y, width: &width, height: &height)
		return CGRect(x: x, y: y, width: width, height: height)
	}
	
	public func alter(alter: AlterAll) -> CGRect {
		var (x,y,width,height) = rekt
		(x,y,width,height) = alter(x: x, y: y, width: width, height: height)
		return CGRect(x: x, y: y, width: width, height: height)
	}
	
	public func alterX(value: CGFloat) -> CGRect {
		return alterX({_ in value})
	}
	
	public func alterX(alter: Alter) -> CGRect {
		return self.alter({ (x, y, width, height) -> Rekt in
			(alter(x), y, width, height)
		})
	}
	
	public func alterY(value: CGFloat) -> CGRect {
		return alterY({_ in value})
	}
	
	public func alterY(alter: Alter) -> CGRect {
		return self.alter({ (x, y, width, height) -> Rekt in
			(x, alter(y), width, height)
		})
	}
	
	public func alterWidth(value: CGFloat) -> CGRect {
		return alterWidth({_ in value})
	}
	
	public func alterWidth(alter: Alter) -> CGRect {
		return self.alter({ (x, y, width, height) -> Rekt in
			(x, y, alter(width), height)
		})
	}
	
	public func alterHeight(value: CGFloat) -> CGRect {
		return alterHeight({_ in value})
	}
	
	public func alterHeight(alter: Alter) -> CGRect {
		return self.alter({ (x, y, width, height) -> Rekt in
			(x, y, width, alter(height))
		})
	}
}