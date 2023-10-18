// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("submit", function() {
  // Wait a few seconds to flash messages appear.
  setTimeout(function() {
    const alert = document.querySelector('.alert');
    const notice = document.querySelector('.notice');

    const observerAlert = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        // Si es observable, entra
        if (entry.isIntersecting) {
          // If the message is showing.
          setTimeout(function() {
            alert.style.display = 'none';
          }, 2000)
        }
      });
    });

    const observerNotice = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        // Si es observable, entra
        if (entry.isIntersecting) {
          setTimeout(function() {
            notice.style.display = 'none';
          }, 2000)
        }
      });
    });

  // Add the observable element if it's present.
    if (notice) {
      observerNotice.observe(notice);
    } else if (alert) {
      observerAlert.observe(alert);
    }
  }, 5000)
});
