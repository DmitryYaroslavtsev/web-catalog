<#import "parts/common.ftl" as c>

<@c.page>
    <ul class="nav nav-tabs">
        <#list categories as category>
            <#if subcategories[category]??>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">${category}</a>
                    <div class="dropdown-menu">
                        <#if subcategories[category]??>
                            <#list subcategories[category] as subcategory>
                                <a class="dropdown-item" data-toggle="tab"
                                   href="#sub_${subcategory?replace(" ", "-")}">${subcategory}</a>
                            </#list>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" data-toggle="tab"
                               href="#without_sub_${category?replace(" ", "-")}">Не попадающие под
                                подкатегории</a>
                        </#if>
                    </div>
                </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#category_${category?replace(" ", "-")}">${category}</a>
                </li>
            </#if>
        </#list>
    </ul>
    <div class="tab-content" id="myTabContent">
        <#list categories as category>
            <#if subcategories[category]??>
                <#list subcategories[category] as subcategory>
                    <div class="tab-pane fade" id="sub_${subcategory?replace(" ", "-")}"
                         aria-labelledby="sub_${subcategory?replace(" ", "-")}-tab">
                        sub_${subcategory}
                    </div>
                    <div class="tab-pane fade" id="without_sub_${category?replace(" ", "-")}"
                         aria-labelledby="without_sub_${category?replace(" ", "-")}-tab">
                        without_sub_${category}
                    </div>
                </#list>
            <#else>
                <div class="tab-pane fade" id="category_${category?replace(" ", "-")}"
                     aria-labelledby="category_${category?replace(" ", "-")}-tab">
                    sub_${category}
                </div>
            </#if>
        </#list>
    </div>
</@c.page>