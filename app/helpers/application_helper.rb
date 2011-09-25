module ApplicationHelper
  
  def time
    time_ago_in_words(Time.now)
  end
  
  def hidden_div_if(condition, attributes={}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div",attributes, &block)
  end
end
