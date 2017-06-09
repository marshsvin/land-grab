class PropertyUsesController < ApplicationController
  def index
    @property_uses = PropertyUse.all

    render("property_uses/index.html.erb")
  end

  def show
    @property_use = PropertyUse.find(params[:id])

    render("property_uses/show.html.erb")
  end

  def new
    @property_use = PropertyUse.new

    render("property_uses/new.html.erb")
  end

  def create
    @property_use = PropertyUse.new

    @property_use.activity_id = params[:activity_id]
    @property_use.property_id = params[:property_id]

    save_status = @property_use.save

    if save_status == true
      redirect_to("/property_uses/#{@property_use.id}", :notice => "Property use created successfully.")
    else
      render("property_uses/new.html.erb")
    end
  end

  def edit
    @property_use = PropertyUse.find(params[:id])

    render("property_uses/edit.html.erb")
  end

  def update
    @property_use = PropertyUse.find(params[:id])

    @property_use.activity_id = params[:activity_id]
    @property_use.property_id = params[:property_id]

    save_status = @property_use.save

    if save_status == true
      redirect_to("/property_uses/#{@property_use.id}", :notice => "Property use updated successfully.")
    else
      render("property_uses/edit.html.erb")
    end
  end

  def destroy
    @property_use = PropertyUse.find(params[:id])

    @property_use.destroy

    if URI(request.referer).path == "/property_uses/#{@property_use.id}"
      redirect_to("/", :notice => "Property use deleted.")
    else
      redirect_to(:back, :notice => "Property use deleted.")
    end
  end
end
