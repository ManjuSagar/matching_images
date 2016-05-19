class MatchingCongratsScreen < PM::Screen
  stylesheet MatchingSuccessScreenStylesheet	
  attr_accessor :f_score
  include GoogleAnalytics

  def init 

  end   

  def on_load
    UIApplication.sharedApplication.statusBar.setAlpha 0
    @img = UIImageView.alloc.init()
    @img.apply_style(:team_dog_image)
    self.view.addSubview(@img)
    track_pageview("Congrats") 
   # @congrats = append!(UILabel, :congrats_msg)

    @score = append!(UILabel, :final_score)
    @score.text = "Your Score is \n #{f_score}"

    @start_over = append!(UILabel, :start_again).on(:tap){|s| open MatchingWelcomeScreen.new(nav_bar: false)}
   @play_over = append!(UIButton, :play_again).on(:tap){|s| open MatchingHomeScreen.new(nav_bar: false)}
    # rmq.append(UIButton, :play_again).on(:touch) do
    #   open MatchingHomeScreen.new(nav_bar: false)
    # end

   #  @button = UIButton.buttonWithType(UIButtonTypeSystem)

   #  @button.setTitle("Play Again", forState: UIControlStateNormal)
   #  @button.layer.cornerRadius = 10 # SET THE ROUNDING RADIUS HERE
   #  @button.backgroundColor = UIColor.darkGrayColor
   # # @button.addTarget(self, action: :actionForTheButton, forControlEvents: UIControlEventTouchUpInside)
   #  @button.apply_style(:play_again) 
   #  @button.on(:touch) do 
   #    open MatchingHomeScreen.new(nav_bar: false)
   #  end   
   #  self.view.addSubview(@button)

  end 
end 