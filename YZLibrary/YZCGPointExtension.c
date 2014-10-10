//
//  YZCGPointExtension.c
//  ic2
//
//  Created by Yichi on 25/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//
#include "YZCGPointExtension.h"
#include <math.h>

/*CG_INLINE*/CGPoint 
YZCGPointAdd(CGPoint pointLeft, CGPoint pointRight) {
    return CGPointMake(pointLeft.x+pointRight.x, pointLeft.y+pointRight.y);
}

/*CG_INLINE*/CGPoint 
YZCGPointSubtract(CGPoint pointLeft, CGPoint pointRight) {
    return CGPointMake(pointLeft.x-pointRight.x, pointLeft.y-pointRight.y);
}

/*CG_INLINE*/CGPoint 
YZCGPointMultiplyScalar(CGPoint point, CGFloat value) {
    return CGPointMake(point.x*value, point.y*value);
    
}

/*CG_INLINE*/CGPoint 
YZCGPointDivideScalar(CGPoint point, CGFloat value) {
    return CGPointMake(point.x/value, point.y/value);
    
}

/*CG_INLINE*/ CGFloat 
YZCGPointDotProduct(CGPoint pointLeft, CGPoint pointRight) {
    return (pointLeft.x*pointRight.x) + (pointLeft.y*pointRight.y) ;
    
}

/*CG_INLINE*/ CGFloat 
YZCGPointMagnitude(CGPoint point) {
    return sqrtf(YZCGPointDotProduct(point, point));
}


/*CG_INLINE*/ CGFloat 
YZCGPointLength(CGPoint point) {
    return YZCGPointMagnitude(point);
}


/*CG_INLINE*/CGPoint 
YZCGPointNormalize(CGPoint point) {
    CGFloat magnitude = YZCGPointMagnitude(point);
    CGPoint newPoint = point;
    if(magnitude > 0.f)
        newPoint = YZCGPointDivideScalar(point, magnitude);
    return newPoint;
    
}
/*CG_INLINE*/CGPoint 
YZCGPointUnit(CGPoint point) {
    return YZCGPointNormalize(point);
}


/*CG_INLINE*/CGPoint 
YZCGPointLimit(CGPoint point, CGFloat value) {
    if(YZCGPointMagnitude(point) > value) {
        point = YZCGPointNormalize(point);
        point = YZCGPointMultiplyScalar(point, value);
    }
    return point;
    
}

/*CG_INLINE*/ CGFloat 
YZCGPointDistance(CGPoint pointStart, CGPoint pointEnd) {
    CGFloat deltaX = fabsf(pointStart.x-pointEnd.x);
    CGFloat deltaY = fabsf(pointStart.y-pointEnd.y);
    return YZCGPointMagnitude(CGPointMake(deltaX, deltaY));
}