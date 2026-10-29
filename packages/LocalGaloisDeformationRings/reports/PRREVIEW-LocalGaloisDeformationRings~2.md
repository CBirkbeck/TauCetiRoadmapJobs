# Review of LocalGaloisDeformationRings (pull request #923 at 3580989)

**Verdict:** accepted

This is a full re-review of the repaired head (1031 changed lines since `4fda98c`). The previous review's seven findings were checked one by one first (below), then the whole README (4057 lines, 194 targets, 467 Check bullets) and `Suggested.lean` (9 declarations) were reviewed again. No P1 or P2 finding survives; the five findings below are P3 and are the author's to take or leave.

## Repairs of the previous review

| Previous finding | Passage at 3580989 | Status |
|---|---|---|
| R01 (P2) rank-two Taylor–Wiles hypotheses | `README.md:1834`: "assume that `ρ̄` is unramified and that `ρ̄(φ)` has an ordered pair of distinct eigenvalues `ᾱ≠β̄` in `k` … Fix an unramified determinant"; the ramified `S₃` example is now the first Check (line 1838) with `σ̄=I` as positive control (1839). Gee22 line 907–908 states exactly these hypotheses. | repaired |
| R02 (P2) `GSp₄` Taylor–Wiles hypotheses | `README.md:1946`: "assume that both `ρ̄\|G_{F_v}` and the fixed multiplier `ψ\|G_{F_v}` are unramified"; the `𝔽₄₉` counterexample is the first Check (1950), `σ̄=I` the control (1951). | repaired |
| R03 (P2) duplicate generic lifting functors | `README.md:209`: "The carrier is the framed lifting functor of PadicLocalLanglandsForGL2Qp, §0.4 … this roadmap does not construct a second one"; 291 (strict classes "is the unframed strict-conjugacy functor of … §0.4"); 411 (fixed determinant "is the fixed-determinant fibre of … §0.4"). The supplier's §0.4 (read at its open head) defines `DeformationSupport.framed`, `.unframed`, `fixedDeterminant`, `forgetFrame`, `pstRing`, `crystallineRing` as cited. | repaired |
| R04 (P2) completed-node headline absent | `Suggested.lean:78–91` now declares `completedNodeIdeal`, `CompletedNode` and `completedNode_isDomain_flat` over a DVR with `π ≠ 0`, `¬IsUnit π`, `IsUnit u`, completeness not assumed; `README.md:3737` states the same. | repaired |
| R05 (P3) HTML anchors | 0 occurrences of `<a id=`; gate `residue=0`. | repaired |
| R06 (P3) undeclared own API names, layer endings, Lean layer comments | Layers F and 0 now end with `### Examples`/`### Dependencies` (1139–1145, 1263–1269); `Suggested.lean` has `/-! ### Layer … -/` comments (50, 75, 93). But 194 backticked dotted names of this roadmap's own remain (e.g. `OrdinaryWithEigenvalue.beta_relation` at 3007, `UniversalDeformation.surjective_of_traces` at 704, `TaylorWilesBlock.rank2` at 2058, the five names in Downstream consumers 3909–3911), none declared in `Suggested.lean`. | partly; see R01 below |
| R07 (P3) malformed block-supplier locator | 0 occurrences of `§PadicLocalLanglandsForGL2Qp`; line 17 now reads "PadicLocalLanglandsForGL2Qp, §§5.4–5.6 and 5.12". | repaired |

## R01 (P3) — Own backticked API names not declared in `Suggested.lean`

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3007` "`OrdinaryWithEigenvalue.beta_relation`: `β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0`"; also 704, 2058, 3909–3911 and 190 further dotted names (the resolver's list).

**Claim:** Line 77 says API names "are intended for `TauCetiRoadmap.LocalGaloisDeformationRings`", so each backticked own name is a claim that the acceptance file declares it.

**Witness:** `Suggested.lean` declares exactly `oddRealIdeal`, `OddRealRing`, `oddRealRing_geometry`, `completedNodeIdeal`, `CompletedNode`, `completedNode_isDomain_flat`, `IsDetOrdinary`, `HasOrderedTriangularization`, `det_ordinary_iff_ordered_triangularization`. None of the 194 dotted names above is among them. (Carried over from the previous R06; not re-raised as blocking, the gate's `readme-ids-missing` counter accepts them.)

**Repair:** Write the API bullets in prose ("the eigenvalue relation `β² − tβ − t = 0` with `t = tr Φ − 2`"), keeping backticks only for the nine declared names and for library or supplier declarations. The mathematics of every bullet is unchanged; the eigenvalue relation at 3007 was recomputed: `α = 1 + β` is a root of `X² − (2 + t)X + 1` exactly when `β² − tβ − t = 0`.

## R02 (P3) — Supplier declaration name that the supplier does not declare

**Location:** `README.md:794` "and §7.2 (`GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`)"; same name at 960.

**Claim:** ArithmeticGaloisRepresentations §7.2 is cited as supplying a declaration of that name.

**Witness:** `roadmaps grep` finds the name in no roadmap other than this one. ArithmeticGaloisRepresentations at its open head, §7.2 ("Adjoint, trace pairing and Schur's lemma", its line 4205 onwards) states the fact in prose: for `A` local and `ρ` with absolutely irreducible reduction, `ρ(Γ)` spans `M_n(A)` and its centraliser is `A` (CHT Lemma 2.1.8), with no Lean name. Its §5.10 does declare `GaloisRep.carayol_conj_of_trace_eq`, which line 793 cites correctly.

**Repair:** Replace the parenthesised name by "ArithmeticGaloisRepresentations §7.2, Schur's lemma over a local ring (span and scalar centraliser)". The mathematics F.2.7 and F.2.8 need is exactly what that section states.

## R03 (P3) — Stale target-id self-reference

**Location:** `README.md:2451` "`LocalGaloisDeformationRings:R08.4` is the finite-flat deformation-ring layer (Layer 4 here); its Savitt ring presentations are target 4.2."

**Claim:** A Layer 3 Dependencies paragraph refers to this roadmap by a catalogue id of the form `R08.4` that occurs nowhere else in the README.

**Witness:** `grep 'R08'` finds only this line; every other internal reference uses layer and target numbers. The sentence is process vocabulary from the target catalogue, which the README form excludes.

**Repair:** "Layer 4 is the finite-flat deformation-ring layer; its Savitt ring presentations are target 4.2", or delete the sentence (Layer 3's Dependencies paragraph already names Layers 1–2 and the suppliers).

## R04 (P3) — Unnumbered subsection owned by a later target

**Location:** `README.md:1182–1204` "### Ordinary flag definitions for 1.7 … Target 1.7 owns the following common predicate and elementary flag API".

**Claim:** The ordinary-flag predicate `IsOrdinaryOfWeight`, `IsSemistableOrdinaryOfWeight` and their API are defined inside Layer 0 under a heading that is not a numbered target, and are said to be owned by 1.7 in Layer 1, while 0.3 (Layer 0) consumes them.

**Witness:** Every other subsection of the layers is `### k.n <topic>`; 0.3's Needs line (1230) links to the anchor `#ordinary-flag-definitions-for-17`, and 1.7 (1382) says "Use the common predicates … in the ordinary flag definitions". The content itself is sound (the four Checks compute correctly; over `A = ℤ₂[e]/(2e,e²)` the two lines `A·e₁` and `A·(e₁+e·e₂)` are both stable of character 1 with quotient `ε⁻¹`, since `e·ε⁻¹(g) = e`).

**Repair:** Number it as a Layer 0 target ("0.2.1 The ordinary flag predicate and its elementary API"), let 0.3 and 1.7 cite 0.2.1, and drop "Target 1.7 owns" (ownership follows the layer of definition). No mathematics changes.

## R05 (P3) — Check with an unstated labelling convention

**Location:** `README.md:2626` "choose `v=(2,2,0,0)`, with rank 2 at the roots of `Q`. The height-one Frobenius matrix `P(u)I₂` gives a type-`v` lift".

**Claim:** The Check assigns the type's rank-2 labels to the roots of `Q` while the exhibited lattice has `det φ = P(u)²`, supported at the roots of `P`.

**Witness:** With `E_K = PQ`, `P ≡ u²`, the lattice with Frobenius `P(u)I₂` has `coker(1⊗φ) = (𝔖/P)²`, killed exactly at the roots of `P`. Whether `v_ψ` records the cokernel rank or its complement `d − v_ψ` is not stated in 4.9 or 3.1, and the formulas elsewhere (4.6: `d² + Σ_ψ (d−v_ψ)v_ψ`) are symmetric in the two conventions, so the Check cannot be evaluated as written. The rest of the Check was recomputed and is right: `φ(ue_i) = u³e_i = u²(ue_i)` gives `diag(u²,u²)`, `φ(u²e₂) = u⁴(u²e₂)` gives `diag(1,u⁴)`, the Jordan types of `im φ/u⁴𝔐` are `(2,2)` and `(4)`, and only `(2,2)` satisfies `u² = 0`.

**Repair:** State the determinant law used ("`det φ = ∏_ψ (u − ψ(π))^{v_ψ}` up to a unit, so `v_ψ` is the cokernel rank at `ψ`") and then write "rank 2 at the roots of `P`" (or use `Q(u)I₂`). One sentence; no other target depends on the labelling.

## Verified sound

**Gate and supplier order.** The worker's gate at 3580989 passed every check (`residue=0`, `depcheck=0`, `build=0`). I re-ran the dependency check with the stated command; its output was

```text
depcheck: 201 roadmaps, 1324 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The previous round's `ClassFieldTheory` UPWARD line is gone (ClassFieldTheory is on main; the merge order now lists LocalGaloisDeformationRings at position 71, after all its suppliers). `git diff --stat origin/main...HEAD` outside the folder is empty. `metadata.toml` has the same single `topic` line as ClassFieldTheory's on main. No `set_option`, no `lemma`, no sorry'd data, no `Mathlib.*` sub-import, no LaTeX delimiters, no process words (grep for "so far", "to be checked", "handoff", "round", "pull request", "optional", "deferred" found none).

**Pins.** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest). Every library declaration named in the Exact supplier contracts was opened at the pin:

| Declaration | File at pin : line |
|---|---|
| `TauCeti.completedGroupAlgebra`, `.proj`, `.ext`, `.mk`, `.lift`, `.of` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145, 161, 179, 186, 210, 252` |
| `TauCeti.completedGroupAlgebra.map` | `…/CompletedGroupAlgebra/Map.lean:92` |
| `inertiaPadicTameCharacter_surjective`, `_eq_one_iff`, `IsArithFrobeniusLift.inertiaPadicTameCharacter_conj` | `TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.lean:101, 119, 162` |
| `kummerIso_res` (needs `IsUnit (n : K)`), `kummerIso_norm` (needs `IsUnit (n : L)`) | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:682, 920` |
| `dualityMap0/1/2_kummerCoeff_bijective` | `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253, 260, 267` |
| `Matrix.transpose_mul_J_mul_eq_det_smul`, `det_eq_of_transpose_mul_J_mul_eq_smul` | `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76, 86` |
| `IsAdicComplete.henselianLocalRing`, `exists_pow_eq_of_residue_pow_eq` | `TauCeti/RingTheory/Henselian/Basic.lean:77, 84` |
| `ContCohomology.H2` (abbrev) | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:779` |
| `IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker` | `TauCeti/Topology/Algebra/Group/Generation.lean:308` |
| `topologicalGeneratorRankNat_le_of_openSubgroup` | `TauCeti/Topology/Algebra/Group/Profinite/Rank.lean:370` |
| `IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual` | `TauCeti/Topology/Algebra/Group/Profinite/ProP/DualRank.lean:245` |
| `PowerSeries.exists_isWeierstrassFactorization`, `isWeierstrassDivision_weierstrassDiv_weierstrassMod` | `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean:813, 560` |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` |

**Cross-roadmap citations resolved** (each at the supplier's current head via `roadmaps show/grep`): PadicLocalLanglandsForGL2Qp §0.4 (framed/unframed functors, `Φ_p` representability, `fixedDeterminant`, `forgetFrame`, `pstRing`, `crystallineRing`, dimension formula), §5.4 (`BlockPsRing.ring/universal/universal_property`, determinant law at `p=2`), §5.6 (centre map: isomorphism for `p≥5`, torsion-free quotient at `p=3`, cokernel killed by 2 at `p=2`, exactly as README 3.8 states), §5.12 (`WDTypeRing` contracts `blockIdentification, points, reduced, pid, universalRep, integralImage`), §6.9 (`DrinfeldComparison.localJacquetLanglands`, `DivisionAlgebraTypes.jacquetLanglands`, character sign `(−1)^{n−m}`, which is `(−1)^{d−1}` for `m=1` as in 2.26.1); FiniteFlatGroupsAndIntegralPadicHodgeTheory `flatDeformationTangentSpace`, `flatTangent_finrank_le`, `savittResidualTypes`, `dyadicClassification`; ArithmeticGaloisDuality "First-order Galois cocycle comparison", "Trace-zero adjoint duality"; SelmerIwasawaCohomology "Determinant tangent fibres"; AdicSpacesPartIII `grothendieck-algebraization` (on main); ClassFieldTheory Layer 5 `finite_H` (on main); ArithmeticGaloisRepresentations §5.10 `GaloisRep.carayol_conj_of_trace_eq`, §7.2 Schur's lemma (prose), §7.4 `CHTGroup`; IntegralHeckeAndGaloisDeterminants `coefficient_descent`; AdelicAlgebraicGroups `Reduction.finite_classes`; PhiGammaModulesAndIwasawaCohomology `relativeDrig`, `herrDerivedBaseChange`, `relativeHerrPerfect`; downstream consumers AutomorphicGaloisRepresentations `coefficientFontaineLaffaille`, PadicHodgeTheory `RegularOrdinary`, GL2AutomorphicRepresentationsAndTransfer R17.1.1 exist and are later in the order (consumer mentions only). The resolver found no cross-roadmap citation missing. Downstream roadmaps GlobalGaloisDeformations and PotentialAutomorphyInfrastructure cite this roadmap's §§6.24, 7.1–7.6 and F.2–F.3 as suppliers, consistent with the merge order.

**Ownership.** The six fully qualified Lean names are declared by no other roadmap on main or at any open head (`roadmaps grep --lean-only`). By object: the completed node `A⟦X,Y⟧/(XY−πu)` occurs in no other roadmap (Tau Ceti's `NodeAlgebra` is the polynomial quotient); the determinant-ordinary rings and ordered-product equations occur only here and, as a consumer citation, in PotentialAutomorphyInfrastructure; the odd-real quadric occurs only here. The generic lifting functors, representing pairs and bounded type quotients are now imported from PadicLocalLanglandsForGL2Qp §0.4 (R03 repaired).

**Seeded source sample — all 15 targets, read at their locators in the fetched texts** (every text obtained through the sources service from arXiv, Numdam or an author page):

| Target | Text, locator, line | Outcome |
|---|---|---|
| 0.3 | CN23 line 2548 (Def 3.3.1 ordered characters `χ_j(σ)=∏_τ τ(Art⁻¹σ)^{−λ_{τ,n+1−j}−(j−1)}`, Lemma 3.3.2); KW209 line 1026 (Lemma 3.5 (i)–(iii)), 1014 (Def 3.4), 1466 (§3.2.7); KW109 line 267 (Thm 4.1(2)(i)); FKP22 Appendix B | Exponents, the three ordinarity branches, the `ℚ_p^nr(μ_p)` BT branch and the `k=p+1` endpoint over `ℚ_p` agree. |
| 1.21 | FKP22 line 2380–2475 (Def B.2, Lemma B.3, Lemma B.4 (1)–(3)); Conrad line 6592 (Thm 5.2.11, p. 157–158), 6622 (Cor 5.2.13, p. 158–159) | Borel incidence, independence of the conjugator, dominant regular `λ`, `dim G^der` with fixed multiplier, étale/Zariski conjugacy all as stated. |
| 2.9 | Gee22 line 890–904 (Thm 3.31 and the type-quotient definition, pp. 19–20); Shotton line 534–547 (Def 3.5, Prop 3.6, p. 12) | README correctly uses the reduced flat closure and dense exact-type points; Gee22's "iff" is the known overstatement (Source issues). |
| 3.7.2 | CDN23 line 486 (§1.1.2 admissibility/finite length, p. 13), 736 (Remark 1.15: `(det ρ_B)ε⁻¹` is the central character) | Length and central-character conventions agree. |
| 3.8 | CDN23 line 761 (Thm 1.16: `ι^δ_B`, `p≥5` iso, `p=3` torsion-free quotient, `p=2` cokernel killed by 2, p. 20), 2536–2547 (Thm 5.11, `R_{B,M}=R⁺_{B,M}[1/p]`, product of PIDs, unique `ρ_{B,M}`, p. 66) | All four clauses and the integral-image statement agree. |
| 4.2.1 | KW209 line 1190–1203 (definition before Lemma 3.7, pp. 25–26) | `H¹(I_v,N(χ_p)) ≅ (F_nr^×⊗N)^∧`, valuation `v(p)=1`, finite cocycles its kernel. |
| 4.4 | KW209 line 1419–1428 (Lemma 3.8 and proof, p. 30) | Reduction to a coefficient not divisible by `π` before Weierstrass preparation/division; free `A₀`-module algebraization. |
| 4.14.1 | CEGS line 153 (Thm 1.3, p. 4); CN23 line 3991–4010 (Lemma 5.3.3, pp. 76–77) | Generic reducedness of `R^{τ,BT}/ϖ` for tame `τ`; odd-`p` formal smoothness over the fixed-determinant ring. |
| 5.6 | KW209 line 1429–1463 (§3.2.6, p. 30) | Cocycle rank `2+[F:ℚ_p]`, isomorphism unless `p=2` with homotheties, then completion along all of `ℙ¹`. |
| 6.2 | SkinnerWiles line 257–260 (Lemma 2.2, printed p. 11), 304–308 (Cor 2.3, printed p. 13) | `2f+2` variables and one relation iff `χ=ω` or `ω=1`, else `2f+1`; kernel generator counts `f+{2,1,0}`. |
| 6.4 | CHT08 line 2197–2202 (conditions (1)–(3), p. 47), 2317–2349 (Def 2.4.24, Lemmas 2.4.25–2.4.26, pp. 49–50), 2380 (standing hypothesis) | Witness required before the deformation problem; uniqueness and coefficient compatibility of the filtration. |
| 6.5 | FKP22 line 2403–2448 (Lemma B.3 ideal of root equations, `R^{△λ}` as scheme-theoretic image, point criterion) | Torus equations beyond root equations are the README's addition, consistent with the source's `T_G` projection. |
| 6.29 | BCGP25 line 6428–6485 (§6.2, pp. 142–143) | `Λ`, four components at `p=2` with regular generic fibre, flag variety with `Fil_i^⊥=Fil_{4−i}`, characters `χ̃₁,χ̃₂,ε⁻¹χ̃₂⁻¹,ε⁻¹χ̃₁⁻¹`, image without `p`-torsion-free quotient, `Fil^i ad⁰` dims 6,4,2,1,0. |
| 6.32 | BCGP25 line 6582–6591 (proof of Lemma 6.2.5, p. 145) | `𝒢^flat_v`, formal smoothness at finite-residue points, fibre a point or `ℙ¹`, irreducible image. |
| 8.2 | KW209 line 842–874 (Thm 3.1 and remarks, pp. 18–19), 1055–1076 (§3.2.2, pp. 22–23) | Local conditions, `F_v` unramified (`ℚ_p` if irreducible, `ℚ_q` in case 3.3.3), weight-two WD parameters `(ω^{k−2}⊕1,0)`, `(1,N≠0)`, the `p=2` branches, and the domain-selecting choices. |

Further locators opened while checking statements that the findings touch or that carry explicit formulas: Savitt line 2010–2055 (Thms 6.22–6.23, p. 42: `k=1+{j−i}+(p+1)i`, `𝒪⟦X₁,X₂⟧/(X₁X₂−pw)` with `E⊃ℚ_{p²}` and a square root of `det ρ̄(Frob_p)`, the niveau-two pairs and the peu-ramifié cases at `i=2`, `i=p−1`; 4.2 agrees verbatim); ACC+ line 5614–5702 ((6.2.7)–(6.2.8), Lemma 6.2.9, Prop 6.2.10, Lemma 6.2.11, Prop 6.2.12, pp. 139–141; Layer 7 agrees, including the two degree bounds `f>n(n−1)/2+1` and `f>n(n+1)/2+1`); BIP23 line 2646–2676 (Lemma 6.3, pp. 52–53; F.0.1's geometric-integrality hypothesis is the source's); Shotton line 305 (Thm 2.5; 2.13); Gee22 line 905–935 (§3.32, Lemma 3.33, Exercise 3.34; 2.10 matrices and hypotheses); CHT08 line 1482–1512 (§2.4.1 covariant `G_ṽ` via `U_S` and a Pontryagin-type dual with twist `(2−l)`; 1.6's dual construction is the same device).

**Headlines and Lean.** README headlines: generic representability, trace generation and condition/ideal correspondence (Layer F); local presentations and tame complete intersections and type components (1–2); period comparisons and type-quotient geometry (0, 3); finite-flat resolutions and BT components (4–5); ordinary, `GSp₄` and `GL₃` component geometry and the eigenvalue ring (6); ordered-flag recovery and determinant-ordinary component comparison (7); KW local rings, nonemptiness, completed products (8). The three statable at the pins are stated: `oddRealRing_geometry` (1.14, 8.7), `completedNode_isDomain_flat` (8.4), `det_ordinary_iff_ordered_triangularization` (7.4); the module docstring names each other headline family and the carrier it lacks. I found no further headline statable at the pins (every other one needs the deformation functors, period rings, Kisin/Breuil–Kisin categories, incidence schemes or patching functors, none of which exist at the pins).

`lake env lean` on `Suggested.lean` from the worktree root produced exactly three `declaration uses 'sorry'` warnings (lines 64, 88, 121) and nothing else. `#check @name` for all six definitions and the three theorems (scratch file) agrees with the README: the quadric theorem carries `IsDomain`, `IsDiscreteValuationRing`, `CharZero`, `IsAdicComplete`, `hres`, `Irreducible ϖ`; the node theorem carries `IsDomain`, `IsDiscreteValuationRing`, `π ≠ 0`, `¬IsUnit π`, `IsUnit u` and no completeness; the flag theorem carries `Field F` and `Function.Injective χ`; the two `def`s keep `A`, `G`, `n` as implicit arguments. No binder was dropped. One-tactic probes on a scratch copy (11 attempts: `simp`, `rfl`, `infer_instance` on each conclusion and conjunct, `simp [IsDetOrdinary, HasOrderedTriangularization]`) all failed; none of the three theorems is padding, no declaration restates a definition or a Check.

**Adversarial pass — computed rows.** All 194 targets, the Conventions and the nine Lean declarations were read; the table keeps the sampled targets, the headlines, the targets the findings touch, and every row where a computation was needed. "Pass" means the computed instances agree with the statement; none of the rows below refuted a statement.

| Statement | Instances tried and values on each side | Result |
|---|---|---|
| Lean `oddRealRing_geometry` (1.14, 8.7) | Linear terms of `f=(a+X)²+(b+Y)(c+Z)−1` are `2aX+cY+bZ`. If any coefficient is a unit, Weierstrass gives `𝒪⟦2 vars⟧` (needs `IsAdicComplete`, constant term `a²+bc−1∈𝔪`). Otherwise `2a,b,c∈𝔪`, so `a` is a unit and `2∈𝔪`: residue char 2 and `f≡X²+YZ`, irreducible in `k⟦X,Y,Z⟧` (a factorisation `(αX+βY+γZ)(α′X+β′Y+γ′Z)` forces `ββ′=γγ′=0`, `βγ′+γβ′=1`, then `αα′=0≠1`). `f∉ϖS` so `R` is `𝒪`-flat; `R/ϖ` a domain and `R` `ϖ`-torsion-free and separated give `IsDomain`. `dim R = 4−1 = 3`. On `R[1/ϖ]`: if `2(a+X),c+Z,b+Y∈𝔭` with `2∉𝔭` (`2=ϖ^e·unit` or a unit), then `f≡−1 mod 𝔭`, so some partial `∉𝔭` and `f∉𝔭²S_𝔭`: regular; `dim R[1/ϖ]=2` since a prime maximal among those avoiding `ϖ` has `dim R/𝔭=1` (finitely many height-one primes contain `ϖ`) and `R` is a catenary complete local domain. Equal-characteristic DVR `ℚ⟦t⟧`: `2a` or `b,c` is a unit, regular case. `hres` dropped: `f` a unit, `R=0`. | Pass; true as stated. |
| Lean `completedNode_isDomain_flat` (8.4) | `A⟦X,Y⟧` is regular local of dimension 3 with maximal ideal `(π,X,Y)`; `πu∈𝔪∖𝔪²` because `𝔪²∩A=π²A` and `u` is a unit, so `XY−πu∈𝔪∖𝔪²` and the quotient is regular local of dimension 2, hence a domain, with no completeness used. Flatness over the PID `A`: `πg=(XY−πu)h` gives `XY·h̄=0` in `k⟦X,Y⟧`, so `h=πh′` and `g∈(XY−πu)`; torsion-free, hence flat. `π=0`: `XY=0`, zero-divisors; `π=u=1` over a field: `XY−1` a unit, zero ring; `A=ℤ_(3)`, `π=3`, `u=1`: flat domain. | Pass; true as stated, including non-complete `A`. |
| Lean `det_ordinary_iff_ordered_triangularization` (7.4) | ⇐: with `B⁻¹ρB` upper triangular and `T_i=ρ(g_i)−χ_i(g_i)`, `T_i` maps `V_i=⟨e₀..e_i⟩` into `V_{i−1}`, so the left-to-right product `T₀⋯T_{n−1}` kills `V`; charpoly is the diagonal product. ⇒: put `U_k=Σ Im(M_{k+1}⋯M_{n−1})` over tuples; `U_{−1}=0` by hypothesis, `U_{n−1}=V`, each `U_k` is `G`-stable (`ρ(g)(ρ(h)−χ(h))=(ρ(gh)−χ(gh))−χ(h)(ρ(g)−χ(g))`), `U_{k−1}⊆U_k`, and `G` acts on `U_k/U_{k−1}` by `χ_k`. Traces: `Σ_k m_kχ_k = Σ_kχ_k` with `m_k=dim U_k/U_{k−1}`; Dedekind independence of the distinct `χ_k` gives `m_k≡1 (mod char F)`, `m_k≥1`, `Σm_k=n` forces all `m_k=1`: a full flag with graded `χ₀,…,χ_{n−1}` in order. `n=0`: both sides true (`charpoly=1`, empty product `1=0` in `Mat₀`, empty flag). Injectivity needed: `n=3`, characters `(1,ψ,1)`, `V=` extension of `ψ` by `1²` with two independent classes in `H¹(G,ψ⁻¹)` satisfies both equation families (the product `(ρ(g₀)−1)(ρ(g₁)−ψ(g₁))(ρ(g₂)−1)` has only a `(·,3)` column times a zero `(3,3)` entry) yet has no flag with diagonal `(1,ψ,1)`. Over `ℤ/9` (not a field) the README's scalar example `I` with characters 4, 7 satisfies both equations without a flag. | Pass; hypotheses exactly right. |
| Lean `IsDetOrdinary`, `HasOrderedTriangularization` (7.1) | Convention: `j<i → entry (i,j)=0` is upper triangular; `List.ofFn` product is `M₀⋯M_{n−1}` with `χ₀` the top-left character, matching the flag whose first line has character `χ₀`. Rank-one: both reduce to `ρ=χ`. `M=diag(4,7)`, `U=[[1,1],[0,1]]` over `ℤ/9`: all charpolys `(X−1)²` (`4·7=28≡1`, `4+7≡2`), `(M−I)(U−I)=[[0,3],[0,0]]≠0`. | Pass. |
| Conventions: ranks, zero ring, reciprocity, `HT(ε)=+1` | Zero ring has no residue map onto `k`; type quotients may be zero (3.4). Arithmetic tame relation `φtφ⁻¹=t^q` checked on 2.3, 2.7, 2.10, 2.15, 2.22 instances below. `λ=(k−2,0)` gives ordered characters `1, ε^{1−k}` (weights `0, 1−k`); dual subline `ε^{k−1}`. Rank-three `η=(2,1,0)` has weights `{0,1,2}`, determinant weight 3. | Pass. |
| F.0.1 completed products | `𝒪⟦X⟧⊗̂𝒪⟦Y⟧=𝒪⟦X,Y⟧`: `2+2−1=3`. `k⊗̂_𝒪k=k`: dimension 0, the flat formula would give `−1`. `I=(x(x−ϖ),xy)=(x)∩(x−ϖ,y)` in `𝒪⟦x,y⟧`: `f=xg∈(x−ϖ,y)` forces `ϖḡ=0` in `𝒪`, so `g∈(x−ϖ,y)`; `B` embeds in `𝒪⟦y⟧×𝒪`, special fibre `k⟦x,y⟧/(x²,xy)` has unique minimal prime `(x)`, dimension 1; components of dimensions 2 and 1; `dim B=2`, `dim B[1/ϖ]=1`. BIP23 Lemma 6.3 supplies the geometric-integrality hypothesis as stated. | Pass. |
| F.1.4 Check `modCompare_strict_basis` | `(1+εE₂₁)·diag(1,−1)·(1−εE₂₁)=diag(1,−1)+2εE₂₁=[[1,0],[2ε,−1]]`. | Pass. |
| F.1.5 Check `strict_of_full_nonlocal` | `C=[[0,−1],[1,−1]]`, `C³=I`; `1,C,S,CS` have coordinate determinant `−3≠0 mod 5`; `a=[[2,5],[5,12]]`, `det a=−1`, `a≡2I mod 5`; `±a≢I`; over `ℤ/25`, `13·2=26≡1`, `13a≡I mod 5`. | Pass. |
| F.1.1, F.1.3, F.1.7 | Carriers imported from PadicLocalLanglandsForGL2Qp §0.4 (read at its head). `G=ℤ_p`, `A=ℤ/9`: values `1+𝔪={1,4,7}`. `diag(1+εx,1)` vs `diag(1,1+εx)`: module-isomorphic by the swap, distinct strict classes. | Pass; R03 repaired. |
| F.2.1 Check `phiP_not_of_Hom` | `G=(∏ℤ/p)⋊ℤ/2`, inversion: commutators are `x−σ(x)=2x`, all of `∏ℤ/p` for odd `p`; `Hom(G,𝔽_p)=Hom(ℤ/2,𝔽_p)=0`; the open subgroup has infinitely many coordinate characters. | Pass. |
| F.2.2 Checks | `p` odd, `S={p,∞}`: one `ℤ/p`-extension of `ℚ` unramified outside `p` (cyclotomic); `p=2`: `ℚ(i),ℚ(√2),ℚ(√−2)` give dimension 2. `ℚ_pˣ/ℚ_pˣᵖ≅(ℤ/p)²` matches `N+1=2` generators. | Pass. |
| F.2.5 Check `univDefRing_hull_only` | `A=k[t]/t³`, `B=k[t]/t²`, `M=I+tE₁₂`: `(I+tE₁₁)M(I+tE₁₁)⁻¹=I+(t+t²)E₁₂` (since `E₁₂E₁₁=0`), so the two pairs agree in `Def(A)×_{Def(B)}Def(A)`; a common conjugator would need `[X,E₁₂]=0` and `[X,E₁₂]=E₁₂` to first order. | Pass; `H4` fails as stated. |
| F.2.6, F.2.9 | Framing variables `n²−1`: normalise the `(1,1)` entry of the strict frame; `|T|=2`, `n=2`: `7`, not `8`. `𝔽₃[ε]`: `(1+aε)³=1+3aε=1`, so no cube root of `1+ε` with residue one. | Pass. |
| F.2.11 | Chenevier: generated by `Λ_i(g)`; Noetherian under `Φ_p` through `G/H`; rank one gives `𝒪⟦G^{ab,(p)}⟧`; degree-two `G_{ℚ_p}` restriction matches PadicLocalLanglandsForGL2Qp §5.4 (determinant law at `p=2`). | Pass. |
| F.3.1 Check `defProblem_not_conj_stable`, F.3.2 Check `ideal_maximal_not_invariant` | `(1+εE₂₁)D(1−εE₂₁)=D+ε(E₂₁D−DE₂₁)=D+2εE₂₁` for `D=diag(1,−1)`, nonzero over `𝔽₃`. | Pass. |
| F.3.2 fixed-determinant tangent | `d⁰X` has trace zero and lies in `L̃^χ`; `ker i_v=im δ_v`; `p∤n` makes `i_v` injective. Rank one, `p=3`: `ad⁰=0`, `L^χ=0`. | Pass. |
| 0.1 | `k⟦x,y⟧/(x,y)²`: socle `⟨x,y⟩`, type 2, not Gorenstein; `S` has type 1. | Pass. |
| 0.3 (sample) | Inducing character of `G_{ℚ_{p²}}` with labelled weights `(0,p)`: inertia exponents `p` and `p²≡1 mod p²−1`, residual induction `ω₂^p⊕ω₂`, Serre weight 2; induced weights `{0,p}`, irreducible hence nonordinary; unramified twist changes the determinant by a square, root exists for odd `p`. `p=5` Check: `V=(εω̃⁻¹)⊕ω̃` has `det=ε`, weights `{1,0}`, reduction `1⊕ω`, becomes `ε⊕1` over `ℚ₅(μ₅)`, étale quotient `ω̃` reducing to `ω≠1`. Flag Check over `ℤ₂[e]/(2e,e²)`: `e·ε⁻¹(g)=e`, so `A(e₁+e e₂)` is stable of character 1 with complement `Ae₂`. | Pass. |
| 0.4 Herr conventions | `φ=2`, `γ=3`: `d⁰(1)=(1,2)`, `d¹(1,2)=2·1−1·2=0`; at `(1,0)`: `2`, Liu's swap gives `−2`. | Pass. |
| 1.2 | Rank one `φ(e)=E(u)e`: `L^{≤1}(ℤ_p)={𝔖e}`, `L^{≤0}=∅`. `φ(e)=ue`, `p=2`: `φ(u⁻¹e)=u⁻²·ue=u⁻¹e`, height 0; odd `p`: `(p−1)a+1=0` has no integer solution. `B={(a,b):a≡b mod p}`: the lattice `𝔖²` is generated by two elements over local `𝔖_B` but is not cyclic, hence not projective. | Pass. |
| 1.3 | `ℚ_p`, `p` odd: `1+pℤ_p≅ℤ_p`, `Λ=𝒪⟦X₁..X_n⟧`. `ℚ_p(ζ_p)`: `𝒪[μ_p]=𝒪[X]/(X^p−1)` has `p` minimal primes once `ζ_p∈𝒪`. `ℚ₃`, `L` unramified quadratic: Frobenius acts on `𝔽₉/𝔽₃≅𝔽₃·i` by `−1`, so a trace-zero functional gives a character inverted by Frobenius, not extendable to `G_K`. | Pass. |
| 1.4, 1.13 | `h⁰−h¹+h²=−d²f`; component dimension `≥1+d²(1+f)`. FL: `dim L−h⁰=fd(d−1)/2`, framed `d²+fd(d−1)/2`. | Pass. |
| 1.9 Checks | `[[1,6],[3,1]]` over `ℤ₃`: `det=−17`, trivial mod 3, charpoly `(T−1)²−18`, roots `1±3√2`, `2` not a square mod 3: flag over `ℚ̄₃` only. Nonsplit `0→ε⁻¹→V→1→0` over `ℚ₃`: order `(ε⁻¹,1)` works, reversed order would split. | Pass. |
| 1.11, 1.14 | `C₂`, odd `p`, odd determinant: centraliser of `diag(1,−1)` has dimension 2, relative dimension `4−2=2`. `(a,b,c)=(1,1,0)`: `(1+X)²+(1+Y)Z−1=X²+2X+Z+YZ`. `(0,1,0)`: `M²=0≠I`. | Pass. |
| 1.18 Checks | Char-0 `κ`, `q≠1`: `h⁰=1`, `h¹=1` (Frobenius-invariant homs from `ℤ_p(1)` vanish as `(q−1)f=0`), `h²=0`; finite `κ`, `q≡1`: `1−2+1=0`. | Pass. |
| 1.21 (sample) | `λ_{τ,j}=−(λ′_{τ,d+1−j}+j−1)`: `λ′=(−1,−1)` gives `(1,0)`; `λ′=(0,0)` gives `(0,−1)`. FKP22 Def B.2 and Conrad 5.2.11/5.2.13 support the Borel incidence and conjugacy over local `A` (an open containing the closed point is all of `Spec A`). | Pass. |
| 2.3 Checks | `[[1,5],[0,1]]·diag(1,2)·[[1,−5],[0,1]]=[[1,5],[0,2]]`. `ℤ/25`, `σ=I+5E₁₂`, `Φ=diag(11,1)`: `ΦσΦ⁻¹=I+55E₁₂=I+5E₁₂=σ^{11}`; `ker(σ−I)=ℤ/25⊕5ℤ/25`, not a rank-two summand. | Pass. |
| 2.5 Checks | `q=2`, `Φ=diag(2,1)`: `2·9=18=9·2`; `Φ=I`: `8≠9`. `Φ=diag(qα,α)`, `σ=1+E₁₂`: `ΦσΦ⁻¹=1+qE₁₂=σ^q`. | Pass. |
| 2.6 | `T_q^{ab}=ℤ_p/(q−1)×ℤ̂`; `q=1` abelian; `⟨t,φ^b⟩≅T_{q^b}`. Tau Ceti tame character and conjugation declarations at the pin. | Pass. |
| 2.7 Check (`p=7`, `K=ℚ₁₃`) | `σ=diag(2,2,4,4)`, `Φ=diag(6,6,1,1)`: `σ³=I` (`8≡1`, `64≡1`), `Φ²=I`, commuting, `13≡1 mod 3` so `σ^{13}=σ`; multipliers `2·4=8≡1` and `6·1=6≡13`; `12≡5` a unit; inertia invariants 0. | Pass. |
| 2.9 (sample) | `Φ=diag(q,1)`, `N=tE₁₂`: exact Steinberg type for `t≠0`, boundary point `t=0` in the closure. Flat closure of `𝒪⟦X⟧/(ϖX)` is `𝒪`. | Pass. |
| 2.10 (R01 repair) | `Φ=C⁻¹diag(α+B,χ(φ)/(α+B))C`, `σ=C⁻¹diag(1+u,(1+u)⁻¹)C` commute, so `ΦσΦ⁻¹=σ=σ^q` since `(1+u)^{q−1}=1`; `𝒪[Δ]⟦x,y,B⟧` has relative dimension 3 and total dimension `4=1+(d²−1)`. `p=5`, `q=11`, `k=𝔽₂₅`, `ζ³=1`: `Φ̄σ̄Φ̄⁻¹=σ̄⁻¹=σ̄²=σ̄^{11}`, `det σ̄=1`, eigenvalues `±1`, universal `σ` reduces to `I≠σ̄`. | Pass; counterexample now excluded by the stated hypothesis. |
| 2.11 | `exp₂∘log₂=id` and `log₂∘exp₂=id` for `N⁴=0` (with `M=N+N²/2+N³/2`, `M²=N²+N³`, `M−M²/2=N`). `exp₂(N)²=1+2N+2N²+2N³=exp₂(2N−2N³)`, `m*=(2−8)/3=−2`; `q=2` in char 3: cubic coefficient `1`. Centraliser dimensions `11,7,5,3` from orbit dimensions `0,4,6,8`. | Pass. |
| 2.12 | Mixed ring smooth of relative dimension `N²−1` over `𝒪⟦x₀,x₁⟧/(x₀x₁)`: components `N²`, intersection `N²−1`; ratio `q^{−N+2}/q^{−N}=q²` is the inert tame exponent. | Pass. |
| 2.15 Checks | `ζ₂₅` has order `25∤10=q−1`; `(X−1)(X−ζ₂₅)≠(X−1)(X−ζ₂₅^{11})`; rank one: `𝒪/(ζ₂₅^{10}−1)⟦T⟧`, dimension 1; `ζ₅^{10}=1`, `Φ=1`, `Σ=diag(1,ζ₅)` obey `Σ^{11}=Σ`. | Pass. |
| 2.17 (R02 repair) | `𝔽₄₉`, `q=29≡1 mod 7`: `Φ̄=diag(J,D)`, `σ̄=diag(D,I)`, `JDJ⁻¹=diag(4,2)`, `σ̄²=diag(4,16,1,1)=diag(4,2,1,1)`, `2^{29}≡4`, `4^{29}≡2` so `σ̄^{29}=σ̄²`; `D^TJD=8J=J`; eigenvalues `±i,2,4` with `2·4≡1`, `i·(−i)=1`; noncommuting. Now excluded by the unramified hypotheses; `σ̄=I` is the control. | Pass. |
| 2.19 | `C(T)−T=0` near `T=2`: `t^{q−1}=1` with `t≡1` gives `t^{p^a}=1`; `t^{q+1}=1` with `t≡1` gives `t=1` (`q+1≡2`); components `T=2` and `(p^a−1)/2` reciprocal pairs, total `(p^a+1)/2`; `p=3`, `q=7`: `T=2`, `T=−1`. `Σp^{−n²}Xⁿ∉𝒪⟦X⟧[1/p]`. | Pass. |
| 2.22 | `ζ₂₅^{11}∉{ζ₂₅^{±1},ζ₂₅^{±2}}`: empty locus; `ζ₅^{11}=ζ₅`: `Σ=diag(ζ₅,ζ₅²,ζ₅⁻²,ζ₅⁻¹)`, multiplier 1, `Φ=1`. | Pass. |
| 2.23 | Variable determinant `𝒪[Δ]⟦x,y,B,C⟧`; fixed `det=ψ̃χ`: `𝒪[Δ]⟦x,y,B⟧` (agrees with 2.10); unramified `det`: `𝒪⟦x,y,B⟧`, `ψ=1`; `q_v=17`, `p=2`: `Δ≅ℤ/16`. | Pass. |
| 2.26.1, 2.26.2, 2.27 | Character sign `(−1)^{d−1}` matches the supplier's `(−1)^{n−m}` at `m=1`; `d=1` identity. `K=ℚ₁₁`, `p=5`: `[[1,1],[0,1]]` of order 5 has class `2·1`. `Ind_B(1⊗1)^{K(1)}=1⊕St`: multiplicity 1 of the finite Steinberg type, 0 in the trivial representation; `√11≡1 mod 5`. | Pass. |
| 2.29 | `[[0,1],[1,1]]` over `𝔽₂`: `X²+X+1`; lift `[[0,−1],[1,−1]]` has order 3. | Pass. |
| 3.1 | `((Σm)²−Σm²)/2`: `3, 2, 0` for `(1,1,1),(2,1),(3)`. `ℚ₃`: `(−1)³=−1`, extendable; `q=2`, order 3: `ζ²≠ζ`. | Pass. |
| 3.5 Check 4 | `κ_T(g)=(1+T)^{ℓ(g)}`, `T_s=(1+p)^s−1`, `s_m=(p−1)p^m`: `⟨ε⟩^{s_m}=ε^{s_m}` crystalline, `T_{s_m}→0`; a nonzero series in `ℤ_p⟦T⟧[1/p]` has no zeros accumulating at 0, so `J=0`; `s=1/2∈ℤ_p` gives Sen weight `1/2`. | Pass. |
| 3.7.2, 3.8 (sample) | `I(1,ω²)` at `p=5` is generic (`ω²∉{1,ω^{±1}}`); `⨁_{n≥1}π` is locally finite length of infinite length. Supplier's §5.6 and CDN23 Thm 1.16 give the four centre-map clauses; `det(M⊗η)=det M` with `M⊗η≇M` for irreducible inertia (scalar intertwiner cannot negate Frobenius in char 0). | Pass. |
| 3.11 Check | `A=𝒪[x,y]/(x²−πx,xy,y²−πy)` free on `1,x,y`; evaluation at `(0,0),(π,0),(0,π)` injective, `A[1/π]=E³`; special fibre `k[x,y]/(x,y)²` has socle dimension 2, not a complete intersection. | Pass. |
| 4.1 | `V=k(1)⊕k`: `h⁰=2`, flat tangent `2+1·1=3`; `k(1)²⊕k²`: excess `2·2=4`; supersingular `E[p]`: flat ring 2 variables, unrestricted 5 (`H²(ad)=0` since `V≇V(1)` when `det V\|_I=ε̄`, including `p=3`). | Pass. |
| 4.2 | Savitt Thms 6.22–6.23 read: every listed case, exponent and coefficient hypothesis agrees. | Pass. |
| 4.2.1, 4.3, 4.4 (sample) | KW209 lines 1190–1205, 1419–1428: finite cocycles of rank `1+f`; `Z¹` of rank `2+f` in 5.6; reduction to a coefficient prime to `π` before Weierstrass. | Pass. |
| 4.9 Check 4 | `π²=ζ₃−1`: `(π²+1)²+(π²+1)+1=π⁴+3π²+3`, Eisenstein, `e=4`; `P≡u²`; `φ(ue_i)=u²(ue_i)`, `φ(u²e₂)=u⁴(u²e₂)`; Jordan types `(2,2)`, `(4)`; dual partition of `(2,2)` excludes `(4)`. Labelling convention unstated. | Pass on the computation; R05 on the label. |
| 4.13, 4.14 | Trivial residual data over `ℚ_p`, odd `p`: a `{0,1}` crystalline lift has `det≡ω·unr≠1`. Fixed-determinant BT integral/generic dimensions `4+f/3+f`; `f=1`: `5/4`. | Pass. |
| 4.14.1, 4.15 (sample) | CEGS Thm 1.3 (tame `τ`, generic reducedness), CN23 Lemma 5.3.3 (odd `p` formal smoothness over the fixed-determinant ring, unique generalisation). `k[ε]`: scheme-theoretic image of the identity is the whole nonreduced scheme. | Pass. |
| 5.2 Checks | `η(Frob)=ζ₃` over `𝔽₄`: `diag(εη,η⁻¹)` and `diag(εη⁻¹,η)` have `det=ε`, same semisimplification, distinct unramified quotients. `S₃=GL₂(𝔽₂)`: `T=[[0,1],[1,1]]`, `F=[[0,1],[1,0]]`, `FTF⁻¹=[[1,1],[1,0]]=T²`, `det=1=ε̄`, absolutely irreducible, ordinary quotient zero. | Pass. |
| 5.6 (sample) | KW209 §3.2.6: torsor rank `2+f`, isomorphism unless `p=2` with homotheties, completion along all of `ℙ¹`; `γ²χ_p=` determinant. | Pass. |
| 5.11 Check 3 | `W(𝔽₄)/4`, `a²+a+1=0`, `c=1+2a`: `φ(c)=1+2a²=−1−2a`, `(1+2a)⁻¹=1−2a`, `φ(c)/c=(−1−2a)(1−2a)=−1+4a²≡3 mod 4`. | Pass. |
| 6.2 (sample) | SW Lemma 2.2, Cor 2.3: `2f+2` variables, one relation iff `χ=ω` or `ω=1`; kernel generators `f+{2,1,0}` by the listed cases. | Pass. |
| 6.3 Check 3 | `ℚ_l`, `l>3`, `χ̄₁=ω` on the subline, `χ̄₀=1`: `H²(k(ω))≅H⁰(k)^∨≠0`; the ratio `χ̄₁/χ̄₀=ε̄` is excluded by the README's orientation. | Pass. |
| 6.4 (sample) | CHT08 §2.4.5 read; `K=ℚ₃`, `p=5`, `r̃=1`, `m=2`: twists `3,4≢1`, `1⊕1` has no `gr¹≅gr⁰(1)`. `r(d−r)+(d−r)²+(r²−1)+r(d−r)+1=d²`. | Pass. |
| 6.5 (sample) | FKP22 Lemma B.3/B.4: root equations plus the README's torus equations; `GL₁`, `λ=0`: a ramified finite character fails `ρ\|_I=1`. | Pass. |
| 6.7, 7.5 | `β²−tβ−t=0` with `t=tr Φ−2` iff `α=1+β` is a root of `X²−(tr Φ)X+1`; `ℤ/9`: `β=3` works (`9=0`), `β=1` fails; `𝒪=ℤ₃`, `n=2`: unramified quotient `𝔽₃⟦φ₁..φ₄⟧/(φ₁+φ₄+φ₁φ₄−φ₂φ₃)`; at `Φ=I`: `𝔽₃[β]/β²`, rank 2, nonreduced; `α+α⁻¹=2+φ₁+φ₄`. | Pass. |
| 6.10 Check | `q=11`, `p=5`, `Φ=I`: `11·4=44≠144`. | Pass. |
| 6.14, 6.26 | Multiplier `(χ_αψ⁻¹)(ε^{1−a}χ_α⁻¹ψ)=ε^{1−a}`; `dim 𝔲=3`; `h¹(𝔲)=3`, `dim L−h⁰(ad⁰)=3`. | Pass. |
| 6.18 | Hilbert series `1+6t+15t²`: `21` quadratic monomials minus 6 relations; the sequence `β,a,φ₂+φ₃,b+c+φ₁` reduces the relations to `bc=b²=c²=bφ₂=cφ₂=φ₂²=0`, i.e. `k[b,c,φ₂]/(b,c,φ₂)²`, socle dimension 3. | Pass; type 3. |
| 6.21 Check | `𝔽₇₉`, `(a′,b′,c′)=(24,12,0)`, `c′12=c′21=T`, `d′22=8T²`: `(−25)T²−(−13)(8T²)=79T²=0`; printed coefficient `1−b′+c′=−11` gives `−25T²+88T²=63T²≠0`. | Pass (source misprint recorded below). |
| 6.24, 7.6 (ACC+ Props 6.2.10, 6.2.12) | Bounds `f>n(n−1)/2+1` and `f>n(n+1)/2+1`; dimensions `1+n²+n(n+1)f/2` and `≤n²−1+n(n+1)f/2`; `d=2`, `f=5`: `20` versus `18`. | Pass. |
| 6.27, 6.29 (sample), 6.31, 6.34 | Borel generic dimension `11+4=15` over the two-variable weight algebra, `14` after `θ₁=θ₂`; `Fil^i ad⁰` dimensions `6,4,2,1,0` (positive roots of `C₂` of heights `1,1,2,3`); `p=2`: `(ℤ/2)²` gives 4 components; case `(2b)`: `4+12=5+11=16`. | Pass. |
| 6.32, 6.35 (sample) | BCGP25 Lemma 6.2.5 proof: `𝒢^flat`, fibre a point or `ℙ¹`, irreducible image; Lemma 6.2.6 hypothesis of surjectivity onto weight space retained. | Pass. |
| 7.1–7.4 (headline) | ACC+ (6.2.7)–(6.2.8), Lemma 6.2.9 (finiteness via `g=Art(ϖ_v)`), Lemma 6.2.11 (field, distinct characters, both equation families): statement and proof shape agree with the Lean theorem and its injectivity hypothesis. | Pass. |
| 8.2 (sample) | KW209 Thm 3.1, §3.2.2: at `p=2`, `k=2` crystalline (`N=0`) and `k=4` semistable (`N≠0`); `diag(1,−1)` odd, `I` even. | Pass. |
| 8.4 (headline) | Node `𝒪⟦T₁,T₂⟧/(T₁T₂−p)`; `π=p` in a ramified DVR is `ϖ^e·unit`, hence the unit `u`; `ℤ_(3)` works without completeness. | Pass. |
| 8.17 | `F=ℚ`, `S={∞,p}`: `2+4=6=3·2`; `𝒪⟦x,y,z,u₁..u₄⟧/(x²+2x+yz)` has relative dimension 6. | Pass. |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers F and 0–8 with `### Examples` and `### Dependencies`, Downstream consumers, References. 107 of the 194 targets carry `**Checks.**` lists (467 bullets); the 87 without are theorem targets whose content is a statement with hypotheses and a locator, except 6.18, whose explicit presentation and the computed socle above serve as its tests. Every target has a locator; every `*Needs:*` line names targets, supplier sections or pinned declarations.

## Not verifiable

- **KisinFlat, Kisin2adic, KisinPST** (author DVIs): the sources service recognised `bt.dvi` as "not a document" and the other two were not re-attempted this round; the Layer 4–5 Kisin locators (4.5–4.13, 5.1–5.3, 5.8–5.13, 4.7.1) and the 4.9 Check-4 labelling convention (R05) could not be checked against the text. The published versions are behind paywalls or on JSTOR; cited by locator only.
- **Geraghty** (CiteSeer preprint, 12 March 2010): not readable last round and not re-attempted; §§6.1, 6.12, 6.25 locators and the journal/preprint concordance remain uncertified.
- **CHT08 §2.4.1 Fontaine–Laffaille sign**: the source's covariant `G_ṽ` is `U_S(Hom(M,F/O{l−2}))(2−l)`; I did not trace the resulting Hodge–Tate sign of a rank-one object through the source, so 1.6's "jump `i` ↔ weight `−i`" is checked only for internal consistency (its Checks agree with the Conventions).
- Ownership against open pull requests was checked only through `roadmaps grep` over the 432 open heads and main; packages whose mathematics is not in that index were not checked.

## Source issues

- **Error** in Gee22 at the type-quotient definition after Theorem 3.31, printed pp. 19–20: the source says a point factors through the reduced flat type quotient exactly when it has inertial type τ; it should say the quotient is the closure of such points and can contain lower-monodromy boundary points; affects a stated result.
- **Misprint** in LLHLM20 at Table 4, arXiv v4 printed p. 55 and §3.6.2, p. 47: the source says the `γαγ` coefficient is `1−b′+c′`; it should be `−1−b′+c′`, as the substitution onto the quotient relation on p. 47 and the `𝔽₇₉` instance above show; affects a stated result.
- none further found in the texts read this round (KW209, KW109, CN23, FKP22, Conrad, CDN23, CEGS, SkinnerWiles, CHT08 §2.4.5, BCGP25 §6.2, Savitt §6, ACC+ §6.2.6, BIP23 Lemma 6.3, Shotton §§2–3).
