//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Shaofeng Mo on 6/14/15.
//  Copyright (c) 2015 Seanmok. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    float red = [self getRandomDecimal];
    float green = [self getRandomDecimal];
    float blue = [self getRandomDecimal];
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
}

- (float)getRandomDecimal {
    return (arc4random() % 100) / 100.0;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    float maxRadius = MIN(bounds.size.height, bounds.size.width) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for (float radius = maxRadius; radius > 0; radius -= 20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center
                        radius:radius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
    [self.circleColor setStroke];
    path.lineWidth = 4;
    [path stroke];
}

@end
