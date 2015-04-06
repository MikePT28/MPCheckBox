//
//  MPCheckBoxGroupDelegate.h
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MPCheckBox;

@protocol MPCheckBoxGroupDelegate <NSObject>

@optional
/**
 *  Called whenever the group selected checkbox changes.
 *
 *  @param checkBox   Can be nil if there's no selected checkbox.
 *  @param previousCheckBox Can be nil if there was no previous checkbox
 *  @param identifier
 */
-(void)mpCheckBoxGroupDidChangeSelectedCheckBox:(MPCheckBox*)checkBox previousSelectedCheckBox:(MPCheckBox*)previousCheckBox groupIdentifier:(NSString*)identifier;

@end
