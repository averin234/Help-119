# Kreki-119 Mobile (GetX, Dio, MVVM)

run end build app flutter run --flavor prod -t lib/main_prod.dart

This Kreki-119 Mobile using [GetX](https://pub.dev/packages/get) package for State management, routing and Dependency Injection (bindings). We are using [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) (Model View ViewModel) architectural pattern here. For network call we are using [Dio](https://pub.dev/packages/dio) package. We followed the recommended folder structure of GetX and used [Get CLI](https://pub.dev/packages/get_cli) command line tool for creating the folder structure.

# Architecture of this project: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural pattern for Android App development. Basically
this pattern separates User interface from business-logic and data-logic. So that it's divided into three layers: Model layer, 
View layer and View model layer. Let's explore it more deeply.

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

<b>ViewModel:</b> At first let's talk about ViewModel. Actually view model is a controller where we 
implement our business logics. It receives the data from the model and process the data according to
business logic and pushed into the live data observers which is observing by view.

<b>View:</b> View is the collections of widgets like Text, Image, Dropdown etc. Which will be displayed
to the users. Even it controls the user input. When it needs any data it command the view model (In this project it's controller)
for data and observe the response. Till then it may display a loader to the user.

<b>Model:</b> Model is basically backend logic. It controls the data source.

# To configure and run this project [check here](readme_configuration_guideline.md) 
You will find at above link step by step instructions with screenshots.

# run this project by command line
Dev: `flutter run --flavor dev lib/main_dev.dart`

Prod: `flutter run --flavor prod lib/main_prod.dart`

# How to update app information and continue development for your own project?

1. Rename root folder name
2. Update project name and description from pubspec.yaml. 
3. Update app launcher name and icon. [Reference](https://medium.com/@vaibhavi.rana99/change-application-name-and-icon-in-flutter-bebbec297c57)
4. Update your app's package name by [running this command](https://pub.dev/packages/change_app_package_name):

`flutter pub run change_app_package_name:main your_package_name`

# How was this project developed?
- Run [get cli](https://pub.dev/packages/get_cli) command to create project in the required directory: `get create project`
- Create `main_view` by running this command: `get create page:main` and so on...

# StepByStep to add feature
- add your endpoint  in /lib/app/data/remote/endpoint.dart file
- add your model form for (insert/update) with JsonToDart plugin to /lib/app/data/model/form
- add your model response entity with FlutterBeanFactory plugin to /lib/app/data/model/response
- add your implementation call dio http in /lib/app/data/remote folder
- add your implementation for repository in /lib/app/data/repository folder
- create ui modules with [get cli](https://pub.dev/packages/get_cli) example => get create page:yourviewname
- rename class view extend to BaseView
- rename class controller extend to BaseController

# Explain Folder
### app
- bindings : this is dependency injection based on getX Environment
- core => all global data
    - base : base for view, controller, remoteSource, paging
    - model : global model
    - utils : utils for core app
    - values : values for color, style, etc
    - view_bottom : widget for 
    - view_item : widget for item list
    - widget : base global widget
- data => all data source
    - local :
        - db : database local
        - preference : session handler
    - model :
        - form : this is form for data body form
        - response : response data model
    - remote => get your data from rest api
        - endpoint.dart: all endpoint api data
        - folder from modules
    - repository => manipulate your data here (join or whatever) before you present in ui view
        - folder from all modules
- modules : ui view
    - folder from all modules/feature
        - binding: di for view
        - controller: controller for view
        - view: data view
- network
    - exceptions : exception handler
    - provider, logger, requestHeader, errorHandler
- routes : route for all page

### flavors
- environment, env_config, build_config

### generated
- generated folder from Json2DartBean plugin AndroidStudio 

### l10n
- app_en : localization data for english
- app_id : localization data for indonesia


#Issue staticInterop
    follow this url : https://github.com/flutter/flutter/issues/115988

#Java Compability Check
    follow this url : https://docs.gradle.org/current/userguide/compatibility.html

#Command for build release prod
    flutter build appbundle --flavor prod lib/main_prod.dart

#Makesure running before release production
    flutter clean
    flutter pub get

#Makesure environment using
    openjdk 17.0.8
    flutter v3.7.0
    gradle 7.3 (setting in file gradle-wrapper.properties)