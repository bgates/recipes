import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['ingredientAmountTemplate', 'ingredientList', 'ingredientOptions', 'searchResults', 'form', 'ingredient']

  addIngredient(event) {
    event.preventDefault()
    const template = this.ingredientAmountTemplateTarget
    const list = this.ingredientListTarget
    const newIngredient = template.innerHTML
    list.insertAdjacentHTML('beforeend', newIngredient)
    list.lastElementChild.querySelector('input').focus()
    template.innerHTML = template.innerHTML.replace(/(\d+)/g, (_, p1) => parseInt(p1) + 1 )
  }

  searchIngredient(event) {
    event.preventDefault()
    const div = this.searchResultsTarget
    fetch(event.target.href)
      .then(response => response.text())
      .then(html => div.innerHTML = html)
  }

  handleIngredientCreation(event) {
    const data = event.detail[0]
    const active = this.element.querySelector('[data-active]')
    const nameField = active.parentElement.querySelector('input')
    nameField.value = data.id // gets reset by ingredient_list
    const datalist = this.ingredientOptionsTarget
    const dataUrl = datalist.lastElementChild.getAttribute('data-url').replace(/\d+/, data.id)

    const option = document.createElement('option')
    option.value = data.id
    option.textContent = data.name
    option.setAttribute('data-url', dataUrl)
    datalist.appendChild(option)

    active.remove()
    nameField.dispatchEvent(new Event('change'))
  }

  handleSubmit(event) {
    event.preventDefault()
    const data = new FormData(this.formTarget)
    console.log(data)
  }

  intercept() {
    this.ingredientTargets
      .map(elm => this.application.getControllerForElementAndIdentifier(elm, 'ingredient-list'))
      .forEach(ctrl => ctrl.replaceName())
  }
    
}
