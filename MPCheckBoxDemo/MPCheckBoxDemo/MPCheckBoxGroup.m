//
//  MPCheckBoxGroup.m
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import "MPCheckBoxGroup.h"
#import "MPCheckBox.h"
#import "MPCheckBoxDelegate.h"

@interface MPCheckBoxGroup() <MPCheckBoxDelegate>

@property (nonatomic, strong) NSArray* checkBoxes;

@end

@implementation MPCheckBoxGroup

-(instancetype)initWithCheckBoxes:(NSArray*)checkBoxes{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.checkBoxes = checkBoxes;
    [self claimCheckBoxesDelegation];
    
    return self;
}

-(void)setCheckBoxes:(NSArray *)checkBoxes{
    _checkBoxes = checkBoxes;
    [self claimCheckBoxesDelegation];
}

#pragma mark - Private Methods

-(void)claimCheckBoxesDelegation{
    
    [self.checkBoxes enumerateObjectsUsingBlock:^(MPCheckBox* obj, NSUInteger idx, BOOL *stop) {
        [obj setDelegate:self];
        if (!obj.identifier || [obj.identifier isEqualToString:@""]) {
            obj.identifier = [NSString stringWithFormat:@"%i", (int)idx];
        }
    }];
    
}


#pragma mark - MPCheckBox Delegate
-(void)mpCheckBoxDidChangeState:(kMPCheckBoxState)state checkBox:(MPCheckBox *)checkBox{
    
    MPCheckBox* previousCheckBox = _selectedCheckBox;
    
    _selectedCheckBox = (checkBox.state)? checkBox : nil;
    
    [self.checkBoxes enumerateObjectsUsingBlock:^(MPCheckBox* obj, NSUInteger idx, BOOL *stop) {
        if (![obj isEqual:_selectedCheckBox]) {
            [obj setState:kMPCheckBoxStateUnchecked animated:YES notifyDelegate:NO];
        }
    }];
    
    
    [_delegate mpCheckBoxGroupDidChangeSelectedCheckBox:_selectedCheckBox
                               previousSelectedCheckBox:previousCheckBox
                                        groupIdentifier:_identifier];
}

@end
