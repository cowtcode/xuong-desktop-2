/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Until;

import DAO.NhanVienDAO;
import Entity.NhanVien;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import org.apache.commons.lang3.RandomStringUtils;
import utils.MsgBox;

/**
 *
 * @author XUAN TRUONG
 */
public class quenMatKhau extends JFrame{
    Container container;
    JTextField txtmaNhanVien,txtEmail,txtXacNhan;
    JPasswordField MatKhauMoi,XacNhanMK;
    JButton btnThayDoiMk,btnGuiMaCode;
    JLabel lblLapLai,lblMat,lblMat1;
    NhanVienDAO nvDAO= new NhanVienDAO();

    public quenMatKhau() {
        giaodienQMK();
        chucnang();
        
    }
    
    public void giaodienQMK()
    {
        container= getContentPane();
        setTitle("QUÊN MẬT KHẨU");
        setLayout(null);
        setSize(600,480);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        //set logo cho phần setitle
        ImageIcon image = new ImageIcon("D:\\fpoly\\duann1\\src\\img\\nike.png");
        setIconImage(image.getImage());
        
        JLabel lblThayDoiMK= new JLabel("Quên mật khẩu");
        Font ThayMK= new Font("times new roman",Font.BOLD,20);
        lblThayDoiMK.setFont(ThayMK);
        lblThayDoiMK.setBounds(20,20,200,30);
        lblThayDoiMK.setForeground(Color.BLUE);
        JLabel lblVuiLong= new JLabel("Vui lòng nhập Email hoặc Số điện thoại bạn sử dụng để đăng kí tài khoản!");
        Font vuilong= new Font("times new roman",Font.BOLD,15);
        lblVuiLong.setFont(vuilong);
        lblVuiLong.setBounds(20,50,500,25);
        lblVuiLong.setForeground(Color.darkGray);
        JLabel lblMaNV= new JLabel("Nhập Mã Nhân Viên:");
        lblMaNV.setBounds(20,100,150,25);
        txtmaNhanVien= new JTextField();
        txtmaNhanVien.setBounds(180,100,390,30);
        JLabel lblEmail= new JLabel("Email:");
        lblEmail.setBounds(20,160,100,25);
        txtEmail= new JTextField();
        txtEmail.setBounds(180,160,270,30);
        btnGuiMaCode= new JButton("Gửi mã");
        btnGuiMaCode.setBackground(Color.YELLOW);
        btnGuiMaCode.setBounds(470,160,100,30);
        JLabel lblmaXN= new JLabel("Mã xác nhận:");
        lblmaXN.setBounds(20,210,100,25);
        txtXacNhan= new JTextField();
        txtXacNhan.setBounds(180,210,330,30);
        lblLapLai= new JLabel(new ImageIcon("D:\\fpoly\\duann1\\src\\img\\laplai.jpg"));
        lblLapLai.setBounds(520,200,60,50);
        JLabel mkMoi= new JLabel("Mật khẩu mới:");
        mkMoi.setBounds(20,260,120,25);
        MatKhauMoi= new JPasswordField();
        MatKhauMoi.setBounds(180,260,330,30);
        lblMat= new JLabel(new ImageIcon("D:\\fpoly\\duann1\\src\\img\\mat.png"));
        lblMat.setBounds(520,260,60,30);
        JLabel XNmkMoi= new JLabel("xác mật khẩu mới:");
        XNmkMoi.setBounds(20,310,120,25);
        XacNhanMK= new JPasswordField();
        XacNhanMK.setBounds(180,310,330,30);
        lblMat1= new JLabel(new ImageIcon("D:\\fpoly\\duann1\\src\\img\\mat.png"));
        lblMat1.setBounds(520,310,60,30);
        btnThayDoiMk= new JButton("Thay đổi mật khẩu");
        btnThayDoiMk.setBackground(Color.YELLOW);
        btnThayDoiMk.setBounds(180,380,330,30);
        
        container.add(lblThayDoiMK);
        container.add(lblVuiLong);
        container.add(lblMaNV);
        container.add(txtmaNhanVien);
        container.add(lblEmail);
        container.add(txtEmail);
        container.add(btnGuiMaCode);
        container.add(lblmaXN);
        container.add(txtXacNhan);
        container.add(lblLapLai);
        container.add(mkMoi);
        container.add(MatKhauMoi);
        container.add(lblMat);
        container.add(XNmkMoi);
        container.add(XacNhanMK);
        container.add(lblMat1);
        container.add(btnThayDoiMk);
        setVisible(true);
        
    }
    
    //tạo mã xác nhận ngẫu nhiên 
    String capcha= RandomStringUtils.randomAlphanumeric(6);
            
    public void sendMail() throws MessagingException, UnsupportedEncodingException {
        try {
            
            
            final String fromEmail = "truongnnxps30039@fpt.edu.vn"; // mail của mình

            final String password = ""; // Mat khai email cua ban

            final String toEmail = txtEmail.getText(); // dia chi email nguoi nhan

            final String subject = "Lập trình City"; // Tiêu đề
            final String body = "Mã xác nhận của mã sinh viên"+ txtmaNhanVien + "là:" + capcha; // nội dung

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
            props.put("mail.smtp.port", "587"); //TLS Port
            props.put("mail.smtp.auth", "true"); //enable authentication
            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Session session = Session.getInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress(fromEmail, "Lập trình City")); // chỗ kế bên email

            msg.setReplyTo(InternetAddress.parse(fromEmail, false));

            msg.setSubject(subject, "UTF-8");

            msg.setText(body, "UTF-8");

            msg.setSentDate(new Date());

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            Transport.send(msg);
            MsgBox.alert(container,"Gửi mail thành công");
        } catch (Exception e) {
            e.printStackTrace();
            MsgBox.alert(this, "Gửi mail không thành công");
        }

    }
    
    //private final String CapCha = RandomStringUtils.random(7,true,true);
    
    public void chucnang()
    {
        btnGuiMaCode.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    sendMail();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        });
        btnThayDoiMk.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //Lấy giá trị nhập từ người dùng
                String maCapCha= txtXacNhan.getText();
                String MKMoi= new String(MatKhauMoi.getPassword());
                String xacnhanMKMoi= new String(XacNhanMK.getPassword());
                if (maCapCha.equals(capcha) && MKMoi.equals(xacnhanMKMoi)) {
                    NhanVien nv= nvDAO.selectById(txtmaNhanVien.getText());
                    nv.setMatKhau(MKMoi);
                    nvDAO.update(nv);
                    dispose();
                    dangnhap dn= new dangnhap();
                    dn.setVisible(true);
                }
                else
                {
                    MsgBox.alert(container,"Mã xác nhận không đúng hoặc mật khẩu không khớp");
                }
            }
        });
    }
    
    
    public static void main(String[] args) {
        quenMatKhau mk= new quenMatKhau();
    }
}
