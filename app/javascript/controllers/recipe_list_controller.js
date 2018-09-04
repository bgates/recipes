import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['unitList', 'name', 'number', 'link']

  replaceId(event) {
    event.preventDefault()
    // if (this.selectedOption) {
      this.updateInputRow()
    /* } else {
      this.showSearchLink()
    } */
    this.nameTarget.blur()
  }

  replaceName() {
    this.nameTarget.value = this.nameTarget.getAttribute('data-id')
  }

  get selectedOption() {
    return Array.from(
      this.parentController
      .recipeOptionsTarget
      .querySelectorAll('option')
    ).find(option => option.value === this.nameTarget.value)
  }

  get parentController() {
    const parent = this.data.get('parent')
    const parentDiv = document.querySelector(`.${parent}`)
    return this.application.getControllerForElementAndIdentifier(parentDiv, parent)
  }

  updateInputRow() {
    /* fetch(this.selectedOption.getAttribute('data-url'))
      .then(response => response.text())
      .then(html => this.unitListTarget.innerHTML = html) */
    this.nameTarget.setAttribute('data-id', this.selectedOption.value)
    this.nameTarget.value = this.selectedOption.textContent
    this.numberTarget.focus()
      /* if (this.hasLinkTarget) {
      this.linkTarget.remove()
    } */
  }

  selectAll(event) {
    event.target.select()
  }

  removeRecipe(event) {
    event.preventDefault()
    this.element.remove()
  }
}

