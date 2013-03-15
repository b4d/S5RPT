//
//  S5RPTAppDelegate.h
//  S5RPT
//
//  Created by Deni Bacic on 1. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

/*
 
 Version 1.0.1:
    - New icon
    - Navigation bar color changed
    - Added repeater details view when user clicks on annotation
    
 TODO:
    - progress HUD on loading
 
 */



#import <UIKit/UIKit.h>

@interface S5RPTAppDelegate : UIResponder <UIApplicationDelegate> {
    NSMutableArray *repeaters;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *repeaters;

@end
