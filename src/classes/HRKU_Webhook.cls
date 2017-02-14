public class HRKU_Webhook {
	private final String DOMAIN = 'https://foo.herokuapp.com';
	
	public String createJSON(List<Object> newObjectList, List<Object> oldObjectList) {
		return '{' 
				+ '"new":' + this.serialize(newObjectList) + ','
				+ '"old":' + this.serialize(oldObjectList) + ','
				+ '"userId":' + JSON.serialize(UserInfo.getUserId()) 
			+ '}';
	}

	public String createJSON(List<Object> objectList) {
		return this.createJSON(objectList, null);
	}
	
	private String serialize(List<Object> objectList) {
		return (objectList != null) 
			? JSON.serialize(objectList) 
			: '[]' ;
	}
	
	@future(callout=true)
	public static void createHook (String endpoint, String jsonContent) {
		(new HRKU_Webhook()).callHeroku(endpoint, jsonContent); 
	}
	
	private void callHeroku(String endpoint, String jsonContent) {
    	HttpRequest httpRequest = new HttpRequest();
    	httpRequest.setEndpoint(DOMAIN + endpoint);
    	httpRequest.setMethod('POST');
    	httpRequest.setHeader('Content-Type', 'application/json');
    	httpRequest.setBody(jsonContent);

		(new Http()).send(httpRequest);
	}
}