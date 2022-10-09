# Postman

The Postman is a well-known tool for API testing that assists the development team in creating, sharing, and testing API documentation. The Postman tool offers a command-line application for seasoned testers and a GUI interface for testing APIs. Here are some Postman interview questions and answers for fresher or experienced software developers. 

What is Postman?
Postman is a collaboration platform for API development. It is a recognized API client that enables you to organize the creation, division, testing, and documentation of APIs. We can send HTTP/s requests to a repair and receive their responses using the Postman tool. It will enable us to approve the service's uptime and functionality.

What is a collection in Postman?
In Postman, a collection allows you to group related requests. You can also use it to organize the requests into folders systematically.

Why do we use Postman?
Following are some of the most important reasons for using Postman:
It is software that aids with API testing and is available for free use
It aids in managing the complete API lifecycle
It provides Runtime Service to assist with managing API collections, workspaces, environments, and many examples
Additionally, Postman may get integrated with CI/CD programs like Circle CI, Jenkins, etc
It offers a sizable community forum where you can quickly find solutions to any technical problems you run across while using the tool

What is an API?
Application Programming Interface is referred to as API. Technically speaking, an API is a collection of steps, functions, and other points of access that a program, an operating system, a library, etc. makes available to programmers so they can use it to communicate with other software programs.

Name some tools used for API Testing?
The following list includes some of the tools used for API testing:
Postman 
Tricentis Tosca 
Katalon Studio 
Apigee 
Jmeter
SoapUI

What API information is exposed in Web Developer tools?
API information for request headers, response body, and response cookies is exposed in web developer tools.

What can we use to get API information from web developer tools into Postman?
Copy as cURL allows Postman to receive API data from web developer tools.

Where are query parameters stored in a GET request?
The query parameters for the GET request are saved in Postman's URL.

What is meant by the term environment in Postman?
An environment in Postman is a group of key-value pairs. Postman allows you to create various environments that you can switch instantly with a button. There are two different sorts of environments: global and local. They define the variable's scope so you can use it in requests.

What are the core components of an HTTP request?
An HTTP request is made up of five major components:
HTTP methods: A collection of request techniques used to carry out particular actions on resources (GET, PUT, POST, DELETE)
URI (Uniform Resource Identifier): locates a resource.
Version of HTTP (example- HTTP v1.1)
Content-Type: application/JSON, Content-Length: 511) Request Headers
Payload: The message content is contained in the request body.

State the Core Components of an HTTP Response?
Four essential components are present in each HTTP response:
According to the HTTP request's resource, the server's status is indicated by the Status/Response Code. Examples include 404 (resource not found) and 200 (response ok).
HTTP Version - Indicates the version of HTTP being used, such as HTTP v1.1.
The response header is where key-value pairs of metadata for the HTTP response message are stored—for instance, content length, content type, response date, and server type.
The response body indicates response message content or resource representation.

What is GUID?
Global Unique Identifier is referred to as GUID. It consists of hexadecimal digits separated by hyphens. This Postman identifier GUID fulfills the goal of uniqueness

What is the HTTP response code for a POST request with incorrect parameters?
The correct response code for a request with incorrect parameters is 400 Bad Request.

Can local variables be imported in Postman Monitors?
Yes, you can import local variables into Postman Monitors. However, global variables cannot get imported into Postman Monitors.

How can you iterate a request 100 times in Postman?
With the help of Collection Runner, Postman allows us to iterate a request 100 times.

Which programming language is used for Postman tests?
Postman tests are run using JavaScript.

What is a Postman Collection?
We can group several needs using a Postman Collection. It merely enables us to organize the requests into folders.

What do you understand by the term Postman Collection runners?
Data-driven testing is carried out by using a Postman collection runner. API requests are collected for numerous iterations with various data sets.

What is Postman cloud’s purpose if we work in a company? Why?
A Postman cloud is a shared repository where businesses can access Postman collections. Work can be immediately saved in the Postman cloud after logging in. Data and collections are accessible to team members from any location.

Why is it not preferred to save work in Postman cloud?
Since company work cannot be disclosed and must be kept confidential, it is not advised or desired to save your work in the Postman cloud. Since Postman requires sign-in, saving your work there could lead to a security risk.

How will you log variable values in Postman?
You may use the following command in Postman to log the variable values on the console:
console.log(pm.variables.get("variable_name"));

How do you access postman variables?
You may access a Postman variable using the variable name {{var}}.

What are the various authorization methods provided by Postman?
Postman provides the following API request authorization options:
API Key 
Basic auth 
Digest auth 
Hawk Authentication 
Oauth 1.0 
Oauth 2.0 
Bearer Token
NTLM Authentication
AWS Signature 

What are the different types of API requests supported in Postman?
The following is a list of the various API requests that Postman supports:
GET
POST
PUT
PATCH
COPY
DELETE
HEAD
OPTIONS
LINK
UNLINK
PURGE
LOCK
UNLOCK
PROPFIND
VIEW

How are Query Params different from Path Variables?
Query parameters are used to sort or filter the resources, and Path Variables gets used to identify specific resources.

What is Basic Auth in Postman?
Basic Auth is a method of authorization offered by Postman for HTTP user agents, such as web browsers, to enter login and password. It becomes connected with the request after the username and password are entered.

What is digest auth in Postman?
One of Postman's authorization techniques is digest auth or digest authorization. Through this method, clients can send requests to the API first and then receive responses from the server, such as 401 illegal responses and numbers that can only be used once as absolute values. 

What encoding is accepted by Postman in authorization credentials?
Postman only takes authorization credentials encoded in Base64. Postman already has this feature, or you can use a third-party service to convert the credentials to base64.

Can we have the same names for global variables in Postman?
Global variables cannot have identical names since doing so would confuse the software because they are devoid of any environment. The terms of local variables might be the same across various environments.

What do you know about the postman monitor?
For running collections, the postman monitor is employed. Collections are kept running for the duration of the user-defined time. The user must get logged in to utilize Postman Monitor. Users regularly send emails to one another to share the monitor reports.

What is a binary form in POST methods?
Postman's binary form is made to send data in a format that you cannot manually type. You use these options, which cannot be manually typed, such as an image, a file, etc., because everything in a computer is transformed into binary.

What are the limitations of Postman?
The following is a list of Postman's main drawbacks:

Postman cannot process 1000+ API requests.
It might be challenging to manage collections and requests for large projects.
For managing the workspace as code, Postman is not appropriate. It is because dynamic API requests would result in a lot of code duplication.

How can you save the responses of API to a file in Postman?
There are two ways to save an API response to a file in Postman:
First, in the response section, click the download button.
Then, press the arrow next to the send button. An option to send and download is available here. After clicking it, Postman will prompt you for the location to save the response after the request gets successfully executed.

What is the significance of 301 status code?
When a page has been permanently redirected from one website page to another, Postman's 301 status code gets used to indicate this. The search engine is informed that the old page is out-of-date and has to index the URL of the new page.

Define status code 201.
When you successfully create a resource using a POST or PUT request, the status code 201 denotes that the resource has been created. It uses the location header to return a link to a newly built resource.

When do we use global variables, collection variables, and local variables?
Global variables are all-purpose variables perfect for prototyping and quick results. They get utilized when transferring data to other requests.
You can most frequently use collection variables to store constants that don't change while the Collection is being executed. They are used for constants that remain the same throughout execution and for URLs and authentication credentials when just one environment is present.
Local variables are only accessible for the duration of the request that set them or while using the Newman/Collection runner. They get used whenever you want to override all other variable scopes.

How do you remove local variables?
Once you run and finish the tests, the local variables are automatically eliminated.

What is the difference between form data and x-www-form-urlencoded?
The primary distinction between form data and x-www-form-urlencoded is that the URL is pre-arranged when sent via x-www-form-urlencoded.

How do you access the history of requests in Postman?
The History tab in the Postman application allows us to access the history of requests. The record will be synced amongst all your logged-in devices when we login into the Postman account. The view will load the request we saved while working on it earlier after clicking on any of the requests shown in the History tab. 

Why is Base64 encoding primarily used in Postman?
As a result of the data being transmitted in textual form and being sent in a more accessible format, like HTML form data, the Base64 authorization credentials are typically employed. Base64 is so popular because we can rely on the same 64 characters regardless of the encoding language we use.

What is the purpose of the 304 status code?
The meaning of the status code 304 is "Not Modified." It is utilized in conditional GET requests to reduce network bandwidth usage. The response's body must be empty. Dates, locations, and other information should be in the headers.

Is it preferable to save our work on Postman Cloud?
Saving your work in the Postman cloud is not recommended because business work cannot be disclosed and must be kept private. Since Postman cloud requires sign-in, security breaches could happen if it gets used. Therefore, using Postman Cloud to save work is discouraged, and team workspace is strongly recommended.

What are the various variable scopes provided by Postman?
Postman provides the following variable scopes:
Global Variables
Local Variables
Environment Variables 
Collection Variables
Data Variables

Is it possible to reuse the authentication token for multiple requests?
You can indeed use the authentication token more than once. To do this, create a collection, add all requests with the same authentication token, and then assign the Collection with the auth token to the Collection. By choosing "Inherit auth from parent" under the Authorization tab, we may apply it to each request separately.

# Weblinks
https://www.interviewbit.com/postman-interview-questions/
https://www.guru99.com/postman-interview-questions.html
https://www.javatpoint.com/postman-interview-questions

# Video Links
https://www.youtube.com/watch?v=VywxIQ2ZXw4
https://www.youtube.com/watch?v=FjgYtQK_zLE
