//
//  MPCheckBoxGroup.h
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPCheckBoxGroupDelegate.h"
@class MPCheckBox;

@interface MPCheckBoxGroup : NSObject

/**
 *  CheckBoxGroup Delegate. Gives access to the delegate methods.
 */
@property (strong, nonatomic) id<MPCheckBoxGroupDelegate> delegate;

/**
 *  Current selected checkbox. Can be nil if no checkbox is selected.
 */
@property (nonatomic, strong, readonly) MPCheckBox* selectedCheckBox;

/**
 *  NSString to identify the checkboxgroup.
 */
@property (nonatomic, strong) NSString* identifier;

/**
 *  Init with an array of CheckBoxes.
 *
 *  @param checkBoxes
 *
 *  @return MPCheckBoxGroup
 */
-(instancetype)initWithCheckBoxes:(NSArray*)checkBoxes;

/**
 *  Set the checkboxes that belong to the group.
 *
 *  @param checkBoxes 
 */
-(void)setCheckBoxes:(NSArray *)checkBoxes;

@end
