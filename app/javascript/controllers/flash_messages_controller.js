import { Controller } from "@hotwired/stimulus"
import Toastify from 'toastify-js';

// Connects to data-controller="flash-messages"
export default class extends Controller {
  connect() {
    const flashData = JSON.parse(this.element.dataset.flash);

    flashData.forEach(([type, message]) => {
      this.showToast(message, type);
    });
  }

  showToast(message, type) {
    const backgroundColors = {
      notice: "#009688",
      alert: "#f44336",
      error: "#f44336"
    };

    Toastify({
      text: message,
      duration: 3000,
      close: true,
      position: "left",
      style: {
        background: backgroundColors[type] || "#333"
      },
    }).showToast();
  }
}
