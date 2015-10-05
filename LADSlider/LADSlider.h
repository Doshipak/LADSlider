//
//  LADSlider.h
//  LADSliderExample
//
//  Created by Alexander Lapshin on 04.10.13.
//  Copyright (c) 2013 Alexander Lapshin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface LADSlider : NSSlider

/*
    Return LADSlider with custom knob and standard NSSlider bar
    If the argument is nil
    the method will return nil
 */
- (id)initWithKnobImage:(NSImage *)knob;

/*
    Return LADSlider with custom knob and tack
        isProgressType == NO
    If the one of the followings arguments is nil
    the method will return nil
 */
- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage;

/*
    LADSliderCell properties
    you may find the description in
    LADSliderCell.h
 */

@property (nonatomic) IBInspectable NSImage *knobImage;
@property (nonatomic) IBInspectable NSImage *minimumValueImage;
@property (nonatomic) IBInspectable NSImage *maximumValueImage;

@end
