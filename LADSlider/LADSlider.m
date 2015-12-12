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

    if( ![self.cell isKindOfClass:[LADSliderCell class]] ) {
        //Set our LADSlider.cell to LADSliderCell
        LADSliderCell *cell = [[LADSliderCell alloc] init];
        [self setCell:cell];
    }
}

- (id)initWithKnobImage:(NSImage *)knob {
    self = [super init];

    if( self ) {
        [self setCell:[[LADSliderCell alloc] initWithKnobImage:knob]];

//      If the cell is nil we return nil
        return nil == self.cell ? nil : self;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage {
    self = [super init];

    if (self) {
        [self setCell:[[LADSliderCell alloc] initWithKnobImage:knob minimumValueImage:minImage maximumValueImage:maxImage]];

        return !self.cell ? nil : self;
    }

    return self;
}

/*
    Also need to throw on some
    LADSliderCell setters and getters
*/

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
    CGFloat leftInset = minimumValueImage.size.width-1;
	if (NSEdgeInsetsEqual(minimumValueImage.capInsets, NSEdgeInsetsZero)) {
		minimumValueImage.capInsets = NSEdgeInsetsMake(0, leftInset, 0, 0);
	}
	self.sliderCell.minimumValueImage = minimumValueImage;
}

- (NSImage *)minimumValueImage {
	return self.sliderCell.minimumValueImage;
}

- (void)setMaximumValueImage:(NSImage *)maximumValueImage {
    CGFloat rightInset = maximumValueImage.size.width-1;
	if (NSEdgeInsetsEqual(maximumValueImage.capInsets, NSEdgeInsetsZero)) {
		maximumValueImage.capInsets = NSEdgeInsetsMake(0, 0, 0, rightInset);
	}
	self.sliderCell.maximumValueImage = maximumValueImage;
}

- (NSImage *)maximumValueImage {
	return self.sliderCell.maximumValueImage;
}

@end
