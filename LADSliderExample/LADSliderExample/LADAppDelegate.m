//
//  LADAppDelegate.m
//  LADSliderExample
//
//  Created by Alexander Lapshin on 04.10.13.
//  Copyright (c) 2013 Alexander Lapshin. All rights reserved.
//

#import "LADAppDelegate.h"
#import "LADSlider.h"

@interface LADAppDelegate () {

}

@property (weak) IBOutlet LADSlider *iTunesLikeSlider;

@end

@implementation LADAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self initITunesLikeSlider];
}

- (void)initITunesLikeSlider {
    _iTunesLikeSlider.knobImage = [NSImage imageNamed:@"itunes_knob.png"];
    _iTunesLikeSlider.minimumValueImage = [NSImage imageNamed:@"itunes_barLeftAge.png"];
    _iTunesLikeSlider.maximumValueImage = [NSImage imageNamed:@"itunes_barRightAge.png"];
}


@end
