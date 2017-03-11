//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

import Quick
import Nimble

private func createData(with s: String) -> NSData {
  return s.data(using: .utf8) as! NSData
}

private func createData(bundle: Bundle, fileName: String, type: String) -> NSData? {
  if let path = bundle.path(forResource: fileName, ofType: type) {
    return NSData(contentsOfFile: path)
  }
  return nil
}

class MD5Spec: QuickSpec {
  override func spec() {
    describe("MD5 method") {
      var data: NSData?
      let bundle = Bundle(for: type(of: self))
      
      it("returns correct result for strings") {
        data = createData(with: "Alice in Wonderland")
        expect(data?.yz_MD5String()).to(equal("50e9fcc3911994a2f84eaf8c12c49b5b"))
      }
      
      it("returns correct result for a pdf file") {
        data = createData(bundle: bundle, fileName: "test_pdf", type: "pdf")
        expect(data?.yz_MD5String()).to(equal("61a72a52188553124e9bd01f63a6e1ca"))
      }
    }
  }
}
