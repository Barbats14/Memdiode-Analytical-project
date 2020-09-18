# Memdiode-Analytical-project

The main file is the Just_IV_trial one. As we already discussed, it is based on the two equation system provided by Enrique in the Analytic Memdiode Model file.

The "fitting" variables are used as constants at this point until we have a properly working script. They were chosen from successful simulations on LTSpice.

In order to run the simulation: 1)  Import the    curve_fit_var.mat    file into the workspace. It containd the experimental data used for comparison.
                                2)  Run    global a Rs Vct Io lamda   in the command prompt to allow for easier debugging.
                                3)  Run    I = Just_IV_trial(ResetV, ResetI);   in the commpand prompt to begin the simulation. (Run either Reset or Set)
                                
Running the simulation will result in the lamda, i.e. state, variable to be stuck at it's initial value, plus the output I to receive erroneous values. Solving I is the first priority.

