# CatchThePoki

This is a practice project for The Complete iOS 13 Developer Course by Codestars. Original project is called Catch the Kenny.

I made modifications onto the project by adding a welcome view controller where players get greeted by their user name. If there was no user name, then the user can create a new user name. 
There's also an option for the user to change their user name & recreate their name.  There's no error handling in creating the user name aside from the text field cannot be empty. The reason I added this view controller is to practice with segue.
I also created a struct called Player that has name & score as its properties. The score property isn't used this time - will come back to this project after I gain more knowledge in Swift & going through the course more. I created a struct to practice how it works - how to access the property. The name property is used to display in the user name with their score in the second view controller.

I used simple MVC design pattern in this project. Will need to refactor it further in the future as I learn more concepts. 
