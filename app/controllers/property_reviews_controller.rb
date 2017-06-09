class PropertyReviewsController < ApplicationController
  def index
    @property_reviews = PropertyReview.all

    render("property_reviews/index.html.erb")
  end

  def show
    @property_review = PropertyReview.find(params[:id])

    render("property_reviews/show.html.erb")
  end

  def new
    @property_review = PropertyReview.new

    render("property_reviews/new.html.erb")
  end

  def create
    @property_review = PropertyReview.new

    @property_review.content = params[:content]
    @property_review.property_id = params[:property_id]
    @property_review.user_id = params[:user_id]

    save_status = @property_review.save

    if save_status == true
      redirect_to("/property_reviews/#{@property_review.id}", :notice => "Property review created successfully.")
    else
      render("property_reviews/new.html.erb")
    end
  end

  def edit
    @property_review = PropertyReview.find(params[:id])

    render("property_reviews/edit.html.erb")
  end

  def update
    @property_review = PropertyReview.find(params[:id])

    @property_review.content = params[:content]
    @property_review.property_id = params[:property_id]
    @property_review.user_id = params[:user_id]

    save_status = @property_review.save

    if save_status == true
      redirect_to("/property_reviews/#{@property_review.id}", :notice => "Property review updated successfully.")
    else
      render("property_reviews/edit.html.erb")
    end
  end

  def destroy
    @property_review = PropertyReview.find(params[:id])

    @property_review.destroy

    if URI(request.referer).path == "/property_reviews/#{@property_review.id}"
      redirect_to("/", :notice => "Property review deleted.")
    else
      redirect_to(:back, :notice => "Property review deleted.")
    end
  end
end
