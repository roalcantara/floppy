using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// Spawns new versions of the pipe prefab every few seconds
public class PipeSpawnScript : MonoBehaviour
{
  public GameObject pipePrefab;
  public float spawnRate = 2;
  private float spawnTimer = 0;
  private float heightOffset = 10;

  // Start is called before the first frame update
  void Start()
  {
    // spawn a pipe as soon that the game starts
    spawnPipe();
  }

  // Update is called once per frame
  void Update()
  {
    if (spawnTimer < spawnRate)
    {
      spawnTimer += Time.deltaTime;
    }
    else
    {
      spawnPipe();
      spawnTimer = 0;
    }
  }

  private void spawnPipe()
  {
    float lowestPoint = transform.position.y - heightOffset;
    float highestPoint = transform.position.y + heightOffset;
    float randomY = Random.Range(lowestPoint, highestPoint);

    Instantiate(pipePrefab, new Vector3(transform.position.x, randomY), transform.rotation);
  }
}
