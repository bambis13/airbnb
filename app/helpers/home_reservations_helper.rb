module HomeReservationsHelper

  def currency(amount)
    number_to_currency(amount, unit: "¥ ",precision: 0 )
  end

  def make_min_checkin(day)
    return "+#{day}d"
  end

  def make_max_checkin(month)
    return "+#{month}m"
  end

  def convert_date_string(dates)
    return dates.map{|date| date.strftime("%Y/%m/%d")}.uniq.sort
  end

  def convert_date_str(date)
    return date.strftime("%Y/%m/%d")
  end

  # def calc_prices(home)
  #   price = {}
  #   stay_days = params[:days].to_i
  #   fixed_price = home.price.cleaning_fee + home.price.service_fee
  #   add_num = params[:guests_sum].to_i - home.price.additional_fee_from
  #   if add_num > 0
  #     per_day = home.price.default_price + (add_num * home.price.additional_fee_per_person)
  #   else
  #     per_day = home.price.default_price
  #   end
  #   variable_price = (per_day*stay_days)
  #   price[:total] = variable_price + fixed_price
  #   price[:per_day] = per_day
  #   price[:variable] = variable_price
  #   return price
  # end

  def make_disable_dates(reservations,min_stay)
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
    return default_checkout.strftime("%Y/%m/%d")
  end

  def calc_stay_days(checkin, checkout)
    return ( checkout - checkin ).to_i
  end

end
