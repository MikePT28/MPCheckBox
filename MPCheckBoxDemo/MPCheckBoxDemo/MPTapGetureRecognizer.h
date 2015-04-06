//
//  MPTapGetureRecognizer.h
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "MPTapGestureRecognizerDelegate.h"

@interface MPTapGetureRecognizer : UITapGestureRecognizer

@property (nonatomic) id<MPTapGestureRecognizerDelegate> mpDelegate;

@end
