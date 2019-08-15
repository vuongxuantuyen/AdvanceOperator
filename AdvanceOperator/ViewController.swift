//
//  ViewController.swift
//  AdvanceOperator
//
//  Created by goat_herd on 8/15/19.
//  Copyright © 2019 goat_herd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBitwise()
        testSophuc()
    }

    func testBitwise() {
        let a: UInt8 = 0b11010110
//        let result = ~a
        let result = a << 2
        result.showBitString()
    }
    
    func testSophuc() {
        var a = SoPhuc(phanThuc: 1, phanAo: 2)
        let b = SoPhuc(phanThuc: 1, phanAo: 3)
        print(a + b)
        print(-a)
        print (a == b)
        a++
        print(a)
    }

}
extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return "0b" + binaryString
    }
    
    func showBitString() {
        print(binaryDescription)
    }
}
infix operator +-+: AdditionPrecedence
struct SoPhuc {
    var phanThuc = 0, phanAo = 0
    
    static func + (left: SoPhuc, right: SoPhuc) -> SoPhuc {
        return SoPhuc(phanThuc: left.phanThuc + right.phanThuc, phanAo: left.phanAo + right.phanAo)
    }
    
    static prefix func - (soPhuc: SoPhuc) -> SoPhuc {
        return SoPhuc(phanThuc: -soPhuc.phanThuc, phanAo: -soPhuc.phanAo)
    }
    
    static func == (left: SoPhuc, right: SoPhuc) -> Bool {
        return left.phanThuc == right.phanThuc && left.phanAo == right.phanAo
    }
    
    static postfix func ++ (value: inout SoPhuc) {
        value.phanThuc += 1
    }
    
    static func +-+ (left: SoPhuc, right: SoPhuc) -> SoPhuc {
        return left
    }
}
