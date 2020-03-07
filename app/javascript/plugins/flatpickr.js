import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr(".datepicker", {enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput: true,
  });

flatpickr("#range_start", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  altInput: true,
  dateFormat: "Y-m-d H:i",
  plugins: [new rangePlugin({ input: "#range_end"})]
})
