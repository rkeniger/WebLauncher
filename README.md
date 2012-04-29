WebLauncher
============

Description
-----------
WebLauncher is a simple app that will launch a web page stored on disk in Safari (and only Safari).

Installation
------------
No installation is required, the app should run from anywhere.

Usage
-----
The web page (and all other content) must be stored in the `html` folder inside the app bundle. The web page to be launched must be named `index` with any file extension, so `index.html` and `index.htm` are both fine.

To access the `html` folder from the Finder, right-click on the app and select `Show Package Contents`. Then navigate to `Contents > Resources > html`. Copy your index page and related content to that folder, then just double-click the app in the Finder.

The app will not present a UI and will quit immediately after sending the open file message to Safari.
