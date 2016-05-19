"Matching Base"
=========================================


This is the Gem used to match the images and show th pop up screen of matched image for IOS mobile application developed using the RubyMotion and Rmq.



=========================================


Installation steps 



1) Open GemFile of your Rubymotion project and give specify the gem "matching_base"

2) bundle install

  or

3) gem install matching_base


4) Open the Rakefile of your RubyMotion project and follow the below steps

  a) require 'matching_base'

  b) Inside Motion::Project::App.setup do |app| add the code 
      app.files += MatchingBase.matching_files

  this will add the all the files of gem to the application.
  

  c) Open the app_delegate.rb file and inside on_load method give the below line 
     open MatchingWelcomeScreen.new(nav_bar: false)
     and remove the default open statement.

  d) Create one csv file with "Image,Title,Decription" headers , the image name specified here must be in the resources of your application and also this csv file must be named as "characters.csv" and must be placed inside the resources of your applicaation.

  e) If you want background image, place the image by name "background_image.png" in resources directory.

  f) Place one image by name "Blank.png" and place in resource directory. This image will be used as default card image before the matching.

  g)  
  
  e) bundle exec rake.       
