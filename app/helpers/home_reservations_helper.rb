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

  def get_disable_dates(home, reservations)
    disable_dates = []
    min_date = home.availability_setting.minimum_accomodation_range
    reservations.each do |reservation|
      checkin = Date.strptime(reservation.checkin_date, '%Y/%m/%d')
      checkout = Date.strptime(reservation.checkout_date, '%Y/%m/%d')
      days = (checkout - checkin).to_i
      if days > 1
        (days - 1).times do |i|
          i += 1
          next_day = checkin + i
          disable_dates << next_day.strftime("%Y/%m/%d")
        end
      end
      disable_dates << checkin.strftime("%Y/%m/%d")
      min_date.times do |i|
        i += 1
        disable_checkin = checkin - i
        disable_dates << disable_checkin.strftime("%Y/%m/%d")
      end
    end
    return disable_dates
  end
# [TODO]メソッド切り分け
  def get_checkout(home, input_checkin, reservations)
    checkout_dates = {}
    min_date = home.availability_setting.minimum_accomodation_range
    dt_checkin = Date.strptime(input_checkin, '%Y/%m/%d')
    min_checkout = (dt_checkin + min_date)
    checkout_dates[:min] = min_checkout.strftime("%Y/%m/%d")
    max_date = home.availability_setting.muximum_accomodation_range
    max_checkout = (dt_checkin + max_date)
    reservations.each do |reservation|
      dt_reservation = Date.strptime(reservation, '%Y/%m/%d')
      max_checkout = dt_reservation if dt_reservation < max_checkout && dt_reservation > min_checkout
    end
    checkout_dates[:max] = max_checkout.strftime("%Y/%m/%d")
    return checkout_dates
  end

end
