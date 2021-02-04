package com.gj;

@SuppressWarnings("unchecked")
public class ArrayList<E> {
    /**
     * 元素数量
     */
    private int size;
    /**
     * 所有的元素
     */
    private E[] elements;
    /**
     * 数组默认容量
     */
    private static final int DEFAULT_CAPACITY = 10;
    private static final int ELEMENT_NOT_FOUND = -1;


    public ArrayList(int capacity) {
        capacity = capacity < DEFAULT_CAPACITY ? DEFAULT_CAPACITY : capacity;
        elements = (E[]) new Object[capacity];
    }

    public ArrayList() {
        this(DEFAULT_CAPACITY);
    }
    /**
     * 
     * @return 元素的数量
     */
    public int size() {
        return size;
    }
    /**
     * 清空数组
     */
    public void clear() {
        for (int i = 0; i < size; i++) {
            elements[i] = null;
        }
        size = 0;
    }
    /**
     * 判断数组是否为空
     * @return 空true，非空false
     */
    public boolean isEmpty() {
        return size == 0;
    }
    /**
     * 是否包含特定元素
     * @param element  待查询的元素
     * @return 
     */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }
    /**
     * 在指定位置添加元素
     * @param index 待添加元素的索引
     * @param element 待添加的元素
     */
    public void add(int index ,E element) {
        rangeCheckForAdd(index);

        ensureCapacity(size + 1);

        for (int i = size; i > index; i--) {
            elements[i] = elements[i - 1];
        }
        elements[index] = element;
        size++;
    }
    /**
     * 数组尾部添加元素
     * @param element 待添加的元素
     */
    public void add(E element) {
        add(size, element);
    }
    /**
     * 删除指定位置的元素
     * @param index 索引
     * @return 被删除的那个元素
     */
    public E remove(int index) {
        rangeCheck(index);

        E element = elements[index];
        for (int i = index + 1; i < size; i++) {
            elements[i - 1] = elements[i];
        }
        size--;
        elements[size] = null;
        return element;
    }
    /**
     * 替换某个位置的元素
     * @param index 索引
     * @param element 新元素
     * @return 某个位置原有的元素
     */
    public E set(int index, E element) {
        rangeCheck(index);

        E old = elements[index];
        elements[index] = element;
        return old;
    }
    /**
     * 获取某个位置的元素
     * @param index
     * @return
     */
    public E get(int index) {
        rangeCheck(index);

        return elements[index];
    }
    /**
     * 获取某个元素第一次出现的索引
     * @param element
     * @return
     */
    public int indexOf(E element) {
        if (element == null) {//避免空指针异常
            for (int i = 0; i < size; i++) {
                if (elements[i] == null) return i;
            }
        } else {
            for (int i = 0; i < size; i++) {
                if(element.equals(elements[i])) return i;
            }
        }

        return ELEMENT_NOT_FOUND;
    }
    /**
     * 越界检查
     * @param index
     */
    private void rangeCheck(int index) {
        if(index < 0 | index >= size) {
            throw new IndexOutOfBoundsException("Index:" + index + ", Size:" + size);
        }
    }
    /**
     * add方法的越界检查
     */
    private void rangeCheckForAdd(int index) {
        if(index < 0 | index > size) {
            throw new IndexOutOfBoundsException("Index:" + index + ", Size:" + size);
        }
    }
    /**
     * 数组扩容
     * @param capacity 至少要扩大的容量
     */
    public void ensureCapacity(int capacity) {
        int oldCapacity = elements.length;//现在的容量
        if(oldCapacity >= capacity) return;

        int newCapacity = oldCapacity + (oldCapacity >> 1);
        E[] newElements = (E[]) new Object[newCapacity];
        for (int i = 0; i < size; i++) {
            newElements[i] = elements[i];
        }

        elements = newElements;

        System.out.println(oldCapacity + "扩容为" + newCapacity);
    }
   
    @Override
    public String toString() {
        //size=3,[99,77,66]
        StringBuilder sb = new StringBuilder();
        sb.append("size=" + size).append(",[");
        for (int i = 0; i < size; i++) {
            sb.append(elements[i]);
            if(i != size - 1) {
                sb.append(",");
            } 
        }
        sb.append("]");
        return sb.toString();
    }

}