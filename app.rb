require 'sinatra/base'
#require 'sinatra/namespace'
require 'jobhunters'
require 'json'
require_relative 'model/offer'


class TecolocoJobOffers < Sinatra::Base
  #register Sinatra::Namespace
  configure :production, :development do
    enable :logging
  end
helpers do
  def get_jobs(category)
    jobs_after = {
      'type of job' => category,
      'kind' => 'openings',
      'jobs' => []
    }

    category = params[:category]
    JobSearch::Tecoloco.getjobs(category).each do |title, date, cities|
      jobs_after['jobs'].push('id' => title, 'date' => date, 'city' => cities)
    end
    jobs_after
  end


  #Defining the function get_jobs_cat_city
  def get_jobs_cat_city(category,city)
    jobs_after_city = {
      'type of job' => category,
      'kind' => 'openings',
      'city' => city,
      'jobs' => []
    }
    category = params[:category]
    city = params[:city]
    JobSearch::Tecoloco.getjobs(category).each do |title, date, cities|
      if cities.to_s == city.to_s
        jobs_after_city['jobs'].push('id' => title, 'date' => date)
      end
    end
    jobs_after_city
  end


  #Defining the function get_jobs_city
  def check_cat(category)
   ##Checks if Category exists within Tecoloco

   case category
   when  "marketing"
      @output = "marketing-ventas"
   when "banca"
      @output = "banco-servicios-financieros"
    else
      @output = "none"
    end
    @output
  end

  def list_joboffers(categories)
    @list_all = {}
    categories.each do |category|
      @list_all[category] = JobSearch::Tecoloco.getjobs(category)
    end
    @list_all
  end
end

  get '/' do
    'JobHunters api/v1 is up and working!'
  end

  get '/api/v1/job_openings/:category.json' do
    cat = params[:category]
    category_url = check_cat(cat)
      if category_url == "none" then
        halt 404
      else
        content_type :json
        get_jobs(category_url).to_json
      end

  end

  get '/api/v1/job_openings/:category/city/:city.json' do
    content_type :json
    get_jobs_cat_city(params[:category],params[:city]).to_json
  end


  post '/api/v1/joboffers' do
    content_type:json
    begin
      req = JSON.parse(request.body.read)
      logger.info req
    rescue
        halt 400
    end

    cat = Category.new
    cat.description = req['description'].to_json
    if cat.save
      status 201
      redirect "/api/v1/offers/#{cat.id}"
    end
  end

    get '/api/v1/offers/:id' do
    content_type:json
    begin
      @category = Category.find(params[:id])
      cat = JSON.parse(@category.description)

    rescue
      halt 400
    end
      list_joboffers(cat).to_json
    end



end
