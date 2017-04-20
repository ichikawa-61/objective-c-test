//
//  ViewController.h
//  Calendar
//
//  Created by Manami Ichikawa on 4/10/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarLogic.h"

@interface CalendarViewController : UIViewController<UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)goToNextMonth:(id)sender;
- (IBAction)goToLastMonth:(id)sender;

@end

