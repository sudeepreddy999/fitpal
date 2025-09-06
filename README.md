
# Fitpal

Fitpal is a fitness and lifestyle app meant to drop the difference between a beginner and a pro and provide a user friendly and interactive way in which you can not only stay healthy but also accomplish other goals like weight loss and muscle building.  

It is meant to provide a engaging experience with streaks leaderboards and xp .  

With this app you can connect with your friends and compare with them; the progress you have made and also participate in daily, weekly and monthly challenges for a healthy marathon.  

Our main feature is also image classification and volume estimation through which with only an image of the food being eaten we can estimate the amount of calories being intake and provide workouts from it. It also analyse the data from you during an exercise to know how much calories you have burnt to keep a control on your goals. 


## Acknowledgements

- [Installation](#Features)
- [Dependencies](#dependencies)
- [Run-locally](#run-locally)
- [Tech Stack](#tech-stack)
- [Features](#features)
- [Screenshots](#screenshots)
- [Authors](#authors)
- [FAQ](#faq)


## Installation

Before you can start using this project, you need to set up your environment. Follow these steps for installation and configuration:

Install Python:

If you don't already have Python installed on your system, you can download it from the official Python website:

Python Official Website
Please choose the appropriate version (recommended: Python 3.12.0) for your operating system.

Install Dart and Flutter Tools and SDK's:

Dart SDK:

If you don't already have Dart SDK installed on your system, you can download it from the official Dart website:

Dart SDK
Please follow the installation instructions provided on the website.

Flutter Tools and SDK:

If you don't already have Flutter tools and SDK installed on your system, you can download it from the official Flutter website:

Flutter
Please follow the installation instructions provided on the website.

Once you have completed the installation steps above, follow the instructions in the Run Locally section for the complete setup required for installation.


## Dependencies

-[**```pandas```**](https://github.com/pandas-dev/pandas)

-[**```plotly```**](https://github.com/plotly/plotly.py)

-[**```flask```**](https://github.com/pallets/flask)

-[**```keras```**](https://github.com/keras-team/keras)

-[**```seaborn```**](https://github.com/seaborn)

-[**```sklearn```**](https://github.com/scikit-learn)

-[**```xgboost```**](https://github.com/dmlc/xgboost)

-[**```opencv```**](https://github.com/opencv/opencv)



## Run locally
To run the Fitpal project locally, follow these steps:

1. Clone the Git repository:
    ```bash
    git clone https://github.com/sudeepreddy999/fitpal
    ```
2. Navigate to the Fitpal folder:
    ```bash
    cd Fitpal
    ```
3. Navigate to the Fitpal_model folder:
    ```bash
    cd Fitpal_model
    ```
4. Install the required dependencies using pip:
    ```bash
    pip install -r requirements.txt
    ```
5. Run the Flask server:
    ```bash
    flask run --host=0.0.0.0
    ```    
6. Open another terminal in the root directory of the project so that the server will keep on running.

7. Run the Flutter app:
    ```bash
    flutter run
    ```

    This command will build and run the Flutter app on your connected device or emulator.



Ensure all steps are followed carefully to successfully run the Voyager project locally.


## Tech stack
- **Flutter** for frontend development.

- **Firebase** for authentication and database management.

- **Firestore** for data storage and retrieval.

- **Flask** for ml model integration.



## Features
- **Workout Tracking**: The system offers users a selection of pre-defined workout plans tailored to their calorie intake and chosen fitness goals. Users can browse through these plans to find one that suits their needs or opt to create a custom workout plan. 

- **Calorie Tracking**: When the user takes a picture of a food item, the system utilizes external service integration to send the images for automated calorie estimation. Once the estimation is completed, the system displays the estimated calorie count to the user. The user then has the option to confirm the displayed calorie count or make adjustments if necessary.

- **Challenges**: Users have the option to browse through available fitness challenges within the system, where each challenge is accompanied by details including its duration, goals, and potential rewards. Upon finding a challenge of interest, the user selects it to participate. 

- **XP and Leaderboards**:On completion of challenge or workout system updates the XP and Challenges are done.The user selects a leaderboard category (e.g., total XP, completed workouts).The system retrieves and displays user rankings based on the chosen category. 


  
## Screenshots
<img src="images/signin.jpg" alt="Intro Page" width="250"> <img src="images/signin1.jpg" alt="Sign In Page" width="250"> <img src="images/register.jpg" alt="Register Page" width="250">

<img src="images/home1.jpg" alt="Home Page" width="250"> <img src="images/home2.jpg" alt="home workoputs Page" width="250"> <img src="images/home3.jpg" alt="home water Page" width="250">

<img src="images/streak.jpg" alt="streak" width="250"> <img src="images/challenges.jpg" alt="challenges" width="250"> <img src="images/profile.jpg" alt="profile Page" width="250">

<img src="images/preview food.jpg" alt="preview food page" width="250"><img src="images/scan_food.jpg" alt="scan food page" width="250">

<img src="images/workout_select.jpg" alt="select workouts" width="250"> <img src="images/start_workout.jpg" alt="start workout" width="250">

<img src="images/add_friends.jpg" alt="add friends" width="250">

<img src="images/initial1.jpg" alt="intial info" width="250"><img src="images/initial2.jpg" alt="intial info2" width="250"><img src="images/initial3.jpg" alt="inital info 3" width="250">

<img src="images/initial4.jpg" alt="initial info4" width="250"><img src="images/initial5.jpg" alt="intial info 5" width="250">






## Authors
- [**Avala Chaitanya Lakshmi Prakash Yadav**](https://github.com/avalachaitanya2004)
- [**Bezawada Sri Sai Anurag**](https://github.com/Anurag154504)
- [**Dharavath Madhu**](https://github.com/Madhudharavath)
- [**Gavireddy Diimppul**](https://github.com/diimppulg)
- [**Mudasani Rushikesh**](https://github.com/Iknowimalone)
- [**Ogireddy Sree Sudeep Reddy**](https://github.com/sudeepreddy999)
- [**Perumalpalli Aditya**](https://github.com/Aditya0407)
- [**Seemakurthi Nandan Sri Siva Ramakrishna**](https://github.com/Nandu-25)
## FAQ
**Q: How do I sign up or log in to the app?**

A:You can sign up or log in by entering your username and password or using Google and Apple Auth. If your credentials are valid, you will be granted access. If there is an error, an error message will be displayed

**Q: How do I choose a workout plan?**

A:You can browse through pre-defined workout plans tailored to your calorie intake and fitness goals, or you can create a custom workout. Each plan details the exercises, sets, reps, and duration.

**Q: How do I add and track calories of the food I eat?**

A:Simply take a picture of your meal, and the app will estimate the calorie count using an automated system (may involve external service integration). You can confirm or adjust the estimated calories, and the app will store this information

**Q: How do I participate in fitness challenges**
A:Browse available challenges in the app, select one that interests you, and confirm your participation. The app tracks your progress automatically as you perform workouts related to the challenge.

**Q: What if I encounter issues or errors in the app?**
A:If you encounter any issues or errors, please use the help and support option in the app to report them. Our support team will assist you in resolving them promptly.

**Q: How accurate is the calorie count provided by the app?**
A:The calorie estimates are based on general data and the images you upload. While we strive for accuracy, actual calorie counts may vary. We recommend using these estimates as a guide and adjusting based on your own experience.
