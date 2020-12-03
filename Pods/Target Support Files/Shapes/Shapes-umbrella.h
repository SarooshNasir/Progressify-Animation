#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CAShapeLayer+UIBezierPath.h"
#import "CATransaction+AnimateWithDuration.h"
#import "DTAnimatableShapeLayer.h"
#import "DTDimmingView.h"
#import "DTGraphicsConverter.h"
#import "DTProgressView.h"
#import "DTShapeButton.h"
#import "DTShapeView.h"
#import "Shapes.h"

FOUNDATION_EXPORT double ShapesVersionNumber;
FOUNDATION_EXPORT const unsigned char ShapesVersionString[];

