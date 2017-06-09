class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activities/index.html.erb")
  end

  def show
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.name = params[:name]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity created successfully.")
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_to(:back, :notice => "Activity deleted.")
    end
  end
end
