class PicturesController < ApplicationController
  def index
    @pictures = Picture.all

    render("pictures/index.html.erb")
  end

  def show
    @picture = Picture.find(params[:id])

    render("pictures/show.html.erb")
  end

  def property_pics

  @pictures = Picture.where(:property_id => params[:property_id] )
  render("pictures/property_pics.html.erb")
  end

  def new
    @picture = Picture.new

    render("pictures/new.html.erb")
  end

  def create
    @picture = Picture.new

    @picture.image = params[:image]
    @picture.property_id = params[:property_id]

    save_status = @picture.save

    if save_status == true
      redirect_to("/pictures/#{@picture.id}", :notice => "Picture created successfully.")
    else
      render("pictures/new.html.erb")
    end
  end

  def edit
    @picture = Picture.find(params[:id])

    render("pictures/edit.html.erb")
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.image = params[:image]
    @picture.property_id = params[:property_id]

    save_status = @picture.save

    if save_status == true
      redirect_to("/pictures/#{@picture.id}", :notice => "Picture updated successfully.")
    else
      render("pictures/edit.html.erb")
    end
  end

  def destroy
    @picture = Picture.find(params[:id])

    @picture.destroy

    if URI(request.referer).path == "/pictures/#{@picture.id}"
      redirect_to("/", :notice => "Picture deleted.")
    else
      redirect_to(:back, :notice => "Picture deleted.")
    end
  end
end
