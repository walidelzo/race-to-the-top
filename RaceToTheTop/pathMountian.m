//
//  pathMountian.m
//  RaceToTheTop
//
//  Created by walid on 11/18/18.
//  Copyright © 2018 walid. All rights reserved.
//

#import "pathMountian.h"
#define PATH_WIDTH 60
@implementation pathMountian
+(NSArray*)moutaintBezierPath:(CGRect)rect{
    NSMutableArray *points=[@[] mutableCopy];
    
    //first path
    CGPoint firstPoint=CGPointMake((1/6.0)*rect.size.width, CGRectGetMaxX(rect));
    CGPoint secondPoint=CGPointMake((1/3.0)*rect.size.width,(5/6.0)*rect.size.height);
    CGPoint thirdPoint=CGPointMake(CGRectGetMaxX(rect),(5/6.0)*rect.size.height);
    CGPoint fourthPoint=CGPointMake(CGRectGetMaxX(rect),(2/3.0)*rect.size.height);
    CGPoint fifthPoint=CGPointMake((1/6.0)*rect.size.width,(6/12.0)*rect.size.height);
    CGPoint sixthPoint=CGPointMake((1/6.0)*rect.size.width,(6/12.0)*rect.size.height);
    CGPoint sevenPoint=CGPointMake((1/3.0)*rect.size.width,(2/6.0)*rect.size.height);
    CGPoint eightPoint=CGPointMake((2/3.0)*rect.size.width,(6/12.0)*rect.size.height);
    CGPoint ninghtPoint=CGPointMake((11/20.0)*rect.size.width,(5/24.0)*rect.size.height);
    CGPoint controlPoint=CGPointMake((6/8.0)*rect.size.width,(1/3.0)*rect.size.height);

    //second Path
    CGPoint firstPointFortheSecondPath=CGPointMake((1/6.0)*rect.size.width-PATH_WIDTH, CGRectGetMaxX(rect));
    CGPoint secondPointForTheSecondPath=CGPointMake((1/3.0)*rect.size.width,(5/6.0)*rect.size.height-PATH_WIDTH);
    CGPoint thirdPointForTheSecondPath=CGPointMake(CGRectGetMaxX(rect)-PATH_WIDTH,(5/6.0)*rect.size.height-PATH_WIDTH);
    CGPoint fourthPointForTheSecondPath=CGPointMake(CGRectGetMaxX(rect)-PATH_WIDTH,(2/3.0)*rect.size.height+PATH_WIDTH);
    CGPoint fifthPointForTheSecondPath=CGPointMake((1/6.0)*rect.size.width-PATH_WIDTH,(6/12.0)*rect.size.height+PATH_WIDTH/2);
    CGPoint sixthPointForTheSecondPath=CGPointMake((1/6.0)*rect.size.width-PATH_WIDTH,(6/12.0)*rect.size.height);
    CGPoint sevenPointForTheSecondPath=CGPointMake((1/3.0)*rect.size.width-PATH_WIDTH,(2/6.0)*rect.size.height-PATH_WIDTH);
    CGPoint eightPointForTheSecondPath=CGPointMake((2/3.0)*rect.size.width-PATH_WIDTH,(6/12.0)*rect.size.height-PATH_WIDTH);
    CGPoint ninghtPointForTheSecondPath=CGPointMake((11/20.0)*rect.size.width-PATH_WIDTH,(5/24.0)*rect.size.height);
    CGPoint controlPointForTheSecondPath=CGPointMake((6/8.0)*rect.size.width-PATH_WIDTH,(1/3.0)*rect.size.height);

    UIBezierPath *rightMountainPath=[UIBezierPath bezierPath];
    UIBezierPath *LeftMountainPath=[UIBezierPath bezierPath];
    
    rightMountainPath.lineWidth=4;
    LeftMountainPath.lineWidth=4;

    [rightMountainPath moveToPoint:firstPoint];
    [rightMountainPath addLineToPoint:secondPoint];
    [rightMountainPath addLineToPoint:thirdPoint];
    [rightMountainPath addLineToPoint:fourthPoint];
    [rightMountainPath addLineToPoint: fifthPoint];
    [rightMountainPath addLineToPoint:sixthPoint];
    [rightMountainPath addLineToPoint:sevenPoint];
    [rightMountainPath addLineToPoint:eightPoint];
    [rightMountainPath addQuadCurveToPoint:ninghtPoint controlPoint:controlPoint];
    
    [LeftMountainPath moveToPoint:firstPointFortheSecondPath];
    [LeftMountainPath addLineToPoint:secondPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:thirdPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:fourthPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:fifthPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:sixthPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:sevenPointForTheSecondPath];
    [LeftMountainPath addLineToPoint:eightPointForTheSecondPath];
    [LeftMountainPath addQuadCurveToPoint:ninghtPointForTheSecondPath controlPoint:controlPointForTheSecondPath];

    [points addObject:rightMountainPath];
    [points addObject:LeftMountainPath];
    return [points copy];
}

+(UIBezierPath*)tapTargetForPath:(UIBezierPath*)path{
    CGPathRef targetPathRef=CGPathCreateCopyByStrokingPath(path.CGPath, NULL, fmaxf(10.0f, path.lineWidth), path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    
    UIBezierPath *tapTarget=[UIBezierPath bezierPathWithCGPath:targetPathRef];
    CGPathRelease(targetPathRef);
    return tapTarget;
}
@end
