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

-(void)mpCheckBoxDidChangeState:(kMPCheckBoxState)state checkBox:(MPCheckBox*)checkBox;

@end
