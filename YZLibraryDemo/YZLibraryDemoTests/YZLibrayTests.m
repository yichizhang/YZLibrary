/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <XCTest/XCTest.h>
#import "YZLibraryImportAll.h"

@interface YZLibrayTests : XCTestCase

@end

@implementation YZLibrayTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsEmpty
{
	NSArray *a = @[];
	XCTAssertTrue(YZ_IS_EMPTY(a));
	
	NSArray *b = @[ @"" ];
	XCTAssertTrue(YZ_IS_EMPTY(b) == NO);
	
	NSArray *c = nil;
	XCTAssertTrue(YZ_IS_EMPTY(c));
	
	NSDictionary *d = @{};
	XCTAssertTrue(YZ_IS_EMPTY(d));
	
	NSString *e = @"";
	XCTAssertTrue(YZ_IS_EMPTY(e));
	
	NSString *f = nil;
	XCTAssertTrue(YZ_IS_EMPTY(f));
	
}

- (void)testEmailValidation {
	
	XCTAssertTrue([@"" yz_isValidEmail] == NO);
	XCTAssertTrue([@"myemail" yz_isValidEmail] == NO);
	XCTAssertTrue([@"me@email" yz_isValidEmail] == NO);
	XCTAssertTrue([@"me@email.c" yz_isValidEmail] == NO);
	
	XCTAssertTrue([@"me@email.com" yz_isValidEmail] == YES);
	XCTAssertTrue([@"me@e.co" yz_isValidEmail] == YES);
}

- (void)testCGRectWithCenterAndSize {
	
	CGRect rect;
	
	rect = YZ_CGRectWithCenterAndSize(160.f, 50.f, 40.f, 20.f);
	
	XCTAssertEqual(rect.origin.x, 140.f);
	XCTAssertEqual(rect.origin.y, 40.f);
	XCTAssertEqual(rect.size.width, 40.f);
	XCTAssertEqual(rect.size.height, 20.f);
	
	rect = YZ_CGRectWithCenterAndSize(40.f, 20.f, 120.f, 50.f);
	
	XCTAssertEqual(rect.origin.x, -20.f);
	XCTAssertEqual(rect.origin.y, -5.f);
	XCTAssertEqual(rect.size.width, 120.f);
	XCTAssertEqual(rect.size.height, 50.f);
}

@end
