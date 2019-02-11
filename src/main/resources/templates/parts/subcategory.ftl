<#macro sub category subcategories>
    <div class="tab-pane fade" id="list-${category}" role="tabpanel" aria-labelledby="list-home-list">
        <#--<#list subcategories as subcategory>-->
        <#--${subcategory}-->
        <#--</#list>-->

        <#list subcategories[category] as subcategory>
            <#list subcategory as name>
                ${name!}
            </#list>
        </#list>
    </div>
</#macro>