//
//  CityDetailViewController.h
//  AssessmentSecondWeek
//
//  Created by Mark Porcella on 5/22/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol  CityDetailViewControllerDelegate <NSObject>

- (void) cityDetailViewController:(UIViewController *)viewController cityName:(NSString *)cityName;

@end

@interface CityDetailViewController : UIViewController

@property id<CityDetailViewControllerDelegate> delegate;
@property City *city;

@end
