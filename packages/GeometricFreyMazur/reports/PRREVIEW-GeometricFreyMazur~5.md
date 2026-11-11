# Review of GeometricFreyMazur (pull request #2130 at 0e81d72)

**Verdict:** needs changes

One P3 finding, no blocking finding. The head is the one the previous review read (no change in the folder), so this is a second full reading of the same text.

## R01 (P3) — §0.3 consumes ModularCurvesPartII §4.6, which the supplier contract does not list

**Location.** `TauCetiRoadmap/GeometricFreyMazur/README.md:221`: "*Needs:* §0.1; FuchsianOrbifolds Layer 1; ModularCurvesPartII §1.3; ModularCurvesPartII §4.6; ModularCurvesPartII §4.7; …". The contract at README line 59 reads "§§4.1, 4.7–4.10 supply formal cusp charts, the prime-level application, q-parameter agreement and fixed-pairing connectedness", and the Scope list at README line 9 reads "4.1, 4.7–4.10".

**Claim.** Every section a `*Needs:*` line consumes has an entry under `## Exact supplier contracts` saying what is assumed of it. §4.6 is the only one of the 18 distinct ModularCurvesPartII sections named in `*Needs:*` lines that has none, so §0.3's use of the automorphism groups at j=1728 and j=0 has no stated contract.

**Witness.** ModularCurvesPartII (#913) README line 1468, `### 4.6 Small-level stabilizers and coarse quotients`, theorem `stabilizersAndSmallLevels`: μ₄ and μ₆ at the special j-values, coarse local chart `U/Aut(E,level)`. It is distinct from §4.7 (line 1490).

**Repair.** In README line 59 replace "§§4.1, 4.7–4.10 supply formal cusp charts, the prime-level application, …" by "§4.1 supplies formal cusp charts; §4.6, `stabilizersAndSmallLevels`, supplies the pointed automorphism groups μ₄ and μ₆ at j=1728 and j=0 and the finite local coarse chart; §§4.7–4.10 supply the prime-level application, …", and in line 9 replace "4.1, 4.7–4.10" by "4.1, 4.6–4.10". Tested on the refuting instance: with these two edits all 18 sections (1.2, 1.3, 2.3, 3.9, 3.14, 4.1, 4.6, 4.7, 4.8, 4.10, 5.7, 5.13, 5.16, 6.1, 8.4, 8.5, 9.10, 9.13) occur in the contract; nothing else in the folder changes.

## Previous findings

- Previous R01 (generated `merge-order` block: "It depends on no other author's open pull request") — the block is unchanged, so it is **not repaired**; it is **not carried** as a finding of this folder. Reason: the block is written by the tooling from the merge-order file, which has no line for CanonicalModelsAndGonality (searched; GeometricFreyMazur is line 311, CongruenceSpectralGap 157), and no edit to the folder or to the author's own description text changes it. The author's paragraph already states the facts the block lacks ("CanonicalModelsAndGonality is another author's new roadmap and must merge before this pull request"), and the generated `depends-on` block lists #1726. For the operator: the `merge-order` block should be regenerated once the merge order places CanonicalModelsAndGonality (#1726, another author) before this roadmap.
- Previous review's "Previous findings" R02–R05 were recorded as repaired at this same head; I re-read the passages (§2.6 locator Proposition 12(b), BT16 line 621, printed p. 723; §§9.2, 9.4 attribution against BT16 line 75; the pinned triangle and CM carriers at README line 55; Layer 10 dependencies at line 1408) and agree.

## Verified sound

**Gate, dependency check, elaboration.** Rerun at this head:

```text
gate GeometricFreyMazur: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty. `lake env lean` on `TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` exits 0 with two warnings, both `declaration uses sorry` (lines 58, 78). The branch manifest and main's manifest pin the same revisions (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b), so there is no pin lag.

**Signatures.** `#check @name` for the three declarations on a scratch copy: `gonality` keeps `[Field k] [Field K] [Algebra k K]`; `full_monodromy` keeps `IsAlgClosed k`, `CharZero k`, the tower `k → RatFunc k → K`, `FunctionField k K`, `W.IsElliptic`, `W.j ∉ range`, `Nat.Prime p`, `5 < p`, `800 * N < 7 * p`; `geometric_frey_mazur` has the order ∀ N, ∃ M, ∀ k K. No binder was lost; each agrees with README §§9.6 and 9.8. Nothing was changed.

**Padding probe.** Six one-tactic probes on scratch copies (`simp`, `rfl`, `infer_instance`, `intros; simp_all`, `intros; trivial`, `exact ⟨0, by intros; simp_all⟩`): each leaves both theorems with an error. Neither is padding. `gonality` is needed by both statements.

**Headline theorems.** From the README: compact and cusped systoles (§§1.4, 1.7); signed reconstruction and repulsion (§§3.1, 3.3, 3.6); overlap dichotomy and big-diagonal multiplicity (§§4.3, 5.8); the CM and p-weighted bicusp multiplicity bounds (§§5.2–5.4); ramification decay and rigidity over ℂ (§§7.3, 7.5); uniform rigidity (§9.5); full monodromy (§9.6); Frey–Mazur over the base and over the function field (§§9.7, 9.8); bounded genus, rational curves and minimal models (Layer 10). Statable at the pins and stated: §9.6 (`full_monodromy`) and §9.8 (`geometric_frey_mazur`). The module docstring names the missing carrier for each of the others (X(p), Z(p), Hecke loci, analytic cycles, relative elliptic schemes, the resolution); I found none of these carriers at the pins (searches for a modular surface, gonality, and a mod-p torsion representation in the pinned Tau Ceti returned only the ℓ-adic `WeierstrassCurve.tateModuleGaloisRepresentation`, `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:80`, whose level-n form is the same coordinatewise `Point.map` action the headlines use).

**Sources: the seeded sample (15 targets), read against BT16 (printed page = text page + 708).**

| Target | Locator read | Result |
|---|---|---|
| 0.4 | BT16 §2.4, p. 716, BT16 lines 316–321 | supported (common stabilizer of two cusps) |
| 0.5 | BT16 §2.1, p. 714, lines 229–233; §2.4, lines 289–294, 316–318 | supported: orders p, 2, 3; both cusps or both in Y(p) |
| 1.2 | BT16 §3.2, p. 719, lines 427–433 | supported: vertices i, iy_p, e^(iθ_p); y_p=p/π+O(p⁻¹); the matrices are the README's own and are checked below |
| 1.7 | BT16 Corollary 8, p. 720, line 469 | statement supported; the README's proof replaces a faulty step (Source issues) |
| 2.1 | BT16 §3.3, p. 721, lines 533–534 | supported (maximum absolute entry) |
| 2.2 | BT16 Lemma 10, p. 722, line 539; remark lines 575–577 | supported, entries O(e^(2R)) at line 573 |
| 2.3 | BT16 Lemma 11(a), p. 722, lines 578–581; proof p. 723 | supported; exponent 4δ recomputed below |
| 3.2 | BT16 Lemma 15, p. 726, line 718; proof to p. 727 | supported; the source treats t²=−1, the README adds the order-3 case |
| 5.1 | BT16 §1.3, p. 713, lines 190–193; §6, p. 736, lines 1169–1171 | supported |
| 5.5 | BT16 Lemma 28, p. 738, line 1235 | supported; constant cusp coordinates are the README's addition |
| 5.8 | BT16 Proposition 27, p. 737, line 1224 | the README's extra hypothesis is needed (Source issues) |
| 7.3 | BT16 Theorem 29 proof, pp. 741–742, lines 1420–1447 | supported |
| 8.4 | no source; `Matrix.SL2.commutator_eq_top`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | argument checked below |
| 9.3 | BT16 §2.5, p. 716, lines 322–325; Theorem 1, p. 710, line 58 | supported |
| 9.6 | BT16 lines 71–74 and 81–82, p. 710; ABR96 Theorem 0.1, ABR96 lines 14–17 | supported over ℂ; the passage to k is the README's |

The README flags no locator as unverified.

**Adversarial table.** Every value below was computed in this review (exact arithmetic by hand, floating point by script).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| `gonality` | k(t); k(s,t); K=k | f=t gives finrank 1, so 1; transcendence degree 2 gives finrank 0 in the set, so 0; no transcendental f gives sInf ∅ = 0 | docstring's "zero outside function fields" holds | none |
| `full_monodromy` / §9.6 | N=0, 1, 2; constant curve | gonality ≥ 1 so N ≤ 1 is vacuous; 7·227=1589 < 1600 < 1603=7·229; N ≥ 2 forces p ≥ 229, so `5 < p` never binds; constant E has image {I}, missing [[1,1],[0,1]], excluded by j ∉ k | holds | none (the `5 < p` hypothesis is implied, not harmful) |
| `geometric_frey_mazur` / §9.8 | W′=W, e=id; quadratic twist | Q=σP gives eQ=σ(eP), identity isogeny; twist has σf=−f and −1≠1 on E[p] for odd p, so f[p] is not equivariant | holds | none |
| §0.3 (touched by R01) | order 4; order 3 | t²+1: Lie eigenvalues (i,i) against (i,−i); t₀=[[0,1],[−1,−1]] has t₀²+t₀+I=0, second root −1−ω=ω² | CM⁺/CM⁻ well separated | contract entry only |
| §0.4 | p=7 | 24 cusps per component; same-line labels (7−1)/2=3; stabilizer 336/48=7 | holds | none |
| §0.5 | p=7, G of order 336 | orbits 168, 112, 48 give stabilizers 2, 3, 7; pairwise gcd 1 | holds | none |
| §1.2 | p=7, 11, 101 | det U_p = c²+b(1−b) = cos²θ+sin²θ = 1; tr(SU_p)=1; U_p^p=(SU_p)³=−I to 10⁻¹²; y=1.725082, 3.240910, 32.123353; y+1/y=1/sin θ exactly; (1−b)p²/π²=1.000646 at 101 | holds | none |
| §1.2 direction Check | p=7, three points | r₂r₁ against U⁻¹: ≤ 7.0·10⁻¹⁶, against U: up to 4.056; r₀r₂ against SU: ≤ 4.4·10⁻¹⁶, against (SU)⁻¹: up to 2.144; fixed point of SU has argument 0.588942π | matches the stated 4.06, 2.14, 0.5889 | none |
| §1.3 | p=7, 11, 13, 101, 103, 1009, 10007 | det M_p = 1 identically; both words equal M_p at all seven primes; deformed trace/p² = 0.6798 (101), 0.683877 (1009), 0.6839176 (10007) against 27/(4π²)=0.6839180 | holds | none |
| §1.4 | p=7 | tr(I+pA)=2−p² det A; least hyperbolic trace 47; 2 arcosh(23.5)=7.699389 < 4 log 7=7.783641 | holds | none |
| §1.7 | p=101; source witness | 2 log 101=9.2302, 4 log 101=18.4605; U(p)L(−p)=[[1−p²,p],[−p,1]] is a product of two unipotents of Γ(p), so γ_p kills it | README's witness is needed | none |
| §2.1 | J (all ones); [[2,1],[1,1]]; diag(2,1) | entrywise 1 against Frobenius 2 and operator 2; J²=2J, height 2=2·1·1; inverse [[1,−1],[−1,2]], heights 2, 2; diag(2,1): 2 against 1 | holds | none |
| §2.2 | M=[[2,1],[1,1]] | cosh d=(4+1+1+1)/2=7/2, d=1.9248; h=2 ≤ √7=2.6458 ≤ e^(2d)=46.98 | holds | none |
| §2.3 | midpoint argument; p=101 | midpoint is within δ log p+O(1) of a vertex adjacent to each cusp, so the two vertices are within δρ_X+O(1) and Lemma 10 gives p^(4δ); (b−1)z²=b gives the fixed point i·y_p of U_p, so M ↦ MU^k is free | exponent 4δ confirmed | none |
| §2.5 | p=101, 1009, 10007 | labels (29,3) and (173,−3)≡−(29,3); d−2 log p = −0.0982, −0.0923, −0.0922 for both lifts | two lifts within (1+δ)ρ_X | none |
| §2.6 | p=101; R=1 | midpoints 8.8444 apart; 2 artanh√tanh(1/2)=1.657454 | holds | none |
| §3.2 | Gaussian, Eisenstein; M_x=M_y=I | a²+b²=1 has 4 solutions; a²−ab+b²=1 has 6: (±1,0), (0,±1), ±(1,1); identical equations give dimension 2, excluded by distinctness | holds | none |
| §4.4 | p=7, d=1, R=1/2 | displacements 0, 0.980099, 1.645565, 1.961531, symmetric; k=0, 1, 6 below 1 | holds | none |
| §5.1 | p=7 diagonal | Deg=2(2g−2)=8; vol=2π·8=16π=4π(2g−2) | holds | none |
| §5.5 | q=t², ε=0.01 | density dr dθ/(r log²r); mass 2π/(−log ε)=1.364376; no atom | holds | none |
| §5.6 | p=7, 11, 101 | g=3, 26, 40376; s=24, 60, 5100; ratio 1+6/(p−6)=7, 2.2, 1.0632; agrees with ModularCurvesPartII §4.7's (p+2)(p−3)(p−5)/24 identically | holds | none |
| §5.8 counterexample | p=7, 11, 101 | Σ mult=2d·|G₀|, Deg=4dK, ratio 3p/(p−6)=21, 6.6, 3.189 → 3 | hypothesis needed | none |
| §7.2 / §7.3 | n=2, p=7 | bound 6·2!·7=84; two order-7 slots give lcm 7, not 49; p^(−9/10) fails and p^(−101/100) succeeds after the factor p | holds | none |
| §7.4 | p=7, n=1 | K=4; D ≤ 2dK and 2g(C)−2 ≥ dK ≥ D/2 | holds | none |
| §8.2 | p=2, 3, 5, 7 | least proper index 2, 24/8=3, 120/24=5, 168/24=7 | bound attained | none |
| §8.4 | 𝔽₅, diag(2,3), χ=−1, A=[[0,1],[1,0]]; p=3 | both sides [[0,3],[2,0]]; at p=3 the abelianization ℤ/3 has no nontrivial map to 𝔽₃^× | holds (p>3 is sufficient, not sharp) | none |
| §9.3 | E′=E/K; h=af | f=π_K, λ=1; deg h=a²·deg f, so a=0, 1, −2 with deg f=3 give 0, 3, 12 | holds | none |
| §10.3 | 3/1, 3/2, p/(p−1) | [3]; [2,2]; p−1 twos | holds | none |
| Conventions | f=z²; disc | (i/2π)∂∂̄ log|z|² has mass 1, f=z² mass 2; 4π ddᶜ(−log(1−|z|²))=4 dx dy/(1−|z|²)² | holds | none |
| Supplier constant | index 1 | (21/100)(π/3)/(8π)=7/800=0.00875 | agrees with CanonicalModelsAndGonality §8.6 | none |
| Point-ball example | line (z, az) | V/a = 1+a²(1−q)/(1−a²q), decreasing in q | holds | none |

**Library declarations opened at the pins (26).** Mathlib 1b1ccf4b: `Matrix.ProjGenLinGroup` (`LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41`), `mk_eq_mk_iff` (:64), `toPGL` (:113), `toPGL_injective` (:120); `Matrix.ProjectiveSpecialLinearGroup` (`ProjectiveSpecialLinearGroup.lean:36`); `Matrix.norm_eq_sup_sup_nnnorm` (`Analysis/Matrix/Normed.lean:87`), `norm_apply_le_norm` (:106); `Subgroup.index` (`GroupTheory/Index.lean:55`); `Sym` (`Data/Sym/Basic.lean:43`), `Sym.map` (:342), `Sym.map_map` (:361); `FunctionField` (`NumberTheory/FunctionField.lean:59`, an abbreviation for finite dimensionality over `F⟮X⟯`, with no transcendence or constant-field clause); `AddSubgroup.torsionBy` (`Algebra/Module/Torsion/Basic.lean:972`), `torsionBy.zmodModule` (:1009); `AddMonoidHom.toZModLinearMap` (`Algebra/Module/ZMod.lean:81`); `WeierstrassCurve.Affine.Point.map` (`AlgebraicGeometry/EllipticCurve/Affine/Point.lean:822`); `LinearMap.det` (`LinearAlgebra/Determinant.lean:164`); `Matrix.SL2.commutator_eq_top` (`LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, hypotheses a≠0, a²≠1). Tau Ceti 2fd255d9: `closure_range_toSpecialLinearGroup_eq_top_of_field` (`LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600`); `TauCeti.RiemannSurface.degree` and `degree_comp` (`Analysis/Complex/RiemannSurface/Degree.lean:121`, :435); `TauCeti.Isogeny` (`AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`, fields `pullback`, `mapsInfinity`); `existsUnique_map_eq_iff_galoisFixed` (`Isogeny/Descent.lean:117`); `Hom.degree_zsmul` (`Isogeny/MulByInt/Hom.lean:63`); `TauCeti.IsFunctionField`, `finiteDimensional_adjoin`, `isFunctionField_iff_functionField` (`FieldTheory/FunctionField/Basic.lean:51`, :64, :133); `TauCeti.TriangleGroup`, `lift` (`GroupTheory/TriangleGroup/Basic.lean:80`, :174); the two `triangleGroupEquiv` and `exists_isCofinite_triangleGroup` (`Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.lean:315`; `Fuchsian/TriangleOrder/Group.lean:367`, :469); `GeometricEnd`, `HasGeometricCM` (`Isogeny/Hom/ComplexMultiplication.lean:94`, :100). Every file and line the README gives is exact.

**Duplication by object.** No gonality, no modular surface, no bound on proper-subgroup indices of SL₂(𝔽_p), and no statement that nonconstant j excludes geometric CM at the pins. `gonality` has the same body as CanonicalModelsAndGonality's (its `Suggested.lean` line 65) in a different namespace, so no fully qualified name is shared. ModularCurvesPartII mentions the (2,3,p) orbifold only as a ramification count (its lines 1492, 1789); no roadmap on main or open pull request states the triangle uniformization of X(p), Z(p), the systole or Frey–Mazur (searched with `roadmaps grep`). The overlap report lists no dropped id and no other pull request changing this folder; I read the scopes of ModularCurvesPartII and CanonicalModelsAndGonality and found no object owned twice.

**Cross-roadmap citations resolved (headings read at main or at the open head).** ModularCurves §§0D, 0E, 2C, 5B, 5C (main lines 818, 839, 1294, 2193, 2252). ModularCurvesPartII, 19 sections including §4.6 (lines 422–2870), with `complexConjugationComparison` (2517) and `genericBaseChangeAndLevelCompatibility` (2539); §9.13's multiplier ψ(m) and its m=4 Check (6 against 7) agree with §0.6. SchemeAndStackFoundations §§0.8, 0.9, 0.11, 1.17, 3.2, 3.5 (`sectionNorm`, `lineBundleNorm_divisor`, line 5117), 4.11–4.13 (`bertini_smoothness`, line 5972), 5.1–5.3, 5.9–5.10. AlgebraicCurves Layers 3–7 and 12 with sublayers 12A–12E (line 1471). FuchsianOrbifolds Layers 0–5. ComplexKahlerGeometry K3 and K6.1 (lines 789, 2477, 2528). ComplexComparisonPartII C-1.1–C-1.3, C1.9 (curve comparison maps from rational to meromorphic functions, line 387), C2.2, C4.1–C4.5, C5.4 (`CurrentCalculus`, line 3709), C6.2. InverseGaloisAndArithmeticFundamentalGroups IG.0.3, IG.1.3 (characteristic-zero base extension for finite-type schemes, line 1336), IG.3.1. AbelianSchemesAndArithmeticModuli A1.6 (`relativeEllipticEquivalence`), A1.8, A3.1–A3.8, A6.1, A6.6, A6.7, A6.20, A6.25, A6.34. NeronModelsAndSemistableAbelianVarieties §§1.3, 1.8. CongruenceSpectralGap §5.3 (λ′₁ ≥ 21/100, line 853). CanonicalModelsAndGonality §§1.1–1.7, 8.1–8.7 (§8.6: gonAn ≥ (7/800)·index; §8.7 takes the function-field isomorphism as a hypothesis, as §8.3 here says), 9.1.

**Declared gaps.** The nine slugs of `packages/GeometricFreyMazur/design/plan.json` occur in the README with the same supplier and a word-for-word identical `needs` sentence (compared mechanically). None names supplier `none`; I found none that asks for something its supplier's cited section already states. The acceptance that follows the repair of R01 is conditional on these nine gaps.

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, Layers 0–10 each ending in Examples and Dependencies, Downstream, Worked examples, References. Layer 8 begins at §8.2; the Scope sentence "Section 8.1 is now CanonicalModelsAndGonality §8.6" accounts for the number.

## Not verifiable

- Sil09 Corollary III.9.4 and BLR90 §1.2 Proposition 8, §1.4 Proposition 2: recorded as uncertified in the manifest; cited by locator alone and not read.
- BTE Proposition 4.1, the direction of the last display: the recognised text (BTE lines 129–131) shows sinh(ρ/2) above sinh(ε), which agrees with the README's remark, but I did not render the page, so I do not list it under Source issues.
- The pull-request numbers the description gives for CanonicalModelsAndGonality's own suppliers (#1313, #1017): I confirmed only that its Layer 8 dependencies name CongruenceSpectralGap.

## Source issues

- **Error** in BT16 at Lemma 5 proof, p. 718: the source says the matrix with rows (1−p², p), (−p, 1) attains the bound for loops nontrivial after filling; it should use an element outside the group generated by unipotents, since this one is U(p)L(−p); affects the proof.
- **Error** in BT16 at Corollary 8 proof, p. 720: the source says a shortest loop has length at most 2 log p + O(1) and so nears one cusp; it should be 4 log p + O(1), allowing several deep cusp visits; affects the proof.
- **Error** in BT16 at Proposition 12(a), p. 723: the source says a lift of one cusp has at most one lift of another within (1+δ)ρ; it should allow p^(O(δ)) lifts, two occurring at distance 2 log p − 0.092; affects a stated result.
- **Error** in BT16 at Proposition 27, p. 737: the source says the big-diagonal multiplicity sum is O(p^(−δ) Deg C) for every curve in no diagonal; it should also require non-Hecke projections, since a curve in T₁×T₁ gives ratio 3p/(p−6); affects a stated result.
- **Misprint** in BT16 at Theorem 29 proof, p. 742: the source says 4πnd(2g(X(p))−2) bounds Deg(C); it should be 2nd(2g(X(p))−2), the sum of 2n coordinate degrees with no area factor; affects nothing.
- **Misprint** in BT16 at Corollary 30, p. 742: the source says p > M_N suffices for genus below N; it should be the threshold M_(N+1), because gonality is at most g+1 ≤ N; affects a stated result.
