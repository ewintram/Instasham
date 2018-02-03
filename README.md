# Instasham

## Description

This is an Instagram clone web app which allows users to register an account, post photos with captions, comment on and like photos.

MVC diagram
![alt text](/public/Instasham-MVC.png "Instasham MVC diagram")

Database structure
![alt text](/public/Instasham-database-structure.jpg "Instasham database structure")

## Setup

Check that you have ruby installed

`ruby -v`

If not, install instructions can be found [here](https://www.ruby-lang.org/en/documentation/installation/).

Clone the repo on the command line by running

`git clone git@github.com:ewintram/instagram-challenge.git`

Check that you have bundler installed

`bundler -v`

If not, install by running

`gem install bundler`

Install dependencies by running

`bundle`

Create the databases by running

`rake db:setup`

Migrate the table schema by running

`rake db:migrate`

Paperclip is used for photo attachment management with ActiveRecord. To use the Paperclip gem, ImageMagick must be installed. Installation instructions can be found on the [Paperclip GitHub page](https://github.com/thoughtbot/paperclip).


## Usage

To launch the app, run

`rails s`


Navigate to `http://localhost:3000`

(screen grabs)


## Running tests

Testing is in RSpec and Capybara. To run the tests on the command line, run

`rspec`


## Author

Eleanor Wintram


### User stories

*Step 1 - MVP*

```
As a user
So that I can show an online audience that my breakfast habits are on fleek
I want to post a photo of my breakfast on my Instasham page with a caption
```

```
As a user
In case avocado on toast is no longer on trend
I want to be able to delete my post from my Instasham page
```

```
As a user
So that I can compliment my friend's breakfast photos
I want to be able to comment on other users' photos
```

```
As a user
So that I can check what others are saying about breakfast photos
I want to be able to view all comments
```

```
As a user
So that I can express my enjoyment of someone else's avo-toast
I want 'like' a photo
```

```
As a user
In case accidentally 'like' a photo of someone I'm stalking
I want be able to 'un-like' a photo
```

*Step 2 - User registration*

```
As a user
So that I can access the full functionality of the website
I want to be able to sign up
```

```
As a registered user
So that I can record my activity on the website
I want to sign in and see a custom welcome message
```

```
As a user
So that I can identify the source of a comment
I want to see the username of the commenter
```

```
As a user
So that I can sign up more easily
I want to be able to log in through social media
```

*Step 3 - Limitations*

```
As an administrator
To avoid anonymous posts
A photo must have a registered user associated to it
```

```
As a user
So that no one can delete my posts and comments
I want to be the only one who can delete them
```

```
As a user
In case I regret making a comment on a photo
I want to edit or delete my comments
```

*Step 4 - Bonus feature still to be implemented*

```
As a user
So that I can have the 'glow' all year round
I want to apply filters to my photos
```
