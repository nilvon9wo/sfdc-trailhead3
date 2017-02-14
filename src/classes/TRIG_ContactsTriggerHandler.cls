public class TRIG_ContactsTriggerHandler extends fflib_SObjectDomain {
    List<Contact> contactList;
    TH_Contacts contacts; 
    
    public TRIG_ContactsTriggerHandler(List<Contact> contactList, TH_Contacts contacts) {
        super(contactList);
        this.contactList = contactList;
        this.Contacts = Contacts;
    }
 
    public TRIG_ContactsTriggerHandler(List<Contact> contactList) {
        this(contactList, new TH_Contacts(contactList));
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> contactList) {
            return new TRIG_ContactsTriggerHandler (contactList);
        }
    }
    
    // ---------------------------------------

    public override void onAfterInsert() {
    	contacts.createHerokuWebhook(); 
    }
}