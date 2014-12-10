======================
FunkLoad_ bench report
======================


:date: 2014-12-06 21:33:58
:abstract: Motley-Crew Test
           Bench result of ``Simple.test_critical_path``: 
           Access some urls

.. _FunkLoad: http://funkload.nuxeo.org/
.. sectnum::    :depth: 2
.. contents:: Table of contents
.. |APDEXT| replace:: \ :sub:`1.5`

Bench configuration
-------------------

* Launched: 2014-12-06 21:33:58
* From: allen-Lenovo-V360
* Test: ``test_Simple.py Simple.test_critical_path``
* Target server: http://ec2-54-148-40-14.us-west-2.compute.amazonaws.com
* Cycles of concurrent users: [2, 4, 6]
* Cycle duration: 10s
* Sleeptime between request: from 0.0s to 0.5s
* Sleeptime between test case: 0.01s
* Startup delay between thread: 0.01s
* Apdex: |APDEXT|
* FunkLoad_ version: 1.16.1


Bench content
-------------

The test ``Simple.test_critical_path`` contains: 

* 3 page(s)
* 0 redirect(s)
* 2 link(s)
* 0 image(s)
* 0 XML RPC call(s)

The bench contains:

* 41 tests
* 146 pages
* 249 requests


Test stats
----------

The number of Successful **Tests** Per Second (STPS) over Concurrent Users (CUs).

 .. image:: tests.png

 ================== ================== ================== ================== ==================
                CUs               STPS              TOTAL            SUCCESS              ERROR
 ================== ================== ================== ================== ==================
                  2              0.400                  4                  4             0.00%
                  4              1.600                 16                 16             0.00%
                  6              2.100                 21                 21             0.00%
 ================== ================== ================== ================== ==================



Page stats
----------

The number of Successful **Pages** Per Second (SPPS) over Concurrent Users (CUs).
Note that an XML RPC call count like a page.

 .. image:: pages_spps.png
 .. image:: pages.png

 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                CUs             Apdex*             Rating               SPPS            maxSPPS              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                  2              0.966          Excellent              1.700              6.000                 17                 17             0.00%              0.094              0.926              6.065              0.095              0.158              5.781              6.065
                  4              0.995          Excellent              5.500             11.000                 55                 55             0.00%              0.086              0.471              6.030              0.090              0.168              0.890              1.498
                  6              0.984          Excellent              7.400             12.000                 74                 74             0.00%              0.087              0.568              2.339              0.101              0.392              1.419              2.046
 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

 \* Apdex |APDEXT|

Request stats
-------------

The number of **Requests** Per Second (RPS) successful or not over Concurrent Users (CUs).

 .. image:: requests_rps.png
 .. image:: requests.png

 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                CUs             Apdex*            Rating*                RPS             maxRPS              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                  2              0.966          Excellent              2.900              8.000                 29                 29             0.00%              0.036              0.543              5.101              0.043              0.126              0.945              5.094
                  4              0.995          Excellent              9.300             13.000                 93                 93             0.00%              0.041              0.279              5.288              0.061              0.120              0.496              0.665
                  6              0.984          Excellent             12.700             19.000                127                127             0.00%              0.038              0.331              2.007              0.049              0.179              0.941              1.366
 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

 \* Apdex |APDEXT|

Slowest requests
----------------

The 5 slowest average response time during the best cycle with **6** CUs:

* In page 001, Apdex rating: Good, avg response time: 0.76s, link: ``/assets/application-84e8f231ce9830552ca6031417403809.css``
  ``
* In page 002, Apdex rating: Excellent, avg response time: 0.37s, get: ``/login``
  `Get log-in url`
* In page 003, Apdex rating: Excellent, avg response time: 0.23s, get: ``/signup``
  `Get sign-up url`
* In page 001, Apdex rating: Excellent, avg response time: 0.19s, get: ````
  `Get root url`
* In page 001, Apdex rating: Excellent, avg response time: 0.09s, link: ``/bootstrap-table/1.3.0/bootstrap-table.min.css``
  ``

Page detail stats
-----------------


PAGE 001: Get root url
~~~~~~~~~~~~~~~~~~~~~~

* Req: 001, get, url ````

     .. image:: request_001.001.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              0.833               FAIR                  6                  6             0.00%              0.091              1.766              5.101              0.091              0.104              5.101              5.101
                      4              0.975          Excellent                 20                 20             0.00%              0.089              0.454              5.288              0.093              0.120              1.182              5.288
                      6              1.000          Excellent                 27                 27             0.00%              0.091              0.193              1.159              0.094              0.141              0.292              0.353
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|
* Req: 002, link, url ``/bootstrap-table/1.3.0/bootstrap-table.min.css``

     .. image:: request_001.002.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  6                  6             0.00%              0.036              0.215              0.773              0.036              0.046              0.773              0.773
                      4              1.000          Excellent                 20                 20             0.00%              0.041              0.098              0.342              0.042              0.061              0.313              0.342
                      6              1.000          Excellent                 27                 27             0.00%              0.038              0.093              0.295              0.039              0.050              0.268              0.273
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|
* Req: 003, link, url ``/assets/application-84e8f231ce9830552ca6031417403809.css``

     .. image:: request_001.003.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  6                  6             0.00%              0.192              0.417              0.945              0.192              0.333              0.945              0.945
                      4              1.000          Excellent                 18                 18             0.00%              0.274              0.556              1.345              0.289              0.494              1.269              1.345
                      6              0.923               Good                 26                 26             0.00%              0.214              0.764              2.007              0.236              0.498              1.772              1.878
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|

PAGE 002: Get log-in url
~~~~~~~~~~~~~~~~~~~~~~~~

* Req: 001, get, url ``/login``

     .. image:: request_002.001.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  6                  6             0.00%              0.094              0.121              0.168              0.094              0.113              0.168              0.168
                      4              1.000          Excellent                 18                 18             0.00%              0.086              0.140              0.252              0.087              0.108              0.227              0.252
                      6              1.000          Excellent                 25                 25             0.00%              0.087              0.374              1.419              0.091              0.258              0.721              1.366
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|

PAGE 003: Get sign-up url
~~~~~~~~~~~~~~~~~~~~~~~~~

* Req: 001, get, url ``/signup``

     .. image:: request_003.001.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  5                  5             0.00%              0.102              0.126              0.161              0.102              0.126              0.161              0.161
                      4              1.000          Excellent                 17                 17             0.00%              0.089              0.138              0.368              0.092              0.110              0.211              0.368
                      6              1.000          Excellent                 22                 22             0.00%              0.089              0.230              1.201              0.101              0.169              0.314              0.328
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|

Definitions
-----------

* CUs: Concurrent users or number of concurrent threads executing tests.
* Request: a single GET/POST/redirect/xmlrpc request.
* Page: a request with redirects and resource links (image, css, js) for an html page.
* STPS: Successful tests per second.
* SPPS: Successful pages per second.
* RPS: Requests per second, successful or not.
* maxSPPS: Maximum SPPS during the cycle.
* maxRPS: Maximum RPS during the cycle.
* MIN: Minimum response time for a page or request.
* AVG: Average response time for a page or request.
* MAX: Maximmum response time for a page or request.
* P10: 10th percentile, response time where 10 percent of pages or requests are delivered.
* MED: Median or 50th percentile, response time where half of pages or requests are delivered.
* P90: 90th percentile, response time where 90 percent of pages or requests are delivered.
* P95: 95th percentile, response time where 95 percent of pages or requests are delivered.
* Apdex T: Application Performance Index, 
  this is a numerical measure of user satisfaction, it is based
  on three zones of application responsiveness:

  - Satisfied: The user is fully productive. This represents the
    time value (T seconds) below which users are not impeded by
    application response time.

  - Tolerating: The user notices performance lagging within
    responses greater than T, but continues the process.

  - Frustrated: Performance with a response time greater than 4*T
    seconds is unacceptable, and users may abandon the process.

    By default T is set to 1.5s this means that response time between 0
    and 1.5s the user is fully productive, between 1.5 and 6s the
    responsivness is tolerating and above 6s the user is frustrated.

    The Apdex score converts many measurements into one number on a
    uniform scale of 0-to-1 (0 = no users satisfied, 1 = all users
    satisfied).

    Visit http://www.apdex.org/ for more information.
* Rating: To ease interpretation the Apdex
  score is also represented as a rating:

  - U for UNACCEPTABLE represented in gray for a score between 0 and 0.5 

  - P for POOR represented in red for a score between 0.5 and 0.7

  - F for FAIR represented in yellow for a score between 0.7 and 0.85

  - G for Good represented in green for a score between 0.85 and 0.94

  - E for Excellent represented in blue for a score between 0.94 and 1.

Report generated with FunkLoad_ 1.16.1, more information available on the `FunkLoad site <http://funkload.nuxeo.org/#benching>`_.