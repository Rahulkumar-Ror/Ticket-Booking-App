class AdminController < ApplicationController
  before_action :authenticate_view!
end 