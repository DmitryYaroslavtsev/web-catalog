<#import "parts/common.ftl" as c>
<#import "parts/modalViews.ftl" as modalView>

<@c.page>
    <div class="row">
        <form action="/admin/add" class="needs-validation col-4" method="post" enctype="multipart/form-data">
            <label>Добавление категории</label>
            <div class="md-form">
                <i class="fas fa-pencil-alt prefix"></i>
                <label for="categoryName">Добавить категорию</label>
                <input type="text" class="form-control" id="categoryName" name="categoryName"
                       placeholder="Имя категории"
                       required>
            </div>
            <div class="md-form">
                <i class="fas fa-pencil-alt prefix"></i>
                <label for="subcategories">Добавить подкатегорию</label>
                <input type="text" class="form-control" id="subcategories" name="subcategoriesNames"
                       placeholder="Имена подкатегорий (через пробел)">
            </div>
            <button class="btn btn-info text-white btn-sm" type="submit">Добавить</button>
        </form>

        <form class="col-8">
            <table id="category"
                   class="table table-bordered table-hover table-sm text-center"
                   cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th class="th-sm">#</th>
                    <th class="th-sm">Имя</th>
                    <th class="th-sm">Список подкатегорий</th>
                    <th class="th-sm"></th>
                    <th class="th-sm"></th>
                </tr>
                </thead>
                <tbody>
                <#list categories as category>
                    <tr>
                        <th scope="row">${category?counter}</th>
                        <td>${category}</td>
                        <td>
                            <#if subcategories[category]??>
                                <#list subcategories[category] as subcategory>
                                    ${subcategory!}
                                </#list>
                            </#if>
                        </td>
                        <td>
                            <@modalView.editView (category?counter) />
                        </td>
                        <td>
                            <button type="submit" form="${category?counter}_remove"
                                    class="btn btn-danger text-white btn-sm"><i class="fas fa-trash mr-2"
                                                                                aria-hidden="true"></i>Удалить
                            </button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>

            <#list categories as category>
                <form id="${category?counter}_edit" action="/admin/${category}/edit" class="form-row text-center"
                      method="post">
                </form>

                <form id="${category?counter}_remove" action="/admin/${category}/remove" class="form-row text-center"
                      method="post"></form>
            </#list>
        </form>
    </div>

    <!-- SCRIPTS FOR ERROR HANDLING-->
    <#if addError??>
        <script>alert("Категория уже существует!");</script>
    </#if>

    <#if removeError??>
        <script>alert("Невозможно удалить категорию");</script>
    </#if>
</@c.page>