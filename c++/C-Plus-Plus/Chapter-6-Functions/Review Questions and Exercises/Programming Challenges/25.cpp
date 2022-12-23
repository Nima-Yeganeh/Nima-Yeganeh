/************************************************************
 *
 *   Group Project
 * 
 *      25. Travel Expenses
 * 
 *          This program should be designed and written by a 
 *      team of students. Here are some suggestions:
 * 
 *      • One student should design function main, which will 
 *        call the other functions in the pro- gram. The 
 *        remainder of the functions will be designed by other 
 *        members of the team.
 *      
 *      • The requirements of the program should be analyzed 
 *        so each student is given about the same workload.
 * 
 *      • The parameters and return types of each function 
 *        should be decided in advance.
 * 
 *      • Stubs and drivers should be used to test and debug 
 *        the program.
 *  
 *      • The program can be implemented as a multifile 
 *        program, or all the functions can be cut and 
 *        pasted into the main file.
 * 
 *          Here is the assignment: Write a program that 
 *      calculates and displays the total travel expenses of 
 *      a businessperson on a trip. The program should have 
 *      functions that ask for and return the following:
 * 
 *      • The total number of days spent on the trip
 *      • The time of departure on the first day of the 
 *        trip, and the time of arrival back home on the 
 *        last day of the trip
 *      • The amount of any round-trip airfare
 *      • The amount of any car rentals
 *      • Miles driven, if a private vehicle was used. 
 *        Calculate the vehicle expense as $0.27 per mile 
 *        driven
 *      • Parking fees (The company allows up to $6 per day. 
 *        Anything in excess of this must be paid by the 
 *        employee.)
 *      • Taxi fees, if a taxi was used anytime during the 
 *        trip (The company allows up to $10 per day, for 
 *        each day a taxi was used. Anything in excess of 
 *        this must be paid by the employee.)
 *      • Conference or seminar registration fees
 *      • Hotel expenses (The company allows up to $90 per 
 *        night for lodging. Anything in excess of this must 
 *        be paid by the employee.)
 *      • The amount of each meal eaten. On the first day of 
 *        the trip, breakfast is allowed as an expense if the 
 *        time of departure is before 7 a.m. Lunch is allowed 
 *        if the time of departure is before 12 noon. Dinner 
 *        is allowed on the first day if the time of departure 
 *        is before 6 p.m. On the last day of the trip, breakfast 
 *        is allowed if the time of arrival is after 8 a.m. 
 *        Lunch is allowed if the time of arrival is after 1 p.m. 
 *        Dinner is allowed on the last day if the time of 
 *        arrival is after 7 p.m. The program should only ask 
 *        for the amounts of allowable meals. (The company 
 *        allows up to $9 for breakfast, $12 for lunch, and 
 *        $16 for dinner. Anything in excess of this must be 
 *        paid by the employee.)
 * 
 *          The program should calculate and display the total 
 *      expenses incurred by the businessperson, the total 
 *      allowable expenses for the trip, the excess that must 
 *      be reimbursed by the businessperson, if any, and the 
 *      amount saved by the businessperson if the expenses were 
 *      under the total allowed.
 * 
 *      Input Validation: Do not accept negative numbers for 
 *                        any dollar amount or for miles driven 
 *                        in a private vehicle. Do not accept 
 *                        numbers less than 1 for the number of 
 *                        days. Only accept valid times for the 
 *                        time of departure and the time of 
 *                        arrival.
 *
 * 	Jesus Hilario Hernandez
 * 	December 29, 2018 --> "Merry Christmas!"
 *
 *************************************************************/
#include <iostream>
#include <ctype.h>  // isdigit() and isalpha()
#include <sstream>  // stringstream
#include <iomanip>  // setfill()
using namespace std;

// Function Prototypes
int daysSpent();
int departureTime();
int arrivalTime();
double roundTripAirfare();
double carRentalAmount();
int carMilage();

double vehicleExpenses(double);
double parkingFees(double &);
double taxiFees(double &);
double conferenceFees();
double hotelExpenses(double &);

double mealAmount(int, int, double &);
void calculateAndDisplay();
double inputValidate(double);
int inputValidate(int);
int validateTime();
char validateChoice();

void pressEnterToContinue();
void display(string, int);
void display(string, double);

int main()
{
    // Variables
    int days_spent,
        departure_time,
        arrival_time;
    
    double round_trip_airfare,
           car_rental_amount,
           car_milage,
           vehicle_expense,
           parking_fees,
           amount_paid_by_employee,     // Reference
           taxi_fees,
           conference_fees,
           hotel_expenses,
           meal_amount,
           total_expenses,
           total_allowable_expenses = 0,    // Reference
           total_savings,
           potential_savings;


     // Function Calls
    days_spent = daysSpent();
    display("days_spent", days_spent);

    departure_time = departureTime();
    display("departure_time", departure_time);
    
    arrival_time = arrivalTime();
    display("arrival_time", arrival_time);
    
    round_trip_airfare = roundTripAirfare();
    display("round_trip_airfare", round_trip_airfare);

    car_rental_amount = carRentalAmount();
    display("car_rental_amount", car_rental_amount);
    
    car_milage = carMilage();
    display("car_milage", car_milage);

    vehicle_expense = vehicleExpenses(car_milage);
    display("vehicle_expenses", vehicle_expense);
    
    parking_fees = parkingFees(total_allowable_expenses);
    display("total_allowable_expenses", total_allowable_expenses);
    display("parking_fees", parking_fees);
    
    taxi_fees = taxiFees(total_allowable_expenses);
    display("total_allowable_expenses", total_allowable_expenses);
    display("taxi_fees", taxi_fees);
    
    conference_fees = conferenceFees();
    display("conference_fees", conference_fees);
    
    hotel_expenses = hotelExpenses(total_allowable_expenses);
    display("total_allowable_expenses", total_allowable_expenses);
    display("hotel_expenses", hotel_expenses);

    meal_amount = mealAmount(departure_time, arrival_time, total_allowable_expenses);
    display("total_allowable_expenses", total_allowable_expenses);
    display("meal_amount", meal_amount);


    /********************************************************
     * function definition for calculateAndDisplay():       *
     * ---------------------------------------------------- *
     * calculateAndDisplay calculates and displays the      *
     * total expenses incurred by the businessperson, the   *
     * total allowable expenses for the trip, the excess    *
     * that must be reimbursed by the businessperson, if    *
     * any, and the amount saved by the businessperson if   *
     * the expenses were under the total allowed.           *
     ********************************************************/
    total_expenses = car_rental_amount  +
                     vehicle_expense    +
                     parking_fees       +
                     taxi_fees          +
                     conference_fees    +
                     hotel_expenses     +
                     meal_amount;

    amount_paid_by_employee = total_expenses - total_allowable_expenses;
    total_savings = total_expenses - amount_paid_by_employee;
    potential_savings = amount_paid_by_employee - total_allowable_expenses;

    cout << setprecision(2) << fixed;
    cout << "\n---------------------------------------------"               << endl
         << "Total expenses               = $" << total_expenses            << endl
         << "Total Allowable expenses     = $" << total_allowable_expenses  << endl
         << "Total reimbursement expenses = $" << amount_paid_by_employee   << endl
         << "Total potential savings      = $" << potential_savings         << endl 
         << "---------------------------------------------"                 << endl;

    // calculateAndDisplay();

    return 0;
}

/********************************************************
 * function definition for daysSpent():                 *
 * ---------------------------------------------------- *
 * daysSpent ask for, recives, and returns the number   *
 * of days spent on the trip. Input is validated by     *
 * checking for and integer that is 1 or greater.       *
 ********************************************************/
int daysSpent()
{
    int days_spent;
    cout << "Enter total days spent on trip: ";
    days_spent = inputValidate(1);

    cout << "You've entered: "
             << days_spent
             << " days." 
             << endl;

    return days_spent;
}

/********************************************************
 * function definition for departureTime():             *
 * ---------------------------------------------------- *
 * departureTime ask for, recives, and returns the      *
 * depature time for the first day of the trip. Input   *
 * is validated by checking for valid clock times.      *
 ********************************************************/
int departureTime()
{
    int departure_time;

    cout << "\nNext, Let's start with the time of departure on 1st day.\n\n";

    departure_time = validateTime();
    return departure_time;
}

/********************************************************
 * function definition for arrivalTime():               *
 * ---------------------------------------------------- *
 * arrivalTime ask for, recives, and returns the        *
 * arrival time for the first day of the trip. Input    *
 * is validated by checking for valid clock times.      *
 ********************************************************/
int arrivalTime()
{
    int arrival_time;

    cout << "\nNext, what was the time of arrival on last day?\n\n";

    arrival_time = validateTime();
    return arrival_time;
}

/********************************************************
 * function definition for roundTripAirfare():          *
 * ---------------------------------------------------- *
 * roundTripAirfare ask for, receives, validates, and   *
 * returns the round trip airfare if any.               *
 ********************************************************/
double roundTripAirfare()
{
    double round_trip_airfare;
    char user_choice;

    cout << "Did you pay for round trip air fair? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "Enter amount of round-trip airfare: ";
        round_trip_airfare = inputValidate(0);

        return round_trip_airfare;
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        round_trip_airfare = 0;
        return round_trip_airfare;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        round_trip_airfare = 0;
        return round_trip_airfare;
    }
    
}

/********************************************************
 * function definition for carRentalAmount():           *
 * ---------------------------------------------------- *
 * carRentalAmount ask for, receives, validates, and    *
 * returns the car rental amount if any.                *
 ********************************************************/
double carRentalAmount()
{
    double car_rental_amount;
    char user_choice;

    cout << "Did you rent a car? (y/n): ";
    user_choice = validateChoice();
    
    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "Enter amount of car rental: ";
        car_rental_amount = inputValidate(0);
        return car_rental_amount;
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        car_rental_amount = 0;
        return car_rental_amount;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        car_rental_amount = 0;
        return car_rental_amount;
    }
    
}

/********************************************************
 * function definition for carMilage():                 *
 * ---------------------------------------------------- *
 * carMilage ask for, receives, validates, and          *
 * returns the car milage amount if any.                *
 ********************************************************/
int carMilage()
{
    int car_milage;
    char user_choice;

    cout << "Did you use a personal vehicle? (y/n): ";
    user_choice = validateChoice();
    
    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "Enter miles driven in private vehicle: ";
        car_milage = inputValidate(0);
        return car_milage;
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        car_milage = 0;
        return car_milage;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        car_milage = 0;
        return car_milage;
    }
}

/********************************************************
 * function definition for vehicleExpenses():           *
 * ---------------------------------------------------- *
 * vehicleExpenses calculate vehicle expenses by        *
 * multiplying car_milage by .27.                       *
 ********************************************************/
double vehicleExpenses(double car_milage)
{
    return car_milage * .27;
}

/********************************************************
 * function definition for parkingFees():               *
 * ---------------------------------------------------- *
 * parkingFees ask for, receives, validates, and        *
 * returns, if any, parking fees.                       *
 ********************************************************/
double parkingFees(double &total_allowable_expenses)
{
    const double ALLOWED_AMOUNT = 6.00;
    char user_choice;
    int parking_days;
    double parking_fees = 0,
           fee = 0;

    cout << "Any parking fees? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "How many days did you pay for parking? ";
        parking_days = inputValidate(0);

        for (int i = 0; i < parking_days; i++)
        {
            cout << "Enter fee amount for day "
                 << (i + 1) << ": ";
            fee = inputValidate(0);

            if (fee > ALLOWED_AMOUNT)
                total_allowable_expenses += ALLOWED_AMOUNT;
                
            parking_fees += fee;
        }

        return parking_fees;

    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        parking_fees = 0;
        return parking_fees;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        parking_fees = 0;
        return parking_fees;
    }
    
}

/********************************************************
 * function definition for taxiFees():                  *
 * ---------------------------------------------------- *
 * taxiFees ask for, receives, validates, and           *
 * returns, if any, taxi fees.                          *
 ********************************************************/
double taxiFees(double &total_allowable_expenses)
{
    const double TAXI_LIMIT = 10.00;

    char user_choice;
    int taxi_days;
    double taxi_fees = 0,
           fee = 0;

    cout << "Any taxi fees? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "How many days did you pay for a taxi? ";
        cin >> taxi_days;

        for (int i = 0; i < taxi_days; i++)
        {
            cout << "Enter taxi fee amount for day "
                 << (i + 1) << ": ";
            fee = inputValidate(0);

            if (fee > TAXI_LIMIT)
                total_allowable_expenses += TAXI_LIMIT;

            taxi_fees += fee;
        }

        return taxi_fees;
        
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        taxi_fees = 0;
        return taxi_fees;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        taxi_fees = 0;
        return taxi_fees;
    }
}

/********************************************************
 * function definition for conferenceFees():            *
 * ---------------------------------------------------- *
 * conferenceFees ask for, receives, validates, and     *
 * returns, if any, conference fees.                    *
 ********************************************************/
double conferenceFees()
{
    char user_choice;
    double conference_fees;

    cout << "Any conference or seminar registration fees? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "Enter Conference or seminar registration fees: ";
        conference_fees = inputValidate(0);
        return conference_fees;
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        conference_fees = 0;
        return conference_fees;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        conference_fees = 0;
        return conference_fees;
    }
}

/********************************************************
 * function definition for hotelExpenses():             *
 * ---------------------------------------------------- *
 * hotelExpenses ask for, receives, validates, and      *
 * returns, if any, hotel expenses.                     *
 ********************************************************/
double hotelExpenses(double &total_allowable_expenses)
{
    const double HOTEL_LIMIT = 90.00;

    char user_choice;
    int hotel_nights;
    double fee,
           hotel_expenses;           

    cout << "Any hotel expenses? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        cout << "How many nights did you pay for a hotel? ";
        hotel_nights = inputValidate(1);

        for (int i = 0; i < hotel_nights; i++)
        {
            cout << "Enter hotel expense amount for night "
                 << (i + 1) << ": ";
            fee = inputValidate(0);

            if (fee > HOTEL_LIMIT)
                total_allowable_expenses += HOTEL_LIMIT;

            hotel_expenses += fee;
    
        }

        return hotel_expenses;

    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        hotel_expenses = 0;
        return hotel_expenses;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        hotel_expenses = 0;
        return hotel_expenses;
    }

}

/********************************************************
 * function definition for mealAmount():                *
 * ---------------------------------------------------- *
 * mealAmount ask for, receives, validates, and         *
 * returns, if any, the meal amount.                    *
 ********************************************************/
double mealAmount(int departure_time, 
                int arrival_time,
                double &total_allowable_expenses)
{
    const double BREAKFAST_LIMIT = 9.00,
                 LUNCH_LIMIT     = 12.00,
                 DINNER_LIMIT    = 16.00;

    char user_choice;

    double fee,
           meal_amount;

    // FOR DEPATURE!!
    // FOR DEPATURE!!
    // FOR DEPATURE!!
    cout << "Upon depature of your first day, did you have a meal? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        if(departure_time < 700)   // Breakfast
        {
            cout << "Since your departure time was "
                 << departure_time << ", \n" 
                 << "What was amount for breakfast? ";
            fee = inputValidate(0);

            if (fee > BREAKFAST_LIMIT)
                total_allowable_expenses += BREAKFAST_LIMIT;
            
            meal_amount += fee;
        }
        else if(departure_time > 700 && departure_time < 1200)   // Lunch
        {
            cout << "Since your departure time was "
                 << departure_time << ", \n" 
                 << "What was amount for lunch? ";
            fee = inputValidate(0);

            if (fee > LUNCH_LIMIT)
                total_allowable_expenses += LUNCH_LIMIT;
            
            meal_amount += fee;
        }
        else if(departure_time > 1200 && departure_time < 1800)  // Dinner
        {
            cout << "Since your departure time was "
                 << departure_time << ", \n" 
                 << "What was amount for dinner? ";
            fee = inputValidate(0);

            if (fee > DINNER_LIMIT)
                total_allowable_expenses += DINNER_LIMIT;
            
            meal_amount += fee;
        }
        else    // If not within time restrains of Breakfast, Lunch, or Dinner.
        {
            cout << "Since your departure time was "
                 << departure_time << ", \n" 
                 << "What was amount for your meal? ";
            fee = inputValidate(0);

            meal_amount += fee;

        }

    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        meal_amount = 0;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        meal_amount = 0;
    }

    // FOR ARRIVAL
    // FOR ARRIVAL
    // FOR ARRIVAL
    cout << "Upon arrival on your last day, did you have a meal? (y/n): ";
    user_choice = validateChoice();

    if (user_choice == 'Y' || user_choice == 'y')
    {
        if(arrival_time > 800 && arrival_time < 1300)   // Breakfast
        {
            cout << "Since your arrival time was "
                 << arrival_time << ", \n" 
                 << "What was amount for breakfast? ";
            fee = inputValidate(0);

            if (fee > BREAKFAST_LIMIT)
                total_allowable_expenses += BREAKFAST_LIMIT;
            
            meal_amount += fee;
        }
        else if(arrival_time > 1300 && arrival_time < 1900)   // Lunch
        {
            cout << "Since your arrival time was "
                 << arrival_time << ", \n" 
                 << "What was amount for lunch? ";
            fee = inputValidate(0);

            if (fee > LUNCH_LIMIT)
                total_allowable_expenses += LUNCH_LIMIT;
            
            meal_amount += fee;
        }
        else if(arrival_time > 1900)  // Dinner
        {
            cout << "Since your arrival time was "
                 << arrival_time << ", \n" 
                 << "What was amount for dinner? ";
            fee = inputValidate(0);

            if (fee > DINNER_LIMIT)
                total_allowable_expenses += DINNER_LIMIT;
            
            meal_amount += fee;
        }
        else    // If not within time restrains of Breakfast, Lunch, or Dinner.
        {
            cout << "Since your arrival time was "
                 << arrival_time << ", \n" 
                 << "What was amount for your meal? ";
            fee = inputValidate(0);

            meal_amount += fee;
        }

        return meal_amount;
    }
    else if (user_choice == 'N' || user_choice == 'n')
    {
        meal_amount = 0;
        return meal_amount;
    }
    else
    {
        // cout << "Error: Y or N must be chosen to proceed: ";
        meal_amount = 0;
        return meal_amount;
    }
}

/********************************************************
 * function definition for calculateAndDisplay():       *
 * ---------------------------------------------------- *
 * calculateAndDisplay calculates and displays the      *
 * total expenses incurred by the businessperson, the   *
 * total allowable expenses for the trip, the excess    *
 * that must be reimbursed by the businessperson, if    *
 * any, and the amount saved by the businessperson if   *
 * the expenses were under the total allowed.           *
 ********************************************************/
// void calculateAndDisplay()
// {
//     double total_expenses,
//            total_allowable_expenses,
//            total_reimbursement,
//            amount_saved;

//     cout << "Total expenses incurred by businessperson: $"
//          << total_expenses;
    
//     cout << "Total allowable expenses for the trip : $"
//          << total_allowable_expenses;

//     cout << "Excess to be reimbursed to businessperson: $"
//          << total_reimbursement;

//     cout << "Amount saved if expenses under total allowed: $"
//          << amount_saved;

// }

/********************************************************
 * function definition for inputValidate():             *
 * ---------------------------------------------------- *
 * inputValidate validates a double. The argument       *
 * passed declares condition.                           *
 ********************************************************/
double inputValidate(double CONDITION)
{
    string str_num = "";
    
    int is_num = 0, 
        decimal_count = 0;
        
    double user_num;

    bool is_num_bool = 0;

    do
    {
        cout << "\nEnter number: ";
        cin >> str_num;

        if (str_num[0] == '-')
            is_num++;

        if (str_num[0] == '0' && isdigit(str_num[1]))
        {
            is_num = 0;
        }
        else
        {
            for (int i = 0; i < str_num.size(); i++)
            {
                if (isdigit(str_num[i]))
                    is_num++;

                if (str_num[i] == '.')
                {
                    decimal_count++;
                }
            }
        }

        if (decimal_count == 1)
            is_num++;

        stringstream str_stream_object(str_num);
        str_stream_object >> user_num;

        if (is_num == str_num.size() && !(user_num < CONDITION))
        {
            
            is_num_bool = 1;
            // cout << str_num << "(str_num) is a number!" << endl;
            // cout << user_num << "(user_num) is a number!" << endl;
                
        }
        else
        {
            cout << "Invalid number. Must be a decimal integer and greater than " 
                 << CONDITION << ": ";

            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            
            is_num_bool = 0;
            is_num = 0;
            decimal_count = 0;
        }

    } while (is_num_bool == 0);

    return user_num;
}

/********************************************************
 * function definition for inputValidate():             *
 * ---------------------------------------------------- *
 * inputValidate validates an integer. The argument     *
 * passed declares condition.                           *
 ********************************************************/
int inputValidate(int CONDITION)
{
    string str_num = "";
    
    int is_num = 0, 
        decimal_count = 0;
        
    double user_num;

    bool is_num_bool = 0;

    do
    {
        cout << "\nEnter number: ";
        cin >> str_num;

        if (str_num[0] == '-')
            is_num++;

        if (str_num[0] == '0' && isdigit(str_num[1]))
        {
            is_num = 0;
        }
        else
        {
            for (int i = 0; i < str_num.size(); i++)
            {
                if (isdigit(str_num[i]))
                    is_num++;

                if (str_num[i] == '.')
                {
                    decimal_count++;
                }
            }
        }

        if (decimal_count == 1)
        {
            // if contains a decimal
            is_num = 0;
        }
            

        stringstream str_stream_object(str_num);
        str_stream_object >> user_num;

        if (is_num == str_num.size() && !(user_num < CONDITION))
        {
            
            is_num_bool = 1;
            // cout << str_num << "(str_num) is a number!" << endl;
            // cout << user_num << "(user_num) is a number!" << endl;
                
        }
        else
        {
            cout << "Invalid number. Must be an integer and greater than " 
                 << CONDITION << ": ";

            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            
            is_num_bool = 0;
            is_num = 0;
            decimal_count = 0;
        }

    } while (is_num_bool == 0);

    return user_num;
}

/********************************************************
 * function definition for validateTime():              *
 * ---------------------------------------------------- *
 * validateTime validates clock time that the user      *
 * enters into the console.                             *
 ********************************************************/
int validateTime()
{
    string hour,
           minutes,
           time_of_day,
           user_time_string;

    int is_num = 0,
        int_hour,
        int_minutes,
        user_time;

    bool is_num_bool = 0,
         time_of_day_valid = 0;
    
    char correct_time;

    do
    {
        
        do 
        {
            cout << "\nDid you leave in the morning or the afternoon? \n"
                 << "Enter AM for morning or PM for afternoon: ";

            cin >> time_of_day;

            if (time_of_day == "am" ||
                time_of_day == "AM" ||
                time_of_day == "aM" ||
                time_of_day == "Am")
            {
                time_of_day_valid = 1;
                time_of_day = "AM";
            }
            else if (time_of_day == "pm" ||
                    time_of_day == "PM" ||
                    time_of_day == "pM" ||
                    time_of_day == "Pm")
            {
                time_of_day_valid = 1;
                time_of_day = "PM";
            }
            else
            {
                time_of_day_valid = 0;
                cout << "\nError. You must enter AM for morning or PM for afternoon.\n";
            }
            
        } while(time_of_day_valid == 0);

        

        cout << "\nYou've entered: "
             << time_of_day 
             << endl 
             << endl;

        cout << "Ok, in this next portion you will need to input\n"
             << "the time in sections. \n\nThe first will be the hour\n"
             << "that you departed and the second will be the minutes.\n"
             << "For instance, if you departed at 9:50, the hour will be\n"
             << "9 while the minutes will be 50.\n"
             << "In another example, if you departed at 8:45, then the\n"
             << "hour will be 8 and the minutes will be 45.\n\n";

        // pressEnterToContinue();

        do
        {
            cout << "Now, enter the hour: ";
            cin >> hour;

            for (int i = 0; i < hour.size(); i++)
            {
                if (isdigit(hour[i]))
                    is_num++;
            }

            stringstream str_stream_object(hour);
            str_stream_object >> int_hour;

            if (is_num == hour.size() && (int_hour >= 0 && int_hour <= 12))
            {
                is_num_bool = 1;
                // cout << hour << "(hour) is a number!" << endl;
                // cout << int_hour << "(int_hour) is a number!" << endl;
                if (time_of_day == "PM")
                {
                    switch (int_hour)
                    {
                        case 1:
                            hour = "13";
                            break;
                        case 2:
                            hour = "14";
                            break;
                        case 3:
                            hour = "15";
                            break;
                        case 4:
                            hour = "16";
                            break;
                        case 5:
                            hour = "17";
                            break;
                        case 6:
                            hour = "18";
                            break;
                        case 7:
                            hour = "19";
                            break;
                        case 8:
                            hour = "20";
                            break;
                        case 9:
                            hour = "21";
                            break;
                        case 10:
                            hour = "22";
                            break;
                        case 11:
                            hour = "23";
                            break;
                        
                    }
                }
                else if (time_of_day == "AM")
                {
                    if (int_hour == 12)
                        hour = "0";

                }
            }
            else
            {
                cout << "Must be a number and between 0 and 12. ";

                cin.clear();
                cin.ignore(numeric_limits<streamsize>::max(), '\n');
                
                is_num_bool = 0;
                is_num = 0;
            }

        } while (is_num_bool == 0);


        is_num_bool = 0;
        is_num = 0;

        cout << "You've entered: "
             << int_hour <<  endl;

        do
        {
            cout << "Next, enter the minutes: ";
            cin >> minutes;

            for (int i = 0; i < minutes.size(); i++)
            {
                if (isdigit(minutes[i]))
                    is_num++;
            }

            stringstream str_stream_object(minutes);
            str_stream_object >> int_minutes;

            if (is_num == minutes.size() && (int_minutes >= 0 && int_minutes <= 59))
            {
                is_num_bool = 1;
                // cout << minutes << "(minutes) is a number!" << endl;
                // cout << int_minutes << "(int_minutes) is a number!" << endl;
                if (time_of_day == "PM")
                {
                    switch (int_hour)
                    {
                        case 1:
                            hour = "13";
                            break;
                        case 2:
                            hour = "14";
                            break;
                        case 3:
                            hour = "15";
                            break;
                        case 4:
                            hour = "16";
                            break;
                        case 5:
                            hour = "17";
                            break;
                        case 6:
                            hour = "18";
                            break;
                        case 7:
                            hour = "19";
                            break;
                        case 8:
                            hour = "20";
                            break;
                        case 9:
                            hour = "21";
                            break;
                        case 10:
                            hour = "22";
                            break;
                        case 11:
                            hour = "23";
                            break;
                        
                    }
                }
                else if (time_of_day == "AM")
                {
                    if (int_hour == 12)
                        hour = "0";

                }
            }
            else
            {
                cout << "Must be a number and between 0 and 12. ";

                cin.clear();
                cin.ignore(numeric_limits<streamsize>::max(), '\n');
                
                is_num_bool = 0;
                is_num = 0;
            }

        } while (is_num_bool == 0);

        cout.fill('0');
        cout << "Time = "
            << int_hour
            << ":"
            << setw(2) << right << minutes
            << " " << time_of_day
            << endl;


        cout << "Is this time correct? (Y/N): "; 
        correct_time = validateChoice();

        if (correct_time == 'N' || correct_time == 'n')
        {
            cout << "You've chosen no ['N'].\n"
                 << "Let's try again.\n";
        }


    } while (correct_time == 'n' || correct_time == 'N');

    if (int_minutes >= 0 && int_minutes < 10)
    {
        user_time_string = hour + "0" + minutes;
        stringstream str_stream_object(user_time_string);
        str_stream_object >> user_time;
    }
    else 
    {
        user_time_string = hour + minutes;
        stringstream str_stream_object(user_time_string);
        str_stream_object >> user_time;
    }

    return user_time;
}

/********************************************************
 * function definition for validateChoice():            *
 * ---------------------------------------------------- *
 * validateChoice ask for, recives, validates and       *
 * returns the user choice, whether Y.                  *
 ********************************************************/
char validateChoice()
{
    char user_choice,
         user_choice_valid;

        cin >> user_choice;

        while (!((user_choice == 'y') || 
                 (user_choice == 'Y') || 
                 (user_choice == 'n') || 
                 (user_choice == 'N')))
        {
            cout << "ERROR: a Y or an N must be entered: ";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            cin >> user_choice;
        }

        if (user_choice == 'y' || user_choice == 'Y')
            user_choice_valid = 1;
        else if (user_choice == 'n' || user_choice == 'N')
            user_choice_valid = 1;

    return user_choice;

}

/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Stubs and Driver
 */ 
void pressEnterToContinue() 
{
    cout << "\n\nPress [Enter] to continue:\n";
    cin.clear();
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
    cin.get();
}
void display(string description, int variable) 
{
    cout << endl
         << description << " = " 
         << variable
         << endl;
}
void display(string description, double variable) 
{
    cout << endl
         << description << " = " 
         << variable
         << endl;
}