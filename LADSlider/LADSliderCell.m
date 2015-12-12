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

- (id)initWithKnobImage:(NSImage *)knob {
    if (!knob) {
        return nil;
    }

    self = [self init];
    if (self) {
        _knobImage = knob;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage {
    if (!knob || !minImage || !maxImage ) {
        return nil;
    }

    self = [self init];
    if (self) {
        _knobImage = knob;
        _minimumValueImage = minImage;
		_maximumValueImage = maxImage;
    }

    return self;
}

- (void)drawKnob:(NSRect)knobRect {
    if (!_knobImage) {
        [super drawKnob:knobRect];
        return;
    }

	_currentKnobRect = (NSRect){
		.origin = knobRect.origin,
		.size = _knobImage.size
	};
	
    [self.controlView lockFocus];
	[_knobImage drawInRect:_currentKnobRect];
    [self.controlView unlockFocus];
}

- (void)drawBarInside:(NSRect)cellFrame flipped:(BOOL)flipped {
	_barRect = cellFrame;
	_flipped = flipped;
	
    if (!_knobImage || !_minimumValueImage || !_maximumValueImage) {
        [super drawBarInside:cellFrame flipped:flipped];
        return;
    }

    NSRect beforeKnobRect = [self createBeforeKnobRect];
    NSRect afterKnobRect = [self createAfterKnobRect];

	[self.controlView lockFocus];
	[_minimumValueImage drawInRect:beforeKnobRect];
	[_maximumValueImage drawInRect:afterKnobRect];
	[self.controlView unlockFocus];
}

- (NSRect)createBeforeKnobRect {
    NSRect beforeKnobRect = _barRect;

    beforeKnobRect.size.width = _currentKnobRect.origin.x + _knobImage.size.width / 2;
    beforeKnobRect.size.height = _minimumValueImage.size.height;
	beforeKnobRect.origin.y = _barRect.origin.y + _barRect.size.height / 2.0 - _minimumValueImage.size.height / 2.0 - 1;

    return beforeKnobRect;
}

- (NSRect)createAfterKnobRect {
    NSRect afterKnobRect = _currentKnobRect;

    afterKnobRect.origin.x += _knobImage.size.width / 2;
    afterKnobRect.size.width = _barRect.size.width - afterKnobRect.origin.x;
    afterKnobRect.size.height = _maximumValueImage.size.height;
	afterKnobRect.origin.y = _barRect.origin.y + _barRect.size.height / 2.0 - _maximumValueImage.size.height / 2.0 - 1;

    return afterKnobRect;
}

@end


