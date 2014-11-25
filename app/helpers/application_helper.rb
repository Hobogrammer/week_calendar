module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-error',
    alert: 'alert-block',
    notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def number_to_time_string(time_num)
    time = ''
    if time_num < 12
      (time_num % 1).zero? ? time += "#{time_num}:00am" : time +="#{time_num.to_i}:30am"
    else
      (time_num % 1).zero? ? time += "#{((time_num - 12))}:00pm" : time += "#{(time_num-12).to_i}:30pm"
    end
  end

end
