<#import "catalogTable.ftl" as table>

<#macro sub category subcategories countList products>
    <div class="tab-pane fade wow fadeIn" id="list-${category?replace(" ", "-")}" role="tabpanel"
         aria-labelledby="list-${category?replace(" ", "-")}-list">
        <div class="container">
            <div class="accordion md-accordion" id="accordion_${category?replace(" ", "-")}">
                <#if subcategories[category]??>
                    <#list subcategories[category] as subcategory>
                        <div class="card text-center m-2 p-1 w-100">
                            <h6 class="card-header info-color-dark text-white">${subcategory!}
                                <span class="badge badge-light float-right">${countList[subcategory]}</span>
                            </h6>
                            <div class="card-body" id=${category?replace(" ", "-")}_${subcategory?index}>
                                <h5 class="mb-0">
                                    <button class="btn info-color-dark text-white" type="button"
                                            data-toggle="collapse"
                                            data-target=#card_${category?replace(" ", "-")}_${subcategory?index}
                                            aria-expanded="true"
                                            aria-controls=${subcategory?index}>
                                        Развернуть раздел
                                    </button>
                                </h5>
                            </div>

                            <div id=card_${category?replace(" ", "-")}_${subcategory?index} class="collapse"
                                 aria-labelledby=${category?replace(" ", "-")}_${subcategory?index}
                                 data-parent="#accordion_${category?replace(" ", "-")}">
                                <div class="card-body">
                                    <#if products[subcategory]??>
                                    <table id="dt_${category?replace(" ", "-")}_${subcategory?index}"
                                           class="table table-responsive table-bordered table-hover table-sm"
                                           cellspacing="0" width="100%">
                                        <thead>
                                        <tr>
                                            <th class="th-sm">#</th>
                                            <th class="th-sm">Наименование</th>
                                            <th class="th-sm">Описание</th>
                                            <th class="th-sm">Размер</th>
                                            <th class="th-sm">Материал</th>
                                            <th class="th-sm">Плотность</th>
                                            <th class="th-sm">Стерильность</th>
                                            <th class="th-sm">Цвета</th>
                                            <th class="th-sm">Кол-во в упаковке</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <@table.table products[subcategory] />
                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    $(document).ready(function ($) {
                                        $('#dt_${category?replace(" ", "-")}_${subcategory?index}').DataTable({
                                            "paging": false,
                                            "info": false,
                                            "language": {
                                                "sSearch": "Поиск:"
                                            }
                                        });
                                        $('.dataTables_length').addClass('bs-select');
                                    });
                                </script>
                                </#if>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</#macro>