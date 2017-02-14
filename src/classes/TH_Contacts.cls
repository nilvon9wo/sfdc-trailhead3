public class TH_Contacts {
    private List<Contact> contactList;
	private HRKU_Webhook webhook;
 
    public TH_Contacts(List<Contact> contactList, HRKU_Webhook webhook) {
        this.contactList = contactList;
    	this.webhook = webhook;
    } 

    public TH_Contacts(List<Contact> contactList) {
        this(contactList, new HRKU_Webhook());
    } 

	public void createHerokuWebhook() {
		String json = this.webhook.createJSON(contactList);
		this.webhook.createHook('/new_contact', json);
	}
}