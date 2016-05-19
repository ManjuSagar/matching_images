class MatchingWelcomeScreen < PM::Screen
  stylesheet MatchingWelcomeScreenStylesheet	
 

  def on_load
  	UIApplication.sharedApplication.statusBar.setAlpha 0
    @img = UIImageView.alloc.init()
    @img.apply_style(:team_dog_image)
    @img.on(:tap){|s| open MatchingHomeScreen.new(nav_bar: true)}
    self.view.addSubview(@img)
    #@start_over = append!(UILabel, :start_game).on(:tap){|s| open MatchingHomeScreen.new(nav_bar: true)}
  end 

end 