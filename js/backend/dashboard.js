define(['jquery', 'bootstrap', 'backend', 'addtabs', 'table', 'echarts', 'echarts-theme', 'template'], function ($, undefined, Backend, Datatable, Table, Echarts, undefined, Template) {

    var Controller = {
        index: function () {
            // 基于准备好的dom，初始化echarts实例
            var myChart = Echarts.init(document.getElementById('echart'), 'walden');
            var myChart1 = Echarts.init(document.getElementById('echart1'), 'walden');

            var myCharts2 = Echarts.init(document.getElementById('echart2'));

            var option = {
                title: {
                    text: __('Calulate of current month')
                },
                tooltip: {},
                legend: {
                    // data:['总案件','胜诉案件','胜率','营业额']
                },
                xAxis: {
                   // data: ["张三","李四","王二麻子","李军","李建云","王艳"],
                    data: calJson.column,
                },
                yAxis: {},
                series: [
                {
                    name: __('Total case no'),
                    type: 'bar',
                    data: calJson.total_case_nos,
                    lineStyle: {
                        normal: {
                            width: 1.5
                        }
                    },
                },
                {
                    name: __('Total success  Case no'),
                    type: 'bar',
                    data: calJson.total_success_case_no
                },
                {
                    name: __('Success percent'),
                    type: 'bar',
                    data: calJson.success_percent
                },
                {
                    name: __('Case moneys'),
                    type: 'bar',
                    data: calJson.total_case_money
                }
                ]
            };
            var option1 = {
                title: {
                    text: __('Case year moneys')
                },
                tooltip: {},
                legend: {
                    // data:['总案件','胜诉案件','胜率','营业额']
                },
                xAxis: {
                    data: calJson.months,
                },
                yAxis: {},
                series: [
                {
                    name: __('Case year moneys'),
                    type: 'line',
                    data: calJson.moneys,
                    lineStyle: {
                        normal: {
                            width: 1.5
                        }
                    },
                },
                ]
            };
            var option2 = {
                title: {
                    text: __('tickets pie')
                },
                series: [
                    {
                        type:'pie',
                        // 第一个参数是内圆半径，第二个参数是外圆半径，相对饼图的宿主div大小
                        radius: ['40%', '50%'],
                        avoidLabelOverlap: false,
                        // 禁用饼状图悬浮动画效果
                        animation: false,
                        itemStyle: {
                            // emphasis：英文意思是 强调;着重;（轮廓、图形等的）鲜明;突出，重读
                            // emphasis：设置鼠标放到哪一块扇形上面的时候，扇形样式、阴影
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(30, 144, 255，0.5)'
                            }
                        },
                        label: {
                            normal: {
                                // 这里的竖线前面的b 和 per是相应参数的别名(我理解为别名)，对应下面rich属性里的b和per
                                formatter: '{b|{b}：}{c} ({per|{d}%})',
                                backgroundColor: '#eee',
                                borderColor: '#aaa',
                                borderWidth: 1,
                                padding: 5,
                                borderRadius: 4,
                                rich: {
                                    b: {
                                        fontSize: 8,
                                        lineHeight: 15
                                    },
                                    per: {
                                        align: 'center'
                                    }
                                }
                            }
                        },
                        data:[
                            {value:calJson.todayorder, name:__('Case processing number')},
                            {value:calJson.successorder, name:__('Case success number')},
                            {value:calJson.failorder, name:__('Case fail number')},
                        ]
                    }
                ]
            }
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            myChart1.setOption(option1);
            //圆饼图
            myCharts2.setOption(option2);
            }
    };

    return Controller;
});