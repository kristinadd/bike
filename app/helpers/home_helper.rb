module HomeHelper

  def activity_message(activity_count)
    case activity_count
    when 1
      " ❤️ Aw, you created your #{activity_count}th ride!"
    when 2..10
      "You have #{activity_count} rides. Starting to get better."
    else
      "You have #{activity_count} rides. You are doing great."
    end
  end
end
