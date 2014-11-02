require 'sinatra/base'
require 'jobhunters'
require 'json'

class TecolocoJobOffers < Sinatra::Base
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

  end
end

  get '/api/v1/job_openings/:category.json' do
    content_type :json
    get_jobs(params[:category]).to_json
  end
  get '/api/v1/job_openings/:category_:city.json' do
    content_type :json
    get_jobs_cat_city(params[:category],params[:city]).to_json
  end
  get '/api/v1/job_openings/:city.json' do
    content_type :json
    get_jobs_city(params[:city]).to_json
  end

end
