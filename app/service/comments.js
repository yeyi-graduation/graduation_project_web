'use strict';

const Service = require('egg').Service;
const currentEditTable = 'comments_info'; // 当前操作的表名

class CommentsService extends Service {
    constructor(ctx) {
        super(ctx);
    }
    
    /**
     * 评论列表
     */
    async index() {
        const ctx = this.ctx;

        const result = await this.app.handlePagination(currentEditTable);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 添加评论
     */
    async create(params) {
        const result = await this.app.mysql.insert(currentEditTable, {
            method: 'post',
            data:params,
            dataType: 'json',
            contentType: 'json',
            create_time: new Date(),
        });

        this.app.checkSuccess(result);

        return result.data.id;
    }

    /**
     * 修改评论
     */
    async update(params) {
        const result = await this.app.mysql.update(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }

    /**
     * 删除评论
     */
    async delete(params) {
        const result = await this.app.mysql.delete(currentEditTable, params);

        this.app.checkSuccess(result);

        return result;
    }
}

module.exports = CommentsService;