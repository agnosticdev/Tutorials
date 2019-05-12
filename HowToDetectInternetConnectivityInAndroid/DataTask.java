package com.agnosticdev.networkconnectivity;

import android.os.AsyncTask;
import android.util.Log;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class DataTask extends AsyncTask<String, Void, String> {

    private MainActivityDataTaskNotification mainActivityInterface;

    public DataTask(MainActivityDataTaskNotification mainActivityInterface) {
        this.mainActivityInterface = mainActivityInterface;
    }

    @Override
    /**
     * Notifies the main thread and calls the MainActivity method after onPreExecute is called.
     * <String, _, _> in the AsyncTask declaration.
     * @param String urlParams : passed into the execute() method.
     *
     */
    public String doInBackground(String... urlParams) {


        String connectionInstruction = "";
        String stringBufferData = "";
        URL passedInURL;
        HttpURLConnection connection = null;
        try {

            if (urlParams.length > 0) {
                passedInURL = new URL(urlParams[0]);
                connection = (HttpURLConnection) passedInURL.openConnection();
                InputStream fd = connection.getInputStream();
                InputStreamReader fdRead = new InputStreamReader(fd);
                int buffer = fdRead.read();
                while (buffer != -1) {
                    char bufferedCharacter = (char) buffer;
                    stringBufferData += bufferedCharacter;
                    buffer = fdRead.read();
                }
            }

            /// Do something meaningful with the stringBufferData here.
            /// For example, parse it into a model object.

            /// Meanwhile, onPostExecute to so this value can be passed back to the UI thread.
            connectionInstruction = "Based upon your last network request, your connectivity is good.";


        } catch (Exception e) {
            Log.i("Exception", e.toString());
            connectionInstruction = e.toString();
            e.printStackTrace();
        }

        return connectionInstruction;
    }

    @Override
    /**
     * Notifies the main thread and calls the MainActivity method before doInBackground is called.
     * <_, Void, _> in the AsyncTask declaration.
     *
     */
    public void onPreExecute() {
        this.mainActivityInterface.notifyMainActivity("Connection Status: Checking",
                "Waiting for connection to finish");
    }

    @Override
    /**
     * Returns the result from doInBackground and notifies the MainActivity on the main thread.
     * <_, _, String> in the AsyncTask declaration.
     *
     * @param String result : returned from the doInBackground method.
     */
    public void onPostExecute(String result) {
        String status = "Online";
        if (result.contains("UnknownHostException")) {
            status = "Offline";
        }
        this.mainActivityInterface.notifyMainActivity("Connection Status: " + status,
                result);
    }

}
