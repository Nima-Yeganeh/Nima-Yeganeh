import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

class MapReduce {
    private LinkedHashMap intermediate;
    private JSONObject finalResult = new JSONObject();
    private int resultCount;

    MapReduce() {
        resultCount = 0;
        finalResult = new JSONObject();
        intermediate = new LinkedHashMap();
    }

    JSONObject execute(JSONObject inputdata) {
        for (int i = 0; i < inputdata.size(); i++) {
            JSONObject record = (JSONObject) inputdata.get(i);
            mapper(record);
        }

        Iterator it = intermediate.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry) it.next();
            reducer((int) pair.getKey(), (ArrayList) pair.getValue());
            it.remove();
        }
        return finalResult;

    }

    private void emit(LinkedHashMap obj) {
        finalResult.put(resultCount++, obj);
    }

    private <T> void reducer(T key, ArrayList value) {
        LinkedHashMap obj = new LinkedHashMap();
        obj.put("key", key);
        obj.put("value", key);
        emit(obj);
    }

    private void mapper(JSONObject record) {
        int value = (int) record.get("value");
        if (value > 10 && value % 2 != 0) {
            emitIntermediate(value, 1);
        }
    }

    private <T1, T2> void emitIntermediate(T1 key, T2 value) {
        if (!intermediate.containsKey(key))
            intermediate.put(key, new ArrayList());

        ArrayList temp = (ArrayList) intermediate.get(key);
        temp.add(value);
        intermediate.put(key, temp);
    }
}

public class Main {

    public static void main(String[] argh) {
        JSONObject inputdata = new JSONObject();
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        int linecount = 0;
        for (int i = 0; i < t; i++) {
            int value = sc.nextInt();
            Map obj = new JSONObject();
            obj.put("key", linecount);
            obj.put("value", value);

            inputdata.put(linecount++, obj);
        }
        MapReduce mapred = new MapReduce();
        JSONObject result = mapred.execute(inputdata);

        for (int i = 0; i < result.size(); i++) {
            LinkedHashMap record = (LinkedHashMap) result.get(i);
            int value = (int) record.get("value");

            System.out.println(value);

        }

    }

}

