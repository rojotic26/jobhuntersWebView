require_relative 'spec_helper'
require_relative 'support/jobs_helpers.rb'
require_relative 'json'

describe 'Job Offers in CA' do
include JobsHelpers

describe 'Getting the route of the service'
    it 'Should return ok' do
        get '/'
        last_response.must_be :ok?
    end
end

describe 'The sad path'
    it 'Should return 404 for unknown categories of jobs offers' do
        get '/api/v1/job_openings/#{random_str(35)}.json'
        last_response.must_be :not_found?
    end
end

end
