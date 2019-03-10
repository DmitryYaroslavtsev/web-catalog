<#macro page>
    <!doctype html>
    <html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <!-- Font Awesome -->
        <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="../../css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="../../css/style.css" rel="stylesheet">
        <!-- MDBootstrap Datatables  -->
        <link href="../../css/addons/datatables.min.css" rel="stylesheet">

        <title>Web-catalog</title>
    </head>
    <body>
    <header>
        <#include "navbar.ftl" >
    </header>
    <!-- JQuery -->
    <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="../../js/addons/datatables.min.js"></script>
    <main>
        <div class="container-fluid p-5 wow fadeIn">
            <#nested>
        </div>
    </main>
    <footer class="footer fixed-bottom info-color-dark font-small text-white p-2">
        <div class="footer-copyright text-center py-2">© 2019 Copyright</div>
    </footer>

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../../js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../../js/mdb.min.js"></script>

    </body>

    </html>
</#macro>