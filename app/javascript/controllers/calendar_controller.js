import { Controller } from 'stimulus'

export default class extends Controller {
  
  connect() {
    this.modal = Msg.factory()
    this.calendar = new FullCalendar.Calendar(this.element, {
      defaultDate: new Date(),
      defaultView: 'agendaWeek',
      minTime: '08:00:00',
      maxTime: '20:00:00',
      allDaySlot: false,
      displayEventTime: false,
      slotDuration: '01:00:00',
      slotLabelInterval: '04:00:00',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      eventClick: (calEvent, jsEvent, view) => {
        fetch(calEvent.url, {
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
          }
        })
          .then(response => response.text())
          .then(this.modal.show)
        console.log(calEvent, jsEvent, view)
        return false
      },
      events: {
        url: '/meals.json',
        type: 'GET'
      }
    });
    this.calendar.render();
  }

  reloadEvents() {
    this.calendar.refetchEvents();
  }

  closeModal() {
    this.modal.close()
  }
}
