module HomeReservationsHelper
  def currency(amount)
    number_to_currency(amount, unit: "¥ ",precision: 0 )
  end

  def calc_prices(home)
    price = {}
    stay_days = params[:days].to_i
    fixed_price = home.price.cleaning_fee + home.price.service_fee
    add_num = params[:guests_sum].to_i - home.price.additional_fee_from
    if add_num > 0
      per_day = home.price.default_price + (add_num * home.price.additional_fee_per_person)
    else
      per_day = home.price.default_price
    end
    variable_price = (per_day*stay_days)
    price[:total] = variable_price + fixed_price
    price[:per_day] = per_day
    price[:variable] = variable_price
    return price
  end

  def make_min_checkin(day)
    return "+#{day}d"
  end

  def make_max_checkin(month)
    return "+#{month}m"
  end

  def make_disable_dates(reservations,min_stay)
    disable_dates = []
    reservations.each do |reservation|
    indate = reservation.checkin_date.to_date
    outdate = reservation.checkout_date.to_date 
    days = ( outdate - indate ).to_i
    if days > 1
      (days - 1).times do |i|
        i += 1
        next_day = indate + i
        disable_dates << next_day.strftime("%Y/%m/%d")
      end
    end
    disable_dates << indate.strftime("%Y/%m/%d")
    (min_stay - 1).times do |i|
      i += 1
      disable_checkin = indate - i
      disable_dates << disable_checkin.strftime("%Y/%m/%d")
    end
  end
  return disable_dates.uniq.sort
  end

# [TODO]メソッド切り分け
  # def get_checkout(home, input_checkin, reservations)
  #   min_date = home.availability_setting.minimum_accomodation_range
  #   checkout_dates = {}
  #   dt_checkin = Date.strptime(input_checkin, '%Y-%m-%d')
  #   min_checkout = (dt_checkin + min_date)
  #   checkout_dates[:min] = min_checkout.strftime("%Y-%m-%d")
  #   max_date = home.availability_setting.muximum_accomodation_range
  #   max_checkout = (dt_checkin + max_date)

  #   dt_reservations = []

  #   reservations.each do |reservation|
  #     dt_reservation = Date.strptime(reservation.checkin_date, '%Y-%m-%d')
  #     dt_reservations << dt_reservation if dt_reservation > min_checkout
  #   end
  #   earliest_checkin = dt_reservations.sort[0]
  #   max_checkout = earliest_checkin if earliest_checkin < max_checkout && earliest_checkin >= min_checkout
  #   checkout_dates[:max] = max_checkout.strftime("%Y-%m-%d")
  #   return checkout_dates
  # end

end
