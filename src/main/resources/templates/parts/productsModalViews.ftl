<#macro addForm>
    <div class="m-auto">
        <button type="button" class="btn info-color-dark text-white btn-sm" data-target="#add_product_form"
                data-toggle="modal">
            <i class="fas fa-plus-square mr-2"></i>Добавить позицию
        </button>
    </div>

    <div class="modal fade" id="add_product_form" aria-labelledby="add_product_form" tabindex="-1" role="dialog"
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
                        <input type="text" name="name" class="form-control" form="addProduct" value=""
                               id="form-name-add" required>
                        <label for="form-name">Наименование</label>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="category" id="category" form="addProduct" required>
                            <option selected disabled value="">Выберите категорию</option>
                            <#list categories as category>
                                <option value="${category}">${category}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="subcategory" form="addProduct" id="subcategory" required>
                            <option selected disabled value="">Выберите подкатегорию</option>
                        </select>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-description" name="description" class="form-control"
                               form="addProduct" value="">
                        <label for="form-description">Описание</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-size" name="size" class="form-control"
                               form="addProduct" value="">
                        <label for="form-size">Размеры (через запятую)</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-material" name="material" class="form-control"
                               form="addProduct" value="">
                        <label for="form-material">Материал (через запятую</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-density" name="density" class="form-control" form="addProduct"
                               value="">
                        <label for="form-density">Плотность (через запятую)</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-colors" name="colors" class="form-control" value=""
                               form="addProduct">
                        <label for="form-colors">Цвета (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-packagingCount" name="packagingCount" class="form-control"
                               form="addProduct" value="">
                        <label for="form-packagingCount">Кол-во в упаковке (через запятую)</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="sterility" form="addProduct" class="form-check-input"
                               id="sterility">
                        <label class="form-check-label" for="sterility">Стерильность</label>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" form="addProduct" class="btn info-color-dark text-white">
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
    <form id="addProduct" action="/admin/products/add" class="form-row text-center"
          method="post" enctype="multipart/form-data">
    </form>

    <script type="text/javascript">
        var categoriesSelector = document.getElementById("category");
        var subcategoriesSelector = document.getElementById("subcategory");
        var categoriesList = [<#list categories as category>"${category}"<#if category_has_next>, </#if></#list>];
        var subcategoriesAsJson = ${subcategoriesAsJson};

        categoriesSelector.addEventListener("change", function () {
            selector();
        });

        function selector() {
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

<#macro editForm product>
    <div class="m-auto">
        <button type="button" class="btn info-color-dark text-white btn-sm"
                data-target="#edit_product_form_${product.id}"
                data-toggle="modal">
            <i class="fas fa-pencil-alt mr-2"></i>Редактировать
        </button>
    </div>

    <div class="modal fade" id="edit_product_form_${product.id}" aria-labelledby="edit_product_form_${product.id}"
         tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-info " role="document">
            <div class="modal-content">
                <div class="modal-header text-center info-color-dark text-white">
                    <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-pencil-alt mr-2"></i>Редактировать
                        позицию</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form">
                        <input type="text" name="name" class="form-control" form="edit_product_${product.id}"
                               value="${product.name!}"
                               id="form-name-edit${product.id}" required>
                        <label for="form-name">Наименование</label>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="category" id="category${product.id}"
                                onchange="test('${product.id}')"
                                form="edit_product_${product.id}" required>
                            <#list categories as category>
                                <option
                                        <#if category == product.category.categoryName>
                                        value="${category}" selected>
                                    <#else>
                                        value="${category}">
                                    </#if>
                                    ${category}
                                </option>
                            </#list>
                        </select>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="subcategory" form="edit_product_${product.id}"
                                id="subcategory${product.id}" required>
                            <#list subcategories[product.category.categoryName] as subcategory>
                                <option
                                        <#if subcategory == product.subcategory>
                                        value="${subcategory}" selected>
                                    <#else>
                                        value="${subcategory}">
                                    </#if>
                                    ${subcategory}
                                </option>
                            </#list>
                        </select>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-description-edit${product.id}" name="description"
                               class="form-control"
                               form="edit_product_${product.id}"
                               value="${product.description!}">
                        <label for="form-description">Описание</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-size-edit${product.id}" name="size" class="form-control"
                               form="edit_product_${product.id}"
                               value="<#list product.attributes.size! as size>${size}<#sep>,</#sep></#list>">
                        <label for="form-size">Размеры (через запятую)</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-material-edit${product.id}" name="material" class="form-control"
                               form="edit_product_${product.id}"
                               value="<#list product.attributes.material! as material>${material}<#sep>,</#sep></#list>">
                        <label for="form-material">Материал (через запятую</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-density-edit${product.id}" name="density" class="form-control"
                               form="edit_product_${product.id}"
                               value="<#list product.attributes.density! as density>${density}<#sep>,</#sep></#list>">
                        <label for="form-density">Плотность (через запятую)</label>
                    </div>

                    <div class="md-form">
                        <input type="text" id="form-colors-edit${product.id}" name="colors" class="form-control"
                               form="edit_product_${product.id}"
                               value="<#list product.attributes.colors! as colors>${colors}<#sep>,</#sep></#list>">
                        <label for="form-colors">Цвета (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-packagingCount-edit${product.id}" name="packagingCount"
                               class="form-control"
                               form="edit_product_${product.id}"
                               value="<#list product.attributes.packagingCount! as packagingCount>${packagingCount}<#sep>,</#sep></#list>">
                        <label for="form-packagingCount">Кол-во в упаковке (через запятую)</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="sterility" form="edit_product_${product.id}"
                               class="form-check-input"
                               id="sterility-edit${product.id}"
                                <#if product.attributes.sterility == "Да">
                                    checked
                                </#if>>
                        <label class="form-check-label" for="sterility">Стерильность</label>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" form="edit_product_${product.id}" class="btn info-color-dark text-white">
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

    <script type="text/javascript">
        var categoriesList = [<#list categories as category>"${category}"<#if category_has_next>, </#if></#list>];
        var subcategoriesAsJson = ${subcategoriesAsJson};

        function test(id) {
            var categoriesSelector = document.getElementById("category" + id);
            var subcategoriesSelector = document.getElementById("subcategory" + id);
            var index = categoriesSelector.selectedIndex;

            resetSelector();
            if (index !== -1) {
                var categoryName = categoriesList[index];
                if (subcategoriesAsJson[categoryName] !== undefined) {
                    for (var i = 0; i < subcategoriesAsJson[categoryName].length; i++) {
                        subcategoriesSelector[i + 1] = new Option(subcategoriesAsJson[categoryName][i]);
                    }
                }
            }

            function resetSelector() {
                subcategoriesSelector.options.length = 0;
                subcategoriesSelector[0] = new Option("Выберите подкатегорию", "", true, true);
                subcategoriesSelector[0].disabled = true;
            }
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