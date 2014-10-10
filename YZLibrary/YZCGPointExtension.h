//
//  YZCGPointExtension.m
//  ic2
//
//  Created by Yichi on 25/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//
#ifndef _YZCGPointExtension_h
#define _YZCGPointExtension_h

#import <CoreGraphics/CGGeometry.h>

CGPoint YZCGPointAdd(CGPoint pointLeft, CGPoint pointRight);

CGPoint YZCGPointSubtract(CGPoint pointLeft, CGPoint pointRight);

CGPoint YZCGPointMultiplyScalar(CGPoint point, CGFloat value);

CGPoint YZCGPointDivideScalar(CGPoint point, CGFloat value);

CGFloat YZCGPointDotProduct(CGPoint pointLeft, CGPoint pointRight);

CGFloat YZCGPointMagnitude(CGPoint point);

CGFloat YZCGPointLength(CGPoint point);

CGPoint YZCGPointNormalize(CGPoint point);

CGPoint YZCGPointUnit(CGPoint point);

CGPoint YZCGPointLimit(CGPoint point, CGFloat value);

CGFloat YZCGPointDistance(CGPoint pointStart, CGPoint pointEnd);

#endif