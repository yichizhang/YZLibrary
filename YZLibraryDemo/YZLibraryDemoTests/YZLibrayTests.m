//
//  Copyright (c) 2016 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

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

- (void)testCamelCaseAndUnderscoreCaseString {
	
	NSArray *testStrings =
	@[
	  @"1984.8.8 Dingo Show7b",
	  @"-Balsamic vinegar flavoured Vegemite-",
	  @"Python's secrets1111 23 44",
	  @"Objective-C coding convention",
	  @"UIViewController Secrets",
	  @"{Test failed}, AA 12345",
	  @"Location: #23406A",
	  @"Use `objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName)`",
	  @"my email is - me@email.com",
	  ];
	
	NSInteger index;
	
	NSArray *camelCaseExpectedStrings =
	@[
	  @"198488DingoShow7B",
	  @"BalsamicVinegarFlavouredVegemite",
	  @"PythonsSecrets11112344",
	  @"ObjectiveCCodingConvention",
	  @"UIViewControllerSecrets",
	  @"TestFailedAA12345",
	  @"Location23406A",
	  @"UseObjcGetAssociatedObjectSelfAssociatedKeysDescriptiveName",
	  @"myEmailIsMeEmailCom",
	  ];
	
	index = 0;
	for (NSString* expected in camelCaseExpectedStrings){
		NSString *actual = [testStrings[index] yz_camelCaseStringWithOptions:YZStringConversionRetainOriginalLetterCase];
		XCTAssertTrue([actual isEqualToString:expected],
					  @"Strings are not equal. Expected: `%@`, actual: `%@`", expected, actual);
		index++;
	}
	
	NSArray *underscoreCaseExpectedStrings =
	@[
	  @"1984_8_8_dingo_show_7_b",
	  @"balsamic_vinegar_flavoured_vegemite",
	  @"pythons_secrets_1111_23_44",
	  @"objective_c_coding_convention",
	  @"u_i_view_controller_secrets",
	  @"test_failed_a_a_12345",
	  @"location_23406_a",
	  @"use_objc_get_associated_object_self_associated_keys_descriptive_name",
	  @"my_email_is_me_email_com",
	  ];
	
	index = 0;
	for (NSString* expected in underscoreCaseExpectedStrings){
		NSString *actual = [testStrings[index] yz_underscoreCaseStringWithOptions:YZStringConversionNone];
		XCTAssertTrue([actual isEqualToString:expected],
					  @"Strings are not equal. Expected: `%@`, actual: `%@`", expected, actual);
		index++;
	}
}

@end
