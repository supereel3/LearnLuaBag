using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BagGrid : MonoBehaviour
{
    private ArticleItem articleItem;
    public ArticleItem ArticleItem
    {
        get
        {
            return articleItem;
        }
    }

    //锟斤拷锟矫革拷锟斤拷锟斤拷锟斤拷
    public void SetArticleItem(ArticleItem articleItem)
    {
        this.articleItem = articleItem;

        this.articleItem = articleItem;
        // 锟斤拷锟矫革拷锟斤拷锟斤拷
        this.articleItem.transform.SetParent(transform);
        //Debug.Log("锟斤拷前articleItem锟侥革拷锟斤拷锟斤拷锟角ｏ拷" + this.articleItem.transform.parent);
        // 锟斤拷锟斤拷位锟斤拷
        this.articleItem.transform.localPosition = Vector3.zero;
        // 锟斤拷锟斤拷Scale
        this.articleItem.transform.localScale = Vector3.one;
        // 锟斤拷锟斤拷
        this.articleItem.GetComponent<RectTransform>().offsetMin = new Vector2(5, 5);
        this.articleItem.GetComponent<RectTransform>().offsetMax = new Vector2(-5, -5);
    }

    //锟斤拷崭锟斤拷锟�
    public void ClearGrid()
    {
        articleItem.gameObject.SetActive(false);
        articleItem.transform.SetParent(null);
        articleItem = null;
    }
}
