/**
 * @author tudou527
*/
import { AlipaySdkConfig } from './alipay';
declare const ALIPAY_ALGORITHM_MAPPING: {
    RSA: string;
    RSA2: string;
};
declare function aesDecrypt(data: any, aesKey: any): any;
/**
 * 签名
 * @description https://opendocs.alipay.com/common/02kf5q
 * @param {string} method 调用接口方法名，比如 alipay.ebpp.bill.add
 * @param {object} params 请求参数
 * @param {object} config sdk 配置
 */
declare function sign(method: string, params: any, config: AlipaySdkConfig): any;
export { sign, ALIPAY_ALGORITHM_MAPPING, aesDecrypt, };
