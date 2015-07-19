class API::V1::ProductionsController < ApplicationController
  load_and_authorize_resource

  def index
    @productions = Production.all
    respond_to do |format|
      format.json
    end
  end

  protected

  def single_access_allowed?
    ["index"].include?(action_name)
  end
end
