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

- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
        barLeftAgeImage:(NSImage *)barLeftAge andbarRightAgeImage:(NSImage *)barRightAge {
    self = [super init];

    if( self ) {
        [self setCell:[[LADSliderCell alloc] initWithKnobImage:knob barFillImage:barFill
                                               barLeftAgeImage:barLeftAge andbarRightAgeImage:barRightAge]];

//      If the cell is nil we return nil
        return nil == self.cell ? nil : self;
    }

    return self;
}

- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
 barFillBeforeKnobImage:(NSImage *)barFillBeforeKnob
        barLeftAgeImage:(NSImage *)barLeftAge barRightAgeImage:(NSImage *)barRightAge {
    self = [super init];

    if( self ) {
        [self setCell:[[LADSliderCell alloc] initWithKnobImage:knob barFillImage:barFill
                                        barFillBeforeKnobImage:barFillBeforeKnob
                                               barLeftAgeImage:barLeftAge barRightAgeImage:barRightAge]];

//      If the cell is nil we return nil
        return nil == self.cell ? nil : self;
    }

    return self;
}

/*
    Also need to throw on some
    LADSliderCell setters and getters
*/
- (NSImage *)knobImage {
    return ((LADSliderCell *) self.cell).knobImage;
}

- (void)setKnobImage:(NSImage *)image {
    ((LADSliderCell *) self.cell).knobImage = image;
}

- (NSImage *)barFillImage {
    return ((LADSliderCell *) self.cell).barFillImage;
}

- (void)setBarFillImage:(NSImage *)image {
    ((LADSliderCell *) self.cell).barFillImage = image;
}

- (NSImage *)barFillBeforeKnobImage {
    return ((LADSliderCell *) self.cell).barFillBeforeKnobImage;
}

- (void)setBarFillBeforeKnobImage:(NSImage *)image {
    ((LADSliderCell *) self.cell).barFillBeforeKnobImage = image;
}

- (NSImage *)barLeftAgeImage {
    return ((LADSliderCell *) self.cell).barLeftAgeImage;
}

- (void)setBarLeftAgeImage:(NSImage *)image {
    ((LADSliderCell *) self.cell).barLeftAgeImage = image;
}

- (NSImage *)barRightAgeImage {
    return ((LADSliderCell *) self.cell).barRightAgeImage;
}

- (void)setBarRightAgeImage:(NSImage *)image {
    ((LADSliderCell *) self.cell).barRightAgeImage = image;
}

@end
