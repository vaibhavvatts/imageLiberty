//
//  SelectImage.h
//  imageRetouchLib
//
//  Created by Vaibhav Kumar on 07/03/15.
//  Copyright (c) 2015 OSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectImage : UIViewController

-(void)receiveRef:(id)ref;

@property (nonatomic, copy) void (^blockGetImage)(UIImage *);
@end
