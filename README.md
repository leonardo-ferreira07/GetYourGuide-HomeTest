# GetYourGuide HomeTest

Application developed for an application to Senior iOS Engineer position at GetYourGuide. 

It's basically a list of reviews for one of our most [popular Berlin tours](https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/), it has paging feature include, so once the user reaches the bottom of the screen, it will add a loading indicator at bottom and then load more data.

## Requirements:

- Xcode 10.3;
- iOS 12.4;
- Swift 5;
- Cocoapods (as the project only have one small dependency, I've commited it to the repository, so you should be able to run the project without having Cocoapods to install the dependency);

## Installation:

- Open the project directory;
- Run `pod install` to install the dependency via Cocoapods (it should not be necessary as the `/Pods` folder is commited to the repository;
- Open the `GetYourGuide.xcworkspace` file to be able to run the project;

## Third-party libraries:

- [Kingfisher](https://github.com/onevcat/Kingfisher) - Framework written in pure-Swift code for downloading and caching images from the web (I used this to load the profile images from reviewers, the ones that have a profile image);

## Architecture:

### Base files:
The generic files that could be exported into a framework or used by another app without any changes.

- Networking folder - has the networking classes;
- Extensions folder - has the extension classes used around the app;

### App level files:
The files that are dedicated to perform the actions and receive the specific data for  _GetYourGuide Reviews_ app.

- Constants - has the constants files to be used on the app;
- NetworkRequests - has the specific network request for each API call, created conforming to the `RequestProtocol`;
- Models folder - has the models for the data gotten from the webservices;
- Assets folder - has the default assets folder from Xcode and the storyboards (ideally separated into folders);
- Reviews folder - has the components for that specific feature inside the app;
  - Cells - has the `.xib` and `.swift` files for the collection/table view cells needed by the feature;
  - ViewModels - has the view model files for that feature (the view models here are used to instantiate the requester and get the pertinent data, prepare the data and return the data ready to be used by the logic controller);
  - LogicControllers - has the logic controller files (the logic controller contains all the logic to display the data to the user where desired, e.g inside a collection view);
  - ViewControllers - has the view controller files (the view controller is responsible to handle the actions, navigation and updates to the view);
  
 ## Unit tests:
 - I added some unit tests to the project, they are under the `GetYourGuideTests` folder and separated into folders related to their function or architecture.
