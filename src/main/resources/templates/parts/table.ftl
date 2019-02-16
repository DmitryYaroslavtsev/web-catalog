<#macro table products>
    <#list products as product>
        <tr>
            <th scope="row">1</th>
            <td>${product.name!}</td>
            <td>${product.description!}</td>
            <td>${product.size!}</td>
            <td>${product.attributes.material!}</td>
            <td>${product.attributes.density!}</td>
            <td>${product.attributes.sterility!?string}</td>
            <td>
                <#list product.attributes.colors! as color>
                    ${color}
                </#list>
            </td>
            <td>${product.attributes.packagingCount!}</td>
            <td>${product.attributes.transportBoxCount!}</td>
            <td>${product.attributes.tax!}</td>
        </tr>
    </#list>
</#macro>