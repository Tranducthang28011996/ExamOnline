class RelationshipsController < ApplicationController
  def update
    @relationship = Relationship.find_by id: params[:id]
    if @relationship
      @relationship.update_attributes status: params[:status]
      room = Room.find_by id: @relationship.follower_id
      render json: {
        html: render_to_string(partial: "rooms/status_user_in_room", locals: {room: room})
      }
    end
  end
end
