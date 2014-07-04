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

CGPoint CGPointAdd(CGPoint pointLeft, CGPoint pointRight);

CGPoint CGPointSubtract(CGPoint pointLeft, CGPoint pointRight);

CGPoint CGPointMultiplyScalar(CGPoint point, CGFloat value);

CGPoint CGPointDivideScalar(CGPoint point, CGFloat value);

CGFloat CGPointDotProduct(CGPoint pointLeft, CGPoint pointRight);

CGFloat CGPointMagnitude(CGPoint point);

CGFloat CGPointLength(CGPoint point);

CGPoint CGPointNormalize(CGPoint point);

CGPoint CGPointUnit(CGPoint point);

CGPoint CGPointLimit(CGPoint point, CGFloat value);

CGFloat CGPointDistance(CGPoint pointStart, CGPoint pointEnd);

#endif