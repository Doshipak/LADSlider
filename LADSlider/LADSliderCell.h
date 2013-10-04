//
//  LADSliderCell.h
//  LADSliderExample
//
//  Created by Alexander Lapshin on 04.10.13.
//  Copyright (c) 2013 Alexander Lapshin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LADSliderCell : NSSliderCell

/*
    knobImage - image of the knob
    depends on slider control size it should have the next size:
    NSRegularControlSize:   21x21
    NSSmallControlSize:     15x15
    NSMiniControlSize:
*/
@property (strong, nonatomic) NSImage *knobImage;

/*
    There may be to types of the slider:
    Progress slider -
        slider should looks like the video player progress slider or volume slider
        so it draws different bar fill before the knob (barFillBeforeKnobImage)
        and after it (barFillImage)
    Standard slider -
        slider looks like just a simple slider with one fill (barFillImage)
 */
@property (strong, nonatomic) NSImage *barFillImage;
@property (strong, nonatomic) NSImage *barFillBeforeKnobImage;

/*
    Slider also has the ages so you should set
    the different images for the left and the right one
 */
@property (strong, nonatomic) NSImage *barLeftAgeImage;
@property (strong, nonatomic) NSImage *barRightAgeImage;


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
- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
        barLeftAgeImage:(NSImage *)barLeftAge andbarRightAgeImage:(NSImage *)barRightAge;

/*
    Return LADSlider with custom knob and bar
        isProgressType == YES
    If the one of the followings arguments is nil
    the method will return nil
 */
- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
        barFillBeforeKnobImage:(NSImage *)barFillBeforeKnob
      barLeftAgeImage:(NSImage *)barLeftAge barRightAgeImage:(NSImage *)barRightAge;

@end
