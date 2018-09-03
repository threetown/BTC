export const FormatContractAddress = function (value, $length = 6) {
    if (value && value.length>$length) {
        let subFront = value.substr(0,$length);
        let subEnd = value.substr(-$length)

        return subFront + "..." + subEnd;
    }
}