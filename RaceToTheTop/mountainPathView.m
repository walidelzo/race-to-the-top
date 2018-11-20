//
//  mountainPathView.m
//  RaceToTheTop
//
//  Created by walid on 11/18/18.
//  Copyright © 2018 walid. All rights reserved.
//

#import "mountainPathView.h"
@implementation mountainPathView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

-(void)setup{
    self.backgroundColor=[UIColor clearColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    for (UIBezierPath *path in [pathMountian moutaintBezierPath:self.bounds ])
    {
        [[UIColor blackColor]setStroke];
        [path stroke];
    }
}
@end
