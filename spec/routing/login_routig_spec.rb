require 'spec_helper'

RSpec.describe "routes for login anad logout", :type => :routing do
  describe 'routes for login' do
    it 'routes /login to the user sessions controller' do
      expect(get: '/login').to route_to('user_sessions#new')
    end

    it 'routes /logout to the user sessions controller' do
      expect(get: '/logout').to route_to('user_sessions#destroy')
    end
  end

  describe 'reoutes for sessions' do
    it 'routes /sessions/new to sessions controller' do
      expect(get: '/sessions/new').to route_to('user_sessions#new')
    end
  end
end
