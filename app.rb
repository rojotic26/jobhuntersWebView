require 'sinatra/base'
require 'jobhunters'
require 'json'

class TecolocoJobOffers < Sinatra:Base
helpers do
def get_offers(category)
jobs = {
'id' => category
'jobs_offers' => []}

cat = params[:category]
offers = JobSearch::Tecoloco.getjobs(cat)

offers.each do |title, date, city|
jobs['jobs_offers'].push('id' => title, 'date' => date, 'city' => city)
end
jobs
end

end
