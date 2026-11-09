# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at e3fd9ae)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines changed since 8a9e596. All 16 are in the README; `Suggested.lean` is unchanged.

There are four findings:
- **R01 (P2) carries over.** Its repair belongs in #1722 and #2026, and neither has made it.
- **R02 (P3) carries over.** Its repair belongs in this pull request's description.
- **R03 (P3) is new.** It concerns the three Dependencies lines this change edited.
- **R04 (P3) is new.** It concerns the new ClassFieldTheory Layer 13 contract.

The previous R03, the ClassFieldTheory anchor, is repaired.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers in other roadmaps refer to the raw README at the head named.

## R01 (P2) — Eichler orders and Brandt matrices still have second owners in later roadmaps

Carried over from R01 of the previous review. No repair report marks it `not actionable in this package`. Both later heads have moved since then, and neither has made the repair.

**Location.** README:9: “For quaternion orders they are Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level (§§R18”.

**Claim.**
- This roadmap is at merge-order line 160. It owns:
  - the local form of Eichler orders, including the two maximal orders at the ends of a path in the tree (§R18.5.16a item 1);
  - the neighbour ideals and Brandt matrices (§R18.5.16c).
- QuaternionArithmetic (#1722) consumes this roadmap, so it comes later. At its new head it now claims both objects outright.
- ArithmeticFuchsianGroups (#2026, merge-order line 284) still uses the order-to-tree adapter without citing this roadmap.

**Witness.**
- #1722 (797c405):
  - README:268: “The order-to-tree comparison is owned here in §1.12”.
  - README:64 owns Brandt matrices.
  - README:240 omits R18.5.16a and R18.5.16c.
- #2026 (82ce1e4): README:566 and 605–607 use Eichler orders at adjacent tree vertices, and its §1.2 *Needs:* (README:609) omits this roadmap.

**Repair.** Nothing in this folder changes.
- **In #1722:**
  - §§1.9, 1.10 and 1.12 cite §R18.5.16a items 1–4.
  - README:268 drops the claim to own the order-to-tree comparison.
  - §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level.
  - The consumed list (README:240) adds §§R18.5.16a and R18.5.16c.
- **In #2026:** the §1.2 *Needs:* line adds HilbertModularVarietiesAndShimuraCurves §R18.5.16a, item 1 at e=1.

If either edit cannot be made there, the repair report records this finding as `not actionable in this package`, with that reason.

**Test of the repair.**
- **#1722, D=11.** README:1508 gives `T(2)=[[1,3],[2,0]]` and `T(3)=[[2,3],[2,1]]`, with weights (2,3).
  - The transposes have row sums 3 and 4, which is `q_v+1`.
  - The weighted symmetry holds: `w₂B₁₂=6=w₁B₂₁`.
- **#2026, v=2 over ℚ.** `[GL₂(ℤ₂):K₀(2)]=3`, which agrees with #2026's Check of `Γ₀(2)`, “of index `3`” (README:605).

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over from R02 of the previous review.

**Location.** README:45: “| AlgebraicTopology, Layer 6 | Direct and cellular cochains and cohomology with local coefficients…”. The same citation appears at README:100, README:3603 and README:3611 (anchor `#layer-6-cohomology-products-and-manifold-duality`).

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in the Depends-on list nor in the merge-order paragraph.

**Witness.**
- On main (f372983), AlgebraicTopology README:946 is “## Stage 6: cohomology, products, and manifold duality”.
- At #1652 (287181d), README:1655 is “## Layer 6: …”.
- At #1663 (8b51fe6), it is still “Stage 6” (README:1258).
- “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Place #1652 before this pull request in the merge-order paragraph.
- The README stays as it is.

**Test of the repair.** overlaps.md lists exactly two “only an open revision defines” items: “Layer 6” at README:45, 3603 and 3611, and the anchor at README:3611. Both name #1652, and nothing else.

## R03 (P3) — The Dependencies lines this change completes still omit what their layers' *Needs:* lines cite

New. The change edited the Dependencies lines of H4, H6, R18.1 and R18.3 part 1 to make them complete. H4 is now complete. The other three still miss earlier layers, suppliers or sections, and one of them names an id that exists nowhere.

**Location.**
- README:1567: “This layer uses earlier layers H1, H4, H0, H5; … FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.6); …”.
- README:1759: “ShimuraVarieties (§§P.1, P.3, 8.1–8.5, 8.22)”.
- README:3356: “SmoothRepresentationsOfLocalGroups (SR.0:abelian-category, SR.2, SR.3)”.

**Claim.** I compared each line with every *Needs:* line of its layer: 9 in H6, 10 in R18.1 and 28 in R18.3 part 1.
- **H6.**
  - §§H6.2–H6.3 need §H2.2a and ShimuraVarieties §8.18.
  - §§H6.5 and H6.8 need R07.4.20–R07.4.24.
  - The line has no H2, no ShimuraVarieties and no R07.4.
- **R18.1.** §R18.1.1a needs ShimuraVarieties §§4.1–4.2, 4.9 and 8.6–8.7, and several targets need §P.2.
- **R18.3 part 1.**
  - “SR.0:abelian-category” is not an id of SmoothRepresentationsOfLocalGroups.
  - These cited items are missing: Mathlib `HeckeCoset` and `IsHeckeTriple`; AutomorphicFormsOnReductiveGroups §§0.6, 5.8a–5.8b and 7.3a; GL2AutomorphicRepresentationsAndTransfer R16.4.5 and R17.1.1–R17.3.7.

**Witness.**
- README:1415 and README:1432 both cite “finite étale descent with an ample line (§H2.2a); ShimuraVarieties §8.18”.
- README:2907 cites “Mathlib `HeckeCoset`, `IsHeckeTriple`”.
- At #1688, the abelian category of SmoothRepresentationsOfLocalGroups is “### SR.0.2” (README:662).

**Repair.**
- **README:1567.**
  - Replace “earlier layers H1, H4, H0, H5” by “earlier layers H0, H1, H2, H4, H5”.
  - Replace “(R07.6)” by “(R07.4.20–R07.4.24, R07.6)”.
  - Add “ShimuraVarieties (§8.18)”.
- **README:1759.** Replace “(§§P.1, P.3, 8.1–8.5, 8.22)” by “(§§P.1–P.3, 4.1–4.2, 4.9, 8.1–8.7, 8.22)”.
- **README:3356.**
  - Replace “(SR.0:abelian-category, SR.2, SR.3)” by “(SR.0.1–SR.0.2, SR.0.4, SR.2, SR.3)”.
  - Replace “AutomorphicFormsOnReductiveGroups (§7.6)” by “(§§0.6, 5.8a–5.8b, 7.3a, 7.6)”.
  - Replace “(R16.2.13, R16.6.3, R17.3.8a–R17.3.8d, R17.3.9)” by “(R16.2.13, R16.4.5, R16.6.3, R17.1.1–R17.3.9)”.
  - Add `HeckeCoset` and `IsHeckeTriple` to the Mathlib list.

**Test of the repair.** Every added id resolves:
- ShimuraVarieties at #933: README:168 (P.2), 1123 (4.1), 1150 (4.2), 1311 (4.9), 2498 (8.6), 2535 (8.7) and 2781 (8.18).
- AutomorphicFormsOnReductiveGroups at #1037: README:203 (0.6), 911 (5.8a), 925 (5.8b) and 1207 (7.3a).
- GL2AutomorphicRepresentationsAndTransfer at #931: README:1204 (R16.4.5) and 1432 (R17.1.1).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879: README:6372 (R07.4.20) and 6528 (R07.4.24).
- Mathlib: `IsHeckeTriple` and `HeckeCoset` are at Mathlib/NumberTheory/HeckeRing/Defs.lean:75 and 157.
- In this README, §H2.2a is at README:594.

All these suppliers are earlier than line 160 or on main, so the depcheck is unaffected.

## R04 (P3) — The new ClassFieldTheory Layer 13 contract imports from a plan what the Tau Ceti pin already proves

New.

**Location.**
- README:43: “the Hilbert and narrow Hilbert class fields with their splitting and unramifiedness properties, and the cyclic Hasse norm theorem (Layer 13)”.
- README:100: “**ClassFieldTheory** (Layers 12, 13)”.
- README:1492, the *Needs:* line of §H6.5: “[ClassFieldTheory](../ClassFieldTheory/README.md) `Layers 12, 13`”.

**Claim.** These declarations exist without `sorry` at the pinned Tau Ceti:
- the Hilbert and narrow Hilbert class fields;
- their Artin isomorphisms with the class groups;
- their unramifiedness and maximality;
- the cyclic Hasse norm theorem;
- the ray-class Artin isomorphism of Layer 12.

The contract nonetheless names only the roadmap layers, unlike the ClassicalArithmeticCompletion bullet (README:94, “present at the pins as `TauCeti.IntegralOrder.IsOrder`…”). The “From Tau Ceti” paragraph (README:87) lists the narrow class group but not the narrow Hilbert class field that (C6) of §H6.5 needs.

**Witness.** TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:
- 209 `rayClassArtinEquiv`;
- 241 `hilbertClassField`;
- 246 `narrowHilbertClassField`;
- 306 `narrowHilbertClassArtinEquiv`;
- 380 `fieldRange_le_narrowHilbertClassField_iff`.

Also Global/HasseNorm/Basic.lean:154 `cyclicHasseNorm`. The whole ClassFieldTheory directory has no `sorry`.

**Repair.**
- **README:100.** Add one sentence: Layers 12–13 are present at the pins as
  - `TauCeti.ClassFieldTheory.rayClassArtinEquiv`, `hilbertClassField`, `narrowHilbertClassField`, `narrowHilbertClassArtinEquiv` and `fieldRange_le_narrowHilbertClassField_iff`, in module `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField`;
  - `TauCeti.ClassFieldTheory.cyclicHasseNorm`, in module `…Global.HasseNorm.Basic`.

  The same sentence says that Layer 13 remains the owner of the splitting criterion in the Hilbert class field, which the pin lacks.
- **README:1492.** Append the narrow-class-field names to the Tau Ceti part of the *Needs:* line, beside `NumberField.NarrowClassGroup.instFinite`.

**Test of the repair.**
- `#check @` elaborates every name in the repair at the pin. I checked eight `TauCeti.ClassFieldTheory` names, including all six of the repair.
- `#print axioms` gives only `propext`, `Classical.choice` and `Quot.sound` for `cyclicHasseNorm` and `fieldRange_le_narrowHilbertClassField_iff`.
- With M=ℚ(√19) and N=M(i), the README's own (C6) Check (README:1563) follows from these:
  - N/M is unramified at every finite prime, so `fieldRange_le_narrowHilbertClassField_iff` gives N≤H⁺_M.
  - `finrank_narrowHilbertClassField` (RayClassField.lean:340) gives `[H⁺_M:M]=#Cl⁺(M)=2=[N:M]`.
  - Hence N=H⁺_M, the norm image is trivial, and (C6) fails, as stated.

## Previous findings

- R01 — not repaired: #1722 (797c405) README:268 reads “The order-to-tree comparison is owned here in §1.12”, and README:240 does not cite §§R18.5.16a or R18.5.16c; #2026 (82ce1e4) §1.2 *Needs:* (README:609) omits this roadmap. This is R01 above.
- R02 — not repaired: README:45 still reads “AlgebraicTopology, Layer 6”, and “1652” is absent from the description. This is R02 above.
- R03 — repaired: README:1492 now cites “[ClassFieldTheory](../ClassFieldTheory/README.md) `Layers 12, 13`” and README:3530 “[ClassFieldTheory](../ClassFieldTheory/README.md) `Layer 12`”. Both numbers resolve on main and at every open ClassFieldTheory revision. The repair added Layer 13, which raises R04.

## Verified sound

### Gate, build and form

- **Gate.** I reran the full gate on e3fd9ae. Every rule is 0, it ends `OK`, and it exits 0. The worker's gate.md also reports `build=0`.
- **Dependency check.** Output, exactly: `depcheck: 239 roadmaps, 2357 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output.
  - The file is unchanged and declares nothing.
  - The `#check @` comparison and the one-tactic padding probe are therefore vacuous, and there is no padding.
- **Folder and scope.** The folder holds README.md, Suggested.lean and metadata.toml. Nothing outside the folder changed.

### The changed passages

- **ClassFieldTheory Layer 13 on main.** README:1799–1871 contains every item that README:43 now attributes to it: `cyclicHasseNorm`, `hilbertClassField`, `narrowHilbertClassField`, the maximal unramified properties and the splitting criteria. Layer 12 (README:1724) contains the ray-class factorization `rayClassArtinMap` of the global Artin map.
- **Layer numbers at every open revision.**

  | Copy | Layer 12 | Layer 13 |
  | --- | --- | --- |
  | main | 1724 | 1799 |
  | #617 (3442338) | 759 | 788 |
  | #1215 (b94cfcc) | 1717 | 1806 |
  | #1411 (cded4a2) | 1979 | 2074 |

  overlaps.md lists no dropped id.
- **The “Used in” list of README:43.** Each of the seven sections it names exists and cites the matching supplier in its *Needs:* line:

  | Section | Line | Supplier cited |
  | --- | --- | --- |
  | §R18.1.1a | 1614 | ClassFieldTheory Layer 12 |
  | §R18.3.7 | 2928 | ClassFieldTheory Layer 12 |
  | §R18.4.8 | 3530 | ClassFieldTheory Layer 12 and Chebotarev |
  | §H6.5 | 1492 | ClassFieldTheory Layers 12, 13 |
  | §R18.5.12b | 2074 | ClassFieldTheory Layer 13 |
  | §R18.4.18 | 3736 | Chebotarev |
  | §R18.4.27 | 4082 | Chebotarev |

  - The R18.4 Dependencies line (README:4329) lists ClassFieldTheory and Chebotarev.
  - The R18.5 part 1 line (README:2149) lists ClassFieldTheory (Layer 13).
- **H4 Dependencies (README:1292).** It is complete against its 19 *Needs:* lines.
  - The new ModularCurves (Layers 3B–3D, 8) matches README:1085 and 1087.
  - On main, ModularCurves has 3B at README:1604, 3C at 1659, 3D at 1711 and Layer 8 at 2637.
- **Other new Dependencies items, all on main.**
  - GlobalQuadraticForms §5.5 is at README:665 and §6.1 at README:694.
  - StableReduction Layer 5 is at README:552.
- **Pinned declarations.** I elaborated `#check @` for ten names in a scratch file importing Mathlib and two Tau Ceti modules:
  - eight `TauCeti.ClassFieldTheory` names (R04);
  - Mathlib `HeckeCoset` and `IsHeckeTriple`.

### Ownership and overlaps

- **The R01 heads.** I reread #1722 and #2026 at their new heads (see R01).
- **overlaps.md.**
  - No other open pull request changes this roadmap.
  - No cited id is dropped.
  - The only revision-only ids are R02's.
- **Neighbours.** The vocabulary neighbours (#1007, #1270, #1075, #1824, #1013) were checked in the previous full review, and this change adds no object.

### Seeded sample and headline theorems

- **Seeded sample.** It was verified in full by the previous review (15 targets, table there). No changed line carries a source locator or a statement, so none of the sample falls in the change.
- **Headline theorems.** These are §R18.5.15, §§R18.4.32–R18.4.33, §R18.3.8 and §§H6.2–H6.8.
  - They are unchanged.
  - Suggested.lean names each one as not statable, with the carrier it lacks. This was verified at r12 against Mathlib NumberTheory/HeckeRing/Defs.lean:75 and 157.

### Adversarial pass

Rows for the changed statements, with values:

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| README:43 and §H6.5 (C6), via Layer 13 | `M=ℚ(√19)`, `N=M(i)`; `M=ℚ(√3)`, `N=M(√−7)` | `170²−19·39²=28900−28899=1`, and the conjugate `170−39√19≈0.003>0`, so h⁺=2h=2. `(−4)(−19)=76=disc ℚ(√19)`, so N is the genus field, unramified over M at every finite prime: N=H⁺_M, the norm image is trivial, and (C6) fails. 7∤12 is unramified in ℚ(√3) and ramifies in N, so `N∩H⁺_M=M` and the norm is onto. | Agrees with README:1461 and 1563; see R04 |
| README:43 and §R18.5.12b, cyclic Hasse norm | ℚ(i)/ℚ with a=3 and a=5; ℚ(√13,√17)/ℚ with 25 | 3 is inert with v₃=1, so it is not a local norm and not of the form x²+y². 5=1²+2². 25 is a local norm everywhere but not a global norm, so the cyclic hypothesis is needed. §R18.5.12b applies it to the norm-one torus of a quadratic CM extension E/F, which is cyclic. | Correct |
| §R18.4.8 *Needs:*, Layer 12 | χ∘Nrd; the constant function over ℚ | `(X−χ)(X−qχ)` has sum `(1+q)χ` and product `qχ²`, matching the eigenvalues `T_v=(1+q_v)χ(ϖ_v)` and `S_v=χ(ϖ_v)²`. The constant function has `T_p=p+1`. | Reducible, so Eisenstein; correct |
| README:1292, ModularCurves 3B–3D and 8 | p=2, 3; supersingular E over 𝔽_p | The cyclic subgroups of order p in (ℤ/p)² number p+1=3, 4, which is `[GL₂(ℤ_p):K₀(p)]`. `E[p](k̄)=0`: the naive points are absent while the Drinfeld structures exist (ModularCurves README:1544). | Matches §H4.8; the line is complete |
| README:3356, GlobalQuadraticForms §§5.5, 6.1 | D=(−1,−1)_ℚ | `Nrd=x²+y²+z²+w²`: 7=4+1+1+1, and −1 is not represented. So `Nrd(D×)=ℚ_{>0}=F_+×`. | Matches the §R18.3.7 route (README:2917) |
| README:1759, ClassFieldTheory 12 and StableReduction 5 | §R18.1.1a *Needs:* (README:1614) | The *Needs:* line has {CFT 12, SR 5, SV §§4.1–4.2, 4.9, 8.6–8.7}; the Dependencies line has {CFT 12, SR 5, SV §§P.1, P.3, 8.1–8.5, 8.22}. | CFT and SR are now present; SV is R03 |
| README:1567, H6 Dependencies | 9 *Needs:* lines | The layers used are {H0, H1, H2, H4, H5}; the line has {H0, H1, H4, H5}. SV §8.18 (1415, 1432) and R07.4.20–24 (1492, 1547) are absent. | R03 |
| README:3356, R18.3 part 1 Dependencies | 28 *Needs:* lines | `SR.0:abelian-category` resolves nowhere (#1688 has SR.0.2 at README:662). `HeckeCoset` and `IsHeckeTriple` (2907), AF §§0.6, 5.8a–5.8b, 7.3a, and GL2 R16.4.5, R17.1.1–R17.3.7 are absent. | R03 |
| Repair of the previous R03 | “Layer 12”, “Layer 13” | Main 1724/1799; #617 759/788; #1215 1717/1806; #1411 1979/2074. | It resolves before and after every revision |

Rows carried forward from the previous review (r12, at 8a9e596), for statements this change leaves untouched:

| Statement | Instances (r12) | Values (r12) | Result |
| --- | --- | --- | --- |
| §R18.5.16a item 4 | ℤ/4; ℤ/8; `𝔽₂[x,y]/𝔪²`; I=A | `2·6=12=4·3`; `2·12=24=8·3`; #ℙ¹=12; I=A gives `2≠3` | Correct; `I≠A` is present |
| §R18.5.16a item 1 | `O₀(4)` over ℤ_(2); `ℤ_p+pM₂` | c=0,1,2, meeting in `O₀(2)` or `O₀(4)`; index `p³` | Correct |
| §R18.5.16a Hurwitz | `B_{2,∞}`, level 3 | w=12 and 3; the mass ratio is 4=3+1 | Correct |
| §R18.5.16c, D=23 | weights (2,1,3) | the row sums are 3; `Σ1/w=11/6` | Correct |
| §R18.5.16c, ℚ(√10) | `B(𝔭₂)` | weights `t(12,2,3,4)`; `x²−10y²=±2` is impossible mod 5 | Correct |
| §R18.5.17a | dart (x,y) | `a_*U=q·b_*`; `b_*U=T[y]−[x]` | Correct |
| §R18.3.8 (headline) | MS `ρ_g`, `k=(1 1;0 1)` | `ω⁻¹kω∉GL₂(O)`, so `f(x)=−g(xω⁻¹)` | Correct; MS is corrected |
| §R18.3.8 Checks | `D_{2,∞}`, H maximal | the kernel is `{(c,−c)}`; `T_v−2≡0` | Correct |
| §R18.3.7 ℚ(√3) | narrow class group | `N(2+√3)=1`; h=1 and h⁺=2 | Correct |
| §R18.3.6 | KW09 | `X²−T_vX+N(v)ψ(π_v)` | Correct |
| §R18.4.14 | (2,3,2) and (2,3,1) | `G(0,1)=(3/2,3)`; Δ=0 | Correct |
| §R18.4.30 | `A[[x]]`; M=k | 2=1+1; depth 0<1 | Correct |
| §R18.4.32 (headline) | l=5, l=2 | condition (2) is automatic; l>2 is a standing hypothesis | Correct |
| §R18.4.33 (headline) | `x↦(x,0)` | `Tor₁(C,k)=0` | Correct |
| §R18.4.10 | MS Prop 2.4 | `H⁰` and `H²` vanish at non-Eisenstein m | Correct |
| §§R18.5.15, R18.1.1a (headline) | disc 6, level `1+7M₂(ℤ₇)` | `c₂=4`, `c₂⁻¹=2`, `2·2=4`, order 3 | Correct |
| §H6.5 worked Check | `x³−3x+1`, l=7, p=19 | disc 81; roots 3, 7, 9 mod 19; `343≡1` | Correct |
| §H6.4 (headline) | `+I₂` | `det=1≠−1` | Correct |
| §H2.1 Check | `k[T]/T²` | `dim W=2`, `W^⊥=W` | Correct |
| §R18.3.10 Check | ℚ(√17), (−1,−1) | four ramified places; `v_𝔭(Nrd b)=1` | Correct |
| §R18.3.2 | d=2, k=4 | rank 9; det 4 | Correct |
| §R18.2.2 | compact, free action | g≥2 | Correct |

### Remarks on untouched text

These are noted without an R-number and need no change for acceptance.

- The same Dependencies comparison finds gaps in three layers this change did not edit:
  - H3 (README:921) omits SchemeAndStackFoundations, cited at README:879.
  - R18.2 part 2 (README:2787) omits AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations, cited at README:2701.
  - R18.4 (README:4329) omits AdelicAlgebraicGroups (README:3968), ModularCurvesPartII, AlgebraicModularFormsAndSerreWeights and ArithmeticGaloisRepresentations (README:4046), and DeformationAndDerivedPatchingAlgebra (README:4188).
- The unchanged ClassFieldTheory Layer 12 citations at README:1614 and 2928 are likewise met at the pin by `rayClassArtinEquiv`.

## Not verifiable

- **Voi21, printed pages.** The DOI resolves only to a paywalled page, and the cached author edition is paginated differently. Theorem numbers were verified at r12; the printed pages in §§R18.5.16a and R18.5.16c were not. This is unchanged.
- **Tay02, internal pages.** The scan's text layer does not carry internal page numbers, so the pages of §H6.5's locator cannot be checked. This is unchanged; the change does not touch §H6.5's locator.
- **Sources outside the r12 sample.** They were not reread, because no changed line cites a source.

## Source issues

- none
