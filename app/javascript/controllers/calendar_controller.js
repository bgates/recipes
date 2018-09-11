import { Controller } from 'stimulus'

export default class extends Controller {
  
  connect() {
    this.calendar = new FullCalendar.Calendar(this.element, {
      defaultDate: new Date(),
      defaultView: 'agendaWeek',
      minTime: '08:00:00',
      maxTime: '20:00:00',
      allDaySlot: false,
      slotDuration: '01:00:00',
      slotLabelInterval: '04:00:00',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      eventClick: (calEvent, jsEvent, view) => {
        console.log(calEvent, jsEvent, view)
      },
      events: {
        url: '/meals.json',
        type: 'GET'
      }
      /* events: [
        {
          title: 'Lunch',
          start: '2018-09-02T12:30:00',
        },
        {
          title: 'Breakfast',
          start: '2018-09-03T08:00:00',
          end:   '2018-09-03T09:00:00'
        },
        {
          title: 'Lunch',
          start: '2018-09-03T12:00:00'
        },
      ] */
    });
    this.calendar.render();
  }

  reloadEvents() {
    this.calendar.refetchEvents();
  }
}
