# Tabby

NUI Tablet for FiveM Servers for anyone to use. You may add to the tablet for your needs but by no means is it to be re-released without my permission.

## Getting Started

These instructions will get you a copy of the project up and running on your server for production use.

### Prerequisites

* You should already have a functioning FiveM Server set up and running before you can install this mod. 
* Basic HTML experience. 

### Download Link
https://github.com/AminYabut/tabby

### Installing

A step by step series of examples that tell you how to get the tablet up and running on your server.

    1.) Place the "tab" folder under your resources folder in your FiveM server files.

    2.) Add "start tab" to your server config file.

    3.) Either restart your server or use the /refresh then /start tab command.

#### ** **Do Not Change The File Name From Tab It Is Made To Work With That Name.** **

### Usage

* "M" key to open the tablet.

* "ESC" to close the tablet and leave it on the page you were on next time it opens.

* The tablet button on the bottom of the tablet will bring you back to the home screen with one click and then click it again to close.

* Hover over an app to see a description of it. Select the app you wish to open.

* To edit the web pages you'll need to find the page you wish to edit (the actual HTML page in the files). I have left templates from my old server in there to help you with ideas and things to add in. For your CAD/MDT make sure you add your address in the iframe correctly on the opencad.html page. 

## Photos
To Be Added

## Update Notes

We are working on a new version of the tablet, release date unknown at this point. Any major issues will be fixed right away if needed. 

* **V0.2 2018/01/17**

* New home screen
* New home screen menu
* Added new apps and information
* Added home button functions click once to return to home screen click again to exit
* Changed design of tablet to allow full web pages
* Added theme

## Known Bugs

* Some tablet "apps" don't render full screen on the tablet.

* When closing with the "ESC" key, the "M" key may need to be pressed twice to open the tablet.

* **UPDATE** Some bubble apps are not appearing or they hide drop-down menus. For the drop down menus please use your arrow keys. If your Bubble app is displaying blank, please contact support at bubble and request for your app to be allowed to be iframed.

* The tablet doesn't seem to like pop out/pop-ups web pages or redirects. Also, a lot of sites block iframes and may result in a white page display. E.G. Don't click the watch on YouTube button, that makes a pop-up. Don't click on any links that will make a pop up on web pages people may add. I'm sure there are lots more examples.

* **Please report any bugs you find to the author.**

## Support
Please file an issue on GitHub or check the readme on GitHub for information on how to reach the author. You can also get more one on one support on our discord:

https://discord.gg/fvxGCUa

Now offering hosting for tablet friendly websites for your communities. Please contact us on discord for more information. We have Cad systems, blogs, forums, wikis and much more.

## Authors

* **Amin Yabut** - *Initial work*

## License

**Not to be shared without explicit permission.**

## Community Shared Additions(tested)
### Discord found by @Chip_W_Gaming 
1 - Invite this bot to your Discord server: https://discordapp.com/oauth2/authorize?=&client_id=299403260031139840&scope=bot&permissions=536083583
https://forum.fivem.net/uploads/default/original/3X/0/0/00c187a74a6160c670f983e737942c230ff54a35.png


2 - Visit this website: https://titanembeds.com/ and login in the upper right corner with your Discord login, then click “Start here”

3 - On the next page, authorize the bot.

4 - The page after that, select the server you invited the bot to by clicking “Modify”
https://forum.fivem.net/uploads/default/original/3X/b/2/b2a45dad834ed98d82c354f278794bdc2b553711.png


5 - The page you are brought to will have a bunch of configurable settings. Edit as you see fit. When you edit the settings on the Titan website, you can set it to not open the sign in part in a separate popup.

Set this option to “true”.

6 - Once you get to the bottom of the page, you will see some links. Copy the “Embed” link

https://forum.fivem.net/uploads/default/original/3X/6/b/6b04175227ea9d18cda0c163d72d94b0284048f0.png


7 - Now open the “ui.html”

8 - Add a new link
```
<li data-title="Discord">
     	<a class="nav-myframe" href="https://titanembeds.com/embed/yourlink">
     	<i class="myicon material-icons">group</i>
     	</a>
    </li>
```
9 - To change the icon, visit: https://material.io/tools/icons/?style=baseline
Use one of the image names here and replace the word “group” in the code above.

10 - Restart the resource and open it. The first time you enter it, you will be asked for a name to use. DO NOT CLICK ANYTHING!!! Type in your name and press the ENTER key. You will need to log in again if you are away from it for too long or you restart your server.

### Chat Command to Open Tablet
In the client.lua go to the bottom and comment out this block of code:
```
if (IsControlJustPressed(1, whatever this number will be)) then
                tabEnabled = not tabEnabled -- Toggle tablet visible state
                REQUEST_NUI_FOCUS(tabEnabled)
                print("The tablet state is: " .. tostring(tabEnabled))
                Citizen.Wait(0)
 end
```
Then above it add in this block of code to open the tablet with a chat command instead:
```
RegisterCommand("tab", function()
                tabEnabled = not tabEnabled -- Toggle tablet visible state
                REQUEST_NUI_FOCUS(tabEnabled)
                print("The tablet state is: " .. tostring(tabEnabled))
                Citizen.Wait(0)
 end)
```
Now /tab should open it instead of using a keybind. Thanks to @Chip_W_Gaming for writing the code. We will include it in the next update as an option.  
## Acknowledgments

* This wouldn't have been possible without the help of @throwarray.
* Hat tip to anyone else who's code was used.
* Big thanks to codepen.io for ideas and examples.
* Inspiration.
