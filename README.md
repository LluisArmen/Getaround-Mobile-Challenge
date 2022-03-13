# Getaround Mobile Challenge
This car-sharing platform displays a list of cars from the API: https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json
The user can scroll and view the whole list of cars with some information about them. The user can tap to any of the cars of the list and navigate to another view with mode details about that car.


## Code Architecture
The architecture that has been used is MVVM:

### Model
Only one model for the car. I have structured the model based on the information from the API.


### View
There are 2 main views in the App:
- CarsListView
- CarDetailView

And 3 sub-views
- CarListDetailView
- PictureView
- RatingStarsView

**CarsListView**
Main view of Level 1: a list of cars is displayed, showing the brand, model, price, raiting and picture of the car.

**CarDetailView**
Main view of Level 2: detailed view of the selected car from the list is displayed, showing the brand, model, price, raiting and picture of the car, together with some infomation about the owner (name, picture and rating).

**CarListDetailView**
This sub-view is used to define the view of a cell of the table (list) of cars.

**PictureView**
This view is used to get the picture of the car and display it in the correct format. The size of the picture has to be defined. This view is used for the car picture of the list and the car picture and the picture of the owner in the detailed view.

**RatingStarsView**
This view is used to generate the representation of the rating average with stars.


### View Model
The view model works as an interface between the view and the model. Only a GET function in it, used to get the array of cars from the API and store it into a published var. 

The method URLSession is used, and inside the API is decode using JSONDecoder(). This method is asyncronous, so the closure need to be handled inside the DispatchQueue to make sure the process has finished before continuing. 



## Tests
Some basic tests have been defined:
**- UI Tests**  
**- Unit Tests**



## General Comments
The method to get the cars image from the URL is only available from iOS 15: AsyncImage. For the time being, a gray rectangle is used if the iOS version is older than 15.0, but a method to get image from url should be coded instead.

The app has not been tested in different screen sizes, so it might not be 100% adapted for all cases.

The rating average representation is not a definitive solution, because it does not represent the decimal part accurately: the integer part of the number is represented with "filled stars" and the decimal part, only with "half-filled star". To be more accurate, the star should be filled the corresponding percentage, but it would have taken a lot of time to develope it.



## Time to develop the exercice
I have used about 3h30 hours to develop the app:

- **2h30** Level 1
- **30 min** Level 2
- **30 min** for the unit tests and UI tests
