using System;
using System.IO;
using System.Reflection;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.XPath;
using System.Xml.Xsl;

namespace XmlHandler
{
    class Program
    {
        private const string XmlFile = "library.xml";
        private const string XsdFile = "library.xsd";
        private const string XslHtmlFile = "library-html.xsl";
        private const string XslTxtFile = "library-txt.xsl";

        static void Main()
        {
            var path = new Uri(Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase)).LocalPath;
            var xmlFile = path + "\\" + XmlFile;
            var xsdFile = path + "\\" + XsdFile;

            ValidateXml(xmlFile, xsdFile);

            var xslHtmlFile = path + "\\" + XslHtmlFile;
            var xslTxtFile = path + "\\" + XslTxtFile;

            WriteXslTransformation(xmlFile, xslHtmlFile, "html-library.html");
            Console.WriteLine("Html transformation successful");

            WriteXslTransformation(xmlFile, xslTxtFile, "text-library.txt");
            Console.WriteLine("Text transformation successful");
        }

        private static void WriteXslTransformation(string xmlFile, string xslFile, string outFile)
        {
            XPathDocument myXPathDoc = new XPathDocument(xmlFile);
            XslCompiledTransform myXslTrans = new XslCompiledTransform();
            myXslTrans.Load(xslFile);
            XmlTextWriter myWriter = new XmlTextWriter(outFile, null);
            myXslTrans.Transform(myXPathDoc, null, myWriter);
        }

        private static void ValidateXml(string xmlFile, string xsdFile)
        {
            try
            {
                XmlReader rd = XmlReader.Create(xmlFile);
                XDocument doc = XDocument.Load(rd);

                XmlSchemaSet schema = new XmlSchemaSet();
                schema.Add("", xsdFile);

                doc.Validate(schema, null);
                Console.WriteLine("Valid");
            }
            catch (XmlSchemaValidationException e)
            {
                Console.WriteLine(e.Message);
            }
        }

    }
}
