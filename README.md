# PSGUIModule
This module is used to build out the GUI for applications that I have written.  This repo includes the actual module file (PSGUIModule.psm1) and an example script that utilizes the module (zrenob.ps1).

In order to use this module, you will need to make sure you import this module in your script.  You will need to have the .psm1 module in a folder with the same name as the module in order for it to import correctly.  You can simply do this by including this line typically at the top of your script:

```powershell
Import-Module -name "C:\scripts\PSGUIModule" -AsCustomObject -Force
```

There are several functions you can use with this module and the zrenob.ps1 example uses most of them.  Below are short descriptions of each function, and example and its uses.

## mainWindow
This is the main function used to create the main window.  Basically the full window that will house your application.  To use the function you will to pass three parameters.  

A header text, which is the text shown at the top of the window.  Then a width then height.  That will define how big you want the window to be.  

Example:

```powershell
$box = $PSGUIModule.mainWindow("Title of window",300,400)
```

## textLabel

This function will be used to place some free text anywhere in your application.  To use this function you will need to provide the 5 parameters.

You will first provide the text you want it to display.  Then the location, x and y coordinates.  Lastly the size of the text area as width and height.

Example:

```powershell
$text = $PSGUIModule.textLabel("This is the displayed text",75,325,175,25)
```

##  button

This function can be used to create a button.  You will just need to pass it three parameters.  The text in the button, its coordinates and its size.

Example:

```powershell
$Press = $PSGUIModule.button("Press This",150,25,100,25)
```

## outputBox

This function will create a blank free text box.  Similar to what you would see if you were to submit a message on a forum.  To use this function you need to provide a default text that will appear in the outputBox, the output box coordinates and its size.  You will also want to note that this function will default to having the output box disabled.  Meaning the box will be 'greyed out' and not available to the user to manipulate any data written in the box.  You can change this behavior by setting the box to be enabled.

Example:

```powershell
$outputBox = $PSGUIModule.outputBox("This is a free text box, not a list box.",175,150,100,100)
```

In order to enable this box allowing the user to modify the text within it (using the same example above):

```powershell
$outputBox.Enabled = $true
```

## calendarSelection

This function will display a calendar selection tool back to the user.  To use this function you should only need to provide its coordinates within the window.

Example:

```powershell
$calendar = $PSGUIModule.calendarSelection(25,100)
```

## dropDownBox

This function can be used to display a drop down menu for the user.  To use this function you will need to pass it its coordinates, it's size, then an array.  The array being the list you want the dropdown to display.

Example:

```powershell
$things = @("thing1","thing2","thing3")
$dropthis = $PSGUIModule.dropDownBox(105,0,100,100,$things)
``` 

The example above to show to the user a dropdown menu that will contain thing1, thing2 and thing 3 as options within the drop down.

## createListbox

Similar to the above, but instead of having a dropdown, this will instead provide a list box.  This list box will display all items in your array in a small windown that will allow you to make a selection.  In this listbox the user has the ability to select more than one item at a time.  To use this listbox function you will need to pass it its coordinates, its size and an array.

Example:

```powershell
$things = @("thing1","thing2","thing3")
$listhis = $PSGUIModule.createListbox(0,0,100,100,$things)
```

## checkbox

This function will create a simple checkbox on your GUI.  To use this checkbox you will need to pass the checkbox some text, its coordinates, and its size.

Example:

```powershell
$checkbox = $PSGUIModule.checkbox("This is a checkbox",100,100,200,24)
```

By default, the checkbox is not checked.  But you may check a box manually by using:

```powershell
$checkbox.checked = $true
```

## yesNoOKPrompt

This one is a bit tricky, but very helpful when needing validation from the user.  To use this function you will need to pass it three parameters.  First you need to provide the text.  This text will be what is displayed to the user.  Typically it will be the warning or a question you are trying to validate.  Then a title, which will be what is displayed in the title of the pop up that will appear.  Lastly you need to provide the type of pop up you want to have presented to the user.  Below  is a quick table showing the argument you can pass and what will be displayed to the user.

Argument | Description
--- | --- 
0 | Show OK button.
1 | Show OK and Cancel buttons.
2 | Show Abort, Retry, and Ignore buttons.
3 | Show Yes, No, and Cancel buttons.
4 | Show Yes and No buttons.
5 | Show Retry and Cancel buttons.

Once a user makes a selection, or pressing any of the buttons displayed, that value is passed back to the script as a number.  That number corresponds to a response that you can use for your validation.  For example, if you use the argument 3 (show yes, no and cancel buttons), once the user presses 'yes' it will feed back to your yesNoOKPrompt varible a value of 6.  A list of all return values are below:

Button Pressed | Value Returned | Note
--- | --- | ---
OK | 1 |
Cancel | 2 | if using option #3 above
Abort | 3 |
Retry | 4 |
Cancel | 5 | if using option #5 above
Yes | 6 |
No | 7 |

Below is an example of how it might be used:

```powershell
$prompt = $PSGUIModule.yesNoOKPrompt("This is the title","Yes or No plsthx.",4)
```

This code above will prompt the user with a box and the option for Yes or No.

If the user clicks on the yes button, the variable $prompt will now holds the value of 6.  From there you can do something like 

```powershell
if ($prompt -eq 6){
    write-host "He said yes!"
}else{
    write-host "We were on a break."
}
```

With the example above, if the user clicked yes when prompted, you will get an output back to the console saying "He said yes!".  If the user clicked on no or made any other selection (even if they just closed the window), the console will read back "We were on a break".

### Editors Notes

I will be adding more functionality to this module as time goes on.  Feel free to email me if you have any requests or would like to make any changes.

raphael.gallardo@capitalone.com
