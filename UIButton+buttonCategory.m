//
//  UIButton+buttonCategory.m
//  imageRetouchLib
//
//  Created by Vaibhav Kumar on 07/03/15.
//  Copyright (c) 2015 OSS. All rights reserved.
//

#import "UIButton+buttonCategory.h"

@implementation UIButton (buttonCategory)

+(void)setButtonLayer:(UIButton *)btn
{
    btn.layer.shadowColor = [UIColor grayColor].CGColor;
    btn.layer.shadowOpacity  = 0.4;
    btn.layer.shadowOffset = CGSizeMake(0, 2);
    btn.layer.shadowRadius = 1;
    btn.layer.borderWidth = .4;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.cornerRadius = 3;


    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    gradientLayer.frame = btn.bounds;
    gradientLayer.colors = [[NSArray alloc]initWithObjects:(id)[UIColor colorWithWhite:.5 alpha:.1].CGColor,(id)[UIColor colorWithWhite:.5 alpha:.3].CGColor, nil];
    [btn.layer insertSublayer:gradientLayer atIndex:0];
}
@end