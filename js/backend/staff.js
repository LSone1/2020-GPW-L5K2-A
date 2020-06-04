define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'staff/index' + location.search,
                    add_url: 'staff/add',
                    edit_url: 'staff/edit',
                    del_url: 'staff/del',
                    multi_url: 'staff/multi',
                    table: 'staff',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search:false,
                columns: [
                    [
                        {checkbox: true},
                        // {field: 'id', title: __('Id')},
                        {field: 'username', title: __('Username')},
                        // {field: 'password', title: __('Password')},
                        {field: 'age', title: __('Age'),operate:false},
                        {field: 'job', title: __('Job')},
                        {field: 'belongs', title: __('Belongs'), operate:'BETWEEN'},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});