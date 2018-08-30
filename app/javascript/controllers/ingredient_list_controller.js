import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['searchTemplate', 'unitList', 'name', 'number', 'link']

  replaceId(event) {
    event.preventDefault()
    if (this.selectedOption) {
      this.updateInputRow()
    } else {
      this.showSearchLink()
    }
    this.nameTarget.blur()
  }

  replaceName() {
    this.nameTarget.value = this.nameTarget.getAttribute('data-id')
  }

  get selectedOption() {
    return Array.from(
      this.recipeController
      .ingredientOptionsTarget
      .querySelectorAll('option')
    ).find(option => option.value === this.nameTarget.value)
  }

  get recipeController() {
    const recipeDiv = document.querySelector('.recipe-page')
    return this.application.getControllerForElementAndIdentifier(recipeDiv, 'recipes')
  }

  updateInputRow() {
    fetch(this.selectedOption.getAttribute('data-url'))
      .then(response => response.text())
      .then(html => this.unitListTarget.innerHTML = html)
    this.nameTarget.setAttribute('data-id', this.selectedOption.value)
    this.nameTarget.value = this.selectedOption.textContent
    this.numberTarget.focus()
    if (this.hasLinkTarget) {
      this.linkTarget.remove()
    }
  }

  showSearchLink() {
    const selection = this.nameTarget.value
    this.nameTarget.value = ''
    const link = this.searchTemplateTarget.innerHTML.replace(/_/g, selection)
    this.element.insertAdjacentHTML('beforeEnd', link)
    this.element.lastElementChild.setAttribute('data-active', true)
  }

  selectAll(event) {
    event.target.select()
  }

  removeIngredient(event) {
    event.preventDefault()
    this.element.remove()
  }
}

