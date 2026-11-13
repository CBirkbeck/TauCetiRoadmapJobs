# Review of SchemeAndStackFoundationsPartII (pull request #2272 at f517dd7)

**Verdict:** needs changes

## R01 (P3) — Register the revised comparison contract in the plan

**Location:** `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md:110`: “What SchemeAndStackFoundations must provide (gap:classical-affine-group-adapter)”.
**Claim:** The mathematical repair of previous R01 is present, but its required plan registration is missing. The intake cannot announce this residual supplier contract from the top-level gaps list.
**Witness:** `packages/SchemeAndStackFoundationsPartII/design/plan.json:3260` has 19 gap objects and zero with slug `classical-affine-group-adapter`; line 3381 references that slug only as a prerequisite of `begueri-resolution`.
**Repair:** Add a top-level `gaps` object with slug `classical-affine-group-adapter`, supplier `SchemeAndStackFoundations`, section `Layer 1 §1.15`, and `needs` containing the complete revised comparison at README line 110, including its naturality, base-change, coboundary and kernel laws. Keep the finite locally free G / smooth H,Q distinction.

## Previous findings

- R01 — partly repaired: README lines 75–76 cite the existing transports; line 110 specifies evaluation, naturality, base change and the coboundary kernel; lines 114–115 distinguish nonsmooth μ₃ and the coboundary sign. The plan entry is absent.
- R02 — repaired: README lines 9, 123, 477 and 485 cite PerfectoidQuotientsPartII §§Q7.1–Q7.3 and the §Q9.6 proof route; line 123 supplies the characteristic-p specialization and finite-free justification.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
|---|---|---|---|---|---|
| Pinned point transport, README 75 | μ₃ over A=𝔽₃[ε]/ε² | g=1+ε; g²=1+2ε | Coordinate point sends T to 1+ε; convolution square sends T to 1+2ε | Group law agrees | Cite native comparison |
| Pinned smoothness transport, README 76 | μ₃ and 𝔾_m over 𝔽₃ | μ₃: derivative of T³−1 is 0; tangent dimension 1, dimension 0 | μ₃ nonsmooth on both sides; 𝔾_m smooth on both sides | Separate property retained | Cite native transport |
| Revised adapter: character inclusion and kernel, README 110 | G=μ₃, A=𝔽₃[ε]/ε² | g=1+ε; g³=1 | Evaluation=(1,1+ε,1+2ε); all nine coboundary values=1 | Nonsmooth group embeds | Register contract: R01 |
| Adapter: kernel in both directions | G*=ℤ/3; f=(u₀,u₁,u₂) | δf=1 forces u₀=1, u₂=u₁², u₁³=1 | Every u₁³=1 gives f=(1,u₁,u₁²) and δf=1 | Kernel exactly μ₃ | — |
| Adapter: naturality and base change | Squaring μ₃; 𝔽₃→𝔽₉ | g↦1+2ε; dual sends i↦2i | Both vectors=(1,1+2ε,1+ε), also over 𝔽₉[ε]/ε² | Directions agree | — |
| Adapter: trivial group | G=0, R=𝔽₅ | G*=0; H=𝔾_m; f=2 | δf=2²/2=2; kernel={1}=G(R) | No normalization imposed | — |
| Added Checks, README 114–115 | μ₃ above; constant f=2 over 𝔽₅ | dim μ₃=0, tangent dimension=1; 2²/2=2 | dim H=3, tangent dimension=3; inverse coboundary=3 | Smoothness and sign distinguished | — |
| Root-extension rank, README 123 | A=𝔽₂[ε]/ε², T²=ε; p=3, T³=a | First algebra=𝔽₂[T]/T⁴; second monic degree 3 | A-bases (1,T), (1,T,T²); ranks 2,3 | Faithfully flat finite stages | Correct supplier locator |
| Semiperfect root cover, README 123 | Same nonreduced A; full root tower B | ε survives, ε²=0; every generator has a next root | Frobenius onto B, kernel contains ε≠0; finite-stage ranks 2^N | Semiperfect, need not be perfect | — |
| Characteristic-p Zariskization | Any 𝔽_p-algebra B; B=0 | 1+pB={1} | B[{1}⁻¹]=B; zero ring stays zero | Specialization valid | — |
| §3.2, dependent seeded target | Split cover A→A×A; I=(1) or I=0 | I=(1): support complex 0; I=0: C=RΓ(A,G) | Totalizations 0 and C; degree j has C^(2^(j+1)) | Split contraction agrees | Root supplier repaired |

Untouched adversarial rows stand as in the previous review of `8f486a0`.

- 4 cited locators checked in 2 cached sources: BG80 Proposition 2.2.1, printed pp.25–27 (lines 724–797); CS24 §1.4 p.8 (lines 317–320), Corollary 2.3.7 proof pp.28–29 (lines 1161–1174), Theorem 5.7.2 proof p.80 (lines 3362–3377).
- 2 added pinned APIs opened: `TauCeti/AlgebraicGeometry/AffineGroupScheme/Points.lean:36`, `TauCeti/AlgebraicGeometry/AffineGroupScheme/Smooth.lean:99`; native biduality also checked at `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:394` and line 415.
- 4 changed supplier locators resolved: SchemeAndStackFoundations §1.15 as the named gap destination; PerfectoidQuotientsPartII §§Q7.1, Q7.3 and Q9.6 at #2259; 0 new supplier names or reordered layers.
- 6 declaration signatures freshly elaborated with `#check @name` and compared with the README: 0 lost binders, 0 changed Lean declarations; prior padding checks stand.
- Gate: every scanner passed; targeted Lake build and direct elaboration passed with only the 2 expected `sorry` warnings; the fresh signature-copy elaboration also exited 0.
- 0 outside-folder changes and 0 worktree modifications; title, description and `roadmap-summary` agree with the new-folder addition and this repair's scope.

Dependency-check output: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`.

Overlap check: read the scopes of PurityForFlatCohomology (general flat cohomology, supports and excision), ArcTopologyAndDescent (complete arc descent), PrismaticCohomologyPartIII (perfect-base and prime-continuity inputs), PrismaticCohomology (prisms), PerfectoidQuotientsPartII (ind-fppf maps and compatible-root covers), EnhancedDerivedSheaves (animation and totalizations), and SchemeAndStackFoundations (ordinary schemes, sites and torsors). The changed residual comparison is assigned to SchemeAndStackFoundations; Bégueri resolution remains assigned to PrismaticCohomologyPartIII. No competing owner found for the changed comparison.

Source independence: changed passages only; 7 changed passages compared with 2 sources, no copied expression or reused material found; largest share CS24, 44 of 69 locator-bearing source-key clusters before References. No layer was added, removed or reordered; the contents comparison of `8f486a0` stands.

## Not verifiable

- none

## Source issues

- **Misprint** in CS24 at proof of Corollary 2.3.7, printed p.29, line 1174: the source says the completed root-stable quotient is perfectoid by Proposition 2.1.11(d); it should be Proposition 2.1.11(c), since (d) concerns products; affects the proof.
- **Misprint** in CS24 at Example 5.6.7, printed p.75, line 3166: the source says the comparison is introduced only for degrees at least two before including degree-one surjectivity; it should be introduced for degrees at least one; affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed p.79, line 3336: the source says the three required comparisons are (5.7.2.1), (5.7.2.2), (5.7.2.2); it should be (5.7.2.1), (5.7.2.2), (5.7.2.3); affects nothing.
- **Misprint** in BG80 at proof of Proposition 2.2.1, printed p.26, line 774: the source says the kernel inclusion for an unnormalized cocycle sends a to (1,a); it should send a to (1,a/c(1,1)); for constant cocycle 2 the identity is (1,1/2); affects the proof.

## For the human reviewers

- none
