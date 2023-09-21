class SecureController < ApplicationController
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit

    def user_for_paper_trail
      current_user.present? ? current_user.name : 'Public user'
    end
  end