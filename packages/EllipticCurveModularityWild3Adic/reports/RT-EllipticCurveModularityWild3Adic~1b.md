<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/135#issuecomment-6335952247 -->
Red team round 1 pass b (claude) of c2a3102

Verdict: needs_changes

1. **F01** (P3) Suggested.lean does not elaborate at the roadmap repository's pins

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:2`: “import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup”; also `:108`, `:336`, `:346`–`:351`, `:371`, `:376`, `:415`–`:417`, `:421`–`:423`.

   **Claim:** The file is submitted as elaborating with only `sorry` warnings. At the pins of the roadmap repository (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`) it does not: one import names a module that does not exist at the Tau Ceti pin, and eight declarations fail once the Tau Ceti imports are dropped. The parse failure in `sixSixFiltration` is the serious one: the second generator of the span elaborates to `sorry`, so the definition silently becomes sorry'd data and the example at `:421` tests `![1, u⁶] ∈ span {![u⁶, 0], sorry}`.

   **Witness:** At the pinned Tau Ceti, `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup` is a directory (`Basic.lean`, `Extension.lean`, …) with no `AbsoluteGaloisGroup.lean` beside it, so `lake env lean` on a probe copy stops at line 1 with “object file … does not exist”. On a probe copy without the three `TauCeti.*` imports (line numbers below are the submitted file's): `:108` unsolved goal `1 = - -1` after `simp`; `:336` `linear_combination hA` fails (`ring` fails on `ZMod 3` at this Mathlib; even `example (x : ZMod 3) : - -x - x = 0 := by ring` fails in a probe); `:346`/`:349` `map_add'`/`map_smul'` of `adjointKernelEmbedding` leave `-(v 1 + w 1) * 2⁻¹ = 2⁻¹ * -v 1 + 2⁻¹ * -w 1`; `:371`, `:376` `simp [cPi]` leaves `-1 = -1`; `:417` “unexpected token; expected ']'” (the `![…]` continued on the next line), and `:421` then fails with goal `… ∨ uVar 36 ^ 6 = sorry ()`. The 22 other proved examples and all `sorry`'d theorems elaborate; `exit 1` overall.

   **Exact repair text:** Remove the three `TauCeti.*` imports (pass a F15). Then, each verified in a probe copy at the roadmap repository's pins:

   ```lean
   example : ExtendedCharacterFrobeniusCondition (-1 : ZMod 3) 1 := by
     unfold ExtendedCharacterFrobeniusCondition; decide

   theorem thetaOne_eq_neg_thetaOmega (A : M2) (hA : Matrix.trace A = 0) :
       thetaOneDiagonal A = -thetaOmegaDiagonal A := by
     rw [Matrix.trace_fin_two] at hA
     exact eq_neg_of_add_eq_zero_right hA

   /-- README 2.9(1): the embedding `ρ̄ ⊗ χ → ad⁰ρ̄`, `(x, y) ↦ (-y/2, x; 0, y/2)`; over `𝔽₃`,
   `-1/2 = 1` and `1/2 = -1`, so the matrix is `(y, x; 0, -y)`. -/
   def adjointKernelEmbedding : (Fin 2 → F3) →ₗ[F3] M2 where
     toFun v := !![v 1, v 0; 0, -(v 1)]
     map_add' v w := by
       ext i j
       fin_cases i <;> fin_cases j <;> simp [Matrix.add_apply] <;> exact neg_add _ _
     map_smul' c v := by
       ext i j
       fin_cases i <;> fin_cases j <;> simp [Matrix.smul_apply] <;> exact (mul_neg _ _).symm

   example : (X ^ 2 - C 1 : F3[X]).eval 0 = -1 ∧ (cPi (X ^ 2 - C 1)).eval 0 = 1 := by
     simp [cPi]; rfl
   example : (cPi (X ^ 2 + C 1)).eval 0 = -1 := by
     simp [cPi]; rfl

   def sixSixFiltration (c c' : F3) : Submodule (BreuilScalars 36) (Fin 2 → BreuilScalars 36) :=
     Submodule.span _
       {![uVar 36 ^ 6, 0], ![(c : BreuilScalars 36) + (c' : BreuilScalars 36) * uVar 36 ^ 4, uVar 36 ^ 6]}
   ```

   (`range_adjointKernelEmbedding` typechecks unchanged against the new definition; the `:421` example passes once the span parses.) For the four admitted examples of pass a F01, these proofs were verified at the same pins and can be dropped in:

   ```lean
   example (π j : Q3bar) (hπ : π ^ 3 - 3 * π ^ 2 + 6 = 0) (hj : j ^ 2 = -1) :
       aeval ((j * π ^ 2 - π + 3 * (1 - j)) / 2) nonabelianCubicPoly = 0 := by
     simp only [nonabelianCubicPoly, map_sub, map_add, map_pow, map_mul, aeval_X, map_ofNat]
     linear_combination
       ((-1/8 : Q3bar) + (3/4) * π + (3/8) * π ^ 2 + (9/8) * j + (3/8) * j * π
         - (3/8) * j * π ^ 2 - (1/8) * j * π ^ 3) * hπ
       + ((27/8 : Q3bar) - (27/8) * π - (9/4) * π ^ 2 + (9/4) * π ^ 3 + (3/8) * π ^ 4
         - (3/8) * π ^ 5 - (27/8) * j + (27/8) * j * π ^ 2 - (9/8) * j * π ^ 4
         + (1/8) * j * π ^ 6) * hj

   example : (9 : ℤ) % 9 = 0 ∧ (-3 + 3 : ℤ) % 9 = 0 ∧ padicValInt 3 (-50544) = 5 := by
     refine ⟨by norm_num, by norm_num, ?_⟩
     rw [padicValInt, Int.natAbs_neg, show (Int.natAbs 50544) = 3 ^ 5 * 208 by norm_num,
       padicValNat.mul (by norm_num) (by norm_num), padicValNat.prime_pow,
       padicValNat.eq_zero_of_not_dvd (by norm_num)]

   example : (∃ j : GaloisField 3 2, j ^ 2 = -1) ∧ ¬ ∃ j : F3, j ^ 2 = -1 := by
     constructor
     · have : Fintype (GaloisField 3 2) := Fintype.ofFinite _
       have h := FiniteField.isSquare_neg_one_iff (F := GaloisField 3 2)
       rw [Fintype.card_eq_nat_card, GaloisField.card 3 2 (by norm_num)] at h
       obtain ⟨j, hj⟩ := h.mpr (by norm_num)
       exact ⟨j, by rw [hj]; ring⟩
     · decide

   example : artinFrobenius 2 (algebraMap _ _ (tVar 2)) = algebraMap _ _ (tVar 2) ∧
       tVar 2 ^ 3 = 0 := by
     refine ⟨(artinFrobenius 2).commutes _, ?_⟩
     have h : tVar 2 ^ 2 = 0 := by
       rw [tVar, AdjoinRoot.root, ← map_pow, AdjoinRoot.mk_self]
     rw [pow_succ, h, zero_mul]
   ```

2. **F02** (P3) The norm congruence in the 1.14 proof sketch holds only for `B ≡ −3 mod 27`

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:509`: “Since `N_{F/ℚ₃(√−3)}(ϖ) ≡ √−3(1 − 3√−3) mod 9√−3`, reciprocity gives”.

   **Claim:** The theorem is stated for every minimal `Y² = X³ + AX + B` with `A ≡ B + 3 ≡ 0 mod 9`, but the displayed congruence, copied from the source, is false for most of them. With `β² = −√−3` and `α³ + Aα + B = 9√−3`, `N(β) = −3√−3` and `N(α) = (9√−3 − B)²` over `ℚ₃(√−3)`, so `N(ϖ) = √−3·(1 − 3√−3)·(1 − 2(B + 3)/3)` modulo `9√−3·𝒪`; the extra unit lies in `1 + 3ℤ₃` and is killed by the character (`4 ↦ 1`), so `δ = 1` still follows, but the sentence as written is a wrong intermediate claim.

   **Witness:** `B = −12` (`A = 9`): `N(ϖ) = √−3(−11 + 24√−3) ≡ √−3(7 − 3√−3) mod 9√−3`, not `√−3(1 − 3√−3)`; `B = 6` gives `√−3(4 − 3√−3)`. The printed form is BCDT line 1151 (p. 866), correct there only because the running example has `B ≡ −3 mod 27`.

   **Exact repair text:** Replace the clause by: “Since `N_{F/ℚ₃(√−3)}(ϖ) = (9√−3 − B)²/(−3√−3) ≡ √−3(1 − 3√−3)(1 − 2(B + 3)/3) mod 9√−3·𝒪`, and the unit `1 − 2(B + 3)/3 ∈ 1 + 3ℤ₃` is in the kernel of the character (`4 ↦ 1`), reciprocity gives”. Add the Check: “`Y² = X³ + 9X − 12` is in the family; `N(ϖ) ≡ √−3(7 − 3√−3) mod 9√−3`, and `7 ∈ 1 + 3ℤ₃` contributes nothing to the trace, so `δ = 1` again. The congruence as printed in the source holds only for `B ≡ −3 mod 27`.”

3. **F03** (P3) The “Theorem 5.2.1” misprint note is not in the cited published text

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:623`: “In the proof of Lemma 5.7.1 the cross-reference to "Theorem 5.2.1" means Lemma 5.2.1(5).”

   **Claim:** The README fixes locators to the published version (line 47), and the published proof of Lemma 5.7.1 cites “Lemma 5.2.1”; the string “Theorem 5.2.1” occurs nowhere in the cached published copy. The note corrects a misprint that the cited text does not contain.

   **Witness:** BCDT line 2689 (p. 898, proof of Lemma 5.7.1) reads “By Lemma 5.2.1 …”; a search of the whole cached copy for “Theorem 5.2.1” returns nothing.

   **Exact repair text:** Delete the sentence “In the proof of Lemma 5.7.1 the cross-reference to "Theorem 5.2.1" means Lemma 5.2.1(5).” (If the note was taken from the author copy, say so explicitly: “the author copy writes "Theorem 5.2.1" for Lemma 5.2.1(5)”.)

4. **F04** (P3) `extendedTypeField_pi_pow_twelve` is a target but follows from its hypotheses by field arithmetic

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:211`–`:214`: “theorem extendedTypeField_pi_pow_twelve … (α / β) ^ 12 = -3 * (1 + 3 * (i.val : Q3bar)) ^ 4 := by sorry”.

   **Claim:** Not one tactic, but a ten-line proof from the pinned Mathlib with no field-theoretic input (`β ≠ 0` from `β² = −s`, `s² = −3`; then `div_eq_iff` and one `linear_combination`). It should be proved rather than listed as a target, like `negativeQuadratic_shifted_root`.

   **Witness:** The proof below elaborates in a probe copy at the roadmap repository's pins.

   **Exact repair text:**

   ```lean
   theorem extendedTypeField_pi_pow_twelve (i : Fin 3) (s α β : Q3bar) (hs : s ^ 2 = -3)
       (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar))) (hβ : β ^ 2 = -s) :
       (α / β) ^ 12 = -3 * (1 + 3 * (i.val : Q3bar)) ^ 4 := by
     have hs0 : s ≠ 0 := by rintro rfl; norm_num at hs
     have hβ0 : β ≠ 0 := by
       rintro rfl
       apply hs0
       linear_combination hβ
     have h1 : α ^ 12 = (α ^ 3) ^ 4 := by ring
     have h2 : β ^ 12 = (β ^ 2) ^ 6 := by ring
     rw [div_pow, h1, h2, hα, hβ, div_eq_iff (pow_ne_zero _ (neg_ne_zero.mpr hs0))]
     linear_combination 3 * (1 + 3 * (i.val : Q3bar)) ^ 4 * (s ^ 4 - 3 * s ^ 2 + 9) * hs
   ```

## Verified sound

Read all 1,372 README lines (82 bold targets in 76 numbered sections, 221 Check bullets) and all 561 Suggested.lean lines (90 declarations: 29 defs, 7 abbrevs, 24 theorems, 26 examples, 4 local instances). No `set_option`, no `lemma`, no process words, no issue or PR numbers, no `gap:` contracts, no `def := sorry` (apart from the parse artefact of F01). Title has no proper names needing capitals.

Elaboration: as submitted, fails at line 1 (import of a module absent at the Tau Ceti pin, F01). Without the three `TauCeti.*` imports (all unused, pass a F15): 19 `sorry` warnings from the stated theorems, 4 from the admitted examples (pass a F01), and the 8 errors of F01; the 22 other proved examples, the two `IsElliptic` instances, `card_GL2_F3`, `artinFrobenius` and `cartan_element_sq` elaborate. Trivial-proof probe: 20 sorried theorems tried by inspection; only `extendedTypeField_pi_pow_twelve` closes (F04); the GL₂(𝔽₃) subgroup facts, cardinalities, Galois-group and finrank statements, `range_adjointKernelEmbedding` and the annihilator step need real proofs. Adversarial reading of the 20 sorried theorems: all true as typed (valuation argument for `three_not_unit_mod_cubes`; degree 3/6/24 by ramification indices 3, 4 and 12; index-two subgroup of `GL₂(𝔽₃)` from its abelianization `ℤ/2`; the `nsmul_three_eq_zero_of_frobenius_sq` argument `9x = 0 ⇒ 3Fx = F(3x) = 0 ⇒ F²x = 0 ⇒ 3x = 0` reconstructed; the `(ℤ/9)²` control is sharp).

Checks recomputed: the six companion discriminants `64, −25920, −5184, −3456, −17280, −50544` and `v₃(50544) = 5`; `(c₄, Δ, j)` of `[1,1,1,−3,1]` and `[1,1,1,3,−5]` as `(145, −800, −121945/32)` and `(−143, −17576, 1331/8)`, i.e. `−5·29³/2⁵` and `(11/2)³`; the Tate normal form `t = 11` has `Δ = −11⁵` (11a1, with `ℤ/5 ⊕ μ₅` torsion); `|GL₂(𝔽₃)| = 48`, Borel orders 12 and 80; conjugates `π² − 2π`, `3 + π − π²` of the cyclic cubic and the root `(jπ² − π + 3(1 − j))/2` with `H_{γ₃} = ((j − 1)u² + (3 − j)u − 2)/4` (numerically, all root/sign choices); discriminants `81`, `−324`, `−1620`; the 1.5 formula for `γ₃(α)` is a root for both signs of `s` and `q`; `N(α/β) = 3`, `N(1 + α) = 5⁴`, `N((α − 1)/β) = −3`, `s = −π⁶/(1 + 3ĩ)²` giving the 1.7 `H_{γ₃}`; `π¹² = −3(1 + 3ĩ)⁴`; `4` generates `(1 + 3ℤ₃)/(1 + 9ℤ₃)`; the three ramified cubic norm lines `⟨3⟩, ⟨6⟩ = ⟨3·4²⟩, ⟨12⟩`; conductor exponents 4, 4, 3, 3, 5 of tags 2–6; `Y² = X³ − X − 1` has no affine `𝔽₃`-point and the substitution in 1.14 does give it; `1.8(3)` `β² = −3`; `b = −1/2 ≡ 4 mod 9` and `j(y² = x³ + 9x − 3)` 3-integral in 1.12; the 0.6/0.7 admittance selections `(n, m) = (2, 1)` and `m = 0`.

Locators verified against the cached legal copies (28): BCDT Lemma 1.2.1 line 536 p. 853; Lemma 2.1.1 line 934 p. 861; Lemma 2.1.3 line 949, Lemma 2.1.5 line 963, Theorem 2.2.1 line 985 p. 862; Theorem 2.2.2 line 1119 p. 865; Lemma 2.3.1 lines 1141–1158 pp. 865–866 (statement, field, substitution, trace, norm as in README); Corollary 2.3.2 line 1160 with the `GL₃` misprint; Theorem 4.4.1 line 1625 p. 875; Theorem 4.5.1 line 1677 p. 877; Theorem 4.6.3 line 1728 p. 878 with the “any N ≥ 1” nontriviality clause; Corollary 4.6.4 lines 1741–1779 pp. 878–879 with the `F = 3F′` step at line 1777; Lemma 4.7.1 line 1911 and Corollary 4.7.2 line 1926 p. 882 (Serre citation at line 1925); Theorems 4.7.3–4.7.5 lines 1936–1941 p. 882; Theorem 5.1.3 line 2057; Lemma 5.5.1 line 2467 p. 894; Lemma 5.7.1 line 2678 pp. 898–899; §6.3 “order 3” for `γ₄²` at lines 2785 and 2840 (two places, as the README says) against “order 2” at line 2813; §6.4 `α³ = 4` line 2841 and “π = α/β is a uniformiser” line 2865, with `N((α − 1)/β) = −3` at line 2846; §6.5 norm generators line 2891 and `N(α/β) = −3(1 + 3ĩ)⁴` line 2899; Lemma 7.2.1 line 2967 p. 904; Lemma 7.2.2 line 3026 p. 905; Lemma 8.1.1 line 3280; Proposition 8.2.1 line 3339; the “hence Theorem 4.4.1” slip at line 3587 (§8.3 end); Proposition 9.2.1 line 3669; CDT Theorem 7.2.1 line 1608, 7.2.2 line 1631, Lemma 7.2.3 line 1658 (`j`-set printed without the sign), 7.2.4 line 1765, Lemma B.4.1 line 2090, Proposition B.4.2 line 2125; Manoharmayum Definition 3.3 lines 447–470 (`WP`/`WT(κ)` by `∛2, ∛3, ∛6, ∛12`; `nr`/`r` = shapes `(1, ∗; 0, χ)` and `(χ, ∗; 0, 1)`, matching README 1.11(3) and 1.12(3)), the `e = 3` list lines 870–881 and Theorem 5.3.2 line 883 p. 751 (congruences `±2, ±4, ±1 mod 9`, `±4, ±13, ±22 mod 27`, norm groups `3·2, 3, 3·4` as in README 1.11), Corollary 4.2.3 line 659 p. 747, Lemma 5.4.1 line 892, the `f = 3` lists lines 971–987 and the `f = 5` table lines 992–1003 pp. 752–753 (all twelve congruence entries of the README table agree), Theorem 5.4.2 line 1005 p. 753; SBT Lemma 1.1 line 102 (`ℙ¹/ℚ`), the Tate-normal-form curve line 105, `SL5(F5)` line 118, Theorem 1.2 line 123, the level-4 remark line 142; DDT Remark 3.6 line 3265 p. 88, Theorem 3.9 line 3292, Definition 3.12 line 3302 p. 89, Theorem 3.14 line 3316 p. 90; Elkies (150)–(153) lines 2477–2499 p. 54; Cremona rows lines 131 and 1384. Page arithmetic checked against the `=== page N ===` markers with printed = PDF + 842 (BCDT), + 734 (Manoharmayum), = PDF (DDT).

Suppliers: the eight `### From TauCetiRoadmap` suppliers (ClassFieldTheory, LocalGaloisGroups, LocalFieldsRamification, EllipticCurves, ModularCurves, ModularForms, Chebotarev, RepresentationTheory) are all under `TauCetiRoadmap/` on main and none only under `Completed/`; the twelve `### From other roadmaps` suppliers are all in `merge-order/ORDER.txt` (lines 37–126). `EllipticCurveModularityWild3Adic` is absent from `ORDER.txt`, as expected for an imported package. No gaps are declared. Dependency check:

```text
NOT IN ORDER: EllipticCurveModularityWild3Adic (insert it after its last supplier)
depcheck: 9 roadmaps, 81 edges, 1 problem(s)
```

Not re-raised (pass a, codex, round 1): F01 admitted examples (verified proofs supplied under F01 above), F02 pins, F03 missing `sources.toml`, F04 `ℚ₃^{nr}` inclusions, F05 Serre-weight iff, F06 commutativity, F07 matrix Hilbert 90, F08 unramified-character kernel, F09 cross-prime generality, F10 cube-class headline, F11 `S₃₆` versus `S′₃₆`, F12 zero-map Checks, F13 missing mirrors, F14 filtration example, F15 file form and unused imports, F16 unregistered names, F17 admittance separation Check, F18 Part II naming.

## Not verifiable

- `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` and `.Functoriality` exist at the pinned Tau Ceti but their compiled objects are absent in the review environment (addendum); the file was tested without them, which is harmless because nothing in it uses a Tau Ceti name.
- `sources.toml` is absent from the package (pass a F03); locators were checked against the cached copies recorded by the pass-a job's scratch manifest (BCDT publisher copy, CDT/SBT/DDT/Elkies author copies, Manoharmayum publisher copy, Breuil arXiv v1, Cremona data). SBT is an OCR'd scan; its misprint claims rest on OCR.
- Serre, *Corps locaux* XIV §1 Prop. 3 and Berthelot–Breen–Messing 4.2.14: no legal copy in the cache.
- BCDT §6.4 subscript labels (README 1.6 “two Galois-group labels carry the subscript of the positive field”): the extraction drops minus signs, so this cannot be confirmed or refuted.
- The Breuil-module normal forms, descent operators and gauge computations of 3.2–3.7, 4.3–4.5 and 5.1–5.7 (BCDT §§7–9) were read against the source anchors but not recomputed.
- Section and declaration names cited in the twelve suppliers that are only in `ORDER.txt` (not on main) were not checked at their heads.
