import { Controller } from "@hotwired/stimulus"
import IMask from "imask"
// Connects to data-controller="validation"
export default class extends Controller {
  static targets = [ "phone", "email", "error" ]
  connect() {
    this.validateEmail()
    var phoneMask = IMask(this.phoneTarget, {
      mask: '000-000-0000'
   });
  }
  validateEmail () {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.emailTarget.value)) {
      this.phoneTarget.disabled = false;
      this.errorTarget.classList.add('hidden')
      console.log('Email Valid')
    } else {
      this.phoneTarget.disabled = true;
      this.errorTarget.classList.remove('hidden')
      console.log('Email Not Valid')
      
    }
  }
 
}
