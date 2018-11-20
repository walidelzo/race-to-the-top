//
//  pathMountian.h
//  RaceToTheTop
//
//  Created by walid on 11/18/18.
//  Copyright © 2018 walid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface pathMountian : NSObject
+(NSArray*)moutaintBezierPath:(CGRect)rect;
+(UIBezierPath*)tapTargetForPath:(UIBezierPath*)path;

@end

NS_ASSUME_NONNULL_END
