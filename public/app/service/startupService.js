define(["app/utils/utils", "jquery"],
    function (utils, $) {
        "use strict";
        function StartupService() {

            var roles = function (done, error, always) {
                utils.send(
                    "api/roles",
                    "GET",
                    {},
                    done,
                    error,
                    always
                );
            };

            function init() {
                $.validator.addMethod(
                    "customDate",
                    function(value, element) {
                        return isValidDate(value);
                    },
                    "Please enter date of birth yyyy-mm-dd."
                );
                $.ajaxSetup({
                   beforeSend: function(xhr, options) {
                       options.url = window.location.origin + "/" +options.url
                   }
                });
            }


            function isValidDate(dateString) {
                if (dateString === "") return true;
                if (!/^\d{4}-\d{1,2}-\d{1,2}$/.test(dateString))
                    return false;

                var parts = dateString.split("-");
                var day = parseInt(parts[2], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[0], 10);

                if (year < 1900 || year > 2100 || month == 0 || month > 12)
                    return false;

                var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                    monthLength[1] = 29;

                return day > 0 && day <= monthLength[month - 1];
            }


            return {
                roles: roles,
                init:init
            }
        }

        return new StartupService();
    });