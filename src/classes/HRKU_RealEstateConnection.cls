global class HRKU_RealEstateConnection extends DataSource.Connection {
	private final String REAL_ESTATE_SITE = 'https://ionic2-reality-rest-demo.herokuapp.com';

	HRKU_Datasource dataSource;
	
	global HRKU_RealEstateConnection (HRKU_Datasource datasource) {
		this.dataSource = dataSource; 
	}
	
	global HRKU_RealEstateConnection () {
		this(new HRKU_Datasource());
	}
	
    override global List<DataSource.TableResult> search(DataSource.SearchContext searchContext) {
    	return this.dataSource.searchByName(searchContext, this);
    }
    
    override global List<DataSource.Table> sync() {
    	List<DataSource.Column> columnList = new List<DataSource.Column>{
    		this.dataSource.getTextValue('ExternalId', 255),
    		this.dataSource.getUrlValue('DisplayUrl'),
    		this.dataSource.getTextValue('Name', 128),
    		this.dataSource.getTextValue('city', 128),
    		this.dataSource.getTextValue('price', 128) 
    	};
    	
    	return new List<DataSource.Table>{
    		this.dataSource.getRecords(columnList)
    	};
    }
    
    override global DataSource.TableResult query(DataSource.QueryContext queryContext) {
    	return dataSource.query(queryContext, getPropertyByNameMapList());
    }
    
    public List<Map<String, Object>> getPropertyByNameMapList() {
    	HttpRequest httpRequest = new HttpRequest(); 
    	httpRequest.setEndPoint(REAL_ESTATE_SITE + '/properties/');
    	httpRequest.setMethod('GET');
    	HttpResponse httpResponse = (new Http()).send(httpRequest);
    	
    	List<Map<String, Object>> propertyByNameMapList = new List<Map<String, Object>>();
    	for (Object item: (List<Object>)JSON.deserializeUntyped(httpResponse.getBody())) {
    		Map<String, Object> propertyByNameMap = (Map<String, Object>) item;
			propertyByNameMap.put('ExternalId',  propertyByNameMap.get('id'));    		
			propertyByNameMap.put('DisplayUrl',  REAL_ESTATE_SITE + '/');    		
			propertyByNameMap.put('Name',  propertyByNameMap.get('title'));
			propertyByNameMapList.add(propertyByNameMap);			    		
    	} 
    	return propertyByNameMapList;
    }
}