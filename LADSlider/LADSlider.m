//
//  LADSlider.m
//  LADSliderExample
//
//  Created by Alexander Lapshin on 04.10.13.
//  Copyright (c) 2013 Alexander Lapshin. All rights reserved.
//

#import "LADSlider.h"
#import "LADSliderCell.h"

@implementation LADSlider
//  We need to override it to prevent drawing bugs
//  Follow this link to know more about it:
//  http://stackoverflow.com/questions/3985816/custom-nsslidercell
- (void)setNeedsDisplayInRect:(NSRect)invalidRect {
    [super setNeedsDisplayInRect:[self bounds]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if(![self.cell isKindOfClass:[LADSliderCell class]]) {
        self.cell = [[LADSliderCell alloc] init];
    }
}

- (id)initWithKnobImage:(NSImage *)knob {
    self = [super init];
    if (self) {
        self.cell = [[LADSliderCell alloc] initWithKnobImage:knob];
        return !self.cell ? nil : self;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage {
    self = [super init];
    if (self) {
        self.cell = [[LADSliderCell alloc] initWithKnobImage:knob minimumValueImage:minImage maximumValueImage:maxImage];
        return !self.cell ? nil : self;
    }

    return self;
}

- (LADSliderCell *)sliderCell {
	return self.cell;
}

- (NSImage *)knobImage {
    return self.sliderCell.knobImage;
}

- (void)setKnobImage:(NSImage *)image {
    self.sliderCell.knobImage = image;
}

- (void)setMinimumValueImage:(NSImage *)minimumValueImage {
    if (NSEdgeInsetsEqual(minimumValueImage.capInsets, NSEdgeInsetsZero)) {
        CGFloat leftInset = minimumValueImage.size.width-1;
		minimumValueImage.capInsets = NSEdgeInsetsMake(0, leftInset, 0, 0);
	}
	self.sliderCell.minimumValueImage = minimumValueImage;
}

- (NSImage *)minimumValueImage {
	return self.sliderCell.minimumValueImage;
}

- (void)setMaximumValueImage:(NSImage *)maximumValueImage {
    if (NSEdgeInsetsEqual(maximumValueImage.capInsets, NSEdgeInsetsZero)) {
        CGFloat rightInset = maximumValueImage.size.width-1;
		maximumValueImage.capInsets = NSEdgeInsetsMake(0, 0, 0, rightInset);
	}
	self.sliderCell.maximumValueImage = maximumValueImage;
}

- (NSImage *)maximumValueImage {
	return self.sliderCell.maximumValueImage;
}

@end
