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
