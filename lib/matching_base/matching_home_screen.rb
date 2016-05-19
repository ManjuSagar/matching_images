class MatchingHomeScreen < PM::Screen
  stylesheet MatchingHomeScreenStylesheet
  include MatchingTimer
  include MatchingAnimation
          
  def on_load
    UIApplication.sharedApplication.statusBar.setAlpha 0
    self.view.backgroundColor = UIColor.colorWithPatternImage UIImage.imageNamed('background_image')
    self.navigationController.navigationBarHidden = true
    score
    time
    generate_views
    @home_link = append!(UILabel, :home_link).on(:tap){|x| open MatchingWelcomeScreen.new(nav_bar: true)} 
    @reset_link = append!(UILabel, :reset_link).on(:tap){|x| reset_all}
  end

  def score
    return @score unless @score.nil?
    @score ||= UILabel.new
    @score.text = '0          '
    @score.textColor = UIColor.whiteColor
    fontD = @score.font.fontDescriptor
    fontD.fontDescriptorWithSymbolicTraits UIFontDescriptorTraitBold
    @score.font = UIFont.fontWithDescriptor fontD, size: 0
    # @score.frame = {grid: "b0:c0", w: 100}
    @score.apply_style(:main_score)
    @score.sizeToFit
    view.addSubview(@score)
  end

  def generate_views
    images = []
    get_csv_data
    @data.each_with_index do |l, index|
      images << [l[0], index]
    end
    set_initial_values
    uniq_shuffled_images = shuffle_images(images)
    @img = Array.new(21, -1)
     (1..20).each do |i|
        puts "iiiiiiiiiiiiiiiiiiiiii #{i}"
        puts "mmmmmmmmmmmmmmmmmmmmmm #{uniq_shuffled_images[i]}"
        @img[i] = UIImageView.alloc.init()
        @img[i].apply_style("img#{i}".to_sym)
        @img[i].on(:tap){|s| change_image(i, uniq_shuffled_images[i])}
        self.view.addSubview(@img[i])
        @image_clicked_count["#{i}"] = 0
    end
  end   

  def get_csv_data
    @file = @file || NSURL.fileURLWithPath(File.join(NSBundle.mainBundle.resourcePath, 'characters.csv'))
    @data = @data || MotionCSV.parse(NSData.dataWithContentsOfURL(@file).to_s)
  end 

  def set_initial_values
    @first_clicked = ""
    @timer = true 
    @image_clicked_count = {}
    @clicked_images = []
    @get_score = 0
    @matched_count = 0
  end    

  
  def un_matched_image(index_of_clicked)
    @image_clicked_count["#{index_of_clicked}"] += 1
    (!(@clicked_images.include?(index_of_clicked)) && @timer)
  end   
 
  def reset_all 
    @score.text = "0"
    generate_views
    reapply_styles
    @set_timer.text = "00:00"
    @startTime = Time.now
  end   

  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
