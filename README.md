Introduction
===
This is not a class yet, it is an example of how to implement this feature on your any view, including UITableView, etc.

It should work well both on iPhone/iPad in all UI Orientaions. Also, localization is supported for buttons. That's easy. 

The idea and instructions
===

1. For the view above keyboard we use a UIToolBar, that we can customize as we need. 

2. We give each UITextField instance on our view a Tag. Tags should start with 0 and then be 1, 2, 3, etc. according to the order in which you would like the Next and Previous buttons work.

3. Then we add all UITextFields to the dictionary. You can copy implementations of appropriate methods starting with pragma - mark - KeyboardView Methods

ScreenShots
===
iPhone
---

<p align="center"><img src="https://github.com/wzbozon/DKKeyboardView/blob/master/iPhoneScreenshot.png?raw=true" alt="iPhoneScreenshot.png" width="200"/></p>
