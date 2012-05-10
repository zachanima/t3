module ApplicationHelper
  def color_span_tag value, text, threshold
    if threshold >= 0 then
      content_tag :span, class: (value >= threshold ? 'profit' : 'loss') do
        [value, text].join
      end
    else
      content_tag :span, class: (value >= -threshold ? 'loss' : nil) do
        [value, text].join
      end
    end
  end
end
