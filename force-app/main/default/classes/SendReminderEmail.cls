global class SendReminderEmail implements Database.Batchable<sObject> {
    global SendReminderEmail(String query, String subject, String body) {
        this.query = query;
        this.subject = subject;
        this.body = body;
    }
    
    global String query;
    global String subject;
    global String body;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Speaker__c> scope) {
        String[] addresses = new String[]{},
            subjects = new String[]{},
                messages = new String[]{};
                    for (Speaker__c speaker : scope) {
                        addresses.add(speaker.Email__c);
                        subjects.add(this.subject);
                        messages.add(this.body);
                    }
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       

        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setToAddresses(addresses);

        // Pass this email message to the built-in sendEmail method
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail });
        
    }
    
    global void finish(Database.BatchableContext bc) {
    }
}