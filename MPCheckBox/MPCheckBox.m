//
//  MPCheckButton.m
//  CheckButton
//
//  Created by Mike Pesate on 4/3/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import "MPCheckBox.h"
#import "MPTapGetureRecognizer.h"
#import "MPTapGestureRecognizerDelegate.h"

@interface MPCheckBox() <MPTapGestureRecognizerDelegate>{
    
    UIView* innerView;
    
}

@property (nonatomic) BOOL animating;

@end

@implementation MPCheckBox

#pragma mark - Inits

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self setFrame:CGRectMake(0, 0, 20, 20)];
    [self commonInit];
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

-(void)commonInit{
    
    //Style Self Unchecked
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = MIN(self.frame.size.width, self.frame.size.height) * 0.1f;
    self.layer.cornerRadius = 3.f;
    self.clipsToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
    
    //Init innerView
    [self initInnerView];
    
    //Tap Gesture
    MPTapGetureRecognizer* tap = [[MPTapGetureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapGesture:)];
    [tap setMpDelegate:self];
    [self addGestureRecognizer:tap];
    
    //Enabled
    [self setEnabled:YES];
}

-(void)initInnerView{
    CGRect frame = CGRectZero;
    frame.size.width = self.frame.size.width * 0.65f;
    frame.size.height = self.frame.size.height * 0.65f;
    frame.origin.y = (self.frame.size.height / 2) - (frame.size.height / 2);
    frame.origin.x = (self.frame.size.width / 2) - (frame.size.width / 2);
    
    innerView = [[UIView alloc] initWithFrame:frame];
    innerView.backgroundColor = [UIColor blackColor];
    innerView.alpha = 0.f;
    innerView.layer.cornerRadius = self.layer.cornerRadius * 0.65f;
    innerView.clipsToBounds = YES;
    [self addSubview:innerView];
}

#pragma mark - Gesture Method

-(void)tapGesture:(UITapGestureRecognizer*)gesture{

    if (!self.enabled) {
        return;
    }
    
    [self toggleState:YES];
    
    
}

#pragma mark - Setters

-(void)setState:(kMPCheckBoxState)state animated:(BOOL)animated{
    [self setState:state animated:animated notifyDelegate:YES];
}

-(void)setState:(kMPCheckBoxState)state animated:(BOOL)animated notifyDelegate:(BOOL)notify{
    if (state == _checkState) {
        return;
    }
    _checkState = state;
    
    [self checkedOrUnchecked:_checkState animated:animated notifyDelegate:notify];
}

-(void)setCompanionView:(UIView *)companionView{
    
    if (!companionView) {
        return;
    }
    [companionView setUserInteractionEnabled:YES];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapGesture:)];
    [companionView addGestureRecognizer:tap];
    
}

-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    self.alpha = enabled ? 1.0f : 0.5f;
}

-(void)setBorderColor:(UIColor *)color{
    
    self.layer.borderColor = color.CGColor;
    
}

-(void)setCheckColor:(UIColor*)color{
    [innerView setBackgroundColor:color];
}

-(void)setCircular:(BOOL)circular{
    if (!circular) {
        self.layer.cornerRadius = 3.f;
        innerView.layer.cornerRadius = self.layer.cornerRadius * 0.65f;
        return;
    }
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    if (height != width) {
        NSAssert(NO, @"%s The CheckBox can only be circular if the height and width are equal!", __PRETTY_FUNCTION__);
        return;
    }
    
    self.layer.cornerRadius = width / 2;
    innerView.layer.cornerRadius = width * 0.65f / 2;
    
}

#pragma mark - Public Methods -
-(void)toggleState:(BOOL)animated{
    
    [self setState:!self.checkState animated:animated];
}

-(void)checkedOrUnchecked:(BOOL)checked animated:(BOOL)animated{
    
    [self checkedOrUnchecked:checked animated:animated notifyDelegate:YES];
    
}

-(void)checkedOrUnchecked:(BOOL)checked animated:(BOOL)animated notifyDelegate:(BOOL)notify{
    
    if (self.animating) {
        return;
    }
    self.animating = true;
    
    [self changeState:(self.checkState)? 1.0f : 0.0f animated:animated notifyDelegate:notify];
    
}

#pragma mark - Private Method -

-(void)changeState:(CGFloat)alpha animated:(BOOL)animated notifyDelegate:(BOOL)notify{
    
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromTop;
    
    CGFloat duration = (animated)? 0.3f : 0.0f;
    
    void (^animation)() = ^void(){
        [innerView setAlpha:alpha];
    };
    
    void (^completion)(BOOL) = ^(BOOL finished)
    {
        self.animating = false;
    };
    
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:options
                     animations:animation
                     completion:completion];
    
    if (notify) {
        [self.delegate mpCheckBoxDidChangeState:self.checkState checkBox:self];
    }
}

#pragma mark - Overriden Methods

-(BOOL)isEqual:(id)object{
    if ([[object class] isSubclassOfClass:[self class]]) {
        NSString* selfIdentifier = self.identifier;
        NSString* objectIdentifier = [(MPCheckBox*)object identifier];
        
        return [selfIdentifier isEqualToString:objectIdentifier];
    }
    return NO;
}

#pragma mark - MPTapGesture Delegate

-(void)mpTapGestureStateChanged:(UIGestureRecognizerState)state{
    switch (state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStatePossible:
            [self animateOnTouch:NO];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateChanged:
            [self animateOnTouch:YES];
            break;
        default:
            break;
    }
    
    
}

#pragma mark - Touch Feedback
-(void)animateOnTouch:(BOOL)ended{
    CATransform3D t = CATransform3DMakeScale(1.2, 1.2, 1);
    if (ended) {
        t = CATransform3DIdentity;
    }
    [UIView animateWithDuration:.2
                     animations:^{
                         [self.layer setTransform:t];
                     }];
}

@end
