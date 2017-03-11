//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZAppDelegate.h"
#import <YZLibrary/YZLibrary.h>

@implementation YZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self.window yz_preloadKeyboard];
	
	YZProcessInfo *info = [YZProcessInfo processInfo];
	
	NSLog(@"The version of current os: %@", info.operatingSystemVersionString);
	
	NSLog(@"Major version of current os: %li", (long)info.operatingSystemVersion.majorVersion);
	NSLog(@"Minor version of current os: %li", (long)info.operatingSystemVersion.minorVersion);
	NSLog(@"Patch version of current os: %li", (long)info.operatingSystemVersion.patchVersion);
	for (int i=0; i < 10; i++) {
		NSLog(@"Current os at least major version %i: %@",
			  i,
			  [NSString yz_stringFromBool: [info isOperatingSystemAtLeastMajorVersion:i]]
			  );
	}
	
	YZLimitedArray *arr = [[YZLimitedArray alloc] initWithCapacity:20 uniqueElements:YES];
	arr.insertMode = YZLimitedArrayInsertModeHead;
	arr.stopsInsertingWhenFull = false;
	
	for (int i = 0; i < 100; i ++) {
		[arr addObject:[NSString yz_stringFromInt:i%10]];
		
		NSLog(@"%@", [arr componentsJoinedByString:@","]);
	}
	
	NSArray *demoStrings =
  @[
	@"1984.8.8 Dingo Show",
	@"-Balsamic vinegar flavoured Vegemite-",
	@"Python's secrets1111 23 44",
	@"Objective-C coding convention",
	@"UIViewController Secrets",
	@"{Test failed}, AA 12345",
	@"Location: #23406A",
	@"Use `objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName)`",
	@"My email is - me@email.com",
	];

	NSLog(@" ");
	for (NSString* str in demoStrings){
		NSLog(@"%@", [str yz_humanReadableString]);
	}
	
	NSLog(@" "); NSLog(@" ");
	NSArray *a = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
	NSLog(@"%@", a);
	NSLog(@"%@", [a yz_shuffledArray]);
	
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
