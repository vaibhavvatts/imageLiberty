//
//  SelectImage.m
//  imageRetouchLib
//
//  Created by Vaibhav Kumar on 07/03/15.
//  Copyright (c) 2015 OSS. All rights reserved.
//

#import "SelectImage.h"
#import "UIButton+buttonCategory.h"
#import "MainViewController.h"

@interface SelectImage ()<UIImagePickerControllerDelegate>
{
    __weak IBOutlet UIButton *btnLibrary;
    __weak IBOutlet UIButton *btnPicasa;
    __weak IBOutlet UIView *viewImg;
    __weak IBOutlet UIButton *btnFacebok;

    __weak UIImage *imgFromSource;
    __weak MainViewController * refMain;
}

@end

@implementation SelectImage


-(void)receiveRef:(id)ref
{
    refMain = ref;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [UIButton setButtonLayer:btnLibrary];
    [UIButton setButtonLayer:btnFacebok];
    [UIButton setButtonLayer:btnPicasa];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegates

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [viewImg setBackgroundColor:[UIColor colorWithPatternImage:image]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{

}

#pragma mark - Action methods

- (IBAction)btnLibraryPics:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = (id)self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)btnFacebookPics:(UIButton *)sender {
    
}


- (IBAction)btnDone:(UIButton *)sender {
    refMain.blockGetImage = (id)imgFromSource;
}


@end
