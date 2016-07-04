class BillController < ApplicationController
  helper_method :bill

  def show
  end

  def pdf
    send_data BillPDF.new(bill).render, type: 'application/pdf', filename: 'my_bill.pdf'
  end

  private

  def bill
    @bill ||= Bill.latest
  end
end
