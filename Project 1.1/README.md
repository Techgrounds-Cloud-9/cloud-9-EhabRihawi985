# PRO-1.1 Cloud 9

Make changes to the environment on project01.0.

## Requirements

* The web server must no longer be accessible “naked” on the internet. The customer prefers to see a proxy intervening. Also, the server will no longer have to have a public IP address.
* Should a user connect to the load balancer via HTTP, this connection should be automatically upgraded to HTTPS.
* The connection must be secured with at least TLS 1.2 or higher.
* The web server must undergo a 'health check' on a regular basis.
* Should the web server fail this health check, the server should be automatically restored.
* If the web server is under constant load, a temporary extra server should be started. The customer thinks that there is never more than 3 servers in total needed given the number of users in the past.


## Work plan

- Translate the requirements into user stories.

- Set the user stories in good sequence.

- Set the user stories into actions, and start creating the files.



## User stories

1. Add load balancer as gateway between internet and server to avoid connecting the public ip directly to the server.
2. Use application gateway load balancer to redirect the HTTP connection to HTTPS.
3. Add SSL policy in the proporties of the application gateway to use TLS 1.2 or higher
4. Add web server in scale set to allow adding health check to the created web server.
5. Add automatic repair policy in the proporties of the web server scale set.
6. Add auto scale to scale out when web server set under constant load, and set the max number of created instances as 3



## User story 1
- Add load balancer as gateway between internet and server to avoid connecting the public ip directly to the server.

### solution
- Bicep files created as 'AGW.bicep' to deploy the application gateway and its proporties.

## User stories 2
- Use application gateway load balancer to redirect the HTTP connection to HTTPS.

### solution:
- 

## User story 3
- Add SSL policy in the proporties of the application gateway to use TLS 1.2 or higher

### solution:
- In the bicep file 'AGW.bicep', i have defined the SSL policy to accept minimum TLS version as 1.2

![AGW.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.1/Visualize%20scalesetWS.png)

## User story 4
- Add web server in scale set to allow adding health check to the created web server.

### solution:
- Bicep file is created as 'vmssAGW.bicep' to deploy the web server in scale set and apply health check to the created instance

![vmssAGW.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.1/Visualize%20vmssAGW%20.png)

## User story 5
- Add automatic repair policy in the proporties of the web server scale set.

### solution:
- I have added automatic repair policy in the proporties of the vmssAGW.bicep template.

## User story 6
- Add auto scale to scale out when web server set under constant load, and set the max number of created instances as 3

### solution:
- I have added auto scale resource in the vmssAGW.bicep template to deploy the proporties of the auto scale to the created scale set.

![auto scale](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.1/Visualize%20vmssAGW%20.png)