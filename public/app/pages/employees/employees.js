define(['app/service/employeesService','app/service/navService', "knockout", 'app/service/barService', "jquery", "text!./employees.html"],
    function (employeesService, navService, ko, bar, $, listTemplate) {
        "use strict";

        function employeesViewModel() {
            bar.go(50);
            var self = this;
            self.employees = ko.observableArray([]);
            self.hasNextPage = ko.observable(false);
            self.hasPreviousPage = ko.observable(false);
            self.EMPLOYEES_PER_PAGE = 10;
            self.edit =  ko.observableArray([]);
            self.rolesList = ko.observableArray(['admin','dispatcher','manager','driver','director']);
            self.selectedRole = ko.observableArray([]);

            employeesService.get(
                self.EMPLOYEES_PER_PAGE + 1,
                function (data) {
                    if (data.length === self.EMPLOYEES_PER_PAGE + 1) {
                        self.hasNextPage(true);
                        data.pop();
                    } else {
                        self.hasNextPage(false);
                    }
                    self.hasPreviousPage(false);
                    self.employees(data);
                },
                function (data) {navService.catchError(data);},
                function () {
                    bar.go(100);
                }
            );

            self.nextPage = function () {
                if (!self.hasNextPage()) return;
                var nextPageFirstCompanyId = self.employees()[self.employees().length - 1].id + 1;
                employeesService.toNextPage(
                    nextPageFirstCompanyId,
                    self.EMPLOYEES_PER_PAGE + 1,
                    function (data) {
                        if (data.length === self.EMPLOYEES_PER_PAGE + 1) {
                            self.hasNextPage(true);
                            data.pop();
                        } else {
                            self.hasNextPage(false);
                        }
                        self.hasPreviousPage(true);
                        self.employees(data);
                    },
                    function (data) {navService.catchError(data);}
                );

            };

            self.previousPage = function () {
                if (!self.hasPreviousPage()) return;
                employeesService.toPreviousPage(
                    self.EMPLOYEES_PER_PAGE + 1,
                    self.employees()[0].id,
                    function (data) {
                        if (data.length === self.EMPLOYEES_PER_PAGE + 1) {
                            self.hasPreviousPage(true);
                            data.shift();
                        } else {
                            self.hasPreviousPage(false);
                        }
                        self.hasNextPage(true);
                        self.employees(data);
                    },
                    function (data) {navService.catchError(data);});

            };


            $('#addButton').on('click', function () {
                navService.navigateTo("addEmployee");
            });


            self.remove = function (attr) {
                this.disabled = true;
                employeesService.remove(
                    attr.id,
                    function () {
                        var tempArray = self.employees().slice();
                        for (var i = 0; i < tempArray.length; i++) {
                            if (tempArray[i].id === attr.id) {
                                tempArray.splice(i, 1);
                                i--;
                            }
                        }
                        self.employees(tempArray);
                    },
                    function (data) {navService.catchError(data);}
                );
                this.disabled = false;
            };

            self.onLink = function (attr) {
                employeesService.getUser(
                    attr.id,
                    function (data) {
                        self.edit(data);
                        self.edit().id = attr.id;
                        self.selectedRole.removeAll();
                        self.selectedRole.push(attr.userRoleList[0].name.toLowerCase());
                        setTimeout($('#editModal').modal(), 500);
                    },
                    function (data) {navService.catchError(data);}
                );
            };

            self.updateEmployee = function () {
                employeesService.update(
                    self.edit(),
                    function (data) {
                        self.edit([]);
                        self.selectedRole([]);
                        window.location.reload();
                    },
                    function (data) {navService.catchError(data);});
            };

            return self;
        }


        return {viewModel: employeesViewModel, template: listTemplate};
    });
