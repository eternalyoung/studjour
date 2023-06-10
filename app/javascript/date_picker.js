document.addEventListener("DOMContentLoaded", function () {
  const datepicker = document.getElementById("date_picker");
  const form = document.getElementById("date_form");

  datepicker.addEventListener("change", function () {
    form.submit();
  });
});
