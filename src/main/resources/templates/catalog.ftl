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
        <div class="col-8">
            <div class="tab-content" id="nav-tabContent">
                <#--<div class="tab-pane fade" id="list-${category}" role="tabpanel" aria-labelledby="list-home-list">-->
                <#--<#list subcategory as subcategories>-->
                <#--</#list>-->
                <#--</div>-->

                <#list categories as category>
                    <@s.sub category subcategories>
                    </@s.sub>
                </#list>
                <#--<div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...-->
                <#--</div>-->
                <#--<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">-->
                <#--...-->
                <#--</div>-->
                <#--<div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">-->
                <#--...-->
                <#--</div>-->
            </div>
        </div>
    </div>
</@c.page>