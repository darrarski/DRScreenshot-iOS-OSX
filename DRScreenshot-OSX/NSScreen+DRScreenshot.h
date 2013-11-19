//
//  NSScreen+DRScreenshot.h
//  DRScreenshot
//
//  Created by Dariusz Rybicki on 19.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSScreen (DRScreenshot)

/**
 Captures screenshot of the screen
 
 @reutrn Screenshot image
 */
- (NSImage *)DRScreenshot_image;

@end
