function A=complexadjoint(Aquat)
%%%% Computes the the complex adjoint of a quaternion matrix Aquat
    % Input
        % Aquat - quaternionic matrix
    % Output
        % A - complex matrix, complex adjoint accdg to spinor vector

A1=s(Aquat)+z(Aquat)*1i;
A2=x(Aquat)+y(Aquat)*1i;
A=[A1 A2; -conj(A2) conj(A1)];
end