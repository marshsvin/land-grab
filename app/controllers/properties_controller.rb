class PropertiesController < ApplicationController
  def index
    # @properties = Property.all


    @q = Property.ransack(params[:q])
    @properties = @q.result(:distinct => true).includes(:activities, :property_uses, :property_reviews)


    render("properties/index.html.erb")
  end

def my_properties
  @properties = Property.where(:user_id => current_user)
  render("my_properties")

end

  def show
    @property = Property.find(params[:id])

    render("properties/show.html.erb")
  end

  def new
    @property = Property.new

    render("properties/new.html.erb")
  end

  def create
    @property = Property.new

    @property.user_id = params[:user_id]
    @property.property_name = params[:property_name]
    @property.address = params[:address]
    @property.zip_code = params[:zip_code]
    @property.state = params[:state]
    @property.city = params[:city]
    @property.acreage = params[:acreage]
    @property.description = params[:description]
    @property.price = params[:price]
    @property.accommodations = params[:accommodations]

    terms_for_url = @property.address.gsub(" ", "+")
    url = "http://maps.googleapis.com/maps/api/geocode/json?address="+terms_for_url
    parsed_data = JSON.parse(open(url).read)
    @property.latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @property.longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    save_status = @property.save

    if save_status == true
      redirect_to("/properties/#{@property.id}", :notice => "Property created successfully.")
    else
      render("properties/new.html.erb")
    end
  end

  def edit
    @property = Property.find(params[:id])

    render("properties/edit.html.erb")
  end

  def update
    @property = Property.find(params[:id])

    @property.user_id = params[:user_id]
    @property.property_name = params[:property_name]
    @property.address = params[:address]
    @property.zip_code = params[:zip_code]
    @property.state = params[:state]
    @property.city = params[:city]
    @property.acreage = params[:acreage]
    @property.description = params[:description]
    @property.price = params[:price]
    @property.accommodations = params[:accommodations]

    save_status = @property.save

    if save_status == true
      redirect_to("/properties/#{@property.id}", :notice => "Property updated successfully.")
    else
      render("properties/edit.html.erb")
    end
  end

  def destroy
    @property = Property.find(params[:id])

    @property.destroy

    if URI(request.referer).path == "/properties/#{@property.id}"
      redirect_to("/", :notice => "Property deleted.")
    else
      redirect_to(:back, :notice => "Property deleted.")
    end
  end
end
