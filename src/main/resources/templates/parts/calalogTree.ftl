<#macro catalogTree value>
    <a class="list-group-item list-group-item-action info-color-dark text-white border-white wow fadeIn" id="list-${value?replace(" ", "-")}-list"
       data-toggle="list" href="#list-${value?replace(" ", "-")}"
       role="tab" aria-controls="profile">${value}</a>
</#macro>