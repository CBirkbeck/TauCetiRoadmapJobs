<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1562#issuecomment-6430437304 -->
Red team round 1 pass a (codex) of 0a0dea3

Verdict: needs_changes

1. **F01** (P3) HT03 §6 does not supply the attached comparisons

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:870 and :984; “HT03 §6, numbered pp.17–18”.

   **Claim:** This locator supports coprime-degree Betti/Hodge independence and the SL/PGL stringy Hodge-number comparison.

   **Witness:** HT03 line 680 compares Dolbeault with de Rham at the same degree; HT03 line 709 does the corresponding twisted stringy comparison. Neither changes determinant degree or compares SL with PGL.

   **Exact repair text:** Replace the HT03 §6 citations at these targets by: “GWZ20 Corollary 7.17 [respectively Corollary 7.22], together with the explicitly declared Higgs-sector purity contract.” Keep HT03 §6 only where discussing Dolbeault/de Rham comparison. This leaves the equal-degree Dolbeault/de Rham example correctly attributed and makes no unsupported attribution for different degrees.

2. **F02** (P1) The unrestricted character-count definition consumes only a tame trace theorem

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:147–171; “G is finite” and “stack expression”.

   **Claim:** For every finite constant G over a finite field, the character trace equals the weighted sum over [X/G]. The proof imports gap:tame-stack-trace, whose domain is tame quotient stacks (line 111).

   **Witness:** Take X=Spec 𝔽₂, G=C₂ and χ=1. The required mass is 1/2+1/2=1 and the cohomological trace is 1. BC₂ in characteristic two is not tame, so the named contract cannot prove this instance.

   **Exact repair text:** Extend the trace contract, in both README and the matching plan gap, to: “Provide bounded compact cohomology, proper base change and geometric-Frobenius trace with characteristic-zero ℓ-adic coefficients, ℓ different from the residue characteristic, on finite quotient stacks by finite étale group schemes, including when the stabilizer order is divisible by the residue characteristic; sum all rational torsor classes with reciprocal automorphism order.” Explain that finite-group averaging is exact over the coefficient field. Keep the tame hypotheses of the age and integration contracts. This covers BC₂/𝔽₂ and retains the computed mass 1 without excluding a prime from §0.1.

3. **F03** (P2) A smooth relative family need not have a manifold as its total splitting space

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:432; “the manifold of flat unitary splittings”.

   **Claim:** Smooth projectivity of U→V makes the relative splitting space a manifold; no smoothness of V is assumed.

   **Witness:** Let V be a complex nodal curve, U=E×V for an elliptic curve E, and α=0. Picτ=Pic0 and Split′=E∨×V. At the node this analytic space is not a manifold.

   **Exact repair text:** “Identify the analytification of Split′ with the relative analytic torsor of flat unitary splittings over V^an, compatibly with pullback. Its total space is a manifold when V is smooth.” In the witness both sides remain E∨×V; no false manifold assertion remains and singular bases are retained.

4. **F04** (P3) The integral Brauer vanishing is attributed to the wrong supplier

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:135 and :938; “Consume Layer 5 … Br(O_F)=0”.

   **Claim:** ClassFieldTheory Layer 5 supplies the integral-ring Brauer vanishing used in §4.6.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:4491 supplies `brauer_henselian_local`, identifying Br(O_F) with Br(k). ClassFieldTheory Layer 5 supplies the fraction-field invariant and local duality, not this ring comparison.

   **Exact repair text:** “Use SchemeAndStackFoundations §2.22, `brauer_henselian_local`, followed by Tau Ceti `subsingleton_brauerGroup_of_finite`, for Br(O_F)=0; use ClassFieldTheory Layer 5 for inv_F.” Add this dependency to §4.6. For O_F=ℤ₅ and 𝔽₅[[t]], the repaired route gives Br(O_F)=Br(𝔽₅)=0 in both cases.

5. **F05** (P2) The relative Picτ gap asks for an existing earlier target

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:89; “Provide relative Picτ for smooth projective families”; matching gap `relative-picard-norm-duality` in design/plan.json.

   **Claim:** This part of the relative Picard construction is missing and must be supplied anew by AbelianSchemesAndArithmeticModuli.

   **Witness:** TauCetiRoadmap/ComplexComparisonPartII/README.md:2046, §C3.2e `picardTorsionComponent`, already provides Picτ and base change for locally noetherian, projective, flat families with geometrically integral fibres, including the smooth projective geometrically connected families here.

   **Exact repair text:** “Import relative Picτ from ComplexComparisonPartII §C3.2e, `picardTorsionComponent`, and its identity-component interface from §C3.2f.1. The residual gap requests its Pic0 identification on abelian torsors, norm–pullback Poincaré duality, and the spectral norm-kernel/quotient adapters.” Remove the generic Picτ construction from the gap's `needs` in both files and add the owner to §1.3. For E over Spec ℂ, the imported Picτ is E∨; for ℙ¹ it is zero. No second Picτ is constructed. ComplexComparisonPartII is earlier in ORDER.txt.

6. **F06** (P1) The arbitrary-gerbe evaluation bridge is called imported but has no supplier

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:576–578; “By the imported Lemma 6.7”.

   **Claim:** For an arbitrary arithmetic μr-gerbe, its evaluation phase is a constant times the Tate character of its principal splitting torsor.

   **Witness:** TauCetiRoadmap/ArithmeticGaloisDuality/README.md:6137–6144 exports evaluation for the particular Gₘ-gerbe constructed from Ext². Its Check at :6168 distinguishes arbitrary constant Brauer additions. It does not identify a general gerbe's principal splitting torsor with that Ext class.

   **Exact repair text:** Add a target before §2.6: “For an abelian variety A/F over a nonarchimedean local field, an arithmetic μr-gerbe α with r invertible, β its Gₘ-class, and t=[Split′(A/F,α)]∈H¹(F,A∨), prove inv(β(x))−inv(β(0))=⟨x,t⟩ for every x∈A(F), using the fixed Poincaré convention. Identify the Hochschild–Serre edge image of the Ext²-gerbe with the image of t, and use middle exactness to identify their difference as the constant β(0).” Cite §1.3–§1.4, SchemeAndStackFoundations §2.22 and D7.6 (and its equal-characteristic gap), then replace “imported Lemma 6.7” by this target. For a constant invariant 1/2 the difference is 1/2−1/2=0 and the phase is −1; for nonzero t the normalized character is nontrivial and its integral is zero. This supplies the previously unnamed step without equating constancy with neutrality.

7. **F07** (P3) Several Checks only repeat an API or request a check

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:168, :193, :196, :271, :298, :354, :384, :441, :478, :505–506, :802–803, :903, :921 and :950.

   **Claim:** These entries are discriminating mathematical Checks. Examples include “Check each equivalence is equivariant” and “Each of the four duality conditions is linked to its actual supplying node”.

   **Witness:** The first repeats :155, :193 repeats :182, :271 repeats :255, :298 repeats :283, :384 repeats :368, and :921/:950 give instructions without an instance or a computed result.

   **Exact repair text:** Remove these duplicate/instruction entries from the Checks lists, preserving the actual examples already present. In §4.5 add: “For a nonzero order-three point t on a regular Prym, an equivariant identification satisfies f(s+t)−f(s)=t; composing with inversion gives −t≠t and fails.” In §4.7 replace the administrative entry by: “For n=1, both moduli are points, the kernel has order 1, the splitting torsors have one point and both Brauer classes are 0; for canonical genus one and n=2, the point quotient has stabilizer order 4 and free locus empty, so it fails the admissibility certificate.” The listed definition sections still have at least three independent concrete controls after removing the repetitions; §2.2 retains the identity pair, characteristic-p isogeny and Kummer-obstruction controls.

8. **F08** (P2) The promised stronger Kummer theorem has no theorem target

   **Location:** packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:15, :484, :927 and :942; “the stronger Kummer-neutrality target of §2.2”.

   **Claim:** A separate stronger μn-neutrality theorem remains in scope. Section 2.2 only defines an additional predicate on abstract pairs; §4.6 proves Brauer neutrality and §4.7 assembles the weaker pair. Suggested.lean's unavailable-headline list also omits this promised theorem.

   **Witness:** README:504 allows a non-r-divisible degree-zero line: its root gerbe has Brauer class0 and nonzero Pic/r residue. Thus §4.6's conclusion does not discharge the extra predicate mentioned at :927.

   **Exact repair text:** Add a separate target after §4.6: “For the specific powered Hausel–Thaddeus gerbes, under the regular-locus, integral-model, root and rank hypotheses of §4.6, both μn-gerbes on the two regular fibres are neutral if and only if both fibres have F-points. In the forward direction, neutralizations give points of the principal splitting torsors, hence of the opposite fibres by §4.5. For the reverse direction, supplement the Brauer argument of §4.6 by computing and killing the Pic/n Kummer residues of these specific gerbes.” Give this target its own locator, proof obligations and dependencies; point the existing promises to it. Add its name and missing gerbe-neutralization carrier to the module docstring. This is an explicit proof obligation, not a consequence already supplied by §4.6. Rank one gives neutrality and one point on each side; an arbitrary root of a nondivisible line is excluded by the specific-gerbe hypothesis and still has nonzero Kummer residue. No claim of a general Brauer-to-μn converse is introduced.

## Verified sound

Read all 1,096 README lines and all 54 Suggested.lean lines. Inventory: **0 Lean declarations**, **44 numbered README targets**, **83 API statements**, **14 definition sections**, **31 headline promises (30 listed in the Lean docstring, plus R08)**, and **163 Check bullets**. Of the Checks, 147 received mathematical instance tests; 16 repeated or administrative entries are identified in R07. Sampled computations are retained below. All 14 definition sections retain at least three concrete controls. These counts describe the audit, not certification of the unproved general theorems.

**Suggested.lean context inventory:** the only import is `Mathlib`; the namespace is `TauCetiRoadmap.TopologicalMirrorSymmetryForHitchinSystems`; there are no declarations, section variables, instances, universes, admitted data, examples, `set_option`s or padding. The complete declaration/context table has zero rows. There is therefore no `#check @name` to elaborate, and no Lean command was run. No signature changed. The generic numerical controls in the README do not belong in this acceptance file.

The pins inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches by object and inspection of the native definitions confirm that abstract filtrations, Picard functor values, line bundles, and an abelian variety do not provide Higgs moduli, relative gerbe splitting stacks, geometric compact Hodge realizations, or inertia-sector Galois complexes.

### Headline coverage

The module docstring names 30 headline theorems. None has all its geometric carriers at the pins. No missing statable headline or replacement theorem was found. The additional stronger Kummer-neutrality promise is missing from the docstring and lacks its own theorem target (R08).

### Pinned declarations

All 12 library declarations explicitly cited in the package were located; the additional Brauer declaration in R04 was also read. Each file below is relative to its library root.

| Declaration | Pinned location | What was verified |
|---|---|---|
| `AddMonoidAlgebra` | Mathlib/Algebra/MonoidAlgebra/Defs.lean:66 | Finite-support coefficient functions; rational bidegree group allowed |
| `sum_hom_units_eq_zero` | Mathlib/RingTheory/IntegralDomain.lean:186 | Nontrivial finite-group character into a domain; sum0 |
| `Matrix.trace` | Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | Finite diagonal sum; no semisimplicity conclusion |
| `TauCeti.Hodge.MixedHodgeStructure` | TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 | Abstract integral/rational/complex models and bounded filtrations; no geometric realization |
| `TauCeti.Hodge.tate_hodgeNumber` | TauCeti/Geometry/Hodge/Tate/Basic.lean:160 | Tate index p=−m |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112 | Invertible sheaves on the actual scheme |
| `TauCeti.AlgebraicGeometry.LineBundleClass` | TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50 | Isomorphism classes, not a represented relative Picard scheme |
| `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk` | TauCeti/AlgebraicGeometry/LineBundle/Class.lean:104 | Dual gives inverse class |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 | Proper geometrically integral group over a field, not a relative dual family |
| `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` | TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66 | Chosen section/rigidification and Type(u+1)-valued functor; no representability |
| `TauCeti.AlgebraicGeometry.rigidifiedPicardPoint` | TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean:40 | Trivial pointed class |
| `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` | TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:182 | Finite commutative group, splitting domain; sum equals cardinality or0 |
| `subsingleton_brauerGroup_of_finite` | TauCeti/Algebra/BrauerGroup/Trivial.lean:247 | Brauer group of a finite field is trivial |

### Supplier and ownership audit

Resolved all **17 roadmap supplier names used in the package**, plus **ComplexComparisonPartII** as the earlier owner found in R05. Section ranges were read against main/completed or the available current new-roadmap heads. The 55 specifically supplied sibling folders were searched by object in **110 README/Suggested files**. Roadmaps-on-main, board-package and open-head searches also covered Higgs/Hitchin/Prym objects, gerbe splitting, Picτ, equivariant scissor/Bittner and unitary-line constructions. Searches used the roadmap tools as well as the supplied local copies. The ownership distinction is: generic constructions belong to the suppliers below; this package owns the character/stringy adapters, principal gerbe torsors, abstract dual-system comparison and fixed-determinant spectral specialization. R05 is the duplicate construction found. Zero Lean declarations means zero fully-qualified-name collisions.

| Supplier | Resolved section/declaration evidence | Disposition |
|---|---|---|
| HodgeStructures | Completed/HodgeStructures/README.md:104, Core definitions, L2–L3; weight-one discussion :223 | Abstract MHS supplied; geometric and family gaps remain |
| EndoscopicTransferAndUnitaryTraceComparison | §§3.6,3.8,3.10,3.12–3.14,3.16; README:1238,1345,1521 | Finite-field/anisotropic hypotheses retained; relative and orbifold extensions declared |
| LogicAndDefinabilityInNumberTheory | Board head `972ee8e`, §§2.5,2.7–2.9,2.11–2.12; README:450,490,516,530,572,582 | Current local-field scope includes equal characteristic; resolver's missing-name lead rejected |
| CohomologyComparisons | §2.15, README:463 | Proper-smooth Hodge–Tate sign is negative; equivariant/fractional gap distinct |
| ArithmeticGaloisDuality | D7.6, README:6070–6178 | Characteristic-zero local Ext/evaluation/index supplied; R06 adapter missing; equal-characteristic gap declared |
| AbelianSchemesAndArithmeticModuli | A1.3,A1.5,A2.2–A2.3,A3.2–A3.5,A3.7; README:767,879,1029,1072,1385,1413,1452,1570 | Invariant forms, cube, duality, quotients and pairing resolve; A¹ typography denotes A1 |
| AlgebraicModuliForArithmeticGeometry | §§1.3,2.1–2.2,4.1–4.3,4.5,4.9,4.20,5.1,7.3,7.6.1,8.2,9.4–9.5,9.7; `quotientGerbeTransgression`, `quotientInertiaComponents` | Generic gerbes/inertia owned there; splitting-stack and Hartogs extensions declared |
| CountingBundlesAndHallAlgebrasOfCurves | Current supplied head, README:1102 (§7.1),1141 (§7.3),1260 (§9.1) | Canonical GL stability, coarse geometry, properness and purity resolve; extensions declared |
| EtaleDualityAndPerverseSheaves | §§3.7,6.3–6.4, README:3542,6563,6759 | Scheme trace inputs resolve; quotient-stack trace is the gap, with R02 domain correction |
| EtaleCohomologyFoundations | F.2.1,F.2.4–F.2.7,F.4.2–F.4.6,F.5–F.7; README:504,592,613,645,759,979,999,1021,1041,1089,1179,1200,1239 | Construction, finiteness and Galois realization kept separate |
| ArithmeticGaloisRepresentations | §§1.7–1.8,5.1–5.3; README:1054,1101,3132,3178 | Character recognition is semisimple/virtual, not an actual ungraded comparison |
| DeligneWeightsAndPurity | §§7.8,7.12,7.15; README:2553,2619,2679 | Proper-smooth purity and bounds do not prove singular-stalk purity or Frobenius semisimplicity |
| SchemeAndStackFoundations | §§0.6,1.15–1.16,1.20–1.23,2.11,2.15,2.22,3.4–3.7,4.6; README:678,2502,2589,2843,2951,3656,3867,4491,4789,4876,4905,4937,5291 | Generic torsors, norms, Brauer and deformation inputs resolve; R04 correct owner |
| JacobianChallenge | Layers A–E; normalized duality README:407–430 | Curve RR, relative Picard, line obstruction and polarization supplied |
| AlgebraicVectorBundles | L0B–L0C, README:228,254 | Bundles/determinants are on the curve |
| ClassFieldTheory | Layers5–7, README:920,1220,1312 | Field invariant and reciprocity resolve; integral vanishing needs R04 |
| ReductiveGroupsPartII | RG2.3.7, README:5202 | Lang for smooth connected finite-field groups applies to the Jacobian |
| ComplexComparisonPartII | C3.2e/C3.2f.1, README:2046 onward | Earlier Picτ/identity-component owner; R05 |

Repeated occurrences of a supplier are not counted separately.

All **13 gap slugs** agree between design/plan.json and the README, including their `needs` sentences; none has supplier `none`. The generic Picτ overlap is R05; the wild finite-quotient trace input is R02. The other declared geometric-MHS, unitary-family, orbifold, equivariant-scissor, fractional-comparison, equal-characteristic-duality, relative-Higgs, stack-Hartogs, relative-Hitchin, purity and splitting-stack contracts are treated as contracts, not as missing implementations. The plan's only changed top-level field relative to the base is `gaps`.

Mechanical dependency check on the unchanged package:

```text
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. ComplexComparisonPartII is earlier than this package, so the ownership repair does not require an upward edge. The scope diff is eight files, all inside packages/TopologicalMirrorSymmetryForHitchinSystems, with 1,976 insertions and 165 deletions. Only the requested report and scratch notes were written during this pass. No package source, plan, manifest, merge order or library file was changed; no Lean build, git write or external post was made.

### Source locators

Verified **12 distinct requested source locators** against the supplied legal preprint extractions: four HT03 locators (§3, Propositions3.2,3.6,§6), six Ito locators (Lemma4.3, Proposition5.1, Definitions5.2–5.3, §5.3, Example5.5), and two Bittner locators (§7, Lemma7.1). Their associated proof passages and version/page labels were read. HT03 §6 is located but does not support the two claims attached to it (R01). GWZ20 is separately uncertified, not part of these 12.

| Source locator | Extraction evidence | Result |
|---|---|---|
| HT03 §3, pp.9–13 | HT03 line338–525 | Regular complex fibres and unitary gerbes; Lemma3.1 pushforward slip below |
| HT03 Proposition3.2, pp.10–11 | HT03 line385; proof line390–426 | Smooth unitary splitting torsor comparison; Poincaré sign issue below |
| HT03 Proposition3.6, p.13 | HT03 line498; proof line500–525 | Smooth torsor isomorphism; index slip below; does not itself establish arithmetic canonicity |
| HT03 §6, pp.17–18 | HT03 line647; Theorems6.2/6.4 lines680/709 | Dolbeault/de Rham comparison at fixed degree; R01 |
| ITO04 Lemma4.3, p.12 | ITO04 line524 | Additive Hodge–Tate multiplicities in its exact-sequence setting |
| ITO04 Proposition5.1, p.13 | ITO04 line555 | Frobenius character equality determines semisimplification |
| ITO04 Definition5.2, pp.13–14 | ITO04 line573 | Weight/Hodge–Tate representation domain retained |
| ITO04 Definition5.3, p.14 | ITO04 line611 | E-function from the two indices |
| ITO04 §5.3, pp.14–15 | ITO04 line624,634–645 | Finite-denominator roots after finite extension; no simultaneous all-denominator claim |
| ITO04 Example5.5, p.15 | ITO04 line666–668 | Qp(n/d) has exponents(−n/d,−n/d); Laurent codomain issue below |
| BITTNER04 §7, p.18 | BITTNER04 line796–811 | Raw equivariant scissor group distinguished from representation quotient |
| BITTNER04 Lemma7.1, p.18 | BITTNER04 line812–844 | Equivariant smooth-complete blowup presentation and its proof inputs |

### Sampled adversarial computations

The audit covered all 44 numbered README targets and all 163 Check bullets. The following 20 rows retain representative computations, including witnesses relevant to the findings. A successful instance is not a proof of the general theorem; “Retain” means only that the displayed computation found no defect. Exhaustive per-target, API and Check ledgers are omitted to fit the comment limit.

| Target and context | Instances and computed values | Result / change |
|---|---|---|
| 0.1 Character E/count; separated finite type, good finite action, characteristic-zero character coefficients | C₂ on pt/F₃: trivial mass 1/2+1/2=1=dim H⁰; sign mass 1/2−1/2=0. Sign action on A¹/F₃: 1/2+1+1/2+1=3=Tr H_c². Sign representation multiplicity 1, tensor-square sign multiplicity 0. G=1: E(A¹)=xy and trace q. Empty X: 0 on both sides. C₂/𝔽₂: mass 1 but tameness false. | Values agree; R02 for missing domain of trace input; duplicate Checks R07. |
| 0.6 Stringy invariants; smooth tame finite quotient, centralizers and component orbits | pt: 1. BC₂: 2 sectors of mass 1, total 2 versus ordinary mass 1. Sign A¹/C₂: xy+(xy)^(1/2), count q+√q. Free C₂ on two points: quotient pt, invariant H⁰ dimension 1, other sectors empty. BS₃: centralizer orders 6,2,3; each B-centralizer mass 1, total 3 rather than 6. | Retain nonabelian and exchanged-component normalization; R07 duplicate. |
| 0.7 Gerbe-twisted invariants; r invertible, admissible band-change roots | Neutral sign quotient gives xy+(xy)^(1/2). Root gerbe O(1) on P¹: Kummer class 1 mod2 but identity-sector monodromy 1; E=1+xy. μ₃-torsor with Frobenius ζ has faithful trace ζ and rational point count 0. Inverse sector has ζ⁻¹≠ζ. Neutral band μ₁ gives ordinary sector coefficients. | Retain; μr-neutrality is not Brauer neutrality. R07 duplicate. |
| 1.3 Principal splitting torsor; extension Pic[r]→Picτ | Neutral elliptic example: finite splitter has 4 points for r=2, principal splitter has dimension 1 and acts under E∨. Constant real gerbe: principal torsor class 0, μ₂ class 1/2. U=V: Picτ=0, Split′ has 1 point. Enriques over C: Pic⁰=0, Picτ has 2 components. | Construction separates finite and principal splitters; R05 existing owner of Picτ. |
| 1.4 Constant Brauer consequence; smooth proper geometrically connected X/K | Real nonsplit conic: Br(R) class 1/2 restricts to 0, so injectivity fails without a point. X=Spec K: Split′ is pt and every β is constant. O_F=Z₅ or F₅[[t]]: integral evaluation 0; β(0)=1/2 would contradict integral extension. | Middle exactness is sufficient; R04 correct owner of integral vanishing. |
| 1.5 Unitary comparison; smooth projective morphism, Picτ=Pic0 | Neutral E/C: both fibres are the real torus R²/Z², real dimension 2, complex dimension 1. Neutral E×V with nodal V: both relative spaces E∨×V have a nodal base factor, so neither total space is a manifold. | R03 replaces false manifold assertion for singular V. |
| 2.3 Gauge forms; integral generators, φ étale, codimension ≥2 | Product form dt∧θ. Unit u scales volume by 1; uniformizer at q=3 scales by 1/3 in Q₃ and F₃((t)). π²(dx)² has density (1/9)^(1/2)=1/3. For a=xy, da∧(−dx/x)=dx∧dy while the opposite sign gives −dx∧dy. On A²\{0}, generators ±1 extend to ±1; on G_m⊂A¹, t vanishes at 0 and is not an extended generator. | Retain density, wedge ordering and Hartogs distinction. |
| 2.6 Gerbe integrals; both/one/no rational torsors | Both nonempty, neutral Brauer: V=V. Both empty: 0=0. Exactly one nonempty, nontrivial order-two character: equal-volume cosets give V/2−V/2=0, even multiplied by constant −1. If both phases were unknown constants 1 and −1, values would be V and −V. | R06 missing evaluation bridge; local Brauer hypothesis correctly eliminates the last case. |
| 3.3 PGL quotient; Γ=J[n], sheaf action | n=1: Γ order1, quotient pt. g=1,n=2, stable point: quotient BΓ has geometric stabilizer order4, coarse pt has order1. g=2,n=2: order16. E:y²=x³+x+3/F₁₇: no cubic roots, rational E[2] order1, geometric order4, while 8 divides16. Matrices diag(1,1),diag(1,−1): traces2,0; squared traces2,2. | Retain nonsplit descent and stack/coarse distinction. |
| 3.6 Spectral norm fibre; smooth connected cover and connected norm kernel | n=1: M=O, norm=id, fibre{L}. n=2: M=D⁻¹, target LD. n=3: M=D⁻³, target LD³; degree shift matches sum 0+1+2=3. | Retain determinant sign and explicit connectedness restriction. |
| 3.9 Regular certificate and low genus | P¹,D=O,n=2,d=1: a≥1, lower map space H⁰(O(1−2a))=0, slope a>1/2, stable locus empty. O(1)²⊕O at n=3,d=2: full block rank2, slope1>2/3; a single maximal line may move. Excluded O² degree0: full block rank2, slope0=0. n=1,D=O/P¹: GL=A¹, count3/E=xy; SL/PGL pt, count1. Elliptic canonical generic distinct roots: eigenprojectors force a slope≥d/n, so stable generic fibre empty. | Retain explicit low-genus separation; generic-torsor argument is not valid there. R07 administrative Checks. |
| 3.10 Torsor products/powers; integer powers and actual degree-one GL line | n=2,M=D⁻¹: product label LL′D; e=0 labelD⁻¹ gives norm O; e=1 labelL; e=2 labelL²D; e=−1 labelL⁻¹D⁻². nth target (LM⁻¹)^n is norm of π*(LM⁻¹). t∈Z/3: 2t≠0 for t≠0, but 3t=0. | Retain inverse-M normalization and coprimality with n. |
| 4.2 SL degree comparison; p>n, even degD | n=2,g=2,D=ω: degM=−2, degQ=−1, degN=−degM+2degQ=0. e=3 labelL³N² has degree3d; e=1 labelL. Odd degD=1 gives degQ=−1/2, impossible. Rank1 gives1=1; empty genus-zero gives0=0. | Retain corrected N=M⁻¹Q^n and even degree. |
| 4.3 Betti/Hodge independence; purity plus count equality | Rank1 elliptic canonical: H=E×A¹, compact degrees2,3,4 have dimensions1,2,1 and E=xy(1−x−y+xy), independent of d. SL rank1 has h⁰=1. Opposite even/odd weight-zero lines have E=0 with total dimension2, versus dimension0 for zero. | Purity is necessary; R01 attached HT03 locator does not prove degree independence. |
| 4.6 Local Brauer splitting; both F-points, proper integral extension | Constant invariant1/2 yields phase−1; evaluation of integral class in Br(O_F)=0 yields phase1. Root gerbe of a non-r-divisible degree-zero line has β=0 but nonzero Pic/r residue, so this proof only kills β. | Retain weaker conclusion; R04 supplier correction. |
| 5.1 Main mirror; full genus, p>n, roots | n=1 over F₂,F₃:1=1. P¹,n=2,d=e=1,D=O:0=0. n=2,g=2:3⁸−1=6560=32·205; p3>2 and root bound holds. n=2,char2 fails n unit. | Retain tested endpoints and admissibility. |
| 5.2 Canonical Hodge comparison; pure sectors, symplectic action | n=1: one h_c^(0,0)=1. Age1 on a class k=2,(p,q)=(1,1): shifted degree4, bidegree(2,2), sign +1 both before/after. A single −1 tangent eigenvalue gives age1/2 and is not the symplectic parity case. | Retain shifted grading; R01 inappropriate HT03 §6 attribution. |
| 5.4 Actual ungraded Galois comparison; actual sectors and descent | Qℓ[0],Qℓ[−2]: alternating traces1,1; ungraded dimensions1,1; H⁰ dimensions1,0. Qℓ[0]⊕Qℓ[−1] versus0: alternating0,0; dimensions2,0. I₂ and a nontrivial unipotent J₂ have power traces 2=2 but fixed dimensions 2≠1. Two exchanged lines: trace0 for odd powers,2 for even. Rank1 gives Qℓ≅Qℓ; empty genus-zero gives0≅0. | Boundary instances agree; general geometric comparison is not verified by these controls or by traces. See Not verifiable. |
| 5.5 Sector variation; Γ constant, fixed ν⁻¹Fr convention | Order3 with pairingζ: Tγ(1)=ζ⁻¹Tγ(0); choose Tγ(0)=1 to distinguish ζ⁻¹ from ζ. Hilbert symbol (−3,−3) over Q₃ is −1, invariant1/2, so complementary diagonal need not vanish. | Retain ordered mixed-block convention. |
| 5.6 Isotypic mirror; splitting coefficients and Γ constant | C₃ Fourier: selected sum(1+1+1)/3=1, other sum(1+ζ+ζ²)/3=0. For Γ=J[2],g=2, divide by16. Γ=1 gives unprojected total trace. Empty genus-zero cohomology:0=0. | Retain signs and use pinned orthogonality rather than a new Lean lemma. |

### Domain and convention controls

| Input class | Computed control | Disposition |
|---|---|---|
| Zero ring / empty scheme | Spec(0)=empty, point count 0, compact cohomology 0; it is not a field or a geometrically connected curve | No illicit use as a residue field |
| Rank 0 and zero denominator | n=0 and N=0 fail the explicit positive-integer conditions; no s₀, 0/0 or negative natural subtraction is used | Excluded by stated domain |
| Ranks 1,2 and small primes | n=1 gives moduli point and 1; n=2 in characteristic 2 has tr(id)=0 and is excluded; n=2 over F_(3^8) satisfies p>n and 32 dividesq−1 | Hypotheses distinguish the boundary |
| Nonabelian groups | BS₃ has 3 sectors; BQ₈ has 5 conjugacy classes, hence 5 age-zero sectors rather than 8; each ordinary classifying-stack mass 1 | Layer 0 permits nonabelian groups; later Fourier/Prym layers require commutativity |
| Nonsplit descent | E[2]/F₁₇ has 1 rational point and 4 geometric points; diagonal(1,−1) has traces 0,2 on first two powers | Roots alone do not split torsion; descent retained |
| Nonreduced bases | Pullback of a neutral gerbe to k[ε]/ε² has class 0, ε remainsnonzero; nonflat pullback of A¹\{0} to 0 isempty | No reduction or arbitrary-density inference |
| Inseparability | [p] on E/characteristicp has degreep² and differential 0; on geometric points its kernel can have p or 1 points | Étale isogeny hypothesis excludes this use |
| Local fields | Q₃ and F₃((t)): vol(O)=1, vol(πO)=1/3; self-dual prime-to-p [2] kernel/cokernel ratio 1 | Equal-characteristic inputs are declared, not silently inferred from Qp |
| Empty/noncompact integral | Empty domain integral 0; compact A(F) constant 1 integralV; additive F itself has infinite Haar measure | Compact abelian fibres, not arbitrary groups, enter character integration |
| Hodge/Tate sign | ℒ gives(1,1), eigenvalueq; Qℓ(1) gives(−1,−1), eigenvalueq⁻¹ | Inverses retained |
| Wedge sign | da∧(−dx/x)=dx∧dy for a=xy; reversing the fibre sign gives−dx∧dy | Base-first convention fixed |
| Deformation sign | θ=diag(2,1), u=E₁₂: θu−uθ=E₁₂; reversed differential gives−E₁₂ | Stated order retained |
| Weil-pairing control | On Γ=(Z/3)² use e((a,b),(c,d))=ζ^(ad−bc): e(v,v)=1, e((1,0),(0,1))=ζ and the reverse is ζ⁻¹. The cyclic Fourier tests are evaluation against the dual cyclic group. | Alternating pairing and Fourier orientation agree |
| Polarization sign | An order 3 elliptic point P yields O([−P]−[0]) versus O([P]−[0]), distinct; inversion of both factors cancels | Supplier conventions differ from the HT03 source slip, not from each other |
| Hilbert pairing / roots | (−3,−3)_Q₃=−1, invariant 1/2; e=4,r=2,q=9 gives re=8 dividing 8, e²=16 not dividing 8 | No even-torsion isotropy or oversized root requirement inferred |
| Point vs torsor vs coarse | Rank 1 Hitchin fibre point has 1; empty rank 2 P¹ fibre 0; BΓ for Γorder 4 has ordinary mass 1, untwisted stringy mass 4, inertia order 4 | These carriers were not identified |

## Not verifiable

- **GWZ20:** its published text remains settled as `uncertified`. Its definitions, theorem numbers, page locators and proof generalities could not be checked against the text. No replacement key, fetch request or needs-references entry was created. The source-dependent full finite-field/complex mirror theorem, arithmetic canonicity in §4.5, complete elliptic-boundary gerbe calculation in §3.9, and actual fibrewise theorem §5.4 are therefore not source-certified here. Numerical controls do not prove those results.
- **Actual Galois comparison (§5.4):** I₂/J₂ and the even/odd controls refute inference from traces, not the proposed geometric theorem. Its explicitly owned geometric or multiplicity/semisimplicity proof remains an unverified proof obligation. This report does not assert a counterexample on an actual Hitchin fibre.
- **Stronger μn-neutrality:** the advertised result lacks its own theorem statement and proof target (R08). Killing Brauer evaluation does not verify its Kummer residue. The proposed repair exposes that obligation; it does not certify it.
- **Conditional supplier contracts:** the 13 registered contracts are accepted as declarations, subject to R02/R05. Their future implementations, especially arbitrary relative models and nonsplit arithmetic sector descent, were not proved in this pass. Their current absence is not separately reported as a defect.
- **Lean elaboration:** no Lean command was run, as instructed. There are zero roadmap declarations and therefore zero elaborated signatures to compare. Native definitions were checked by reading the pins. A package build or an older worker's build was not treated as proof of mathematical truth.
- **Open work:** the 55 supplied sibling folders and the available main/open-head/board indexes were checked. This does not certify unpublished work or an unprovided revision outside those readable copies. No unseen pull request is used as ownership evidence.

## Source issues

- **Error** in HT03 at Proposition 3.2 proof, printed preprint p.11 (HT03 line 426): the source says exchanging factors dualizes the polarized Poincaré bundle; it should be factor exchange preserves it, while inversion in one factor dualizes it; affects the proof.
- **Misprint** in HT03 at Lemma 3.1 proof, printed preprint p.10 (HT03 line 372): the source says the pushed-forward universal bundle remains on the spectral-curve product; it should be the pushforward lives on the product with the base curve C; affects the proof.
- **Misprint** in HT03 at Proposition 3.6 proof, printed preprint p.13 (HT03 lines 502–511): the source says several splitting torsors are taken on degree-e fibres after reducing e to1; it should be these are degree-d fibres, whose gerbe is being trivialized; affects the proof.
- **Misprint** in ITO04 at Remark 5.4 and §5.3, printed preprint pp.14–15 (ITO04 lines 623,663–668): the source says the E-function lands in ordinary polynomial rings; it should be Laurent polynomial rings, with fractional exponents in the fractional variant, since Qp(1) contributes u⁻¹v⁻¹; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0a0dea353ac816fd4183354f31f7a9e6cc9c7e55", "job": "RT-TopologicalMirrorSymmetryForHitchinSystems~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
