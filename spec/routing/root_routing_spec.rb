require 'spec_helper'

RSpec.describe "routes for root", :type => :routing do
  describe 'routes for login' do
    it 'routes /login to the user sessions controller' do
      expect(get: '/').to route_to('user_sessions#new')
    end
  end
end
