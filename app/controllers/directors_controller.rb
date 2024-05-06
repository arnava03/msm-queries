class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end
  
  def show
    the_id = params.fetch("the_id")
    @matching_records = Director.where({ :id => the_id})
    @the_director = @matching_records.first
    @movies = Movie.where({ :director_id => the_id})
    render({ :template => "director_templates/details"})
  end

  def eldest
    @the_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    render({ :template => "misc_templates/oldest"})
  end

  def youngest
    @the_director = Director.where.not({ :dob => nil }).order(dob: :desc).first
    render({ :template => "misc_templates/youngest"})
  end
end
