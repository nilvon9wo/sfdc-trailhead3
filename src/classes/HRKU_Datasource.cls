global class HRKU_Datasource {
    global List<DataSource.TableResult> searchByName(
    		DataSource.SearchContext searchContext, 
    		DataSource.Connection connection
    	) {
    		return DataSource.SearchUtils.searchByName(searchContext, connection);
    }
    
    global DataSource.Column getTextValue(String fieldName, Integer length) {
    	return DataSource.Column.text(fieldName, length);
    }

    global DataSource.Column getUrlValue(String fieldName) {
    	return DataSource.Column.url(fieldName);
    }
    
    global DataSource.Table getRecords(List<DataSource.Column> columnList) {
    	return DataSource.Table.get('Properties', 'Name', columnList);
    }
    
    global DataSource.TableResult query(
    		DataSource.QueryContext queryContext, 
    		List<Map<String, Object>> propertyByNameMapList
    	) {
	    	return DataSource.TableResult.get(
	    		queryContext, 
	    		DataSource.QueryUtils.process(queryContext, propertyByNameMapList)
	    	);  
    }
    
}