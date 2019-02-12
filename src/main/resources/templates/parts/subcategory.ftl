<#macro sub category subcategories>
    <div class="tab-pane fade" id="list-${category}" role="tabpanel" aria-labelledby="list-home-list">
        <#list subcategories[category]?chunk(1) as subcategory>
            <#list subcategory as name>
                <div>
                    ${name!}
                </div>
            </#list>
        </#list>

    </div>
</#macro>