module ApplicationHelper

  def alert_tag name, klass = nil, options = nil
    type =
      case klass.to_sym
      when :notice then :success
      when :error then :danger
      end

    options ||= {:role => 'alert'}
    options[:class] ||= ''
    options[:class] << " alert alert-#{type}"
    options[:class] << ' alert-dismissable' if options.delete(:dismissable)

    content_tag :div, options do
      concat close_icon_tag
      concat name.html_safe
    end
  end

  def close_icon_tag
    button_tag(
      :class => 'close',
      :data => {:dismiss => 'alert'},
      :aria => {:hidden => true}) do
        raw '&times;'
    end
  end

end
