<#macro editView category_index category subcategoryString>
    <div class="m-auto">
        <button type="button" class="btn info-color-dark text-white btn-sm" data-toggle="modal"
                data-target="#edit_modal_form${category_index}">
            <i class="fas fa-pencil-alt mr-2"></i>Редактировать
        </button>
    </div>

    <div class="modal fade" id="edit_modal_form${category_index}" tabindex="-1" role="dialog"
         aria-labelledby="edit_modal_form${category_index}"
         aria-hidden="true">
        <div class="modal-dialog modal-info" role="document">
            <div class="modal-content">
                <div class="modal-header text-center info-color-dark text-white">
                    <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-pencil-alt mr-2"></i>Редактировать
                        категорию</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <input type="text" id="form-categoryName" name="categoryNewName" class="form-control"
                               form="edit_${category_index}" value="${category}" required>
                        <label for="form-categoryName">Название</label>
                    </div>

                    <div class="md-form mb-5">
                        <input type="text" id="form-subcategoriesNames" name="subcategoriesNames"
                               class="form-control"
                               form="edit_${category_index}" value="${subcategoryString?trim}">
                        <label for="form-subcategoriesNames">Подкатегории (через запятую)</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="col">
                        <button type="submit" form="edit_${category_index}"
                                class="btn info-color-dark text-white">
                            <i class="fas fa-pencil-alt mr-2"></i>Сохранить
                        </button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-outline-info info-color-dark text-white" data-dismiss="modal">
                            <i class="fas fa-times mr-2"></i>Отменить
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro removeView category_index category>
    <div class="m-auto">
        <button type="button" class="btn btn-danger text-white btn-sm" data-toggle="modal"
                data-target="#remove_modal_form${category_index}">
            <i class="fas fa-trash mr-2"></i>Удалить
        </button>
    </div>

    <div class="modal fade" id="remove_modal_form${category_index}" tabindex="-1" role="dialog"
         aria-labelledby="remove_modal_form${category_index}"
         aria-hidden="true">
        <div class="modal-dialog modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header text-center danger-color text-white">
                    <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-trash mr-2"></i>Удалить категорию
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div>
                        <h6>Вы уверены, что хотите удалить категорию "${category}?"</h6>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="removeProductCheckbox" form="remove_${category_index}"
                               class="form-check-input" id="removeProduct_${category_index}">
                        <label class="form-check-label" for="remove_${category_index}">Удалить все товары данной
                            категории?</label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="col">
                        <button type="submit" form="remove_${category_index}"
                                class="btn btn-danger text-white">
                            <i class="fas fa-trash mr-2"></i>Удалить
                        </button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-outline-danger text-white" data-dismiss="modal">
                            <i class="fas fa-times mr-2"></i>Отменить
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro forms categories>
    <#list categories as category>

        <form id="edit_${category_index}" action="/admin/${category}/edit" class="form-row text-center"
              method="post" enctype="multipart/form-data">
        </form>

        <form id="remove_${category_index}" action="/admin/${category}/remove" class="form-row text-center"
              method="post" enctype="multipart/form-data">
        </form>
    </#list>
</#macro>