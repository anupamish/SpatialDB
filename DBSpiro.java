//Anupam Mishra - 2053229568 - CSCI585- HW3
public class DBSpiro {
    public static void main(String[] args) {
        double R = 8.0;
        double r = 1.0;
        double a = 4.0;

        double pi = Math.PI;
        int nRev = 16;
        for (double t = 0.0; t < (pi * nRev); t += 0.01) {
            double x = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t);
            double y = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t);
            x = (x/1000);
            y = (y/1000);
            double longi = -118.289171;
            double lat = 34.021945;
            System.out.print(x + longi +"17" + ",");
            System.out.println(y+ lat + "17"+",");
        }
    }
}

