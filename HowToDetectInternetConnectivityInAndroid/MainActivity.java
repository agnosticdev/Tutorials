package com.agnosticdev.networkconnectivity;


import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

// Interface Declaration
interface MainActivityDataTaskNotification {
    void notifyMainActivity(String connStatus, String connInstruction);
}


public class MainActivity extends AppCompatActivity {

    // Activity declaration of textviews
    TextView connectivityStatus;
    TextView connectivityInstruction;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Assignment of the Textviews from the user interface. (See activity_main.xml)
        connectivityStatus =  findViewById(R.id.connectionStatus);
        connectivityInstruction =  findViewById(R.id.requestContainerInstruction);
    }


    /**
     * Callback method for the onClick of the @+id/requestData button in activity_main.xml
     *
     * @param view : the view from the activity, in this case the button.
     *
     */
    public void requestDataCallback(View view) {

        try {
            String connectionInstruction = "";
            String connectionStatus = "";
            if (isNetworkReachable()) {
                DataTask dataTask = new DataTask(mainActivityDataTaskNotification);

                connectionInstruction = dataTask.execute("https://httpbin.org/get?arg1=1&arg2=2").get();
                connectionStatus = "Connection Status: Online";
            } else {
                connectionInstruction = "Please check your internet connection and try your request again.";
                connectionStatus = "Connection Status: Offline";
            }

            mainActivityDataTaskNotification.notifyMainActivity(connectionStatus, connectionInstruction);
        } catch (Exception e) {
            String connectionInstruction = e.getMessage();
            String connectionStatus = "";
            mainActivityDataTaskNotification.notifyMainActivity(connectionStatus, connectionInstruction);
        }
    }

    /**
     * ConnectivityManager : Class that answers queries about the state of network connectivity.
     * It also notifies applications when network connectivity changes.
     * @url  https://developer.android.com/reference/android/net/ConnectivityManager
     */
    private boolean isNetworkReachable() {
        ConnectivityManager manager =
                (ConnectivityManager) getSystemService(this.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = manager.getActiveNetworkInfo();
        if (networkInfo != null && networkInfo.isConnected()) {
            return true;
        }
        return false;
    }

    /**
     * MainActivityDataTaskNotification (Closure) : Interface Method.
     */
    MainActivityDataTaskNotification mainActivityDataTaskNotification = new MainActivityDataTaskNotification() {
        @Override
        public void notifyMainActivity(String connStatus, String connInstruction) {
            connectivityInstruction.setText(connInstruction);
            connectivityStatus.setText(connStatus);
        }
    };

}
