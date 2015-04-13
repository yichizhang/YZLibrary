/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSString+YZLibrary.h"
#import "NSObject+YZLibrary.h"
#import "NSCharacterSet+YZLibrary.h"

@implementation NSString (YZLibrary)

- (BOOL)yz_isValidEmail{
	
	if([self length]==0){
		return NO;
	}
 
	NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
 
	NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
	NSUInteger regExMatches = [regEx numberOfMatchesInString:self options:0 range:[self yz_fullRange]];
 
	if (regExMatches == 0) {
		return NO;
	} else {
		return YES;
	}
}

- (NSRange)yz_fullRange{
	return NSMakeRange(0, self.length);
}

- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock {
	[self yz_findString:string options:options range:[self yz_fullRange] handlingBlock:handlingBlock];
}

- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options range:(NSRange)range handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock {
	
	NSInteger origStart = range.location;
	NSInteger origLength = range.length;
	NSInteger count = 0;
	while (range.location != NSNotFound) {
		range = [self rangeOfString:string options:options range:range];
		if (range.location != NSNotFound) {
			BOOL stop;
			handlingBlock(range, count, &stop);
			
			if (stop) {
				return;
			}
			
			NSUInteger newStart = range.location + range.length;
			range = NSMakeRange(newStart, origStart + origLength - newStart);
			
		}
	}
}

- (NSDate*)yz_dateFromString:(NSString*)dateFormat{
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = dateFormat;
	return [formatter dateFromString:self];
}

+ (NSString*)yz_stringFromBool:(BOOL)boolValue{
	
	return (boolValue ? @"true" : @"false");
	
}

+ (NSString *)yz_letterStringFromNumber1To26:(NSInteger)number{
	
	NSString* returnName = @"?";
	
	int asciiCodeOfCapitalA = 'A';
	
	char theChar;
	
	if (number>=1 && number<=26) {
		
		theChar = asciiCodeOfCapitalA + number - 1;
		returnName = [NSString stringWithFormat:@"%c", theChar];
		
	}
	
	return returnName;
}

+ (NSString*)yz_stringFromInt:(NSInteger)intNumber{
	
	return [NSString stringWithFormat:@"%i", intNumber];
}

- (BOOL)yz_isDigitsOnly
{
	NSCharacterSet* setOfNonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
	NSRange range = [self rangeOfCharacterFromSet: setOfNonDigits];
	return range.location == NSNotFound;
}

- (NSString*)yz_stringByRemovingNonAlphanumericCharacters{
	return [self yz_stringByRemovingNonAlphanumericCharactersKeepSpaces:NO];
}

- (NSString*)yz_stringByRemovingNonAlphanumericCharactersKeepSpaces:(BOOL)keepSpaces{
	NSMutableCharacterSet *set = [[NSCharacterSet alphanumericCharacterSet] mutableCopy];
	if (keepSpaces){
		[set addCharactersInString:@" "];
	}
	NSCharacterSet* setToRemove = [set invertedSet];
	
	NSString *joinByString = keepSpaces ? @" " : @"";
	return [[self componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:joinByString];
}

- (NSString*)yz_humanReadableString
{
	NSString *string = [self stringByReplacingOccurrencesOfString:@"_" withString:@" "];
	
	if( [string rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]].location != NSNotFound ){
		
		NSMutableString *tempString = [NSMutableString string];
		for (NSInteger i=0; i<string.length; i++){
			NSString *character = [string substringWithRange:NSMakeRange(i, 1)];
			if ([character rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]].location != NSNotFound) {
				[tempString appendString:@" "];
			}
			[tempString appendString:character];
		}
		return [tempString capitalizedString];
	}
	
	return [string capitalizedString];
}

- (NSString*)yz_underscoreCaseString{
	NSScanner *scanner = [NSScanner scannerWithString:self];
	NSMutableString *newString = [NSMutableString new];
	
	NSCharacterSet *lowercaseSet = [NSCharacterSet lowercaseLetterCharacterSet];
	NSCharacterSet *uppercaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
	NSCharacterSet *ignoreSet = [NSCharacterSet characterSetWithCharactersInString:@"\'\""];
	
	BOOL needToAppendUnderscore = NO;
	BOOL needToBeAppended = NO;
	
	while (scanner.scanLocation < scanner.string.length) {
		unichar currentChar = [scanner.string characterAtIndex:scanner.scanLocation];
		
		if ( [lowercaseSet characterIsMember:currentChar] ) {
			// A lowercase letter
			needToAppendUnderscore = NO;
			needToBeAppended = YES;
		} else if ( [uppercaseSet characterIsMember:currentChar] ) {
			// An uppercase letter
			needToAppendUnderscore = NO;
			needToBeAppended = YES;
		} else if ( [ignoreSet characterIsMember:currentChar] ) {
			// Symbols to be "ignored"
			needToAppendUnderscore = NO;
			needToBeAppended = NO;
		} else {
			// Symbols to be replaced with underscore
			needToAppendUnderscore = YES;
			needToBeAppended = NO;
		}
		
		if (needToAppendUnderscore) {
			[newString appendString:@"_"];
		}
		
		if (needToBeAppended) {
			NSString *charString = [[NSString stringWithFormat:@"%c", currentChar] lowercaseString];
			
			[newString appendString:charString];
		}
		
		scanner.scanLocation++;
	}
	
	return newString;
}

- (NSString*)yz_camelCaseString{
	NSArray *separatedString = [[[self yz_humanReadableString] yz_stringByRemovingNonAlphanumericCharactersKeepSpaces:YES] componentsSeparatedByString:@" "];
	NSString *string= [separatedString componentsJoinedByString:@""];
	
	if (self.length > 0){
		NSString *firstCharacter = [[string substringToIndex:1] lowercaseString];
		string = [string stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCharacter];
	}
	
	return string;
}

@end
