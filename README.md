# Office Locations

## Overview

This app:  
 - Downloads the list of cities from a local json file.  
 - Parses the json file and shows cities in a list in alphabetical order.  
 - Shows the search bar  
 - Allows to perform a case insensitive search by a given prefix string.  
 - Shows the location of the city on the Map view.  
 - Show the detail of the city on tap of map pin. This information is read from a local json file currently.  

## Screen shots

City list: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot1.png

Active search: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot2.png

Master detail landscape mode: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot3.png

Landscape active search: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot4.png

Map view: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot5.png

About view: https://bitbucket.org/ashishjindal007/office-locations/src/master/Screenshots/ScreenShot6.png

## Approach - Design Pattern
This application is developed using MVVM architecture. Decoupling of the UI and business logic results in thin, flexible, and easy-to-read view controller classes. App also shows some flavor of Decoration design pattern.

## Search Algorithm
Search is implemented using "Trie Data Structures". A tree like structure is formed using the city title (city name, country code). Each node of the tree represents a character. Each trie has an empty root node, with links (or references) to other nodes — one for each possible character. Searched cities are retrieved by traversing down a branch path of the tree. 

## Known Issues
There are a couple of known issues. Some of them are:  
1. Search bar shows up on map view as well in case of active search.
2. App load time is not optimized.
3. No Results view is not implemented in case of no search results.
4. About screen shows information from a json file and not the selected city file (tried not to change the code provided to me)

