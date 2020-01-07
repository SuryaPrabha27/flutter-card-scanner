Demonstrates how to use the flutter_card_scanner_latest plugin.

Once main.dart is being launched, there would be a scan button and once user clicks 
on the scan button platform specific method would be invoked and a json response would
be rendered back to flutter in below format:

Success Response: If the card scan is success

{
"result":"success",
"body":"{"Cardholders Name":"test","expiry":"01/21"}",
"responseText":"Card has been scanned successfully"
}


Failure Response: If the scan operation has been cancelled manually

{
"result":"failure",
"body":"{"Cardholders Name":"null","expiry":null"}",
"responseText":"Card has cancelled the scan"
}

In case of any exception, platform exception would be thrown from the platform specific
code.



Depending on the needs, one can parse the json(already covered in the example)
and render the respective data on the screen.