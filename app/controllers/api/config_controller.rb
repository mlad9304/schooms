module Api

    class ConfigController < ApplicationController
        def school
            json = {
                school: {
                    school_title: Setting.school_title
                }
            }
            
            render json: json
        end
    end

end