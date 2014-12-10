======================
FunkLoad_ bench report
======================


:date: 2014-12-06 21:42:36
:abstract: Motley-Crew Test
           Bench result of ``Simple.test_critical_path``: 
           Access some urls

.. _FunkLoad: http://funkload.nuxeo.org/
.. sectnum::    :depth: 2
.. contents:: Table of contents
.. |APDEXT| replace:: \ :sub:`1.5`

Bench configuration
-------------------

* Launched: 2014-12-06 21:42:36
* From: allen-Lenovo-V360
* Test: ``test_Simple.py Simple.test_critical_path``
* Target server: http://ec2-54-149-103-100.us-west-2.compute.amazonaws.com
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

* 62 tests
* 208 pages
* 353 requests


Test stats
----------

The number of Successful **Tests** Per Second (STPS) over Concurrent Users (CUs).

 .. image:: tests.png

 ================== ================== ================== ================== ==================
                CUs               STPS              TOTAL            SUCCESS              ERROR
 ================== ================== ================== ================== ==================
                  2              0.700                  7                  7             0.00%
                  4              2.200                 22                 22             0.00%
                  6              3.300                 33                 33             0.00%
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
                  2              1.000          Excellent              2.500              5.000                 25                 25             0.00%              0.084              0.473              1.817              0.088              0.190              1.369              1.739
                  4              1.000          Excellent              7.200             11.000                 72                 72             0.00%              0.084              0.291              2.650              0.089              0.144              0.451              0.808
                  6              1.000          Excellent             11.100             14.000                111                111             0.00%              0.083              0.263              1.392              0.094              0.155              0.570              0.782
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
                  2              1.000          Excellent              4.300              9.000                 43                 43             0.00%              0.033              0.275              1.388              0.047              0.102              0.816              1.369
                  4              1.000          Excellent             12.400             17.000                124                124             0.00%              0.034              0.169              1.396              0.041              0.096              0.262              0.328
                  6              1.000          Excellent             18.600             23.000                186                186             0.00%              0.033              0.157              1.213              0.044              0.120              0.261              0.329
 ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

 \* Apdex |APDEXT|

Slowest requests
----------------

The 5 slowest average response time during the best cycle with **6** CUs:

* In page 001, Apdex rating: Excellent, avg response time: 0.31s, link: ``/assets/application-84e8f231ce9830552ca6031417403809.css``
  ``
* In page 002, Apdex rating: Excellent, avg response time: 0.16s, get: ``/login``
  `Get log-in url`
* In page 003, Apdex rating: Excellent, avg response time: 0.14s, get: ``/signup``
  `Get sign-up url`
* In page 001, Apdex rating: Excellent, avg response time: 0.12s, get: ````
  `Get root url`
* In page 001, Apdex rating: Excellent, avg response time: 0.06s, link: ``/bootstrap-table/1.3.0/bootstrap-table.min.css``
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
                      2              1.000          Excellent                  9                  9             0.00%              0.092              0.106              0.154              0.092              0.098              0.154              0.154
                      4              1.000          Excellent                 26                 26             0.00%              0.079              0.102              0.177              0.085              0.093              0.155              0.155
                      6              1.000          Excellent                 39                 39             0.00%              0.085              0.123              0.252              0.088              0.112              0.176              0.186
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|
* Req: 002, link, url ``/bootstrap-table/1.3.0/bootstrap-table.min.css``

     .. image:: request_001.002.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  9                  9             0.00%              0.033              0.342              1.388              0.033              0.047              1.388              1.388
                      4              1.000          Excellent                 26                 26             0.00%              0.034              0.170              1.396              0.035              0.043              0.520              1.375
                      6              1.000          Excellent                 38                 38             0.00%              0.033              0.061              0.195              0.035              0.045              0.127              0.138
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|
* Req: 003, link, url ``/assets/application-84e8f231ce9830552ca6031417403809.css``

     .. image:: request_001.003.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  9                  9             0.00%              0.179              0.361              0.816              0.179              0.240              0.816              0.816
                      4              1.000          Excellent                 26                 26             0.00%              0.177              0.328              1.168              0.177              0.214              1.104              1.145
                      6              1.000          Excellent                 37                 37             0.00%              0.173              0.307              1.213              0.177              0.223              0.558              0.644
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|

PAGE 002: Get log-in url
~~~~~~~~~~~~~~~~~~~~~~~~

* Req: 001, get, url ``/login``

     .. image:: request_002.001.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  9                  9             0.00%              0.084              0.339              1.369              0.084              0.102              1.369              1.369
                      4              1.000          Excellent                 23                 23             0.00%              0.084              0.104              0.214              0.087              0.094              0.134              0.157
                      6              1.000          Excellent                 36                 36             0.00%              0.083              0.162              0.938              0.087              0.114              0.185              0.842
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================

     \* Apdex |APDEXT|

PAGE 003: Get sign-up url
~~~~~~~~~~~~~~~~~~~~~~~~~

* Req: 001, get, url ``/signup``

     .. image:: request_003.001.png

     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                    CUs             Apdex*             Rating              TOTAL            SUCCESS              ERROR                MIN                AVG                MAX                P10                MED                P90                P95
     ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ================== ==================
                      2              1.000          Excellent                  7                  7             0.00%              0.087              0.214              0.799              0.087              0.105              0.799              0.799
                      4              1.000          Excellent                 23                 23             0.00%              0.086              0.130              0.237              0.090              0.107              0.223              0.232
                      6              1.000          Excellent                 36                 36             0.00%              0.087              0.135              0.239              0.094              0.118              0.200              0.214
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