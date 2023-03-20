# Taxes module will take care of calculating the taxes for all Item objects.
module Taxes
  # percentage of the import tax, e.g. 5 means 5%
  IMPORT_TAX = 5

  # percentage of the applicable tax, e.g. 10 means 10%
  APPLICABLE_TAX = 10

  # keywords for imported products to apply 5% tax
  IMPORTED_KEYWORDS = %W[
    imported
  ].freeze

  # food items
  # @TODO; this is only for example purposes
  FOOD_ITEMS = %W[
    chocolate
    meat
    food
    coffee
    water
  ].freeze

  # medical items
  # @TODO; this is only for example purposes
  MEDICAL_ITEMS = %W[
    pills
    vitamins
    headache
    stomachache
    painkiller
  ].freeze

  # book items
  # @TODO; this is only for example purposes
  BOOK_ITEMS = %W[
    book
  ].freeze

  # whitelisted items keywords exempt of taxes
  EXEMPT_ITEMS = (
    FOOD_ITEMS + MEDICAL_ITEMS + BOOK_ITEMS
  ).freeze

  # @return [Float] a number with the value of the taxes
  def calculate_taxes
    @calculate_taxes ||= Taxes.round_to_nearest_0_05(applicable_tax + import_duty_tax) 
  end

  private

  # @return [Float] a number of the applicable taxes
  def applicable_tax
    return 0 if exempt_item?

    price * (APPLICABLE_TAX / 100.to_f)
  end

  # @return [Float] a number of the imported taxes
  def import_duty_tax
    return 0 unless imported_item?

    price * (IMPORT_TAX / 100.to_f)
  end

  # @return [Boolean] if the item is exempt of applicable taxes
  def exempt_item?
    EXEMPT_ITEMS.any? { |keyword| name[keyword] }
  end

  # @return [Boolean] if the item is an imported item.
  def imported_item?
    IMPORTED_KEYWORDS.any? { |keyword| name[keyword] }
  end

  # round to nearest 0.05
  # @param number [Float] the float number to round
  # @returns [Float] the float number rounded to the nearest 0.05
  def self.round_to_nearest_0_05(number)
    (number.round(2) * 20).round / 20.0
  end
end