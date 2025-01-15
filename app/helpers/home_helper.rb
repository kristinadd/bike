module HomeHelper

  def activity_message(activity_count)
    case activity_count
    when 1
      " ❤️ Aw, you created your #{activity_count}th ride!"
    when 2..10
      "You have #{activity_count} rides. Great! bla bla"
    else
      "You have #{activity_count} rides."
    end
  end
end
