# frozen_string_literal: true

# Provides helpful methods to aid in web responses
module WebResponse
  def redirect_back(fallback_location: root_url)
    if request.env['HTTP_REFERER'].present? && request.env['HTTP_REFERER'] != request.env['REQUEST_URI']
      super(fallback_location: fallback_location)
    else
      redirect_to fallback_location
    end
  end

  def send_back(fallback: nil)
    return redirect_back(fallback_location: fallback) if fallback

    redirect_back(fallback_location: root_path)
  end
end
