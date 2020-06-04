<?php

namespace app\admin\model;

use think\Model;


class CaseSchedule extends Model
{

    

    

    // 表名
    protected $name = 'case_schedule';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'woker_start_time_text',
        'woker_end_time_text',
        'create_time_text'
    ];
    

    



    public function getWokerStartTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['woker_start_time']) ? $data['woker_start_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getWokerEndTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['woker_end_time']) ? $data['woker_end_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getCreateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['create_time']) ? $data['create_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setWokerStartTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setWokerEndTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setCreateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


}
