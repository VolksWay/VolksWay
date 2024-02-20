package com.example.mobile_volksway.views

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Bundle
import android.provider.MediaStore
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.example.mobile_volksway.MainActivity
import com.google.gson.JsonObject
import com.example.mobile_volksway.R
import com.example.mobile_volksway.apis.EndpointInterface
import com.example.mobile_volksway.apis.RetrofitConfig
import com.example.mobile_volksway.databinding.FragmentChecklistBinding
import com.squareup.picasso.Picasso
import okhttp3.MediaType
import okhttp3.MultipartBody
import okhttp3.RequestBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
class ChecklistFragment : Fragment() {
    private var _binding: FragmentChecklistBinding? = null
    private val binding get() = _binding!!

    private val clienteRetrofit = RetrofitConfig.obterAzureIA()

    private val endpoints = clienteRetrofit.create(EndpointInterface::class.java)

    private val IMAGEM_REQUEST_CODE = 123

    private val contentType = "application/octet-stream"

    private val subscriptionKey = "4b14454a59cb4397b0c9dee26d28ee7b"

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {

        _binding = FragmentChecklistBinding.inflate(inflater, container, false)

        val root: View = binding.root

        val icone_camera = root.findViewById<ImageView>(R.id.camera)

        icone_camera.setOnClickListener {
            mostrarOpcoesEscolhaImagem()
        }

        return root
    }

    private fun mostrarOpcoesEscolhaImagem(){
        // Criar Intents para escolher uma imagem da galeria ou capturar uma nova pela câmera
        val escolherImagemIntent = Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI)
        val capturarImagemIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)

        // Obter os títulos para as opções de escolha de imagem
        val escolherImagemTitle = resources.getString(R.string.escolher_imagem)
        val capturarImagemTitle = resources.getString(R.string.capturar_imagem)

        // Criar um Intent Chooser para oferecer opções entre galeria e câmera
        val intentEscolhaImagem = Intent.createChooser(escolherImagemIntent, escolherImagemTitle)
        intentEscolhaImagem.putExtra(Intent.EXTRA_INITIAL_INTENTS, arrayOf(capturarImagemIntent))

        // Iniciar a atividade esperando um resultado
        startActivityForResult(intentEscolhaImagem, IMAGEM_REQUEST_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        val imagemSelecionada = view?.findViewById<ImageView>(R.id.camera)

        if (requestCode == IMAGEM_REQUEST_CODE && resultCode == Activity.RESULT_OK){
            if (data?.data != null){
                val imagemSelecionadaUri = data.data

                val inputStream: InputStream? = requireContext().contentResolver.openInputStream(imagemSelecionadaUri!!)

                val imagemSelecionadaBitmap = BitmapFactory.decodeStream(inputStream)

                imagemSelecionada?.setImageURI(imagemSelecionadaUri)

                analisarImagem(imagemSelecionadaBitmap)

            }else if (data?.action == "inline-data"){
                // Imagem capturada pela câmera
                val imagemCapturada = data.extras?.get("data") as Bitmap
                imagemSelecionada?.setImageBitmap(imagemCapturada)

                analisarImagem(imagemCapturada)
            }
        }
    }


    private fun analisarImagem(imagem: Bitmap){
        // Criar um arquivo temporário para armazenar a imagem
        val file = File(requireContext().cacheDir, "temp_image.png")
        file.createNewFile()

        // Salvar a imagem Bitmap no arquivo temporário
        val outputStream = FileOutputStream(file)
        imagem.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
        outputStream.close()

        // Criar partes Multipart para a imagem
        val requestFile = RequestBody.create(MediaType.parse("image/*"), file)
        val imagemPart = MultipartBody.Part.createFormData("imagem", file.name, requestFile)

        endpoints.analisarImagemPeneu(predictionKey = subscriptionKey, imagemPart).enqueue(object : Callback<JsonObject>{
            override fun onResponse(call: Call<JsonObject>, response: Response<JsonObject>) {
                // Exibir mensagem de sucesso
                //Toast.makeText(requireContext(), "Foto analisada com sucesso!!!", Toast.LENGTH_SHORT).show()

                when(response.code()){
                    200 -> {
                        Toast.makeText(requireContext(), response.body().toString(), Toast.LENGTH_SHORT).show()
                    }
                }
            }

            override fun onFailure(call: Call<JsonObject>, t: Throwable) {
                // Exibir mensagem de erro
                Toast.makeText(requireContext(), "Erro ao analisada imagem.", Toast.LENGTH_SHORT).show()
            }

        })
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}