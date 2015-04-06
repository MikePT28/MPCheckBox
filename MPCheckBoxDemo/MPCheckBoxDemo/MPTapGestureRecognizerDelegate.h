//
//  MPTapGestureRecognizerDelegate.h
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UITapGestureRecognizer;

@protocol MPTapGestureRecognizerDelegate <NSObject>

@optional
-(void)mpTapGestureStateChanged:(UIGestureRecognizerState)state;

@end
