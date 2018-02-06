class RelationshipsController < ApplicationController
  def update
    @relationship = Relationship.find_by id: params[:id]
    if @relationship
      @relationship.update_attributes status: params[:status]
    end
  end
end
