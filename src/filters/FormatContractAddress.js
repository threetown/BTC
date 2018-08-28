export const FormatContractAddress = function (value) {
    if (value && value.length>6) {
        let subFront = value.substr(0,6);
        let subEnd = value.substr(-6)

        return subFront + "..." + subEnd;
    }
}