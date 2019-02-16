<#macro table products>
    <#list products as product>
        <tr>
            <th scope="row">${product?counter}</th>
            <td>${product.name!}</td>
            <td>${product.description!}</td>
            <td>
                <#list product.attributes.size! as size>
                    ${size}
                </#list>
            </td>
            <td>
                <#list product.attributes.material! as material>
                    ${material}
                </#list>
            </td>
            <td>
                <#list product.attributes.density! as density>
                    ${density}
                </#list>
            </td>
            <td>${product.attributes.sterility!?string}</td>
            <td>
                <#list product.attributes.colors! as color>
                    ${color}
                </#list>
            </td>
            <td>
                <#list product.attributes.packagingCount! as packagingCount>
                    ${packagingCount}
                </#list>
            </td>
            <td>
                <#list product.attributes.transportBoxCount! as transportBoxCount>
                    ${transportBoxCount}
                </#list>
            </td>
            <td>${product.attributes.tax!}</td>
        </tr>
    </#list>
</#macro>