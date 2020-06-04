define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user_case/index' + location.search,
                    add_url: 'user_case/add',
                    edit_url: 'user_case/edit',
                    del_url: 'user_case/del',
                    multi_url: 'user_case/multi',
                    table: 'user_case',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                search:false,
                commonSearch:false,

                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'case_name', title: __('Case name')},
                        {field: 'uid', title: __('Uid')},
                        {field: 'tag', title: __('Tag')},
                        {field: 'staff_id', title: __('Staff')},
                        {field: 'woker_hourse', title: __('Woker hourse')},
                        {field: 'push_status', title: __('Push status')},
                        {field: 'handle_status', title: __('Handle status')},
                        {field: 'money', title: __('Money'), operate:'BETWEEN'},
                        {field: 'start_time', title: __('Start time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'end_time', title: __('End time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'create_time', title: __('Create time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Work_process'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: function (row,index) {
                                    return 'case_schedule/index?case_id='+row.id;
                                }
                            }],
                            formatter: Table.api.formatter.operate}
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