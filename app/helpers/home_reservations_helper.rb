module HomeReservationsHelper

  def currency(amount)
    number_to_currency(amount, unit: "¥ ",precision: 0 )
  end

  def generate_minDate_str(day)
    return "+#{day}d"
  end

  def generate_maxDate_str(month)
    return "+#{month}m"
  end

  def convert_date_string(dates)
    return dates.map{|date| date.to_s}.uniq.sort
  end

  def generate_disable_dates(reservations,min_stay)
    disable_dates = []
    reservations.each do |reservation|
      checkin = reservation.checkin_date
      checkout = reservation.checkout_date
      days = calc_stay_days(checkin, checkout)
      if days > 1
        (days - 1).times do |i|
          i += 1
          next_day = checkin + i
          disable_dates << next_day
        end
      end
      disable_dates << checkin
      (min_stay - 1).times do |i|
        i += 1
        disable_checkin = checkin - i
        disable_dates << disable_checkin
      end
    end
    return convert_date_string(disable_dates)
  end

  def calc_default_checkout(default_num, input_checkin)
    dt_checkin = input_checkin.to_date
    default_checkout = dt_checkin + default_num
    return default_checkout.to_s
  end

  def calc_stay_days(checkin, checkout)
    return ( checkout - checkin ).to_i
  end

end
