<#macro addProduct categories>
    <div class="m-auto">
        <button type="button" class="btn info-color-dark text-white btn-sm" data-toggle="modal"
                data-target="#add_product_form">
            <i class="fas fa-plus-square mr-2"></i>Добавить позицию
        </button>
    </div>

    <div class="modal fade" id="add_product_form" tabindex="-1" role="dialog"
         aria-labelledby="add_product_form"
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
                        <input type="text" id="form-name" name="name" class="form-control"
                               form="addProduct" value="" required>
                        <label for="form-name">Наименование</label>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="categories" form="addProduct" required>
                            <option selected disabled value="">Выберите категорию</option>
                            <#list categories as category>
                                <option value="${category}">${category}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="md-form">
                        <select class="custom-select" name="subcategories" form="addProduct" required="required">
                            <option selected disabled value="">Выберите подкатегорию</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
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
                        <input type="text" id="form-density" name="density" class="form-control"
                               form="addProduct" value="">
                        <label for="form-density">Плотность (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-colors" name="colors" class="form-control"
                               form="addProduct" value="">
                        <label for="form-colors">Цвета (через запятую)</label>
                    </div>
                    <div class="md-form">
                        <input type="text" id="form-packagingCount" name="packagingCount" class="form-control"
                               form="addProduct" value="">
                        <label for="form-packagingCount">Кол-во в упаковке (через запятую)</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="sterility" form="addProduct"
                               class="form-check-input" id="sterility">
                        <label class="form-check-label" for="sterility">Стерильность</label>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" form="addProduct"
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
    <form id="addProduct" action="/admin/products/add" class="form-row text-center"
          method="post" enctype="multipart/form-data">
    </form>
</#macro>