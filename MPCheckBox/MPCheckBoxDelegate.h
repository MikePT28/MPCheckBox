//
//  MPCheckBoxDelegate.h
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/5/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPCheckBox;

@protocol MPCheckBoxDelegate <NSObject>
typedef NS_ENUM(NSUInteger, kMPCheckBoxState);

/**
 *  Called whenever a checkbox state changes.
 *
 *  @param state
 *  @param checkBox 
 */
-(void)mpCheckBoxDidChangeState:(kMPCheckBoxState)state checkBox:(MPCheckBox*)checkBox;

@end
