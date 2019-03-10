package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.service.AdminService;
import com.github.dmitryyaroslavtsev.webcatalog.service.CatalogService;
import com.github.dmitryyaroslavtsev.webcatalog.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    private final CatalogService catalogService;

    private final ProductService productService;

    private ModelAndView modelAndView = new ModelAndView();

    @Autowired
    public AdminController(AdminService adminService, CatalogService catalogService, ProductService productService) {
        this.adminService = adminService;
        this.catalogService = catalogService;
        this.productService = productService;
    }

    @GetMapping
    public String getAdminPage() {
        return "admin";
    }

    @GetMapping("categories")
    public String getCategoryEditor(Map<String, Object> model) throws JsonProcessingException {

        model.putAll(catalogService.getCatalog());
        return "categoryEditor";
    }

    @PostMapping("categories/add")
    public ModelAndView addCategory(
            @RequestParam String categoryName,
            @RequestParam String subcategoriesNames,
            RedirectAttributes attributes) {


        if (!adminService.categoryExists(categoryName)) {
            adminService.createCategory(categoryName, subcategoriesNames);
        } else {
            attributes.addFlashAttribute("addError", "Category already exists");
        }
        modelAndView.setViewName("redirect:/admin/categories");
        return modelAndView;
    }

    @PostMapping("categories/{category}/edit")
    public ModelAndView editCategory(
            @PathVariable String category,
            @RequestParam String categoryNewName,
            @RequestParam(required = false) String subcategoriesNames,
            RedirectAttributes attributes
    ) {

        if (!adminService.updateCategory(category, categoryNewName, subcategoriesNames)) {
            attributes.addFlashAttribute("editError", "Category find category for update");
        }

        modelAndView.setViewName("redirect:/admin/categories");
        return modelAndView;
    }

    @PostMapping("categories/{category}/remove")
    public ModelAndView removeCategory(
            @PathVariable String category,
            @RequestParam(required = false) boolean removeProductCheckbox,
            RedirectAttributes attributes
    ) {
        if (adminService.removeCategory(category)) {
            if (removeProductCheckbox) {
                productService.removeProductsByCategory(category);
            }
        } else {
            attributes.addFlashAttribute("removeError", "Can't remove category");
        }

        modelAndView.setViewName("redirect:/admin/categories");
        return modelAndView;
    }

    @GetMapping("products")
    public String getProductsEditor(Map<String, Object> model) throws JsonProcessingException {

        model.putAll(catalogService.getCatalog());

        return "productsEditor";
    }

    @PostMapping("products/add")
    public ModelAndView addProduct(
            @RequestParam String name,
            @RequestParam String category,
            @RequestParam String subcategory,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String size,
            @RequestParam(required = false) String material,
            @RequestParam(required = false) String density,
            @RequestParam(required = false) String colors,
            @RequestParam(required = false) String packagingCount,
            @RequestParam(required = false) boolean sterility
    ) {

        productService.saveProduct(
                name,
                category,
                subcategory,
                description,
                size,
                material,
                density,
                colors,
                packagingCount,
                sterility);

        modelAndView.setViewName("redirect:/admin/products");
        return modelAndView;
    }

    @PostMapping("products/{id}/edit")
    public ModelAndView editProduct(
            @PathVariable String id,
            @RequestParam String name,
            @RequestParam String category,
            @RequestParam String subcategory,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) String size,
            @RequestParam(required = false) String material,
            @RequestParam(required = false) String density,
            @RequestParam(required = false) String colors,
            @RequestParam(required = false) String packagingCount,
            @RequestParam(required = false) boolean sterility,
            RedirectAttributes attributes
    ) {

        Product product = productService.findById(id);

        if (product == null) {
            attributes.addFlashAttribute("editError", "Product isn't exist for update");
        } else {

        }

        modelAndView.setViewName("redirect:/admin/products");
        return modelAndView;
    }
}
