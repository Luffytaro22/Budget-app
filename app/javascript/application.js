// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function() {
    const alert = document.querySelector('.alert');
    const notice = document.querySelector('.notice');

    const observerAlert = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          // If the message is showing.
          setTimeout(function() {
            alert.style.display = 'none';
          }, 5000)
        }
      });
    });

    const observerNotice = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setTimeout(function() {
            notice.style.display = 'none';
          }, 5000)
        }
      });
    });

  // Add the observable element if it's present.
    if (notice) {
      observerNotice.observe(notice);
    } else if (alert) {
      observerAlert.observe(alert);
    }
});

// Code for hide and show the edit and remove options.
const hideAndShow = (event) => {
  const icon = event.currentTarget;
  if (document.querySelector('.modify-remove.show')) {
    return;
  }
  if (icon.querySelector('.modify-remove.hide')) {
    icon.querySelector('.modify-remove.hide').classList.remove('hide');
    icon.querySelector('.modify-remove').classList.add('show');
  }
}

// Every time the page loads.
document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.fa-solid.fa-ellipsis-vertical').forEach((icon) => {
    icon.addEventListener('click', hideAndShow);
  });
});

// Prevent clicking on the 'a' elements.
window.addEventListener('click', (event) => {
  const modifyRemoveElement = document.querySelector('.modify-remove.show');
  const closeIcon = document.querySelector('.modify-remove.show > .fa-solid.fa-x');

  if (modifyRemoveElement && event.target.closest('.flex-row-center.group-links')) {
    event.preventDefault();
  } else if (modifyRemoveElement && !event.target.closest('.fa-solid.fa-ellipsis-vertical') || modifyRemoveElement && event.target === closeIcon) {
    modifyRemoveElement.classList.remove('show');
    modifyRemoveElement.classList.add('hide');
  }
});
