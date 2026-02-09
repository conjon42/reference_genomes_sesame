nextflow.enable.dsl=2

// Import the module (adjust path as needed)
include { LIMA } from './modules/nf-core/lima/main'

workflow {

    // 1. Define the primers file (static input)
    primers_ch = file("../../data/20260114_bcl_hifi_release/2_A01/common/barcodes.fasta")

    // 2. Create the Channel from the samplesheet
    input_ch = channel
        .fromPath("samplesheet.csv")
        .splitCsv(header: true) // Parses the header row keys
        .view { row -> "Read sample ${row.sample} with BAM ${row.bam}" } // Optional: view the parsed data
        .map { row ->
            
            // CONSTRUCT THE META MAP
            // We pack 'id' (required) plus all your optional columns and the BAI path here.
            def meta = [
                id: row.sample,           // Required by most nf-core modules
            ]

            // CONSTRUCT THE TUPLE
            // [ meta_map, bam_file ] matches: tuple val(meta), path(ccs)
            return [ meta, file(row.bam) ]
        }

    // 3. Run the module
    LIMA(input_ch, primers_ch)
    
    // 4. Example of accessing the preserved data downstream
    LIMA.out.bam.view { meta, bam -> 
        "Finished processing ${meta.id}. Output BAM: ${bam}"
    }
}