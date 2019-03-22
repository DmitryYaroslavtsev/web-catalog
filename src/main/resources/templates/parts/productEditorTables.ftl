<#import "productsModalViews.ftl" as modals>

<#macro table products>
    <#list products as product>
        <tr>
            <th scope="row">${product.id}</th>
            <td>${product.name!}</td>
            <td>${product.description!}</td>
            <td>
                <#list product.attributes.size! as size>
                    ${size}<#sep>, </#sep>
                </#list>
            </td>
            <td>
                <#list product.attributes.material! as material>
                    ${material}<#sep>, </#sep>
                </#list>
            </td>
            <td>
                <#list product.attributes.density! as density>
                    ${density}<#sep>, </#sep>
                </#list>
            </td>
            <td>${product.attributes.sterility!?string}</td>
            <td>
                <#list product.attributes.colors! as color>
                    ${color}<#sep>, </#sep>
                </#list>
            </td>
            <td>
                <#list product.attributes.packagingCount! as packagingCount>
                    ${packagingCount}<#sep>, </#sep>
                </#list>
            </td>
            <td>
                <@modals.editForm product product.id/>
            </td>
            <td>

            </td>
        </tr>
    </#list>
</#macro>