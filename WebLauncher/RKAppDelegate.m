//
//  RKAppDelegate.m
//  WebLauncher
//
//  Created by Rob Keniger on 29/04/12.
//  Copyright (c) 2012 Big Bang Software Pty Ltd. 
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "RKAppDelegate.h"

@implementation RKAppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	//get the path to the html folder inside the app bundle
	NSString* htmlPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"html"];

	//get the files in the html folder
	NSError* error;
	NSFileManager* fm = [NSFileManager defaultManager];
	NSArray* content = [fm contentsOfDirectoryAtPath:htmlPath error:&error];
	if(!content)
	{
		NSLog(@"Could not read the html directory. Tried to find it here: %@\nThe error returned was: %@",htmlPath, error.localizedDescription);
	}
	else 
	{
		//try to find the path to an index page
		NSString* indexPath = nil;
		for(NSString* fileName in content)
		{
			if([[fileName stringByDeletingPathExtension] isEqualToString:@"index"])
			{
				indexPath = [htmlPath stringByAppendingPathComponent:fileName];
				break;
			}
		}
		
		if(!indexPath)
		{
			NSLog(@"Could not find the index page. Tried to find it in this folder: %@", htmlPath);
		}
		else 
		{
			//launch the file in Safari
			NSWorkspace* workspace = [NSWorkspace sharedWorkspace];
			[workspace openFile:indexPath withApplication:@"Safari" andDeactivate:YES];
		}
	}

	//quit the app
	[NSApp terminate:self];
}

@end
