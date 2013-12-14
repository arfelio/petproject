class AdminController < ApplicationController
  def index
    @total_contacts = Contact.count
  end
end
