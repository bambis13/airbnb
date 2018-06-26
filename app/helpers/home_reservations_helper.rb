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

end
