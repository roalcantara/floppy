using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LogicScript : MonoBehaviour
{
  public int playerScore = 0;
  public Text scoreText;
  public GameObject gameOverPanel;

  /// ContextMenu allows you to add a button to the Unity inspector
  [ContextMenu("Increase score")]
  public void increaseScore(int amount = 1)
  {
    playerScore += amount;
    scoreText.text = playerScore.ToString();
  }

  public void restart()
  {
    SceneManager.LoadScene(SceneManager.GetActiveScene().name);
  }

  public void finish()
  {
    gameOverPanel.SetActive(true);
  }
}
