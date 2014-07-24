class WikiController < ApplicationController

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect to @wiki
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end


end
