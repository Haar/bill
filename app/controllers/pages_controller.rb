class PagesController < ApplicationController

  helper_method :resource

  def bill
  end

  def bill_pdf
    send_data BillPDF.new(resource).render, type: 'application/pdf', filename: 'my_bill.pdf'
  end

  private

  def resource
    @resource ||= Bill.latest
  end
end
