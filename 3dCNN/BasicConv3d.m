classdef BasicConv3d
    properties
        type                % 类型
        input               % 输入维度  (f, h, w)
        output              % 输出维度  (f, h, w)
        filter              % 卷积核    (fm, fn, fh, fw)
        strides             % 步长
    end
    methods
        % 3dCNN的前馈算法
        function r = forward(obj, input)
            % 检测输入矩阵和一开始计算的维度是否相等，一个简单的错误检测机制
            if obj.input ~= size(input)
                error('[ERROR] Matrix Dimension ERROR! %s\n', obj.type);
            end
            
            % 进行卷积
            r = conv3(input, obj.filter, obj.strides, 'valid');
        end
        function r = backward(obj, dj)
            % 暂时未实现
        end
    end
end