# GATE-AutomorphicSpectralTheoryPartII~2: reply to the human review

Review answered: kim-em, 2026-11-19T00:54:27Z (read at 839b07e; the head is 6df1362, whose reordering moved §4.2a to `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md` line 1191 and §5.5 to line 1473). Repairs are in commit fa09a92 on top of 6df1362, not pushed. The review makes six requested changes and one suggestion: H01–H06 and H07.

## H01 (kim-em) — applied

§4.2a now holds only the definition and the three API bullets that need merged material. Its *Needs:* line changed from "§4.1; §4.2; §2.15a; AutomorphicSpectralTheory §§0.50, 1.9, 4.5; …" to "§2.15a; AutomorphicSpectralTheory §0.50; ArithmeticLocallySymmetricSpaces ALS.F.6 (iv); AutomorphicFormsOnReductiveGroups §§0.3, 2.7, 3.4–3.5, 4.1–4.2; AdelicAlgebraicGroups §2.1; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.2". None of these depends on a "must provide" request. The opening "Fix (G,Z,ω,K) as in §4.1" now fixes G, Z, ω and K directly. Bi-K stability is cited to AutomorphicFormsOnReductiveGroups §0.3 instead of §4.1's notation `S(G(𝔸))_K`.

The statements about χ_π^T move to a new **§4.2b T-characters of admissible representations** (README lines 1217–1235), which needs §§4.1, 4.2 and 4.2a. They are: the definition of χ_π^T, the fact that χ_π^T determines the near-equivalence class, the CAP clause, and the containment of the cuspidal χ_π^T-eigenpart. The Check about changing π∞ moved with them.

## H02 (kim-em) — applied

The defining paragraph of §4.2a (line 1193) now defines near equivalence for any two irreducible admissible representations π, π′ of G(𝔸): there is a finite set S′ of places, containing the archimedean ones, with π_v≅π′_v for every v∉S′. It names the category: irreducible admissible (𝔤∞,K∞)×G(𝔸_f)-modules, factored by AutomorphicFormsOnReductiveGroups §3.5 (`flath`) and AutomorphicSpectralTheory §0.50. Where Schwartz functions act on such a representation (§§4.3 and 5.3–5.6), its archimedean factor is replaced by its Casselman–Wallach globalization (AutomorphicFormsOnReductiveGroups §2.7), which leaves the finite-place factors unchanged.

A closed irreducible π̃⊂L²_cusp enters through its module of smooth K∞-finite finite-level vectors (ALS.F.6 (iv)). The spherical criterion is now stated for π, π′. §5.5 now says π is "in the sense of §4.2a".

## H03 (kim-em) — applied

The citation "(AutomorphicSpectralTheory §4.5, cuspidal part)" is replaced. The new text cites ArithmeticLocallySymmetricSpaces ALS.F.6 (iv) for the cuspidal subspace of `L²(G(F)∖G(𝔸))_{ω|A_G∞}`, with A_G∞⊂Z(𝔸) as in AdelicAlgebraicGroups §2.1. It then cuts this down to L²_cusp([G],ω): Z(F)A_G∞∖Z(𝔸) is compact (§2.15a), and by Schur's lemma Z(𝔸) acts on each summand by a character.

ALS.F.6 (iv) is added to §4.2a's *Needs:* line and to the Layer 4 Dependencies. A new supplier contract, "### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces" (line 1637), says what is consumed.

The review's reading is right. On main, AutomorphicSpectralTheory §4.5 is stated on `L²_disc([G]¹)` and says "The cuspidal part is supplied by ArithmeticLocallySymmetricSpaces ALS.F.6". ALS.F.6 (iv) states the Hilbert-sum decomposition with finite multiplicities for the character of `A_∞=A_𝐆(ℝ)°`.

## H04 (kim-em) — applied

The hypothesis of §5.5 (line 1493) changed. Old: "π is not nearly equivalent … to a constituent of induction from any proper cuspidal datum". New: "the T-character χπ^T of §4.2b is not (G,T)-CAP (§4.2)", followed by its local restatement: no proper (P,σ) with π_v a constituent of the normalized induction of σ_v for almost all v. §4.2b has the comparison as an API bullet. At every finite v∉T, π_v is the spherical representation with character χ_{π,v}, by the spherical classification. So χ_π^T is (G′,T)-CAP exactly when π is CAP in this local sense.

This is BPLZZ's own definition: "π is (G′,T)-CAP if χ_π^T is" (bplzz line 1095, Definition 3.4). For G′=G and finite T it is the hypothesis of Theorem 1.1 (bplzz lines 55–57). Stated through χ_π^T, the step about the uniqueness of the unramified constituent of a global induced representation is no longer needed. The proof route and *Needs:* line of §5.5 now cite §§4.2, 4.2a and 4.2b.

## H05 (kim-em) — applied

All 105 locators of the form "bplzz/bpcz/lapid line N" are removed. The earlier count of 92 counted lines rather than occurrences. Where another locator stood beside the line number, only the line number was dropped. Where the line number was the only locator, it is replaced by a printed page from the source:

| Place | New locator |
| --- | --- |
| §1.2a, closed-graph continuity | (BPLZZ Appendix A, p.45) |
| §1.4 | (BPLZZ §2.4, Lemma 2.22 and its proof, p.16, which also contains the translated-character argument; Kostant's Theorems 4.8–4.9 only as cited in that proof) |
| §2.4 | Lapid §2, p.7, and (9), p.11 |
| §2.16 Check | (BPCZ Lemma 2.4.4.1(5), p.207, and §2.5.13, p.215) |
| §3.6a | Lapid, proof of Proposition 3.4, p.16 and p.17; Lapid §3.4, p.15 (twice); Lapid Proposition 3.5, p.16, and Appendix A, p.28; [MS04, Proposition 4.2] as cited in Lapid Theorem 3.8, p.17 |
| §3.7 | Lapid §3.6, p.19 |
| §4.5a | Lemma 3.12, p.26 |
| §4.6 | (p.26) |
| Bernstein reference | BPCZ §2.5.5, p.212, and §2.5.12, p.215 |
| Final references paragraph | BPLZZ Appendix A, pp.43–45, and §§3.3–3.4, pp.26 and 30, with the BPLZZ reference list on pp.45–47; BPCZ pp.229 and 240; Lapid pp.15–17 and 28 |

The References sentence about line-numbered extractions and SHA-256 digests is deleted.

Pages were computed from the sources' page markers and checked against the printed numbers:
- BPLZZ: printed page = PDF page; Theorem 3.6 is on PDF page 23 and the paper cites it as p.23.
- BPCZ: printed page = PDF page + 182; PDF page 33 carries the header "… 215".
- Lapid: printed page = PDF page − 1; PDF page 16 ends with the footer "15".

## H06 (kim-em) — applied

"From Tau Ceti" now gives the pins in `lake-manifest.json`. Old: Tau Ceti 358314d4…, Mathlib f6090c70…. New: Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e.

The same check found two Mathlib locators in "From Mathlib" that had moved at the pin:
- `Differentiable`: `FDeriv/Defs.lean:170` → `:172`.
- `Summable`/`Multipliable`: `InfiniteSum/Defs.lean:114` → `:115`, where `Multipliable` carries the `to_additive` that generates `Summable`.

`SchwartzMap` (:75), `Lp` (:89) and `CentroidHom` (:56) are unchanged at the pin.

## H07 (kim-em) — answered

Backticked names such as `NearlyEquivalent`, `cuspNearlyIsotypic` and `cuspNearlyIsotypicLevel` cannot be added. In this repository a backticked name of a roadmap's own is a claim that `Suggested.lean` declares it, and these cannot be declared at the pins:
- Neither Mathlib nor Tau Ceti has irreducible admissible (𝔤,K)×G(𝔸_f)-modules, their restricted tensor factorization, or L²_cusp(G(F)∖G(𝔸),ω) for a reductive G. The pinned Tau Ceti has only classical cusp forms on ℍ (`TauCeti/NumberTheory/ModularForms/...`).
- `Suggested.lean` admits definitions only where they make a statable headline statable. BPLZZ Theorem 1.1 (§5.5) is already named in its module docstring as not statable.

A statement-writing project can cite the relation and the two subspaces as AutomorphicSpectralTheoryPartII §4.2a, and χ_π^T as §4.2b.

## Ownership, suppliers and sources

- **Ownership of near equivalence**, searched by object ("nearly equivalent", "nearly isotypic", "near-equivalence") over main and the 355 open heads. No other roadmap defines the general relation or the π-nearly isotypic cuspidal subspace.
  - On main, MotivesAndAlgebraicCycles and EndoscopicTransferAndUnitaryTraceComparison use the phrase for other objects.
  - ModularityAndLanglandsExtensions (open head) uses Arthur's decomposition of `L²_disc(SO(V))` by A-parameters, which is a specialized object.
  - GanGrossPrasadUnitaryGroups and TwistedAutomorphicDescents (open heads) have no such object.
- **No other roadmap cites §4.2a of this roadmap**: `roadmaps grep AutomorphicSpectralTheoryPartII` finds only BanachSpaceTheory (Layer 4), LieGroupsPartII and NoncommutativeGeometry. Adding §4.2b therefore drops no cited id.
- **New supplier**: ArithmeticLocallySymmetricSpaces is on main. Its ALS.F.6 (iv) is cited as it stands at main faef063.
- **Sources**: no source was fetched, and `needs-references.toml` was not written. Every new locator comes from the three cached texts (bplzz, bpcz, lapid).
- **Untrusted text**: the review contains no instruction beyond the review points.

## Suggested.lean

`Suggested.lean` is unchanged. Its 10 declarations, as elaborated in the job's signature listing (no dropped binders), still match README §§0.1–0.3. No declaration was added, so no `#check` comparison was needed beyond the unchanged signatures. A scratch-file `#check` run is outside the Lean commands this job may run.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2a near equivalence (any π, π′) | GL₁: π=ω and π′=ω⊗χ, χ nontrivial only at v₀; two Hecke characters equal off a finite set; the trivial group | ω⊗χ agrees with ω at every v≠v₀, so the two are nearly equivalent. For Hecke characters, ω′ω⁻¹ is trivial at almost all v, hence trivial by weak approximation, so ω′=ω. Trivial group: one class. Transitivity: S′₁∪S′₂ is finite | holds | none |
| §4.2a K_v | SL₂(ℚ_p); the two GL₂-conjugate hyperspecials SL₂(ℤ_p) and diag(p,1)SL₂(ℤ_p)diag(p,1)⁻¹; the two pieces of an unramified principal series of GL₂ whose restriction to SL₂ splits | Each piece is spherical for exactly one of the two subgroups. So "K_v-spherical" with an arbitrary hyperspecial K_v at infinitely many v would change the meaning | defect in the new wording | K_v is now the hyperspecial factor of the maximal compact fixed in the Conventions (BPLZZ's K=K_S×∏K_{0,v}, bplzz line 1099) |
| §4.2a spherical criterion | GL₂(ℚ_p): unramified principal series with Satake parameters {2,3} vs {2,4}; Steinberg | T_p eigenvalues p^{1/2}(α+β) are 5p^{1/2} and 6p^{1/2}, so the two are not isomorphic. Steinberg has no GL₂(ℤ_p)-fixed vector, so it is not counted as spherical | holds | none |
| §4.2a L²_cusp via ALS.F.6 (iv) | G=Z=GL₁ over ℚ | A_G∞=ℝ_{>0}; Z(F)A_G∞∖Z(𝔸)≅Ẑ^×, compact. In L²(ℚ^×∖𝔸^×)_{ω\|ℝ>0}, the summands where 𝔸^× acts by ω reduce to the line ℂω. This matches the GL₁ Check. Without the A∞-character, L²(ℚ^×∖𝔸^×) has no nonzero character vector | holds | none |
| §4.2b χ_π^T | GL₁, π=ω; T = all finite places | v-component: evaluation of T^{±1} at ω_v(ϖ_v). For T = all finite places, χ_π^T = χ∞ only, as in the §4.1 Check | holds | none |
| §4.2b bullet 1 (T finite) | GL₁: ω vs ω⊗χ_{v₀}, χ_{v₀} unramified, v₀∉T; T = all finite places | The characters differ at one place only, so the two are nearly equivalent ✓. With T infinite, the ⇐ direction would identify distinct Hecke characters ω≠ω′, so finiteness of T is needed and stated | holds | none |
| §4.2b bullet 2 (CAP comparison) | GL₂, π=Ind(χ₁⊗χ₂) with unitary Hecke characters; GL₁; T = all finite places | GL₂: both sides hold through the Borel with σ=χ₁⊠χ₂. GL₁: no proper parabolic, so both sides are false. T = all finite places: both sides reduce to "some proper parabolic carries a cuspidal σ" | holds | none |
| §4.2b bullet 3 (containment) | GL₁, K=Ẑ^×, ω unramified, π=ω; π∞ replaced by a character with another differential | The level-K space is ℂω. The eigenpart is ℂω for π and 0 after the replacement, so it is contained, and properly in the second case | holds | none |
| §5.5 hypothesis | PGL₂, π=1; GL₂, π attached to Δ | π=1: π_p is a constituent of Ind(\|·\|^{1/2}⊗\|·\|^{−1/2}) at every p, so CAP, and the theorem does not apply. Δ: equal Satake data at almost all p would make π≅χ₁⊞χ₂ by isobaric strong multiplicity one, contradicting cuspidality, so not CAP | holds | none |
| Pins and Mathlib locators | `lake-manifest.json`; grep at the pinned Mathlib | Lines 10 and 22 of the manifest; `def Differentiable` at line 172, `def Multipliable` at line 115 | stale before | updated |
| New page locators | printed-page offsets checked on the sources | BPLZZ 0; BPCZ +182 (PDF 25 header 207, PDF 33 header 215); Lapid −1 (PDF 15 footer 14, PDF 16 footer 15) | consistent with the pages already cited | as listed in H05 |

## Build and gate

    lake build TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested
    ⚠ [18238/18239] Built TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested (10s)
    warning: …/Suggested.lean:95:8: declaration uses `sorry`
    warning: …/Suggested.lean:108:8: declaration uses `sorry`
    warning: …/Suggested.lean:118:8: declaration uses `sorry`
    Build completed successfully (18239 jobs).

Gate, at fa09a92:

    gate AutomorphicSpectralTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`--depcheck … --movable --pr 1761`):

    depcheck: 199 roadmaps, 2189 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.
