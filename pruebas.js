const data = {
    "message": [
      {
        "objective_name": "af",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "dd",
        "start_date": "2024-01-02T04:00:00.000Z",
        "deadline": null
      },
      {
        "objective_name": "af",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "Juan",
        "start_date": "2024-01-04T04:00:00.000Z",
        "deadline": null
      },
      {
        "objective_name": "af",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "f",
        "start_date": "2024-07-11T04:00:00.000Z",
        "deadline": "2024-08-13T04:00:00.000Z"
      },
      {
        "objective_name": "Juan",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "Juan",
        "start_date": "2024-07-25T04:00:00.000Z",
        "deadline": "2024-08-14T04:00:00.000Z"
      },
      {
        "objective_name": "acti2",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "juan323",
        "start_date": "2024-07-25T04:00:00.000Z",
        "deadline": "2024-08-14T04:00:00.000Z"
      },
      {
        "objective_name": "acti2",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "fv",
        "start_date": "2024-07-25T04:00:00.000Z",
        "deadline": "2024-08-14T04:00:00.000Z"
      },
      {
        "objective_name": "acti2",
        "objectivestart": "2024-01-02T04:00:00.000Z",
        "task_name": "ff",
        "start_date": "2024-07-25T04:00:00.000Z",
        "deadline": "2024-08-14T04:00:00.000Z"
      }
    ]
  }
  
  //console.log(data.message[0])
let  dataGannt = []



const difference = (date1,date2) => {

    const date1F = new Date(date1)
    const date2F = new Date(date2)
    const diffTime = Math.abs(date2F - date1F)
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    return diffDays
}

const changer = (data) => {
    let idCounter = 1;
    data.message.forEach(object => {
        let existingObjective = dataGannt.find(obj => obj.TaskName === object.objective_name);
    
        if (existingObjective) {
            existingObjective.subtareas.push({
                ID: idCounter++, 
                TaskName: object.task_name,
                StartDate: object.start_date,
                EndDate: object.deadline,
                Duration: difference(object.start_date, object.deadline)
            });
        } else {
            let newObjective = {
                ID: idCounter++,
                TaskName: object.objective_name,
                StartDate: object.objectivestart, 
                subtareas: [{
                    ID: idCounter++, 
                    TaskName: object.task_name,
                    StartDate: object.start_date,
                    EndDate: object.deadline,
                    Duration: difference(object.start_date, object.deadline),
                }]
            };
    
            dataGannt.push(newObjective);
        }
    });
    return dataGannt
}

 dataGannt=changer(data)
 console.log(dataGannt)

/* data.message.forEach(object => {
    console.log('data', object.objective_name);


    let existingObjective = dataGannt.find(obj => obj.TaskName === object.objective_name);

    if (existingObjective) {
        existingObjective.subtareas.push({
            ID: idCounter++, 
            TaskName: object.task_name,
            StartDate: object.start_date,
            EndDate: object.deadline,
            Duration: difference(object.start_date, object.deadline)
        });
    } else {
        let newObjective = {
            ID: idCounter++,
            TaskName: object.objective_name,
            StartDate: object.objectivestart, 
            subtareas: [{
                ID: idCounter++, 
                TaskName: object.task_name,
                StartDate: object.start_date,
                EndDate: object.deadline,
                Duration: difference(object.start_date, object.deadline),
            }]
        };

        dataGannt.push(newObjective);
    }
});
 */

console.log('final gannt', JSON.stringify(dataGannt, null, 2));