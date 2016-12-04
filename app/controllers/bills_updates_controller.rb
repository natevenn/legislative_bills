class BillsUpdatesController < ApplicationController
  def index
    #if params for both date and type exist
      #query Audits table where created_at = date and auditable_type = type and sort by date desc
    #elsif only params type exists
      #query Audits table where auditable_type = type and sort by date desc
    #elsif only params date exists
      #query Audits table where created_at = date and sort by date desc
    #else
      #return all updates sort by date desc
    #end
  end
end
