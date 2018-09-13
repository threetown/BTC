import moment from 'moment'

export function FormatContractAddress(value, $length = 8) {
    if (value && value.length>$length) {
        let subFront = value.substr(0,$length);
        let subEnd = value.substr(-$length)

        return subFront + "..." + subEnd;
    }
}

/**
 * 隐藏姓名 手机号 身份证 银行卡 等中间字符信息
 * @param str
 * @returns {*}
 */
export function star (value) {
  let str = value.toString()
  if (str.length > 0 && str.length < 3) {
    return '*' + str.substring(1)
  } else if (str.length > 5 && str.length < 12) {
    return str.substr(0, 3) + '****' + str.substr(-4)
  } else if (str.length > 14) {
    return str.substr(0, 4) + '***********' + str.substr(-4)
  } else {
    return str
  }
}

/* 格式货币 */
const digitsRE = /(\d{3})(?=\d)/g

export function currency (value, currency, decimals) {
  value = parseFloat(value)
  if (!isFinite(value) || (!value && value !== 0)) return ''
  currency = currency != null ? currency : '$'
  decimals = decimals != null ? decimals : 2
  var stringified = Math.abs(value).toFixed(decimals)
  var _int = decimals
    ? stringified.slice(0, -1 - decimals)
    : stringified
  var i = _int.length % 3
  var head = i > 0
    ? (_int.slice(0, i) + (_int.length > 3 ? ',' : ''))
    : ''
  var _float = decimals
    ? stringified.slice(-1 - decimals)
    : ''
  var sign = value < 0 ? '-' : ''
  return sign + currency + head +
    _int.slice(i).replace(digitsRE, '$1,') +
    _float
}

export function host (url) {
  const host = url.replace(/^https?:\/\//, '').replace(/\/.*$/, '')
  const parts = host.split('.').slice(-3)
  if (parts[0] === 'www') parts.shift()
  return parts.join('.')
}

/**
 * 时间格式化
 * @param time
 * @returns {*}
 */
export function timeAgo (time) {
  let times = moment(time).format('x') / 1000
  const between = Date.now() / 1000 - Number(times)
  if (between < 60) {
    return pluralize('', '刚刚')
  } else if (between < 3600) {
    return pluralize(~~(between / 60), '分钟前')
  } else if (between < 86400) {
    return pluralize(~~(between / 3600), '小时前')
  } else {
    return pluralize(~~(between / 86400), '天前')
  }
}

function pluralize (time, label) {
  return time + label
}

/**
 * 格式化时间
 * @param time
 * @param format
 * @returns {*}
 */
export function timeFormat (time, format) {
  if (!time) return ''
  format = format != null ? format : 'YYYY-MM-DD HH:mm:ss'
  return moment(time).format(format)
}





function format_market_cap(val, abbreviate) {
    if (abbreviate) {
        return new AbbreviatedNumber(val).toLocaleString();
    }
    return Formatter.toLocaleString(Math.round(val));
}

function format_supply(val) {
    if (val >= 1) {
        val = Formatter.toLocaleString(Math.round(val));
    } else {
        val = Formatter.toLocaleString(val, {
            minDecimalPlaces: 8,
            maxDecimalPlaces: 8
        });
    }
    return val;
}

function format_fiat(val) {
    if (val >= 100000 || val == 0) {
        val = Formatter.toLocaleString(Math.round(val));
    } else if (val >= 1) {
        val = Formatter.toLocaleString(val, {
            minDecimalPlaces: 2,
            maxDecimalPlaces: 2
        });
    } else if (val < 0.000001) {
        val = Number(val).toExponential(2)
    } else {
        val = Formatter.toLocaleString(val, {
            minDecimalPlaces: 2,
            maxDecimalPlaces: 2
        });
    }
    return val;
}

function format_fiat_short(val) {
    if (val >= 1 || val == 0) {
        if (val >= 100000) {
            val = Formatter.toLocaleString(Math.round(val));
        } else {
            val = Formatter.toLocaleString(val, {
                minDecimalPlaces: 2,
                maxDecimalPlaces: 2
            });
        }
    } else {
        if (val < 0.01) {
            val = Number(val).toExponential();
        } else {
            val = Formatter.toLocaleString(val, {
                minDecimalPlaces: 2,
                maxDecimalPlaces: 2
            });
        }
    }
    return val;
}

function format_crypto_helper(val, expenonentialThreshold, exponentialDigits, minDecimalPlaces, maxDecimalPlaces) {
    if (val >= 1000 || val == 0) {
        val = Formatter.toLocaleString(Math.round(val));
    } else if (val >= 1) {
        val = Formatter.toLocaleString(val, {
            minDecimalPlaces: minDecimalPlaces,
            maxDecimalPlaces: maxDecimalPlaces
        });
    } else {
        if (val < expenonentialThreshold) {
            val = Number(val).toExponential(exponentialDigits)
        } else {
            val = Formatter.toLocaleString(val, {
                minDecimalPlaces: minDecimalPlaces,
                maxDecimalPlaces: maxDecimalPlaces
            });
        }
    }
    return val;
}

function format_crypto(val) {
    return format_crypto_helper(val, 0.00000001, 3, 8, 8)
}

function format_crypto_graph_label(val) {
    return format_crypto_helper(val, 0.00000001, 3, 2, 8)
}

function format_crypto_short(val) {
    return format_crypto_helper(val, 0.01, 1, 2, 2)
}

function format_crypto_volume(val, abbreviate) {
    if (abbreviate) {
        return new AbbreviatedNumber(val).toLocaleString();
    }
    if (val >= 1000) {
        val = Formatter.toLocaleString(Math.round(val));
    } else {
        val = Formatter.toLocaleString(val, {
            minDecimalPlaces: 2,
            maxDecimalPlaces: 2
        });
    }
    return val;
}
var Formatter = (function() {
    var _locale = undefined;
    var supportsLocaleOptions = !!(typeof Intl == 'object' && Intl && typeof Intl.NumberFormat == 'function');
    var _toLocaleString = function(val) {
        if (supportsLocaleOptions) {
            return val.toLocaleString(_locale);
        }
        return val.toLocaleString();
    };
    var _toLocaleStringWithDecimalPlaces = function(val, minDecimalPlaces, maxDecimalPlaces) {
        if (supportsLocaleOptions) {
            return val.toLocaleString(_locale, {
                minimumFractionDigits: minDecimalPlaces,
                maximumFractionDigits: maxDecimalPlaces
            });
        }
        return val.toFixed(maxDecimalPlaces);
    };
    var toLocaleString = function(value, options) {
        var num = Number(value);
        if (isNaN(num)) {
            return value;
        }
        var minDecimalPlaces = options && options.minDecimalPlaces;
        var maxDecimalPlaces = options && options.maxDecimalPlaces;
        if (minDecimalPlaces === undefined || maxDecimalPlaces === undefined) {
            return _toLocaleString(num);
        }
        return _toLocaleStringWithDecimalPlaces(num, minDecimalPlaces, maxDecimalPlaces);
    }
    return {
        toLocaleString: toLocaleString
    };
}
)();

export function convertRates(conversionAmount, tickerData, fromCurrency, toCurrency = '__fiat-cny'){
  if (isNaN(conversionAmount) || conversionAmount == "") {
    conversionAmount = 0;
  }
  conversionAmount = parseFloat(conversionAmount);
  let convertedAmount = '';
  if(tickerData){
    // let tickerData = JSON.parse(localStorage.getItem('tickerData'));
    let fromAmount = tickerData[fromCurrency];
    let toAmount = tickerData[toCurrency];
    convertedAmount = conversionAmount * fromAmount / toAmount;

    if (toCurrency.substring(0,6) == "__fiat") {
      convertedAmount = format_fiat(convertedAmount);
    } else {
      convertedAmount = format_crypto(convertedAmount);
    }
  }
  return convertedAmount;
}