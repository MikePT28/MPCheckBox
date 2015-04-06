//
//  ViewController.m
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/4/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import "ViewController.h"
#import "MPCheckBox.h"
#import "MPCheckBoxGroup.h"
#import "MPCheckBoxDelegate.h"

@interface ViewController () <MPCheckBoxDelegate, MPCheckBoxGroupDelegate>{
    
    //Square
    __weak IBOutlet UIView *squareView;
    __weak IBOutlet UILabel *squareLabel;
    __weak IBOutlet MPCheckBox *squareCheckBox;
    
    //Circular
    __weak IBOutlet UIView *circularView;
    __weak IBOutlet UILabel *circularLabel;
    __weak IBOutlet MPCheckBox *circularCheckBox;
    
    
    //Disabled
    __weak IBOutlet UIView *disabledView;
    __weak IBOutlet MPCheckBox *disabledSquare;
    __weak IBOutlet MPCheckBox *disabledSquareChecked;
    __weak IBOutlet MPCheckBox *disabledCircular;
    __weak IBOutlet MPCheckBox *disabledCircularChecked;
    
    //Group
    __weak IBOutlet UIView *groupView;
    __weak IBOutlet UILabel *groupLabel;
    __weak IBOutlet MPCheckBox *leftmostCheckBox;
    __weak IBOutlet MPCheckBox *leftCheckBox;
    __weak IBOutlet MPCheckBox *rightCheckBox;
    __weak IBOutlet MPCheckBox *rightmostCheckBox;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor* color = [UIColor colorWithRed:1.f green:1.f blue:1.f alpha:.5f];
    
    //Square
    [squareView setBackgroundColor:color];
    
    [squareCheckBox setCompanionView:squareLabel];
    [squareCheckBox setDelegate:self];
    
    //Circular
    [circularView setBackgroundColor:color];
    [circularCheckBox setDelegate:self];
    [circularCheckBox setCompanionView:circularLabel];
    [circularCheckBox setState:kMPCheckBoxStateChecked animated:NO];
    [circularCheckBox setCircular:YES];

    //Disabled
    [disabledView setBackgroundColor:color];
    
    [disabledSquare setEnabled:NO];
    [disabledSquareChecked setState:kMPCheckBoxStateChecked animated:NO];
    [disabledSquareChecked setEnabled:NO];
    
    [disabledCircular setEnabled:NO];
    [disabledCircular setCircular:YES];
    [disabledCircularChecked setState:kMPCheckBoxStateChecked animated:NO];
    [disabledCircularChecked setEnabled:NO];
    [disabledCircularChecked setCircular:YES];
    
    //Group
    [groupView setBackgroundColor:color];
    
    NSArray* checkBoxes = @[leftmostCheckBox, leftCheckBox, rightCheckBox, rightmostCheckBox];
    
//    MPCheckBoxGroup* checkBoxGroup = [[MPCheckBoxGroup alloc] initWithCheckBoxes:checkBoxes];
//    [checkBoxGroup setDelegate:self];
//    [checkBoxGroup setIdentifier:@"group"];
    
    MPCheckBoxGroup* checkBoxGroup = [[MPCheckBoxGroup alloc] init];
    [checkBoxGroup setCheckBoxes:checkBoxes];
    [checkBoxGroup setDelegate:self];
    [checkBoxGroup setIdentifier:@"group"];
    
    
    CAGradientLayer* gradient = [CAGradientLayer layer];
    [gradient setFrame:self.view.frame];
    [gradient setColors:@[ (id)[UIColor colorWithRed:1.f green:0.f blue:0.f alpha:.7f].CGColor,
                           (id)[UIColor colorWithRed:1.0 green:.5f blue:0.f alpha:0.8f].CGColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - MPCheckBox Delegate
-(void)mpCheckBoxDidChangeState:(kMPCheckBoxState)state checkBox:(MPCheckBox *)checkBox{
    
    UILabel* companionLabel = circularLabel;
    if ([checkBox isEqual:squareCheckBox]) {
        companionLabel = squareLabel;
    }
    
    
    [companionLabel setText:(state)? @"Checked" : @"Unchecked"];
    [companionLabel sizeToFit];
    
}

#pragma mark - MPCheckBoxGroup Delegate
-(void)mpCheckBoxGroupDidChangeSelectedCheckBox:(MPCheckBox *)checkBox previousSelectedCheckBox:(MPCheckBox *)previousCheckBox groupIdentifier:(NSString *)identifier{
    
    if (!checkBox) {
        [groupLabel setText:@"Non Selected"];
    } else {
        [groupLabel setText:checkBox.identifier];
    }
    
    [groupLabel sizeToFit];
    
}

@end
