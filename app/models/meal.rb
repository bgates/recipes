class Meal < ApplicationRecord

  has_many :recipe_line_items, dependent: :destroy
  accepts_nested_attributes_for :recipe_line_items
  has_many :recipes, through: :recipe_line_items
  has_many :ingredient_line_items, dependent: :destroy
  accepts_nested_attributes_for :ingredient_line_items
  has_many :ingredients, through: :ingredient_line_items

  def self.for_week(start, finish)
    start = start ? Date.parse(start) : Date.today.beginning_of_week(:sunday)
    finish = finish ? Date.parse(finish) : 7.days.after(start)
    where('date <= ? AND date >= ?', finish, start)
  end

  def start
    date_start = date.strftime("%Y-%m-%d")
    case time
    when "Breakfast"
      "#{date_start}T08:00:00"
    when "Lunch"
      "#{date_start}T12:00:00"
    when "Dinner"
      "#{date_start}T18:00:00"
    end
  end

  def title
    recipes.first.name
  end

  def for_calendar
    self.as_json(
      except: [ :id, :created_at, :updated_at ], 
      include: { 
        recipe_line_items: { only: :servings, methods: :name }, 
        ingredient_line_items: { only: [ :unit_name, :unit_number ], methods: :name } 
      },
      methods: [ :start, :title ]
    )
  end

  Ingredient::NUTRIENTS.keys.each do |nutrient|
    define_method nutrient do
      recipe_line_items.map(&nutrient).sum # + ingredient_line_items.map(&nutrient).sum
    end
  end

  def macros 
    Ingredient::MACROS.each_with_object({}) do |macro, memo|
      memo[macro] = self.send macro
    end
  end
end
