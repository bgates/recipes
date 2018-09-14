import { Controller } from 'stimulus'

export default class extends Controller {
  
  connect() {
    let options = {
      valueNames: [ 'name', 'calories', 'protein', 'fat', 'carb' ]
    }
    this.ingredientTable = new List(this.element, options)
    this.sorted = {}
  }

  sort(event) {
    const column = event.target.getAttribute('data-type')
    const order = this.sorted[column] ? 'asc' : 'desc'
    this.ingredientTable.sort(column, { order })
    this.sorted[column] = !this.sorted[column]
  }
}

