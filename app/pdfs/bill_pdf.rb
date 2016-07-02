class BillPDF < Prawn::Document
  def initialize(bill)
    @bill = bill
    super(page_size: 'A4', page_layout: :portrait)

    text 'Latest Bill', size: 32
    stroke_horizontal_rule

    move_down 30
    text 'Insert bill details based on expanded HTML views here'
  end
end
