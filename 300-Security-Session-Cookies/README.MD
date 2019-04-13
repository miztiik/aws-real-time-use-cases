# How to Secure Session-Cookies
I was asked by my manager how you will secure when hacker have access to our Cookie and Think about an authentication cookie. how to protect the cookie from a hacker eavesdropping on the communication channel between the browser and the server.

![Security-Session-Cookies](https://raw.githubusercontent.com/miztiik/aws-real-time-use-cases/master/300-Security-Session-Cookies/Images/Security-Cookies.jpeg) 

# Steps to enhance Security of Cookies

### 1. HTTP and HTTPS
If we use HTTP protocol, the traffic is sent in plaintext, Hacker get access to see our traffic and he can able to modify (Man in the middle attack).
### TODO
1. HTTPS is a secure version of HTTP – it uses SSL/TLS to protect the data of the application layer. 
1. ensure all traffic is encrypted, to prevent potential intercept of sensitive data
1. If we use HTTPS we can achieve the following properties
   - Authentication
   - Data integrity 
   - Confidentiality

### 2. Secure Flag

   Use The Cookie with a secure flag will only be sent over an HTTPS connection

### 3. HttpOnly Flag

When we send authentication Cookie and assume that XSS (cross-site scripting) vulnerability is present in the application.
  - Use HttpOnly flag to Prevent this kind of problem. When an HttpOnly flag is used, JavaScript will not be able to read this authentication cookie in case of XSS exploitation.
## Steps to Reproduce
### 1. Checking for buffer overflow vulnerability
  - Capture the request
  - Detect hidden or non-obvious inputs such as HTTP parameters, POST data, hidden form field values, predefined radio or selection values.
  - Append the parameter value as many as possible.ex-id=111111111111111111111111111111111111111111111111111....
  - Forward the request and check the response

### 2. Checking for malicious file upload vulnerability

  - Identify the file upload functionality in your web application.
  - Check for the file formats approved for uploading.
  - Try to upload calc.exe file to the web application and need to test for both endings that don't match, i.e. Upload a jpg that is actually a php or upload a polyglot file.
         
Application should not allow you to upload .exe or any other file formats which are not whitelisted.

### 3. Checking for HTTP Response Splitting
  - Capture the request.
  - Check for Location and Set-Cookie headers.
  - Append the headers value as
Location: http://victim.com/main.jsp?interface=advanced%0d%0aContent-Length:%20
0%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContentType:%20text/html%0d%0aContent-Length:%20
35%0d%0a%0d%0a<html>Sorry,%20System%20Down</
html>
The web cache should not see two different responses
### 4. Checking for HTTP Smuggling
  - Capture the request.
  - Change the req as shown in below ex
POST /target.asp HTTP/1.1 <-- Request #1
Host: target
Connection: Keep-Alive
Content-Length: 49225
<CRLF>
<49152 bytes of garbage>
POST /target.asp HTTP/1.0 <-- Request #2
Connection: Keep-Alive
Content-Length: 33
<CRLF>
POST /target.asp HTTP/1.0 <-- Request #3
xxxx: POST /scripts/..%c1%1c../winnt/system32/cmd.exe?/c+dir
HTTP/1.0 <-- Request #4
Connection: Keep-Alive
<CRLF>

Application should not accept the change requreied.







 
















 




   

