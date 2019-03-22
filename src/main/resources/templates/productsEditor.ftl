<#import "parts/common.ftl" as c>
<#import "parts/productsModalViews.ftl" as modals>
<#import "parts/productEditorTables.ftl" as table>

<@c.page>
    <@modals.addForm/>

    <ul class="nav nav-tabs">
        <#list categories as category>
            <#if subcategories[category]??>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">${category}</a>
                    <div class="dropdown-menu">
                        <#if subcategories[category]??>
                            <#list subcategories[category] as subcategory>
                                <a class="dropdown-item" data-toggle="tab"
                                   href="#sub_${subcategory?replace(" ", "-")}">${subcategory}</a>
                            </#list>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" data-toggle="tab"
                               href="#without_sub_${category?replace(" ", "-")}">Не попадающие под
                                подкатегории</a>
                        </#if>
                    </div>
                </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#category_${category?replace(" ", "-")}">${category}</a>
                </li>
            </#if>
        </#list>
    </ul>
    <div class="tab-content" id="myTabContent">
        <#list categories as category>
            <#if subcategories[category]??>
            <#list subcategories[category] as subcategory>
                <div class="tab-pane fade" id="sub_${subcategory?replace(" ", "-")}"
                     aria-labelledby="sub_${subcategory?replace(" ", "-")}-tab">
                    <#if products[subcategory]??>
                        <table id="dt_${category?replace(" ", "-")}_${subcategory?index}"
                               class="table table-responsive-lg table-bordered table-hover table-sm" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th class="th-sm">Id</th>
                                <th class="th-sm">Наименование</th>
                                <th class="th-sm">Описание</th>
                                <th class="th-sm">Размер</th>
                                <th class="th-sm">Материал</th>
                                <th class="th-sm">Плотность</th>
                                <th class="th-sm">Стерильность</th>
                                <th class="th-sm">Цвета</th>
                                <th class="th-sm">Кол-во в упаковке</th>
                                <th class="th-sm"></th>
                                <th class="th-sm"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <@table.table products[subcategory] />
                            </tbody>
                        </table>
                        <@modals.form products[subcategory] />
                    </#if>
                </div>


                <div class="tab-pane fade" id="without_sub_${category?replace(" ", "-")}"
                     aria-labelledby="without_sub_${category?replace(" ", "-")}-tab">
                    without_sub_${category}


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
            </#list>
            <#else>
                <div class="tab-pane fade" id="category_${category?replace(" ", "-")}"
                     aria-labelledby="category_${category?replace(" ", "-")}-tab">
                    sub_${category}


                </div>
            </#if>
        </#list>
    </div>

    <#if editError??>
        <script>alert("Невозможно обновить категорию");</script>
    </#if>
</@c.page>