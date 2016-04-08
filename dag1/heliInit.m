% This file contains the initialization for the helicopter assignment in
% the course TTK4135. Only use this file for the helicopter 1. On It's
% Learning you can find the initialization files for the other helicopters.
% Run this file before you execute QuaRC_ -> Build to build the file
% helikopter.mdl.

% Updated spring 2014, Mansoureh Jesmani

clear all;
clc;
%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
KalibVandring = .0879/2;
KalibPitch = .0879;
KalibElevasjon = -.1089;%-.0879;
EncoderInputVandring = 0;
EncoderInputPitch = 1;
EncoderInputElevasjon = 2;
joystick_gain_x = 1;
joystick_gain_y = 1;

%%%%%%%%%%% Physical constants
%%wights
m_w = 1.920;%1.925;                        % Mass of the counterweight
m_h = 1.325;%1.451;                         % Mass of helicopter
m_g = 0.044;%0.040;                        % Effective mass of the helicopter
%%Distances
l_a = 0.660;%0.670;                         % Distance from elevation axis to helicopter body
l_h = 0.178;%0.180;                        % Distance from pitch axis to motor
%%Moments
J_e = 2 * m_h * l_a *l_a;           % Moment of interia for elevation
J_p = 2 * ( m_h/2 * l_h * l_h);     % Moment of interia for pitch
J_t = 2 * m_h * l_a *l_a;           % Moment of interia for travel
%Voltage
V_f_eq=.5;.60;%.574;                         % Voltage motor in front, Change the value so that it matches the current helicopter
V_b_eq=.515;.64;%.609;                          % 0.85;%1.2; Voltage motor in back, Change the value so that it matches the current helicopter
V_s_eq=V_f_eq+V_b_eq;               % Voltage sum, The minimum voltage to keep the helicopter in equilibrium
%Force
K_p = m_g*9.81;                     % Force to lift the helicopter from the ground
K_f = K_p/V_s_eq;                   % Force constant motor
%%%%%%%%%%% Controller
K_ep = 10;
K_ed = 8;
K_ei = 4.5;
K_1 = l_h*K_f/J_p;
K_2 = K_p*l_a/J_t;
K_3 = K_f*l_a/J_e;
K_4 = K_p*l_a/J_e;
w_c  = 5.02;
K_pd = w_c/K_1;
K_pp = (sqrt(2)*w_c^2)/K_1;