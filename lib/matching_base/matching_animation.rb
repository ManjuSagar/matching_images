module MatchingAnimation
  def popup(i, matched_index, final_screen)
    @home_link.hide 
    @reset_link.hide
    @visit_link.hide
    form_sheet = MZFormSheetController.new
    form_sheet.initWithViewController MatchingLayoutTestController.alloc.initWithCardInfo(form_sheet, i, @data[matched_index], @home_link, @reset_link, @visit_link, final_screen, self)
    form_sheet.shouldDismissOnBackgroundViewTap = true
    form_sheet.formSheetWindow.transparentTouchEnabled = true
    form_sheet.portraitTopInset = 10
    form_sheet.presentedFormSheetSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width * 0.90, UIScreen.mainScreen.bounds.size.height * 0.90);
    form_sheet.presentAnimated true, completionHandler: lambda {|c| } 
    form_sheet
  end 

  def final_screen
   open MatchingCongratsScreen.new(nav_bar: false, :f_score=> @score.text)
  end   

  def shuffle_images(images)
    shuffled_images = images.shuffle[0..9]
    uniq_shuffled_images = (shuffled_images.shuffle + shuffled_images.shuffle).shuffle
    uniq_shuffled_images.unshift("")
    uniq_shuffled_images 
  end

  def rotate_image(index, image, time, re_flip)
    @new_image = UIImage.imageNamed image
    @old_image = UIImage.imageNamed 'Blank.jpg'
    UIView.transitionWithView @img[index], duration: time, options: UIViewAnimationOptionTransitionFlipFromLeft,
      animations: lambda {
        @timer = false
        @img[index].image = @new_image
      },
      completion: lambda {|finished|
        @timer = true 
      } 
  end   

  def replace_old_image(index)
    UIView.transitionWithView @img[index], duration: 0.6, options: UIViewAnimationOptionTransitionFlipFromRight,
      animations: lambda {
            @img[index].image = @old_image
        },
        completion: lambda {|finished| 
          @timer = true
        }
  end  

  def change_image(index_of_clicked, clicked_image)
     if @pause_timer
       @pause_timer.invalidate
       @pause_timer = nil
       nw_image = UIImage.imageNamed 'Blank.jpg'
       @img[@index_of_prev_clic].image = nw_image
     end
    if (un_matched_image(index_of_clicked))
      if (@first_clicked != "")
        @second_clicked = clicked_image[0]   
        if ((@first_clicked == @second_clicked) && (@index_of_prev_clic != index_of_clicked))
          rotate_the_image_after_map(index_of_clicked, clicked_image) 
        else 
          @first_clicked = @second_clicked  
          @index_of_prev_clic = index_of_clicked
          @second_clicked = ""
          rotate_image(index_of_clicked, @first_clicked, 0.6, true)
          @pause_timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target:self, selector:'timerFired', userInfo:nil, repeats:false) 
          @clicked_index = index_of_clicked
        end
      else  
        @first_clicked = clicked_image[0] 
        @second_clicked = ""
        @index_of_prev_clic = index_of_clicked
        rotate_image(index_of_clicked, clicked_image[0], 0.6, true)
        @pause_timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target:self, selector:'timerFired', userInfo:nil, repeats:false) 
        @clicked_index = index_of_clicked 
      end 
    end
  end  


  def timerFired(index = nil)
    index = @clicked_index || index
    @pause_timer = nil
    replace_old_image(index)
  end

  def get_match_score(index_of_clicked)
    puts "kdjfvhvfnmk,llkmdjnnjm,lmkjnnm,lmjnh"
    count = (@image_clicked_count["#{index_of_clicked}"] + @image_clicked_count["#{@index_of_prev_clic}"])
    matched_score = case count 
                    when 3
                      50
                    when 2 
                      50
                    when 4
                      25
                    when 5
                      10 
                    else 
                      1  
                  end
    matched_score              
  end   

  def rotate_the_image_after_map(index_of_clicked, clicked_image)
    rotate_image(@index_of_prev_clic, @first_clicked, 0.2, false)
    rotate_image(index_of_clicked, @second_clicked, 0.2, false)
    ms = get_match_score(index_of_clicked)
    @get_score += ms
    @score.text = @get_score.to_s
    @matched_count += 1
    @clicked_images << index_of_clicked
    @clicked_images << @index_of_prev_clic 
    @index_of_prev_clic = ""
    @first_clicked = ""
    @second_clicked = ""
    if (@matched_count == 10)
      popup(@index_of_prev_clic, clicked_image[1], true)
      #open MatchingCongratsScreen.new(nav_bar: false, :f_score=> @score.text)
    else
      popup(@index_of_prev_clic, clicked_image[1], false)
    end   
  end    
end 