//
//  MPCheckButton.h
//  CheckButton
//
//  Created by Mike Pesate on 4/3/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCheckBoxDelegate.h"

/**
 Posible CheckBox's states.
 */
typedef NS_ENUM(NSUInteger, kMPCheckBoxState)
{
    kMPCheckBoxStateUnchecked,
    kMPCheckBoxStateChecked
};

IB_DESIGNABLE
@interface MPCheckBox : UIControl

/**
 *  CheckBox Delegate property. Gives access to delegate methods.
 */
@property (strong, nonatomic) id<MPCheckBoxDelegate> delegate;

/**
 *  CheckBox State property (READ-ONLY). Initial state is always kMPCheckButtonStateUnchecked
 */
@property (nonatomic, readonly) kMPCheckBoxState checkState;

/**
 *  NSString to identify the checkbox. You are to make sure that no two check boxes have the same identifier.
 *  Can be assigned from the IBuilder.
 */
@property (strong, nonatomic) IBInspectable NSString* identifier;

/**
 *  Define the initial state or change it manually
 *
 *  @param state
 *  @param animated
 */
-(void)setState:(kMPCheckBoxState)state animated:(BOOL)animated;

/**
 *  Define the initial state or change it manually. Decide if delegate should be notified about the change.
 *
 *  @param state
 *  @param animated
 *  @param notify
 */
-(void)setState:(kMPCheckBoxState)state animated:(BOOL)animated notifyDelegate:(BOOL)notify;

/**
 *  Change the CheckBox's state to the opposite one
 *
 *  @param animated
 */
-(void)toggleState:(BOOL)animated;

/**
 *  Make the CheckBox's companion view also interactable
 *
 *  @param supportLabel
 */
-(void)setCompanionView:(UIView *)companionView;

/**
 *  Defines de color for the border. Default is black.
 *
 *  @param color
 */
-(void)setBorderColor:(UIColor*)color;

/**
 *  Defines de color for the check. Default is black.
 *
 *  @param color
 */
-(void)setCheckColor:(UIColor*)color;

/**
 *  Converts the CheckBox to a Circular CheckBox (Default is NO)
 *
 *  @param circular 
 */
-(void)setCircular:(BOOL)circular;

@end
