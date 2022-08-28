import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validate-employment"
export default class extends Controller {
  static targets = [ "submitEmployment", "input" ]
  connect() {
    this.disableButton()
  }
  
  validateInputs() {
    if (this.isEveryInputEmpty()) {
      this.submitEmploymentTarget.disabled = false
      this.submitEmploymentTarget.classList.remove('bg-gray-200')
      this.submitEmploymentTarget.classList.add('bg-black')
      console.log('valid')
    } else  {
      console.log('not valid')
    }
  }
  isEveryInputEmpty() {
    let valid = true;

    for(let input of this.inputTargets){
      if (input.value == '') {
        valid = false;
        break;
      }
    }
      
    return valid;
  }
  disableButton()
  {
    this.submitEmploymentTarget.disabled = true
    this.submitEmploymentTarget.classList.add('bg-gray-200')
  }
}
