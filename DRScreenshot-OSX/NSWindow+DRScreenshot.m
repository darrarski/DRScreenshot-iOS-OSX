//
//  NSWindow+DRScreenshot.m
//  DRScreenshot
//
//  Created by Dariusz Rybicki on 19.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//

#import "NSWindow+DRScreenshot.h"

@implementation NSWindow (DRScreenshot)

- (NSImage *)DRScreenshot_imageBelowWindow
{
	CGRect windowRect = NSRectToCGRect(self.frame);
	return [self DRScreenshot_imageBelowWindowWithRect:windowRect];
}

- (NSImage *)DRScreenshot_imageBelowWindowWithRect:(NSRect)rect
{
	// Get the CGWindowID
	CGWindowID windowID = (CGWindowID)[self windowNumber];
	
	// Flip coordinates (from NS to CG coordinates)
	rect.origin.y = NSMaxY(self.screen.frame) - NSMaxY(rect);
	
	// Get a composite image of all the windows beneath the window
	CGImageRef capturedImage = CGWindowListCreateImage(rect, kCGWindowListOptionOnScreenBelowWindow, windowID, kCGWindowImageDefault);
	
	if(CGImageGetWidth(capturedImage) <= 1)
	{
		CGImageRelease(capturedImage);
		return nil;
	}
	
	// Create a bitmap rep from the window and convert to NSImage...
	NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithCGImage:capturedImage];
	NSImage *image = [[NSImage alloc] init];
	[image addRepresentation:bitmapRep];
	CGImageRelease(capturedImage);
	
	return image;
}

@end
