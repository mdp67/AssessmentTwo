//
//  ViewController.m
//  AssessmentSecondWeek
//
//  Created by Mark Porcella on 5/22/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "RootViewController.h"
#import "CityTableViewCell.h"
#import "City.h"
#import "CityDetailViewController.h"



@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, CityDetailViewControllerDelegate>


@property BOOL inEditMode;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *cities;



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    City *coloradoSprings = [City new];
    City *denver = [City new];
    City *phoenix = [City new];
    City *portland = [City new];

    coloradoSprings.cityName = @"Colorado Springs";
    coloradoSprings.state = @"CO";
    coloradoSprings.cityURL = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Colorado_Springs,_Colorado"];
    coloradoSprings.cityImage = [UIImage imageNamed:@"coloradoSpringPicture"];
    denver.cityName = @"Denver";
    denver.state = @"Colorado";
    denver.cityURL = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Denver"];
    denver.cityImage = [UIImage imageNamed:@"denverPicture"];
    phoenix.cityName = @"Phoenix";
    phoenix.state = @"Arizona";
    phoenix.cityURL = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Phoenix"];
    phoenix.cityImage = [UIImage imageNamed:@"phoenixPicture"];
    portland.cityName = @"Portland";
    portland.state = @"Oregon";
    portland.cityURL = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Portland"];
    portland.cityImage = [UIImage imageNamed:@"portlandPicture"];

    self.cities = [NSMutableArray arrayWithObjects:coloradoSprings, denver, phoenix, portland, nil];

}
- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if (!self.inEditMode) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.tableView setEditing:YES animated:YES];
        self.inEditMode = YES;
    } else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.tableView setEditing:NO animated:YES];
        self.inEditMode = NO;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.cityNameLabel.text = city.cityName;
    cell.cityStateNameLabel.text = city.state;
    cell.cellImage.image = city.cityImage;
    return cell;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [self.cities removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView reloadData];
    }
}


- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)cityDetailViewController:(UIViewController *)viewController cityName:(NSString *)cityName {
    self.title = cityName;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cities count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CityDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.city = [self.cities objectAtIndex:indexPath.row];
    vc.delegate = self;
}























@end
