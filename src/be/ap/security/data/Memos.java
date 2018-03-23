package be.ap.security.data;

import be.ap.security.entities.Memo;

import java.time.OffsetDateTime;
import java.util.*;

public class Memos {
    private static HashMap<String ,HashSet<Memo>> memos;

    static {
        HashSet<Memo> set = new HashSet<>(Arrays.asList(new Memo(0, "Darth vader", "Must obtain more power", OffsetDateTime.now()), new Memo(1, "Snoke", "Must lure more jedis to the dark side.", OffsetDateTime.now())));
        memos = new HashMap<>();
        memos.put("root", set);
    }

    public static Map<String, HashSet<Memo>> getMemos() {
        return Collections.unmodifiableMap(memos);
    }

    public static void removeMemo(String key, long id) {
        memos.get(key).removeIf(memo -> memo.getId() == id);
    }

    public static void addMemo(String key,Memo memo) {
        memos.get(key).add(memo);
    }
}
