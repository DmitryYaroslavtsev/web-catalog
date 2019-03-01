<#include "security.ftl">
<#import "logout.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark info-color-dark wow fadeIn">
    <a class="navbar-brand" href="/">Web-catalog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link text-white" href="/">Главная страница</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="/catalog/">Каталог продукции</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="/">Контакты</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="/">О нас</a>
            </li>
        </ul>
        <#if known >
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/admin/">Admin panel</a>
                </li>
                <li class="nav-item">
                    <@l.logout />
                </li>
            </ul>
        </#if>
    </div>
</nav>