class Ingredient < ApplicationRecord
  has_many :size_conversions, -> { order(gram_equivalent: :desc) }
  belongs_to :serving_size, class_name: "SizeConversion", foreign_key: :size_conversion_id, optional: true
  accepts_nested_attributes_for :size_conversions

  NUTRIENTS = { 
    protein: "Protein",
    fat: "Total lipid (fat)",
    carb: "Carbohydrate, by difference",
    calories: "Energy",
    fiber: "Fiber, total dietary",
    sugar: "Sugars, total",
    calcium: "Calcium, Ca",
    iron: "Iron, Fe",
    magnesium: "Magnesium, Mg",
    phosphorus: "Phosphorus, P",
    potassium: "Potassium, K",
    sodium: "Sodium, Na",
    zinc: "Zinc, Zn",
    vitamin_c: "Vitamin C, total ascorbic acid",
    thiamin: "Thiamin",
    riboflavin: "Riboflavin",
    niacin: "Niacin",
    vitamin_b6: "Vitamin B-6",
    folate: "Folate, DFE",
    vitamin_b12: "Vitamin B-12",
    vitamin_a: "Vitamin A, IU",
    vitamin_e: "Vitamin E (alpha-tocopherol)",
    vitamin_d: "Vitamin D",
    vitamin_k: "Vitamin K (phylloquinone)",
    saturated_fat: "Fatty acids, total saturated",
    monounsaturated_fat: "Fatty acids, total monounsaturated",
    polyunsaturated_fat: "Fatty acids, total polyunsaturated",
    trans_fat: "Fatty acids, total trans",
    cholesterol: "Cholesterol"
  }

  MINERALS = [ :calcium, :iron, :magnesium, :phosphorus, :potassium, :sodium, :zinc  ]
  
  VITAMINS = [ :vitamin_a, :thiamin, :riboflavin, :niacin, :vitamin_b6, :vitamin_b12, :folate, :vitamin_c, :vitamin_d, :vitamin_e, :vitamin_k ]
  
  # note the values for all nutrients are per 100g of ingredient
  def self.create_with_sizes(hash)
    params = { name: hash["desc"]["name"], ndbno: hash["desc"]["ndbno"] }
    NUTRIENTS.each do |key, value|
      params[key] = hash["nutrients"].find{|nutrient| nutrient["name"] === value }.try :[], "value"
    end
    instance = create!(params)
    hash["nutrients"][0]["measures"].each do |size|
      instance.size_conversions.create!(unit: size["label"], gram_equivalent: size["eqv"], amount: size["qty"])
      raise if size["eunit"] != "g"
    end
    instance
  end

  def grams_in(unit_name)
    size_conversions.find_by(unit: unit_name).grams
  end

  def serving_size_name
    serving_size ? "#{serving_size.amount} #{serving_size.unit}" : "100g"
  end

  def serving_size_g
    serving_size ? serving_size.gram_equivalent : 100
  end

  def per_serving(nutrient)
    serving_size_g / 100.0 * send(nutrient)
  end
end
