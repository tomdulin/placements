class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success
  include Pagy::Backend
end
