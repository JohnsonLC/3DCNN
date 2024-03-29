% ReLU激活函数层
classdef BasicReLU < handle
    properties
        type            % 层类型
        input           % 输入维度
        inputData       % 输入矩阵，用于BP
    end
    methods
        function r = forward(obj, input)
            % 检测输入矩阵和一开始计算的维度是否相等，一个简单的错误检测机制
            if obj.input ~= size(input)
                error('[ERROR] Vector Dimension ERROR! %s\n', obj.type);
            end
            
            obj.inputData = input;
            % ReLU函数
            % ReLU(x)
            % 当x>0时，ReLU(x) = x
            % 当x<=0时，ReLU(x) = 0
            r = input .* (input > 0);
        end
        function r = backward(obj, dj)
            % ReLU函数的反向传播
            % 因为置零的那些值对误差没有贡献，所以仅仅保留那些未置零的
            r = dj .* (obj.inputData > 0);
        end
    end
end