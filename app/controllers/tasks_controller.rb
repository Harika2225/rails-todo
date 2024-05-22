class TasksController < ApplicationController
    protect_from_forgery except: [:create, :update, :destroy]  # Disable CSRF protection for these actions
  
    def index
      logger.info "URL used for rendering task_list: #{request.original_url}"
      @tasks = Task.all
      render json: @tasks
    end
    
    def new
      @task = Task.new
      render :show_form
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        render json: { message: 'Task created successfully', task: @task }, status: :ok
      else
        render json: { error: 'Failed to create task', details: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def edit
      @task = Task.find(params[:id])
      render :show_form
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        render json: { message: 'Task updated successfully', task: @task }, status: :ok
      else
        render json: { error: 'Failed to update task', details: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      if @task.destroy
        render json: { message: 'Task deleted successfully' }, status: :ok
      else
        render json: { error: 'Failed to delete task' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :note, :completed)
    end
end
# class TasksController < ApplicationController
#     def index
#         logger.info "URL used for rendering task_list: #{request.original_url}"
#         @tasks = Task.all
#         render json: @tasks
#     end
    
#     def new
#         @task = Task.new
#         render :show_form
#     end

#     # only authorized! users can create, edit, update, delete
#     def create
#         #----- create a task through post call
#         # Task.create(task_params)
#         # redirect_to root_path
#         #----- create a task through jquery
#         @task = Task.create(task_params)
#         # @task.user = current_user
#         # authorize! :create, @task
#         @tasks = Task.all
#         save_task
#     end
    
#     def edit
#         @task = Task.find(params[:id])
#         # authorize! :edit, @task
#         render :show_form
#     end

#     def update
#         @task = Task.find(params[:id])
#         # @task.assign_attributes(task_params)
#         @task.update_attributes(task_params)
#         @tasks = Task.all
#         # authorize! :update, @task
#         save_task
#     end

#     # def destroy
#     #     @task = Task.find(params[:id])
#     #     authorize! :destroy, @task
#     #     @task.destroy
#     #     @tasks = Task.accessible_by(current_ability)
#     # end

#     def destroy
#         @task = Task.find(params[:id])
#         @task.destroy
#         @tasks = Task.all
#     end

#     # private

#     def save_task
#         if @task.save
#         # @tasks = Task.accessible_by(current_ability)
#         render :hide_form
#         else
#         render :show_form
#         end
#     end

    
#     # fetch only task_params as only they are required, even in task_params specify those which we want
#     private
#     def task_params
#         params.require(:task).permit(:title, :note, :completed)
#     end

# end
