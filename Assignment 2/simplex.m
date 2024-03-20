function xb = simplex(A, b, c, Basis)
    % create vBasis
    vBasis = [];
    for n = 1:size(A, 2)
        if ~ismember(n, Basis)
            vBasis(end+1) = n;
        end
    end
    
    % initalize solution vector and iterations
    iter = 0;
    xb = zeros(size(A, 2), 1);
    while iter < 10
        % determine Ab, Av, cb and cv...
        Ab = A(:, Basis);
        Av = A(:, vBasis);

        cb = c(Basis);
        cv = c(vBasis);

        % ... to calculate bbar, y, rv
        bBar = Ab\b;
        y = Ab'\cb;
        
        rv = cv - Av' * y;
        if all(rv >= 0)
            disp("Optimal solution found")
            xb(Basis) = bBar;
            return
        end

        % choose q and calculate a_vqBar
        [~, q] = min(rv);
        vq = vBasis(q);

        a_vq = A(:, vq);
        a_vqBar = Ab\a_vq;
        
        if all(a_vqBar <= 0)
            disp("solution does not exist")
            xb = NaN;
            return
        end

        % choose p and interchange vBasis(q) and Basis(p)
        tmax = inf;
        p = 0;
        for i = 1:length(bBar)
            if a_vqBar(i) > 0
                ttemp = bBar(i) / a_vqBar(i);
                if ttemp < tmax
                    tmax = ttemp;
                    p = i;
                end
            end
        end
        
        vBasis(q) = Basis(p);
        Basis(p) = vq;
        
        iter = iter + 1;
    end
    disp("Maximum amount of iterations exceeded")
    xb = NaN;
end
