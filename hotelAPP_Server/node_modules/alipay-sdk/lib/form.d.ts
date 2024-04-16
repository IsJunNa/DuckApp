export interface IFile {
    name: string;
    path: string;
    fieldName: string;
}
export interface IField {
    name: string;
    value: string | object;
}
declare class AliPayForm {
    private method;
    files: IFile[];
    fields: IField[];
    constructor();
    getFields(): IField[];
    getFiles(): IFile[];
    getMethod(): "get" | "post";
    /**
     * 设置 method
     * post、get 的区别在于 post 会返回 form 表单，get 返回 url
     */
    setMethod(method: 'get' | 'post'): void;
    /**
     * 增加字段
     * @param fieldName 字段名
     * @param fieldValue 字段值
     */
    addField(fieldName: string, fieldValue: any | object): void;
    /**
     * 增加文件
     * @param fieldName 文件字段名
     * @param fileName 文件名
     * @param filePath 文件绝对路径
     */
    addFile(fieldName: string, fileName: string, filePath: string): void;
}
export default AliPayForm;
