# Review of ArithmeticGaloisDuality (pull request #858 at c26bdae)

**Verdict:** needs changes

The previous review was checked first, finding by finding:

| Previous finding | Passage at this head | Resolution |
| --- | --- | --- |
| R01, missing obstruction construction | README:7106–7111 still says “comes with an injection” and “take dimensions in the given injection”. | Not repaired; R01 below. |
| R02, omitted function-field headline | README:4599 owns “Function-field central obstruction localization”; Suggested.lean:210–250 still contains only Sha duality and Tate vanishing. | Not repaired; R03 below. |
| R03, failed dependency gate | The five named main suppliers remain; the gate now reports five upward diagnostics. | Not repaired; R04 records the output and the main-owner evidence. |
| R04, undeclared own API names | README:954 retains `CompactCoefficients.continuousHomRepresentation`; README:3254 retains `PoitouTate.beta_apply`. | Not repaired; R05 below. |
| R05, source attributions | README:3277 still says “before Lemma 7.6”; README:6844 still gives “pp. 41–42, 47–48” for KW §§4.1.4–4.1.6. | Not repaired; R06. The linked HW author text was readable this round and confirms the problem. |

No repair report marking any of these findings “not actionable in this package” was found. Locations abbreviated as README or Suggested below mean `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` and `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean`. Source references are to the service's numbered extractions; passages are described, not reproduced.

## R01 (P1) — Construct the obstruction injection needed for the relation bound

**Location:** README:7106–7111: “comes with an injection” and “take dimensions in the given injection”.

**Claim:** The promised Khare–Wintenberger relation theorem is reduced to a dimension inequality assuming its essential obstruction-theoretic input. None of the three prerequisites constructs that input. This leaves the theorem unowned; a source citation does not supply the missing construction.

**Witness:** `khare-wintenberger-2` lines 2032–2054 specify a minimal relative framed presentation, construct a pairing, and inject the dual relation space into the **dual** of dual Selmer. The roadmap assumes an injection instead.

**Repair:** Add a target constructing that pairing from the actual minimal relative presentation and proving its adjoint injective, with the codomain dual as in KW. Own the required lifting data here or identify an earlier supplier that actually provides it; do not add a later deformation-roadmap dependency. Deduce the relation bound from this construction.

**Repair test:** Dual-Selmer dimensions zero and one must force respectively zero and at most one minimal relation. At dimension zero, injectivity gives `J/𝔪J = 0` and Nakayama gives `J = 0`. Assuming the injection merely restates the missing step; changing to the correct dual codomain preserves these dimensions.

## R02 (P1) — The Sha agreement Check contradicts the preceding example

**Location:** README:3305–3306: “for `r = 1, 2` … `Ш¹_S` and `Ш²_S` agree with Harpaz–Wittenberg's `Ш`.”

**Claim:** Equality of ordinary and Tate local cohomology in positive degrees does not identify localization at the places of an arbitrary `S` with localization at every place. The source uses the all-place kernel.

**Witness:** README:3291–3297 already gives `K = ℚ(√−35)`, `L = K(√−7)` and `S = {v | 2} ∪ S∞`: the nontrivial character lies in `Ш¹_S`, while `Ш¹(K,ℤ/2) = 0`.

**Repair:** Add “when `S` is the set of all places” to this Check, or delete it in favor of the correctly qualified Check at README:3289. Retain the quadratic-field example as the negative control.

**Repair test:** `disc(L) = 5·(−7)·(−35) = 1225 = disc(K)²`, so the relative extension is unramified at finite places. At 2, `−7 ≡ 1 mod 8` is a square; at each place over 3, `K_v = ℚ₃` and `−7 ≡ 2 mod 3` is not a square. Thus its restricted localization is zero but its all-place localization is nonzero. With all places included, the two kernels use precisely the same maps and do agree.

## R03 (P2) — State the function-field central-obstruction headline

**Location:** README:4599–4613, “Function-field central obstruction localization”; Suggested:28–43,210–250.

**Claim:** This headline is statable at the pins and absent. It needs neither a new idele-class carrier nor a Selmer-complex encoding: the existing function-field Sha theorem already has its localization kernel and coefficient dual.

**Witness:** Mathlib `RepresentationTheory/Homological/ContCohomology/Sha.lean:71` defines the intersection of localization kernels. Tau Ceti `FieldTheory/FunctionField/Place/Completion/Basic.lean:41,49` supplies completions and their embeddings. A scratch signature using them elaborated successfully.

**Repair:** State that the actual degree-two `ContinuousCohomology.tateShafarevich` is a subsingleton for finite coefficients killed by a positive `n` invertible in the function field, assuming the action on `TauCeti.InternalHom G M (TauCeti.KummerCoeff F n)` is trivial. Reuse the completion and absolute-Galois restriction adapter of `GlobalFunctionField.sha_duality`.

**Repair test:** The scratch signature retained all these hypotheses under `#check @centralObstruction` and produced only a `sorry` warning. For `F = 𝔽₇(t)`, `M = ℤ/3`, both `Ш¹(F,Mᴰ)` and `Ш²(F,M)` are zero; `M = 0` gives the same conclusion. This does not claim `H²(F,M) = 0`: Brauer classes with invariants `1/3,−1/3` at two places remain nonzero.

## R04 (P2) — The mandatory dependency gate fails on five existing-main suppliers

**Location:** README:150,1556,2173,3660,4341 and the additional lines in the diagnostic below.

**Claim:** The worker gate has `depcheck=5`; the independent run reproduces it. Acceptance is prohibited while the gate fails. These diagnostics do not establish upward mathematical dependencies on new roadmaps: the five cited owners already exist on main.

**Witness:** Main contains `TauCetiRoadmap/ProfiniteCohomology/README.md`, `TauCetiRoadmap/AlgebraicCurves/README.md:1102`, `TauCetiRoadmap/ClassFieldTheory/README.md:920`, `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md:37`, and `Completed/PolynomialGaloisGroups/README.md`.

**Repair:** Reconcile the worker's classification with these main contracts and rerun the gate. Retain the correct main citations. Do not duplicate their mathematics or introduce dependencies on later open revisions to silence the check. No tooling or order file was changed here.

**Repair test:** Resolving each edge to the existing-main owner must remove its `UPWARD` diagnostic and yield a passing gate. The preliminary “cycle through” message is a consequence of that classification, not an independently verified mathematical cycle.

## R05 (P3) — Undeclared API names still claim Lean counterparts

**Location:** README:954,3247–3266, and the disclaimer at 39–40: “they are not declarations of that file”.

**Claim:** Backticked own API/Check names remain where the required form calls for prose unless the declaration occurs in Suggested. The disclaimer does not override that form.

**Witness:** Suggested has eleven headline theorems, five named supporting definitions and two instances; neither `CompactCoefficients.continuousHomRepresentation` nor `PoitouTate.beta_apply` occurs among them. These are confirmed examples among the resolver's 144 leads.

**Repair:** Rewrite undeclared own names as mathematical prose, retaining exact names for existing library/supplier declarations and actual acceptance statements. Do not expand Suggested into an API catalogue.

**Repair test:** The continuous-Hom action must still compute `(g·f)(x)=g·f(g⁻¹x)`, and localization must still evaluate at each place. Both statements survive the naming repair unchanged. Resolve remaining backticked own names against Suggested.

## R06 (P3) — Narrow and correct the source attributions

**Location:** README:3277–3278, “before Lemma 7.6, p. 28”; README:6843–6845, KW §§4.1.4–4.1.6 and Paškūnas–Quast §1.4.2/Lemma 13.22.

**Claim:** HW's cited passage does not define restricted products or restricted-`S` Sha. KW §4.1.4 starts on p. 39, not p. 41. The PQ passages concern deformation dimensions and local cohomology, not the general matrix trace-pairing criterion.

**Witness:** `harpaz-wittenberg-massey` lines 1200–1218; `khare-wintenberger-2` lines 1873–1919; `paskunas-quast` lines 346–360,3648–3658. Restricted products are actually defined at `milne-adt` lines 2074–2103.

**Repair:** Use Milne I.§4, p. 55 for the restricted products and localization kernel. Remove the unsupported HW attribution. Cite KW §4.1.4, pp. 39–40 for the characteristic-two boundary, and the named adjoint supplier/pinned trace form for the matrix algebra. PQ v2 was checked by section and theorem; its pagination was not silently identified with the published version.

**Repair test:** The corrected sources distinguish direct sum from full infinite product and ordinary from Tate invariants. The trace restriction has radical `k·Id` for `n=2,k=𝔽₂` and radical zero for `k=𝔽₃`; the mathematical claims survive this citation repair.

## Verified sound

The entire README and Suggested were read alongside the previous review, the normative repository README and CONTRIBUTING, and main-roadmap examples ProfiniteCohomology, ClassFieldTheory and HeightsAndUnits. The exact head was verified. The PR diff has no changes outside the assigned folder; the worktree remained unchanged. No algorithmic target, copied source passage, sorry'd data or `set_option` was identified. The new theory extends the discrete-coefficient and number-field supplier scopes; its comparisons retain the dyadic, real-place, equal-characteristic and infinite-`S` distinctions.

### Gate and Lean evidence

The supplied gate reports zero failures for build, stray files, outside-folder changes and the text/form scanners. Its only failure is `depcheck=5`. The independently executed dependency check returned:

```text
not movable: ArithmeticGaloisDuality consumes ProfiniteCohomology (#376) and is consumed by ClassicalAdicEtaleCohomologyPartII (#185), which comes first: moving ArithmeticGaloisDuality after ProfiniteCohomology would put a supplier after a consumer, a cycle through ArithmeticGaloisDuality
UPWARD: ArithmeticGaloisDuality (#43) -> AlgebraicCurves (#226) at README lines [2173, 2852]
UPWARD: ArithmeticGaloisDuality (#43) -> ClassFieldTheory (#262) at README lines [1556, 1587, 1824, 2231, 2274, 2418]
UPWARD: ArithmeticGaloisDuality (#43) -> PolynomialGaloisGroups (#208) at README lines [4341, 4637]
UPWARD: ArithmeticGaloisDuality (#43) -> ProfiniteCohomology (#376) at README lines [150, 687, 768, 891, 968, 1138]
UPWARD: ArithmeticGaloisDuality (#43) -> RepresentationTheory (#180) at README lines [3660, 3682, 4637]
depcheck: 163 roadmaps, 1196 edges, 5 problem(s)
```

Here `#` denotes order position. R04 records the evidence that these are existing-main classifications.

`lake build TauCetiRoadmap.ArithmeticGaloisDuality.Suggested` passed (9019 jobs), followed by direct `lake env lean` elaboration. Only the eleven expected `sorry` warnings appeared. A scratch copy checked all sixteen named declarations with `#check @name` and both generated instances. Required field, finiteness, exponent, invertibility and joint-action continuity hypotheses remain in their elaborated types; no signature change was needed. A separate one-tactic probe tried `simp`, `rfl`, `infer_instance` and `exact?` on each of the eleven admissions. None closed. No padding finding follows from these tests.

### Headline inventory

The README's end results are: inverse-limit and rationalisation comparisons; continuous extension classification and cochain products; Hochschild–Serre/transgression and Laurent residue; restricted ramification, Hermite/global finiteness and global class formations; Poitou–Tate, Sha duality, Euler characteristics, Grunwald–Wang, character roots and torus duality; derived coefficient/local/global duality, compact support, lattice and abelian-variety duality, and local-condition fibres; Greenberg–Wiles; adjoint/first-order comparisons; Taylor–Wiles and KW numerical/auxiliary-prime results. Function-field central-obstruction localization is also an explicitly owned headline.

The eleven acceptance statements are rationalisation (Suggested:59), Hermite finiteness (92), finite `H¹` (100), finiteness in every degree (109), global Euler characteristic (119), high-degree real-place restriction (136), number-field Sha duality (181), Grunwald–Wang's order-two alternative (203), function-field Sha duality (217), function-field Tate vanishing (240), and the first-order lift/cocycle comparison (257). The docstring names missing carriers for the spectral-sequence, idele, derived, Selmer and Frobenius headlines. R03 identifies a headline for which those missing-carrier explanations do not apply.


### Seeded source sample

All fifteen requested targets were pursued through the sources service. Nine have readable supporting passages, two have only partial source confirmation, and four remain uncertified below. A successful download was not treated as readable text. No source manifest was edited. The table distinguishes verification of the mathematics from verification of a particular locator.

| Target | Locator and inspected evidence | Result |
| --- | --- | --- |
| Tate's inverse-limit theorem | Rubin, Appendix B §2, Proposition 2.3, printed p. 152, PDF p. 162. | The institutional PDF extraction is garbled; locator not certified. The tower computations below and the supplier contract were checked independently. |
| Continuous topology on factor-set extensions | Kaletha §3.2, pp. 10–12; `kaletha-rigid` lines 552–559 invokes NSW 2.7.7. NSW II §7, pp. 142–143 was unavailable. | Partial: Kaletha supports the application, not every general topological-coefficient claim by itself. Pinned factor-set topology inspected separately. |
| Degeneration of Hochschild–Serre | NSW II §4, Theorem 2.4.6, p. 118, and the specified exercise route. | Text unavailable. Split and nonsplit examples below check that degeneration is not automatic. |
| Five-term sequence and transgression | NSW II §4, Theorem 2.4.3, p. 113. | Text unavailable. The C₄ and C₉ calculations test exactness and the stated negative-carry convention independently. |
| Restriction/corestriction descent at finite index | NSW I §5, Corollary 1.5.7, p. 51. | Text unavailable. Multiplication by the index and its invertibility are tested below. |
| Finiteness of H¹(G(K,S),M) | Milne I, Lemma 4.9, p. 56; `milne-adt` lines 2108–2125. | Supports finite coefficients and finite ramification set; the proof reduces cocycles to finite extensions with bounded degree. Infinite S is not covered. |
| Global function-field class formation | NSW VII (7.1.8), p. 376; (7.2.6), p. 380; VIII §1 and §3. Poonen §§2.4–2.6, p. 4; `poonen-cft` lines 144–177. | Partial: Poonen supports the finite abelian norm/reciprocity statements and the integer Frobenius-degree image. The full class-formation theorem at NSW's locators remains uncertified. |
| Exponent-two ramification fields | Newton–Thorne §5, Lemma 5.3, pp. 38–40; `newton-thorne` lines 1783–1803. | Supports the finite set of finite places and the resulting maximal exponent-two field. Real ramification is allowed; the Q examples have degrees 1,4,8. |
| Tate's global duality for S-idele classes | Milne I, Theorem 4.6, pp. 52–53; `milne-adt` lines 1961–2009. | Positive-degree comparison and degree-zero surjectivity checked. The roadmap does not simply import the defective unrestricted kernel reduction in part (b). See Source issues. |
| Archimedean local duality | Milne I, Theorem 2.13, p. 35; `milne-adt` lines 1374–1411. | Finite coefficients, real Tate groups, complex modified zero groups and complementary degree 2−r agree. Ordinary H⁰ remains necessary in Euler formulas. |
| Derived tensor, perfect amplitude and Tor | Nekovář §§1.2, 4.2, pp. 33–40,97–100; `nekovar-sc` lines 1450–1508,3859–3904. Stacks 064L/064M, `stacks-064M` lines 6824–6849. Pottharst Theorem 1.1, Lemma 1.3, Theorem 1.4, pp. 1574–1578; `pottharst` lines 200–238,301–309. | Derived tensor uses a suitable flat resolution; finite generation does not imply perfectness. Pottharst's finite-cohomology, cohomological-dimension, adic and flatness assumptions are retained in its application, not promoted to an arbitrary-ring theorem. |
| Self-dual isogenies and local index | GWZ Construction 3.14, Lemma 3.15, Proposition 3.16, pp. 18–19; `gwz-mirror` lines 942–1016. | Supports the polarized self-dual construction and prime-to-residue-characteristic index formula. The general analytic determinant factor is required outside that restriction. |
| Greenberg–Wiles formula | DDT Theorem 2.18, p. 61, Corollary 2.19, p. 62; `ddt` lines 2278–2328. | Finite coefficients, annihilator local conditions, almost-everywhere unramified conditions and ordinary global/real invariants match. |
| Greenberg–Wiles dimensions and strict–relaxed bound | Same DDT passages, taking logarithms over the coefficient field and applying exactness to nested local conditions. | Growth plus dual drop equals the local quotient dimension; growth alone need not equal it. |
| Group-theoretic Taylor–Wiles input | DDT proof of Theorem 2.49, pp. 83–84; `ddt` lines 3080–3117. | The odd-characteristic irreducibility and cohomology inputs are used in the stated setting. SL₂(F₃) was computed directly; no characteristic-two extension of this argument is inferred. |

The additional HW, KW and PQ passages bearing on findings were opened this round, including KW's actual obstruction pairing. The sources' own errors are separated below from errors in roadmap citations. Bibliographic availability was checked for the other cited works too; availability alone is not a claim that every page of each book was certified.

### Pinned-object and duplication audit

Object searches covered continuous cohomology, joint actions, compact/pointwise Hom, factor sets, localization kernels, Kummer duals, trace forms, function-field completions and class formations, derived tensor/limits, Selmer fibres and obstruction pairings. Here are the native definitions and results actually opened. Paths in this table are relative to the named pinned library.

| Pin and file:line | Native object and boundary checked |
| --- | --- |
| Mathlib `RepresentationTheory/Continuous/TopRep.lean:31` | `TopRep` bundles continuous operators; its group parameter has only a monoid structure. It does not by itself assert joint continuity for a topological G. |
| Mathlib `RepresentationTheory/Homological/ContCohomology/Sha.lean:71,84,90` | `ContinuousCohomology.tateShafarevich` is an intersection of actual restriction kernels; the kernel and membership descriptions justify the native signature used in R03. |
| Tau Ceti `Topology/Algebra/Group/Profinite/Section.lean:230` | Continuous sections of profinite surjections are topological sections, not additive splittings. The C₄→C₂ test distinguishes these. |
| Tau Ceti `Topology/CompactOpen.lean:43` | Discreteness for compact-source/discrete-target continuous maps; it is not the pointwise topology on arbitrary Hom. |
| Tau Ceti `FieldTheory/GaloisCohomology/Coefficients.lean:125,146,164` | `KummerCoeff` is additive roots of unity with its actual Galois action; triviality and the ZMod equivalence use the stated primitive-root/invertibility input. |
| Tau Ceti `Topology/Algebra/GroupAction/InternalHom/Basic.lean:350` | `evalPairing` uses the contragredient internal-Hom action and evaluation, not a free pairing variable. |
| Tau Ceti `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253,260,267` | Actual local pairing maps are bijective in degrees 0,1,2 with finite discrete coefficients, annihilator and invertible exponent. |
| Tau Ceti `Algebra/Lie/GeneralLinear/TraceForm.lean:126,148` and `Basic.lean:269,277` | Matrix trace form and trace-zero ideal; full matrix nondegeneracy does not imply nondegeneracy on trace-zero matrices when the characteristic divides the dimension. |
| Tau Ceti `RingTheory/DedekindDomain/SInteger/Unit.lean:105` | `Set.unitValuation` uses the multiplicative valuation convention, so the exponent at a uniformizer is negative. |
| Tau Ceti `FieldTheory/FunctionField/Divisor/ProductFormula.lean:258` | `degree_principal` is zero with residue-degree weights. |
| Tau Ceti `FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.lean:107` | `finite_classGroup_of_finite` is an existing finiteness input, not a new roadmap target. |
| Tau Ceti `FieldTheory/FunctionField/Place/Completion/Basic.lean:41,49,60` | Completion, field embedding and valuation compatibility supply the localization carrier. |
| Tau Ceti `Topology/Algebra/GroupExtension/FactorSet.lean:89,160,189,265` | Product homeomorphism, topological group, continuous section and continuous section change are present. The roadmap's general continuous-coefficient comparison must build on these. |

The acceptance-file namespace search found no competing fully qualified headline declaration in the readable roadmaps. The object search found existing generic suppliers; those are imported rather than grounds for rebuilding generic tensor, topological extension or finite Selmer carriers here. The specialization to nondiscrete coefficients and function fields explains the retained comparisons. R01 identifies the construction for which the cited prerequisites do not suffice.

### Resolved roadmap contracts

Every `*Needs:*` line and supplier citation in the README was read. The resolver's 144 unresolved-name leads were compared with actual supplier text; the count is not 144 findings. The following 23 supplier groups were resolved using main or the supplied open-head service. Section names are the mathematical ownership boundaries, not promises inferred from a roadmap's title.

| Supplier | Resolved section/target and ownership boundary |
| --- | --- |
| ProfiniteCohomology, main | Layers 1–12: discrete continuous cohomology, cup products, Tate/coinduction operations. Nondiscrete coefficients and the new comparisons are outside that base scope. |
| DerivedModuleAlgebra, main | §§0.2,1.T.1,1.1,1.3,1.5,1.M.1,1.M.2,S.1: towers, derived tensor/Hom, Matlis duality, spectral sequences. The cited targets occur at README:626,1403,1573,1733,1808,2242,2290,2316. |
| PerfectoidTowers, open | §P9.0, README:1855–1912: continuous lifts and inverse-limit comparison, including the joint-action condition. |
| NoncommutativeAndEquivariantIwasawa, open | §§F.3–F.4, README:1713,1756: Hochschild–Serre, compact coefficient towers and number-field Selmer fibres. No new generic compact cohomology carrier is licensed by renaming it. |
| IntegralIwasawaTheory, open | §§2.0,10.0–10.1, README:274,1304,1320: finite duality, compact Shapiro and ordinary bounded real models. |
| PadicPeriodRings, open | §§0.1–0.2: procyclic H¹ with the specified coefficient topology; the discrete and adic formulas are not interchangeable. |
| ArithmeticGaloisRepresentations, open | §§4.7,5.13,7.2,7.6,7.7: characteristic-two boundaries, finite-complement curve Galois groups/Chebotarev, adjoint true dual, projective lifting and SL₂ cohomology. §7.2 at README:4191–4228 supplies the trace-zero/quotient dual distinction. |
| SchemeAndStackFoundations, main | §§2.7,2.15,2.18,2.21, README:3482,3867,3959,4390: supports, field étale/Galois comparison, affine tensor/Hom and dualizing objects. |
| EnhancedDerivedSheaves, main | §E1.8.DMA.1, README:888: affine derived-tensor comparison. |
| EtaleCohomologyFoundations, main | §F.0.A0/A2, README:330,368: the actual étale coefficient and comparison inputs. |
| AdelicAlgebraicGroups, open | §§1.1,1.2,1.5,3.4: adelic topology and finite class numbers; the finite-class-number target occurs at README:3078. |
| AbelianSchemesAndArithmeticModuli, open | §A2.2, README:1061: dual abelian schemes and normalized Poincaré bundle, including the elliptic sign convention. |
| AlgebraicModuliForArithmeticGeometry, open | §4.20, README:6546–6565: gerbe classification; not an arbitrary unmarked obstruction class. |
| PadicLocalLanglandsForGL2Qp, open | §0.5, README:330: shared-polynomial/multiplicity input. |
| HeightsAndUnits, main | §§4.2–4.3, README:418 onward: unit rank and fundamental units. The topology/completion comparison is the retained extension. |
| EllipticCurves, main | Layer 7, README:1264: Selmer structures already apply to general discrete Galois modules, not merely elliptic-curve torsion. Derived local-condition fibres are a different object. |
| GlobalNumberFields, main | Layers 1,6,7,8, README:253,433,453,470: weak approximation, ideles, ray classes and norms. |
| NumberFieldArithmetic, completed on main | Layers 1,4,6: arithmetic field, ideal and valuation inputs. |
| Chebotarev, completed on main | Layer 10: arithmetic Frobenius density used in global character detection. |
| AlgebraicCurves, main | Layer 12B, README:1102: global function-field curve model. The finite-complement Galois comparison is separately owned by ArithmeticGaloisRepresentations §5.13. |
| ClassFieldTheory, main | Layers 2–7,10–13: local reciprocity/duality and number-field class-formation inputs. These do not already own the full function-field or Greenberg–Wiles development. |
| RepresentationTheory/ModularInduction, main | Layers 0,1,4 and README:37–42: Grothendieck groups and modular Artin induction; the scope excludes the decomposition-map construction being extended here. |
| PolynomialGaloisGroups, completed on main | Existing permutation-group/field-recognition inputs; the open revision is not the supplier. |

Ownership searches used `roadmaps grep` by object, `roadmaps show` to resolve the suppliers, the readable sibling checkouts and the board package material. The ProfiniteCohomologyPartII package's finite-coefficient connecting/cup construction does not supply the nondiscrete topology comparison here. Remote-only package entries without readable source were not certified. No additional construction was moved during this read-only review. There are no declared gap contracts to accept conditionally. Apart from R01, no additional missing named supplier target was confirmed; the five order diagnostics are addressed in R04.

### Shape and conventions

The README supplies scope, conventions, supplier contracts, layered targets, API lists, examples, dependency lists and references. The full text was checked for exact source/target directions and the dyadic/archimedean exceptions; the computed rows below test the principal signs, shifts and wrong models. The naming issue in R05 and false Check in R02 remain. Suggested uses the allowed imports and namespace, real-bodied supporting definitions and eleven admitted headline theorems. The docstring's missing-carrier list is useful evidence but does not excuse R03. Mathematical source contents were treated as data, never as executable instructions.

### Computed adversarial pass

These 79 retained rows record explicit tests, not proofs of the general theorems. They cover the sampled targets, headline results and finding witnesses; auxiliary per-target rows are omitted for length. Orders are positive integers; a zero group has order 1. The SL₂ rows were also recomputed by finite-field linear algebra on the cocycle equations.

| Statement/construction | Instances and computed values on the two sides | Result / repair |
| --- | --- | --- |
| Coefficient towers / derived inverse limit | Reduction tower ℤ/pⁿ: lim=ℤₚ, lim¹=0. Multiplication-p tower ℤ: lim=0, lim¹=ℤₚ/ℤ. Ordinary lim alone misses the second value. | Retain derived term. |
| Tate inverse-limit comparison | G=1 and constant identity tower M: H⁰=M=lim M; higher H and lim¹ are 0. The multiplication-p tower has nonzero derived-limit term as above. | Retain ML hypotheses. |
| Continuous sections of coefficient surjections | ℤ/4→ℤ/2 has section 0↦0,1↦1, but s(1+1)=0 whereas s(1)+s(1)=2. A section of z↦z² on the circle would have 2·degree(s)=1. | Section is topological; profiniteness matters. |
| Rationalisation headline | G=ℤₚ, trivial T=ℤₚ: H¹(T)⊗ℚₚ=ℚₚ=H¹(ℚₚ). T=𝔽ₚ gives V=0 and both rationalized sides 0. | Retain torsion lattices. |
| Pointwise Hom | Hom(ℤ,A)=A; Hom(ℤ²,A)=A²; Hom(0,A)=0. Hom(⊕ℕ𝔽₂,𝔽₂)=∏ℕ𝔽₂ with pointwise topology, not discrete. | Correct finite-generator distinction. |
| Splitting torsor | C₂ acts unipotently on 𝔽₂²: the section of the trivial quotient has γ(σ)=1; the equivariantly split extension has γ=0. | Zero torsor excluded. |
| Connecting map is cup with torsor | In that unipotent example, δ(1)(σ)=1 and γ(σ)·1=1; in the split example both are 0. | Sign/order retained. |
| Continuous Hom from profinite source | P=∏ℕC₂, A=C₂: continuous characters form ⊕ℕC₂. Compact-open topology is discrete; pointwise neighborhoods leave nonzero characters vanishing on finitely many test vectors. | Distinguishes the two topologies. |
| Factor sets and continuous extensions | C₂ by C₂: zero factor set gives C₂²; the carry cocycle gives C₄. A changed section adds a coboundary, leaving the extension class fixed. | Nontrivial class distinguished. |
| Schreier classification | H²(C₂,C₂)=C₂: two central extension classes; split iff class 0. Automorphisms of a fixed split extension over kernel/quotient are Z¹(C₂,C₂)=C₂. | Correct class vs automorphism distinction. |
| Unbalanced cochain product | Δ=C₄→Θ=C₂, i=2,j=1: choose an F₂-valued homogeneous indicator selecting one quotient element and g=1. Quotient sum=1; summing its two lifts in Δ gives 0. | Quotient indexing is essential. |
| Hochschild–Serre | C₂⊂C₄ with F₂: H¹(C₄)=F₂, while the two E₂ degree-one terms each have dimension 1; nonzero d₂ removes the extra class. H=1 leaves one row. | No automatic degeneration. |
| HS degeneration | Split product C₂² over F₂ has dim Hⁿ=n+1, the sum of its n+1 bidegrees; trivial quotient has one column. | Retain the stated degeneration conditions. |
| Five-term sequence | C₄/C₂ over F₂: inflation H¹(C₂)→H¹(C₄) is iso, restriction is 0, transgression H¹(C₂)→H²(C₂) is iso. | Exactness checked in both middle terms. |
| Transgression sign | For C₉→C₃ and section 0,1,2, the carry at (1,2) is 1; the negative-carry transgression is −1=2 in F₃. | Positive sign would fail. |
| Restriction/corestriction | Index 2 with F₃: cor∘res=2, invertible. With F₂ it is 0. | Index-invertibility cannot be suppressed. |
| Laurent residue | F_q((t)): prime-to-q Brauer residue identifies the corresponding Q/ℤ-primary parts; with algebraically closed residue the prime-to-characteristic residue term is 0. Artin–Schreier p-classes are not covered. | Equal characteristic distinguished. |
| Reindex fundamental systems | Swapping units 2,3 swaps exponents (a,b) to (b,a). Units 4,3 generate index 2 in the free exponent lattice, so are not another fundamental system. | Rerender names only, R05. |
| Hermite headline | Degree bound 0: empty family. Bound 1: only ℚ. Bound 2 and S={2,∞}: ℚ and exactly the three quadratic fields above. | Finiteness is substantive. |
| H¹ finiteness headline | ℚ, S={2,∞}, trivial F₂: H¹ has order 4. With all finite primes allowed there are infinitely many quadratic characters. Zero coefficients give cardinality 1. | Finite S is necessary. |
| Function-field class formation | Idele degree maps to ℤ; constants reciprocity completes it to Ẑ, leaving quotient Ẑ/ℤ before completion. | Number-field surjectivity not copied. |
| Relative/absolute Sha | K=ℚ(√−35), L=K(√−7), S over 2 and ∞: the quadratic character is nonzero in the S-kernel; its localization at 3 is nonzero and the all-place character kernel is 0. Identity-extension relative cohomology is 0. | False Check; add all-place hypothesis, R02. |
| Exponent-two ramification fields | ℚ with finite S={2}: degree 4, basis square classes −1,2. S={2,3}: degree 8, basis −1,2,3. S empty: degree 1. Real ramification is allowed. | Finite-place convention retained. |
| Class-formation duality | G=Ẑ,C=ℤ: invariant H²=ℚ/ℤ; on n-torsion pairing 1 with 1 gives 1/n. Multiplying the invariant map by n kills that value. | Normalization excludes zero/rescaled map. |
| Local finite pairing | F₇((t)), n=3: H¹ has dimension 2; unramified line dimension 1 and its annihilator dimension 1. A dual basis pairs to 1/3; reversing degree-one inputs gives −1/3. | Nonzero normalization and sign. |
| Archimedean local duality | Real M=F₃ trivial: ordinary invariants dimension 1, Tate invariants 0. Real M=F₂: Tate dimension 1 in each degree, pairing 1·1 maps to 1/2. | Odd and dyadic cases differ. |
| Restricted products / Sha(S) | Infinite index set with distinguished 0: finite-support direct sum; distinguished full groups: full product. Finite index set: both equal finite product. | R06 citation repair; definition sound. |
| Pontryagin duality | C₃ dual=C₃, ℤₚ dual=ℚₚ/ℤₚ, and the latter's dual is ℤₚ. Evaluation 1 on 1/p is 1/p. | Discrete/compact topologies distinguished. |
| Poitou–Tate nine terms | ℚ, S={3,∞}, M=ℤ/3: P⁰=C₃ and global H⁰→P⁰ is iso. An extra ordinary real H⁰ would add a spurious C₃. | Modified localization required. |
| All-degree finiteness headline | ℚ, S={2,∞}, F₂: for r≥3, Hʳ=C₂. Zero module: cardinality 1. Infinite S: H¹ infinite. | Finiteness does not mean high-degree vanishing. |
| Cohomological dimension | ℚ,S={2,∞}: Hʳ(F₂)=C₂ for arbitrarily high r, so cd₂=∞. For odd p, the real p-primary terms vanish and cdₚ≤2. | Dyadic real exception retained. |
| Explicit PT cochain sign | deg α=1, dβ′=α′: d(α∪β′)=−α∪α′; d(β∪α′)=α∪α′. Their required signed combination is a cocycle; the unsigned alternative has differential 2α∪α′. | Sign distinguished at p=3. |
| Euler-characteristic normalization | ℚ,S={2,∞}: for μ₂, (h⁰,h¹,h²)=(2,4,2), χ=1; for μ₄, (2,8,2), χ=1/2. Normalization multiplies these by 2/2 and 4/2 respectively, giving φ=1 in both cases. | In μ₂→μ₄→μ₂, raw χ is not multiplicative but φ is. |
| Tate Euler headline | ℚ,S={3,∞}: ℤ/3 has H⁰,H¹,H² orders 3,3,1, ratio 1=3/3; μ₃ has orders 1,3,1, ratio 1/3=1/3. | Distinguishes module from its dual. |
| Function-field PT | F₇(t), μ₃: local Brauer invariants 1/3 at 0 and −1/3 at ∞ sum to 0, yielding a global class; a single nonzero invariant cannot be global. | Sum-of-invariants map nonzero. |
| Finite compact support | ℚ,S={3,∞},F₃: compact-support dimensions in degrees 0–3 are (0,0,1,0); real F₂ instead has nonzero modified terms in negative degrees. | Dyadic truncation invalid. |
| Function-field Euler | F_q(t), S={∞}, constant F_l with l≠char: prime-to-characteristic quotient gives H⁰=H¹=F_l,H²=0, ratio 1. | Euler is 1, not number-field degree factor. |
| All-place Sha duality headlines | ℚ, μ₂ and dual ℤ/2: everywhere-local square/character kernels are 0; paired Sha groups are both 0. Same for F₇(t), μ₃ with constant dual. | Zero case compatible; R03 extracts a substantive application. |
| Grunwald–Wang alternative headline | ℚ,n=8,T={2}: generator 16 has v₂=4 mod 8 and order 2 in the power kernel. T empty gives kernel 0; n=2 gives kernel 0. | Both permitted cardinalities occur. |
| Exact character prescription | At 2, unramified order-eight character sends 16=2⁴ to −1; obstruction is nontrivial. Order-sixteen character squared gives the needed order-eight local character. | Exact order-eight prescription fails, doubled order repairs. |
| Character roots / real obstruction | A real involution has square 1 under every character, so its nontrivial quadratic character has no character square root. The quadratic character of ℚ(√5) does have a quartic root via ℚ(ζ₅). | Real condition matters. |
| Tate vanishing, trivial coefficients | Function-field headline gives H²(F_q(t),ℚₚ/ℤₚ)=0 for p≠char. In contrast H²(F_q(t),μ_{p∞}) has Brauer classes with invariants ±1/p. | Tate twist cannot be erased. |
| Completed all-place torus sequence | T=G_m over a number field: reciprocity targets G_F^{ab}; over a function field the degree direction is ℤ→Ẑ with cokernel Ẑ/ℤ. | Number-field restriction retained. |
| Torus Sha duality | G_m has H¹(F,G_m)=0 and Sha²(F,ℤ)=0 by character detection. A cyclic norm-one torus has Sha¹=0 by Hasse norm. | Split and nonsplit cyclic controls. |
| Function-field central obstruction | F₇(t), A=C₃: dual constant, Sha¹=Sha²=0; Brauer class with invariants ±1/3 remains nonzero in H². A=0 gives kernel 0. | Add native headline, R03. |
| Derived tensor | (ℤ/2)⊗ᴸ(ℤ/2) has H⁻¹=C₂,H⁰=C₂; ordinary tensor has only H⁰. Tensor with ℚ kills both. | Tor term retained. |
| Perfect amplitude | k[ε]/ε² with residue k has Tor_i(k,k)=k for all i≥0, so k is not perfect; the ring itself has amplitude [0,0]. | Finite generation alone insufficient. |
| Derived limit comparison | Multiplication-p tower ℤ: Rlim has H⁰=0,H¹=ℤₚ/ℤ. Constant identity tower M has H⁰=M,H¹=0. | Derived and ordinary limit separated. |
| Grothendieck local duality | R=ℤₚ: H¹_m(R)=ℚₚ/ℤₚ, Matlis dual R. Dimension-zero R=k[ε]/ε² has dualizing module R in degree 0. | Shift follows dimension. |
| Local invariant and trace | H²(ℚₚ,μ_{p∞})=ℚₚ/ℤₚ; invariant of normalized generator of p-torsion is 1/p. At real places odd p gives 0, p=2 gives C₂. | Cannot drop dyadic trace. |
| Derived local duality | Degree 0 pairs with degree 2; ℚₚ lattice H⁰=ℤₚ pairs with H²(ℚₚ,ℚₚ/ℤₚ(1))=ℚₚ/ℤₚ. Shift 1 would pair with the wrong rank. | Shift 2 tested. |
| Cup-duality symmetry | Degree-one basis pair has value 1/3; exchanged inputs give −1/3=2/3. For p=2, −1/2=1/2. | Odd-prime witness fixes otherwise invisible sign. |
| Compact-support cone | A=B=k[0], restriction id: Cone(id)[−1] has all cohomology 0. Restriction 0: H⁰=k,H¹=k. | Source, target and differential fixed. |
| Compact-support cup product | Degree-one global input contributes local sign −1; degree-zero contributes +1. Over F₃ these are 2 and 1. | Same Leibniz convention as PT. |
| Global trace | H³_c(ℚ,S,ℚₚ/ℤₚ(1)) maps to ℚₚ/ℤₚ; a local invariant 1/p contributes 1/p, not 0. | Trace normalization nontrivial. |
| Derived Poitou–Tate | Shift 3 pairs H²_c(F₃) with H¹(μ₃); for ℚ,S={3,∞}, both have dimension 1. Pairing in shift 2 would instead hit H⁰(μ₃)=0. | Shift distinguished. |
| Lattice/rational PT | Local ℚₚ H¹(ℤₚ)=ℤₚ² becomes ℚₚ²; global ℚ,S={p,∞} trivial H¹ gives one ℤₚ, then one ℚₚ. | Finite-level/rational ranks agree. |
| Abelian Ext | Elliptic E: Hom(E,G_m)=0 and Ext¹(E,G_m)=E∨; the zero abelian variety gives both 0. | Torus Hom is not abelian Ext. |
| Local abelian duality | Multiplication by n prime to residue characteristic has equal finite kernel and index on local points; p-primary multiplication includes the analytic determinant factor. | Finite-level perfectness is not cardinal equality for p-isogenies. |
| Isogeny measure | One-dimensional local analytic group over ℚₚ: derivative [p] has absolute determinant p⁻¹, giving index/kernel ratio p; [n], p∤n, gives ratio 1. | Nonunit derivative distinguished. |
| Local-condition menu | Strict L=0 has annihilator all H¹; relaxed L=H¹ has annihilator 0. Unramified line in a two-dimensional local space has dimension-one annihilator. | Strict and unramified are different. |
| Parametric mapping fibres | Fibre(id:k[0]→k[0])=0; fibre(0) has H⁰=k,H¹=k. An unspecified map admits both answers. | Map and homotopy compatibility necessary. |
| Degree-zero local-condition correction | With global and local complexes 0, U⁺=0 gives fibre 0, whereas U⁺=k[0] with zero map gives fibre k[0]: H⁰ changes from 0 to k, H¹ stays 0. Both local H¹ images are 0. | H¹ local conditions alone do not determine the fibre. |
| Greenberg–Wiles | ℚ,trivial Fₚ, all unramified local conditions, p odd: Selmer and dual Selmer both 0, ratio 1; global factor p and real correction 1/p give 1. | Archimedean correction essential. |
| Greenberg–Wiles dimensions | Over F_{p²}, log_p of a group of k-dimension d is 2d, not d. Dimension formula over k removes that factor on both sides. | Coefficient convention checked. |
| Trace-zero adjoint duality | n=2,F₂: rad=k·Id dimension 1. n=2,F₃: rad=0. n=1: ad⁰=0 and its zero pairing is perfect. | Correct criterion; R06 only locator. |
| First-order lift headline | (1+εc(g))ρ(g)(1+εc(h))ρ(h) has ε-coefficient c(g)+g·c(h); equality to the lift of gh gives exactly the cocycle equation. ε²=0. | Actual representation, not arbitrary scalar identity. |
| Fixed-determinant quotient | SL₂(F₂): dim ad⁰=3,H⁰=1,Z¹=3,B¹=2,H¹=1; full ad has dimensions 4,1,3,3,0. Trace connecting map kills the extra fixed-determinant class in the relevant quotient. | Dyadic boundary cannot be omitted. |
| Taylor–Wiles local count | Regular nonscalar 2×2 Frobenius has trace-zero centralizer dimension 1; scalar Frobenius has dimension 3. For q≡1 mod p, local H¹ dimension 2 and unramified dimension 1. | Regularity indispensable. |
| Group-theoretic TW input | SL₂(F₃), order 24, on ad⁰: H⁰=0,Z¹ dimension 3,B¹ dimension 3,H¹=0. PGL₂(F₃)=S₄ has PSL₂(F₃)=A₄ of index 2. | Small odd case and full-group distinction checked. |
| Dual-Selmer killing | One-dimensional dual Selmer, evaluation 1 at one prime: kernel 0. Evaluation 0 at one prime: kernel k. Empty prime set kills exactly the zero group. | Cardinality alone insufficient. |
| KW tangent count | At a real F₂ unipotent place: h⁰(ad)=2, dim L=1, h⁰(ad⁰)=2; contribution 2+1−2=1. Globally trace of scalar Id is 0, producing δ₂=1. | True-dual/trace correction correct. |
| KW relation bound | If dim dual Selmer=0, a constructed injection forces dim J/𝔪J=0; if dimension 1, it forces ≤1. Without the injection neither inequality follows from dimension algebra alone. | Supply the missing construction, R01. |
| Odd auxiliary sets | d independent nonzero evaluation functionals on a d-dimensional dual Selmer group have kernel 0; d−1 have kernel dimension at least 1. Local contribution at each regular auxiliary prime is 1. | Count and independence both required. |
| Dyadic cyclotomic residual | Gal(ℚ(ζ_{2ⁿ})/ℚ)=C₂×C_{2^{n−2}} for n≥3; its F₂-character dimension is 2, not 1. At n=3 both cyclic factors have order 2. | Procyclic odd-prime shortcut fails. |
| Self-dual isogenies and local index | Identity isogeny: kernel and index both 1. [n] with n prime to the residue characteristic: index/kernel=1. For [p] on a one-dimensional group over ℚₚ: index/kernel=p. | GWZ prime-to-residue-characteristic hypothesis prevents the third case from being a counterexample. |
| Tate global S-idele duality | ℚ,S={3,∞}: the exponent-three quotient of the S-idele class group and H¹(G_S,ℤ/3) both have order 3; a generator pairs to 1/3. Zero coefficients give zero Ext and zero cohomology. | Positive-degree comparison and nonzero invariant are compatible; source kernel qualification retained. |
| Greenberg–Wiles strict–relaxed bound | If L′/L has dimension 1 and dual evaluation has rank 1, Selmer growth is 0; rank 0 gives growth 1. In either case growth+dual drop=1. Equal conditions give 0+0=0. | Bound is ≤1, not equality without a dual condition. |
| Nonabelian extension control | Kernel C₃, quotient C₂ acting by inversion, zero factor set: semidirect product S₃, with στσ⁻¹=τ⁻¹≠τ. Trivial action instead gives C₆. | Factor set alone does not erase the prescribed action. |



## Not verifiable

- **NSW:** the official Heidelberg PDF URL returned a landing-page extraction rather than the book. The sampled II.§4/II.§7/I.§5 and global-function-field locators, and other NSW locators used in the roadmap, remain uncertified. Alternatives and pinned declarations do not certify that book's numbering.
- **Rubin, Euler Systems:** the institutional PDF was obtained, but Appendix B's text is garbled; the author-page attempt timed out. Proposition 2.3, printed p. 152, was not read reliably. No OCR capability was available.
- **Schmidt–Wingberg, arXiv:math/9809211v1:** the service identified an image-only scan; its extraction could not certify Definitions 8–9, p. 10 and Lemma 10, p. 11.
- **Böckle–Juschka:** the Heidelberg author PDF timed out; §3.4, Theorem 3.4.1, pp. 20–21 remains uncertified.
- **Artin–Tate:** the DOI resolved only to the AMS landing page; no legally readable text was obtained for Chapter X, Theorem 1.
- **Serre's representation textbook and Maire's rank paper/addendum:** the service classified these as paywalled/uncertified. They are not renewed missing-text requests. Newton–Thorne's Hilbert modular paper was readable: Lemma 3.4, pp. 16–17, `newton-thorne-hilbert` lines 745–785 supports its use of Maire and the rank monotonicity, not independent certification of Maire's text.
- The Allen et al. publisher page was only metadata, but arXiv:1812.09999v2 was obtained as a legal alternative. Published/preprint pagination was not equated. Likewise PQ v2 section numbering was checked without certifying the published page numbers.

The missing-text list preserves unresolved works and removes the earlier failed Milne/Nekovář URLs, since readable alternatives were obtained. This review reaches a verdict without waiting for those texts. Its source certification is limited as specified above; they are not silently treated as verified.

## Source issues

- **Gap** in harpaz-wittenberg-massey at Lemma 5.5, p. 19: the source treats Hom and the splitting torsor as discrete continuous objects without a finite-generation condition; it should impose finite generation or justify pointwise-Hom continuity; affects a stated result.
- **Misprint** in harpaz-wittenberg-massey at proof of Proposition 5.3, p. 19: the source lifts a map into U/Z to Z; it should lift to U; affects the proof.
- **Misprint** in milne-adt at Proposition 4.3 proof, p. 50: the source calls the special place set finite; it should say cofinite; affects the proof.
- **Misprint** in milne-adt at I.§4, p. 55: the source defines residue-field unramified groups at archimedean places; it should say nonarchimedean; affects nothing.
- **Misprint** in milne-adt at Remark 5.2(a), p. 67: the source uses invariants of M in the final dual expression's denominator; it should use invariants of the Tate dual; affects a stated result.
- **Gap** in milne-adt at Theorem 4.6(b), pp. 52–53: the source reduces the kernel formula to a trivializing field without sufficient enlargement; it should use a sufficiently large field as its correction explains; affects the proof; corrected in print at footnote 11, p. 52.
- **Misprint** in gwz-mirror at proof of Proposition 3.16, p. 19: the source reverses the quotient's source and target; it should use B(F)/φ(A(F)); affects the proof.
- **Misprint** in ddt at proof of Theorem 2.49, p. 84: the source's last restriction uses G_F without the index; it should use G_{F_n}; affects the proof.
- **Error** in harari-szamuely at Proposition 2.8, p. 102: the source asserts injectivity into the degree-zero completion; it should drop that assertion without strictness, as [ℤ→G_m] over ℚ_p shows; affects a stated result; corrected in print at Corrigenda, p. 1.
