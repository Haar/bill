class PagesController < ApplicationController

  helper_method :resource

  def bill
  end

  private

  def resource
    @resource ||= Bill.latest
  end
end
