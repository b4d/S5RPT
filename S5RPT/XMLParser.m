//
//  XMLParser.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "XMLParser.h"
#import "S5RPTAppDelegate.h"


@implementation XMLParser


- (XMLParser *) initXMLParser {
	
	self = [super init];
	
	appDelegate = (S5RPTAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"SenSet"]) {
		appDelegate.repeaters = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"Entry"]) {
		aRepeater = [[Repeater alloc] init];
		aRepeater.ID = [attributeDict objectForKey:@"ID"];
		
		//NSLog(@"Reading id value :%i", aSensor.ID);
	}
	
	//NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
	else 
		[currentElementValue appendString:[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
	NSLog(@"Processing Value: %@", currentElementValue);

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"val:Root"])
		return;
	
	if([elementName isEqualToString:@"Entry"]) {
		[appDelegate.repeaters addObject:aRepeater];
		aRepeater = nil;
	}
	else 
		[aRepeater setValue:currentElementValue forKey:elementName];

	currentElementValue = nil;
}



@end
