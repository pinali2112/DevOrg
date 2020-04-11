public class AnimalLocator {

   /* public static String getAnimalNameById1(integer num){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animal/'+num);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        
        System.debug('Response:'+response.getHeader('name'));
  


        return response.getBody();
    }*/
    
    public static String getAnimalNameById(Integer x){

        Http http = new Http();

        HttpRequest req = new HttpRequest();

        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);

        req.setMethod('GET');
    String res;
        HttpResponse response = http.send(req);
           if (response.getStatusCode() == 200) {

            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
    
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
    
            res= (String)animal.get('name');
       
        }
        return res;

    }

}