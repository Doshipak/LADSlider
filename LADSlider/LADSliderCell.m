//
//  LADSliderCell.m
//  LADSliderExample
//
//  Created by Alexander Lapshin on 04.10.13.
//  Copyright (c) 2013 Alexander Lapshin. All rights reserved.
//

#import "LADSliderCell.h"

@interface LADSliderCell () {
    NSRect _currentKnobRect;
    NSRect _barRect;

    BOOL _flipped;
}

@end

@implementation LADSliderCell

- (id)init {
    self = [super init];

    if( self ) {

    }

    return self;
}


- (id)initWithKnobImage:(NSImage *)knob {
    if( nil == knob ) {
        return nil;
    }

    self = [self init];

    if( self ) {
        _knobImage = knob;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
        barLeftAgeImage:(NSImage *)barLeftAge andbarRightAgeImage:(NSImage *)barRightAge {
    if( nil == knob && nil == barFill &&
            nil == barLeftAge && nil == barRightAge ) {
        return nil;
    }

    self = [self init];

    if( self ) {
        _knobImage = knob;
        _barFillImage = barFill;
        _barFillBeforeKnobImage = barFill;
        _barLeftAgeImage = barLeftAge;
        _barRightAgeImage = barRightAge;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
 barFillBeforeKnobImage:(NSImage *)barFillBeforeKnob
        barLeftAgeImage:(NSImage *)barLeftAge barRightAgeImage:(NSImage *)barRightAge {
    if( nil == knob && nil == barFill &&
            nil == barFillBeforeKnob &&
            nil == barLeftAge && nil == barRightAge ) {
        return nil;
    }

    self = [self init];

    if( self ) {
        _knobImage = knob;
        _barFillImage = barFill;
        _barFillBeforeKnobImage = barFillBeforeKnob;
        _barLeftAgeImage = barLeftAge;
        _barRightAgeImage = barRightAge;
    }

    return self;
}

- (void)drawKnob:(NSRect)knobRect {
//  If don't have the knobImage
//  just call the super method
    if( nil == _knobImage ) {
        [super drawKnob:knobRect];
        return;
    }

//  We need to save the knobRect to redraw the bar correctly
    _currentKnobRect = knobRect;

//---------------------Interesting-bug----------------------
//  Sometimes slider may have some bugs when you
//  just click on it and hold the mouse down.
//  To prevent this I call this method once again
//  right here.
//  !!!- If you know other way how to prevent it
//  please tell me about it -!!!
    [self drawBarInside:_barRect flipped:_flipped];
//---------------------Interesting-bug----------------------

    [self.controlView lockFocus];

//  We crete this to make a right proportion for the knob rect
//  For example you knobImage width is longer then allowable
//  this line will position you knob normally inside the slider
    CGFloat newOriginX = knobRect.origin.x *
            (_barRect.size.width - (_knobImage.size.width - knobRect.size.width)) / _barRect.size.width;

    [_knobImage compositeToPoint:NSMakePoint(newOriginX, knobRect.origin.y + _knobImage.size.height)
                       operation:NSCompositeSourceOver];

    [self.controlView unlockFocus];
}

- (void)drawBarInside:(NSRect)cellFrame flipped:(BOOL)flipped {
//  If don't have any of the bar images
//  just call the super method
    if( nil == _knobImage && nil == _barFillImage &&
            nil == _barFillBeforeKnobImage &&
            nil == _barLeftAgeImage && nil == _barRightAgeImage ) {
        [super drawBarInside:cellFrame flipped:flipped];
        return;
    }

//---------------------Interesting-bug----------------------
//   Again we save this to prevent the same bug
//   I've wrote inside the drawKnob: method
    _barRect = cellFrame;
    _flipped = flipped;
//---------------------Interesting-bug----------------------

    NSRect beforeKnobRect = [self createBeforeKnobRect];
    NSRect afterKnobRect = [self createAfterKnobRect];

//  Sometimes you can see the ages off you bar
//  even if your knob is at the end or
//  at the beginning of it. It's about one pixel
//  but this help to hide that edges
    if( self.minValue != self.doubleValue ) {
        NSDrawThreePartImage(beforeKnobRect, _barLeftAgeImage, _barFillBeforeKnobImage, _barFillBeforeKnobImage,
                NO, NSCompositeSourceOver, 1.0, flipped);
    }

    if( self.maxValue != self.doubleValue ) {
        NSDrawThreePartImage(afterKnobRect, _barFillImage, _barFillImage, _barRightAgeImage,
                NO, NSCompositeSourceOver, 1.0, flipped);
    }
}

- (NSRect)createBeforeKnobRect {
    NSRect beforeKnobRect = _barRect;

    beforeKnobRect.size.width = _currentKnobRect.origin.x + _knobImage.size.width / 2;
    beforeKnobRect.size.height = _barFillBeforeKnobImage.size.height;
    beforeKnobRect.origin.y = beforeKnobRect.size.height / 2;

    return beforeKnobRect;
}

- (NSRect)createAfterKnobRect {
    NSRect afterKnobRect = _currentKnobRect;

    afterKnobRect.origin.x += _knobImage.size.width / 2;
    afterKnobRect.size.width = _barRect.size.width - afterKnobRect.origin.x;
    afterKnobRect.size.height = _barFillImage.size.height;
    afterKnobRect.origin.y = afterKnobRect.size.height / 2;

    return afterKnobRect;
}

- (void)setBarFillImage:(NSImage *)barFillImage {
    _barFillImage = barFillImage;

    if( nil == _barFillBeforeKnobImage ) {
        _barFillBeforeKnobImage = barFillImage;
    }
}

- (void)setBarFillBeforeKnobImage:(NSImage *)barFillBeforeKnobImage {
    _barFillBeforeKnobImage = barFillBeforeKnobImage;

    if( nil == _barFillImage ) {
        _barFillImage = barFillBeforeKnobImage;
    }
}


@end
