class MatchingWelcomeScreenStylesheet < ApplicationStylesheet
  
  def root_view(st)
    st.background_color = color.white
  end  

  def team_dog_image(st)
    st.frame = {t: 0, w: rmq.frame.width, h: rmq.frame.height, fl: 0}
    st.image = image.resource('opening_screen.png') 
  end 

  def start_game(st)
    st.frame = {t: rmq.frame.height/2 + 90, w: rmq.frame.width, h: 100}
    st.font = rmq.font.font_with_name('Corbel', 40)
    st.color = color.white
    st.text_alignment = :centered
    st.text = "Can You Find \n Two of a Kind?"
    st.number_of_lines = 2
  end 	
 
end
