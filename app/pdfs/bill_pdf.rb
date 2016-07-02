class BillPDF < Prawn::Document
  include ActionView::Helpers::NumberHelper
  include BillHelper

  def initialize(bill)
    @bill = bill
    super(page_size: 'A4', page_layout: :portrait)

    draw_header
    move_down 30
    draw_subscription_info
  end

  def draw_header
    text 'Latest Bill', size: 32
    fill_color '646464'
    draw_text "Due #{date_string(@bill[:statement][:due])}", size: 16, at: [145, y-22]
    fill_color '000000'
    draw_text currency(@bill[:total]), size: 18, at: [460,y-22]
    stroke_horizontal_rule
  end

  def draw_subscription_info
    text 'Packages', size: 18
    move_down 10
    packages = @bill[:package][:subscriptions].map { |s| [s[:name], currency(s[:cost])] }
    table(packages, cell_style: {borders: [:top, :bottom]}, column_widths: [470, 50])
    move_down 52
    draw_text currency(@bill[:package][:total]), at: [475, y], style: :bold
  end
end
