class PagesController < ApplicationController
    def home
      # here all the tasks are displayed but we want the tasks only of a particular user
      @tasks = Task.all
      # @tasks = Task.accessible_by(current_ability)
    end
end
