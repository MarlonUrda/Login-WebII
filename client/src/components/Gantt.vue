<script setup lang="ts">

import { GanttComponent as EjsGantt, ColumnsDirective as EColumns, ColumnDirective as EColumn } from '@syncfusion/ej2-vue-gantt';
let data = [{
     TaskID: 1,
     TaskName: 'Planning',
     StartDate: new Date('02/03/2017'),
     EndDate: new Date('02/07/2017'),
     Progress: 100,
     Duration: 5,
     subtasks: [
         { TaskID: 2, TaskName: 'Plan timeline', StartDate: new Date('02/03/2017'), EndDate: new Date('02/07/2017'), Duration: 5, Progress: 100,},
         { TaskID: 3, TaskName: 'Plan budget', StartDate: new Date('02/03/2017'), EndDate: new Date('02/07/2017'), Duration: 5, Progress: 100, },
         { TaskID: 4, TaskName: 'Allocate resources', StartDate: new Date('02/03/2017'), EndDate: new Date('02/07/2017'), Duration: 5, Progress: 100, },
         { TaskID: 5, TaskName: 'Planning complete', StartDate: new Date('02/07/2017'), EndDate: new Date('02/07/2017'), Duration: 0, Progress: 0, }
     ]
 },
 {
     TaskID: 6,
     TaskName: 'Design',
     StartDate: new Date('02/10/2017'),
     EndDate: new Date('02/14/2017'),
     Duration: 3,
     Progress: 86,
     subtasks: [
         { TaskID: 7, TaskName: 'Software Specification', StartDate: new Date('02/10/2017'), EndDate: new Date('02/12/2017'), Duration: 3, Progress: 60, },
         { TaskID: 8, TaskName: 'Develop prototype', StartDate: new Date('02/10/2017'), EndDate: new Date('02/12/2017'), duration: 3, Progress: 100,},
         { TaskID: 9, TaskName: 'Get approval from customer', startDate: new Date('02/13/2017'), EndDate: new Date('02/14/2017'), Duration: 2, Progress: 100, },
         { TaskID: 10, TaskName: 'Design Documentation', startDate: new Date('02/13/2017'), endDate: new Date('02/14/2017'), duration: 2, Progress: 100, },
         { TaskID: 11, TaskName: 'Design complete', StartDate: new Date('02/14/2017'), EndDate: new Date('02/14/2017'), Duration: 0, Progress: 0,  }
     ]
 }],
    taskFields = {
      id: 'TaskID',
         name: 'TaskName',
         startDate: 'StartDate',
         endDate: 'EndDate',
         duration: 'Duration',
         progress: 'Progress',
         child: 'subtasks',
 }
</script>

<template>
  <div
    id="projectlist"
    class="absolute bg-white top-[10%] left-[50%] -translate-x-[50%] w-[50%] h-[80%] rounded-[70px] shadow-xl"
  >
  <ejs-gantt id="ganttt" class="mt-16" :dataSource='data' :treeColumnIndex='1' child='subtasks' :taskFields= 'taskFields'>
          <e-columns>
              <e-column field='TaskID' headerText='Task ID' textAlign='Right' width=70></e-column>
              <e-column field='TaskName' headerText='Task Name' textAlign='Left' width=200></e-column>
              <e-column field='StartDate' headerText='Start Date' textAlign='Right' format='yMd' width=90></e-column>
              <e-column field='Duration' headerText='Duration' textAlign='Right' width=80></e-column>
         </e-columns>
      </ejs-gantt>
    </div>

  </template>
  
<style >
   @import "/node_modules/@syncfusion/ej2-base/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-buttons/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-calendars/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-dropdowns/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-inputs/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-navigations/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-popups/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-splitbuttons/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-layouts/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-grids/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-treegrid/styles/material.css";
   @import "/node_modules/@syncfusion/ej2-vue-gantt/styles/material.css";

   #projectlist{
    z-index: 10000;
  }

  #ganttt{
    z-index: 10001;
  }
</style>