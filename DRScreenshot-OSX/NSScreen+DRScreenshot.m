//
//  NSScreen+DRScreenshot.m
//  DRScreenshot
//
//  Created by Dariusz Rybicki on 19.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//

#import "NSScreen+DRScreenshot.h"

@implementation NSScreen (DRScreenshot)

- (NSImage *)DRScreenshot_image
{
	// Get display id
	NSDictionary* screenDictionary = [self deviceDescription];
	NSNumber* screenID = [screenDictionary objectForKey:@"NSScreenNumber"];
    CGDirectDisplayID displayID = [screenID unsignedIntValue];
	
	// Get a composite image of the screen
	CGImageRef capturedImage = CGDisplayCreateImage(displayID);
	
	if(CGImageGetWidth(capturedImage) <= 1)
	{
		CGImageRelease(capturedImage);
		return nil;
	}
	
	// Create a bitmap rep from the image and convert to NSImage...
	NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithCGImage:capturedImage];
	NSImage *image = [[NSImage alloc] init];
	[image addRepresentation:bitmapRep];
	CGImageRelease(capturedImage);
	
	return image;
}

@end
