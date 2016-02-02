## AJAX Sinatra Challenge

In this challenge, you will need to display your AJAX skills by AJAXing a few parts of an existing application. This is a lovely application that keeps track of Penelope's horses.

### Release 0

Within the `application.js` file, write with your **own** words what AJAX is and a brief overview of how to make an AJAX call. This doesn't need to be perfect by any means, just explain your level of understanding of AJAX.

### Release 1

Go ahead and create, migrate, and seed your database prior to taking a look around at this rather complex application. We don't want to change any of the functionality, we only want to enhance the user's experience by implementing some AJAX calls (Penelope doesn't want to wait to view the details of her Horse's). **Add any id's, classes, or partials you need to complete the requirements.**

First, AJAX the rendering of the form that's used to create a new horse so that it is dynamically loaded. For example, after clicking the "Create a new horse" link, the following should appear:

![Horse Form](http://i.imgur.com/DpLoZD5.png)

### Release 2

Upon submission of this form that was dynamically added, we want to append the new Horse to the existing list of horses, like so:

![Horse Inputs](http://i.imgur.com/LVnGaVC.png)

![Append Horse](http://i.imgur.com/uT1r91B.png)

Be sure to remove the form after a new Horse is created.

### Release 3

Penelope isn't satisfied with how fast you've just made your application with cutting out all the refreshes. Lastly, let's AJAX viewing the details of a specific Horse. When clicking on an individual Horse, let's have the details of that Horse appear right beneath that Horse's name, like so:

![Horse Deets](http://i.imgur.com/HrHn0Eq.png)

### Release 4

Done? Refactor your JavaScript to make it more organized. Also, double check your controller methods to make sure they are as organized as possible and control for if a method is evaluated from an AJAX call or a normal HTTP request.

**Finished?** Be sure to commit your code, but please don't push it up to Github until time is called.