module MatchingTimer
  def time
    @set_timer = UILabel.new
    @set_timer.text = '00:00  '
    @set_timer.textColor = UIColor.whiteColor
   # @set_timer.frame = {grid: "l0:m0", w: 150} #[[rmq.device.width-50, 5], [100,50]]
    view.addSubview(@set_timer)
    @set_timer.apply_style(:main_time)
    @set_timer.sizeToFit
    @startTime = Time.now
    startTimer
    @set_timer
  end

  def startTimer
    NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: 'updateTimer', userInfo: nil, repeats: true)
  end


  def updateTimer   
   status = UIApplication.sharedApplication.applicationState == UIApplicationStateBackground 
    if (!status)
      @currentTime = @currentTime || Time.now
      @currentTime += 1
      @set_timer.text = time_diff(@startTime, @currentTime) #- @idle_time
    end   
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs
    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600
    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60
    seconds = seconds_diff
    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

end