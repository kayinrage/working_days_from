# WorkingDaysFrom by Ireneusz Skrobis 2010
module ActiveSupport
  module CoreExtensions
    module Numeric
      module Time

        # returns a working day _n_ working days from now
        # i.e. 4.working_days_from_now
        # method is aliased with _working_day_from_now
        def working_days_from_now
          working_days_from_date(::Date.today)
        end

        alias :working_day_from_now :working_days_from_now

        # returns a working day _n_ working days from given date 
        # i.e. 4.working_days_from_date(Date.parse('06-06-2010'))
        # method is aliased with _working_day_from_date(date)
        def working_days_from_date(date)
          date = date + 1.day if date.cwday == 6
          day_of_the_week = date.cwday == 7 ? 0 : date.cwday
          calendar_days, business_days = self, self
          result_date = day_of_the_week + business_days
          if (result_date >= 6)
            business_days -= (6 - day_of_the_week)
            calendar_days += 2
            weeks = business_days / 5
            calendar_days += (weeks * 2)
          end
          date + calendar_days.days
        end

        alias :working_day_from_date :working_days_from_date

      end
    end
  end
end