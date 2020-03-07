trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();
    for(Opportunity opp : Trigger.New){
        if(opp.StageName =='Closed Won'){
            Task task = new Task(Subject = 'Follow Up Test Task', WhatId=opp.Id);
            taskList.add(task);
        }
    }
    if(!taskList.isEmpty()){
    	insert taskList;
    }
}