# Review of AbelianSurfacesModularity (pull request #1746 at b20dcf8)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/AbelianSurfacesModularity/README.md:136,381,933` imports OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2; the duplicate reasonableness gap is absent from both README and plan.
- R02 — repaired: `TauCetiRoadmap/AbelianSurfacesModularity/README.md:79,552,560,949` imports SatoTateGroups §§9.1–9.4 and 9.10, retaining nonprincipal polarizations, finite base change and isogenies; the duplicate open-image gap is absent from both records.
- R03 — repaired: the PR's `roadmap-summary` block restricts cuspidal GL₄ witnesses to the Layer 6 endpoints and explicitly permits isobaric witnesses in the complements.
- R04 — repaired: the PR's Dependencies prose identifies the Exact supplier contracts as prerequisites and names both replacement suppliers; it no longer classifies omitted open suppliers as consumers.

## Verified sound

| Statement | Instances tried | Computed values | Required value / result | Change |
|---|---|---|---|---|
| Matrix characteristic polynomial, README line 38 | diag(1,2); empty matrix | det(XI−M)=X²−3X+2; empty determinant=1 | Native charpoly gives these polynomials | Locator 140 verified |
| Polynomial roots, line 38 | (X−1)² and 0 over ℚ | Root multisets [1,1] and [] | Multiplicity two; zero polynomial excluded from root assertions | Locator 497 verified |
| Alternating simplicity, line 40 | A₅, A₆; A₄ negative control | Orders 60,360; A₄ has normal V₄ of order 4 and index 3 | Five-letter threshold admits A₅,A₆ and excludes A₄ | Locator 201 verified |
| Schur multiplier, line 44 | A₅ with coefficients 𝔽₂ˣ | Coefficient group has order 1; H²=0 | Coefficient-dependent H², not integral multiplier C₂ | Locator 122 verified |
| Fixed-vector theorem, line 48 | I+E₁₂ on 𝔽₂⁴; zero module | Operator squares to I; 8 fixed vectors, 7 nonzero; zero module has 0 nonzero vectors | Nonzero fixed vector; Nontrivial excludes zero module | Locator 170 verified |
| SatoTateGroups contract, line 79 | End⁰=ℚ; split-product idempotent e | Scalar commutator constraints: 0; dim Sp₄=10; dim centralizer of e=6 | Scalar case gives TL=Sp₄; product fails scalar hypothesis | Existing owner imported |
| Rational polarization and invariance, line 79 | J versus 2J over ℚ₂; finite extension | Determinants 1 and 16 are nonzero; preservation equations differ by invertible factor 2 | Same Sp₄ of dimension 10; finite-index restriction preserves its connected component | Principal polarization unnecessary |
| Reasonableness contract, line 136 | Trivial H; Cartan trace form at p=3,2 | dim D=10; dim H⁰(1,D)=10; det(2I₂)=1 mod 3, 0 mod 2 | H⁰ must be 0; trivial image fails; p=2 excluded | Supplier's hypotheses retained |
| Cyclotomic stability, line 136 | H₁=1 or C₃; k=𝔽₃ | Hom(1,k)=0; Hom(C₃,k)=k; possible quotient indices 1 versus 3 | H¹(H₁,k)=0 rules out every proper p-power quotient, forcing H_n=H₁ | Lemma 3.20 retained |
| §1.4 reasonableness input | Full mod-3 image and cyclotomic kernel | 3⁴(3²−1)(3⁴−1)=51840; full group=103680; index=2 | Stable cyclotomic image is Sp₄, not GSp₄ | §5.2 supplies the condition |
| §3.2 monodromy route | Order-five residual element; identity; polarization type (1,2) | Over 𝔽₂, gcd(X⁴+X³+X²+X+1,X²+1)=1; identity has one eigenvalue; polarization degree=4 | Regularity holds only for first; rational monodromy does not supply a perfect mod-2 pairing | Endomorphism adapter then SatoTateGroups |
| §6.1 transfer input | Trivial rank-four residual image; p=3 surface weights | dim H⁰(1,D)=10≠0; weights 0,0,1,1; twist (1−4)/2=−3/2 | Trivial image fails reasonableness; singular weight remains allowed | Replacement supplier matches p>2 |
| §6.2 monodromy input | E₁×E₂ with nonisogenous non-CM factors | End⁰ contains ℚ⊕ℚ; symplectic centralizer dimension 6<10 | End=ℤ hypothesis excludes product; no cuspidal conclusion forced | Scalar-endomorphism contract sufficient |
| §6.3, dependent endpoint | Full mod-3 image; forbidden quadratic square | Image order 103680; (X²+X+2)² mod 3 has coefficients (1,2,2,1,1) | Full image admitted; repeated quadratic excluded | New monodromy supply preserves endpoint |
| Repaired PR summary and §0.1 | Two trace-one elliptic factors at 3 | Constituent ranks 2+2; denominator 1−2T+7T²−6T³+9T⁴ | Two isobaric constituents; cuspidal GL₄ requires one | Description distinguishes the cases |

The adversarial rows for untouched statements stand as in the previous review of `223e025`.

- Sources: 13 locators checked across 3 works: FKRS12 Definitions 2.14–2.15/Theorem 2.16(b), WHITMORE22 Definitions 3.15/3.19/Lemma 3.20, BCGP25 Lemmas 6.4.2–6.4.3/Table 6.4.4, Theorems 8.3.2/9.5.1/9.5.2/A; seeded §§6.1 and 6.3 checked in the affected dependency chain.
- Pins: 5 revised declaration locators opened: `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`, `Mathlib/Algebra/Polynomial/Roots.lean:497`, `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:201`, `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:122`, `TauCeti/RepresentationTheory/PGroupInvariants.lean:170`.
- Suppliers: 6 replacement section references resolved at their open heads; 14/14 remaining gap slugs agree between README and plan; both duplicate gaps removed.
- Dependency output: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines.
- Gate: every check passed at b20dcf8; targeted build and direct Lean elaboration both exit 0, with 0 warnings; 0 declarations require signature or one-tactic probes.
- Scope and description: 34 changed lines reviewed; 0 PR-owned changes outside the folder against origin/main; title, summary and prose match the addition and its replacement suppliers; worktree unchanged.

Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, ModularityAndLanglandsExtensions, EllipticCurveModularityImaginaryQuadratic and PotentialAutomorphyInfrastructurePartII from the closest-roadmap lists, plus SatoTateGroups. Reasonableness belongs to OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2; small-dimensional monodromy to SatoTateGroups §9.10; nonregular lifting to GSp4NonregularModularityLifting Layer 11; Artin/tensor transfers to ModularityAndLanglandsExtensions §§1.9/1.11/1.13; relaxed adequacy to PotentialAutomorphyInfrastructurePartII PL.4. No shared surface endpoint with EllipticCurveModularityImaginaryQuadratic; no changed object has duplicate ownership.

Source independence: changed passages only; 5 changed prose passages compared with 3 sources, with no copied expression or reused source material identified. BCGP25 has the largest share, appearing in 90 of 99 parenthetical citation groups outside References. No layer was added, removed or reordered; the contents comparison of 223e025 stands.

## Not verifiable

- KIS99 Theorem 5.1 remains settled uncertified; no readable cached text supplied; no request reopened.
- THORNE17 Definition 2.20 remains settled uncertified; no readable cached text supplied; no request reopened.
- FC90 II Theorem 6.2/Remark 6.3 and III Theorem 7.1/Corollaries 7.2–7.4 remain settled uncertified; no readable cached text supplied; no request reopened.

## Source issues

- **Misprint** in BCGP25 at Lemma 6.4.1, printed p.149, line 6759: the source says multiplier-minus-one lifts project into PSp₄(𝔽₃); it should be PGSp₄(𝔽₃), outside PSp₄(𝔽₃); affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 6.4.3, printed p.150, line 6822: the source says the cyclotomic image is Γ′ intersected with GSp₄(𝔽₃); it should be Γ′ intersected with Sp₄(𝔽₃), the multiplier kernel; affects the proof.

## For the human reviewers

- none
