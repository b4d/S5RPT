//
//  MapOptionsViewController.h
//  S5RPT
//
//  Created by Deni Bacic on 6. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MapOptionsViewControllerDelegate <NSObject>
- (void)didCompleteOptionsSelection:(id)sender;
@end


@interface MapOptionsViewController : UIViewController {
@private
    __weak id <MapOptionsViewControllerDelegate> _delegate;
    __weak UISegmentedControl *_mapTypeSegmentedControl;
    __weak UISegmentedControl *_bandTypeSegmentedControl;
    
    NSInteger _selectedMapSegmentIndex;
    NSInteger _selectedBandSegmentIndex;
    
    
}
- (IBAction)changeMapType:(id)sender;
- (IBAction)changeBandType:(id)sender;

@property (weak, nonatomic) id <MapOptionsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bandTypeSegmentedControl;

- (void)setSelectedMapSegmentIndex:(NSInteger)index;
- (void)setSelectedBandSegmentIndex:(NSInteger)index;
- (IBAction)dismissOptions:(id)sender;

@end
