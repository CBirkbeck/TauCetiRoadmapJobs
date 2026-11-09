# Review of FunctionFieldArithmetic (pull request #1474 at 98e6ff5)

**Verdict:** needs changes

This is a full review: the folder changed by 360 lines since 76ed4c1. All five findings of the previous review are repaired (table under *Previous findings*). The gate passes on this head, the dependency check reports no problem, `Suggested.lean` elaborates with `sorry` as its only warning, and the one-tactic probe closes none of the 13 theorems.

There are five new findings, all P3. None is a mathematical error; they concern citations, a missing dependency edge and supplier contracts.

## R01 (P3) — *Curve additive analysis* is §AL.0.6.1 at the supplier's head, not in Layer AL.3

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/README.md` line 90: "**AutomorphicLFunctionsAndLocalFactors**, Layer AL.3: *Curve additive analysis* (the completion-valued adeles …". The same label appears at lines 325, 533, 562, 573, 619, 745, 775, 809, 813, 826, 844, 869, 2283, 2289, 2373, 2380, 2572, 2609, 2888 and 3222.

**Claim.** These places cite *Curve additive analysis* as part of AutomorphicLFunctionsAndLocalFactors Layer AL.3. That supplier has moved it to Layer AL.0. The title still finds the target, but the layer number points to the wrong layer.

**Witness.** AutomorphicLFunctionsAndLocalFactors README at its open head (#924):
- line 578: `### AL.0.6 Curve additive analysis`, and line 580: `#### AL.0.6.1`;
- line 40: the alias "AL.3.10.1 → AL.0.6.1, Curve additive analysis";
- Layer AL.3 (lines 1431–2278) has no such heading.

The other targets cited from it are in AL.3: AL.3.4.1–3.4.2, AL.3.10.2–3.10.4 and AL.3.14.1.

**Repair.**
- Cite "AutomorphicLFunctionsAndLocalFactors §AL.0.6.1 *Curve additive analysis*" at each listed line.
- At line 90, split the bullet into "Layer AL.0, §AL.0.6.1 *Curve additive analysis* (…)" and "Layer AL.3: *Rank-one unramified reciprocity*, …".
- In the Layer 6 and Layer 7 *Dependencies* (lines 2609 and 3222), list §AL.0.6.1, §AL.R.3 and the AL.3 targets separately.

**Test.** After the edit, every cited AL identifier is a heading at #924:
- AL.0.6.1 (line 580);
- AL.R.3 (line 616);
- AL.3.4.1 (line 1633), AL.3.4.2 (line 1654);
- AL.3.10.2 (line 1925), AL.3.10.3 (line 1931), AL.3.10.4 (line 1941);
- AL.3.14.1 (line 2212).

AL.0.6.1 contains everything the README attributes to it: adeles, the idele isomorphism, the valuation-divisor map onto `Pic(X)`, quotient volume `q^(g−1)`, the residue character with conductor `ord_v(ω)`, self-dual measures and Poisson summation.

## R02 (P3) — Layer 7 lists no dependency on Layer 5, although §7.6 needs §§5.1–5.5

**Location.**
- README line 3204, the §7.6 general coefficient formula: "*Needs:* §§5.1–5.5, 7.1–7.3 and 7.5."
- Line 3222, the Layer 7 *Dependencies*: "Layers 0, 2, 6; …".
- Line 504: "Layer 7 needs Layers 2 and 6."

**Claim.** A target of Layer 7 consumes Layer 5, but neither the Layer 7 dependency list nor *How to read the build* records that edge. The rules require every layer to list its dependencies.

**Witness.** Line 3199 continues the good Euler product "by §§5.1–5.5". For the constant cover, `Z(X′,T)/Z(X,T) = Z_X(−T)`, and this uses `zeta_constantExtension` (§5.5).

**Repair.**
- Change line 3222 to "Layers 0, 2, 5 (§§5.1–5.5) and 6; …".
- Change line 504 to "Layer 7 needs Layers 2, 5 and 6."

**Test.** Layer 5 precedes Layer 7, so the added edge creates no cycle. After the edit, every internal section named in a Layer 7 *Needs* line belongs to a listed layer.

## R03 (P3) — §§6.4–6.5 cite semisimple-group results for every connected reductive `G` without saying so

**Location.**
- README lines 2501–2502 (§6.5): "(Ciubotaru–Harris, §3, Proposition 3.1 and Lemma 3.2, pp. 8–9; Böckle–Harris–Khare–Thorne, Proposition 8.2, pp. 34–35.)"
- The same BHKT citation in §6.4 (line 2455).
- The statements (lines 2488–2494) are for "C_cusp(G,U,Ξ;R)" with `G` connected reductive.

**Claim.** The cited results assume `G` semisimple, and BHKT assumes it split over the constant field. The README drops these hypotheses at the locator. The reductive case with `Ξ` is this roadmap's own extension through §6.4, using Morris I §§5.3–5.6.

**Witness.**
- bhkt line 1562: "Let G be a split semisimple group over Fq".
- ciubotaru_harris line 395: the proof of Prop. 3.1 "uses the assumption that G is semisimple"; line 411 says the same for Lemma 3.2.
- Counterexample to the unrestricted reading: for `G = 𝔾_m`, `U = ∏O_vˣ` and no `Ξ`, the cusp module has infinite rank.

**Repair.**
- At lines 2455 and 2501–2502, add "(for semisimple `G`; BHKT for `G` split semisimple over `𝔽_q`)".
- Add: "the reductive case with central quotient `Ξ` follows from the uniform support bound of §6.4 (Morris I, §§5.3–5.6, pp. 104–106)".
- Write BHKT Prop. 8.2 as p. 35: bhkt line 1593 is on p. 35, while p. 34 has only §8.1.

**Test.** On `𝔾_m` over `y²=x³+x+1` with `𝔽_5` constants and `deg Ξ = 1`, §6.4's Check gives rank `h = 9`, which is finite. Without `Ξ` the module is infinite, so the reductive statement rests on `Ξ` and §6.4, not on the cited sources.

## R04 (P3) — A pinned declaration is cited through a roadmap, and two pinned declarations are missing from *From Tau Ceti*

**Location.**
- README lines 407–408: "ModularCurves Layer 0E supplies effective descent of affine schemes".
- Lines 417–420 (*From TauCetiRoadmap.ModularCurves*), line 1559 (§4.6 *Needs*) and line 1848.
- Lines 1219 and 1247 cite the pinned `profiniteCompletionArtinEquiv` and `localClassFieldCorrespondence`.

**Claim.**
- **(a) Affine descent.** §4.6 descends a scheme that is affine over `Pic_X ⊗ k′` along the affine flat map to `Pic_X`. That case is in the pinned Tau Ceti. ModularCurves Layer 0E itself only consumes it from the pin, and the rules say to cite what exists at the pins.
- **(b) Missing contract entries.** Two `[CharZero K]` declarations consumed in §4.2 are absent from the *From Tau Ceti* contract.

**Witness.**
- ModularCurves README (main) lines 841–851 list `DescentDatum.descended` among the forms "consumed from Tau Ceti".
- `TauCeti/AlgebraicGeometry/Descent/AffineMorphism.lean`: line 111 (`descended`), line 405 (`isIso_toBaseChangeDescended_hom`, `[Flat p]`), line 435 (`isPullback_toDescended`).
- `LocalExistence/ArtinMap.lean:129` and `LocalExistence/Correspondence.lean:138` define the two declarations of (b), both under `[CharZero K]`.

**Repair.**
1. Under *From Tau Ceti*, name `TauCeti.DescentDatum.descended`, `TauCeti.DescentDatum.isIso_toBaseChangeDescended_hom` and `TauCeti.DescentDatum.isPullback_toDescended`, with their file and the hypotheses `[IsAffineHom p]`, `[Flat p]`. Point the four ModularCurves places to them, and delete the *From TauCetiRoadmap.ModularCurves* subsection.
2. Add `TauCeti.ClassFieldTheory.profiniteCompletionArtinEquiv` and `TauCeti.ClassFieldTheory.localClassFieldCorrespondence` to the reciprocity paragraph (lines 263–286), with their files and `[CharZero K]`.

**Test.** Guignard (guignard lines 781–783) descends the same affine object along a finite locally free cover of `Pic`. This is the flat, affine `p` of the pinned theorem.

## R05 (P3) — §0.1 cites Yu's idele norm at the wrong subsection and page

**Location.** README line 529: "(Yu, §2.2.1, p. 8 and §2.2.3, p. 9, for the idele norm and the sign of his degree …)".

**Claim.** The sign of the degree is correctly located: §2.2.1, p. 8. The norm `|g| = q^(deg det g)` is not in §2.2.3; it is defined in §2.3.4 on p. 12.

**Witness.**
- yu lines 366–373 (p. 8) define `deg g = −Σ[κ(x):F_q]x(g_x)`.
- yu lines 388–398 (p. 9, §2.2.3) define only the subsets with `deg det g = e` and `Ξ_M`.
- yu line 569 (§2.3.4, p. 12) defines `|g| = q^{deg(det g)}`.

**Repair.** Replace the parenthesis with "(Yu, §2.2.1, p. 8, for his degree and its sign; §2.3.4, p. 12, for the norm `|g| = q^(deg det g)`; ArithmeticGaloisDuality §R02.3.2 for the global map.)"

**Test.** At a degree-2 place, the uniformizer idele has `deg_Yu = −2`. Yu's §2.3.4 norm gives `q^(−2)`, which equals the normalized absolute value `|π_v|_v = q_v^(−1) = q^(−2)`, as line 519 states.

## Previous findings

| Previous | Status at 98e6ff5 | Passage |
| --- | --- | --- |
| R01 (P2): §4.2 headlines statable but absent | Repaired | `Suggested.lean` lines 175–190 state `localAbelianExistence_all` and `injective_artinMap_all` for every nonarchimedean local field. README lines 1199 and 1209 backtick them. Imports, *From Tau Ceti* (lines 263–286) and the docstring (lines 12–27) are updated |
| R02 (P3): `conductor_existence_all` restates the pinned API | Repaired | Deleted. Lines 143–145 say the conductor of a class field "is not a target here". The contract cites `conductorExponent`, `unitFiltration_conductorExponent_le_normGroup` and `conductorExponent_le_iff` |
| R03 (P3): `IsLPolynomialData.unique` is about free variables | Repaired | Lean lines 296–307 state `isLPolynomialData_iff_eq_lPolynomial` on the carriers. README lines 2029–2036 keep the algebraic lemma as an unbackticked target |
| R04 (P3): phantom EtaleCohomologyFoundations §0.11 | Repaired | Line 3226 ends with "SchemeAndStackFoundations §§2.11, 3.3 and 3.6." |
| R05 (P3): LubinTate cited through a job-board URL by slugs | Repaired | Lines 356–381 cite §§0.1–0.2, 1.1–1.4 and 2.1–2.5; a grep finds no URL and no slug. Formal-group homomorphisms are the pinned `TauCeti.FormalGroupHom` |

## Verified sound

**Gate and scope.** The head is 98e6ff541ba1710ae4806097d50d7f2a39ad348c. The diff outside the folder is empty, and the folder holds README.md, Suggested.lean and metadata.toml. Gate rerun on this head:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check:

```text
depcheck: 237 roadmaps, 2310 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. LubinTateFormalModulesAndQuasiCanonicalLifts is at line 343 of the order and this roadmap at line 354. ModularCurves is on main.

**Lean.**
- `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and no error, in 20 s.
- The elaborated types of all 20 declarations (scratch `#check @`) match the README statements. No section binder is lost: `[CharP F p]` is on every Witt declaration, and the three new theorems carry `ValuativeRel`, `TopologicalSpace` and `IsNonarchimedeanLocalField`, or `[Finite k]`, `hF` and `hk`.
- One-tactic probe on a scratch copy, each tactic run in isolation with `done`: `rfl`, `simp`, `simp_all`, `infer_instance`, `trivial`, `norm_num`, `aesop`, `exact TauCeti.ClassFieldTheory.injective_artinMap K` and `exact TauCeti.ClassFieldTheory.localAbelianExistence H`. None of the 13 theorems closes, so there is no padding.
- `localAbelianExistence_laurentSeries` is a different-carrier form, stated with intermediate fields, the field norm and `finrank`. The README says so at line 1206, and the probe shows it is not a one-step consequence.

**Headlines.** The Summary's end theorems are §§5.3, 4.2, 4.10, 6.4–6.5 and 7.6.
- §§5.3 and 4.2 are stated.
- §§4.10, 6.4–6.5 and 7.6 are named in the docstring with their missing carriers. So are §§2, 3.2, 4.1, 4.2 (Kronecker–Weber), 4.3, 4.4, 4.7, 5.7, 5.8, 6.7, 7.1 and 7.2.
- The pins have no topology instance on `WittVector`, only `variable` binders in `FarguesFontaine/*`, which confirms the §3.2 docstring claim.

**Pinned declarations opened** (Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/` unless noted):

| File:line | Content and hypotheses |
| --- | --- |
| `Local/ArtinMap.lean:114, 132, 260` | `artinMap K : Kˣ →* Field.absoluteGaloisGroupAbelianization K`; `artinMap_restrict`; `ker_artinMap_eq_iInf` (any characteristic) |
| `Formation/AbelianLayer.lean:80` | `OpenNormalSubgroup.IsAbelianClassFieldLayer`: `V` contains the closed commutator subgroup |
| `LocalExistence/NormSubgroup.lean:71` | `localNormSubgroup K V = normGroup K (classField K V)` |
| `LocalExistence/AbelianLayer.lean:154` | `index_localNormSubgroup`: the index is the degree (any characteristic) |
| `LocalExistence/Correspondence.lean:68, 138` | `localClassField_unique` (any characteristic); `localClassFieldCorrespondence` (`[CharZero K]`, on open subgroups of finite index) |
| `LocalExistence/Existence.lean:159, 176` | `localAbelianExistence` (`[CharZero K]`); the prime-to-`p` form (any characteristic). The docstring says it does not use Lubin–Tate theory |
| `LocalExistence/ArtinMap.lean:75, 90, 99, 113, 129` | Completion map; surjective in any characteristic; injective only under `[CharZero K]`; `profiniteCompletionArtinEquiv` (`[CharZero K]`) |
| `TauCeti/RingTheory/LaurentSeries/LocalField.lean:118` | `TauCeti.LaurentSeries.isNonarchimedeanLocalField [Finite K]` |
| `TauCeti/RingTheory/FormalGroup/Hom.lean:137, 351`; `TopNilpotentPoint/Basic.lean:72–91` | `TauCeti.FormalGroupHom`, `TauCeti.FormalGroupIso`; `FormalGroup.TopNilpotentPoint` (root namespace), as the README states |
| `TauCeti/AlgebraicGeometry/Descent/AffineMorphism.lean:111, 405, 435` | Affine descent over an arbitrary base (R04) |
| `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:327` | `AbsoluteGaloisGroup := Gal(SeparableClosure K/K)` |

All newly backticked `TauCeti.*` names resolve at the pin, with the characteristic hypotheses the README states.

**Cross-roadmap citations resolved.**

| Citation | Where checked | Result |
| --- | --- | --- |
| LubinTate §§0.1–0.2, 1.1–1.4, 2.1–2.5 | Board package README (head 43c8917), lines 292, 341, 466–597, 598 | Layer 1 holds over any DVR with finite residue field, either characteristic (line 468). Layer 2 is for `K/ℚ_p` only (line 600). The additive-law Check (line 560) and the comparison (line 568) match. Line 1854 records this roadmap's §4.1 as adding the equal-characteristic torsion, so ownership is agreed |
| AutomorphicLFunctionsAndLocalFactors targets | #924 head | All resolve. *Curve additive analysis* is at AL.0.6.1 (R01) |
| SchemeAndStackFoundations §§1.1, 2.11, 2.16, 3.3, 3.6, 3.7, 5.11 | main lines 2071, 3656, 3896, 4713, 4905, 4937, 7273 | Exist. §3.6 states the injection with cokernel in `Br(k)`, `picardComponent_point_iff` and `picardComponent_test_conic` |
| RelativeJacobians §§1.3–1.5; ReductiveGroupsPartII RG2.0a, RG2.3.7, RG2.4; SmoothReps SR.2.1–2.3, SR.4.1, SR.4.4 | Open heads | All exist |
| EtaleCohomologyFoundations F.2.5, F.3, F.10.2–F.10.3; PadicMeasures §5.1 | main | Exist, with `detLine_shift` and `detLine_acyclic` |
| ArithmeticGaloisDuality §R02.3.2 | #858, line 2074 | Exists |
| Consumers | #1729, #1490, #1831 | CurvesOverFiniteFields cites §5.6 `IsLPolynomialData.unique`. §5.6 keeps that target name and maps it to the new Lean theorem (lines 2033–2036). No consumer cites a removed id |

Ownership was checked against the open pull requests whose files the brief provides, using `roadmaps grep`. ClassFieldTheory (#617, #1215, #1411) excludes `p`-primary existence in equal characteristic. FilteredLocalGaloisGroups (#1795) uses `injective_artinMap` only for `K/ℚ_p`. No second owner of a §4.2 object exists, and `overlaps.md` lists no dropped id.

**Seeded sample (15 targets).**

| Target | Locator checked | Outcome |
| --- | --- | --- |
| 0.1 | yu lines 366–373 (§2.2.1, p. 8), 388–398 (§2.2.3, p. 9), 569 (§2.3.4, p. 12) | Sign matches. Norm locator wrong (R05) |
| 0.3 | milne lines 4947–5021 (Thm A.7 and proof, printed pp. 131–132) | Background use over finite fields. The comparison itself is SchemeAndStackFoundations §3.6 (main line 4910) |
| 1.2 | hess | Not verifiable (uncertified). Checked mathematically in the table |
| 3.3 | kw lines 280–319 (Thm 3.2, pp. 6–7); 722–736 (Prop. 4.3, p. 15) | Match. The ranges "pp. 6–8" and "pp. 15–16" are one page wide but contain the results |
| 4.1 | yoshida lines 245, 264, 293, 331–359, 466–471, 572, 892–904, 1049 (pp. 416, 417, 418, 419, 423, 425, 433, 436) | Match: torsion `≅ O/𝔭^m`, total ramification, `N(−α)=π`, `(O/𝔭^m)ˣ ≅ Gal`, displacement `q^i`, `φ_G(q^m−1)=m`, separability |
| 4.2 | yoshida lines 47–64 (Thm A, pp. 411–412), 430 (Def. 4.10, p. 422), 572, 637–651, 686–688 (§5.3(iv), p. 428), 854, 905 (pp. 432–433); 145–147 | Match. Yoshida sets `Frob_K := φ⁻¹`, the geometric Frobenius, so the README's inversion is right |
| 4.6 | guignard lines 737–786 (§4.7, Prop. 4.8, Lemma 4.9, pp. 1317–1319); conrad_geom lines 41–117 | Match: `α : O_Y → i_*L`, relative dimension `N+g−1`, affine over `Pic` after base change |
| 4.9 | conrad_geom lines 157–171 (Thm 3.2, p. 4) | Cartesian Lang dictionary. The Frobenius translation is derived and checked in the table |
| 5.2 | roquette | Not verifiable (waived). Checked mathematically |
| 5.5 | roquette eq. (4) | Not verifiable (waived). Checked mathematically |
| 5.7 | stacks lines 1138–1153 (Thm 20.1, Tag 03UZ; Remark 20.3); abdurrahman_venkatesh lines 1178–1197 (§3.2, (3.1)–(3.2), p. 27) | Match: finite `Λ` prime to `p`, constructible flat sheaf, geometric Frobenius on `V^{I_x}` |
| 6.3 | morris1 p. 104 (§5.4) and p. 102 (§4); bhkt lines 1579–1590 (§8.1, p. 34); ciubotaru_harris lines 380–382 (p. 8) | Match: `ℤ[1/p]`-valued measure, probability normalization |
| 6.5 | ciubotaru_harris lines 390–396, 412–413 (pp. 8–9); bhkt line 1593 (p. 35) | Statements match for semisimple `G` (R03) |
| 7.2 | morris1 line 1058 (Godement lemma, p. 118), p. 119, p. 134, pp. 160–167; morris2 line 1300 (§5.5, p. 1145), line 2022 (§6.6 Lemma, p. 1164); fyz §2.1 p. 8 | Match. Pages read from the running heads (`118 L. E. MORRIS`, `EISENSTEIN SERIES 1145`, `1165` after line 2029) |
| 7.6 | fyz lines 628–711 (§2.6, (2.9)–(2.15), Thm 2.8, pp. 13–15) | Match: (2.12) is the README formula verbatim in content; `|det α|_{F′}=q^{deg E}` |

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| `localAbelianExistence_all` | `𝔽₂((T))`, `H=⟨T⟩×U²`; `H=Kˣ`; `ℚ₂` | Index 2 = degree of `K(℘⁻¹T⁻¹)`. `[T⁻¹,T)=Res(T⁻²dT)=0` and `[T⁻¹,1+T)=1`, so the norm group is `H`. `H=Kˣ` gives `V=⊤`. On `ℚ₂` finite index implies open, which is the pinned theorem. A non-open index-2 subgroup is excluded by `hH`. Instantiable through `LaurentSeries.isNonarchimedeanLocalField` | Pass | None |
| `injective_artinMap_all` | `𝔽₂((T))`, `u=1+T` | Index prime to 2 ⇒ `1+T ∈ H`, so prime-to-`p` theory gives nothing. `[T⁻¹,1+T)=1≠0` gives `Art(1+T)≠1` | Pass | None |
| `localAbelianExistence_laurentSeries` | `H=⟨T⟩U²` over `𝔽₂` | Unique `L` in `K̄`; `finrank 2 = index 2`. `H=Kˣ` forces `L=⊥` | Pass | None |
| `isLPolynomialData_iff_eq_lPolynomial` | `E:y²=x³+x+1/𝔽₅`; `ℙ¹` | Accepts `1+3T+5T²`. Rejects `1+2T+5T²` (`a₁=9−6=3≠2`) and `1+3T+T²` (`a₂=5·a₀=5`). `ℙ¹`: `g=0` forces `P′=1` | Pass | None |
| `zeta_eulerProduct` | `ℙ¹/𝔽₂`, `T²` | Divisor count `(2³−1)/1=7`; product `C(4,2)+1=6+1=7` (3 rational places, 1 of degree 2) | Pass | None |
| `zeta_logDeriv` | `ℙ¹/𝔽₂`, `r=2` | `2·7=14`; `N₁A₁+N₂A₀=3·3+5·1=14` | Pass | None |
| `effectiveDivisorCount_of_large` | `ℙ¹/𝔽₃ n=2`; `E/𝔽₅ n=1,2` | `2·13=26=27−1`; `4·9=9·4`; `4·54=216=9·24`. Hypothesis `2g≤n+1` makes `n+1−g` untruncated | Pass | None |
| `zeta_rationality` | `E/𝔽₅` | `1/((1−T)(1−5T))=1+6T+31T²+…`; times `L`: `A₁=6+3=9=h=N₁`; `P(1)=9`; leading coefficient `5=q^g` | Pass | None |
| `exists_divisor_degree_eq_one` | `𝔽₂(t)`; `𝔽₄(t)` over `𝔽₂` | `deg[∞]=1`. Without exact constants every degree is `2·deg_{𝔽₄}`, image `2ℤ`, so `hk` is needed | Pass | None |
| `riemannRoch_reducedBasis` | `E/𝔽₅`, `x`, `D=0`; `𝔽₂(t)`, `x=t²` | `d=(0,−2)`: `r=1` gives `{1,x}` (dim 2 = `ℓ(2O)`); `r=2` gives `{1,x,x²,y}` (dim 4 = `ℓ(4O)`); sum `−2=0+0−2`. `x=t²`: `d=(0,−1)`, sum `−1=0+1−2` | Pass | None |
| `witt_additiveHilbert90` | `𝔽₄/𝔽₂`, `n=1` | `ker(1−σ)=𝔽₂`; `{a+a²}={0,1}=ker Tr`; `Tr` onto | Pass | None |
| ASW characters | `𝔽₃ n=1`; `𝔽₂` at infinite length | `y∈𝔽₉`, `y³−y=1`: `e(1)(Frob)=1`; the negative pairing gives 2. `ℤ₂`: reductions ≡1 at every length | Pass | None |
| 0.1 degrees and reciprocity (sample) | Degree-2 place; `r=3,d_v=2`; `r=d_v=2` | `deg=2`, `deg_Yu=−2`, `|a|=q⁻²=q^{deg_Yu}`. `gcd(3,2)=1`: one factor of degree 3, `Art(π_v)↦φ²` of order 3, geometric `φ⁻²=φ`. `r=d_v=2`: two factors, `φ²=1` | Pass | R05 (locator) |
| 0.3 Picard points (sample) | `ℙ¹/𝔽₃`; `E/𝔽₅`; real conic | `h=1`, `Pic=ℤ`; `J(𝔽₅)` of order 9 = `L(1)`; cokernel `ℤ/2=Br(ℝ)` | Pass | None |
| 1.2 reduced invariants (sample) | as above, plus `𝔽₃` wild cover, `x=z` | `(0,−1,−2)`, sum `−3=0+3(1−1)−3` with `n=3`, `g=1` | Pass | None |
| 3.3 one-pole comparison (sample) | `y³−y=t⁻²/𝔽₃`; `p=2,m=1`; `m=p` | `2g−2=3(−2)+2·3=0`, `N₁=4`, `L=1+3T²`, `N₂=9+1+6=16`. At `∞`, `v(t⁻²)=2>0`: coboundary. `y²+y=1/t`: `2g−2=−4+2`, so `g=0`. `t⁻³≡t⁻¹` | Pass | None |
| 4.1 LT torsion and ramification (sample) | `Q=3,m=2`; `Q=2,m=2`; `f=πX+X^Q` | Lower 6,3,3,1 (Yoshida `|G_n|=q^{m−i}`). `φ(2)=1`, `φ(8)=2`, so upper 6,3,1. `Q=2`: 2,2,1 both. `f(X+Y)=f(X)+f(Y)`; `X^{Q−1}+π` Eisenstein, degree `Q−1` | Pass | None |
| 4.2 Checks (sample) | `𝔽_p((T))`; completion map | `U¹/(U¹)^p≅∏_{p∤i}𝔽_p`: infinite, so non-open index-`p` kernels exist. Closure of such `N` in `K̂ˣ` is open; injectivity would make `N=Art⁻¹(open)` a norm group. Contradiction | Pass | None |
| 4.6 rigidified Picard (sample) | `ℙ¹`: `[0]+[∞]`, `2[∞]`, degree-2 point | `N=2`, dim `g+N−1=1`. Torus/unipotent `(r−1,N−r)=(1,0),(0,1),(1,0)`: `𝔾_m`, `𝔾_a`, `Res𝔾_m/𝔾_m` | Pass | R04 (citation) |
| 4.9 Lang coordinates (sample) | `𝔽₃`, `m=2[∞]`, `a=[1]`, place `t²+1` | `Tr_{𝔽₉/𝔽₃}(i−1)=(i−1)+(−i−1)=−2=1`; with `a` in place of `2a`, `Tr(t)−1=2` | Pass | None |
| 4.10 classification (headline) | `ℙ¹`, `m=0`, `B=ℤ/4`, `θ=2deg` | `[B:im θ]=2` components, each a constant quadratic cover; conductor 0 | Pass | None |
| 5.2 large degree (sample) | as `effectiveDivisorCount_of_large` | `E/𝔽₅`: `A₁=h=9=N₁` | Pass | None |
| 5.5 constant extension (sample) | `E/𝔽₅`, `r=2`; `ℙ¹` | `L(T)L(−T)=(1+5T²)²−9T²=1+T²+25T⁴=L_{25}(T²)` with `a₁=27−26=1`. `ℙ¹`: `∏_ζ Z(ζT)=1/((1−T^r)(1−q^rT^r))` | Pass | None |
| 5.7 finite coefficients (sample) | `Λ` on `ℙ¹`; `Λ=𝔽₃×𝔽₃`; `ℤ/4` | `H⁰` gives `(1−T)`, `H²` gives `(1−qT)`, so `L=1/((1−T)(1−qT))=Z_{ℙ¹}`. `P₀=(1,1−T)`. `[ℤ/4 →² ℤ/4]` has determinant 1 with nonprojective `H^i` | Pass | None |
| 6.3 constant-term weights (sample) | Heisenberg `p=3` | `3·(1/9)+2·(1/3)=1`; uniform weights give a different integral | Pass | None |
| 6.5 integral model (sample) | `𝔾_m/E/𝔽₅`, `deg Ξ=1`; no `Ξ` | Rank 9 with `Ξ`; infinite without. Sources assume semisimple | Pass (math) | R03 |
| 6.4 Harder (headline) | `GL₂` Borel, `diag(π^a,1)` | `⟨α,H₀⟩=−a`; `c₁≤−a≤c₂` leaves finitely many `a` | Pass | None |
| 7.2 Siegel series (sample) | Split `n=1`, `q=3` | `Φ(m(π,1))=3^{−s−1/2}`; `s=1`: `3^{−3/2}`. Fixed-centre parameter group `μ₂` | Pass | None |
| 7.6 FYZ (sample, headline) | `n=1`, `ℙ¹`, split, self-dual | `deg𝓔=n·deg ω_X=−2`; exponent `−(−2)(s−½)+1=2s`; `L₁(s)⁻¹=∏(1−q_v^{−1−2s})`; `Den=1`. Matches fyz (2.12) | Pass | None |
| 7.6 general formula needs §5 | Constant and split covers | `Z(X′,T)/Z(X,T)=Z_X(−T)` (by §5.5) and `=Z_X(T)` | Pass (math) | R02 |
| AL.0.6.1 content (2.2, 7.3) | `ℙ¹`, `ω=dt` | `n_∞=−2`, `μ_ω(∏O_v)=q`; `μ_int(𝔸/K)=q^{g−1}=q⁻¹`, product 1. This content is at AL.0.6.1 | Pass (math) | R01 |

## Not verifiable

- **hess** (Lemma 1, Corollaries 3–4, Theorem 7, Corollary 11; §1.2 sampled): uncertified, recorded as settled. §1.2 was checked mathematically (table rows).
- **roquette** (§4.3.3; eq. (4); §§5.2 and 5.5 sampled): waived. Checked mathematically.
- **sga4half** (Théorème 2.2, cited inside §5.7): uncertified. §5.7's statement was verified against stacks Theorem 20.1 instead.
- rosen, goss and stichtenoth are not in the sample.
- No source was fetched, and no missing-reference request was made.

## Source issues

- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 297): the source invokes "Theorem 3.1" for the Witt Hilbert 90; it should be Proposition 3.1, the only result so numbered; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 299): the source writes `F(σα)−σα` as `F(α+1)−α+1`, although `1 = α−σα` gives `σα = α−1`; it should read `F(α−1)−(α−1) = Fα−α`; affects nothing.
