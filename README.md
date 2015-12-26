# red5000
Ruby interface and collector for TED5000

TED5000 is a network connected electrical circuit monitor made by The Energy Detective. Data is gathered from the device by querying it, parsing the XML, and storing the results into a database.

The key pieces of data from the TED5000 that this project captures are:
- voltage (in volts)
- instaneous power (in watts)
- apparent power (in kilovolt-amperes)

More information about its API can be found at http://files.theenergydetective.com/docs/TED5000-API-R330.pdf
