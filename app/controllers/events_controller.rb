class EventsController < ApplicationController
  def index
		@featured_events = EventBanner.order("updated_at")
		@special_events = Event.special.order("updated_at")
		@events = Event.non_featured.page(params[:page])
		@ad ||= Ads.find_by_location("events")
  end

  def show
		@event = Event.find_by_id(params[:id])
  end

end
