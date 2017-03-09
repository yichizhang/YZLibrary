//
//  Copyright (c) 2017-present, Yichi Zhang.
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

import Quick
import Nimble

private extension String {
  func compare(version: String) -> ComparisonResult {
    return (self as NSString).yz_compare(toVersion: version)
  }
}

private let asc = ComparisonResult.orderedAscending
private let same = ComparisonResult.orderedSame
private let dec =  ComparisonResult.orderedDescending

class VersionComparisonSpec: QuickSpec {
  override func spec() {
    describe("eq len") {
      it("asc") {
        expect("0.1".compare(version: "0.2")).to(equal(asc))
        expect("7".compare(version: "8")).to(equal(asc))
      }
      it("eq") {
        expect("0.2".compare(version: "0.2")).to(equal(same))
        expect("9.0".compare(version: "9.0")).to(equal(same))
      }
      it("dec") {
        expect("0.3".compare(version: "0.2")).to(equal(dec))
        expect("30".compare(version: "20")).to(equal(dec))
      }
    }
    
    describe("diff len 1") {
      it("asc") {
        expect("0.1".compare(version: "0.2.2")).to(equal(asc))
        expect("8000.88".compare(version: "8001.01.99")).to(equal(asc))
      }
      it("dec") {
        expect("0.3".compare(version: "0.2.2")).to(equal(dec))
        expect("2017.01".compare(version: "2016.12.31")).to(equal(dec))
      }
    }
    
    describe("diff len 2") {
      it("asc") {
        expect("0.0.1".compare(version: "0.2")).to(equal(asc))
        expect("9532.231.45".compare(version: "10000.1")).to(equal(asc))
      }
      it("dec") {
        expect("0.3.0".compare(version: "0.2")).to(equal(dec))
        expect("2017.01.01".compare(version: "2016.12")).to(equal(dec))
      }
    }
    
    describe("other") {
      it("eq") {
        expect("0".compare(version: "0.0")).to(equal(same))
        expect("".compare(version: "0.0.0.0")).to(equal(same))
        expect("0.0.0".compare(version: "")).to(equal(same))
      }
    }
  }
}
