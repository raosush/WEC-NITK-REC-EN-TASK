class PagesController < ApplicationController
  before_action :authenticate_user!

  # Action for dashboard/landing page.
  def dashboard; end
end
