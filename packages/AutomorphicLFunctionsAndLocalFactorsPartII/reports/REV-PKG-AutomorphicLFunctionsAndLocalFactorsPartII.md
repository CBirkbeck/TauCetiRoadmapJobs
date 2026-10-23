<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6376855656 -->
Review (claude) of bf850fe

Verdict: needs changes

1. **F01** (P1) Six declared gaps have no supplier

   - **Location.** `design/plan.json`, top-level `gaps`, records `AutomorphicLFunctionsAndLocalFactorsPartII/G1`–`G6`. Each has only `id, title, neededBy, detail`, with no `supplier`, `section` or `needs`. None appears in the README as `gap:<slug>`.
   - **Claim.** These are declared supplier gaps whose supplier is `none`, so they are unowned prerequisites.
   - **Witness.** The brief lists all six with supplier `none`. A mechanical comparison found that the 13 slugged gaps match the README word for word. G1–G6 have no README sentence.
   - **Repair.** Every obligation already has an owner in this package or in a cited supplier. Record that owner instead of `none`, or retire the record as owned here:

     | Record | Owner |
     | --- | --- |
     | G1 unitary local FE, nonsplit spherical identity, χ∘det residue route | MetaplecticAutomorphicForms §6.10a (local integrals, Lapid–Rallis normalized FE, unramified denominator, completed function); AutomorphicSpectralTheory §2.4 for the Siegel series (see R03); comparisons in §§2.1–2.4 here |
     | G2 MVW for every admissible π | MetaplecticAutomorphicForms §3.15 (nonarchimedean); the archimedean case is a target of §3.2 here (see R06) |
     | G3 critical fibre, s_crit, rational projected kernel, compact-dual dictionary | §§4.2, 4.8, 4.10 here (each says the comparison "is a target") |
     | G4 CFK local-theory proofs, Kaplan Theorem 25, k=1 pole theorem | §§5.4, 6.1–6.10, 7.2, 7.6, 9.3 here; the unread GAFA paper is a source request (needs-references), not a supplier gap; see R02 |
     | G5 converse-theorem proof, globalization, Hecke prescription | §10.3 here; `gap:controlled-supercuspidal-globalization`; R04 for the Hecke character |
     | G6 Hermitian and GSpin carriers | duplicate of `gap:hermitian-gspin-carriers` (ReductiveGroupsPartII) |

     If plan.json cannot change at the package stage, mark this finding "not actionable in this package" in the repair report and attach this table so the intake can retire the records.

2. **F02** (P1) "The local analytic construction" is cited as an owner but names nothing

   - **Location.** README line 1211 (§7.2): "its underlying local proof is included in the local analytic construction". Line 1271 (§7.6): "The k=1 case requires the classical matrix-coefficient doubling pole theorem … proved in the local analytic construction". Line 1157 (§6.10): "The proof includes the local analytic construction."
   - **Claim.** These proof steps are supplied.
   - **Witness.** No layer, target, supplier section or pinned declaration has that name. CFK line 773 credits k=1 attainment to Yamana's Theorem 7.1, adjusted for SO and GSpin. CFK line 1889 credits the (A.2) uniqueness to Kaplan's Theorem 25. The README cites neither.
   - **Repair.** In §7.6, state the k=1 attainment as an explicit part of the target, with its hypotheses and locator (CFK §3.6, p.19; CFK line 773). Cite MetaplecticAutomorphicForms §6.10a, which includes Yamana's good-section GCD, for the Sp/SO finite-place input, and keep the GSpin and SO adjustments as statements proved here. In §7.2, state the generic multiplicity-one bound for (A.2) as part of the target (CFK Theorem A.1, p.43; CFK line 1882). Record Kaplan's paper as `uncertified` or in needs-references. In §6.10, replace the sentence by the actual input: CFK Theorem 3.10, whose proof is in the CFK local-theory paper, cited by locator.

3. **F03** (P2) §1.3 re-plans the Siegel Eisenstein continuation on a false obstruction

   - **Location.** README line 316: "The general AutomorphicSpectralTheory §§1.1–1.4 cusp-data theorem cannot be applied directly to the noncuspidal character χ∘det on GL_n: obtain this section by ordered residues of cuspidal GL₁ data".
   - **Claim.** The supplier covers only cuspidal inducing data, so this roadmap must build the continuation.
   - **Witness.** AutomorphicSpectralTheory §1.1 (line 891) induces from "a discrete unitary representation σ of M(𝔸)¹"; §2.4 (line 1604) constructs "the discrete-data extension". Unitary χ∘det is such data. MetaplecticAutomorphicForms §6.2 (line 1555) builds the unitary Siegel family.
   - **Instance.** For n=2, χ∘det on GL₂(𝔸_E)¹ spans a one-dimensional square-integrable, noncuspidal space. It is valid `H_P⁰` inducing data, so AutomorphicSpectralTheory §2.4 gives E_Q(M(w,λ)φ,wλ)=E_P(φ,λ) directly. README §8.1 (line 1291) itself relies on the "imported discrete-data Eisenstein continuation".
   - **Repair.** Restate §1.3 as the specialization of AutomorphicSpectralTheory §§1.1–1.4, 2.4 and 2.4a to the Siegel parabolic with discrete inducing datum χ(det Δ)·|·|^s, citing MetaplecticAutomorphicForms §6.2 for the unitary Siegel family. Keep only the EHLS affine parameter conversion (z=s+1/2, z↔1−z gives s↔−s) and the GU central character. Delete the ordered-residue route, and the matching clause of G1.

4. **F04** (P2) `gap:ramified-hecke-prescription` asks for what an earlier roadmap already provides

   - **Location.** README line 73: "What AdelicAlgebraicGroups must provide (gap:ramified-hecke-prescription): … construct a unitary Hecke character with arbitrarily deep conductor at the other specified places and trivial component at v₀, allowing auxiliary ramification …".
   - **Claim.** No earlier roadmap provides this, so AdelicAlgebraicGroups AA.2 must.
   - **Witness.** GL2AutomorphicRepresentationsAndTransfer R16.1.8 (README line 579; ORDER.txt line 106): finite-image local characters on the full M_v×, v∈S, extend to a finite-image idele-class character, trivial at infinity, allowing auxiliary ramification.
   - **Instance.** Choose finite-order η_v of large conductor at the specified places, η_{v₀}=1, and η_{v₁} on O_{v₁}× with η_{v₁}²χ_{π,v₁} nontrivial on units (a local choice). R16.1.8 then gives a finite-image, hence unitary, global η with exactly these components.
   - **Repair.** Delete the gap from the README and from the plan's `gaps`. Add a supplier subsection citing GL2AutomorphicRepresentationsAndTransfer R16.1.8, and cite it in the §§10.4–10.5 *Needs:* lines. Keep the local choice of η_v as a step of §10.4.

5. **F05** (P2) Two gaps ask AL.3 about nongeneric factors that a later roadmap owns

   - **Location.** README line 79, `gap:gamma-supercuspidal-support`: "For irreducible finite-place GL representations with canonical nongeneric factors …". Line 81, `gap:formal-candidate-products`: "… independence of its global epsilon product from a rational rescaling of the additive character" for an admissible candidate whose components may be nongeneric (§10.4).
   - **Claim.** AutomorphicLFunctionsAndLocalFactors AL.3 is the owner.
   - **Witness.** The canonical nongeneric pair factors are EndoscopicTransferAndUnitaryTraceComparison §10.29 (line 4052; ORDER.txt line 167). AutomorphicLFunctionsAndLocalFactors is at ORDER.txt line 96, and its line 2073 says "no general nongeneric quotient product theorem is asserted". AL.3 would need an upward edge.
   - **Repair.** Address `gamma-supercuspidal-support`, and the nongeneric-ε clause of `formal-candidate-products`, to EndoscopicTransferAndUnitaryTraceComparison §§10.29–10.30. That roadmap owns those factors and their LLC identification, and it precedes this roadmap's new position. Give the source locators the CFK text points to (JPSS83 Theorem 3.1 and Henniart 2002 Proposition 1.9, CFK line 746). Keep the right-convergence clause with AL.4 only if it concerns the parent's own Satake products.

6. **F06** (P2) The archimedean MVW theorem is called "supplied" but MetaplecticAutomorphicForms §3.15 is nonarchimedean only

   - **Location.** README line 448 (§3.2): "For every irreducible admissible π over a characteristic-zero local field, identify the supplied MVW isomorphism class π∘θ≃π∨ in these coordinates". Line 13: "§3.15 owns the MVW involution. They are imported."
   - **Claim.** MetaplecticAutomorphicForms §3.15 supplies π∘θ≅π∨ at every place.
   - **Witness.** MetaplecticAutomorphicForms §3.15 (line 736) covers nonarchimedean characteristic-not-two fields. Its real variants "need their own proof". The README cites no source for the archimedean Casselman–Wallach case, and G2 records that none was read.
   - **Repair.** Say that §3.15 supplies the nonarchimedean case. Make the archimedean Casselman–Wallach statement an explicit target of §3.2 with a legal locator, or declare a gap to AutomorphicFormsOnReductiveGroups §2.7. Delete the process sentence at line 476 ("original proof access is recorded in … §3.2"), which also refers to its own subsection.

7. **F07** (P2) §7.2's functional-equation sign vanishes under the roadmap's own definition of χ_π

   - **Location.** README line 1207 (§7.2): "Generic uniqueness of the trilinear equivariance space in (A.2) gives γ_GL Z_GL=χ_π(−1)^(k−1)Z_GL*." Here π∈Irr(GL_c) (§7.1).
   - **Claim.** The sign factor is χ_π(−1)^(k−1).
   - **Witness.** The Conventions (line 29) and §0.3 set χ_π=1 outside GSpin, so for GL_c the README's identity reads γZ=Z*. CFK (A.3) (CFK line 1910) uses the central-character value π(−1)^(k−1).
   - **Instance.** For c=1, k=2 and π the sign character of ℝ×, CFK gives γZ=−Z*, while the README gives γZ=+Z*.
   - **Repair.** Write ω_π(−1)^(k−1), with ω_π the central character of π∈Irr(GL_c). Add this instance as a Check.

8. **F08** (P2) Several declared gaps are compound or not stated on the supplier's objects

   - **Location.** README lines 53, 99, 103, 93, 81 and 89 (gaps `hermitian-gspin-carriers`, `speh-pole-detection`, `hermitian-automorphic-support`, `archimedean-rectangular-support`, `formal-candidate-products`, `opposite-unipotent-estimate`).
   - **Claim.** Each `needs` is one precise contract.
   - **Witness.** `hermitian-gspin-carriers` bundles U/GU with GSpin. `speh-pole-detection` and `archimedean-rectangular-support` bundle three results each. `hermitian-automorphic-support` bundles two, the second largely AutomorphicSpectralTheory §5.12. `opposite-unipotent-estimate` cites "the doubling open-chart reduction", this roadmap's object.
   - **Repair.** Split each gap into one slug per theorem, with its own hypotheses and the same slugs in README and plan.json.
     - For GSpin, cite the native F-point carriers: Mathlib `lipschitzGroup` and `spinGroup` (Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean, lines 61 and 292) and Tau Ceti `CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι` (TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean, line 138). The gap then asks only for the group-scheme and root-datum part.
     - Cite AutomorphicSpectralTheory §5.12 for the cuspidal-support decomposition, and request only the constituent-of-induction corollary with ordered exponents.
     - State the opposite-unipotent estimate on the supplier's objects, as CFK Lemma 3.22 (CFK line 1455) does: a tempered Levi representation and normalized induction in the positive chamber.

9. **F09** (P3) Supplier section locators that do not resolve as cited

   - **Location.** README "§§SR.2.1–SR.2.4" (13 times, e.g. lines 276, 424, 938); "§SR.5.3, … segment-representations" (line 832); "§§3.3a–3.3b's unitary splitting data" (line 115); "OrthogonalSpinGroups Layer 0 … Clifford" (lines 15, 47); "Remark 4.4(iii)–(iv)" (line 1618).
   - **Witness.** SR.2 ends at SR.2.3 (line 2122); coefficients are SR.0.4. *segment-representations* is SR.5.2 (line 4324). Splittings are MetaplecticAutomorphicForms §3.3. Clifford action is OrthogonalSpinGroups Layer 1 (line 383). The manifest says Remark 4.4(iv).
   - **Repair.** Cite SR.2.1–SR.2.3 and SR.0.4, SR.5.2 *segment-representations* plus SR.5.3 *highest-derivative-adapter*, MetaplecticAutomorphicForms §3.3 (with §3.3b for normalizations) and OrthogonalSpinGroups Layers 0–1. Make the HARRIS locator agree in README and manifest.

10. **F10** (P3) Wrong section and "§§" for single sections in the Lean docstring

   - **Location.** `Suggested.lean` line 19: "Highly ramified local stability (README §§6.9)". Lines 11, 14, 19, 23, 24, 25 and 27 write "§§" before a single section.
   - **Witness.** Stability is README §6.10 (line 1151); §6.9 is tempered holomorphy.
   - **Repair.** Write "README §6.10", and use "§" for single sections.

11. **F11** (P3) Notation and vocabulary

   - **Location.** README line 538 (§4.1, μ a weight tuple); line 692 (§4.8, "χ_alg=|·|_C^μχ₀"); "rectangular model" and "local Speh adapter" (e.g. lines 798, 956).
   - **Witness.** μ means two things in Layer 4, and the §4.8 μ is never tied to §4.2's m. EHLS line 3373 writes χ=‖·‖^m χ₀, so μ=m. MODELS line 94 calls the object the "(k,c) model".
   - **Repair.** Rename the §4.8 exponent and state μ=m. Use "(k,c) model" throughout, or define "rectangular model" once as a synonym. Replace "adapter" with "comparison".

12. **F12** (P3) §5.2 narrows the (k,c) definition below the source

   - **Location.** README line 800: "A (k,c) representation ρ of GL_(kc)(F) is a finite-length admissible representation whose generalized Whittaker support …".
   - **Witness.** MODELS Definition 1 (MODELS line 94) requires only admissibility (admissible Fréchet of moderate growth at infinity, MODELS line 60). Finite length is a property of ρ_c(τ) (MODELS line 219), not part of the definition.
   - **Repair.** Drop "finite-length" from the definition, and keep it as a stated property of ρ_c(τ).

Scope of this review: `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md` (1618 lines, 62 targets in Layers 0–10), `Suggested.lean` (36 lines, no declarations), `metadata.toml`, `sources.toml` (7 sources), with `design/plan.json` read for the declared gaps. Context used: content main at 72d2b66; open-roadmap heads through the roadmap service (AutomorphicLFunctionsAndLocalFactors 5d22a23, MetaplecticAutomorphicForms 22bee85, AutomorphicSpectralTheory c5cfb92, SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII 1383569, AdelicAlgebraicGroups 70c4324, AutomorphicFormsOnReductiveGroups c00e220, EndoscopicTransferAndUnitaryTraceComparison 40d60b6, GeometryOfNumbersAndQuadraticArithmetic 465728d, GL2AutomorphicRepresentationsAndTransfer 69bcab7); pins Mathlib 6b7abb3, Tau Ceti a91d3aa. Supplier line numbers below are README lines at those heads.

Context note: the parent AutomorphicLFunctionsAndLocalFactors is not on content main at 72d2b66; it is an open new-roadmap pull request at `merge-order/ORDER.txt` line 96, before this roadmap's new position. Its sections AL.0–AL.5, *Representation prerequisites* (`GLₙ` isobaric sums), *Strong multiplicity one* and *GLₙ converse theorems* exist as cited. Part II does not re-plan it: the parent contains no doubling, Speh or classical-group material, and §10.3's fixed-η outside-S converse theorem for admissible (possibly nongeneric) candidates differs from the parent's generic full-rank and reduced-rank converse theorems.

## Verified sound

**Principles.**
- No `set_option`, no sorry'd data and no declarations at all.
- No copied passages: the README states every sampled result in its own words.
- No computational algorithms.
- Supply direction: the dependency check below shows no UPWARD or CYCLE line, only `moved:`.
- Part II re-plans neither its parent nor MetaplecticAutomorphicForms §§6.10a–6.11, apart from R03 (Siegel series).

**Dependency check, verbatim.**

    moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 28 roadmaps, 244 edges, 0 problem(s)

**Merge order.** Every cited supplier precedes the new position (after MetaplecticAutomorphicForms, ORDER.txt line 168):

| Supplier | Position |
| --- | --- |
| ReductiveGroupsPartII | line 25 |
| SmoothRepresentationsOfLocalGroups | line 28 |
| AdelicAlgebraicGroups | line 38 |
| AutomorphicFormsOnReductiveGroups | line 80 |
| GeometryOfNumbersAndQuadraticArithmetic | line 82 |
| AutomorphicLFunctionsAndLocalFactors | line 96 |
| AutomorphicSpectralTheory | line 98 |
| GL2AutomorphicRepresentationsAndTransfer (R04) | line 106 |
| EndoscopicTransferAndUnitaryTraceComparison | line 167 |
| ReductiveGroups, OrthogonalSpinGroups, RepresentationTheory/ClassicalGroups | on main |

The roadmaps named only as consumers come later: AutomorphicPadicLFunctionsPartII (line 202) and AutomorphicCongruences (line 248).

**Cross-roadmap citations resolved at the heads (all exist, apart from R05, R06 and R09).**
- MetaplecticAutomorphicForms §§3.2a, 3.3, 3.3a, 3.3b, 3.5, 3.6, 3.7, 3.15, 6.2, 6.10, 6.10a, 6.11.
- AutomorphicLFunctionsAndLocalFactors: AL.0–AL.5, *Representation prerequisites* (isobaric sums, line 271), *Strong multiplicity one*, *GLₙ converse theorems*.
- SmoothRepresentationsOfLocalGroups: SR.0, SR.2.1–SR.2.3, SR.3.3, SR.4, SR.5.2, SR.5.3.
- AdelicAlgebraicGroups §§0.1–0.4, Layer 1, §§2.2–2.3, Layer 2.
- AutomorphicFormsOnReductiveGroups §§2.1–2.7, 3.4, 3.5, 4.1–4.3, 5.3, 5.4, 6.1, 6.2.
- AutomorphicSpectralTheory §§1.1–1.4, 2.1–2.6, 2.3a, 4.14a, Layer 4.
- EndoscopicTransferAndUnitaryTraceComparison §§5.1, 10.29.
- GeometryOfNumbersAndQuadraticArithmetic §2.9. Its `SignedHermitianSpace` and adjoint are stated for any field with involution; only the classification is local.
- ReductiveGroupsPartII RG2.0.1, RG2.0.2, RG2.0a, RG2.4 (adjoint-modulus theorem, line 6408), RG2.5.1, RG2.5.2.
- ReductiveGroups Layer 7; RepresentationTheory/ClassicalGroups Layers 2–3; OrthogonalSpinGroups Layers 0–1.

**Declared gaps.**
- The 13 slugged gaps are identical in README and plan.json, with the same supplier and needs.
- Not already provided (checked):
  - `hermitian-gspin-carriers`: ReductiveGroupsPartII has no unitary group over quadratic étale algebras and no GSpin.
  - `standard-archimedean-transfer`: AutomorphicFormsOnReductiveGroups §2.5 has `recGL` only for `GLₙ(ℝ)`, `GLₙ(ℂ)`.
  - `classical-support-quotient`, `rectangular-orbit-support`, `twisted-square-normalizers`, `controlled-supercuspidal-globalization`: no owner was found in the roadmap search.
- Exceptions: R04, R05 and R08.

**Library declarations opened at the pins.** All six README Mathlib names exist at the cited lines, and the README describes their hypotheses correctly. `#check @` was elaborated for each in a scratch file:

| Declaration | File | Line |
| --- | --- | --- |
| `Matrix.fromBlocks` | Mathlib/Data/Matrix/Block.lean | 45 |
| `Matrix.fromBlocks_multiply` | Mathlib/Data/Matrix/Block.lean | 213 |
| `Matrix.conjTranspose` | Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean | 43 |
| `Matrix.IsHermitian` | Mathlib/LinearAlgebra/Matrix/Hermitian.lean | 44 |
| `Matrix.trace` | Mathlib/LinearAlgebra/Matrix/Trace.lean | 43 |
| `AddChar` | Mathlib/Algebra/Group/AddChar.lean | 70 |

Also opened: `lipschitzGroup` and `spinGroup` (SpinGroup.lean lines 61, 292) and Tau Ceti CliffordGroup.lean line 138 (R08).

**Lean form.**
- `lake env lean` on `Suggested.lean` from the content checkout exits 0 with no output, as expected for a file without declarations. No `TauCeti.*` import needed building.
- The file has a single `import Mathlib`, the namespace `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII`, the "target signatures" docstring and no `set_option`.
- There are no declarations, so the `#check @name` binder check and the one-tactic padding probe have empty domains. Padding: none.
- README and Lean agree: the README has no backticked name of this roadmap's own.

**Headline theorems and statability (17 docstring bullets, matching README line 119).** I checked the pins for each carrier. Tau Ceti has continuous and compact-group representations (`RepresentationTheory/Continuous`, `Compact`), finite-group induction, an algebraic Harish–Chandra projection and `Matrix.specialUnitaryGroup` lemmas. Neither library has smooth admissible representations of p-adic or real reductive groups, automorphic representations of any group, Rankin–Selberg or doubling local factors, or Eisenstein series on adelic groups. Mathlib has `ModularForm` and `IdeleClassGroup` only.

| Headline (README) | Missing carrier at the pins | Statable? |
| --- | --- | --- |
| Siegel Eisenstein continuation (§1.3) | adelic induced families, Eisenstein series | no |
| Unitary local FE, spherical normalization (§§2.2–2.4) | admissible U(V)(F)-representations, induced sections, local factors | no |
| Doubling identity, Garrett pullback (§§3.1–3.3) | cuspidal automorphic representations of U(V) | no |
| Meromorphic unitary standard L (§3.4) | the same, plus local factors | no |
| Holomorphic injection, branching, projection (§§4.3–4.7) | Harish–Chandra modules of U(a,b), holomorphic discrete series | no (a Verma-module encoding would be a long ad hoc stand-in) |
| Critical archimedean nonvanishing and algebraicity (§§4.8–4.10) | archimedean doubling integrals of discrete-series coefficients | no |
| (k,c) models (§§5.1–5.3) | smooth or Casselman–Wallach GL representations, generalized Whittaker functionals | no |
| Generalized local FE and multiplicity one (§§6.1–6.6) | classical-group induction and doubling γ | no |
| Stability (§6.10; docstring says §6.9, R10) | doubling and nongeneric GL factors | no |
| GL pole domination and attainment (§§7.1–7.6) | (k,c) matrix-coefficient integrals | no |
| Speh Eisenstein holomorphy (§§8.1–8.5) | residual Speh data, Eisenstein series | no |
| Global unfolding, FE, strip bounds (§§9.1–9.3) | cuspidal classical automorphic representations, completed L | no |
| Ramified-twist entireness (§9.4) | the same | no |
| Twisted converse theorem (§10.3) | admissible adelic GL_N representations, all-rank Rankin–Selberg | no |
| Weak transfer (§10.4) | cuspidal classical and GL automorphic representations, Satake classes | no |
| Coarse compatibility and local existence (§§10.5–10.6) | local γ on both sides | no |
| Weak transfer for all automorphic π (§10.7) | automorphic cuspidal support, isobaric sums | no |

No statable headline is absent, and none is forced through a stand-in. The declaration-free file is correct.

**Sources: seeded sample, 15 of 15 read at the locator; no locators were flagged as unverified.**

| Target | Source, locator, line | Result |
| --- | --- | --- |
| 0.2 | EHLS §4.1.1–4.1.2, p.44, lines 1862–1884 | P=Stab(V^d), right action, m(A,λ)=diag(λ(A*)⁻¹,A), δ_P=\|det∘Δ\|^n, I(χ,s) all match. The README's skew-adjoint radical is right (see Source issues). GU modulus recomputed. |
| 1.2 | EHLS §4.3.1, (54)–(55), pp.52–53, lines 2209–2258 | χ₁=χ_w, χ₂=χ_w̄⁻¹, row (0,X), right Haar d×X; covariance re-derived by Y=XD and matches ψ_{w,s}δ^{1/2}. |
| 2.1 | EHLS §4.1.4, (49)–(51), pp.46–48, lines 2027–2045; Lemma 4.2.3, p.50, line 2158 | Matrix-coefficient integral and normalized I_v match. The README rejects line 2023 (zero pairing forces vanishing), correctly: fixed f is not diagonal-invariant (S₃ example, recorded E19). |
| 2.2 | EHLS (53), p.49, lines 2094–2099 | Denominator product matches. |
| 2.3 | EHLS §4.2.1, pp.48–49 | Split rank-one integral recomputed from the Iwasawa decomposition of ι(g,1)=(1/2)[[g+1,g−1],[g−1,g+1]]: Z=1/(1−X)+Y/(1−Y) with X=βχ_w̄(ϖ)⁻¹q^(−s−1/2), Y=β⁻¹χ_w(ϖ)⁻¹q^(−s−1/2). This confirms χ⁻¹ (recorded E21). |
| 3.4 | EHLS §§4.1.4–4.2.1, pp.45–49 | EHLS supports only the partial Euler product and its continuation. The completed FE comes from MetaplecticAutomorphicForms §6.10a, as the README says. |
| 4.3 | EHLS Lemma 4.4.4, p.74, line 3436 | Statement and proof (free rank one, irreducible, nonzero) match. |
| 4.5 | EHLS (93)–(95), p.73, lines 3399–3409 | Read literally as κ, tuple (94) fails strong positivity: at n=2, a=b=1, m=2, r=s=0, κ_a−κ₁ᶜ=−4<2. The README's dual reading gives 4≥2, so its dictionary is forced (recorded E36). |
| 4.7 | EHLS Corollary 4.4.9, pp.76–77, lines 3537–3561 | Nonzero P∈E(τ,χ)×; the triangular expansion has U(p⁺) coefficients; both match. |
| 4.8 | EHLS Lemma 4.5.2, Remark 4.5.3, (107), p.80, lines 3680–3686 | (107) matches. EHLS states ι(D²)⊂I(m−n/2,χ) while (107) uses I(χ_u,m); the README leaves s_crit as a target (recorded E33). |
| 5.2 | MODELS Definition 1 (line 94), (2.2)–(2.6), Theorem 4 (line 183), p.6 (line 219), Lemma 12 (line 467, p.11); CFK §3.1, pp.11–12 | All match except R12. Lemma 12 gives the χ_τ∘det stabilizer character. |
| 5.6 | CFK Lemmas 3.13–3.14, (3.19)–(3.22), pp.19–20, lines 779–821; Lemma 3.22, p.32, line 1455 | Bounds, uniform seminorm and Schwartz factors match. |
| 6.4 | CFK §3.4, (3.5), p.15, lines 595–610 | Target V(1−s,χ_π⁻¹τ∨,c), C(s), M* match. |
| 6.6 | CFK Theorem 3.5, (3.8)–(3.14), pp.16–17, lines 634–668 | All seven properties match, including the ψ_b factor χ_π(b)^(k⌊c/2⌋)τ(bI_k)^N\|b\|^(kN(s−1/2)). |
| 7.2 | CFK Theorems A.1–A.2, (A.2)–(A.3), pp.43–44, lines 1882–1946 | Z*, the left half-plane, multiplicativity and the γ_RS comparison match; the sign is R07. |

Also checked outside the sample:
- CFK §3.3, lines 491–560: the GSpin kernel (C•G)△, δe(g,ιg)δ⁻¹∈M_P, Example 3.1's character and the definitions of V(s,τ,c) and Z.
- CFK (3.15)–(3.17), Theorems 3.7–3.12 and (3.18), lines 671–763: these support §§6.7–6.10, 7.6 and 10.2 as written. The generic-τ restriction is recorded E7.
- EHLS (88)–(92), lines 3286–3386.

**Adversarial pass: one row per target, with computed values.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. \|·\|_E | E=ℂ/ℝ, z=2; split (x,y) | \|2\|_ℂ=4; \|(x,y)\|=\|xy\| | holds | none |
| Conv. s_U, z | s=1/4 | z=3/4, 1−z=1/4, so s→−1/4 | holds | none |
| Conv. C_G^• | GSpin₂ | dim center 2, dim C^• 1, quotient 1 | holds | none |
| 0.1 doubled space | h=1, n=1; V=0 | h_W((1,−1),(1,1))=2, h_W((1,1),(1,1))=0; (3,1)→(1,2)→(3,1); W=0 | holds | none |
| 0.2 modulus | n=1, \|B\|_E=4, λ=1; B=2I, λ=4 over ℂ | 1/4; 4^(n²)·4^(−n²)=1; scalar tI with λ=tt̄ gives 1 | holds | none |
| 0.3 degrees | Sp₂, SO₃, GSpin₃, GSpin₅ | N=3, 2, 2, 4; det of tI₄ in GSp₄ is t⁴=χ² | holds | none |
| 1.1 I_EHLS | n=1, s=0, \|B\|_E=4 | δ_mod^(1/2)=1/2; χ=\|·\|_E gives 2 | holds | none |
| 1.2 Godement section | n=1, p=diag(4,1), s=0, ℝ | χ₂(4)\|4\|^(1/2)=2; covariance by Y=XD | holds (Check assumes the real place, as at line 307) | none |
| 1.3 Siegel continuation | n=2, χ∘det | discrete 1-dimensional inducing datum; AST §2.4 applies | stated obstruction false | R03 |
| 2.1 Z_U | compact group of mass 7, f=1, pairing 2; pairing 2 with Z=6, then ℓ→5ℓ | Z=14, I=7; pairing 10, Z=30, I=3 (unchanged) | holds | none |
| 2.2 d_n | q=2, χ=1, η(ϖ)=−1 | d₁(0)=2, d₂(0)=(4/3)(2/3)=8/9; η→1 gives 8/3; recursion 4/3·2/3 | holds | none |
| 2.3 spherical identity | split n=1, X=1/2, Y=1/3 | Z=5/2, d₁=6/5, d₁Z=3=(1−X)⁻¹(1−Y)⁻¹ | holds | none |
| 2.4 local FE | s=1/4 | reflection s→−s; normalized operator with (χ⁻¹,ψ⁻¹) composes to the identity on parameters | holds | none |
| 3.1 doubling identity | S₃ standard representation, v=(1,−1,0), ℓ=x₃ | ℓ(v)=0, ℓ((23)v)=−1 | zero pairing does not force vanishing; consistent with E19 | none |
| 3.2 MVW | U(1), z=i, z=e^(iπ/6) | θ(z)=z̄; z²→z⁻²: −1=−1; e^(iπ/3) vs e^(−iπ/3) | holds nonarchimedean; archimedean has no owner | R06 |
| 3.3 Garrett map | χ of order 3 | χ(g)=ζ₃ vs χ⁻¹(g)=ζ₃² | holds | none |
| 3.4 unitary L | partial product, z↔1−z | s↔−s | holds | none |
| 4.1 strong positivity | a=b=1, κ=(1;−1); (0;0) | μ=(0,0) dominant, gap 2; (0;0) has gap 0<2 | holds | none |
| 4.2 scalar model | n=1, m=2, a=b=0 | Λ=(2;−2), dual (−2;2); 2m−a−b=4≥2 | holds | none |
| 4.3 injectivity | same | J_χ(1)=1≠0, D² irreducible, so injective | holds | none |
| 4.4 Cauchy | u=2, d=2; g₁h₁ | 10=3²+1²; (g₁h₁)⁻¹=[[1,−1],[−1,2]]; (h₁g₁)⁻¹=[[2,−1],[−1,1]] | holds | none |
| 4.5 branching | n=2, a=b=1, m=2, r=s=0 | README κ=(2;−2), gap 4≥2; literal (94) gap −4 | README reading forced | none |
| 4.6 raising operator | a=2, r=(1,1); A=[[1,2],[3,4]] | symbol Δ₂, degree 2=Σr_i; Δ₂(A)=−2, Δ₁²(A)=1 | holds | none |
| 4.7 projection | r=s=0 | δ=1, projection of v_χ to its own line is nonzero | holds | none |
| 4.8 critical section | μ=3, a=2, b=0, z=2 | t=2; 4³·2⁻²=16=4² | holds; μ notation | R11 |
| 4.9 nonvanishing | disk, m=2 | ∫(1−\|z\|²)^(m−2)dxdy=π/(m−1)=π≠0 | holds | none |
| 4.10 algebraicity | same | π^(−1)·π=1∈ℚ×; 2dz doubles both sides | holds | none |
| 5.1 ψ_(k,c) | k=3, c=1, (1,·,2)(3,·,4) | adjacent trace 10, cross term 4 excluded; k=c=2 with diag(1,2) gives ψ(3) | holds | none |
| 5.2 (k,c) model | k=1, c=2, τ=1 | ρ₂(1)=1∘det, Hom dimension 1, GL₂ Whittaker dimension 0 | holds | R12 |
| 5.3 root elimination | k=2, c=3, l=1; c=2, k=2 | exponent (6−2−3+1)/2=1; order (1,3,2,4) | holds | none |
| 5.4 geometric datum | Sp₂, k=2; GSpin | ψ(1+2)=ψ(3); e(z,z)=1 (CFK line 499) | holds | none |
| 5.5 sections | s=1/2; (1−q^(−s))⁻¹ | \|det\|⁰=1; pole at s=0 | holds | none |
| 5.6 bounds | GL₂ unramified W | W(diag(ϖ^m,1))=0 for m<0, O(q^(−m/2)(m+1)) for m≥0 | holds | none |
| 6.1 Z | k=1 | U₀=1, integrand ω(g)f(δe₂(ιg)) | holds | none |
| 6.2 continuation | SO₂, k=1, unramified, q=2, s=1 | Z=L/b=(1−q^(−2s))/(1−q^(−s))²=3, rational in q^(−s) | holds | none |
| 6.3 multiplicity one | π₁=π₂=π | dim Hom_G(π∨,π^ι)=1 | holds | none |
| 6.4 M* | λ→e^s λ | C changes by e^(2s−1), e^(−1) at s=0 | holds | none |
| 6.5 γ, θ | c=2, k=1, s=1 | θ=\|2\|^(1−2s): 2 over ℚ₂, 1 over ℚ₃; Sp₀: (1−q^(−s))/(1−q^(s−1)) | holds | none |
| 6.6 identities | duality applied twice; ψ_b | γ(s)γ(1−s,∨,ψ⁻¹)=1; (s,τ)→(1−s,χ⁻¹τ∨)→(s,τ) | holds | none |
| 6.7 L, ε | P=1−2X; b=1/4 | L=(1−2q^(−s))⁻¹; L(s+1/4)L(s−1/4) | holds | none |
| 6.8 denominator | c=2, χ_π=1; rank-one τ | b=L(2s,Sym²)L(2s+1,∧²); ∧²=0; extra L(s+1,τ) for Sp₂ | holds | none |
| 6.9 holomorphy | SO₂ tempered μ, τ=1 | poles at \|q^(−s)\|=1, i.e. Re s=0 only | holds | none |
| 6.10 stability | SO₂ (μ) vs Π=μ⊕μ⁻¹, η deep | L(s,μη)=L(s,μ⁻¹η)=1 | holds; owner wording | R02 |
| 7.1 Z_GL | (k,c)=(1,2),(2,1),(1,1) | exponent s+1/2, s−1/2; ∫\|g\|^s with tails q^(−ms), m∈ℤ, diverges | holds | none |
| 7.2 aux FE | c=1, k=2, π=sgn | CFK: γZ=−Z*; README convention: +Z* | false as written | R07 |
| 7.3 gcd | {P⁻¹,XP⁻¹}, P=1−X/2; {t⁻¹,t⁻²} | gcd P⁻¹, pole order 1 at X=2; order 2 | holds | none |
| 7.4 RS attainment | L_RS=t⁻¹, 𝔏=t⁻² | L_RS/𝔏=t entire | holds | none |
| 7.5 open chart | k=2, c=3, l=1 | determinant shift 1 | holds | none |
| 7.6 pole attainment | L=t⁻¹, Z=t⁻² | ord Z=−2≤−1=ord L | holds; k=1 unowned | R02 |
| 8.1 Speh Eisenstein | s_G=1/2 | s_E=0 | holds | none |
| 8.2 constant term | c=2 | M₁ holomorphic for Re s>−1/2, N₂ for Re s>0 | consistent | none |
| 8.3 residual exponents | c=2, Re s₀=1/4 | e₁=−3/4, tail ≤1/4, partial sums ≤−3/4, −1/2; bound −jRe s₀−(c−j)/2 | holds | none |
| 8.4 holomorphy | k=1, τ=1, θ quadratic | τ≇θτ∨\|·\|^(it) for all t | hypothesis non-vacuous | none |
| 8.5 normalizer | c=2, s=1/2 | L(2s,Sym²τ) at 1 has a pole only if τ is essentially self-dual (excluded) | holds | none |
| 9.1 Euler identity | SO₂, q=2, s=1 | b_v=4/3, Z_v=3, b_vZ_v=4=L_v=(1−1/2)⁻² | holds | none |
| 9.2 completed L | F=ℚ, b=2 | \|2\|_∞\|2\|₂=1; idele (2,1,1,…) has norm 2 | holds | none |
| 9.3 FE | SO₂ trivial, τ=1 | Λ(s)²=Λ(1−s)², ε=1 | holds | none |
| 9.4 entireness | ord Q=−1, ord b^S Z=0 | ord L=1≥0 | holds | none |
| 10.1 weak transfer | Sp₂; two GL₁ summands | GL₃; 1−(a+b)T+abT² | holds | none |
| 10.2 coarse transfer | GL₂ trivial vs Steinberg | γ ratio [(1−x)/(1−1/x)]/(−x)=1 with x=q^(1/2−s); L differ by L(s−1/2) | holds | none |
| 10.3 converse | N=2, 3 | ranks {1}, {1,2} | holds | none |
| 10.4 weak transfer | c>1 | excludes Sp₀, SO₁, GSpin₁ tails | holds | R04 (supplier) |
| 10.5 coarse at all places | GSpin central character | ω_Π=χ_π^(N/2); 1 for Sp/SO | holds | R05 (supplier) |
| 10.6 local existence | unramified π | T(π) coarse (CFK Theorem 3.7) | holds | none |
| 10.7 general π | Sp_c, SO_(2n), SO_(2n+1) Levi | N=2l+N(G_(c−2l)) in each family | holds | none |

## Not verifiable

- **Strict or weak inequalities in EHLS (89) and (95).** The text extraction prints ">". I decided ≥ from consistency (the r=s=0 branch must occur, and weight-2 discrete series is cohomological), not from the glyph.
- **Harris 1997, (3.3.2) notation** for Λ ("highest U-type"): the text is not in the manifest. The dual dictionary of §§4.2 and 4.5 is supported by the strong-positivity computation above, not by that text.
- **Proofs CFK cites but does not reproduce**: the CFK local-theory paper (GAFA 32, paywalled, recorded in G4), Kaplan's Theorem 25, Yamana's Theorem 7.1, JPSS83 Theorem 3.1, Henniart 2002 Proposition 1.9, Lapid–Rallis 2005, Li 1992 and MVW 1987. None is cited by the README as a source; the README cites the seven texts above. I fetched nothing and added no `[[missing]]` entry: the brief's sample needs only cached texts.
- **Ownership against open pull requests** was checked by object search over the 331 open heads and main, and over board packages present in the checkout (README or design README). Designs absent from the checkout (e.g. TwistedAutomorphicDescents has a design only) could not be read beyond their design README. No other owner of generalized doubling, (k,c) models, weak or coarse standard transfer, or the Garrett pullback was found.

## Source issues

- **Misprint** in EHLS at §4.1.1, printed p.44: the source says a basis identifies the Siegel unipotent radical with n×n Hermitian matrices; it should be skew-adjoint blocks for W=V⊕(−V) and that polarization, Hermitian only after a trace-zero scalar; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bf850fe", "job": "REV-PKG-AutomorphicLFunctionsAndLocalFactorsPartII", "model": "opus", "worker": "fable-rev40"} -->
