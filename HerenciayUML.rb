class Appointment

    attr_reader :location , :purpose , :hour , :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end


class MonthlyAppointment < Appointment

    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min) 
        @day = day
    end

    def occurs_on?(day)
        if self.day == day
            return true
        else 
            return false
        end
    end

    def to_s
        'Reunión mensual en ' + self.location + ' sobre ' + self.purpose + " el dia #{@day} " + "a la(s)" + " #{hour}:#{min}."
    end
end


class DailyAppointment < Appointment


    def occurs_on?(hour, min)
        if self.hour == hour && self.min == min
            return true
        else
            return false
        end
    end

    def to_s
        'Reunión diaria en ' + self.location + ' sobre ' + self.purpose + " a la(s) #{hour}:#{min}."
    end
end


class OneTimeAppointment < Appointment
    
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min) 
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day, month, year)
        if self.day == day && self.month == month && self.year == year
            return true
        else 
            return false
        end
    end

    def to_s
        'Reunión única en ' + self.location + ' sobre ' + self.purpose + " el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}."
    end

end


marzo = MonthlyAppointment.new('Potrerillos 1754', 'Trabajo' , 10, 50 , 17)
mayo25 = DailyAppointment.new('Sazie 333' , 'Reunion' , 8 , 15 )
citaUnica = OneTimeAppointment.new('Republica 52' , 'Entrenamiento' , 10 , 30 , 10, 6, 2021)

puts marzo.occurs_on?(17)
puts marzo.occurs_on?(19)

puts mayo25.occurs_on?(8,15)
puts mayo25.occurs_on?(8,50)


puts citaUnica.occurs_on?(10,6,2021)
puts citaUnica.occurs_on?(10,5,2021)

puts marzo
puts mayo25
puts citaUnica


