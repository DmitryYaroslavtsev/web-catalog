<#macro sub category subcategories>
    <div class="tab-pane fade" id="list-${category}" role="tabpanel" aria-labelledby="list-home-list">
        <div class="row">
            <div class="card-group">
                <#list subcategories[category] as subcategory>

                <div class="card col-sm-6 text-center m-2 p-1 bg-info text-white d-flex align-items-center">
                <span class="badge badge-light badge-pill">1</span>
                <h5 class="card-header">${subcategory!}</h5>
                <div class="card-body">
                    Всякая писанина
                </div>

            </div>
            </#list>
        </div>
    </div>
    </div>
</#macro>