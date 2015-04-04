module ApplicationHelper

  def elo(rating)
    content_tag(:span, class: 'elo_rating') do
      rating.nil? ? '0' : rating.round(1).to_s
    end
  end

  def diff(rating_in, rating_out = nil)
    if rating_out.nil? && rating_in.is_a?(EloRating)
      rating_out = rating_in.out
      rating_in = rating_in.in
    end

    diff = rating_out - rating_in

    classes = if diff > 0
      'glyphicon-arrow-up diff-gain'
    else
      'glyphicon-arrow-down diff-loss'
    end

    "#{diff.round(1)} <span class=\"glyphicon #{classes}\"></span>".html_safe
  end

end
