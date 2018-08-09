module Custodian
    class BaseController < ApplicationController
        layout 'custodian'
        before_action -> { raise 'You are not parent' unless current_user.custodian? }
    end
end
  