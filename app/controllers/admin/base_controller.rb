class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"
end
