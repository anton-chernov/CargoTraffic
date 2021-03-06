define(['app/service/navService', 'app/service/clientService', "knockout", 'app/service/barService', "jquery", "text!./clients.html"],
    function (navService, clientService, ko, bar, $, listTemplate) {
        "use strict";

        function clientsViewModel() {
            bar.go(50);
            var self = this;
            self.clients = ko.observableArray([]);
            self.checkedClients = ko.observableArray([]);
            self.hasNextPage = ko.observable(false);
            self.hasPreviousPage = ko.observable(false);
            self.allChecked = ko.computed(function() {
                var success = $.grep(self.clients(), function(element,index) {
                    return $.inArray(element.id.toString(), self.checkedClients()) !== -1;
                }).length === self.clients().length;
                return success;
            }, this);
            self.CLIENTS_PER_PAGE = 10;
            var dateOptions = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                second: 'numeric'
            };


            clientService.list(1, self.CLIENTS_PER_PAGE + 1, true,
                function (data) {
                    if (data.length === self.CLIENTS_PER_PAGE + 1) {
                        self.hasNextPage(true);
                        data.pop();
                    } else {
                        self.hasNextPage(false);
                    }
                    self.hasPreviousPage(false);
                    $.each(data, function (index, element) {
                        element.date = new Date(element.date).toLocaleString("ru", dateOptions);
                    });
                    self.clients(data);
                },
                function (data) {
                    navService.catchError(data);
                },
                function () {
                    bar.go(100);
                });


            self.nextPage = function () {
                if (!self.hasNextPage()) return;
                var nextPageFirstClientId = self.clients()[self.clients().length - 1].id + 1;
                clientService.list(nextPageFirstClientId, self.CLIENTS_PER_PAGE + 1, true,
                    function (data) {
                        if (data.length === self.CLIENTS_PER_PAGE + 1) {
                            self.hasNextPage(true);
                            data.pop();
                        } else {
                            self.hasNextPage(false);
                        }
                        self.hasPreviousPage(true);
                        $.each(data, function (index, element) {
                            element.date = new Date(element.date).toLocaleString("ru", dateOptions);
                        });
                        self.clients(data);
                    },
                    function (data) {
                        navService.catchError(data);
                    });

            };

            self.previousPage = function () {
                if (!self.hasPreviousPage()) return;
                clientService.list(self.clients()[0].id, self.CLIENTS_PER_PAGE + 1, false,
                    function (data) {
                        if (data.length === self.CLIENTS_PER_PAGE + 1) {
                            self.hasPreviousPage(true);
                            data.shift();
                        } else {
                            self.hasPreviousPage(false);
                        }
                        self.hasNextPage(true);
                        $.each(data, function (index, element) {
                            element.date = new Date(element.date).toLocaleString("ru", dateOptions);
                        });
                        self.clients(data);
                    },
                    function (data) {
                        navService.catchError(data);
                    });
            };

            self.getClientStatus = function(isLocked) {
                return isLocked ? "Locked" : "Unlocked";
            };


            $('#selectAllCheckbox').on('click', function () {
                if (!self.allChecked()) {
                    $.each(self.clients(), function (index, element) {
                        if ($.inArray(element.id.toString(), self.checkedClients()) === -1) {
                            self.checkedClients.push(element.id.toString());
                        }
                    });
                } else {
                    $.each(self.clients(), function (index, element) {
                        if ($.inArray(element.id.toString(), self.checkedClients()) !== -1) {
                            self.checkedClients.remove(element.id.toString());
                        }
                    });
                }
            });

            $('#lockButton').on('click', function() {
                clientService.lock(self.checkedClients(),
                    function() {
                        var auxiliaryArray = self.clients().slice();
                        $.each(auxiliaryArray, function (index, element) {
                            if ($.inArray(element.id.toString(), self.checkedClients()) !== -1) {
                                if (!element.locked)
                                    element.date = new Date().toLocaleString("ru", dateOptions);
                                element.locked = true;
                                auxiliaryArray.splice(index, 1);
                                auxiliaryArray.splice(index, 0, element);
                            }
                        });
                        self.clients([]);
                        self.clients(auxiliaryArray);
                        self.checkedClients([]);
                    },
                    function (data) {
                        navService.catchError(data);
                    });
            });

            $('#unlockButton').on('click', function() {
                clientService.unlock(self.checkedClients(),
                    function() {
                        var auxiliaryArray = self.clients().slice();
                        $.each(auxiliaryArray, function (index, element) {
                            if ($.inArray(element.id.toString(), self.checkedClients()) !== -1) {
                                if (element.locked)
                                    element.date = new Date().toLocaleString("ru", dateOptions);
                                element.locked = false;
                                auxiliaryArray.splice(index, 1);
                                auxiliaryArray.splice(index, 0, element);
                            }
                        });
                        self.clients([]);
                        self.clients(auxiliaryArray);
                        self.checkedClients([]);
                    },
                    function (data) {
                        navService.catchError(data);
                    });
            });


            self.addClient = function () {
                $('#addClientModal').modal();
            };


            /*************** Modal-dialog ***************/


            self.company = {};
            self.admin = {};
            self.company.name = ko.observable();
            self.company.transportationCostPerKm = ko.observable();
            self.admin.surname = ko.observable();
            self.admin.email = ko.observable();

            self.companyNameRegexp = "^[a-zA-Z0-9_-]{1,250}$";
            self.companyTransportationCostRegexp = "^[0-9]+\.[0-9]+$";
            self.surnameRegexp = "^[a-zA-Zа-яА-ЯёЁ]{1,250}$";
            self.emailRegexp = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,210}@[a-zA-Z0-9-]{1,30}\.[a-zA-Z0-9-]{2,3}$";
            self.isCompanyNameCorrect = ko.computed(function() {
                if (self.company.name())
                    return (!!self.company.name().match(self.companyNameRegexp));
                return true;
            });
            self.isTransportationCostCorrect = ko.computed(function() {
                if (self.company.transportationCostPerKm())
                    return (!!self.company.transportationCostPerKm().match(self.companyTransportationCostRegexp));
                return true;
            });
            self.isAdminSurnameCorrect = ko.computed(function() {
                if (self.admin.surname())
                    return (!!self.admin.surname().match(self.surnameRegexp));
                return true;
            });
            self.isAdminEmailCorrect = ko.computed(function() {
                if (self.admin.email())
                    return (!!self.admin.email().match(self.emailRegexp));
                return true;
            });
            self.isValidated = ko.computed(function() {
                return self.isCompanyNameCorrect() &&
                    self.isTransportationCostCorrect() &&
                    self.isAdminSurnameCorrect() &&
                    self.isAdminEmailCorrect() &&
                    !!self.company.name() &&
                    !!self.company.transportationCostPerKm() &&
                    !!self.admin.surname() &&
                    !!self.admin.email();
            });


            self.add = function () {
                if (!self.isValidated()) return;
                self.company.date = new Date();
                clientService.add(self.company, self.admin,
                    function (data) {
                        if (self.clients().length < self.CLIENTS_PER_PAGE) {
                            data.date = new Date().toLocaleString("ru", dateOptions);
                            self.clients.push(data);
                        } else {
                            self.hasNextPage(true);
                        }
                        self.company.name(null);
                        self.company.transportationCostPerKm(null);
                        self.admin.surname(null);
                        self.admin.email (null);
                    },
                    function (data) {
                        navService.catchError(data);
                    },
                    function () {
                        $('#addClientModal').modal('toggle');
                    })
            };


            return self;
        }


        return {viewModel: clientsViewModel, template: listTemplate};
    });

