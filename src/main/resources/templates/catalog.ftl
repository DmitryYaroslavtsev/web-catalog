<#import "parts/common.ftl" as c>
<#import "parts/calalogTree.ftl" as ct>
<#import "parts/subcategory.ftl" as s>

<@c.page>
    <div class="row wow fadeIn">
        <div class="col-md-2 col-sm-6">
            <div class="list-group" id="list-tab" role="tablist">
                <#list categories as category>
                    <@ct.catalogTree (category) />
                </#list>
            </div>
        </div>
        <div class="col-md-10 col-sm-6">
            <div class="tab-content" id="nav-tabContent">
                <#list categories as category>
                    <@s.sub category subcategories countList products />
                </#list>
            </div>
        </div>
    </div>
</@c.page>