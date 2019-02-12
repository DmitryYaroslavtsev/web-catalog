<#macro sub category subcategories countList>
    <div class="tab-pane fade" id="list-${category}" role="tabpanel" aria-labelledby="list-home-list">
        <div class="row">
            <div class="card-group">
                <#if subcategories[category]??>
                    <#list subcategories[category] as subcategory>
                        <div class="card col-sm-6 text-center m-2 p-1">
                            <h5 class="card-header bg-info text-white">${subcategory!}
                                <span class="badge badge-light float-right">${countList[subcategory]}</span>
                            </h5>
                            <div class="card-body">
                                Всякая писанина
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</#macro>