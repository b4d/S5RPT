//
//  XMLParser.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>
#import "Repeater.h"

@class S5RPTAppDelegate;

@interface XMLParser : NSObject <NSXMLParserDelegate> {

	NSMutableString *currentElementValue;
	
	S5RPTAppDelegate *appDelegate;
	Repeater *aRepeater;
}

- (XMLParser *) initXMLParser;

@end
