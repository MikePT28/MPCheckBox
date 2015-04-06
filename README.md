# MPCheckBox

[![CocoaPods](https://img.shields.io/cocoapods/v/MPCheckBox.svg)]() 
[![LICENSE](https://img.shields.io/badge/License-MIT-brightgreen.svg)]()

Custom Check Boxes class. 

Extends UIControl class. 

This check box does not come with an associated label, this is because sometime you dont want a label next to it, meybe you need an image. So to compensate for this, theres a way to link an UIView (or son) object to it and extend the functionality.

So far there are only two types of check boxes: 

1.  Square and 
2.  Circular.
 
![Screenshot](https://raw.githubusercontent.com/MikePT28/MPCheckBox/master/Images/image.png)

##TODO
- [x] Pod
- [ ] Add touch feedback
<<<<<<< HEAD
- [ ] Add support for radial groups
=======
- [x] Add support for radial groups
>>>>>>> v0.1.2

Installation
=============

##Manual
* Just drag the files in the src folder to your project.
* Import the checkbox class you want to use.

##Cocoapods
```
platform :ios, "8.0"

pod 'MPCheckBox'

source 'https://github.com/CocoaPods/Specs.git'
```

How to use
==========

##Storyboard
* Create an UView element,
* Place it where you want it,
* Give it a size,
* Assign it the ```MPCheckBox.h``` class.
* Get a reference in the viewController file and
* Customize the properties you want

NOTE: Each Check Box has an identifier, that property is assignable from the IB.

##Programmatically

###CheckBoxes

```objective-C
    #import "MPCheckBox.h" //Import header

    @class SomeClass() <MPCheckBoxDelegate> // Implement Delegate (OPTIONAL)

    MPCheckBox *checkBox = [[MPCheckBox alloc] initWithFrame:someFrame];
    checkBox.identifier = @"someIdent";
    checkBox setDelegate:self];
    [checkBox setCompanionView:someView]; //Can be anything that inherits from UIView
    //For circular
    [checkBox setCircular:YES]; //Default is NO
    //Set State
    [checkBox setState:kMPCheckBoxStateChecked animated:NO]; // Default is Unchecked
    //Cutomization
    [checkBox setBackgroundColor:someColor]; //Default Clear
    [checkBox setBorderColor:otherColor]; //Default Black
    [checkBox setCheckColor:oneMoreColor]; //Default Black
    
    //The state can be toggled manually from anywhere just call
    [checkBox toggleState:YES];
    [someOtherView addSubView:checkBox];
```
###CheckBox Group
```objective-C
    NSArray* checkBoxes = @[leftmostCheckBox, leftCheckBox, rightCheckBox, rightmostCheckBox];

    MPCheckBoxGroup* checkBoxGroup = [[MPCheckBoxGroup alloc] init];
    [checkBoxGroup setCheckBoxes:checkBoxes];
    [checkBoxGroup setDelegate:self];
    [checkBoxGroup setIdentifier:@"group"];
```

License
============
MIT but Read de LICENSE file for more info.

Version
===========
v0.1.1 ~ Method names and properties may change in the future. The will be specified but concider yourself warned.
