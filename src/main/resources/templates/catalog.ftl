<#import "parts/common.ftl" as c>
<#import "parts/calalogTree.ftl" as ct>
<#import "parts/subcategory.ftl" as s>

<@c.page>
    <div class="row">
        <div class="col-3">
            <div class="list-group" id="list-tab" role="tablist">
                <#list categories as category>
                    <@ct.catalogTree (category)>
                    </@ct.catalogTree>
                </#list>
            </div>
        </div>
        <div class="col">
            <div class="tab-content" id="nav-tabContent">
                <#list categories as category>
                    <@s.sub category subcategories countList>
                    </@s.sub>
                </#list>
            </div>
        </div>
    </div>
</@c.page>