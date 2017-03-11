//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <XCTest/XCTest.h>
#import <YZLibrary/YZLibrary.h>

@interface TestObjectA : NSObject
@end
@implementation TestObjectA
- (NSString *)testMethodA { return @"1984"; }
@end

@interface TestObjectB : NSObject
@end
@implementation TestObjectB
- (NSString *)testMethodB { return @"2666"; }
@end

@interface NSObject_YZLibraryTests : XCTestCase

@end

@implementation NSObject_YZLibraryTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testPerformSelector
{
  id objA = [TestObjectA new];
  
  XCTAssertNoThrow([objA performSelector:@selector(testMethodA)]);
  XCTAssertNoThrow([objA yz_performSelectorIfResponds:@selector(testMethodA)]);
  XCTAssertEqualObjects([objA yz_performSelectorIfResponds:@selector(testMethodA)], @"1984");
  
  XCTAssertThrows([objA performSelector:@selector(testMethodB)]);
  XCTAssertNoThrow([objA yz_performSelectorIfResponds:@selector(testMethodB)]);
  XCTAssertNil([objA yz_performSelectorIfResponds:@selector(testMethodB)]);
}

@end
