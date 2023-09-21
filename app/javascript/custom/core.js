const alert_setup = (event) => {
  let alert_container = document.querySelector('p.alert');
  if (!alert_container) { 
    return; 
  }
  setTimeout((function() {
    fadeOut(alert_container);
  }), 4000);

  alert_container.addEventListener('click', function (event) {
    event.preventDefault();
    fadeOut(alert_container);
  });
}

const fadeOut= (element) => {
  element.style.opacity = 1;
  setInterval(function() {
    if (element.style.opacity > 0) {
      element.style.opacity -= 0.1;
    }
  }, 25);
}

const initialize_dropdown = (element) => {
  document.querySelector(element).addEventListener('click', function(e) {
    e.preventDefault();

    this.classList.toggle("show");
    [...this.parentNode.children].filter((child) => child !== this)[0].classList.toggle("show");
  });
}

const bootstrap_dropdown_setup = (event) => {
  initialize_dropdown(".dropdown-toggle");
};

const hidden_form_setup = (event) => {
  initialize_dropdown(".hidden-form-initiator");
};


document.addEventListener('turbo:load', hidden_form_setup);
document.addEventListener('turbo:load', bootstrap_dropdown_setup);
document.addEventListener('turbo:load', alert_setup);