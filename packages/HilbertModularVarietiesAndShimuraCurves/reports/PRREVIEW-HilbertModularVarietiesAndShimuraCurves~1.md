# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 893083d)

**Verdict:** needs changes

## R01 (P1) — Construct basic PEL uniformisation before importing it

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2030`: “The basic PEL uniformisation of BZ Proposition 6.2 ... is a supplier contract”.

**Claim:** R18.5.13 uses basic PEL uniformisation, including surjectivity and Weil equivariance, to prove the quaternionic transfer. The supplier contract at line 157 and the headline at line 2244 instead say R18.5.13 constructs it. That subsection constructs the transfer *from* Proposition 6.2; its proof does not construct Proposition 6.2. There is no declared supplier gap.

**Witness:** `TauCetiRoadmap/PELModuli/README.md:2381` supplies good-prime representability; M4 supplies canonical models and normalization. Neither supplies basic Rapoport–Zink uniformisation. BZ22 line 2252 uses deformation theory; line 2258 additionally requires Hasse-principle surjectivity.

**Repair:** Add a separate target before the transfer for the auxiliary datum's actual morphism `I(ℚ)\(RZ×G(A_f^p)/K^p) → completed PEL model`. State the local levels, framed polarized objects, surjectivity, and Weil datum. Give its deformation-theoretic étaleness, polarized Hasse-principle and descent arguments owned prerequisites, using BZ Proposition 6.2 and the cited KRZ arguments at their actual generality. Then R18.5.13 consumes this target and transfers to the selected quaternionic components. For the discriminant-6 curve at 2, the repaired chain must construct the auxiliary formal isomorphism before identifying the quaternionic component; good-prime representability alone still supplies zero such isomorphisms.

## R02 (P1) — Replace the obsolete topological coefficient supplier

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3422`: “Assume `TopologicalCoefficientInput(R)` of ALS.F.3”. The same dependency occurs in Conventions, supplier contracts and downstream exports.

**Claim:** A named condition and comparison are attributed to a supplier that no longer has that condition. This leaves the non-finite coefficient interface referring to an undefined supplier object.

**Witness:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:824` instead states `LocallySymmetric.SheafDerived.isoSingular` for arbitrary stalks on semi-locally contractible spaces. `TopologicalCoefficientInput` has zero occurrences in that supplier's current text.

**Repair:** Consume ALS.F.3's actual absolute and relative comparison, retaining semi-local contractibility and, for the relative form, closedness and semi-local contractibility of the boundary. Resolve trace compatibility through its finite-fibre pushforward/trace interface. Remove the obsolete predicate throughout this roadmap. On the circle with the ℤ₂-line of monodromy −1, both realizations give `[ℤ₂ --−2→ ℤ₂]`, hence H⁰=0 and H¹=𝔽₂; the supplied arbitrary-stalk comparison covers this example. Finite-coefficient comparison alone does not.

## R03 (P1) — Remove the contradictory local splitting hypothesis

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2244`: “B division split only at `τ, v` with `B_v` division”.

**Claim:** The uniformisation headline simultaneously requires B to split at v and B_v to be division. Its literal hypothesis has no instance.

**Witness:** For B/ℚ of discriminant 6 and v=2, `inv_v(B)=1/2`; splitting would require `inv_v(B)=0`. The very next rational specialization uses this division-prime situation.

**Repair:** Say that B is split at exactly τ **among real places**, and is division at the finite place v. Preserve the stated BZ local levels and all descent conventions. The discriminant-6 example then satisfies the hypotheses; `M₂(ℚ)` still fails the division-prime hypothesis. This also agrees with the global conventions at line 68 and BZ22 Theorem 6.7, line 2559.

## R04 (P1) — Break the definite Ihara/central-extraction dependency loop

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2767` invokes R18.4.21 for central-character parts; line 3684 makes R18.4.21 depend on R18.3.8.

**Claim:** The declared target graph contains `R18.3.8 → R18.4.21 → R18.3.8`. The roadmap-level dependency checker cannot see this internal loop.

**Witness:** Line 3672 says the definite clause uses R18.3.8, but line 3674 proves that clause from free finite orbits and the injective coefficient cogenerator. That argument needs no Ihara theorem.

**Repair:** Separate the constant-coefficient definite Ihara theorem from its character-part corollary. Prove definite central extraction directly from free finite orbits and coinduction, and remove its dependency on Ihara; then take character parts of Ihara. On one free C₂-orbit in characteristic 2 the function module is the coinduced injective module of dimension 2, independently of any degeneracy map. This gives an acyclic order even when the group order is not invertible. Similarly distinguish H1.0's supplied tensor from its later H1.3/H2.5 polarization-transport consequences, rather than treating its whole subsection as a prerequisite of H1.3.

## R05 (P2) — Import the already-owned derived-group comparison

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:217`: “both derived groups are `Res_{F/ℚ}SL₂` and their inclusion is the identity there”.

**Claim:** H0.1 plans to prove the derived-group comparison again, although its existing supplier already owns it. The centre calculation and centre-component bookkeeping are distinct retained work.

**Witness:** `TauCetiRoadmap/ShimuraData/README.md:1220`, §5.4, supplies the star inclusion and its isomorphism on derived groups `Res_{F/ℚ}SL₂` and adjoint data.

**Repair:** Import that comparison by section in Scope and the exact supplier contract. Make H0.1 own only the remaining centre/dimension calculation and any explicitly described convention transport. For a real quadratic field the imported derived groups both have dimension 6; the new centre computation still retains the two components `t₂=±t₁`. Deleting the duplicate target therefore loses neither of these outputs.

## R06 (P3) — Remove undeclared API and Check names

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:78`: “They do not assert the existence of declarations in Suggested.lean.” Examples occur at lines 243–260 and 987–989.

**Claim:** This local naming rule contradicts the acceptance-test contract. The README labels its own definitions, API facts and Checks with Lean names, while `Suggested.lean` has zero declarations. In particular it even names nonexistent `adjugateFrameAction_one` and `adjugateFrameAction_scalar` in Checks.

**Witness:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/Suggested.lean:49` opens the namespace and line 51 immediately closes it; `polarizationLattice`, `mem_polarizationLattice` and the named Check counterparts are absent.

**Repair:** Delete the contrary naming convention. Write owned definitions, API bullets and Checks as mathematical prose; keep backticked own declaration names only if actually declared in the acceptance test. Do not add API padding to the Lean file. For H0.3 retain the computed lattice `ℤ⊕(1/2)ℤ` and the inverse-different check while deleting their purported Lean counterpart names. The passing scanner does not waive this explicit rule.

## R07 (P3) — Record the cited works in the source manifest

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:4265`, References, and the inline Stacks citations in H2.2a.

**Claim:** The folder has no `sources.toml`, so none of its bibliography has a recorded source identity, version, locator scheme or retrieval status. The review fetched texts without modifying the roadmap.

**Witness:** There are 33 bibliography works plus two inline Stacks tags, but zero manifest entries. For example BHW23 is cited as a published PDF and MS19 as arXiv v2, with different pagination conventions.

**Repair:** Add the required manifest, one persistent key per work, with versions and locator schemes matching the versions actually cited; record legal retrieval metadata and the status of inaccessible texts. Do not copy source material into the folder. Verification example: the BHW23 entry must resolve H4.18 to Lemma 8.20, printed p.1775, while the MS19 entry resolves R18.4.32 to Theorem 6.5, internal p.34.

## R08 (P3) — Correct the page of the patching-functor theorem

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3984` cites “Theorems 4.17 and 4.19, pp.28–29”.

**Claim:** Theorem 4.19 is not on those pages in the specified arXiv v2.

**Witness:** MS19 line 1454 starts internal page 30; line 1456 starts Theorem 4.19.

**Repair:** Cite Theorem 4.19, p.30, separately from Theorem 4.17. That page contains the exactness, augmentation and MCM conclusions used for the finite-type functor. The rank-one constant-system test still gives patched rank 1; this is a locator correction, not a change to the theorem.

## Verified sound

The review read the 4,299-line README, 51-line Lean file, normative README/CONTRIBUTING and main-branch roadmap examples. The PR's outside-folder diff is empty and the worktree remained unchanged. No computational algorithm, sorry'd data, `set_option`, copied source passage in the checked passages, or substitute Lean headline was found.

The worker's gate passes every reported scanner and the targeted build (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, overall `OK`). Independent elaboration with the requested `lake env lean` command exited 0 with no warnings. There are **0 declarations**, hence **0 elaborated declaration signatures to compare**, **0 sorried theorems to one-tactic probe**, and **0 padding findings**. The independent dependency command returned:

```text
depcheck: 209 roadmaps, 1495 edges, 0 problem(s)
```

No mechanical UPWARD or CYCLE result; R04 concerns internal edges outside this check.

The headline inventory is: Hilbert moduli/DP representability and determinant identities; polarization quotients and full-level torsors; H6 paired torsion twists, component descent and local points; canonical quaternionic curves and the PEL bridge; Drinfeld representability, quotients, Čerednik–Drinfeld and all-level uniformisation; integral model/Hodge/p-divisible comparisons; definite Ihara; coefficient cohomology, automorphic and Galois comparisons; Ihara patching and flatness; residual Ihara, integral saturation and coefficient purity. The module docstring names all these groups and their missing carriers. Searches at the pins found supporting algebra but no relative HBAV/DP moduli, canonical Shimura-curve, special-formal-module or arithmetic coefficient-cohomology carriers sufficient for these headlines. No statable omitted headline was established; empty `Suggested.lean` is not itself a defect.

Pinned declarations opened include:

| Pin file and line | Object and actual scope |
| --- | --- |
| `Mathlib/RingTheory/DedekindDomain/Different.lean:229,356,385` | Fractional-ideal trace dual, its inverse-ideal formula and involutivity; finite separable extension/integral-closure hypotheses retained. The totalized zero ideal is not a nonzero polarization lattice. |
| `Mathlib/LinearAlgebra/Matrix/Adjugate.lean:340,454` | Determinant of adjugate and reversed product order; rank-two specialization is valid in characteristic 2. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | Fixed vectors under every group element; this definition does not imply exactness or reduction compatibility. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:134` | Cyclic finite Galois Hilbert 90, with a generator and norm-one element; exchanging the chosen unit with its inverse handles the displayed ratio direction. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` | DVR class requires a domain; a zero ring is not an allowed DVR counterexample. |
| `TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71,168,180` | Strict positivity at every real place, positive units and unit-square containment. Positivity alone is vacuous for totally complex fields, so the totally real convention matters. |
| `TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean:82` and `Units/ElementaryTwoQuotient.lean:62,84` | Torsion/free decomposition and square index `2^(rank+1)`; a totally real field has rank g−1. |
| `TauCeti/RingTheory/DedekindDomain/Different/DualFamily.lean:63,108` | Trace realization and projective dual-family identities; finite separability and integral closure are present. |
| `TauCeti/Algebra/Quaternion/NormForm.lean:120` | A central scalar has norm its square, explaining parity and dyadic central-character tests. |
| `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59` | Symmetric-power representation already exists over a commutative ring, not just a field. |
| `TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean:94,112,354` | Coefficient maps reverse direction; composition reverses; constant coefficient comparison exists. The arithmetic dual adapter is required. |

Pins were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Ownership searches used the roadmap service by object and the supplied main, package and open-work locations. The following concrete supplier interfaces were resolved in the current texts, rather than inferred from their names:

- `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:792,2274`: A1.3a and A4.7a supply projective-module Serre tensor and its Lie/prime-to-characteristic Tate realizations. Ordered polarization transport and arbitrary finite-flat torsion are the stated extra domain here.
- `TauCetiRoadmap/PELModuli/README.md:1168,2379,2429,2923,3055`: M0.18, M2.8–M2.9 and M3.4/M3.6 supply determinant data, good-prime spaces/universal families and complex comparison. They do not discharge R01.
- `TauCetiRoadmap/ShimuraData/README.md:1188,1218`: full and star Hilbert data; the overlap is R05.
- `TauCetiRoadmap/QuaternionicModularForms/README.md:267,440,492,510,792`: class sets, polynomial right coefficients, abstract evaluation and opposite Hecke action. The central-character specialization here preserves those carriers; rebuilding abstract evaluation would be duplication.
- `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:699,824`: sheaf adapters and arbitrary-stalk comparison; R02 records the drift.
- `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2898,2912`: §5.14 explicitly supplies `franke_input`, with the split-centre and balanced-character conventions; compactness is not a licence to omit them.
- `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:351,690`: arithmetic comparison models and the source-qualified eigenform compatibility layer remain the owners. The present roadmap describes its normalization and extra branches as adapters/extensions.
- `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:594,1560`: generic module flatness and finite-coefficient complex patching. The weak module systems in R18.4.29 admit modules beyond a free perfect-complex presentation; their additional MS exactness hypotheses must remain, so no wholesale equivalence was assumed.
- `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7`: the open Part II explicitly distinguishes its p-adic infinite-level coefficient category and patching fibre from the base's auxiliary-prime Ihara functor. It is a consumer, not a supplier here. No fully qualified Lean-name collision is possible with this empty acceptance module.

**Source sample.** The 15 repeated type labels do not uniquely identify the seeded targets. These 15 targets were checked in that type order, without claiming to recover the seed. Locators and hypotheses were compared with the cited versions.

| Sample | Target | Text opened and outcome |
| --- | --- | --- |
| S01 Definition | H0.3 | BHW23 lines 1243–1278, Notation 5.1 and Definition 5.2, pp.1740–1741: trace-dual lattice matches; actual stabilizer formulation avoids the source's missing unit condition. |
| S02 Definition | H1.1 | Tay02 lines 321–334, internal p.10: an orientation at each real embedding is part of the object. |
| S03 Theorem | H1.5 | DP94 lines 256–290, Proposition 2.7/Corollary 2.9, pp.65–66: field-valued class equality and unramified rank-one Lie condition; README separately proves all-base determinant equality from flatness. |
| S04 Theorem | H1.7 | BHW23 lines 1391–1428, pp.1744–1745; PELModuli M2.8–M2.9: moduli comparison supported, good-prime smoothness is specifically the supplier's theorem, not an all-prime claim of this paragraph. |
| S05 Construction | H2.2 | DP94 lines 205–225, §2.1 p.64: full-level algebraic-space construction and proper polarized comparison; the μ_N quotient/descent is additional work explicitly stated here. |
| S06 Theorem | H2.3 | DP94 lines 226–235, Theorem 2.2/Corollary 2.3, pp.64–65: flat relative complete intersection, smooth away from discriminant, codimension-two bad locus and normal fibres. |
| S07 Definition | H3.1 | BHW23 lines 2203–2209, Proposition 8.4 p.1766: congruence units and their square image; kernel definition has the correct congruence direction. |
| S08 Definition | H3.2 | Same locator and the scalar-square formula at BHW23 lines 2518–2527: the square root must satisfy the congruence. |
| S09 Theorem | H4.17 | BHW23 lines 2482–2538, Proposition 8.18/diagram (8.6), pp.1773–1774: frame torsors and group sequences; README restricts coarse torsors and correctly drops blanket nonsplitting. |
| S10 Theorem | H4.18 | BHW23 lines 2559–2564, Lemma 8.20 p.1775: printed stabilization claim is stronger and false; the README's stable-image correction survives the explicit dyadic computation. |
| S11 Comparison | H1.10 | BHW23 lines 1391–1428, §5.1.2 pp.1744–1745: the actual moduli/complex Shimura identification is stated, including added p-levels. |
| S12 Construction | R18.4.29 | MS19 lines 912–964, Definition 4.1/Proposition 4.2 pp.19–20; lines 1456–1463, Theorem 4.19 p.30: bounds, cofinality, augmentation and coefficient-category restrictions are retained; page correction R08. |
| S13 Comparison | R18.5.13 | BZ22 lines 2247–2271, Proposition 6.2 p.43, and lines 2559–2580, Theorem 6.7/Corollary 6.8 pp.49–50: transfer presupposes basic uniformisation; R01 remains. |
| S14 Theorem | R18.5.15 | BZ22 lines 2559–2580: actual division uniformizer, right Π⁻¹ and τ_c conventions retained before the separate central twist; R03 fixes the impossible local hypothesis. |
| S15 Theorem | R18.4.32 | MS19 lines 1700–1707, Theorem 6.5 p.34: large-image and exceptional PGL₂(F₅) conditions match; l>2 and local-system conditions remain in scope. |

Additional headline/proof checks opened MS19 lines 1724–1754 (definite Ihara), 1591–1660 (both nodal transfer lemmas), 1910–1930 (ambient-ring corrections); ConradSerreTensor lines 1535–1544 and 1614–1623 (projective tensor and finite-flat kernels); Stacks0CCJ lines 2542–2560 and Stacks07S7 lines 853–877 (finite free descent/quotients); KW09 lines 2794–2831 (fixed-sign inference); Tay02 lines 335–438 (local construction and pairings); and YZ18 lines 1723–1778 (filtered comparison and τ-quotients). These checks distinguish what a source actually states from the extra arguments the roadmap must supply.

**Adversarial calculations.** There are 194 rows below, covering all 192 numbered target subsections, with three distinct R18.4.30 statements. Each row records the particular instance and values, not a proof of the universal theorem. Structural tests such as component counts and stalk ranks are deliberately distinguished from proving existence of a moduli space. Rows involving missing supplier objects are failures, not soundness certifications. Zero rings and degree-zero “number fields” are excluded by the standing field/domain hypotheses; ramified, dyadic, nonreduced, nonabelian and identity cases are included where their carriers permit them.

| Statement | Instances tried | Computed values on the relevant sides | Result / change |
| --- | --- | --- | --- |
| H0.0 | F=ℚ, g=1; real quadratic g=2 | Dimensions (G,G*)=(4,4),(8,7); trace determinant at (e₁,e₂) is 1 over ℚ. | Consistent; retain the datum adapter. |
| H0.1 | Split degree-two real fibre | Derived dimension 6 on both sides; centre equation t₁²=t₂² gives t₂=±t₁, two components, identity component dimension 1. | Centre calculation consistent; import the derived-group assertion, R05. |
| H0.2 | g=1,2; opposite signs | Full/star component counts 2/2 and 4/2; (+,−) lies in full domain and outside star domain. | Consistent. |
| H0.3 | F=ℚ,c=2ℤ; F=ℚ(√2),c=O | L=ℤ⊕(1/2)ℤ; quadratic second summand (2√2)⁻¹O, not O. | Consistent; S01. |
| H0.4 | Q(√2), basis 1,√2 and inverse different | Tr(1/(2√2))=0; Tr(√2/(2√2))=1; the trace pairing is integral although the second lattice has denominators. | Consistent. |
| H0.5 | F=ℚ,c=2ℤ; diag(2,1) | Trace dual of L is 2ℤ⊕ℤ; row stabilizer has b∈(1/2)ℤ,c∈2ℤ with unit determinant. diag(2,1) has determinant 2, inverse entry 1/2, and is not a 2-adic stabilizer. | Consistent; mere integral entries fail. |
| H0.6 | g=1; g=2 common-sign embedding | G*=GL₂ for g=1; trace representation dimensions 2 and 4; mixed signs in degree 2 are excluded from the star embedding. | Consistent instance, not a proof of the general type assertion. |
| H1.0 | P=0,O,O²; b=O | Dimensions 0,g,2g; c⊗b⁻²=c; (O⊗A)[p]=A[p], including non-étale p-torsion. | Consistent; separate the later polarization-transport dependency from the supplied tensor. |
| H1.1 | O=ℤ; sections 1,−1,0 | Membership in standard positive cone: true,false,false; −1 reverses the selected ray. | Consistent; S02. |
| H1.2 | Principally polarized elliptic curve | λ and −λ are symmetric; degrees both 1; positivity true and false respectively. | Consistent. |
| H1.3 | F=ℚ,c=ℤ; λ and 2λ | Evaluation degrees 1 and 4; only λ gives the displayed principal evaluation isomorphism. | Consistent; the evaluation requirement excludes 2λ. |
| H1.4 | F=ℚ; quadratic F | Relative dimensions 1 and 2; Lie multiplicities 1 at each real label in characteristic zero. | Consistent specialization. |
| H1.5 | Rank-two matrices 0 and I in characteristic 2 | Tr=0 for both, but characteristic polynomials T² and T²+1 differ; regular rank-one O-action has norm polynomial. | Consistent; S03. |
| H1.6 | F=ℚ,N=5; zero marking | A[5] has geometric rank 25; μ₅ has rank 5; zero map has kernel rank 5 and is not a marking. | Consistent. |
| H1.7 | Q(√2),N=5, p=3 versus p=2 | Discriminant 8 is a unit at 3 and not at 2; good-prime smooth relative dimension 2 applies only at 3. | Consistent; S04, with bad prime handled by H2. |
| H1.8 | Q(√2), inverse-different trace | Tr((2√2)⁻¹)=0, Tr(√2(2√2)⁻¹)=1; neither coordinate may be discarded before taking trace. | Consistent normalization. |
| H1.9 | β'=2β over ℚ₅, initial b=1 | b'=1/2; b'β'=β. Multiplying b by 2 would give 4β. | Consistent. |
| H1.10 | F=ℚ,c=ℤ,N=5 | Dimension 1 on both moduli and GL₂ sides; matching μ₅ marking has rank 5. | Source identification confirmed; S11. |
| H2.1 | R=k[t]/t², W=tR² | W has k-dimension 2, W⊥=W, tW=0; free rank-one R has t-image dimension 1. | Consistent negative control for freeness. |
| H2.2 | Q(√2),p=2,N=5; N=2 | 2 does not divide 5, so the dyadic DP construction applies; 2 divides 2, so its tame-level hypothesis fails. | Consistent; S05. |
| H2.2a | C₃ translates A¹ over F₃; S₃ acts on itself | Invariant coordinate x³−x has derivative −1; orbit sizes 3 and 6; quotient of S₃ by left translation has one point. | Free quotients work without averaging or commutativity. |
| H2.2b | Same free C₃ quotient | Quotient is Spec F₃[x³−x], a scheme of dimension 1; group order 3 is zero in the base field. | Consistent descent instance; scheme status does not follow merely from trivial inertia. |
| H2.3 | Unramified g=1; ramified g=2 | Smooth g=1 fibre dimension 1, empty singular locus; ramified g=2 codimension bound ≥2 allows isolated singularities (dimension 0). | Source 2.2–2.3 matches; S06. |
| H2.4 | Endomorphisms 0 and ε of k[ε]/ε² | Reduced characteristic polynomials both T; actual polynomials T and T−ε differ. | Confirms why geometric points alone do not prove the all-base polynomial identity. |
| H2.5 | R=k[t]/t²; Lie models R and k² | Both k-dimensions 2; t-image dimensions 1 and 0; only R is rank-one free over R. | Consistent distinction. |
| H2.6 | Ordinary and supersingular elliptic curves in characteristic p | p-ranks 1 and 0; ordinary Hasse determinant nonzero, supersingular zero; both have rank-one Lie over the base field. | Ordinary implies Rapoport here; converse fails, as allowed. |
| H2.7 | p=2, ordinary/supersingular elliptic fibres | Exponent p−1=1; Hasse ideals (1) and (0); the zero ideal is not a unit ideal. | Consistent, including p=2. |
| H2.8 | Two lifts 0,p of a zero mod-p Hasse section | Valuations ∞ and 1; for ε<1 neither qualifies, whereas at ε=1 only the p-lift qualifies. | Confirms strict radius boundary in the lift-independent statement. |
| H2.9 | F=ℚ,c=2ℤ; rescale to ℤ | Ideal scaling by 1/2 gives ℤ; multiplication by 2 is not an integral unit at p=2. | Consistent need for explicit transport rather than silently identifying lattices. |
| H3.1 | F=ℚ,M=1,2,3 | U_M has orders 2,2,1 respectively; −1≡1 mod 2 but not mod 3. | Consistent; S07. |
| H3.2 | Q(√2), ε=1+√2,M=12 | ε⁸=(577,408)≡(1,0); its roots ±ε⁴ reduce to (5,0),(7,0), neither (1,0). | Consistent; S08; square congruence alone is too weak. |
| H3.3 | Q(√3), S²=3I; f=i(7I+4S) | f†f=97I+56S; mod 7 this is −I and f²=I. Eigenvalues ±1 admit a fixed level line while the polarization multiplier is nontrivial. | Supports the stated CM-stabilizer warning. |
| H3.4 | F=ℚ,M≥3; Q(√3),M=1 | Δ(M)=1 in the rational case; Q(√3) positive units modulo squares have order 2. | Consistent; not uniformly trivial. |
| H3.5 | Real quadratic unit rank 1 | U/U² has order 4=2²; for ℚ its order is 2=2¹. | Matches pinned rank-plus-one exponent. |
| H3.6 | H3.3 CM point; free orbit | Stabilizer order at least 2 at the CM point, versus 1 on a free orbit; orbit sizes differ by that factor. | Coarse torsor claim correctly restricted to free locus. |
| H3.7 | c=2ℤ, a=3 | L_c=ℤ⊕(1/2)ℤ; diag(1,1/3)L_c=ℤ⊕(1/6)ℤ=L_{ac}. | Consistent. |
| H3.8 | Elliptic q=3 cyclic quotient | Kernel order 3, isogeny degree 3, dual composite [3] of degree 9. | Consistent; quotient map is not an isomorphism of polarized objects. |
| H4.1 | F=ℚ,p=3,n=1 | Frame set size GL₂(F₃)=48; a zero two-column map has rank 0 instead of 2. | Consistent. |
| H4.2 | Rank-two alternating matrix J; β'=2β over F₅ | b=1 becomes b'=3; 3·2=1 mod 5. Multiplier 0 makes determinant 0 and is excluded. | Consistent. |
| H4.3 | Residue algebra F₃×F₃ | Unit (1,2) is not diagonal; (2,2) is diagonal. Corresponding determinants distinguish hybrid from star level. | Consistent. |
| H4.4 | u=[[1,1],[0,1]],v=[[1,0],[1,1]] mod 2 | uv=[[0,1],[1,1]],vu=[[1,1],[1,0]], unequal; adj(uv)=adj(v)adj(u). For 2I over F₅, adj=2I, inverse=3I. | Left-action and scalar conventions discriminate the wrong action. |
| H4.5 | Scalar u=2 over F₇ | Polarization multiplier u²=4 acts on pairing by 2; scalar frame u acts by determinant 4; combined multiplier 2·4=1 mod 7. | Consistent diagonal cancellation. |
| H4.6 | Free point and H3.3 CM point | Isotropy orders 1 and ≥2 before quotient; a scheme torsor requires the former, stack quotient retains the latter. | Consistent scope. |
| H4.7 | F=ℚ; residue F₃×F₃ | Multiplier quotient by scalar units has sizes 1 and 2 respectively. | Consistent; no single-component identification in the latter case. |
| H4.8 | μ_p⊂ordinary E[p] in characteristic p | Scheme rank p; geometric point count 1, versus p for constant Z/p. | Consistent finite-flat definition; point counts cannot replace rank. |
| H4.9 | Scalar u on μ_p versus chosen frame | uμ_p=μ_p for every unit u; the frame changes by u, nontrivially if u≠1. | Consistent distinction from full-level scalar kernel. |
| H4.10 | Q(√2),p=2,N=5,n=2 | A=〈ε⁴〉, B=〈ε¹²〉, B²=〈ε²⁴〉; A/B² has order 6. | Consistent. |
| H4.11 | F=ℚ,p=3,n=1 | Residue units have two elements; positive global-unit image has one; quotient has order 2. | Consistent; positivity cannot be omitted. |
| H4.12 | F=ℚ,p=3; scalar determinant | Scalar-multiplier quotient has size 1, while pairing-value set has size 2. | Consistent separation of star locus and selected pairing fibre. |
| H4.13 | F=ℚ,p=3,n=1 | GL₂(F₃) order 48; upper triangular subgroup order (3−1)²·3=12; quotient size 4=q+1. | Consistent. |
| H4.14 | F=ℚ,Δ(N)=1 | First exact sequence reduces to Γ₀≅E; kernel on projection to Δ is all Γ₀. | Consistent; universal nonsplitting would be false. |
| H4.15 | Q(√2),u root of a congruent square | ε⁸≡1 mod12, but its roots ≡5,7; scalar-kernel membership cannot be inferred from ε⁸ alone. | Consistent. |
| H4.16 | GL₂(F₃) modulo full scalar centre | Centre order 2; quotient order 48/2=24; with trivial scalar image quotient order remains 48. | Consistent dependence on the actual scalar image. |
| H4.17 | Rational case; H3.3 CM point | Δ(N)=1 gives split identity extension; CM stabilizer ≥2 obstructs an unqualified coarse torsor. | Consistent correction of source scope; S09. |
| H4.18 | C₆ with transition ×2 | Successive stable images {0,2,4}; each has size 3, while finite groups have size 6; limit order 3. | Consistent corrected theorem; S10. |
| H4.19 | ε powers mod 3,4,5,8,12,16,20,40,80 | Orders 8,4,12,8,8,16,12,24,48; ε⁴=(17,12), ε⁸=(577,408). | Computed independently; supports both counterexamples. |
| H5.1 | F=ℚ,c=ℤ,N=5 | g=1 and positive-unit quotient 1; both geometric moduli have dimension 1. | Consistent instance; level convention remains explicit. |
| H5.2 | e=3 and e=5 cyclotomic cases | L⊗Q Q(ζ₃)=L×L when L=Q(ζ₃), L-dimension 2 rather than 1; maximal real subfield for e=5 is Q(√5), degree 2. | Consistent tensor/field distinction. |
| H5.3 | Two real embeddings | Ranks 1+1=2, determinant rank 1; multiplying one Hodge factor by u multiplies its tensor determinant by u. | Consistent open-locus splitting test. |
| H5.4 | Q(√2), positive unit ε²; weights (1,−1) | Embeddings ε²=3±2√2; weight value (3+2√2)/(3−2√2)=17+12√2≠1. | Unequal weights do not automatically descend through units. |
| H5.5 | c=(2,√10), discriminant 40 | Norm c=2; modulo 5, squares 0,1,4 cannot equal ±2=2,3; no norm ±2 generator. Prime 5 ramifies. | Consistent nonprincipal ramified example. |
| H6.1 | Paired rank-two F₃ spaces | Symplectic automorphism group SL₂(F₃) order 24, nonabelian; identity Isom torsor has 24 elements, not one. | Consistent genuine torsor carrier. |
| H6.2 | Trivial torsion cocycle | Contracted product identifies [g,g⁻¹x] with [1,x]; twisting twice by inverse cocycles gives original x. | Consistent neutral case; general representability uses named descent inputs. |
| H6.3 | Two disjoint geometric components permuted by C₂ | Whole space has 2 components; selected component has 1 and is not defined over the base until the stabilizer field is used. | Consistent field-of-definition condition. |
| H6.4 | Complex conjugation diag(1,−1) mod odd l | Determinant −1; eigenspace dimensions 1,1. Identity conjugation has determinant +1 and dimensions 2,0. | Consistent oddness/polarization signature control. |
| H6.5 | l=7,p=19, cubic x³−3x+1; nonsplit self-extension | No roots mod7; roots 3,7,9 mod19; 19≡5 mod7. For I+bN, N²=0, determinant 1; scalar aI+bN has determinant a². | Checks local character and pairing repairs; general existence still relies on the stated C1–C6 contract. |
| H6.6 | Degree-two restriction of an elliptic curve | Dimension 2, not 1; after split base change it is E₁×E₂. | Consistent. |
| H6.7 | Quadratic split base change, two rank-two factors | Total residual vector-space dimension 4; product of two pairing-preserving groups, not one GL₄ without pairings. | Consistent. |
| H6.8 | Ordinary elliptic p-torsion after splitting | Connected and étale ranks p,p; total rank p², geometric point count p. | Consistent rank test; full local existence not proved by this calculation. |
| H6.9 | Places l,p,∞ versus an unlisted place | The three prescribed sets receive local points; count of asserted conditions at an unlisted place is 0. | No claim of local points everywhere. |
| R18.1.1 | F=ℚ, division algebra discriminant 6 | Real split-place count 1; local invariants at 2 and 3 equal 1/2; total invariant sum 1=0 in Q/Z. | Consistent actual example. |
| R18.1.1a | p=2, component norms mod7 | c₂=4, c₂⁻¹=2, c₂²=2; raw BZ translation 2 times central correction 2 equals 4 mod7. | Corrected class 4 differs from raw class 2. |
| R18.1.2 | One selected real embedding τ | Complex dimension 1; for F=ℚ reflex degree 1, for specified nontrivial F reflex field τ(F), not automatically ℚ. | Consistent. |
| R18.1.3 | Discriminant 6 versus split M₂(ℚ) | Division curve has 0 cusps; split modular curve has at least the cusp ∞. | Consistent compact/split separation. |
| R18.1.4 | Scalar 2I acting on P¹ | [z:1] maps to [2z:2]=[z:1]; action is identity although scalar is not 1. | Consistent effective quotient. |
| R18.1.5 | Inverse-diagonal scalar a=2 | Pair (2,1/2) multiplies to 1; diagonal pair (2,2) multiplies to 4. | Consistent central-kernel direction. |
| R18.1.6 | Degree-one type (1,1); quadratic type (1,1,2,0) | First type fixed by conjugation; second not fixed (2,0 swaps to 0,2). | Consistent distinction between ℚ reflex and the larger weighted-type reflex. |
| R18.1.7 | F=ℚ, M₂ split Morita factor | Rank-four full Tate module becomes rank-two Morita factor; identifying the two ranks would lose a factor 2. | Consistent. |
| R18.1.8 | One chosen connected component | Component count 1 on the selected sides, possibly >1 on full towers; no bijection of all component sets follows. | Consistent scope restriction. |
| R18.1.9 | Rank-one twist χ and inverse χ⁻¹ | Tensor characters multiply to 1; taking χ twice gives χ², generally not 1. | Consistent cancellation direction. |
| R18.5.1 | K=Q₂; points 0,∞ and nonrational z | 0 and ∞ belong to P¹(K) and are removed; a nonrational z is retained. | Consistent set-level test; does not replace analytic carrier. |
| R18.5.2 | q=2; z=2 at first strict boundary | Tree valence 3, radius-one vertex count 4; boundary distance 1/2 equals the radius, so strict <1/2 does not remove it. | Consistent strict-boundary convention. |
| R18.5.3 | Chart xy=π versus xy=π² | First has embedding dimension 2 at node; second has embedding dimension 3 and Krull dimension 2. | Only thickness one is regular at the node. |
| R18.5.4 | [K:Q_p]=2, relative height 4 | Absolute group height 8; Lie relative rank 2. Multiplication by π has relative quasi-isogeny height 4 and absolute p-height 4f. | Consistent two different height conversions. |
| R18.5.5 | Identity framing | Relative quasi-isogeny height 0; multiplying framing by π shifts by 4, not 0. | Discriminates framed from unframed moduli; general representability is a source theorem. |
| R18.5.6 | diag(π,1) and scalar πI | Determinant valuations 1 and 2; projective scalar action is identity although its height shift is 2. | Consistent separation of tree action and height. |
| R18.5.7a | Identity group; rational scalar subgroup | Effective stabilizer orders 1 after scalar quotient; unreduced scalar subgroup can be infinite. | Consistent need to quotient centre first. |
| R18.5.8 | (1,−1),(1,0),(−1,−1) | Half-differences 1,1/2,0; middle pair fails equal-parity condition, other two are integral. | Consistent lattice. |
| R18.5.9 | Tree translations length 3 and 2 | Minimum displacement 3 meets ≥3; 2 fails. Identity nontrivial scalar displacement 0 fails before effective quotient. | Consistent strict geometric condition. |
| R18.5.10 | Cyclic hyperbolic generator length 1; subgroup generated by cube | Minimum nonzero displacement changes 1→3; subgroup index 3. | Consistent small-level mechanism, not a proof of congruence realization. |
| R18.5.11 | q=2 component P¹ meeting three branches | Dualizing degree −2+3=1>0; with only two branches degree 0. | Consistent ampleness/stability threshold. |
| R18.5.7 | Free cyclic graph quotient with a length-3 loop | Graph first Betti number 1; effective stabilizer 1; loop must be retained rather than discarded. | Consistent test of quotient bookkeeping. |
| R18.5.12 | Diagonal height m=1 | Image (1,1); half-difference 0 and common height 1. Replacing by (1,0) violates parity. | Consistent labels. |
| R18.5.13 | Selected quaternionic component; BZ Proposition 6.2 | Requested construction count 1, supplied basic-uniformisation targets in cited PELModuli M2/M4 count 0. | Fails ownership, R01; S13. This is a dependency count, not a geometric verification. |
| R18.5.14 | Loop length 3; edge reversed by C₂ | Loop contributes H₁=ℤ; Kurihara-reversed edge is deleted, contributes 0, not a new loop. | Consistent conventions; Kur79 text unavailable. |
| R18.2.1 | Degree-one quaternionic case | Full abelian dimension 2; full Tate rank 4; Morita Tate rank 2. | Consistent ranks. |
| R18.2.2 | Stable graph component with q+1 branches, q=2 | Dualizing degree 1; genus formula for connected graph with 2 vertices,3 edges gives b₁=2. | Consistent; smallness cannot be replaced by arbitrary level. |
| R18.2.3 | Morita factor of height 2 versus full height 4 | p-torsion ranks p² and p⁴ respectively. | Consistent distinction. |
| R18.5.19 | Unramified extension e=1 versus e=2 | Node thicknesses 1 and 2 after base change; regularity retained only in first unmodified chart. | Consistent retention of finite-level fields. |
| R18.2.4 | Fixed connected component and extension field | One selected component stays one; comparison over extension does not turn a two-element Galois orbit into a rational point. | Consistent descent boundary. |
| R18.2.5 | Degree-two finite étale level cover | Pullback then trace is 2 on constants, not identity. | Consistent level-degree bookkeeping. |
| R18.2.6 | Unramified versus division local algebra | M₂(F_v) admits rank-two standard module; quaternion division algebra has no F_v-algebra isomorphism to M₂(F_v). | Consistent source domain. |
| R18.2.7 | χ=2, χ⁻¹=1/2 on one test element | Product eigenvalue 1; using same twist twice gives 4. | Consistent dual/twist direction. |
| R18.5.15 | B/ℚ of discriminant 6, v=2 | inv₂(B)=1/2; split at v would require 0. The original two v-hypotheses cannot both hold. | Fails/vacuous, R03; S14. Corrected real-place hypothesis admits this example. |
| R18.5.16 | Same discriminant-6 algebra | Division at 2 and split at ∞: invariants 1/2 and 0; M₂(ℚ) has invariant 0 at 2 and is excluded. | Correct rational specialization of repaired R18.5.15. |
| R18.5.17 | Two vertices,three edges; loop graph | b₁=3−2+1=2; one-loop b₁=1−1+1=1. | Consistent multigraph formula. |
| R18.5.17a | q=2 split prime | Each oriented source vertex has 3 adjacent lattice classes; degree q+1=3. | Consistent Hecke degree, general order theory remains supplied. |
| R18.5.18 | One cycle length 3; a tree | Pairing (a,b)↦3ab, cokernel ℤ/3; tree H₁=0 and cokernel 0. Tate parameter valuation 3 gives component order 3. | Consistent length normalization. |
| R18.5.20 | n=0 and n=1, rank-two p-torsion frame | Level-zero condition is trivial; first full level has GL₂(F_p) frames after splitting, not a single frame. | Consistent generic tower; no integral smoothness inferred. |
| R18.5.21 | Maximal local level and deeper ramified level | At maximal level node exponent 1; ramified base change of index 2 gives exponent 2. | Consistent generic-fibre claim; integral semistability is restricted. |
| R18.2.8 | xy=π and base-changed xy=π'² | Embedding dimensions 2 and 3; the latter requires modification for regularity. | Consistent. |
| R18.2.9 | Nontrivial inertia C₂ at a point | Coarse point count 1, stack automorphism order 2; a coarse point alone is not a universal family. | Consistent. |
| R18.2.10 | Identity and degree-3 isogeny | Degrees 1,3; pull–push on constants 1,3 respectively. | Consistent map normalization. |
| R18.2.11 | A divisor class of order 2 | D may fail to be Cartier; 2D has zero local class and is Cartier. | Consistent rational versus integral Cartier distinction. |
| R18.2.12 | Scalar z=1+i | z times conjugate z=2; absolute value √2, square 2, not 2√2. | Consistent hermitian norm convention. |
| R18.2.13 | Height-two factor | Ranks of pⁿ torsion p^(2n): n=0,1,2 give 1,p²,p⁴. | Consistent tower ranks. |
| R18.2.14 | Scalar a=2 over ℤ₃; split/division local models | Rank-two determinant factors 4 and 1/4 multiply to 1. The divisor correction is O in the split case and πO in the division case. | Determinant descent passes this test; saturated filtration needs its stated proof. |
| R18.2.15 | Identity torus character | Tensor factor rank 1 and eigenvalue 1; resulting Tate rank unchanged (2). | Consistent identity case. |
| R18.2.16 | Finite local field versus completed maximal unramified field | Residue fields finite versus algebraic closure of F_p; finite-local classification hypothesis holds only for the former without descent data. | Correctly retains a separate descent input. |
| R18.2.17 | R=k[t]/t², exact 0→tR→R→k→0 | Tensor with k sends tR→R to zero, hence 0→k→k is not injective. | Supports restriction against unjustified ramified τ-quotient exactness. |
| R18.2.18 | Two rank-two factors with reciprocal line twists u,u⁻¹ | Determinant scalar product u²·u⁻²=1; using same twist gives u⁴. | Consistent unramified filtered comparison. |
| R18.3.1 | Hamilton algebra over ℚ, maximal order class number one | Y_H has one point; quotient by an already trivial central action still one point. | Consistent model case; abstract carrier is supplied. |
| R18.3.2 | k=2; d=2,k=4; p=2 | Ranks 1 and 9; Sym² pairing Gram determinant ±4, nonunit in ℤ₂. | Consistent, perfectness is genuinely additional. |
| R18.3.3 | One orbit with stabilizer C₂ acting by −1 on ℤ₂ | Invariants 0; after reduction invariants F₂. Equivariant functions evaluate to those respective modules. | Consistent carrier; generic base change fails here. |
| R18.3.4 | Same C₂ sign action versus trivial stabilizer | Base-change map 0→F₂ fails for C₂; for trivial stabilizer ℤ₂⊗F₂→F₂ is identity. | Confirms invertible isotropy hypothesis. |
| R18.3.5 | One class with stabilizer order 2 | Weight factor 1/2 is not integral over ℤ₂, but is a unit over ℤ₃. | Consistent prime-to-stabilizer condition. |
| R18.3.6 | q=3, constant norm character 1 | T_v=4,S_v=1; polynomial X²−4X+3=(X−1)(X−3). | Consistent arithmetic Frobenius convention. |
| R18.3.7 | F=ℚ(√3), maximal finite level | Wide class number 1, narrow class number 2; omitted positive condition loses one nontrivial norm character. | Consistent corrected norm quotient. |
| R18.3.8 | One-point definite class set; pair (1,−1) | Degeneracy image 0; kernel dimension at least 1 before localization, norm/Eisenstein part becomes 0 after non-Eisenstein localization. | Source theorem matches; dependency loop R04. |
| R18.3.9 | Same one-point class set | Unlocalized source dimension 2, constant image dimension 1, kernel dimension 1. | Consistent need for localization; KW is a specialization, not the general supplier. |
| R18.3.10 | C₄ and C₂ stabilizers | Torsion exponents 4 and 2; multiplying an obstruction of order 4 by 2 need not kill it, by 4 does. | Consistent exponent rather than cardinality shortcut. |
| R18.3.11 | Character of C₄ taking generator to i | Generator scalar i−1 is nonzero; after mod2 reduction it may cease to be a unit. | Consistent retained coefficient/annihilation hypotheses. |
| R18.3.12 | q=11,l=5 | F₁₁× has order 10, maximal 5-power quotient order 5; using whole order-10 group inserts an unwanted factor 2. | Consistent. |
| R18.3.13 | Central scalar with residue a∈F₁₁× | Determinant residue a²; quotient testing uses a², not a; for a=−1 determinant 1. | Consistent square convention. |
| R18.3.14 | Free orbit of C₅ over F₅ | Function module dimension 5 and group-algebra rank 1; trivial module dimension 1 is not free over F₅[C₅]. | Consistent. |
| R18.3.15 | q=3, eigenvalues 1,6 in F₇ | Trace 0, determinant 6; S=6/3=2, polynomial X²+6, not X²+3. | Consistent evaluation must include q inverse. |
| R18.3.16 | Scalar −1 and a noncentral torsion element | Scalar action on curve is identity; noncentral torsion can fix points. Quotienting centre removes only the first. | Consistent projective neatness target. |
| R18.3.17 | Division uniformizer Π, central uniformizer π | ord(Nrd Π)=1; ord(Nrd π)=2; quotient parity distinguishes Π from scalars. | Consistent. |
| R18.3.18 | Parity quotient C₂ | Two characteristic-zero signs +1,−1; both reduce to 1 in characteristic 2. | Consistent characteristic-zero choice retained. |
| R18.3.19 | Norm character κ=1 | Division representation dimension 1 maps to Steinberg, not trivial GL₂ representation; Steinberg Iwahori-invariants dimension 1, hyperspecial-invariants 0. | Consistent transfer normalization; shared theorem remains supplied. |
| R18.3.20 | k=2 and k=4 | SU(2) symmetric-power dimensions 1 and 3 correspond to discrete-series weights 2 and 4, not dimensions 2 and 4. | Consistent shift k−2. |
| R18.3.21 | Norm character versus non-norm cuspidal constituent | Norm-character space has dimension 1 at trivial finite level; it is excluded from the cuspidal transfer claim. | Consistent exclusion, not a proof of global correspondence. |
| R18.3.22 | Weight two on a one-point set | Form dimension 1 before Eisenstein removal; non-Eisenstein localization can be 0. | No unconditional nonvanishing is inferred. |
| R18.3.23 | C₂ acts by −1 on ℤ₂ | Liftable image in residual invariants is 0; full residual invariants have dimension 1. | Consistent distinct objects. |
| R18.3.24 | Trivial rank-one versus sign rank-one integral action | Residual characters agree (=1); liftable images have dimensions 1 and 0 without the additional comparison hypotheses. | Confirms the hypotheses cannot be dropped. |
| R18.3.25 | C₈,N=2; C₂,N=2 | First ratio kernel {0,4} is inside squares {0,2,4,6}; second ratio kernel {0,1} contains nonsquare 1. | Consistent strict inequality a>b; equality a=b fails. |
| R18.3.26 | χ quadratic; scalar z | χ(Nrd z)=χ(z²)=1; twisting twice gives χ²=1. | Consistent preservation of central character. |
| R18.3.27 | χ(π_v)=−1 | T_v changes to −T_v; S_v changes by χ(π_v²)=1. | Consistent polynomial transport. |
| R18.3.28 | Eigenvalue r=1/3, inverse convention | Inverse eigenvalue 3, square 9; confusing forward and inverse changes r² from 1/9 to 9. | Consistent direction must remain marked. |
| R18.4.1 | Rank-one monodromy u=−1 on circle | Transport square 1; invariant sections over ℤ₂ are 0, over F₂ dimension 1. | Consistent coefficient dependence. |
| R18.4.2 | Genus-2 smooth proper complex curve, constant field coefficients | Betti numbers (1,4,1); H¹ is dimension 4, not dimension 2 of one Galois factor. | Consistent full multiplicity. |
| R18.4.3 | Circle, ℤ₂-line with u=−1 | Differential −2; H⁰=0,H¹=F₂; reduced differential 0 gives H⁰=H¹=F₂. | Consistent extra Tor term. |
| R18.4.4 | Genus-2 curve | H¹ rank 4 with symplectic pairing determinant 1 in a symplectic basis; zero pairing determinant 0 fails perfectness. | Consistent pairing test. |
| R18.4.5 | Degree-3 cover, constant class 1 | Trace(pullback 1)=3; two identical identity degeneracies send (1,−1) to 0. | Consistent trace orientation and need for localized injectivity. |
| R18.4.6 | C₂ over F₂ versus F₃ | Averaging denominator 2 equals 0 in F₂ and unit −1 in F₃; trace of constant 1 is 0 versus 2. | Correctly avoids unconditional averaging. |
| R18.4.7 | q=3, trivial component character | T=4,S=1 on H⁰; polynomial factors (X−1)(X−3). | Consistent Eisenstein normalization. |
| R18.4.8 | Same trivial component eigensystem | Eisenstein support present before localization; away from its maximal ideal that summand has dimension 0. | Consistent. |
| R18.4.9 | T=1,S=2 in F₇ | S⁻¹=4; adjoint T/S=4 and S⁻¹=4, different from original (1,2). | Consistent adjoint maximal ideal must be transported. |
| R18.4.10 | O-free rank r module, r=0,2 | Reduction dimensions 0,2; torsion example O/π instead has nonzero Tor and is excluded by the control hypotheses. | Consistent. |
| R18.4.11 | Degree-3 trivializing cover in characteristic 3 | Pull–trace is 0 on constants; injectivity must use non-Eisenstein H⁰ vanishing, not degree inversion. | Consistent proof mechanism. |
| R18.4.12 | Circle, ℤ₂ monodromy −1; rank-one u=2 over ℚ | Both correct cochain models give differential −2 and H¹=F₂; unadapted coefficient transport is 1/2 instead of 2. | Biduality correct; cited input absent, R02. |
| R18.4.13 | Interval relative endpoints, constant R | Map R→R² is diagonal; kernel 0,cokernel R; relative H¹=R. | Consistent support direction; update supplier as in R02. |
| R18.4.14 | q=2,T=3,S=2 | G(0,1)=(3/2,3); determinant 9−9/2=9/2. | Consistent inverse-S entry. |
| R18.4.15 | Degree q+1=3 degeneracies | Both diagonal pull–trace entries 3; off-diagonal entries 3 and 3/2 under the stated adjoint convention. | Matches R18.4.14. |
| R18.4.16 | q=2,T=3,S=1 versus S=2 over ℚ | Determinants 0 versus 9/2; first matrix kills (1,−1), second invertible. | Consistent discriminant hypothesis. |
| R18.4.17 | O→O, multiplication π; O→O²,x↦(x,0) | First residual map 0 and cokernel O/π; second residual injection and torsion-free cokernel O. | Consistent equivalence for finite free modules. |
| R18.4.18 | J=[[1,1],[0,1]] in characteristic 3 | J³=I,J≠I; its order 3 divides the image group order. Prime-to-3 image cannot contain it. | Consistent large-image hypothesis. |
| R18.4.19 | k[[X,Y]]/(X²Y) versus /(XY) | XY is nonzero square-zero in first, zero in second; fixed-determinant regular mixed ring dimension 4, not the five-variable unfixed dimension. | Consistent retained determinant and ramification choices. |
| R18.4.20 | q=11,l=5,n=1 | q−1=10 divisible by 5 but not 25; valid first-level numerical condition, invalid second-level condition. | Consistent n-dependent cofinality. |
| R18.4.21 | A=k[x,y]/(x,y)²; finite free orbit | Socle(A) dimension 2, socle(A∨) dimension 1; coinduced A∨ module injective. No Ihara input needed for this computation. | Coefficient dual correct; remove circular dependency, R04. |
| R18.4.22 | q=11,l=5 | Permutation representation dimension 12=1+11; 12 is a unit mod5; Steinberg dimension 11. | Consistent Iwahori splitting criterion. |
| R18.4.23 | N dimension 2,M dimension 3 | Graded dimensions 2,6,2 give total 10; reversing dual order retains 10 but reverses maps, so maps must be retained. | Consistent dimension check only. |
| R18.4.24 | Weight-two trivial coefficient | Coefficient rank 1; full H¹ multiplicity remains two-dimensional per rank-two Galois factor. | Consistent no multiplicity-one substitution. |
| R18.4.24a | N_HK(v)=2w,e=2 | Normalized N(v)=w; unnormalized value 2w differs. | Consistent normalization inherited from supplier. |
| R18.4.24b | Degree-two totally real field | Remaining positive real centre rank g−1=1; circle has H⁰=H¹=ℚ, so deleting it changes cohomology. | Consistent explicit torus comparison required. |
| R18.4.25a | Compact quotient versus ℝ | Compact quotient discrete spectrum; constant function has finite L² norm there, infinite norm on ℝ. | Compactness and split-centre hypotheses are necessary. |
| R18.4.25 | Two copies of a rank-two eigensystem | Dimension 4=2·2; declaring the whole eigenspace rank two would drop multiplicity. | Consistent. |
| R18.3.29 | Arithmetic eigenvalues α,β with product qS | Geometric eigenvalues α⁻¹,β⁻¹ have product (qS)⁻¹; for α=1,β=3, products 3 and 1/3. | Consistent contragredient adapter; full compatibility depends on source hypotheses. |
| R18.4.27 | q=3,S=2 in F₇ | Determinant 6, not 2; trace T and determinant qS determine quadratic polynomial. | Consistent. |
| R18.4.26 | Weight-two constituent, multiplicity 1 | Definite multiplicity dimension 1; indefinite H¹ contribution dimension 2 after tensoring the Galois factor. | Consistent comparison keeps the factor. |
| R18.4.28 | Steinberg versus unramified spherical representation | Iwahori invariants both nonzero; Steinberg hyperspecial dimension 0, unramified spherical dimension 1. | Consistent need to distinguish local types. |
| R18.4.29 | Constant free systems of ranks 0,1,2 | Patched ranks 0,1,2; eventual finite quotient C has reduction C, whereas unbounded ranks violate the generator bound. | Source construction matches; S12. Generic derived patching is not silently used as an exact module theorem. Correct page locator: R08. |
| R18.4.30 regular-base flatness | A=k[[t]],R=A[[x]],M=R; M=k over R=A | First dimensions 2=1+1, flat; second M depth 0<dim R=1, not MCM and not A-flat. | Consistent. |
| R18.4.30 thickening transfer | A=k[[X,Y]]/(X²Y),M=A,L=(XY) | ann(X)=(XY); N=A/(XY); N/XN=k[[Y]]≅(XY), via 1↦XY. | Matches MS Lemma 5.2 without a domain assumption. |
| R18.4.30 nodal filtration transfer | B=k[[X,Y]]/(XY),M=B²,N=k[[X]],L=k[[Y]]² | P=L⊕B² admits N,L²,N filtration by placing one X-branch in each B; M/YM=k[[X]]² gives split 0→N→N²→N→0. | Matches MS Lemma 5.3. |
| R18.4.31 | Split exact rows N→N²→N with identity outer maps | Middle identity surjective; cokernel 0 both before and after augmentation. | Consistent diagram mechanism; no general exactness of tensor inferred. |
| R18.4.32 | l=3 large image versus prime-to-3 image | Unipotent J has order 3; only first case supports auxiliary unipotent selection. Eisenstein constant pair has image 0 and is explicitly excluded. | Source hypotheses match; S15. |
| R18.4.33 | Matrix inclusion (1,0) versus multiplication π | Residual ranks 1 and 0; cokernels O and O/π respectively. | Consistent saturation hypothesis; not an unconditional integral theorem. |
| R18.4.34 | k=2 versus k=4; symmetric powers | Sym⁰ rank 1, Sym² rank 3; denominators 2! are invertible over ℚ₂ but not over ℤ₂. | Consistent rational projector domain. |
| R18.4.35 | g=2,w=4, q₀=6,a=2 | Cohomological weight 7 minus twist contribution 4 gives 3=w−1; w=2 gives weight 1. | Consistent twist sign. |
| R18.4.36 | Weight-one Frobenius eigenvalue at q=4 | Absolute value 2; square absolute value 4=q. Its inverse has absolute value 1/2 and opposite weight. | Consistent geometric convention. |
| R18.3.30 | q=−1 in F₃; roots ±1 | Roots 1,2 are distinct despite Steinberg ratio q=−1; the extra ratio/ramification hypotheses are essential. | Consistent q≡1 hypothesis; at q=1 and γ=2 both roots equal 2. |
| R18.3.31 | Polynomial (X−1)(X−2) versus (X−1)² over F₃ | First two roots distinct with derivative values −1,1; second derivative at root 0. | Consistent simple-root requirement. |
| R18.3.32 | q=−1 mod3,γ=±1 | Both unordered roots {1,2}, trace 0,determinant 2; for q=1 traces 2 and 1 differ. | Confirms correction to KW sign inference. |

## Not verifiable

- **Seed identity:** the 15 seeded targets are given only as repeated words such as “Definition” and “Theorem”. No target IDs or locators accompany them. The explicit S01–S15 sample above is reproducible, but is not certified as the worker's intended seed.
- **KL05**, H3.8, §§1.9–1.10, author pp.7–9: the Harvard DVI was not recognized by the sources service; the corresponding PDF returned 404; bibliographic search found no legal text. BHW23's later isogeny comparison was available, but does not certify every KL05 construction/locator.
- **Kur79**, R18.5.14, Definition 3-1 through Proposition 3-4, pp.285–289: both institutional repository URL forms returned HTTP 503. The quotient-graph calculations above do not certify Kurihara's precise inversion/length statements.
- **PRR23**, R18.3.7 and R18.3.17, §1.5.2 Theorem 1.34 pp.43–44 and §1.4.2 pp.31–33: the Cambridge chapter landing page requires access/purchase. The norm and valuation examples were checked independently; the source locators remain uncertified.
- **Scope of certification:** 32 of 35 requested works/tag documents were retrieved legally. Retrieval is not full-text certification of every citation. The source table and additional-locator paragraph identify the passages actually checked. In particular the OCR in Tay02 obscures some torsion notation; the proposed correction to the precise l-torsion formula was not independently certified from that extraction. The computed table is a collection of finite-instance tests, not proofs of the universal existence/comparison assertions.

Unavailable-text requests were consolidated; the roadmap manifest is unchanged. Inaccessibility is not evidence of falsity.

## Source issues

- **Misprint** in BHW23 at Definition 5.2(1), printed p.1741: the source says integral matrix membership inside the adelic general linear group defines the compact level; it should be the units of the lattice endomorphism order, requiring inverse preservation; affects a stated result.
- **Error** in BHW23 at Proposition 8.4, printed p.1766: the source says the polarization-class map is always a coarse finite étale torsor; it should be a stack torsor, with coarse torsor statements restricted to the free locus; affects a stated result.
- **Error** in BHW23 at §8.3.1 after (8.6), printed p.1774: the source says both group extensions are nonsplit; it should be conditional, since F=ℚ gives trivial positive-unit quotients and split extensions; affects a stated result.
- **Error** in BHW23 at Lemma 8.20 and proof, printed p.1775: the source says finite connected unit quotients inject into the tame quotient and eventually equal the inverse limit; it should be stable images that eventually equal the limit; affects a stated result.
- **Gap** in KW09 at Lemma 7.2(i) proof, internal p.61: the source says common residual representations determine the odd-prime unramified sign; it should be conditional on sign separation when q≡−1 and residual inertia is trivial; affects the proof.
- **Error** in MS19 at Theorem 6.8 proof, internal p.35: the source says the norm-fibre quotient uses all F×; it should be the quotient by the totally positive rational norm image for a totally definite quaternion algebra; affects the proof.
- **Misprint** in MS19 at Propositions 6.11–6.12 proofs, internal p.38: the source says to use the unipotent ambient ring first and principal-series ring second; it should be the principal-series ambient ring first and unipotent ring second; affects the proof.
- **Gap** in Tay02 at Lemma 1.2 proof, internal p.11: the source says surjectivity of the wide ideal-class norm permits the ordered polarization adjustment; it should be justified by narrow-class norm surjectivity, or retain that extra hypothesis; affects the proof.
- **Gap** in YZ18 at the sequences preceding Proposition 5.4, printed p.575: the source says taking τ-quotients preserves the displayed short exact Hodge sequences; it should be justified by ramified left exactness or an appropriate filtered comparison; affects the proof.
