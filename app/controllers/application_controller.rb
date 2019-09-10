# frozen_string_literal: true

# Main application controller. All controller inherit from here
class ApplicationController < ActionController::Base
  include WebResponse
end
