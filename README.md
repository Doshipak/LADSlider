# LADSlider: Fast and simple solution.

If you've tired searching the web for the next questions:
- "Custom NSSlider"
- "Cocoa custom slider MacOS"
- "How to customize NSSlider cocoa" 

or something like this. The LADSlider is really what you need.

I've spent lots off my time searching for the answer and didn't find a simple one.
LADSlider this is really fast and simple solution for this problem.

This is still a DEMO but I keep working on.

## How to use
### With .xib
- Create an NSSlider in your .xib file and set it class to LADSLider
in "Custom class" tab. You also may set an LADSliderCell class for NSSliderCell
but if you don't LADSlider will do it for you.

- Then you just need to set an images for your slider like this:
```objc
	slider.knobImage = [NSImage imageNamed:@"knob.png"];
```
You may set only knob image if you want.
```objc
slider.barFillImage = [NSImage imageNamed:@"barFill.png"];
slider.barLeftAgeImage = [NSImage imageNamed:@"barFillLeftAge.png"];
slider.barRightAgeImage = [NSImage imageNamed:@"barRightAge.png"];
```
If you want to create a progress slider, e.g. like iTunes volume slider you need to set this image too:
	slider.barFillBeforeKnobImage = [NSImage imageNamed:@"barFillBeforeKnob.png"]; 
 
### From code
- You just need to create LADSlider with one of the init methods:
```objc
- (id)initWithKnobImage:(NSImage *)knob;
- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
		barLeftAgeImage:(NSImage *)barLeftAge andbarRightAgeImage:(NSImage *)barRightAge;
- (id)initWithKnobImage:(NSImage *)knob barFillImage:(NSImage *)barFill
		barFillBeforeKnobImage:(NSImage *)barFillBeforeKnob
		barLeftAgeImage:(NSImage *)barLeftAge barRightAgeImage:(NSImage *)barRightAge;
```
All of them return nil if one of the arguments is nil.

- Then just set it where you want in your view. Also you may set a controll size for your slider like this:
```objc
[slider.cell setControlSize:NSRegularControlSize];
[slider.cell setControlSize:NSSmallControlSize];
[slider.cell setControlSize:NSMiniControlSize];
```
Read note about it.
  
## Note
There is a limit of knob image height for different cell controll size:
```objc
NSRegularControlSize:   21 pixels
NSSmallControlSize:     15 pixels
NSMiniControlSize:		12 pixels
```
You may make them bigger and see what will happen.
