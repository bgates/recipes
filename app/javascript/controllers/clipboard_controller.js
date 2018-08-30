import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['source']
  initialize() {
    console.log('clipboard initialize')
  }
  connect() {
    console.log('clipboard connect')
    if (document.queryCommandSupported('copy')) {
      this.element.classList.add('clipboard--supported')
    }
  }
  copy(e) {
    e.preventDefault()
    this.sourceTarget.select()
    console.log(this.sourceTarget)
    document.execCommand('copy')
  }
}
