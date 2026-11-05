# Review of LocalGaloisDeformationRings (pull request #923 at 4fda98c)

**Verdict:** needs changes

## R01 (P2) — Require unramified residual data in the rank-two Taylor–Wiles presentation

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1942`: “For rank two, odd `p`, `q≡1 mod p`, distinct residual Frobenius eigenvalues and fixed unramified determinant”.

**Claim:** These hypotheses give the displayed universal ring and inertia matrix. They do not require the residual representation to be unramified.

**Witness:** For p=5, q=11, k=F₂₅, take ζ of order 3, σ=diag(ζ,ζ⁻¹), Φ the swap matrix. Then ΦσΦ⁻¹=σ¹¹, Φ has eigenvalues ±1, and det σ=1, but the proposed universal σ reduces to I.

These matrices define a continuous tame residual representation (finite image S₃). Thus an unramified determinant does not force unramified residual inertia. Gee22 line 907 explicitly assumes residual unramifiedness; line 908 separately assumes an unramified determinant.

**Repair:** Add residual unramifiedness, and specify an ordered pair of distinct eigenvalues in k, after coefficient extension if necessary; use their residual eigenbasis for the displayed matrices. Retain determinant compatibility. Add the preceding ramified example as a negative Check. With σ=I and the same Φ, the corrected hypotheses hold and the displayed universal inertia matrix reduces correctly to I.

## R02 (P2) — Restore both unramified hypotheses for GSp₄ Taylor–Wiles lifts

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2062`: “With four distinct residual Frobenius eigenvalues paired by similitude and `q≡1 mod p`”.

**Claim:** The ordered-character description and formal smoothness over O[Δ_v] are asserted without residual unramifiedness or unramifiedness of the fixed multiplier. BCGP21 line 9106 requires both, before Lemma 7.4.4.

**Witness:** Over F₄₉, let q=29, D=diag(2,4), J=[[0,1],[-1,0]], Φ=diag(J,D), σ=diag(D,I₂). Both preserve J⊕J; ΦσΦ⁻¹=σ²=σ²⁹, but Φσ≠σΦ.

The Frobenius eigenvalues are i,−i,2,4, with i²=−1: four distinct values paired by inverse. The multiplier is already 1. Noncommutation prevents decomposition into Galois characters, and order-three residual inertia cannot come from the pro-7 inertia characters parametrized by Δ_v. A fixed change of symplectic basis transports this example to the roadmap's Gram matrix. Its invariant Lie algebra has dimension 1: the irreducible symplectic block contributes 0, the other diagonal pair 1. Local duality and Euler characteristic give fixed-multiplier framed tangent dimension 11; smoothness of relative dimension 10 over O[C₇²] would give 12.

**Repair:** State that both the residual representation and the fixed multiplier are unramified, with the ordered eigenvalues in k. These are precisely the hypotheses of BCGP21 lines 9106–9121. The counterexample is then excluded; replacing σ by I gives the unramified positive control with the same four eigenvalues.

## R03 (P2) — Import the generic lifting and strict-class functors from their existing owner

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:215`, 298 and 424: “define `Lift_ρ̄(A)`”; “form `Def_ρ̄(A) = Lift_ρ̄(A)/Γ̂ₙ(A)`”; “define `LiftDet_χ(A)`”.

**Claim:** F.1.1, F.1.3 and F.1.7 construct new generic carriers, coefficient functoriality and fixed-determinant fibres. The scope calls them specializations, but their domain is still every profinite group and every positive rank over the same coefficient categories.

**Witness:** `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:300`, §0.4, already defines fixed-basis continuous lifts, strict-conjugacy classes and the fixed-determinant fibre for every profinite Γ and n≥1, including p dividing n.

Its following paragraph supplies the chosen representing pair and inverse-limit comparison. This is an earlier supplier explicitly acknowledged at this README's line 9. For Γ=Z₃ and A=Z/9 both proposed lift carriers have exactly the values {1,4,7}; both rank-one strict quotients leave these three classes unchanged. There is no additional parameter or stronger generality here.

**Repair:** Delete the duplicate construction targets and cite §0.4's actual functors in Scope, Exact supplier contracts and dependent targets. Keep the new marked-module comparison F.1.2/F.1.4 and genuinely additional theorems on those supplied carriers. The three-value test and the nontrivial rank-two strict-versus-full-conjugacy test then apply to the imported objects unchanged. This repairs ownership without discarding the local deformation roadmap.

## R04 (P2) — State the completed-node geometry headline on native carriers

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:4065` and `Suggested.lean:35`: “It is a flat domain for a DVR `A`, nonzero nonunit `π` and unit `u`”.

**Claim:** The module docstring treats Layer 8 geometry other than the odd-real quadric as unstatable. The completed-node flat-domain assertion in 8.4 needs no missing deformation carrier.

**Witness:** A scratch signature defining `MvPowerSeries (Fin 2) A ⧸ Ideal.span {X 0 * X 1 - C (π*u)}` and asserting `IsDomain` and `Module.Flat A` elaborates at the pins, with only its intended `sorry` warning.

The probe retains a general DVR, π≠0, ¬IsUnit π and IsUnit u; it assumes neither completeness nor A=Z_p. Tau Ceti's `NodeAlgebra` is a polynomial quotient, so its existing freeness theorem is not this completed statement.

**Repair:** Keep a small real-bodied completed-node definition and add the full geometry theorem to `Suggested.lean`; update its docstring. The identification with a Galois deformation ring may still be listed as unstatable. Test A=Z_(3), π=3, u=1; dropping π≠0 gives the two zero-divisors in XY=0, while taking π=u=1 over a field gives the zero quotient. Keep those controls in the README, not as extra Lean theorems.

## R05 (P3) — Remove the HTML anchors rejected by the gate

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:98`: `<a id="completed-coefficient-products"></a>`; 195 further instances.

**Claim:** The supplied gate reports `residue=196` because explicit HTML anchor tags violate its residue rule.

**Witness:** The first instances are at lines 98, 169, 211 and 259; the gate reports all 196 under the same rule. Its build and all other text-scanner counters pass.

**Repair:** Delete the tags and retarget internal links to the rendered heading anchors. For the first instance, the link must resolve to the F.0.1 heading after deletion. Rerun the gate; `residue` must be zero. This review made no such edits.

## R06 (P3) — Remove undeclared API-name claims and restore the required layer shape

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3257`: “`OrdinaryWithEigenvalue`”; line 3259: “`OrdinaryWithEigenvalue.beta_relation`”. Also the ends of Layers F and 0, and `Suggested.lean:43` onward.

**Claim:** The README uses backticked names for its own intended declarations although they are absent from the acceptance file. Line 77 explicitly says these are its own names. Layers F and 0 also lack the required concluding Examples and Dependencies subsections; the Lean file lacks the prescribed layer comments.

**Witness:** `Suggested.lean` declares only `oddRealIdeal`, `OddRealRing`, `oddRealRing_geometry`, `IsDetOrdinary`, `HasOrderedTriangularization` and `det_ordinary_iff_ordered_triangularization`. Neither cited eigenvalue name is among them. Layer 0 starts at README line 1186 and Layer 1 at 1311 without those endings.

**Repair:** Express non-headline API bullets and Checks in prose, preserving the actual mathematics and three discriminating Checks per definition. Keep backticked own names only for declarations retained in Lean; do not expand Lean into an API catalogue. Add the missing layer endings and Lean layer comments. The eigenvalue relation β²−(φ₁+φ₄)β−(φ₁+φ₄)=0 remains the same assertion after removing its invented Lean name.

## R07 (P3) — Correct the malformed block-supplier locator

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2529`: “PadicLocalLanglandsForGL2Qp, §PadicLocalLanglandsForGL2Qp §5.4–5.6 and 5.12”.

**Claim:** This is not a valid section address.

**Witness:** The supplier has §5.4 at line 1847, §5.5 at 1882, §5.6 at 1916 and §5.12 at 2088. There is no section named “PadicLocalLanglandsForGL2Qp”.

**Repair:** Use “PadicLocalLanglandsForGL2Qp, §§5.4–5.6 and 5.12”. These sections supply the pseudodeformation ring, block centres and full-WD construction intended here; this is a locator defect, not an unowned prerequisite.

## Verified sound

The worktree was reviewed at the requested full head and remained unchanged. There are no changes outside this roadmap folder in the PR diff. I read the repository writing checklist and contribution rules, and compared the shape with ClassFieldTheory, Completed/LocalGaloisGroups and ReductiveGroups on main. I found no computational-algorithm target, copied source passage, sorry'd data, forbidden import or `set_option` in the two reviewed files. This verdict has **7 findings, 4 blocking**. The substantial local extensions are repairable; the duplicate targets in R03 do not justify rejecting the entire folder.

**Seeded source sample — all 15 targets.** No additional locator was explicitly labelled unverified in the README. The following records identify the text actually read; version/page limitations are retained below rather than certified by inference.

| Target | Text and locator inspected | Outcome |
|---|---|---|
| 1.19 | BIP23 line 1850, Lemma 4.1, p.36; lines 1854–1857 | O[μ][[f+1 variables]] and split character components, retaining coefficient splitting. |
| 2.3 | CHT08 line 1967, §2.4.4, pp.43–44; line 2052 | Minimal inertia and the prime-to-p image criterion agree. |
| 2.9 | Gee22 line 897, discussion after Thm.3.31, pp.19–20; Shotton line 534, Def.3.5/Prop.3.6, p.12 | Roadmap correctly uses reduced flat closure, not an exact-type iff at every point. |
| 2.17 | BCGP21 line 9106, §7.4.3 and Lemma 7.4.4, arXiv v3 p.189 | Missing hypotheses: R02. |
| 2.20 | LTXZZ line 5623, Def.6.3.4, arXiv v3 p.115 | Four rigidity conditions and fixed multiplier agree; published-number concordance not certified. |
| 2.26 | THORNE15 line 888, Prop.3.17, p.20; NT26 line 922, proof of Lemma 3.8, p.20 | Trivial residual data, q≡1, domain and same-dimension quotient argument agree. |
| 3.1 | KisinPST line 924, §2.6, and line 984, §2.7, publisher-open copy | Filtered coefficient data, open inertia kernel and contravariance agree; author-DVI pages not certified. |
| 3.7.1 | CDN23 line 693, Props.1.10/1.12, pp.18–19 | Blocks, projective envelopes and small-prime centre qualifications retained. |
| 4.12 | KisinFlat line 2305, Prop.2.5.6, published p.1136 | Nonordinary closed points lie on the same component; author-DVI pagination not certified. |
| 6.22 | CT17 line 1982, Lemma 5.2 and proof, accepted p.39 | Purity gives smoothness and a unique minimal prime containing the partition kernel. |
| 6.24 | THORNE15 line 712, Lemma 3.11; line 774, Lemma 3.13/Prop.3.14, pp.16–17; BCGP25 line 5831, Prop.5.6.6(3)/Rem.5.6.7, p.129 | Coefficient splitting, degree and dyadic extension qualifications checked. |
| 7.3 | ACC+ line 5630, §6.2.6, p.139 | Integral-domain point criterion and injective-extension implication agree. |
| 7.4 | ACC+ line 5666, Lemma 6.2.11, p.140 | Character functions distinct; both characteristic polynomial and ordered products retained. |
| 7.6 | ACC+ line 5687, Prop.6.2.12, pp.140–141 | Dominant component comparison uses the stated strict degree bound. |
| 8.18 | KW209 line 842, Thm.3.1 and remarks, pp.18–19 | Selected conditions, local-field restrictions, and integral points after finite coefficient extension retained. |

**Pinned libraries and ownership.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches used the pinned sources and `roadmaps grep/show`, including the available open heads, main and the board package index. No collision of the six fully qualified Lean declaration names was found. The polynomial node is not a completed node; the tame character is not its coefficient-p quotient; finite Kummer/Tate duality is not the completed κ-linear comparison; field-valued Borel theory is not relative Borel representability. These distinguish legitimate new ownership from R03.

| Opened declaration / definition | File at pin and line | Hypothesis or boundary checked |
|---|---|---|
| `IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` | Domain, local PID, not a field; no characteristic-zero or completeness assumption supplied automatically. |
| `Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42` | Matrix units; no positivity of rank or continuity hidden in the carrier. |
| Weierstrass division / preparation | `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean:560`, 813 | Nonzero residue series and adic completeness retained. |
| Completed group algebra and maps | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, 161, 179, 186, 210, 252; `Map.lean:92` in the same directory | Compatible finite-quotient algebra carrier, projections, extensionality and maps; not a new deformation carrier. |
| p-primary tame character | `TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.lean:73`, 101, 119, 162 | Different residue/coefficient primes; surjectivity, kernel and arithmetic Frobenius q-power conjugation. |
| Kummer comparison | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384`, 682, 920 | n invertible; restriction and finite separable norm comparison. |
| Finite local duality | `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253`, 261, 269 | Finite discrete coefficients killed by n invertible in K. |
| Rank-two multiplier | `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76`, 86 | Multiplier equals determinant over a commutative ring without dividing by 2. |
| Henselian root lifting | `TauCeti/RingTheory/Henselian/Basic.lean:77`, 84 | Adic-complete instance and unit derivative for root existence. |
| Polynomial node | `TauCeti/RingTheory/Node/Basic.lean:37`; `TauCeti/RingTheory/Node/Flat.lean:149` | `MvPolynomial`, not `MvPowerSeries`; polynomial freeness does not state R04. |

Supplier addresses resolved by object include SchemeAndStackFoundations §§0.16, 0.20–0.21, 1.21, 4.2–4.4 and 4.9–4.10; AdicSpacesPartIII F0.1/F0.8; ClassFieldTheory Layers 5 and 7; Completed/LocalGaloisGroups Layers 3 and 7; ReductiveGroups Layers 0, 7 and 9; DeformationAndDerivedPatchingAlgebra §§1.8–1.9, 1.12, 2.1–2.7, 3.9, 4.6 and 6.7; ArithmeticGaloisRepresentations §§1.2, 1.9, 2.3–2.4, 5.10 and 7.2–7.5; ArithmeticGaloisDuality D7/D8.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.4 and R07.6.7; AlgebraicModuliForArithmeticGeometry §§1.3–1.4 and 1.7; PhiGammaModulesAndIwasawaCohomology §§1.2, 3.4, 3.6, 3.8, 4.4–4.5, 7.1 and 7.5; SelmerIwasawaCohomology §§0.4–0.6 and 2A.4; AdelicAlgebraicGroups §§3.4/4.4; SmoothRepresentationsOfLocalGroups SR0, §1.2 and Layers 5–6; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; PadicLocalLanglandsForGL2Qp §§0.4, 5.4–5.6, 5.12 and 6.9. In particular R07.6.7 supplies coefficient-linear self-Ext, not the forbidden coefficient-nonlinear tangent in the 8.6 negative control. The 124 resolver leads were not treated as 124 defects: most are this folder's intended API names, covered by R06.

**Headlines and Lean.** The README's end results are generic representability/trace and determinant comparisons (F); local presentations and tame complete intersections/type components (1–2); period/type-quotient geometry (0,3); finite-flat and dyadic resolutions/components (4–5); ordinary, GSp₄ and GL₃ component geometry, eigenvalue-ring type and patching (6); ordered-flag recovery and determinant-ordinary component comparison (7); selected KW local-ring geometry, nonemptiness and completed products (8). The docstring names the missing deformation, period, model, type and patching carriers for these families. It correctly keeps the actual odd-real geometry and field ordered-flag theorem, but misses the statable completed-node theorem, R04.

The required direct Lean elaboration passed with exactly the two intended `sorry` warnings. I compared all **6** elaborated `#check @name` signatures with the README: no needed binder was dropped; characteristic zero and adic completeness remain explicit for the quadric, and the flag theorem quantifies over an arbitrary field and character functions. Scratch one-tactic attempts with `simp`, `rfl` and `infer_instance` on each of the two theorems all failed (**6 attempts**); object searches found no single pinned lemma proving either. Neither existing theorem is padding. The separate full-general-DVR node signature elaborated with only `sorry`. No probe changed a PR file.

**Gate and supplier order.** The worker's gate result was:

```text
gate LocalGaloisDeformationRings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=196 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

The requested dependency command was run; its exact output was:

```text
not movable: LocalGaloisDeformationRings consumes ClassFieldTheory (#255) and is consumed by SelmerIwasawaCohomologyPartII (#183), which comes first: moving LocalGaloisDeformationRings after ClassFieldTheory would put a supplier after a consumer, a cycle through LocalGaloisDeformationRings
UPWARD: LocalGaloisDeformationRings (#81) -> ClassFieldTheory (#255) at README lines [19, 49, 58, 607, 1247, 1277]
depcheck: 164 roadmaps, 1174 edges, 1 problem(s)
```

That specific UPWARD line is a **false positive under this brief**: ClassFieldTheory already exists on main, where Layer 5's `finite_H` is at `TauCetiRoadmap/ClassFieldTheory/README.md:1099` and Layer 7 supplies the Artin map. Its open revision is not the dependency. The main supplier has no return edge to this roadmap. Do not move that ownership or depend on its revision. The report does not turn this mechanical result into a mathematical cycle finding. The gate nevertheless remains failed, independently because of R05; no acceptance is recorded.

**Computed adversarial pass — selected evidence (55 rows).** The review recorded 199 rows covering all 194 numbered targets, the conventions and all six Lean declarations. This comment retains the 15 sampled targets, headline checks and targets implicated by mathematical findings; the remaining per-target ledger is omitted for length. Values are local tests and negative controls, not proofs of the general theorems. “Retained” or “agrees” means no defect was exposed by that instance; inaccessible source claims remain uncertified below.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions: ranks, coefficients, zero ring | General rank is ≥1; zero ring has no residue map onto nonzero k. The field flag theorem explicitly permits rank 0: charpoly 1, empty product 1=0 in Mat₀, unique empty flag. | Pass. |
| Conventions: reciprocity, twists | Arithmetic Frobenius acts on tame p-inertia by q; geometric Frobenius by q⁻¹. HT(ε)=1, HT(ε⁻¹)=−1; rank-three η has determinant weight 0+1+2=3. | Pass. |
| F.0.1 coproduct, dimensions and components | O[[x]]⊗̂O[[y]]=O[[x,y]]: 2+2−1=3, generic dimension 2. k⊗̂k=k has dimension 0, not −1. For O[[x,y]]/(x(x−π),xy), total component dimensions are 2,1; special dimension 1. Empty product is O. | Pass. |
| F.1.1 lifts and coefficient maps | G=Z₃, A=Z/9: lifts of 1 take generator values {1,4,7}; reduction gives {1}. At k[ε], value 1+ε has charpoly X−1−ε, reducing to X−1. | Mathematics agrees; import owner, R03. |
| F.1.3 strict classes | Over k[ε], conjugation of 1+εX by 1+εY leaves X unchanged. diag(ε,0) and diag(0,ε) give distinct strict classes, one full-conjugacy class. | Import owner, R03. |
| F.1.7 fixed determinant | det(1+εX)=1+ε tr X. For X=I₂ in characteristic 2, trace=0 and determinant=1, despite X≠0. Rank-one fixed determinant leaves 1 lift. | No division by rank; owner R03. |
| F.1.9 determinant laws | Degree two scalar representation in characteristic 2 has trace 0, determinant χ². χ=1+T gives χ²=1+T²≠1; trace alone gives 0 for both. | Pass. |
| F.2.3 framed representing pair | G=1 gives ring O and one map to each coefficient object. G=Z_p, rank one gives O[[T]] and generator 1+T; T=0 and T=ε give distinct lifts. | Pass. |
| F.2.5 strict representing ring | Rank one: strict kernel acts trivially, so framed/unframed points coincide. Scalar rank two has endomorphism dimension 4≠1. | Pass. |
| F.2.7 trace generation | diag(1+T,1) and diag(1,1+T) both have trace 2+T but distinct strict classes. On the framed residual fibre all traces are constants while X₁₂≠0. | Pass. |
| F.2.8 laws versus strict deformations | Rank one law has value χ(g) and recovers χ. Reducible upper extensions have identical characteristic coefficients but distinct extension classes. | Pass. |
| 0.3 ordinary comparison | Trivial⊕ε⁻¹ has weights {0,−1}; its dual has {0,1}. Kummer unit extension has N=0; uniformizer extension has N≠0. | Pass. |
| 0.4 Herr comparison | φ=2, γ=3: d⁰(1)=(1,2), d¹(1,2)=2−2=0. On (1,0), d¹=2, swapped convention gives −2; cup traces 1 and −1. | Pass. |
| 1.14 / oddRealIdeal, OddRealRing, geometry | (a,b,c)=(1,0,0): X²+2X+YZ; (1,1,0): X²+2X+Z+YZ. In characteristic 2 their tangent dimensions are 3 and 2. Integral/generic dimensions are 3/2; (0,1,0) gives M²=0≠I. | Signature matches; not padding. |
| 1.19 character ring (sample) | Q₅: μ₅∞=1, f+1=2 variables. Q₂: C₂ torsion, 2 generic branches. K=Q₃(ζ₃): f+1=3 variables and 3 geometric torsion characters. | Pass. |
| 1.23 trianguline quotients | Rank-one D has a unique 0⊂D filtration. Rank-two equal characters admit P¹ many first lines; strict triangulation uniqueness fails. | Pass. |
| 2.3 minimal ramification (sample) | k=F₅,A=Z/25: I+5E₁₂ reduces to I but has order 5, so reduction on inertia image has kernel C₅ and is not minimal. An order-3 Teichmüller inertia image reduces isomorphically. | Pass. |
| 2.9 fixed type (sample) | Φ=diag(q,1), N=tE₁₂: rank N=1 for t≠0 and 0 at t=0. Both lie in closed type support, only first has exact full type. | Pass. |
| 2.10 Taylor–Wiles presentation | p=5,q=11,k=F₂₅: σ=diag(ζ,ζ⁻¹), ζ³=1≠ζ; Φ=swap. ΦσΦ⁻¹=σ¹¹=σ⁻¹; eigenvalues 1,−1, determinant unramified. Displayed universal σ reduces to I≠σ. | Fails; R01. |
| 2.13 tame complete intersection | Rank one q≡1: two parameters, one equation, relative dimension 1=1²; mod π, u^{pᵐ}=0 is nonreduced but still complete intersection. | Pass. |
| 2.16 Taylor–Wiles tangent | p=5,q=11,d=2: fixed-det unramified diagonal tangent 1 plus ramified scalar-pair tangent 1 gives dim L=2; h⁰(ad⁰)=1, difference 1. For d=1 fixed determinant leaves 0, not 1. | Pass. |
| 2.17 GSp₄ Taylor–Wiles (sample) | p=7,q=29, D=diag(2,4), J=[[0,1],[-1,0]]: Φ=diag(J,D), σ=diag(D,I₂), multiplier 1; ΦσΦ⁻¹=σ²=σ²⁹. Eigenvalues ±i,2,4 distinct; Φσ≠σΦ. Fixed-multiplier tangent 11 versus predicted 10+2=12. | Fails; R02. |
| 2.20 rigidity (sample) | Empty Σ imposes no local condition. At q=2,p=5, unipotent τ=1+uE₁₂ commuting with scalar Φ forces u=2u, hence u=0. For N=2 required pair is {q⁻²,1}={4,1} in F₅, not {1,1}. | Pass. |
| 2.22 GSp₄ Ihara geometry | Fixed multiplier removes 1 from dim GSp₄=11, giving relative 10 and integral 11. Generic distinct inertia leaves paired eigenvalues γ₁,γ₂,ψ/γ₂,ψ/γ₁. | Pass. |
| 2.26 Steinberg domain (sample) | d=1: St ring is O[[T]], integral dimension 2=1+d². d=2, Φ=diag(q,1) reduces trivially when q≡1; N=0 boundary remains in both closures. | Pass. |
| 2.29 dyadic Ihara | p=2 and q odd: q≡1 mod 2 automatically. A finite unramified coefficient extension splits a separable degree-d residual polynomial; repeated roots remain repeated. | Pass. |
| 3.1 Hodge/Galois types (sample) | Multiplicities (1,1,1),(2,1),(3) give (9−3)/2=3,(9−5)/2=2,(9−9)/2=0. q=3 fixes −1; q=2 sends ζ₃ to ζ₃²≠ζ₃, impossible for a scalar Weil extension. | Pass. |
| 3.4 PST quotient | Trivial rank one, trivial type, weight 0 has an unramified family 1+T. A rank-one order-3 type at q=2 cannot extend and gives no point. | Pass. |
| 3.7.1 blocks/centres (sample) | Supersingular block has 1 irreducible; generic principal-series block 2. Exceptional p=2 block {χ,Stχ} has 2; p=3 exceptional block has 4. | Pass. |
| 3.9 PST dimensions | d=2,f=1 regular: generic 4+1=5, fixed-det 4. Scalar Hodge type: 4+0=4, fixed-det 3. | Pass. |
| 3.10 crystalline smoothness | Rank-one N=0 deformation has one Frobenius coordinate; a nonzero N in rank two is excluded even with unchanged filtration. | Pass. |
| 3.11 G-valued type geometry | GL₂ regular type: dim G+dim Flag=4+1=5. GSp₄ regular over Q_p: 11+4=15, fixed multiplier 10+4=14. | Pass. |
| 4.9 flat resolution | Proper flag forgetting has scalar residual fibre P¹; at distinguished residual data it has one flag. Both have the same underlying lifted representation after forgetting. | Pass. |
| 4.12 nonordinary connectedness (sample) | Supersingular rank two over Q_p: étale rank 0, hence nonordinary; small-ramification unique model gives one point and one connected component. Ordinary split rank-two object has étale rank 1 and is excluded. | Proposition 2.5.6 supports comparison; pagination limitation below. |
| 4.14 BT components | Fixed-det rank two over degree f has integral/generic dimensions 4+f / 3+f; f=1 gives 5/4. Changing ordinary quotient can change selected component without changing these dimensions. | Pass. |
| 5.12 dyadic flat connected ring | Fixed-det rank two over Q₂ has generic dimension 4. A height-one connected object passes; a pure étale object has connected rank 0 and is outside this groupoid. | Source text limitation below. |
| 5.13 dyadic BT components | f=1 gives fixed-det generic dimension 4 and integral dimension 5. Scalar ε̄=1 does not determine ordinary versus nonordinary, which is read from the model. | Pass. |
| 6.7 eigenvalue ring | Φ=I, β²=0: β=3 in Z/9 satisfies 9=0; β=1 fails 1=0. At p=3,n=2, unramified specialization is F₃[β]/β², rank 2, one reduced point. | Pass. |
| 6.12 fixed-weight ordinary components | Rank-one fixed-weight character space has one unramified variable and one connected generic component on a chosen torsion branch. A zero quotient has 0 components and is excluded by nonzero premise. | Geraghty text limitation below. |
| 6.17 G-ordinary components | GSp₄,Q_p regular flag: generic dimension 11+4=15; fixed multiplier 10+4=14. A torus contributes only its group dimension. | Pass. |
| 6.18 eigenvalue CM type | Quotient by β,a,φ₂+φ₃,b+c+φ₁ gives k[x,y,z]/(x,y,z)²: basis length 4, socle dimension 3, type 3≠1. | Pass. |
| 6.21 GL₃ equations | In F₇₉[[T]], (a′,b′,c′)=(24,12,0): corrected γαγ factor −25T²+104T²=0; source sign gives 63T² and relation 63T³≠0. Setting a=b=c kills αβα equation and invalidates two-prime claim. | Pass. |
| 6.22 pure partition points (sample) | Rank one partition (1): R¹=Rᵐ=O[[T]], kernel 0, unique minimal prime 0, generic tangent/dimension 1/1. Rank-two pure Sp₂ has N rank 1 and no competing type component at its smooth point. | Pass. |
| 6.24 flag image (sample) | d=1,K/Q₃(ζ₃) unramified quadratic: f=4, unsplit cyclotomic component dimension 5, (ζ₃−1)²=0 mod 3. After coefficient splitting each chosen branch is O[[T₁,…,T₄]], special domain. For d=2,f=3 total flag dimension 1+4+9=14. | Pass. |
| 6.30 patching and GL₃ geometry | Shape lengths 2,3,4 give 2²=4,2¹=2,2⁰=1 components. A predicted weight has e=1; zero functor gives e=0. Doubling a rank-one module gives rank 2 and fails rank≤1. | Pass. |
| 6.34 GSp₄ dimensions | Partial P charts 10,9 plus 5 frames give 15,14. Exceptional GL₂ comparison gives 4+12=5+11=16, whereas 5+12=17 is wrong. | Pass. |
| 7.3 reduced comparison (sample) | Injective E→E[ε] keeps 1 nonzero; quotient E[ε]→E kills ε and cannot detect equations. A reduced flag-image quotient kills exactly the radical, not every nilpotent of the original ambient algebra. | Pass. |
| 7.4 flag theorem / both Lean predicates (sample) | Over F₃, D=diag(2,1), U=I+E₁₂ generate nonabelian S₃. Ordered χ₁,χ₂ products vanish; reversed order gives (D−I)(U−I)=E₁₂≠0. Rank 1: ρ=χ gives equality, unequal characters fail. Rank 0 gives 1=0 in Mat₀ and empty flag. | Both implications pass; not padding. |
| 7.4 distinct functions, not separating element | G=C₂²,F₃, characters 1,a,b: three distinct functions; at any g their values lie in {1,−1}, so no g separates all three. Diagonal representation has product 0 and its ordered flag. | Pass. |
| 7.6 component comparison (sample) | d=2,f=5 satisfies 5>4: dominant dimension 1+4+15=20; collision bound 4−1+15=18. At f=4 strict inequality fails. Rank 1,f=3: dimension 5, no collision locus. | Pass. |
| 8.3 irreducible low-weight ring | Adapted matrix [[λ,p^{k−1}],[α,0]] has determinant −αp^{k−1}. p=2,k=2 gives −2α; λ remains 1 free parameter, plus 3 frames=4. | Pass. |
| 8.4 completed node headline | A=Z_(3),π=3,u=1: XY=3, nonzero flat domain. π=0 gives XY=0 with two nonzero zero-divisors. π=u=1 over field makes XY−1 a unit and quotient 0. | Statable general geometry missing; R04. |
| 8.7 odd-real geometry | Identity mod 2: equation X²+2X+YZ, special tangent dimension 3 and special dimension 2. Nonidentity: extra Z gives tangent 2. Integral/generic dimensions 3/2 in both. | Pass. |
| 8.17 tensor product | F=Q,S={∞,p}: relative 2+4=6=3·2. Real quadratic F with two real and one degree-2 p-place: 2+2+(3+2)=9=3·3. | Pass. |
| 8.18 KW nonemptiness (sample) | Selected smooth O[[x₁,…,x₄]] has integral point x_i=0; node XY=p has a point after π′²=p, X=Y=π′. Their rings map to nonzero coefficient integers; incompatible rank-one inertial type can instead give 0. | Pass. |

## Not verifiable

- **Geraghty:** The cited 12 March 2010 preprint was not readable through its CiteSeer URL or the alternative institutional document URL; the latter redirected to an unavailable archived copy. This leaves the exact proofs and preprint/journal concordance for §§6.1, 6.12 and the related ordinary-component claims uncertified. No assertion about their truth is inferred from the failed retrieval.
- **Kisin2adic:** The Harvard author DVI was not recognized as a readable document; the corresponding PDF URL returned 404, and the institutional metadata did not supply the cited text. The detailed dyadic groupoid/resolution locators in Layer 5 and §4.7.1 remain uncertified.
- **Version-specific locators:** The publisher-open KisinPST and KisinFlat copies support the sampled statements, but do not certify the README's author-DVI pagination. KisinPST's cited Errata (E.4), author DVI p.34, was not available in the retrieved journal text. LTXZZ's arXiv v3 Definition 6.3.4 was read; its claimed published Definition 6.3.3/p.277 concordance was not independently certified. These limitations do not replace the source discrepancies demonstrated above.
- Ownership searches covered main and accessible open-head texts, including the earlier supplier heads. The board package index was read, but packages whose mathematical contents were not available in that index cannot receive a separate ownership certification.

The missing-reference record retains the two unreadable works and the unavailable KisinPST erratum under their existing keys. Previously failed downloads that were subsequently obtained legally are not presented as outstanding requests. No source manifest was edited and no source passage was copied into the report.

## Source issues

- **Error** in Gee22 at discussion after Theorem 3.31, printed pp.19–20: the source says a closed reduced flat type quotient classifies exactly the full-inertia-type points; it should be the closure of those points, possibly including lower-monodromy boundary points; affects a stated result.
- **Misprint** in ACC+ at §6.2.6, printed p.139: the source says the ith graded piece has the jth universal character; it should be the ith universal character; affects nothing.
- **Error** in CHT08 at §2.4.2 and proof of Lemma 2.4.7, printed pp.37–39: the source says excluding the cyclotomic ratio suffices for the decreasing-filtration lifting argument; it should be exclusion of the inverse cyclotomic ratio for that ordering; affects the proof.
- **Misprint** in CHT08 at proof of Lemma 2.4.7, printed p.39: the source says to extend the ith graded piece by filtration step i−1; it should be step i+1, as in the immediately following Hom group; affects the proof.
- **Misprint** in LLHLM20 at Table 3, arXiv v4 printed p.53: the source says the two monomials in the displayed monodromy relation have opposite signs; it should be their sum, agreeing with equation (3.14), p.43; affects a stated result.
- **Misprint** in LLHLM20 at §3.6.2, arXiv v4 printed p.47 and Table 4, p.55: the source says the primed coefficient is 1−b′+c′; it should be −1−b′+c′ after the stated cyclic coordinate substitution; affects a stated result.
