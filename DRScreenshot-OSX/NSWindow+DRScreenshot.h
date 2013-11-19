//
//  NSWindow+DRScreenshot.h
//  DRScreenshot
//
//  Created by Dariusz Rybicki on 19.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWindow (DRScreenshot)

/**
 Captures screenshot of everything rendered below the window
 
 @return Screenshot image
 */
- (NSImage *)DRScreenshot_imageBelowWindow;

/**
 Captures screenshot of everything rendered below the window constrained
 to given rect
 
 @param rect Rect for screenshot in screen coordinates
 @return Screenshot image
 */
- (NSImage *)DRScreenshot_imageBelowWindowWithRect:(NSRect)rect;

@end
