class RequestsController < ApplicationController
  def index
    @requests = Request.all

    render("requests/index.html.erb")
  end

  def show
    @request = Request.find(params[:id])

    render("requests/show.html.erb")
  end

  def my_requests


    my_property = Property.where(:user_id => current_user)
    @my_requests = Request.where(:user_id => current_user)
    @my_property_requests = Request.where(:property_id => my_property.ids)




  render("/requests/my_requests.html.erb")
  end

  def new
    @request = Request.new
    @default_property = Property.find_by(:id => params[:property_id])
    render("requests/new.html.erb")
  end

  def create
    @request = Request.new

    @request.property_id = params[:property_id]
    @request.start_date = Chronic.parse(params[:start_date])
    @request.end_date = Chronic.parse(params[:end_date])
    @request.user_id = params[:user_id]
    @request.acceptance = params[:acceptance]
    @request.user_review = params[:user_review]

    save_status = @request.save

    if save_status == true
      redirect_to("/requests/#{@request.id}", :notice => "Request created successfully.")
    else
      render("requests/new.html.erb")
    end
  end

  def edit
    @request = Request.find(params[:id])

    render("requests/edit.html.erb")
  end

  def update
    @request = Request.find(params[:id])

    @request.property_id = params[:property_id]
    @request.start_date = params[:start_date]
    @request.end_date = params[:end_date]
    @request.user_id = params[:user_id]
    @request.acceptance = params[:acceptance]
    @request.user_review = params[:user_review]

    save_status = @request.save

    if save_status == true
      redirect_to("/requests/#{@request.id}", :notice => "Request updated successfully.")
    else
      render("requests/edit.html.erb")
    end
  end

  def destroy
    @request = Request.find(params[:id])

    @request.destroy

    if URI(request.referer).path == "/requests/#{@request.id}"
      redirect_to("/", :notice => "Request deleted.")
    else
      redirect_to(:back, :notice => "Request deleted.")
    end
  end
end
