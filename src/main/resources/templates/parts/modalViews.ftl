<#macro editView category_counter category>
    <div class="m-auto">
        <button type="button" class="btn btn-info text-white btn-sm" data-toggle="modal"
                data-target="#edit_modal_form${category_counter}">
            <i class="fas fa-pencil-alt mr-2"></i>Редактировать
        </button>
    </div>

    <div class="modal fade" id="edit_modal_form${category_counter}" tabindex="-1" role="dialog"
         aria-labelledby="edit_modal_form${category_counter}"
         aria-hidden="true">
        <div class="modal-dialog modal-info" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Редактировать категорию</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">

                    <div class="md-form mb-5">
                        <input type="text" id="form-categoryName" name="categoryName" class="form-control"
                               form="edit_${category_counter}" value=${category}>
                        <label for="form-categoryName">Название</label>
                    </div>

                    <div class="md-form mb-5">
                        <input type="text" id="form-subcategoriesNames" name="subcategoriesNames" class="form-control"
                               form="edit_${category_counter}">
                        <label for="form-subcategoriesNames">Подкатегории (через пробел)</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="col">
                        <button type="submit" form="edit_${category_counter}"
                                class="btn btn-info text-white">
                            <i class="fas fa-pencil-alt mr-2"></i>Сохранить
                        </button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-outline-info text-white" data-dismiss="modal">
                            <i class="fas fa-times mr-2"></i>Отменить
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro removeView category_counter category>
    <div class="m-auto">
        <button type="button" class="btn btn-danger text-white btn-sm" data-toggle="modal"
                data-target="#remove_modal_form${category_counter}">
            <i class="fas fa-trash mr-2"></i>Удалить
        </button>
    </div>

    <div class="modal fade" id="remove_modal_form${category_counter}" tabindex="-1" role="dialog"
         aria-labelledby="remove_modal_form${category_counter}"
         aria-hidden="true">
        <div class="modal-dialog modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Удалить категорию</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div>
                        <h6>Вы уверены, что хотите удалить категорию "${category}?"</h6>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="removeProductCheckbox" form="remove_${category_counter}"
                               class="form-check-input" id="removeProduct_${category_counter}">
                        <label class="form-check-label" for="remove_${category_counter}">Удалить все товары данной
                            категории?</label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="col">
                        <button type="submit" form="remove_${category_counter}"
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