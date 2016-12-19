# LADSlider: Customizable NSSlider

LADSlider offers quick and easy customization on NSSlider. Simply set the knob, minimum, and maximum image attributes and let LADSlider do the rest. No subclassing of cells required!

![SliderImage](https://github.com/lucasderraugh/LADSlider/blob/master/example.png)

## How to use
Please note that this slider requires Mac OS 10.10+ (Yosemite)
### With xib or storyboard
Create an NSSlider in your xib or storyboard file and change its class to LADSlider under the "Custom Class" heading. Set the images directly in Interface Builder from the Attributes Inspector or programmatically on the LADSlider class.

**That's it!**

### From code
Create LADSlider with one of the init methods:
```objc
- (id)initWithKnobImage:(NSImage *)knob;
- (id)initWithKnobImage:(NSImage *)knob minimumValueImage:(NSImage *)minImage maximumValueImage:(NSImage *)maxImage;
```
If you prefer code, you can set the images for your slider like this:
```objc
slider.knobImage = [NSImage imageNamed:@"knob"];
```
You may set only the knob image if you want, or customize the min and max images as well.
```objc
slider.minimumValueImage = [NSImage imageNamed:@"leftEdge"];
slider.maximumValueImage = [NSImage imageNamed:@"rightEdge"];
```
