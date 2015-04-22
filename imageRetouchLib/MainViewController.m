//
//  MainViewController.m
//  imageRetouchLib
//
//  Created by Vaibhav Kumar on 03/03/15.
//  Copyright (c) 2015 OSS. All rights reserved.
//

#define screenSize [UIScreen mainScreen].bounds

#import "MainViewController.h"
#import "SelectImage.h"

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

    [self appearences];
    // get initial position
    filterRect = self.viewFilterPanel.frame;
    [self hideFilter];

}

-(void)viewWillAppear:(BOOL)animated
{
//    // - http://stackoverflow.com/questions/13446920/how-can-i-get-a-views-current-width-and-height-when-using-autolayout-constraint
//    [self.view layoutIfNeeded];
//    //[self.view setNeedsLayout];
//    [self FilterViewAppearence];


    if(self.blockGetImage != nil)
    {
        self.imgTouchable.image = self.blockGetImage;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - appearence

-(void)appearences
{
    // filterView

    self.viewFilterPanel.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viewFilterPanel.layer.shadowOpacity  = 0.7;
    self.viewFilterPanel.layer.shadowOffset = CGSizeMake(0, 5);
    self.viewFilterPanel.layer.shadowRadius = 5;
    self.viewFilterPanel.layer.borderWidth = .2;
    self.viewFilterPanel.layer.borderColor = [UIColor grayColor].CGColor;
    self.viewFilterPanel.layer.cornerRadius = 4;
}

-(void)hideFilter
{
    //    // - http://stackoverflow.com/questions/14204082/where-to-set-translatesautoresizingmaskintoconstraints-in-xcode-4-5
    //    [self.viewFilterPanel setTranslatesAutoresizingMaskIntoConstraints:YES];

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


- (IBAction)btnSelectImage:(id)sender {
    [self performSegueWithIdentifier:@"selectImage" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"selectImage"])
    {
         SelectImage *selectImage = [segue destinationViewController];
        [selectImage receiveRef:self];
     //   selectImage.blockGetImage = _blockGetImage;
        selectImage.blockGetImage = ^UIImage *(){
            NSLog(@"call");
            return _blockGetImage;
        };
    }
}

- (IBAction)btnFilters:(id)sender {
    static BOOL isFilterViewVisible = NO;

    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        if (isFilterViewVisible) {
            [self hideFilter];
        }
        else
        {
            self.viewFilterPanel.frame = filterRect;
        }
    } completion:^(BOOL finished) {
        isFilterViewVisible = !isFilterViewVisible;
    }];
}

@end
