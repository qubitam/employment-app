import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {

  connect() {
    this.config = {
      enableTime: false,
      time_24hr: true
    };
    document.addEventListener("focusin", this.getFocus);
    
    super.connect();
  }
  disconnect() {
    document.removeEventListener("focusin", this.getFocus);
  }
  getFocus= (e) => {
    if (e.target.closest(".flatpickr-calendar") !== null) {
      e.stopImmediatePropagation();
    }
  }
}