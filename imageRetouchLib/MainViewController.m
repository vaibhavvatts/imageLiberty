//
//  MainViewController.m
//  imageRetouchLib
//
//  Created by Vaibhav Kumar on 03/03/15.
//  Copyright (c) 2015 OSS. All rights reserved.
//

#define screenSize [UIScreen mainScreen].bounds

#import "MainViewController.h"

@interface MainViewController ()
{
    CGRect filterRect;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filters;
@property (weak, nonatomic) IBOutlet UIImageView *imgTouchable;
@property (weak, nonatomic) IBOutlet UIView *viewFilterPanel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.



}

-(void)viewWillAppear:(BOOL)animated
{
    // - http://stackoverflow.com/questions/13446920/how-can-i-get-a-views-current-width-and-height-when-using-autolayout-constraint
    [self.view layoutIfNeeded];
    //[self.view setNeedsLayout];
    [self FilterViewAppearence];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - appearence

-(void)FilterViewAppearence
{
    // get initial position
    filterRect = self.viewFilterPanel.frame;

    // - http://stackoverflow.com/questions/14204082/where-to-set-translatesautoresizingmaskintoconstraints-in-xcode-4-5
    [self.viewFilterPanel setTranslatesAutoresizingMaskIntoConstraints:YES];

    CGRect startUpFrame = filterRect;
    startUpFrame.origin.y = screenSize.size.height;
    self.viewFilterPanel.frame = startUpFrame;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Actions
- (IBAction)btnSelectImage:(UIBarButtonItem *)sender {
}

- (IBAction)btnFilters:(id)sender {
    self.viewFilterPanel.frame = filterRect;
}

@end
