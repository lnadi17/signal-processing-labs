function [note, noteFreq] = lab3_noteDetect(xx, fs)
    f0 = 440;
    r = 0.90;
    minPower = inf; % Initialize as arbitrary high number;
    for i = 0:11
        f = f0 * 2^(i/12);
        theta = 2*pi*f/fs;
        b = [1];
        a = poly([r*exp(1j*theta)]);
        y = filter(b, a, xx);
        figure
        pspectrum(y, fs);
        title('Total power', num2str(sum(abs(y))));
        if (sum(abs(y)) < minPower)
            minPower = sum(abs(y));
            note = i;
            noteFreq = f;
        end
    end
end