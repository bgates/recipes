import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['recipeTemplate', 'recipeList', 'recipeOptions', 'recipe', 'ingredientAmountTemplate', 'foodList', 'ingredientOptions', 'ingredient']

  addRecipe(event) {
    event.preventDefault()
    const template = this.recipeTemplateTarget
    const list = this.recipeListTarget
    this.addGeneric(list, template)
  }

  addFood(event) {
    event.preventDefault()
    const template = this.ingredientAmountTemplateTarget
    const list = this.foodListTarget
    this.addGeneric(list, template)
  }

  addGeneric(list, template) {
    const item = template.innerHTML
    list.insertAdjacentHTML('beforeend', item)
    list.lastElementChild.querySelector('input').focus()
    template.innerHTML = template.innerHTML.replace(/(\d+)/g, (_, p1) => parseInt(p1) + 1)
    template.innerHTML = template.innerHTML.replace(/step="([\d\.]+)"/g, 'step="0.01"')
  }

  updateForm() {
    this.ingredientTargets
      .map(elm => this.application.getControllerForElementAndIdentifier(elm, 'ingredient-list'))
      .forEach(ctrl => ctrl.replaceName())
    this.recipeTargets
      .map(elm => this.application.getControllerForElementAndIdentifier(elm, 'recipe-list'))
      .forEach(ctrl => ctrl.replaceName())
  }
    
  handleCreate(event) {
    this.ingredientTargets.forEach((elm, i) => {
      if (i > 0) {
        elm.remove()
      }
    })
    this.recipeTargets.forEach((elm, i) => {
      if (i > 0) {
        elm.remove()
      }
    })
    Array.from(this.element.querySelectorAll('input')).forEach(input => input.value = '')
    // this.element.innerHTML += event.detail[2].response // send to calendar
    console.log(JSON.parse(event.detail[2].response))
    const snackbar = document.querySelector('.snackbar')
    snackbar.classList.add('show')
    setTimeout(() => snackbar.classList.remove('show'), 2000)
    setTimeout(() => snackbar.remove(), 5000)
  }

}

