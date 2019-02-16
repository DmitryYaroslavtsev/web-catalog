<#import "table.ftl" as table>

<#macro sub category subcategories countList products>
    <div class="tab-pane fade" id="list-${category?replace(" ", "-")}" role="tabpanel"
         aria-labelledby="list-${category?replace(" ", "-")}-list">
        <div class="container">
            <div class="accordion" id="accordion_${category?replace(" ", "-")}">
                <#if subcategories[category]??>
                    <#list subcategories[category] as subcategory>
                        <div class="card text-center m-2 p-1 w-100">
                            <h6 class="card-header bg-info text-white">${subcategory!}
                                <span class="badge badge-light float-right">${countList[subcategory]}</span>
                            </h6>
                            <div class="card-body" id=${category?replace(" ", "-")}_${subcategory?index}>
                                <h5 class="mb-0">
                                    <button class="btn btn-info text-white" type="button" data-toggle="collapse"
                                            data-target=#card_${category?replace(" ", "-")}_${subcategory?index}
                                            aria-expanded="true"
                                            aria-controls=${subcategory?index}>
                                        Перейти в раздел
                                    </button>
                                </h5>
                            </div>

                            <div id=card_${category?replace(" ", "-")}_${subcategory?index} class="collapse"
                                 aria-labelledby=${category?replace(" ", "-")}_${subcategory?index}
                                 data-parent="#accordion_${category?replace(" ", "-")}">
                                <div class="card-footer">
                                    <#if products[subcategory]??>
                                    <table class="table-responsive table-bordered table-sm">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Наименование</th>
                                            <th scope="col">Описание</th>
                                            <th scope="col">Размер</th>
                                            <th scope="col">Материал</th>
                                            <th scope="col">Плотность</th>
                                            <th scope="col">Стерильность</th>
                                            <th scope="col">Цвета</th>
                                            <th scope="col">Кол-во в упаковке</th>
                                            <th scope="col">Кол-во в транспортном коробе</th>
                                            <th scope="col">НДС</th>
                                        </tr>
                                        </thead>
                                        <tbody
                                        <@table.table products[subcategory]>
                                        </@table.table>
                                        </tbody>
                                    </table>
                                </div>
                                </#if>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</#macro>