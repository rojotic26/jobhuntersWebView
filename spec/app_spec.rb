require_relative 'spec_helper'
require_relative 'support/jobs_helpers.rb'
require 'json'

describe 'Job Offers in CA' do
include JobsHelpers

describe 'Getting the route of the service'  do
    it 'Should return ok' do
        get '/'
        last_response.must_be :ok?
    end
end

describe 'The sad path: Get' do
    it 'Should return 404 for unknown categories of jobs offers' do
        get "/api/v1/job_openings/#{random_string(35)}.json"
        last_response.must_be :not_found?
    end
end

describe 'The sad path: Post' do
    it 'Should return 400 for JSON Formattin' do
        header = { 'CONTENT_TYPE' => 'application/json' }
        body = random_string(70)
        post '/api/v1/all', body, header
        last_response.must_be :bad_request?
    end
end

  describe 'Checking available job offers via POST' do
    it 'should find jobs' do
      header = { 'CONTENT_TYPE' => 'application/json' }
      body = {
        description: 'Check a valid category',
        category: ['marketing-ventas']
      }

      post '/api/v1/joboffers', body.to_json, header
      last_response.must_be :redirect?
      follow_redirect!
      last_request.url.must_match /api\/v1\/offers\/\d+/
    end
  end

end
