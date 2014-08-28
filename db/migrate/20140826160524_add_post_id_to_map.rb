class AddPostIdToMap < ActiveRecord::Migration
  def change
    add_reference :maps, :post, index: true
  end
end
