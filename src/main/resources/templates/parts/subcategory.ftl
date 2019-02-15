<#macro sub category subcategories countList>
    <div class="tab-pane fade" id="list-${category?replace(" ", "-")}" role="tabpanel"
         aria-labelledby="list-${category?replace(" ", "-")}-list">
        <div class="container">
            <div class="accordion" id="accordion_${category?replace(" ", "-")}">
                <#if subcategories[category]??>
                    <#list subcategories[category] as subcategory>
                        <div class="card text-center m-2 p-1 w-100">
                            <h5 class="card-header bg-info text-white">${subcategory!}
                                <span class="badge badge-light float-right">${countList[subcategory]}</span>
                            </h5>
                            <div class="card-body" id=${category?replace(" ", "-")}_${subcategory?index}>
                                <h5 class="mb-0">
                                    <button class="btn btn-info text-white" type="button" data-toggle="collapse"
                                            data-target=#card_${category?replace(" ", "-")}_${subcategory?index} aria-expanded="true"
                                            aria-controls=${subcategory?index}>
                                        Перейти в раздел
                                    </button>
                                </h5>
                            </div>

                            <div id=card_${category?replace(" ", "-")}_${subcategory?index} class="collapse"
                                 aria-labelledby=${category?replace(" ", "-")}_${subcategory?index}
                                 data-parent="#accordion_${category?replace(" ", "-")}">
                                <div class="card-footer">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                                    richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                                    dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
                                    tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
                                    assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore
                                    wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
                                    vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic
                                    synth nesciunt you probably haven't heard of them accusamus labore
                                    sustainable VHS.
                                </div>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</#macro>