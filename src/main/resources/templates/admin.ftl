<#import "parts/common.ftl" as c>
<#import "parts/modalViews.ftl" as modalView>

<@c.page>
    <div class="row">
        <form action="/admin/add" class="needs-validation col-md-4 col-sm-6" method="post" enctype="multipart/form-data">
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
                       placeholder="Имена подкатегорий (через запятую)">
            </div>
            <button class="btn info-color-dark text-white btn-sm" type="submit">Добавить</button>
        </form>

        <div class="col-md-8 col-sm-6">
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
                        <th scope="row">${category_index}</th>
                        <td>${category}</td>
                        <td>
                            <#if subcategories[category]??>
                                <#list subcategories[category] as subcategory>
                                    ${subcategory!}<#sep>,
                                </#list>
                            </#if>
                        </td>
                        <td>
                            <#if subcategories[category]??>
                                <#assign subcategoryString>
                                    <#list subcategories[category] as subcategory>${subcategory}<#sep>,</#sep></#list>
                                </#assign>
                            <#else>
                                <#assign subcategoryString = "">
                            </#if>
                            <@modalView.editView category_index category subcategoryString/>
                        </td>
                        <td>
                            <@modalView.removeView category_index category/>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>

            <@modalView.forms categories />

        </div>
    </div>

    <!-- SCRIPTS FOR ERROR HANDLING-->
    <#if addError??>
        <script>alert("Категория уже существует!");</script>
    </#if>

    <#if removeError??>
        <script>alert("Невозможно удалить категорию");</script>
    </#if>

    <#if editError??>
        <script>alert("Невозможно обновить категорию");</script>
    </#if>
</@c.page>