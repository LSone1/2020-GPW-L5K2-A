<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use fast\Random;
use think\Db;

/**
 * 员工管理
 *
 * @icon fa fa-circle-o
 */
class Staff extends Backend
{
    
    /**
     * Staff模型对象
     * @var \app\admin\model\Staff
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Staff;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
$password = $params['password'];
            $params['password']  =md5($params['password']);


            if ($params) {
                $params = $this->preExcludeFields($params);

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }
                    $params['create_time']  =time();
                    $result = $this->model->allowField(true)->save($params);

                    if($result!==false)
                    {
                        //通知员工组管理严注册
                        $admin =   model('Admin');
                        $paramsAdmin['salt'] = Random::alnum();
                        $paramsAdmin['username'] = $params['username'];
                        $paramsAdmin['nickname'] = $params['username'];
                        $paramsAdmin['password'] = md5(md5($password) . $paramsAdmin['salt']);
                        $paramsAdmin['avatar'] = '/assets/img/avatar.png'; //设置新管理员默认头像。
                        $result = $admin->save($paramsAdmin);
                        if($result!==false)
                        {
                            $dataset[] = ['uid' => $admin->id, 'group_id' => 6];
                            model('AuthGroupAccess')->saveAll($dataset);
                            Db::commit();
                            $this->success();

                        }
                    }
                    Db::rollback();
                    $this->error(__('No rows were inserted'));
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }



    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        $row = $this->model->get($ids);
        $username  = $row['username'];
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            $password   =  $params['password'];
            if($params['password'])
            {
                $params['password'] = md5($params['password']);
            }else{
                unset($params['password']);
            }

            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $row->validateFailException(true)->validate($validate);
                    }
                    $result = $row->allowField(true)->save($params);

                    //编辑同步编辑 员工管理员组别
                    //通知员工组管理严注册
                    $admin =   model('Admin');
                    $paramsAdmin['username'] = $params['username'];
                    $paramsAdmin['nickname'] = $params['username'];
                    if($password)
                    {
                        $paramsAdmin['salt'] = Random::alnum();
                        $paramsAdmin['password'] = md5(md5($password) . $paramsAdmin['salt']);
                    }
                    $map['username'] =  $username;

                    $result = db('admin')->where($map)->update($paramsAdmin);
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }



}
