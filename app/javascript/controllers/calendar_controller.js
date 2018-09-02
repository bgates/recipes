import { Controller } from 'stimulus'

export default class extends Controller {
  
  connect() {
    var calendar = new FullCalendar.Calendar(this.element, {
      defaultDate: new Date(),
      defaultView: 'agendaWeek',
      minTime: '08:00:00',
      maxTime: '20:00:00',
      allDaySlot: false,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      eventClick: (calEvent, jsEvent, view) => {
        console.log(calEvent, jsEvent, view)
      },
      events: [
        {
          title: 'Meeting',
          start: '2018-09-02T10:30:00',
          end: '2018-09-02T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-04-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-04-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-04-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-04-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2018-04-13T07:00:00'
        },
      ]
    });
    calendar.render();
  }

}
