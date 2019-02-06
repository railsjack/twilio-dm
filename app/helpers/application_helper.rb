module ApplicationHelper

  def full_title(title = '')
    base_title = "Simple Message App"
    if title.empty?
      base_title
    else
      base_title + " | " + title
    end
  end

  def humanize_phone_number(phone_number)
    return phone_number unless phone_number.length==11
    "+"+phone_number.split('')[0]+"("+phone_number.slice(1,3)+")"+phone_number.slice(4,3)+"-"+phone_number.slice(7,4)
  end

  def uglify_phone_number(phone_number)
    phone_number.remove(remove(/[^\d]/))
  end

  def humanize_datetime(datetime)
    datetime.strftime("%b %-d, %l:%M%P")
  end

end
