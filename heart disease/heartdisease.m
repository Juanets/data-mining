data=csvread('HeartDisease.csv');

%%% split data into groups
neg = data(data(:,58) == 0, :);
pos = data(data(:,58) > 0, :);
smokers = data(data(:,14) > 0, :);
not_smokers = data(data(:,14) == 0, :);

%%% clean and remove some data
neg((neg(:, 12) > 390), :) = [];
pos((pos(:, 12) > 390), :) = [];

% variables (positive diagnosis)
pos_age = pos(:,3);
pos_sex = pos(:,4);
pos_pain_type = pos(:,9);
pos_bloodpressure = pos(:,10);
pos_cholesterol = pos(:,12);
pos_exercise_pain = pos(:, 38);
pos_thallium = pos(:, 51);

% variables (negative diagnosis)
neg_age = neg(:,3);
neg_sex = neg(:,4);
neg_pain_type = neg(:,9);
neg_bloodpressure = neg(:,10);
neg_cholesterol = neg(:,12);
neg_exercise_pain = neg(:, 38);
neg_thallium = neg(:, 51);

% variables (smokers)
smk_cigs_day = smokers(:, 14);
smk_years = smokers(:, 15);
smk_hta = smokers(:, 11);
not_smk_hta = not_smokers(:, 11);
smk_diag = smokers(:, 58);
not_smk_diag = not_smokers(:, 58);
%%% plots
figure;

%%% age of each group
subplot(3,2,1)

histogram(pos_age);
hold on;
histogram(neg_age);
hold off;

title('Edad de los pacientes')
xlabel('Edad')
ylabel('Personas')

legend('Diag. positivo', 'Diag. negativo', 'location', 'northwest')

%%% sex of each group
subplot(3,2,2)

histogram(pos_sex);
hold on;
histogram(neg_sex);
hold off;

title('Sexo de los pacientes')
xlabel('Sexo')
ylabel('Personas')
xticks([0 1])
xticklabels({'Mujer', 'Hombre'})

legend('Diag. positivo', 'Diag. negativo', 'location', 'northwest')

%%% pain types
subplot(3,2,3)

histogram(pos_pain_type);
hold on;
histogram(neg_pain_type);
hold off;

title('Tipo de dolor')
xlabel('Tipo')
ylabel('Personas')
xticks([1 2 3 4])
xticklabels({'Angina típico', 'Angina atípico', 'No anginal', 'Sin síntomas'})
xtickangle(30)

legend('Diag. positivo', 'Diag. negativo', 'location', 'northwest')

%%% exercise induced angina
subplot(3,2,4)

histogram(pos_exercise_pain);
hold on;
histogram(neg_exercise_pain);
hold off;

title('Dolor inducido por ejercicio')
ylabel('Personas')
xticks([0 1])
xticklabels({'No', 'Sí'})

legend('Diag. positivo', 'Diag. negativo', 'location', 'northeast')

%%% thallium scans
subplot(3,2,5)

histogram(pos_thallium);
hold on;
histogram(neg_thallium);
hold off;

title('Gammagrafía de talio (Thallium scan)')
ylabel('Personas')
xticks([3 6 7])
xticklabels({'Normal', 'Defecto fijo', 'Reversible'})
xlim([2 8])
legend('Diag. positivo', 'Diag. negativo', 'location', 'northeast')

%%% Cholesterol vs. Blood pressure
subplot(3,2,6)

scatter(pos_cholesterol, pos_bloodpressure, 200, 'b.', 'MarkerFaceAlpha',.3,'MarkerEdgeAlpha',.5);
hold on;
scatter(neg_cholesterol, neg_bloodpressure, 200, 'r.', 'MarkerFaceAlpha',.1 ,'MarkerEdgeAlpha', .3);
hold off;

title('Colesterol vs. Presión sanguínea')
xlabel('Colesterol mg/dL')
ylabel('Presión sanguínea mm Hg')

legend('Diag. positivo', 'Diag. negativo', 'location', 'northeast')

%%% smokers
figure;

%%% smokers and not smokers diagnosis
subplot(1,2,1)

histogram(smk_diag);
hold on;
histogram(not_smk_diag);
hold off;

title('Diagnóstico de fumadores vs. no fumadores')
xlabel('Nivel de enfermedad')
ylabel('Personas')
xticks([0 1 2 3 4])
xticklabels({'0', '1', '2', '3', '4'})

legend('Fumadores', 'No fumadores', 'location', 'northeast')

%%% smokers hypertension
subplot(1,2,2)

histogram(smk_hta);
hold on;
histogram(not_smk_hta);
hold off;

title('Hipertensión en fumadores vs. no fumadores')
xlabel('Hipertensión')
ylabel('Personas')
xticks([0 1])
xticklabels({'Sin HTA', 'Con HTA'})

legend('Fumadores', 'No fumadores', 'location', 'northwest')


