//
//  CityTableViewCell.h
//  AssessmentSecondWeek
//
//  Created by Mark Porcella on 5/22/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityStateNameLabel;


@end
