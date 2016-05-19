class MatchingLayoutTestControllerStylesheet < ApplicationStylesheet

	 def setup
	    # Add stylesheet specific setup stuff here.
	    # Add application specific setup stuff in application_stylesheet.rb
	 end

	def image_title_style(st)
	  st.frame = {t: rmq.frame.height/2.3, fl: 38, fr: 50, h: 50}
	  st.color = UIColor.redColor
	  st.text_alignment = :center
	  #st.font = rmq.font.font_with_name('GoodDog', 60)
	  st.font = rmq.font.system(30)
	end

	def second_status_style(st)
	  st.frame = {t: rmq.frame.height/2-20, fl: 30, fr: 50, h: 200}
	  st.number_of_lines = 5
	 st.font = rmq.font.system(25)
	  st.text_alignment = :center
	  st.color = UIColor.brownColor
	end

	def image_view(st)
	  st.frame = {t: 40, w: rmq.frame.width/2.8, h: rmq.frame.height/3, fl: rmq.frame.width/3.5}
	end

	def img_sub_title(st)
	  st.frame = {t: rmq.frame.height/2 + 10, fl: 38, fr: 50, h: 50}
	  st.color = UIColor.redColor
	  st.text_alignment = :center
	  st.font = rmq.font.system(20)
	end

end
