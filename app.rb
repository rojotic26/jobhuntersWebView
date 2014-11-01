require 'sinatra/base'
require 'jobhunters'
require 'json'

<<<<<<< HEAD
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
end

  get '/api/v1/job_openings/:category.json' do
    content_type :json
    get_jobs(params[:category]).to_json
  end
end
