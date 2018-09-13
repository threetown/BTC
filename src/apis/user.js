import fetch from 'src/util/fetch';

export const ajaxCreateUser = (data) => fetch({ url: '/api/user/create', method: 'post', data })

export const ajaxSaveUser = (data) => fetch({ url: '/api/user/save', method: 'post', data })
