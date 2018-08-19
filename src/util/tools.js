/**
 * 生成随机数组
 * @param {Array} Arr 
 */
export const randomArray = (Arr) => {
    let result = [];
    for (let i = 0, len = Arr.length; i < len; i++) {
        let randomIndex = Math.floor(Math.random() * Arr.length);
        result[i] = Arr[randomIndex];
        Arr.splice(randomIndex, 1);
    }
    return result;
}