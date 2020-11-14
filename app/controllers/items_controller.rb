class ItemsController < ApplicationController

def index
  @items = Items.order("created_at DESC")
end

def new
end

def created
end


end
