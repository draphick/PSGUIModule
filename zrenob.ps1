clear

#Import the GUI module
$PSGUIModule = Import-Module -name "c:\scripts\PSGUIModule" -AsCustomObject -Force

#Array Variable
$things = @(
	"Item1",
	"Item2",
	"Item3"
)

#Main windows holding everything together
$box = $PSGUIModule.mainWindow("Title of window",300,400)

#List box showin the array $things
$listhis = $PSGUIModule.createListbox(0,0,100,100,$things)

#Creating a checkbox
$checkbox = $PSGUIModule.checkbox("This is a checkbox",100,100,200,24)

#Plain text written into the GUI main windows
$text = $PSGUIModule.textLabel("This is an example of my nuts",75,325,175,25)

#A free text output box.  It can take in any amount of text and will add a scroll bar if text exceeds length.
$outputBox = $PSGUIModule.outputBox("This is a free text box, not a list box.",175,150,100,100)
$outputBox.Enabled = $true

#Button that will add another dropdown box displaying the array $things.  It will also check the checkbox.
$Press = $PSGUIModule.button("Press",150,25,100,25)
$Press.Add_Click({
    $dropthis = $PSGUIModule.dropDownBox(105,0,100,100,$things)
    $box.Controls.Add($dropthis)
	$checkbox.Checked = $true
})

#Button will remove the list box and add a calendar to the GUI.
$Press2 = $PSGUIModule.button("Press2",150,50,100,25)
$Press2.Add_Click({
        $prompt = $PSGUIModule.yesNoOKPrompt("This is the title","This will open the calendar and remove the list box",0)
        $calendar = $PSGUIModule.calendarSelection(25,100)
        $box.Controls.remove($listhis)
        $box.Controls.add($calendar)
})

$box.Controls.Add($checkbox)
$box.Controls.Add($Press)
$box.Controls.Add($Press2)
$box.Controls.Add($listhis)
$box.Controls.Add($text)
$box.Controls.Add($outputBox)

[void] $box.ShowDialog()
