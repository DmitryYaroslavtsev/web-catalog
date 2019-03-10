<#macro manageProducts addForm product>
    <div class="m-auto">
        <button type="button" class="btn info-color-dark text-white btn-sm"
                <#if addForm>
                    data-target="#add_product_form"
                <#else>
                    data-target="#edit_product_form_${product.id}"
                </#if>
                data-toggle="modal">
            <#if addForm>
                <i class="fas fa-plus-square mr-2"></i>Добавить позицию
            <#else>
                <i class="fas fa-pencil-alt mr-2"></i>Редактировать
            </#if>
        </button>
    </div>

    <div class="modal fade"
            <#if addForm>
                id="add_product_form"
                aria-labelledby="add_product_form"
            <#else>
                id="edit_product_form_${product.id}"
                aria-labelledby="edit_product_form_${product.id}"
            </#if>
         tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-info " role="document">
            <div class="modal-content">
                <div class="modal-header text-center info-color-dark text-white">
                    <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-pencil-alt mr-2"></i>Добавить
                        позицию</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form">
                        <input type="text" name="name" class="form-control"
                               <#if addForm>form="addProduct" value="" id="form-name-add"
                                <#else>
                                    form="edit_product_${product.id}" value=${product.name} id="form-name-add${product.id}"
                                </#if>
                               required>
                        <label for="form-name">Наименование</label>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="category" id="category"
                                <#if addForm>form="addProduct"
                                <#else>
                                    form="edit_product_${product.id}"
                                </#if>
                                required>
                            <option selected disabled value="">Выберите категорию</option>
                            <#list categories as category>
                                <option value="${category}">${category}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" id="subcategory" name="subcategory"
                                <#if addForm> form="addProduct"
                                <#else>
                                    form="edit_product_${product.id}"
                                </#if>
                                required>
                            <option selected disabled value="">Выберите подкатегорию</option>
                        </select>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-description" name="description" class="form-control"
                               <#if addForm>form="addProduct" value=""
                                <#else>
                               form="edit_product_${product.id}" value=${product.description!}
                               </#if>
                        >
                        <label for="form-description">Описание</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-size" name="size" class="form-control"
                               <#if addForm>form="addProduct" value=""
                                <#else>
                                    form="edit_product_${product.id}" value=
                                    <#list product.attributes.size! as size>
                                        ${size}<#sep>,</#sep>
                                    </#list>
                                </#if>
                        >
                        <label for="form-size">Размеры (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-material" name="material" class="form-control"
                               <#if addForm>form="addProduct" value=""
                                <#else>
                                    form="edit_product_${product.id}" value=
                                    <#list product.attributes.material! as material>
                                        ${material}<#sep>,</#sep>
                                    </#list>
                                </#if>
                        >
                        <label for="form-material">Материал (через запятую</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-density" name="density" class="form-control"
                               <#if addForm>form="addProduct" value=""
                                <#else>
                                    form="edit_product_${product.id}" value=
                                    <#list product.attributes.density! as density>
                                        ${density}<#sep>,</#sep>
                                    </#list>
                                </#if>
                        >
                        <label for="form-density">Плотность (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-colors" name="colors" class="form-control"
                               <#if addForm>value="" form="addProduct"
                                <#else>
                                    form="edit_product_${product.id}" value=
                                    <#list product.attributes.colors! as color>
                                        ${color}<#sep>,</#sep>
                                    </#list>
                                </#if>
                        >
                        <label for="form-colors">Цвета (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-packagingCount" name="packagingCount" class="form-control"
                               <#if addForm>form="addProduct" value=""
                                <#else>
                                    form="edit_product_${product.id}" value=
                                    <#list product.attributes.packagingCount! as packagingCount>
                                        ${packagingCount}<#sep>,</#sep>
                                    </#list>
                                </#if>
                        >
                        <label for="form-packagingCount">Кол-во в упаковке (через запятую)</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="sterility"
                               <#if addForm>form="addProduct"
                                <#else>
                                    form="edit_product_${product.id}"
                                </#if>
                               class="form-check-input" id="sterility">
                        <label class="form-check-label" for="sterility">Стерильность</label>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit"
                            <#if addForm>form="addProduct"
                            <#else>
                                form="edit_product_${product.id}"
                            </#if>
                            class="btn info-color-dark text-white">
                        <i class="fas fa-pencil-alt mr-2"></i>Сохранить
                    </button>
                    <button type="button" class="btn btn-outline-info info-color-dark text-white"
                            data-dismiss="modal">
                        <i class="fas fa-times mr-2"></i>Отменить
                    </button>
                </div>
            </div>
        </div>
    </div>
    <#if addForm>
        <form id="addProduct" action="/admin/products/add" class="form-row text-center"
              method="post" enctype="multipart/form-data">
        </form>
    </#if>

    <script type="text/javascript">
        var categoriesSelector = document.getElementById("category");
        var subcategoriesSelector = document.getElementById("subcategory");
        var categoriesList = [<#list categories as category>"${category}"<#if category_has_next>, </#if></#list>];
        var subcategoriesAsJson = ${subcategoriesAsJson};

        categoriesSelector.addEventListener("change", function () {
            test();
        });

        function test() {
            var index = categoriesSelector.selectedIndex;
            resetSelector();
            if (index !== -1) {
                var categoryName = categoriesList[index - 1];

                if (subcategoriesAsJson[categoryName] !== undefined) {
                    for (var i = 0; i < subcategoriesAsJson[categoryName].length; i++) {
                        subcategoriesSelector[i + 1] = new Option(subcategoriesAsJson[categoryName][i]);
                    }
                }
            }
        }

        function resetSelector() {
            subcategoriesSelector.options.length = 0;
            subcategoriesSelector[0] = new Option("Выберите подкатегорию", "", true, true);
            subcategoriesSelector[0].disabled = true;
        }
    </script>
</#macro>

<#macro form products>
    <#list products as product>
        <form id="edit_product_${product.id}" action="/admin/products/${product.id}/edit"
              class="form-row text-center"
              method="post" enctype="multipart/form-data">
        </form>
    </#list>
</#macro>