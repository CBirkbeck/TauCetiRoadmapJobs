# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 8a9e596)

**Verdict:** needs changes

This is a full review of the folder. The head is the same one the previous review read.

There are three findings:
- R01 (P2) carries over and has a second witness this round.
- R02 (P3) carries over.
- R03 (P2) is new. An open revision of ClassFieldTheory renames a heading that two *Needs:* lines link to.

R03 is repaired in this folder. R01 is repaired in two other pull requests, and R02 in this pull request's description.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers in other roadmaps refer to the raw README at the head named.

## R01 (P2) — Eichler orders and Brandt matrices have second owners in later roadmaps

Carried over: R01 of the previous review and of the seven reviews before it. No repair report marks it `not actionable in this package`. This round adds a second later roadmap.

**Location.** README:9: “For quaternion orders they are Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level (§§R18.5.16a, R18.5.16c)”.

**Claim.**
- This roadmap is at merge-order line 160. It owns the local form of Eichler orders (§R18.5.16a item 1, including the two maximal orders at the ends of the path of length e in the tree). It also owns the neighbour ideals and Brandt matrices (§R18.5.16c).
- Two later open roadmaps state these objects again and cite neither section:
  - QuaternionArithmetic consumes R18.1, §R18.3.1 and §R18.5.17a (its README:169–170), so it comes later.
  - ArithmeticFuchsianGroups is at merge-order line 284.

**Witness.** #1722 (75c9080): README:660 “### 1.9 Eichler orders”, Suggested.lean:216 `def IsEichler`, Brandt matrices §§7.1–7.3, no “R18.5.16”. #2026 (c567d7a) README:429–431: “adjacent vertices correspond to maximal orders meeting in an Eichler order of level `v`”; its *Needs:* (README:457–460) omits this roadmap.

**Repair.** Nothing in this folder changes.
- **In #1722:**
  - §§1.9, 1.10 and 1.12 cite §R18.5.16a, items 1–4.
  - §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level.
  - Each kept variant says in one clause how it differs.
  - The consumed list (README:169–170) adds §§R18.5.16a and R18.5.16c.
- **In #2026:**
  - In the order-to-tree adapter of §1.2, the clause on adjacent vertices and Eichler orders of level `v` cites §R18.5.16a item 1 at e=1.
  - The *Needs:* line of §1.2 adds HilbertModularVarietiesAndShimuraCurves §R18.5.16a.

If either edit cannot be made there, the repair report records this finding as `not actionable in this package`, with that reason.

**Test of the repair.**
- **#1722, D=11.** README:1508 gives `T(2)=[[1,3],[2,0]]` and `T(3)=[[2,3],[2,1]]`, with weights (2,3).
  - The transposes are `B(2)=[[1,2],[3,0]]` and `B(3)=[[2,2],[3,1]]`.
  - Their rows sum to 3 and 4, which is `q_v+1` (§R18.5.16c item 2).
  - Weighted symmetry (item 4, with `s_v` trivial over ℚ) holds for both: `w₂B₁₂=3·2=6=2·3=w₁B₂₁`.
- **#2026, v=2 over ℚ.** `M₂(ℤ₂)∩End(ℤ₂⊕2ℤ₂)=O₀(2)` and `[GL₂(ℤ₂):K₀(2)]=2+1=3`. This agrees with #2026's own Check “`Γ₀(2)`, of index `3`” (README:453) and with §R18.5.16a items 1 and 4 at e=1.

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over: R02 of the previous review.

**Location.** README:45: “| AlgebraicTopology, Layer 6 | Direct and cellular cochains and cohomology with local coefficients, the cellular-to-singular comparison…”. The citation also appears at:
- README:100;
- README:3603;
- README:3611 (anchor `#layer-6-cohomology-products-and-manifold-duality`).

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in the Depends-on list nor in the merge-order paragraph.

**Witness.** On main (39d3d60), AlgebraicTopology README:946 is “## Stage 6: cohomology, products, and manifold duality”. At #1652 (287181d), README:1655 is “## Layer 6: …”. “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Place #1652 before this pull request in the merge-order paragraph.
- Leave the README as it is: #1652 README:601 maps “Stage 6 items 0–5” to §§6.0–6.5, so Layer 6 is the numbering that survives the merge.

**Test of the repair.** overlaps.md lists two “only an open revision defines” items: “Layer 6” at README:45, 3603 and 3611, and the anchor at README:3611. Both name #1652.

## R03 (P2) — Two *Needs:* links use a ClassFieldTheory anchor that #617 renames

New this round.

**Location.** README:1492 and README:3530 both cite “Tau Ceti roadmap [ClassFieldTheory, layer 12 separate arithmetic global existence the norm index and the global correspondence](…/ClassFieldTheory/README.md#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence)”.

**Claim.**
- Both are supplier citations, in the *Needs:* lines of §H6.5 and §R18.4.8.
- #617 (kim-em) revises ClassFieldTheory and renames the heading. Once it merges, the anchor and the link text no longer exist.
- Neither line cites the heading as it is at #617's head.

**Witness.** Main (39d3d60), ClassFieldTheory README:1724: “### Layer 12: separate arithmetic global existence, the norm index, and the global correspondence”. #617 (b254b25), README:639: “## Layer 12: global existence, the norm index, and the global correspondence”.

**Repair.**
- In both *Needs:* lines, replace the link with ``[ClassFieldTheory](../ClassFieldTheory/README.md) `Layer 12` ``. README:2928 already uses that form, and README:43, 100 and 1614 cite “ClassFieldTheory Layer 12” in plain text.
- Do not cite #617's new anchor: that would make another author's revision a dependency.

**Test of the repair.** “Layer 12” numbers the same layer on main (README:1724) and at #617 (README:639), with the same content: global existence, the norm index and the correspondence. The repaired citation therefore resolves before and after #617 merges.

## Previous findings

- **R01 — not repaired.** #1722 is still at 75c9080, with `def IsEichler` (Suggested.lean:216) and §§1.9, 7.1–7.3 citing no section of this roadmap. This round also adds #2026. This is R01 above.
- **R02 — not repaired.** README:45 still reads “AlgebraicTopology, Layer 6”, and the description still does not mention #1652. This is R02 above.
- **R03 of the review before (HodgeTateAndCanonicalSubgroups bullet).** This is still repaired: README:4432 is unchanged.

## Verified sound

### Gate, build and form

- **Gate.** Rerun of the full gate: every rule is 0 and it ends `OK` (exit 0). The worker's gate.md also has `build=0`.
- **Dependency check.** Output, exactly: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output.
  - The file declares nothing (`module`, `public import Mathlib`, `@[expose] public section`, empty namespace). Fifteen Suggested.lean files on main use the same `public import Mathlib` form.
  - Because nothing is declared, the `#check @` comparison and the one-tactic probe are vacuous, and there is no padding.
- **Folder contents.** README.md, Suggested.lean and metadata.toml. No change outside the folder.
- **Policy scans.**
  - None of the 15 roadmaps on the never-cite list occurs in the README.
  - The 12 hits of “removed” are all mathematical (for example README:1767, “with infinity removed”).
  - The `#414` and `#772` hits are heading anchors, not pull-request numbers.
  - There is no LaTeX.
- **Pinned declarations.** All 73 Mathlib and Tau Ceti names the README cites resolve at the pins:
  - 62 by `#check` in a scratch file importing Mathlib and 13 Tau Ceti modules;
  - 4 in modules not imported there: `DoubleCoset.quotientMapOfLERight` and its `_trans` and `_surjective` (TauCeti/GroupTheory/DoubleCoset/Map.lean:79, 108, 116), and `DoubleCoset.doubleCoset_inv` (Inv.lean:40);
  - 6 by reading the source, because their modules have no object file: `TauCeti.SU2.symPower` and `finrank_symPower` (SU2/SymmetricPower.lean:97, 114), `isIrreducible_symPower` (Irreducible.lean:164), `existsUnique_nonempty_equiv_symPower` (Exhaustion.lean:298), and `NumberField.card_elementaryTwoQuotient_units` and `units_sq_index_eq` (Units/ElementaryTwoQuotient.lean:62, 84);
  - 1 that is a module name, `TauCeti.GroupTheory.DoubleCoset.Fiber`.

### Citations

- **Relative supplier anchors.** All 18 resolve: ClassicalArithmeticCompletion on main; AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GL2AutomorphicRepresentationsAndTransfer and NeronModelsAndSemistableAbelianVarieties at their heads.
- **`blob/main` anchors (16).**
  - 8 resolve on main: Chebotarev, JacobianChallenge, QuadraticFormInvariants and five StableReduction layers.
  - 6 resolve at the heads of open suppliers: ALS.5a.4, AutomorphicSpectralTheory §4.5, ComplexComparisonPartII C6.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.30, LocalGaloisDeformationRings §1.1 and ShimuraVarieties P.1.
  - The AlgebraicTopology anchor is R02, and the ClassFieldTheory anchor is R03.
- **AL.2.2.1 contract.** At #924, README:1275–1277 defines `K₀(Pⁿ)` and `K₁(Pⁿ)`, proves `K₁⊆K₀`, and states that at positive depth `K₁` is normal and the lower-right entry gives `K₀/K₁≅(O/Pⁿ)×`. That is exactly what README:9 and README:40 import.
- **Citation leads.** All five in citations.md resolve:
  - `LocallySymmetric.FrankeInput`: #871 README:4386;
  - `LocallySymmetric.SheafDerived.isoSingular`: #871 README:832;
  - `OrderIdeles.unit_change`: ClassicalArithmeticCompletion README:16155 on main;
  - `CanonicalModel.minimal_defined_over_reflex`: #933 README:2782;
  - `TauCeti.RingTheory.IntegralOrder.LeftOrder`: a Tau Ceti module that defines `Submodule.leftOrder` (line 61).
- **AdicSpacesPartIII.** It is on main, and F0.8 is its README:3525, as §R18.5.15 states.

### Supplier order and consumers

- **Suppliers on main.** ReductiveGroupsPartII, ClassicalArithmeticCompletion, QuadraticFormInvariants, StableReduction, AlgebraicVectorBundles, JacobianChallenge, ModularCurves, Completed/Chebotarev, AlgebraicTopology, GlobalQuadraticForms, ClassFieldTheory, AdicSpacesPartIII.
- **Open suppliers, all earlier than this roadmap's line 160.** SmoothRepresentationsOfLocalGroups 25, IntegralHeckeAndGaloisDeterminants 26, AbelianSchemesAndArithmeticModuli 41, AdelicAlgebraicGroups 52, ArithmeticLocallySymmetricSpaces 59, AutomorphicFormsOnReductiveGroups 60, NeronModelsAndSemistableAbelianVarieties 66, ModularCurvesPartII 71, DeformationAndDerivedPatchingAlgebra 78, AutomorphicLFunctionsAndLocalFactors 94, GL2AutomorphicRepresentationsAndTransfer 100, ShimuraVarieties 105, PELModuli 115, ShimuraData 116, WeightsInEtaleCohomology 147.
- **Consumers, all later.** SerreWeightAndLevelOptimisation 163, AutomorphicGaloisRepresentations 165, PadicFamilies 171, OrdinaryAutomorphicFormsAndModularityLifting 172, GL2ModularityLifting 173, PotentialModularityAndCompatibleSystems 174, HodgeTateAndCanonicalSubgroups 182, CompletedCohomologyAndLocalGlobalCompatibility 249, GrossZagierAndArithmeticHeights 339, Part II 353, HeegnerPointEulerSystems 372. QuaternionArithmetic is not yet in the order; it is new and consumes this roadmap.
- **Earlier roadmaps that mention this one.** They mention it only as a consumer: AdelicAlgebraicGroups README:5723, NeronModelsAndSemistableAbelianVarieties README:2908 and 4497, GL2AutomorphicRepresentationsAndTransfer README:3434, PELModuli README:248 and 4154, ShimuraVarieties README:2923.

### Ownership against open pull requests

I checked the sibling checkouts in the brief and `roadmaps grep` over every head.
- QuaternionArithmetic (#1722) and ArithmeticFuchsianGroups (#2026): see R01.
- HilbertModularForms (#1724) takes Eichler orders and Brandt matrices from QuaternionicModularForms (README:189, 2312). This roadmap may not cite that roadmap, so it owns them itself; that is not a defect here.
- HilbertModularSurfaces (#1730) uses an Eichler order (README:1179) without defining one.
- Part II (#1745) consumes this roadmap (README:7, 60).
- No other object was found with two owners.

### Seeded sample

The worker's 15 sample entries are kind labels, not section numbers. I mapped each to a target whose source I could read.

| # | Label | Target | Source read (locator, cache line) | Result |
| --- | --- | --- | --- | --- |
| 1 | Definition | §R18.5.16a | Voi21 Def 23.4.1 and Prop 23.4.3 (15523–15542); proof by Smith form over a PID (15547–15558); 23.4.12 discrd `𝔭^e` (15711); Lemma 26.4.1 (17923); Lemma 26.6.7 (18251); Lemma 27.6.8 (19225) | Numbers and content match. Item 1 over every DVR is justified, because the proof uses only that the base is a PID. |
| 2 | Construction | §R18.5.17a | Zha14 §3.4 (594), (3.14)–(3.17) (629–650); PDF pp.18–19 are printed pp.208–209 | Two vertex copies `V₀⊔V₁`, as the Check says. |
| 3 | Theorem | §R18.3.8 | MS19 §6.2 and Thm 6.8 with proof (1718–1754, pp.34–35); §2.11 (481–489, p.10); §2.6 (365–367) | Hypotheses match. The README's `ω⁻¹` correction is right (Source issues). |
| 4 | Definition | §R18.5.16c | Voi21 (41.2.3) (31606); Def 41.2.4 (31614); Prop 41.4.3 with (41.4.5) (31878–31880) | Voight counts `J⊆I_j` in class i, so his matrix is `B(v)ᵀ`. His adjoint law `T*=P(𝔫⁻¹)T` is item 4. |
| 5 | Comparison | §R18.4.24a | Sai09 §7, Lemma 4 (1373–1400, p.32); §8, Tsuji comparison (1452–1470, p.34) | Supported. §8 runs to p.37 (line 1643), and the comparison lies within the cited pp.32–36. |
| 6 | Definition | §R18.3.1 | KW09 display (5) (2720–2725, p.59); §7.2 (2832, p.61) | `Γ_t=(U(A_f)×∩t⁻¹D×t)/F×` matches (5). |
| 7 | Definition | §R18.4.14 | MS19 §2.6 (363, p.8), §2.7 (373, p.8), §2.11 (481–494, p.10) | The degeneracy maps and `π*` are as used. The Gram matrix is derived in the README (see the table below). |
| 8 | Application | §R18.4.10 | MS19 Prop 2.3 (444, p.9), §2.10 (472, p.10), Prop 2.4 (478–480, p.10) | `H⁰` and `H²` are Eisenstein, which gives the vanishing after localization. |
| 9 | Comparison | §R18.3.6 | KW09 `T_v`, `S_v=ψ(π_v)` (2726–2744, p.59); `X²−T_vX+N(v)ψ(π_v)` (3017–3019, §7.4, p.65) | Matches. |
| 10 | Comparison | §R18.4.9 | MS19 §2.7 (373, p.8), Prop 2.3 and proof (444, pp.9–10) | Supported. |
| 11 | Theorem | §R18.4.32 | MS19 §6.1 (1668–1675); Thm 6.5 with Remarks 6.6–6.7 (1700–1717, p.34); proof (1931–1958, p.38) | Conditions (1) and (2) and the `√5∉F` remark match. |
| 12 | Comparison | §R18.1.1a | BZ22 (1.1) (27, p.1); Thm 6.7 and its diagram (2559–2575, p.49); (7.1)–(7.2) (2681, 2706, p.52); Prop 8.4 and (8.11) (2860–2892, p.55); Cor 8.5 (2898, p.56) | All locators are correct. BZ's descent `id×|Π⁻¹×τ_c` is the README's `D_BZ`. |
| 13 | Theorem | §R18.4.33 | MS19 Thm 6.5 (1700, p.34), §2.10 (472, p.10), Lemma 6.4 (1686–1698, p.34) | Inputs located; saturation is derived in the README (see the table below). |
| 14 | Theorem | §R18.4.30 | MS19 Lemmas 5.1–5.3 (1568–1644, pp.31–33); Props 6.10–6.12 (1875–1930, pp.37–38); Prop 3.7 (772–782, p.16) | Statements match. The README's ambient-ring correction is right, and its four-variable Check matches Prop 3.7. |
| 15 | Theorem | §R18.5.15 | BZ22 (6.29)–(6.31) (2412–2423); Thm 6.7 and Cor 6.8 (2559–2580, pp.49–50) | Hypotheses and conclusion match. |

### Headline theorems

From README:3, the headline theorems are:
- the Čerednik–Drinfeld uniformisation (§R18.5.15);
- the Ihara lemma with its integral saturation (§§R18.4.32–R18.4.33);
- the definite Ihara lemma (§R18.3.8);
- the paired torsion twists with local points (§§H6.2–H6.8).

None of them is statable at the pins:
- Mathlib's `IsHeckeTriple` and `HeckeCoset` (NumberTheory/HeckeRing/Defs.lean:75, 157) are abstract double cosets.
- Neither Mathlib nor Tau Ceti has the units of `D⊗A_{F,f}` with their local components, an Iwahori subgroup or an Eisenstein maximal ideal. A grep of both pins finds only classical Eisenstein series spaces.
- Even §R18.3.8 would therefore need a long ad hoc encoding.

The docstring names each headline group and the carrier it lacks, so the empty file is correct.

### Adversarial pass

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §R18.5.16a item 4, indices | `A=ℤ/4`; `A=ℤ/8` with I=0; `A=𝔽₂[x,y]/𝔪²` with I=0; I=A | ℤ/4: #ℙ¹=6 and 12 unimodular rows, so `2·6=12=4·3` and `4·12=48=16·3`. ℤ/8: #ℙ¹=12 and `2·12=24=8·3`. `𝔽₂[x,y]/𝔪²`: 64−16=48 rows, 4 units, #ℙ¹=12=8·3/2. I=A: index 1, but `q·1=2≠1·3`. | Correct; the needed `I≠A` is present |
| §R18.5.16a item 1 and Checks | `ℤ_(2)` with `O₀(4)`; `ℤ_p+pM₂(ℤ_p)` | Maximal orders above `O₀(4)`: c=0,1,2. The pairs meet in `O₀(2)`, in `(A 𝔭⁻¹;𝔭² A)≅O₀(2)` and in `O₀(4)`. The index of `ℤ_p+pM₂` is `p⁴/p=p³`, and its only idempotents are 0 and 1. | Correct |
| §R18.5.16a Hurwitz Check | `B_{2,∞}`, level 3 | `|O×|=24`, w=12. `SL₂(𝔽₃)` acts on 4 points with stabilizer 24/4=6, so w=3. The masses are 1/12 and 1/3, with ratio 4=3+1. | Correct |
| §R18.5.16a coset Checks | `w=(0 −1;1 0)`, `k=(1 1;0 1)`; `n=(0 1;ϖ^e 0)` | `wk=(0 −1;1 1)` has bottom row (1,1)≠(1,0). `n(a b;c d)n⁻¹=(d cϖ^{−e};ϖ^e b a)`. | Correct |
| §R18.5.16c, D=23 Check | weights (2,1,3) | Row sums 3,3,3. `B·diag=((2,2,0),(2,1,3),(0,3,0))` is symmetric; `diag·B=((2,4,0),(1,1,1),(0,9,0))` is not. `Σ1/w=11/6=(23−1)/12`. | Correct |
| §R18.5.16c, `ℚ(√10)` Check | `B(𝔭₂)` as printed | `w₄B₁₄=12=w₁B₄₁`, `w₃B₂₃=6=w₂B₃₂`, `w₄B₂₄=4=w₂B₄₂`, so the weights are `t(12,2,3,4)`. `Σ1/w=7/6` at t=1 and 7/12 at t=2. `x²−10y²=±2` is impossible mod 5, so `𝔭₂` is not principal. | Correct |
| §R18.5.16c against #1722 (R01 test) | D=11, w=(2,3) | `B(2)=[[1,2],[3,0]]` has row sums 3; `B(3)=[[2,2],[3,1]]` has row sums 4. For both, `w₂B₁₂=6=w₁B₂₁`. | The R01 repair is consistent |
| §R18.5.17a incidence identities | dart (x,y) on the tree `T_r` | `a_*U(x,y)=q[y]=q·b_*`. `b_*U(x,y)=Σ_{z~y,z≠x}[z]=T[y]−[x]`. | Correct; the common kernel is preserved |
| §R18.3.8 (headline): kernel relation | MS `ρ_g[γ]=[γg]` and `π₂=ρ_{ω⁻¹}`; `k=(1 1;0 1)` | `f(x)=−g(xω⁻¹)`. `ω⁻¹kω=(1 ϖ⁻¹;0 1)∉GL₂(O)`, whereas `ω(a b;c d)ω⁻¹=(a ϖb;c/ϖ d)∈GL₂(O)` for c∈ϖO. | Correct; the README corrects MS |
| §R18.3.8 Checks | F=ℚ, `D_{2,∞}`, H maximal | #Y_H=1 and the kernel is `{(c,−c)}`. `T_v−2=q_v−1≡0` for v split in `ℚ(ζ_l)`, so the ideal is Eisenstein. | Correct |
| §R18.3.7, `ℚ(√3)` Check | narrow class group | `N(2+√3)=+1`. `x²≡2 mod 3` is impossible. The Minkowski bound is `√12/2≈1.73<2`. Hence h=1 and h⁺=2. | Correct |
| §R18.3.6 against KW09 | `S_v`, Satake polynomial | `S_v` acts by `ψ(π_v)` (p.59), and the Satake polynomial is `X²−T_vX+N(v)ψ(π_v)` (p.65). | Correct |
| §R18.4.14 Gram operator | (q,T,S)=(2,3,2) and (2,3,1); general | The first entry of GJ is `((q+1)²−S⁻¹T²)x`. For (2,3,2): `G(0,1)=(3/2,3)`. For (2,3,1): Δ=9−9=0 and `G(1,−1)=(0,0)`. | Correct |
| §R18.4.30 regular-base flatness | `A=k[[t]]` with `R=A[[x]]`, M=R; R=A with M=k; ambient rings | 2=1+1, so flat. depth k=0<1, so M=k is not MCM and not flat. In `R^ps=F[[X,Y,P,R]]/(X²Y)`, XY≠0, so it is not a B-algebra, and `M(σ_ps)` is not an `R^unip`-module. | Correct; the README corrects MS p.38 |
| §R18.4.30 four-variable Check | MS Prop 3.7 | `F[[X,Y,P,R]]/(XY)` has dimension 3=2²−1. | Correct; the Q on MS p.37 is a misprint |
| §R18.4.32 (headline) | l=5 with √5∉F; l=2 | MS condition (2) is automatic; l>2 is a standing hypothesis. | Correct |
| §R18.4.33 (headline) | `O→O², x↦(x,0)`; a reduced map that is injective | The cokernel is O. Mod λⁿ it is `O/λⁿ`, free but with λ-torsion. `Tor₁(C,k)=ker(f⊗k)=0`, so C is torsion-free. | Correct |
| §R18.4.10 | MS Prop 2.4 | `H⁰` and `H²` vanish at non-Eisenstein m. The coefficient sequence shows that `H¹(L_O)_m` has no λ-torsion. | Correct |
| §§R18.5.15 and R18.1.1a (headline) | disc 6, level `1+7M₂(ℤ₇)`; `M₂(ℚ)` | `c₂=2⁻¹≡4 mod 7`, `c₂⁻¹=2`. The central contribution is `c₂²=16≡2`, and `2·2=4`; both classes have order 3. For `M₂(ℚ)`, `inv₂=0`, so it is excluded. | Correct |
| §R18.5.15 against BZ22 | Thm 6.7 diagram; Cor 6.8 | BZ's descent `id×|Π⁻¹×τ_c` (line 2570) is the README's `D_BZ`. Stability holds only for small `K^p`. | Correct |
| §H6.5 (headline input), worked Check | `x³−3x+1`, l=7, p=19 | disc 108−27=81; no root mod 7. Roots 3, 7, 9 mod 19 (19, 323=17·19, 703=37·19). `π₇³=−10−9√−3`, of norm 343. `√−3≡±4 mod 19` gives 11 and 7. `343≡1 mod 19`, so both `ψ̄` are 1. | Correct |
| §H6.5 (C6) | N/M ramified at a finite place | `N⊄H⁺_M`, so `N∩H⁺_M=M` and the norm `Cl_N→Cl⁺_M` is onto. | Correct |
| §H6.4 (headline) | real elliptic curve; `+I₂` | Complex conjugation has eigenvalues ±1 and determinant −1, while `det(+I₂)=1≠−1`. | Correct |
| §H2.1 Check | `k[T]/T²`, `W=T·(k[T]/T²)²` | `dim_k W=2`. `⟨ae₁+be₂,Te₁⟩=−bT` and `⟨ae₁+be₂,Te₂⟩=aT`, so `W^⊥=W`. W is killed by T, so it is not free. | Correct |
| §R18.3.10 Check | `ℚ(√17)`, `D=(−1,−1)` | 17≡1 mod 8, so 2 splits, and `(−1,−1)_{ℚ₂}=−1` at both dyadic places: four ramified places. `b=i+j` has `b²=−2` and `Nrd b=2`, with `v_𝔭=1`, which is odd. | Correct |
| §R18.3.2 | d=2, k=4; `Sym²(ℤ₂²)` | The rank is 3²=9. The Gram matrix `((0,0,2),(0,−1,0),(2,0,0))` has determinant 4. | Correct |
| §R18.2.2 | compact quotient with free action | `2g−2=area/2π>0`, so g≥2. | Correct |
| R03 (test of the repair) | “Layer 12” | Layer 12 is numbered 12 both on main (README:1724) and at #617 (README:639). | The repair resolves at both |
| Statability of the headlines | pins | Defs.lean:75 and 157 are abstract; there are no adelic quaternion units, no Iwahori subgroup and no Eisenstein ideal. | Not statable; the empty file is correct |

## Not verifiable

- **Voi21, printed pages.** The sources service treats DOI 10.1007/978-3-030-56694-4 as a paywalled host: “the citation resolves only to a paywalled page”. The cached author edition v1.0.5 is paginated differently. For example, Def 23.4.1 is on p.372 there, against the README's p.382, and (41.2.3) on p.754, against pp.767–768. Theorem numbers and contents were verified; the printed pages in §§R18.5.16a and R18.5.16c were not.
- **Tay02, internal pages.** The author's PDF extracts as a 195-page bitmap-font scan.
  - The statement of Lemma 1.4 (an M-HBAV at every infinite place) is readable at Tay02 lines 2405–2440.
  - Its internal page cannot be read from that text.
  - Nor can the (O2) remark of §H6.5 on Taylor's description of the l-torsion be checked.
- **Sources outside the sample.** BC91, YZ18, DP94, Rap78, Car86, Car86a, KL05, AIP, BHW23, CDN20, CDN23, KRZ20, EGS15, NT16, JL70, Kis08, Tay06, Tay89, Dim05, Dia21, Del80, Kur79, Mil, PRR23, Conrad and ACC+23 were not reread this round.

## Source issues

- **Misprint** in MS19 at the proof of Theorem 6.8, p.35: the source says the kernel relation is f(x) = −g(xω); it should be f(x) = −g(xω⁻¹), since π₂ = ρ_{ω⁻¹} (§2.11, p.10) and ρ_g[γ] = [γg] (§2.6); affects the proof.
- **Misprint** in MS19 at the proofs of Propositions 6.11–6.12, p.38: the source says Lemma 5.2 is applied over `R^unip_∞⊗F` and Lemma 5.3 over `R^ps_∞⊗F`; it should be the reverse (5.2 needs the X²Y ring carrying M(σ_ps), 5.3 the XY ring); affects the proof.
- **Misprint** in MS19 at §6.4, p.37: the source says Proposition 3.7 gives local rings in five variables X, Y, P, Q, R; it should be four (X, Y, P, R), as in Proposition 3.7 (p.16) for the fixed-determinant ring; affects nothing.
