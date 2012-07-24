class Profile::EventsController < Profile::ProfileController

	def index
		@user_events = current_user.events
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		@event.user = current_user
		if @event.save
			redirect_to @event, :notice => "Successfully added an Event!"	
		else
			render :action => "new"
		end
	end

	def update
		@event = Event.find_by_id(params[:event][:id])
		@event.title = params[:event][:title]
		@event.description = params[:event][:description]
		@event.date = params[:event][:date]
		@event.location = params[:event][:location]
		@event.image = params[:event][:image]
		@event.featured = params[:event][:featured]
		@event.special = params[:event][:special]
		if @event.save!
			redirect_to @event, :notice => "Successfully updated an Event!"	
		else
			render :action => "new"
		end
	end

	def edit
		unless current_user.admin
			@event = current_user.events.find_by_id(params[:id])
		else
			@event = Event.find_by_id(params[:id])
		end
	end

	def destroy
		@event = Event.find_by_id(params[:id])
		if current_user == @event.user
			if @event.destroy
				redirect_to profile_events_path, :notice => "Successfully deleted an Event!"	
			else
				redirect_to profile_events_path, :alert => "Error on deleting an Event!"	
			end
		end

	end

end
