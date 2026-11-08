# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at b36567c)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder is unchanged since then (0 changed lines). The gate passes and the mathematics, the sampled locators and the supplier citations hold. One P3 locator defect remains, carried over unrepaired from the previous review.

## R01 (P3) — The library line numbers describe main's pins, not the pins this branch builds against

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:53, 55, 61, 63`. For example, README:61 reads: “`InvertibleSheaf.fixedRankOneEquiv` in `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean`, line 248, … by `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` (line 275)”.

**Claim:** Each “file, line N” locator names the declaration at the pinned Mathlib and Tau Ceti.

**Witness:** This head's `lake-manifest.json` pins Tau Ceti a91d3aa and Mathlib 6b7abb3. There, `FixedRank.lean` has 253 lines, `def fixedRankOneEquiv` is at line 185 and `theorem fixedRankOneEquiv_inverse_obj_obj` is at line 212. Line 275 does not exist.

The eleven numbers below were rechecked this round. Each README value equals main's pin (Tau Ceti 2fd255d, Mathlib 1b1ccf4) and differs from this head's pin.

| Declaration | README | This head's pin (a91d3aa / 6b7abb3) | Main's pin (2fd255d / 1b1ccf4) |
|---|---|---|---|
| `Matrix.card_GL_field` | 122 | 120 | 122 |
| `IsArtinianRing.isNilpotent_jacobson_bot` | 60 | 54 | 60 |
| `IsArtinianRing.isSemisimpleRing_iff_jacobson` | 640 | 641 | 640 |
| `Skeleton` | 114 | 74 | 114 |
| `FiniteLocallyFreeSheaf.FixedRank`, `.pullback` | 71, 106 | 69, 104 | 71, 106 |
| `InvertibleSheaf.trivial` | 144 | 131 | 144 |
| `InvertibleSheaf.eulerDegree` | 74 | 70 | 74 |
| `InvertibleSheaf.fixedRankOneEquiv` | 248 | 185 | 248 |
| `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` | 275 | 212 | 275 |
| `YoungDiagram.armLength`, `legLength` | 131, 135 | 136, 140 | 131, 135 |

The other four locators are correct at both pins: `Finite.isDomain_to_isField` 176, `Indecomposable` 1096, `ObjectProperty.FullSubcategory` 39 and `Scheme.Modules.eulerCharBelow` 105.

**Exact repair:** Use one of these two options; the first is preferred.
- **Rebase or merge the branch onto main.** The pull request does not touch `lake-manifest.json`, so it then pins Tau Ceti 2fd255d and Mathlib 1b1ccf4, where every README number above is right. Rerun the gate's targeted build at those pins. No README edit is needed.
- **Keep this base.** Write the numbers in the “This head's pin” column: 120, 54, 641, 74; 69 and 104; 131; 70; 185; 212; 136 and 140.

**Repair test:** On the refuting instance, `grep -n` finds `def fixedRankOneEquiv` at line 248 and `theorem fixedRankOneEquiv_inverse_obj_obj` at line 275 at 2fd255d. At a91d3aa it finds them at lines 185 and 212. Either repair makes README:61 name the right declaration at the pins the branch builds against.

## Previous findings

- **R01 of PRREVIEW~6 (library line numbers at the wrong pins): not repaired.** The folder diff since that review is empty, and README:61 still reads “line 248 … (line 275)”. It is carried over as R01 above, with every number re-verified. No repair report marks it as not actionable.
- **R01 of PRREVIEW~4 (King's criterion in the plan's `reductive-character-git`):** this stays settled as PRREVIEW~5 left it. `plan.json` cannot change after the design, and README:103 states the narrower contract. It is not raised.

## Verified sound

### Gate, dependency check, elaboration, signatures, probes

- **Gate, my run at b36567c:**
  ```text
  gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's gate on this head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check, verbatim:**
  ```text
  depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
  ```
  It shows no UPWARD, CYCLE or `moved:` line. Every supplier is on main or earlier in the merge order. ReductiveGroupsPartII, SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicVectorBundles and RepresentationTheory are on main. None of the forbidden suppliers is cited.
- **Elaboration:** `lake env lean` on `Suggested.lean` at a91d3aa/6b7abb3 exits 0. The only warnings are the two `sorry` warnings, at lines 89 and 99.
- **Signatures:** I elaborated `#check @` on all five declarations in a scratch copy; their types are unchanged.
  - `bundleDegree`, `IsAbsolutelyIndecomposable` and `absIndecCount` keep `k [Field k] (X : Scheme) [X.Over (Spec k)]`.
  - `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`.
  - `absIndecCount_eq_of_degree` keeps `[Finite k] [IsProper] [SmoothOfRelativeDimension 1] [GeometricallyConnected] (r : ℕ) (d d' : ℤ)`.
  - Their generality equals README §§0.2, 1.4 and 10.4.
- **One-tactic probes:** none closes a headline, so neither headline is padding.
  - On `nilpotent_matrix_count`, `simp` makes no progress and `rfl` fails.
  - On `absIndecCount_eq_of_degree`, `rfl` fails and `simp [absIndecCount]` leaves the two skeleton cardinalities.
  - Neither pin has a nilpotent-matrix count. A grep for “Herstein”, `card`+`IsNilpotent` and unipotent counts found only `LinearAlgebra/Matrix/GeneralLinearGroup/Unipotent.lean`, which has an iff and no count.
- **Lean form:**
  - Imports are `import Mathlib` plus three `TauCeti.*` modules, each used: `FixedRank`, `eulerCharBelow` and `InvertibleSheaf.trivial`.
  - The module docstring follows the required form and lists every non-statable headline with its missing carrier. The Layer 0, 1 and 10 section comments follow README order.
  - Every declaration has a docstring. There is no `lemma`, no `set_option` and no sorry'd data, and the three definitions have real bodies.

### Headline theorems

The README's end theorems, with their status in `Suggested.lean`:
1. Partition residue formula, §6.3: not statable (no plethystic Adams-series calculus or Weil coordinates).
2. All-characteristic coprime Higgs count, §8.3: not statable (no coarse stable Higgs scheme).
3. Higgs purity and the compact Poincaré polynomial, §§9.1 and 9.3: not statable (no compact ℓ-adic cohomology or singular cohomology of complex points at either pin).
4. Nilpotent-cone component formula, §9.4: not statable.
5. Mellit degree independence and integrality, §§10.3–10.4: degree independence is stated as `absIndecCount_eq_of_degree`; integrality is not statable (no plethystic logarithm).
6. Parabolic, slope-cut and constructible-Hall theorems, §§11.2, 11.4 and 11.5: not statable.
7. The Fine–Herstein count, §1.4: stated as `nilpotent_matrix_count`.

Each non-statable item is named in the docstring with its missing carrier. A grep of the a91d3aa Tau Ceti tree for plethystic, Higgs, Hitchin and compact-support cohomology found no carrier.

### Seeded sample (15 targets), against the cached texts

| Target | Locator checked | Result |
|---|---|---|
| 1.7 Galois orbits | S16 Lemma 2.6, (2.4)–(2.5), printed pp.310–311, S16 lines 712–760 | Orbit splitting into e non-isomorphic conjugates, unique descent via Lang and Springer, and the divisor-sum count all match |
| 2.6 Jordan grading functors | S16 §3.2, pp.313–314, lines 872–885 and Prop 3.1(iv) at line 920 | S16's H_i = Ker(d_i∘⋯∘d_1) equals the README's ker θ^i/(ker θ^i ∩ im θ); the cutoff square matches (iv) |
| 2.7 Jordan fibre mass | S16 Prop 3.1(i)–(iii), p.314, lines 891–918 | d, d″ and d′ match. The README's homotopy fibre is needed; see Source issues |
| 4.1 Eisenstein series | S16 §4.3, (4.3), p.317, lines 1064–1074 | E_r = E_r^vec·E_0(q^{−r/2}z); E_0 = 1 + Σ_{l>0} 1_{(0,l)} z^l |
| 4.2 Hecke commutation | S16 Thm 4.2(ii), p.318, line 1094 | ∏_{i=0}^{r−1} ζ(q^{−r/2+i} z/w), expanded at w ≫ z. S16 states r ≥ 1; the README's r = 0 case is the empty product |
| 4.9 universal counts | S16 Cors 4.5–4.6, pp.320–321, lines 1192–1249, and Prop 4.7 | Existence of the B, C and A^{≥0} elements in K_g, and uniqueness from density |
| 4.10 density | S16 Prop 4.7 and App. B, pp.321 and 357–358, lines 1258 and 3321–3373 | The radial t-argument and h_0 ≠ 0 match. S16 uses the Katz–Sarnak family over one fixed F_q; the README's odd-q hyperelliptic route is a sufficient subset |
| 5.4 separation | S16 §5.4, Lemma 5.4, p.328, lines 1720–1729 | The proof (clear a common denominator; expansion is a module map) carries over verbatim to products of binomials and monomial-order expansions |
| 5.6 block residues | S16 §5.5, (5.14)–(5.15), p.331, lines 1979–2025 | a(r), b(r), the q^{−1/2} rescaling and the final factor 1 − q^{−n/2} z_1 w all match |
| 5.8 arm product | S16 Lemma 5.5, p.333, lines 2126–2143; r_[i,j] defined at line 322 | Matches; recomputed in the table below |
| 6.5 origin constant | S16 §5.9, proof of Cor 1.9, pp.335–336, lines 2307–2378 | Regularity at α = 0 holds term by term, and the non-identity permutations vanish there |
| 8.3 coprime Higgs count | MS14 Thm 1.2, p.2, lines 75–104; Thm 4.3 and Cors 4.4–4.5, pp.8–9, lines 505–588 | Ω_K(r,d) = q·A(r,d) for all (r,d) over any finite field; normalization (−q^{1/2})^{−(2g−2)r²} = q^{(1−g)r²}; no characteristic hypothesis |
| 10.1 Mellit kernel | M20 uncertified. Checked against M18 (3), p.2, lines 63–68, and (20), p.28, lines 1270–1280 | With q_M = z, t_M = q and u_i = α_i⁻¹, M18's N_λ(u) and (H̃_λ,H̃_λ)_S give exactly the README's cell factor, and H = −(q−1)(t−1)·Log Ω |
| 10.3 integrality | M18 Thm 7.1 and Cor 7.2, pp.30–31, lines 1358–1453 | At n = 0, H lies in Z[z,q,α^±][[T]], stronger than the README's Laurent ring. Mellit's Theorem 5.2(i)–(ii) is under Not verifiable |
| 11.6 conjectures | S16 §8.1 Remark (ii), §8.2 Conj 8.2, §8.3 Conjs 8.3–8.4, pp.353–355, lines 3149–3221 | (i), (iii) and (iv) match. (ii) deliberately drops invariance of the representative; see the table and Source issues |

The README flags no locator as unverified (grep: 0 hits). Other locators checked: SPR66 Thm 3.5, printed p.179, SPR66 line 6739, holds for any algebraic group over a perfect field of dimension ≤ 1; MS14 Lemma 4.1 and Cor 4.2, lines 485–500; S16 Cor 1.9 and examples, lines 428–485; S16 rank-two example, lines 389–412.

### Adversarial table (computed values)

| Statement | Instances | Values on each side | Result; change |
|---|---|---|---|
| §1.7 orbit count `A_{X_Fq^l}=Σ_{e∣l} e c_e` | one e = 2 orbit over 𝔽₂, l = 1, 2 | l = 1: e = 2 does not divide 1, so the orbit contributes 0. l = 2: 2·1 = 2. Descended class 2α. S16 (2.5) is the same sum | agrees; none |
| §2.6 grading functor | Jordan block θe₂ = e₁; θ = 0 on O; O(−1)² with the shift | H = k²/⟨e₁⟩, H₁ = ⟨e₁⟩/⟨e₁⟩ = 0, H₂ = H, α = (0,1); identity flag H₁ = H; both cutoffs false at slope −1 | agrees with S16's Ker(d_i∘⋯∘d_1); none |
| §2.7 fibre mass | α = (0,[O]), genus g, 𝔽₂; one-step α = ([O]) over 𝔽₃ | d = −(1−g) = g−1, d″ = 0, mass 2^{g−1}. One step: homotopy fibre mass 1 = q⁰. S16's literal full-subgroupoid fibre gives 1/(q−1) = 1/2 | README right; source issue |
| §4.1 factorization | O ⊕ κ(x) on P¹/𝔽₂ | LHS z. RHS v^{E((1,0),(0,1))} = v¹, times q^{−1/2}, gives z. Without the substitution, vz | agrees; none |
| §4.2 Hecke | r = 0, 1, 2 at q = 2 | 1; ζ(2^{−1/2}z/w); ζ(z/2w)·ζ(z/w), as in S16 Thm 4.2(ii) | agrees; none |
| §4.9 counts | P¹/𝔽₂, class (1,1) | N₀ = 1+3z. [Tz]N: O(1) gives 1, each of three O⊕κ(x) gives 2/2 = 1, total 4 = 3+1. [Tz](N/N₀) = 1 = P(1)/(q−1) | agrees; none |
| §4.10 density | g = 0: q−3 on 3^m; radial (q−3)/t² | 0, 2/3, 8/9 → 1. AS-VIII §5.17 states the ℓ = 3, g = 1 index-27 exception (supplier line 1186), avoided by ℓ ≥ 5 | agrees; none |
| §5.4 separation | 1/(1−z) at 0 and at ∞; converse test | Each expansion times (1−z) is 1. Converse fails: 1/(1−z) at 0 plus −1/(1−z) at ∞ is 0 as a function but δ(z) as distributions; the README states one direction only | agrees; none |
| §5.6 block residues | r = (1); r = (2), g = 2 | a = 0 with prefactor V₁⁻¹V₁ = 1; a(2) = −(2·1)/4 = −1/2, with chain z₂/z₁ = q⁻¹ | agrees with (5.14)–(5.15); none |
| §5.8 arm product | λ = (2), (1,1), (2,1), (3), (2,2) | LHS exponents: q⁻¹z; 0; q⁻²z; q⁻¹(z+z²); q⁻²(q+1)z. RHS over cells with a > 0: ζ(q⁻¹z); 1; ζ(q⁻²z); ζ(q⁻¹z)ζ(q⁻¹z²); ζ(q⁻¹z)ζ(q⁻²z). An exclusive r_[i,j] would give ζ(q⁻¹z) for (2,1) | agrees; none |
| §6.4 rank two | g = 0 symbolic; (−1,−2), q = 2; (1/2, 6), q = 3 | g = 0: bracket numerator 4 − (q−1)² + (q−3)(q+1) = 0. Bracket 5 − 4 = 1, count 6 = P. Bracket 17/32 − 21/32 + 36/32 = 1, count P = −5/2 | agrees; none |
| §6.5 origin | A_{g,1}; §6.4 at α = q = 0 | 1; bracket 1 − 1/4 − (1/2)(3/2 − 2g) = g, so A_{g,2,d}(0) = g; q⁻¹ has no origin value | agrees; none |
| §6.6 table | README formula, g = 1, 2, 3, r ≤ 4, exact arithmetic, every residue class of d | 1,1,1,1; 1,2,6,22; 1,3,15,95 in every class. S16's printed positive sign gives −1 at r = 1 | README right; source issue |
| §8.2–8.3 | E: y²+y = x³ over 𝔽₂ and 𝔽₄ | Ω(1,d) = 6 = 2·3 and 36 = 4·9. Rank-two mass 12+8+6+4 = 30. Log: 30 − 18 − 6 = 6 = q·A_E(2,0) = 2·3, with A_E(2,0) = 3 from §6.3 | agrees; none |
| §10.1/§10.4 Mellit kernel | g = 1, q = 2, α = −1 and −2; g = 1, q = 3, α = 1/2; g = 2, q = 2, α = (−1, 3), r = 2 | H₁ = 3(z+1) and 2(z+2). H_{1,r}(1) = 6 for r = 1, 2, 3, each a degree-1 polynomial. H_{1,2}(1) = −5/2 = P. H_{2,2}(z) is a degree-5 polynomial with H_{2,2}(1) = −64 = §6.4's P·16 = (−4)·16 | §6.4 and §10.1 agree independently; none |
| §10.3 integrality | M18 Cor 7.2 at n = 0 | Z[z,q,α^±] ⊂ the README's Z[q^±,z^±,α^±] | agrees (README weaker); none |
| §11.6(ii) | S16's N[−z]^W form at g = 2, r = 2, d = 1 | A monic diagonal of degree 10 forces one W-fixed top monomial with exponents (a,a,a,a), 4a = 10: impossible. README asks only for a non-invariant representative | README right; source issue |
| `nilpotent_matrix_count` | 𝔽₂ with n = 0, 1, 2; 𝔽₃ with n = 2 | 1, 1, 4, 9 versus 2⁰, 2⁰, 2², 3². At n = 0, ℕ subtraction gives 0·0 = 0, so 1 (the empty matrix) | agrees; none |
| `absIndecCount_eq_of_degree` | r = 0; P¹ with r = 1, 2; E/𝔽₂ with r = 1, 2 | 0 = 0 (zero is not `Indecomposable`); 1 = 1 and 0 = 0; 3 = 3 (Pic⁰) and 3 = 3 (residues −3 and 0) | agrees; none |
| `bundleDegree` | O(1) on P¹; O² in genus 2; O(1)⊕O(−1) | 2 − 1 = 1; −2 − 2(−1) = 0; 2 − 2 = 0. The unweighted formula would give −1 | agrees; none |
| R01 locators | `FixedRank.lean` at a91d3aa and at 2fd255d | 185/212 versus 248/275 (253 lines at a91d3aa) | **fails at a91d3aa; R01** |

### Library declarations opened at a91d3aa / 6b7abb3 (18)

- **Mathlib:**
  - `Card.lean:120` `card_GL_field`
  - `Artinian/Ring.lean:54` `isNilpotent_jacobson_bot` (`[Ring R] [IsArtinianRing R]`)
  - `Artinian/Module.lean:641` `isSemisimpleRing_iff_jacobson`
  - `LittleWedderburn.lean:176` `Finite.isDomain_to_isField`
  - `BinaryBiproducts.lean:1096` `Indecomposable`
  - `Skeletal.lean:74` `Skeleton`
  - `FullSubcategory.lean:39` `FullSubcategory`
- **Tau Ceti:**
  - `FixedRank.lean:69, 104, 185, 212`: `FixedRank`, `pullback`, `fixedRankOneEquiv` and `fixedRankOneEquiv_inverse_obj_obj`
  - `EulerCharacteristic.lean:105` `eulerCharBelow` (junk finrank 0, no finiteness hypothesis)
  - `LineBundle/Basic.lean:131` `trivial`
  - `LineBundle/Degree.lean:70` `eulerDegree`
  - `HookLength/Basic.lean:136, 140` `armLength` and `legLength`
  - `CharacterTable/Pairing.lean:58` `TauCeti.ClassFunction.characterPairing` (bilinear in f₂(g⁻¹))
  - `Preadditive/Radical/Basic.lean:207` `jacobsonRadical`, used by ArtinAlgebras §0.6

### Cross-roadmap citations resolved (93 section ids plus 3 named targets, file line numbers)

- **On main:**
  - SchemeAndStackFoundations §§1.18–1.21 (2745, 2817, 2843, 2951), 2.6 (3437), 2.18 (3959), 2.20 (4275), 3.3 (4713), 3.6 (4905), 3.7 (4937), 4.1 (5066), 4.5 (5244), 4.14 (5706)
  - EtaleCohomologyFoundations §§0.7 (439), 0.8 (565), F.2.4 (592), F.2.5 (613), F.3 (676), F.4.5 (1041), F.4.6 (1089), F.10.1 (907), F.10.2 (940), F.10.2b (1108)
  - RepresentationTheory/SchurWeyl §§7.3–7.6 (696, 790, 824, 875)
  - RepresentationTheory/ArtinAlgebras §§0.1 (251), 0.3 (313), 0.4 (333), 0.6 (418, matrix description from `TauCeti.mem_jacobsonRadical_iff_not_isIso`)
  - RepresentationTheory/QuiverRepresentations Layer 2 (249)
  - ReductiveGroupsPartII §RG2.3.7 (5201: Lang surjectivity and H¹ = 1 for smooth connected groups)
  - AlgebraicVectorBundles L0A–L2B (215–340)
- **At open heads** (the `roadmaps show` line minus 1):
  - EndoscopicTransferAndUnitaryTraceComparison §3.6 (1238, char ∤ |W|), §3.7 (1272: (a) and N = χ(L₁⁻¹⊗V))
  - AutomorphicSpectralTheory §6.22c (3315), §6.24 (3353: C(B,A) with differential θ_A f − (f⊗1)θ_B, the same convention as README §7.1; H² dual to Hom; mass q² in the genus-two Check)
  - ClassicalGroupsPartII CG.0.4 (548), CG.0.5 (580), CG.2.4–CG.2.6 (1246, 1280, 1298), CG.3 (1337)
  - SchemeKTheoryOperations §§6.2.1–6.2.2 (2132, 2146: line elements, ψ² of a line is u², ψ²(−1) = −1)
  - HabiroNahmSeries §5.1 (1081: L_n with log F = −ΣL_n(q^ℓ)t^{ℓn}/(ℓ(1−q^ℓ)), so L_n = (q−1)[t^n]Log F as README:123 says)
  - HabiroCyclotomicCompletions §1.1 (204: Adams Laurent dilation and the plethystic exponential)
  - QSeriesPartitionsAndMockModularForms §§2.4 (311), 3.5 (490)
  - DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7, 7.12, 7.15, 8.8–8.11, 10.5 (730–3245)
  - ArithmeticStatisticsPartVIII §5.17 (1078), with its three quoted targets at 1168, 1184 and 1236
  - EtaleDualityAndPerverseSheaves §0.4 (554, includes H^{2d}_c ≅ Λ^{C_d}), §0.6 (821), §0.7 (898)
  - InverseGaloisAndArithmeticFundamentalGroups IG.0.T3 (566), IG.0.T4 (588)
  - ComplexComparisonPartII C6.3–C6.6 (4603, 4708, 4752, 4850)
  - AlgebraicModuliForArithmeticGeometry §§1.3 (601), 4.19 (7341)
  - WeilConjectures Layer WC.1 (236), target “Finite groupoid mass” §1.7 (376, mass #Y/#G)
  - GlobalShtukasAndFunctionFieldLanglands §§0.1 (174), 0.2 (204), 0.5 (267), 0.6 (298), 0.13 (470: V_r, the torsion Exp and the coherent mass, as in README:85)
  - FunctionFieldArithmetic §§0.2 (482), 0.3 (515), 5.1–5.4 (1726–1838)
- **Consumers:** TopologicalMirrorSymmetryForHitchinSystems cites §§7.1, 7.3 and 9.1, which exist here. FunctionFieldArithmetic and RepresentationTheory/SchurWeyl name this roadmap as a consumer.

### Ownership, overlaps and gaps

- **Overlaps:** a re-run of `roadmaps overlaps` (main 94294cd, 466 open heads) shows no open pull request changing this roadmap, no dropped id and no id defined only in a revision.
- **Searches by object, on main and the open heads:**
  - Białynicki-Birula hits outside this roadmap are the B_dR-Grassmannian map (GeometricSatakeAndFusion §0.15, HeckeStacksAndLocalShtukas), not §8.1's decomposition.
  - “absolutely indecomposable”, “spherical Hall”, “Mozgovoy”, “Fine–Herstein”, “Hesselink” and “attracting strata” occur only here.
  - Higgs stacks: the Hitchin-stack carriers are EndoscopicTransfer §§3.6–3.7 (cited) and TopologicalMirrorSymmetry (a consumer).
  - FunctionFieldArithmeticPartII, GlobalShtukasAndFunctionFieldLanglandsPartII and CurvesOverFiniteFields own none of these objects.
- **Gaps:** six slugs, identical in `design/plan.json` and in the README's `What … must provide (gap:…)` lines. Each names a supplier and section that exist. Each needs sentence is specific, and none asks for something already provided.
- **Overlap facts:** no id this roadmap cites is dropped, and no `Suggested.lean` name collides with a declaration in another readable roadmap.

## Not verifiable

- **M20** (Mellit 2020: Theorems 1.1 and 5.2(i)–(ii), Proposition 3.1, §4, Definition and Lemma 5.1) is settled as uncertified and cited by locator only.
  - It backs §§10.1–10.5 and the Lean headline `absIndecCount_eq_of_degree`.
  - Indirect evidence:
    - M18 (20), (3) and Cor 7.2 give the same kernel and its integrality.
    - The computed H_{g,r}(1) values agree with S16's rank-two formula at g = 1 and g = 2.
    - The genus-one count equals P(1) in ranks 1–3.
- **FH58** (Theorem 1, p.499) and **HES81** (Theorem 5.7) are settled as uncertified. S16 Cor 2.5, S16 line 645, restates the FH58 count, and the small cases were recomputed.
- No new text was needed, and `needs-references.toml` was not created.

## Source issues

- **Error** in S16 at §3.2, convention before Proposition 3.1, printed p.314: the source says φ⁻¹(B′) is the full subgroupoid of objects mapping isomorphically into B′, so the volumes q^{d(α)} fail (one-step α=[O] gives 1/(q−1)); it should be the homotopy fibre; affects a stated result.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says a repeated indecomposable contributes n_i copies of its endomorphism radical; it should be the full n_i-by-n_i matrix block over that radical; affects the proof.
- **Misprint** in S16 at Corollary 1.9, printed p.305: the source says the origin count is the positive Fourier sum of residues of A⁰ dz/z; it should be the negative sum, as in Theorem 1.6 (rank one gives −1 otherwise); affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i)–(ii), printed p.301: the source says the reciprocal prefactor is q^{2D} and the component degree is D; it should be q^D and degree 2D (rank one: Λ = Pic^d); affects a stated result.
- **Misprint** in S16 at §6.11, equations (6.11)–(6.12), printed pp.351–352: the source says compact degree shifts by the affine rank D, respectively n_i^<0; it should shift by twice the rank; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed pp.301–302, and §8.1 Remark (ii), p.353: the source says the count has a W-invariant nonnegative representative in −z, impossible at g=2, r=2, d=1 for a monic degree-10 count; it should allow a non-invariant representative; affects a stated result.
