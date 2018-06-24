class CollaboratorsController < ApplicationController
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.users
    collab_ids = @collaborators.collect(&:id)
    @users = User.where.not(id: collab_ids).where.not(id: current_user.id)
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new(collaborator_params)

    if @collaborator.save
      redirect_to wiki_collaborators_path, notice: "Collaborator was successfully added."
    else
      redirect_to wiki_collaborators_path, notice: "Error adding collaborator. Please try again."
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      redirect_to wiki_collaborators_path, notice: "Collaborator was successfully removed."
    else
      redirect_to wiki_collaborators_path, notice: "Error removing collaborator. Please try again."
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:user_id, :id)
  end
end
