package com.gj;

@SuppressWarnings("unchecked")
public class ArrayList<E> extends AbstractList<E> {

    /**
     * 所有的元素
     */
    private E[] elements;
    /**
     * 数组默认容量
     */
    private static final int DEFAULT_CAPACITY = 10;

    public ArrayList(int capacity) {
        capacity = capacity < DEFAULT_CAPACITY ? DEFAULT_CAPACITY : capacity;
        elements = (E[]) new Object[capacity];
    }

    public ArrayList() {
        this(DEFAULT_CAPACITY);
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
     * 指定位置添加元素
     * @param index
     * @param element
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
     * 根据索引删除元素
     * @param index
     * @return
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
     * 设置index位置元素
     * @param index
     * @param element
     * @return
     */
    public E set(int index, E element) {
        rangeCheck(index);

        E old = elements[index];
        elements[index] = element;
        return old;
    }

    /**
     * 获取index位置元素
     * @param index
     * @return
     */
    public E get(int index) {
        rangeCheck(index);

        return elements[index];
    }

    /**
     * 获取元素索引
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
     * 数组扩容
     * @param capacity 至少要扩大的容量
     */
    private void ensureCapacity(int capacity) {
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