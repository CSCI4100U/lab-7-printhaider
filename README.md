# Lab 07
The starter code for lab 07.

## Overview
For this lab, you will modify the previous lab to use Firestore Cloud as its data source.  The result will be that it could share the data between clients (if using the same account), and changes made by one client will be automatically visible to other clients.

## Instructions
The previous lab had you develop a model which uses SQLite, such that it was kept separated from the user interface.  This will make it somewhat easier for us to migrate to a cloud database.  

### Changes to the Model
The `Grade` class should remain mostly the same, but you will need to add a `DocumentReference` instance variable to it (called `reference`), and change the type of `id` to be `String` (since we will now be using the auto-generated-by-FireStore `DocumentID` as our `id`, which can be accessed via our new reference field).

The `GradesModel` class needs to be heavily modified, since nearly all of the functionality will be different.  Most of the data functions with Firestore Cloud are very simple, often one line of code, so this class will get reduced in size significantly.  Now that `Grade` has a `DocumentReference` instance variable, making updates to the data store should be easy.

### Changes to the User Interface
While it is normally desirable to make minimal changes to the user interface, in this case we need to since we want to support live updates when data is modified in our cloud store.  We'll accomplish this task by using a `StreamBuilder`.  `StreamBuilder` is a class which expects a stream of data, and re-builds the UI when the data has changed.  We've used this class in the in-class demo.  This `StreamBuilder` will now be used to build the `ListView` created in the previous lab.  The `GradesModel` methods can be used as the data source for this `StreamBuilder`, as well as the mechanisms for creating, updating, and deleting Grades from the data store.

## Getting Help
If you run into difficulty, you may wish to check out some of the following resources:

- https://api.flutter.dev/  - The standard documentation for Flutter, all classes and methods.
- https://dart.dev/tutorials - A series of tutorials for the Dart programming language, focusing entirely on the features of Dart.
- https://flutter.dev/docs/reference/tutorials - A series of tutorials for the Flutter platform, focusing mainly on the widgets and API.
- https://flutter.dev/docs/codelabs - A series of deep-dive, more comprehensive, tutorials to learn more about the Flutter platform.
- https://flutter.dev/docs/cookbook - A set of recipes for commonly used features of Flutter.
- https://github.com/flutter/samples/ - A repository containing some completed Flutter applications.
- http://stackoverflow.com/ - A forum for asking questions about programming.  I bet you know this one already!

Of course, you can always ask the TA for help!  However, learning how to find the answers out for yourself is not only more satisfying, but results in greater learning as well.

## How to Submit
Create your flutter project inside this folder, commit, and then push your code to this repository to submit your lab assignment.
