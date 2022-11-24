# sftp - Upload files to sftp server

Github action for uploading files to sftp servers. Use at you own risk.

Example using repository secrets:

      - name: Upload files via SSH
        uses: resmh/action-sftp@main
        with:
          host: ${{ secrets.HOST }}
          user: ${{ secrets.USER }}
          password: ${{ secrets.PASSWORD }}
          target: "target"
          source: |
            test.txt
            test2.txt

