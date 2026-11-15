# Review of VonNeumannAlgebras (pull request #2242 at a494e8e)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since a494e8e; this round reads the pull request's title and description against the head. It has no findings.

## Previous findings

- none: the previous report, of a494e8e, had no findings, and the folder is unchanged since.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_conj_commutant_eq_of_isCyclic_of_isSeparating`, as the description states it | M=ℂ on H=ℂ, Ω=1; H=0 | K=ℝ, `K.symplComp`={z: Im z̄x=0 ∀x∈ℝ}=ℝ; J=conjugation: `Re⟨1,J1⟩=1≥0`, `J c J=c̄`∈M′=ℂ, onto; `z↦−z̄` gives −1<0. H=0: all sides {0} | holds; description's "J(K)=K.symplComp and Re⟨ξ,Jξ⟩≥0 on K" equals `Suggested.lean:546–553` | none |
| Description: "No heading is added or removed, and no Lean declaration is removed or restated" | `git diff origin/main...HEAD` | headings −0/+0; declarations −0, +1 (the theorem above), ~0; the other Lean hunks are the Layer 10 docstring bullet and four Jones page locators | agrees | none |
| Description: "From Mathlib adds …; PD-A36–A45 and PD-B23–B36 are consumed over ℝ as well as ℂ" | pins and OperatorTheory/PolarDecomposition on main | Mathlib `Fourier/Inversion.lean:175`, `LaxMilgram.lean:21`, `StandardSubspace.lean:178, 204, 218`; PolarDecomposition `:29` "`𝕜` denotes ℝ or ℂ", PD-A36 `:211`, PD-B36 `:397` | agrees | none |
| Description: "every Jones locator in README.md and Suggested.lean refers to that version" | 2015 notes (cached Vanderbilt PDF), 20 items | Thm 3.2.1 p. 12; 4.4.1–§4.5 pp. 28–29; 5.2.1–5.2.2 pp. 32–33; §7.3 p. 47, Ex. 7.3.11–14 p. 48; Lemma 8.2.1 p. 54; Ch. 10 pp. 61–68; Ex. 11.2.17 p. 75, 11.2.21 p. 76; Ex. 13.0.4–6 pp. 93–94; 13.1.3–13.1.6 pp. 94–95; Prop. 13.2.2 p. 97; Ex. 13.3.1 pp. 98–99 | all match README | none |
| Summary block: "retains its Layers 0–13 … existing headline theorems … remain unchanged" | README headings; `Suggested.lean` | `## Layer 0` … `## Layer 13` present; `double_commutant_iff_isClosed_image_ofCLM`, `tracialState_unique`, `existsUnique_isKMS_flow`, `dye`, `isInjective_iff_isHyperfinite` present, statements not in the diff | agrees | none |

Rows for the statements of the folder stand as in the previous review, of a494e8e; the diff since then is empty, so the seeded sample (13.1, 13.2) falls in no changed passage.

- Title and description, sentence by sentence against the 321-line change from the base: 0 sentences contradicted; nothing a reader must know is unstated (it says it revises the roadmap on main, names the added target, the rewritten V10.ModularTheory, the V10.KMS and Layer 11 changes, the added Mathlib contracts and reference, and the one added declaration; no section, headline or roadmap supplier is removed or added).
- Gate, this run at a494e8e: every counter 0, `OK`; the worker's run also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 245 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 33 `sorry` warnings and no other message.
- Source locators read against the text: Jones 2015, 20 (table row 4). Library declarations opened at the pin: 5 (row 3). Cross-roadmap citations resolved: PolarDecomposition PD-A36–A45, PD-B23–B36 on main; the three BanachSpaceTheory anchors the open SelfAdjointSpectralTheory revision renames are mapped at its head (BanachSpaceTheory README, Scope and ownership, "`#b1-duality-and-weak-topologies` → Layer 1 (B1)"), so the citations need no change. `roadmaps resolve` lists nothing.
- Ownership: `roadmaps grep` for `StandardSubspace|symplComp|exists_conj_commutant|modular conjugation|Tomita` over main and the open heads finds consumers of V10 only (OperatorAlgebraDynamics, Subfactors, QuantumGroups, FreeProbability, NoncommutativeIntegration, AnalyticNumberTheoryPartII, CategoricalOperatorAlgebras, TemperleyLiebOperatorAlgebras); no second owner and no shared fully qualified name.
- Overlap check: read AmenableTracesOnCStarAlgebras, QuantumFoundations, NoncompactQuantumSymmetry, SelfAdjointSpectralTheory, CompactQuantumMetricSpaces (open), FactorRigidity, OperatorAlgebraDynamics, CStarAlgebras (main); the results-and-headings list is empty; nothing shared (AmenableTracesOnCStarAlgebras owns C*-algebraic tracial states and cites V5 for the von Neumann notion).
- Source independence: changed passages only; 0 passages changed since a494e8e, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).
- Remark: OperatorAlgebraDynamics on main (`Suggested.lean:81`) still says `StandardSubspace` has no Tomita conjugation; once V10.StandardRealSubspaces is built that docstring is out of date. It is outside this folder.

## Not verifiable

- The `jones-vna` manifest entry records the 2009 PDF; the 13 November 2015 notes the README cites were read from the cached copy of the Vanderbilt PDF.
- Unchanged from the previous review: Tomiyama 1957; Arveson 1969; Haagerup 1985 and 1987; Connes–Størmer 1978; Takesaki I–III; Reed–Simon; Rudin.

## Source issues

- **Misprint** in jones-vna (2015 notes) at Theorem 16.3.2, p. 115: the source states the result for vN(F_n) with "n≥" and no bound; it should say n≥2; affects nothing.

## For the human reviewers

- **Licence.** The Jones reference (README, References) is unpublished lecture notes of 13 November 2015 read from a Vanderbilt-hosted PDF; the manifest key `jones-vna` records the 2009 Berkeley PDF, a different version with different page numbers.
- **Licence.** README, From Mathlib, links a Mathlib pull request (number 29251) as the origin of `StandardSubspace`; the gate's `prnum` check passes it. Whether a Mathlib pull-request link is wanted in a README is a policy reading.
