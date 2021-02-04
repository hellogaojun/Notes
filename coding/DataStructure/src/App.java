
import com.gj.ArrayList;
import com.gj.Asserts;

public class App {
    public static void main(String[] args) throws Exception {
        testArrayList();
    }

    public static void testArrayList() {
        ArrayList<Integer> list =  new ArrayList<Integer>(5);
        list.add(11);
        list.add(22);
        list.add(44);
        list.add(66);
        list.add(88);
        list.add(77);
        list.add(99);
        list.add(55);
        System.out.println(list);
        list.remove(4);
        System.out.println(list);
        list.set(0, 9);
        Asserts.test(list.get(0) == 9);
        Asserts.test(list.isEmpty() == false);
        list.clear();
        Asserts.test(list.isEmpty() == true);
        list.add(100);
        list.add(200);
        list.remove(1);
        list.add(1, 300);
        Asserts.test(list.get(1) == 300);
        Asserts.test(list.contains(100) == true);
        list.add(300);
        Asserts.test(list.indexOf(300) == 1);

        ArrayList<Object> list2 = new ArrayList<Object>();
        list2.add(28);
        list2.add(35);
        list2.add(null);
        list2.add("Hello World");
        list2.add(list2.size(), 9.88);
        System.out.println("list2:" + list2);
    }
}


