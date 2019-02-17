<#macro page>
    <!doctype html>
    <html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <#--<!-- Bootstrap CSS &ndash;&gt;-->
        <#--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"-->
        <#--integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"-->
        <#--crossorigin="anonymous">-->

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="../../css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="../../css/style.css" rel="stylesheet">

        <title>Web-catalog</title>
    </head>
    <body>
    <#include "navbar.ftl" >
    <main>
        <div class="container-fluid p-5">
            <#nested>
        </div>
    </main>
    <footer class="footer fixed-bottom bg-dark font-small text-white p-2">
        <div class="footer-copyright text-center py-2">© 2019 Copyright</div>
    </footer>
    <#--<!-- Optional JavaScript &ndash;&gt;-->
    <#--<!-- jQuery first, then Popper.js, then Bootstrap JS &ndash;&gt;-->
    <#--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"-->
    <#--integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"-->
    <#--crossorigin="anonymous"></script>-->
    <#--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"-->
    <#--integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"-->
    <#--crossorigin="anonymous"></script>-->
    <#--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"-->
    <#--integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"-->
    <#--crossorigin="anonymous"></script>-->
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