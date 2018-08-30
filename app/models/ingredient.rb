class Ingredient < ApplicationRecord
  has_many :size_conversions

  # note the values for all nutrients are per 100g of ingredient
  def self.create_with_sizes(hash)
    params = { name: hash["desc"]["name"] }
    nutrients = { 
      protein: "Protein",
      fat: "Total lipid (fat)",
      carb: "Carbohydrate, by difference",
      calorie: "Energy",
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
    nutrients.each do |key, value|
      params[key] = hash["nutrients"].find{|nutrient| nutrient["name"] === value }.try :[], "value"
    end
    instance = create!(params)
    hash["nutrients"][0]["measures"].each do |size|
      instance.size_conversions.create!(unit: size["label"], gram_equivalent: size["eqv"], amount: size["qty"])
      raise if size["eunit"] != "g"
    end
    instance
  end

end