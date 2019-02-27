<#import "parts/common.ftl" as c>

<@c.page>
    <form class="needs-validation" method="post" enctype="multipart/form-data">
        <label>Добавление категории</label>
        <div class="col-3 md-form">
            <i class="fas fa-pencil-alt prefix"></i>
            <label for="categoryName">Добавить категорию</label>
            <input type="text" class="form-control" id="categoryName" name="categoryName"
                   placeholder="Имя категории"
                   required>
        </div>
        <div class="col-3 md-form">
            <i class="fas fa-pencil-alt prefix"></i>
            <label for="subcategories">Добавить подкатегорию</label>
            <input type="text" class="form-control" id="subcategories" name="subcategoriesNames"
                   placeholder="Имена подкатегорий (через пробел)">
        </div>
        <button class="btn btn-info text-white btn-sm" type="submit">Добавить</button>
    </form>
    <#if error??>
        <script>alert("Категория уже существует!");</script>
    </#if>
</@c.page>