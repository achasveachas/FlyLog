module DisplayTime
  module InstanceMethods

    def display_time(minutes)
      hours = 0
      until minutes < 60
        minutes -= 60
        hours += 1
      end
      "#{hours}:#{minutes.to_s.rjust(2, "0")}"
    end

  end
end
