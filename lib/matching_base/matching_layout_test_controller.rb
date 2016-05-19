class MatchingLayoutTestController < UIViewController
     stylesheet MatchingLayoutTestControllerStylesheet
   
    def initWithCardInfo(form_sheet, i, csv_content)
      # @img = a
      @index = i
      @form_sheet = form_sheet
      @csv = csv_content
      self 
    end

  def on_load
     super
        self.view.backgroundColor = UIColor.whiteColor
        self.view.alpha = 0.93
        image = append!(UIImageView, :image_view)
        image.tap do |imgv|
            imgv.contentMode = UIViewContentModeScaleAspectFit
            imgv.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin
            imgv.backgroundColor = UIColor.clearColor
            imgv.userInteractionEnabled = true
            imgv.image = UIImage.imageNamed(@csv[0]) #AnimationHelper.renderImage(UIImage.imageNamed(@character.name), withMargin:10.0, color:UIColor.whiteColor)
            self.view.addSubview(imgv)
        end

        close_button
        image_title
        image_sub_title 
        second_status
  end

  def image_sub_title 
    @image_sub_title = append!(UILabel, :img_sub_title)
    @image_sub_title.text = @csv[2].upcase  
    self.view.addSubview(@image_sub_title)
  end   

  def image_title
    @image_title = append!(UILabel, :image_title_style)
    @image_title.text = @csv[1]
    self.view.addSubview(@image_title)
  end

  def close_button
    @close_button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @close_button.setTitle "X", forState: UIControlStateNormal
    @close_button.setTitleColor UIColor.redColor, forState: UIControlStateNormal
    @close_button.sizeToFit
    @close_button.addTarget(self, action: 'closePopup', forControlEvents: UIControlEventTouchUpInside)
    @close_button.titleLabel.font = UIFont.fontWithName("Corbel", size: '20')
    #@close_button.frame = [[rmq.frame.width/2.7, rmq.frame.height/1.2], [50,50]]
    @close_button.apply_style(:close_button_style)
    self.view.addSubview @close_button
 end


 def second_status
    desc_index = [3,5,7]
    index = desc_index.sample(1)
    @second_status = append!(UILabel, :second_status_style)
    @second_status.text = @csv[index[0]].gsub("\\n", "\n")
    self.view.addSubview(@second_status)
 end


  def closePopup
    @form_sheet.mz_dismissFormSheetControllerAnimated(true, completionHandler: nil)
  end

  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end