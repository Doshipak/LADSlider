# LADSlider: Fast and simple solution.

If you've tried searching the web for the following:
- "Custom NSSlider"
- "Cocoa custom slider MacOS"
- "How to customize NSSlider cocoa"

or something like similar. Look no further than LADSlider.

I've spent lots off my time searching for the answer and didn't find a simple one.
LADSlider this is really fast and simple solution for this problem.

## How to use
### With .xib
- Create an NSSlider in your .xib file and set it class to LADSLider
in "Custom class" tab. You also may set an LADSliderCell class for NSSliderCell
but if you don't LADSlider will do it for you.

- From here you can set the images directly in Interface Builder from the Attributes Inspector.

- If you prefer code, you can set the images for your slider like this:
```objc
slider.knobImage = [NSImage imageNamed:@"knob"];
```
You may set only knob image if you want.
```objc
slider.minimumValueImage = [NSImage imageNamed:@"leftEdge"];
slider.maximumValueImage = [NSImage imageNamed:@"rightEdge"];
```
If you want to create a progress slider, e.g. like iTunes volume slider you need to set this image too:

```objc
slider.barFillBeforeKnobImage = [NSImage imageNamed:@"barFillBeforeKnob.png"];
```

### From code
- You just need to create LADSlider with one of the init methods:
```objc
- (id)initWithKnobImage:(NSImage *)knob;
- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage;
```
All of them return nil if one of the arguments is nil.

- Then just set it where you want in your view. Also you may set a control size for your slider like this:
```objc
[slider.cell setControlSize:NSRegularControlSize];
[slider.cell setControlSize:NSSmallControlSize];
[slider.cell setControlSize:NSMiniControlSize];
```
Read note about it.

## Note
There is a limit of knob image height for different cell control size:
```objc
NSRegularControlSize:   21 pixels
NSSmallControlSize:     15 pixels
NSMiniControlSize:		12 pixels
```
You may make them bigger and see what will happen.
