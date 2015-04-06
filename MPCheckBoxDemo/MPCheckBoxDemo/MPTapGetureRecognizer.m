//
//  MPTapGetureRecognizer.m
//  MPCheckBoxDemo
//
//  Created by Mike Pesate on 4/6/15.
//  Copyright (c) 2015 Mike Pesate. All rights reserved.
//

#import "MPTapGetureRecognizer.h"

@implementation MPTapGetureRecognizer

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];

    [self.mpDelegate mpTapGestureStateChanged:self.state];


}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];

    [self.mpDelegate mpTapGestureStateChanged:self.state];

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];

    [self.mpDelegate mpTapGestureStateChanged:self.state];

}


@end
