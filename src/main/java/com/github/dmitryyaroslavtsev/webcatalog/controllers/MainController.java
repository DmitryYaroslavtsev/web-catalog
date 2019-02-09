package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.dependency.StyleSheet;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.router.Route;

@StyleSheet("main-view-menu")
@Route("")
public class MainController extends HorizontalLayout {

    private Button first = new Button("First");
    private Button second = new Button("Second");
    private HorizontalLayout layout = new HorizontalLayout(first, second);

    public MainController() {
        add(layout);
    }


}
