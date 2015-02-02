/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZAppDelegate.h"
#import "YZLibraryImportAll.h"

@implementation YZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self.window yz_preloadKeyboard];
	
	YZLimitedArray *arr = [[YZLimitedArray alloc] initWithCapacity:20 uniqueElements:YES];
	arr.insertMode = YZLimitedArrayInsertModeHead;
	arr.stopsInsertingWhenFull = false;
	
	for (int i = 0; i < 100; i ++) {
		[arr addObject:[NSString yz_stringFromInt:i%10]];

		NSLog(@"%@", [arr.array componentsJoinedByString:@","]);
		
	}
	
	NSLog(@"%@", [NSString yz_stringFromBool:[@"" yz_isValidEmail]]);
	NSLog(@"%@", [NSString yz_stringFromBool:[@"ahtathat" yz_isValidEmail]]);
	NSLog(@"%@", [NSString yz_stringFromBool:[@"anhtnteh@enne.cm" yz_isValidEmail]]);
	NSLog(@"%@", [NSString yz_stringFromBool:[@"athnatheo@ne" yz_isValidEmail]]);
	NSLog(@"%@", [NSString yz_stringFromBool:[@"athnoeo@eeee.mcesacon" yz_isValidEmail]]);
	
	NSString *string = @"Happily, Objective-C associated  objects come to the rescue.  For example, to add a descriptiveName property to  all the view controllers in a project,  we simply add a computed property  using objc_get/setAssociatedObject() in the backing  get and set blocks:  extension UIViewController { private struct AssociatedKeys  { static var DescriptiveName =  nsh_DescriptiveName} var descriptiveName:  String? { get { return objc_getAssociatedObject(self,  &AssociatedKeys.DescriptiveName) as? String";
	NSArray *demoStrings = [string componentsSeparatedByString:@"  "];

	
	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_stringByRemovingNonAlphanumericCharacters]);
	}
	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_stringByRemovingNonAlphanumericCharactersKeepSpaces:YES]);
	}
	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_humanReadableString]);
	}
	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_camelCaseString]);
	}
	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_underscoreCaseString]);
	}
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
