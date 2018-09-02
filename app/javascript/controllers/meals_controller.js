import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['recipeTemplate', 'recipeList', 'ingredientAmountTemplate', 'ingredientList', 'recipeOptions', 'searchResults', 'form', 'ingredient']

  addRecipe(event) {
    event.preventDefault()
    const template = this.recipeTemplateTarget
    const list = this.recipeListTarget
    const newRecipe = template.innerHTML
    list.insertAdjacentHTML('beforeend', newRecipe)
    list.lastElementChild.querySelector('input').focus()
    template.innerHTML = template.innerHTML.replace(/(\d+)/g, (_, p1) => parseInt(p1) + 1)
    template.innerHTML = template.innerHTML.replace(/step="([\d\.]+)"/g, 'step="0.01"')
  }

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

  updateForm(a, b, c) {
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
    this.element.innerHTML += event.detail[2].response
    const snackbar = this.element.querySelector('.snackbar')
    snackbar.classList.add('show')
    setTimeout(() => snackbar.classList.remove('show'), 2000)
    setTimeout(() => snackbar.remove(), 5000)
  }
}

