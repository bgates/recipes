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
    template.innerHTML = template.innerHTML.replace(/(\d+)/g, (_, p1) => parseInt(p1) + 1)
    template.innerHTML = template.innerHTML.replace(/step="([\d\.]+)"/g, 'step="0.01"')
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

  updateForm() {
    this.ingredientTargets
      .map(elm => this.application.getControllerForElementAndIdentifier(elm, 'ingredient-list'))
      .forEach(ctrl => ctrl.replaceName())
  }
    
  handleCreate(event) {
    this.ingredientTargets.forEach((elm, i) => {
      if (i > 0) {
        elm.remove()
      }
    })
    Array.from(this.element.querySelectorAll('input')).forEach(input => input.value = '')
    this.element.querySelector('textarea').value = ''
    const snackbar = document.querySelector('.snackbar')
    snackbar.textContent = event.detail[2].response
    snackbar.classList.add('show')
    setTimeout(() => snackbar.classList.remove('show'), 2000)
    setTimeout(() => snackbar.remove(), 5000)
  }
}
