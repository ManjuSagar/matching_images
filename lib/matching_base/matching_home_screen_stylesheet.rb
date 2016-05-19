class MatchingHomeScreenStylesheet < ApplicationStylesheet

  def setup
    if (rmq.device.height >= 1024)
        self.grid = RubyMotionQuery::Grid.new({
      content_left_margin: 0,
      content_right_margin: 0,
      content_top_margin: 10,
      content_bottom_margin: 10,
      num_columns: 13,  #13
      column_gutter: 0, #0
      num_rows: 17,
      row_gutter: 0
    })
    else  
      self.grid = RubyMotionQuery::Grid.new({
        content_left_margin: 0,
        content_right_margin: 0,
        content_top_margin: 10,
        content_bottom_margin: 10,
        num_columns: 14,  #13
        column_gutter: 10, #0
        num_rows: 17,
        row_gutter: 0
      })
  end
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.black
    puts "widthhhhhhhhhhhhhhhhhhh #{rmq.frame.width}"
    puts "heightttttttttttttttttt #{rmq.frame.height}"
  end

 def get_width
    case rmq.device.height
    when 1024
      puts "1024"
      @width = 129#152#rmq.frame.width/4.8  #160
      @height = 172#204#rmq.frame.height/6.02   #170
    when 736
      puts "736"
      @width = 88#rmq.frame.width/5.048  #82
      @height = 120 #rmq.frame.height/6.4  #115   #87
    when 667
      puts "667"
      @width = 78#rmq.frame.width/5.1     #73.5
      @height = 108#rmq.frame.height/6.4  #104    79
    when 568
      puts"568"
       @width = 68#rmq.frame.width/5.1       #62.1
       @height = 90#rmq.frame.height/6.52   #87        79
    else  
      puts "480"
      @width = 59#rmq.frame.width/4.92   #67  
      @height = 79#rmq.frame.height/6.07   # 79        69
    end  
  end
  
  def img1(st)
    get_width
    puts "heighttttttt #{@height}"
    puts "widthhhhhhhh #{@width}"
    st.frame = {grid: "b1:d3", w: @width, h: @height}#{t: rmq.frame.height/18, w: rmq.frame.width/5, h: rmq.frame.height/6.5, l: rmq.frame.width/22}
    st.image = image.resource('Blank.jpg')
   # st.border_width = 4
    #st.border_color = color.white
  end

  def img2(st)
    st.frame = {grid: "e1:g3", w: @width, h: @height}#{t: rmq.frame.height/18, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/3.6}
    st.image = image.resource('Blank.jpg')
  end

  def img3(st)
    st.frame = {grid: "h1:j3", w: @width, h: @height}#{t: rmq.frame.height/18, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.96}
    st.image = image.resource('Blank.jpg')
  end

  def img4(st)
    st.frame = {grid: "k1:m3", w: @width, h: @height}#{t: rmq.frame.height/18, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.34}
    st.image = image.resource('Blank.jpg')
  end

  def img5(st)
    st.frame = {grid: "b4:d6", w: @width, h: @height}#{t: rmq.frame.height/4.4, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/22}
    st.image = image.resource('Blank.jpg')

  end

  def img6(st)
    st.frame = {grid: "e4:g6", w: @width, h: @height}#{t: rmq.frame.height/4.4, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/3.6}
    st.image = image.resource('Blank.jpg')
  end

  def img7(st)
    st.frame = {grid: "h4:j6", w: @width, h: @height}#{t: rmq.frame.height/4.4, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.96}
    st.image = image.resource('Blank.jpg')
  end

  def img8(st)
    st.frame = {grid: "k4:m6", w: @width, h: @height}#{t: rmq.frame.height/4.4, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.34}
    st.image = image.resource('Blank.jpg')
  end

  def img9(st)
    st.frame = {grid: "b7:d9", w: @width, h: @height}#{t: rmq.frame.height/2.50, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/22}
    st.image = image.resource('Blank.jpg')
  end

  def img10(st)
    st.frame = {grid: "e7:g9", w: @width, h: @height}#{t: rmq.frame.height/2.50, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/3.6}
    st.image = image.resource('Blank.jpg')
  end

  def img11(st)
    st.frame = {grid: "h7:j9", w: @width, h: @height}#{t: rmq.frame.height/2.50, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.96}
    st.image = image.resource('Blank.jpg')
  end

  def img12(st)
    st.frame = {grid: "k7:m9", w: @width, h: @height}#{t: rmq.frame.height/2.50, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.34}
    st.image = image.resource('Blank.jpg')

  end

  def img13(st)
    st.frame = {grid: "b10:d12", w: @width, h: @height}#{t: rmq.frame.height/1.75, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/22}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img14(st)
    st.frame = {grid: "e10:g12", w: @width, h: @height} #{t: rmq.frame.height/1.75, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/3.6}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img15(st)
    st.frame = {grid: "h10:j12", w: @width, h: @height} #{t: rmq.frame.height/1.75, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.96}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img16(st)
    st.frame = {grid: "k10:m12", w: @width, h: @height} #{t: rmq.frame.height/1.75, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.34}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img17(st)
    st.frame = {grid: "b13:d15", w: @width, h: @height}# {t: rmq.frame.height/1.34, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/22}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img18(st)
    st.frame = {grid: "e13:g15", w: @width, h: @height}#{t: rmq.frame.height/1.34, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/3.6}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img19(st)
    st.frame = {grid: "h13:j15", w: @width, h: @height}# {t: rmq.frame.height/1.34, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.96}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def img20(st)
    st.frame = {grid: "k13:m15", w: @width, h: @height} #{t: rmq.frame.height/1.34, w: rmq.frame.width/5, h: rmq.frame.height/6.5, fl: rmq.frame.width/1.34}
    st.image = image.resource('Blank.jpg')
    #st.border_width = 4
    #st.border_color = color.white
  end

  def home_link(st)
    st.frame = {grid: "b16:c16", w: 100}
    if (rmq.device.height >= 1024)
    st.font = rmq.font.system(30)
    end
    st.color = color.white
    st.text = "Home"
  end 
  
  def reset_link(st)
   # st.frame = {fl: 10, top: rmq.frame.height - 40, h: 30, w: 50}
    st.frame = {grid: "l16:m16", w: 150}
    st.color = color.white
     if (rmq.device.height >= 1024)
      st.font = rmq.font.system(30)
     end
    st.text = "Reset"
  end   

  def main_score(st)
    st.frame = {grid: "b0:c0", w: 100}
     if (rmq.device.height >= 1024)
      st.font = rmq.font.system(30)
     end
  end
  
  def main_time(st)
    st.frame = {grid: "l0:m0", w: 150}
     if (rmq.device.height >= 1024)
      st.font = rmq.font.system(30)
    end
  end  


  def close_button_style(st)
      if (rmq.device.height >= 1024)
       st.frame = {grid:"f15", w: 70} 
     elsif (rmq.device.height == 667)
        st.frame = {grid:"f14", w: 70}
     elsif (rmq.device.height == 736)
        st.frame = {grid:"f14", w: 60}
     elsif (rmq.device.height == 480)
        st.frame = {grid:"f14", w: 50}   
      else 
       st.frame = {grid:"f14", w: 50}
     end
    end   
end









