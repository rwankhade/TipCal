# TipCal
Tip calculator.
# Pre-work - *TipCal*

Tip is a tip calculator application for iOS.

Submitted by: Rachana Wankhade

Time spent: 14 hrs

## User Stories
1.User goes on the tip calc screen
2.User will see three percentage 18%, 20%,25% options available
3.User can enter the amount in the Bill field and Total will be based on the calculated tip
4.User should be able to click on the “Setting” and select default setting
5.When user come back on the tip calc screen, that default setting from setting screen should match to % selected on the tip calc screen

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

In addition to this, I implemented these user stories:
* [x] Remember the bill amount across app restarts. After an extended period of time, clear the state. This is a UI trick that Apple uses with the Spotlight app. If you return there a minute later, it will show your most recent search. if you return 10 minutes later, it defaults to blank. To implement this, plug into the application lifecycle and track time using NSDate.
* [x] Use locale specific currency and currency thousands separator.
* [x] Add a light/dark color theme to the settings view. In viewWillAppear, update views with the correct theme colors.
* [x] Make sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [x] Add animations to your UI

GIF created with [LiceCap](http://i.imgur.com/Sqwjv8e.gifv)

## License

    Copyright [2017] [Rachana Wankhade]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
