# Triage report: TARGET-EllipticCurveModularityTotallyReal

Verdict: **design**, retaining **EllipticCurveModularityTotallyReal**. The brief is `packages/EllipticCurveModularityTotallyReal/target.md`; the source register is `packages/EllipticCurveModularityTotallyReal/sources.toml`. No Lean or detailed roadmap design was written.

## Consolidation and ownership searches

I read the supplied board package index before making absence claims. I searched every available package README, design README and target brief by mathematical objects: elliptic curves over totally real fields, Hilbert modular attachment, weight-two modularity lifting, cyclic covers and their character lattices, geometric prime switching, reflection twists, residual irreducibility and compatible-system descent. The sole other target explicitly listed in this job, TARGET-MathematicalBilliards, concerns convex planar tables, oriented-line phase space and the billiard map; it has no shared theorem or structure here. Its absent board file does not prevent that comparison with its filed statement.

The material near this target was inspected beyond folder names:

| Candidate | Actual scope and disposition |
| --- | --- |
| `packages/EllipticCurveModularityCMFields/target.md`; `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` | Arbitrary CM base fields, including the exceptional five-adic protected-place argument. The design's Scope and Layer 8 restrict its headline to CM fields and explicitly exclude totally real fields. It imports the same geometry but has no reflection descent or totally real lifting chain. Do not merge independent field branches merely because they share the supplier. |
| `packages/GL2ModularityLiftingPartII/README.md` and design | Defect-one weight-one and minimal Bianchi R=T, with coefficient-type and scalar-Frobenius refinements. These are different statements from the totally real elliptic endpoint. |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` and design | Dyadic polarized unitary/symplectic ordinary lifting; the new chain is at odd primes 3 and p. Its generic ordinary infrastructure remains with its owner. |
| `packages/PotentialAutomorphyInfrastructurePartII/README.md` and design; `packages/AutomorphyLiftingBeyondTaylorWiles/README.md` and design | General polarized lifting and different unpolarized/defect patching theory. They neither construct the reflection twist nor assert arbitrary base-field elliptic modularity. They are not assigned a competing endpoint here. |
| `packages/AbelianSurfacesModularity/README.md` and design; `packages/GSp4NonregularModularityLifting/README.md` and design | Rank-four surface and GSp₄ statements with their residual and local hypotheses, rather than all elliptic curves over all totally real fields. |
| `packages/ModularityAndLanglandsExtensionsPartII/README.md` and design | Symmetric-power propagation for already automorphic rank-two representations. Having such a representation is an input; proving the elliptic witness over the original field is different work. |
| `packages/AutomorphicCongruences/README.md`, Hilbert modular geometry and automorphic-bundle packages | Congruence, Selmer, geometric and attachment suppliers, not this modularity endpoint. |
| `packages/EllipticCurveModularityWild3Adic/README.md`; `packages/EllipticCurveModularityPartII/README.md` | Rational-field wild-three and rational modular-curve/image questions. Import their already-owned arithmetic; do not repeat their proofs or mistake their base-field hypotheses for arbitrary totally real fields. |
| `packages/ArithmeticLevelRaisingAndBipartiteEulerSystems/target.md` | Unitary Rankin–Selberg cycles, level raising and Selmer rank consequences. Its use of a totally real subfield does not give this elliptic modularity theorem. |

The remaining object-search candidates concerned ordinary families, Galois deformation foundations, Hilbert modular varieties, modular weights, Euler/Selmer systems or geometric representation theory. None named this curve-family descent or the unrestricted elliptic endpoint. These general objects remain imported, so this brief does not manufacture overlap by assigning their theories to a new owner.

I also checked all three packages under review at the heads in the index, using read-only repository API access. `packages/AnalyticNumberTheory/README.md` at `310e834` is an index of analytic number theory Parts I–II and adds no mathematical target. `packages/LogicAndDefinabilityInNumberTheory/README.md` at `972ee8e` builds logical/valued-field and counting interfaces. The listed root README for LawrenceVenkateshMethod returned 404; inspection of the head tree located `packages/LawrenceVenkateshMethod/design/README.md` at `9ee7ac3`, which assigns period-map/rational-point finiteness work to the existing Lawrence–Venkatesh family. Its shared words “monodromy” and “compatible systems” do not make the prime-switch theorem one of its targets. No unresolved package-content lookup remains.

## Main, open heads and supplier boundaries

I used the prescribed `roadmaps list`, `roadmaps grep`, `roadmaps show` and `roadmaps overlaps` tools. The index contains 434 open roadmap pull requests, at its stated 2026-11-10 snapshot. Searches covered the current main/completed trees and the open README and Suggested.lean heads. Search expressions included `reflection.twist`, `prime switch`, `LeHung26`, `geometric prime`, elliptic/totally-real phrases, Freitas, Breuil–Diamond, constructing ordinary lifts and prospective totally-real modularity names. A broad “reflection” query was too noisy, so it was followed by narrower arithmetic queries rather than treated as a complete negative search.

I read the actual open heads of:

- ECMIQ (#1048), especially Scope, Layers 1–4, §5.1, §§7.1–7.4, §§8.1–8.6 and Downstream consumers and boundaries;
- GL2ModularityLifting (#1071), especially §§5.1, 5.3, 5.6–5.11 and its exact supplier/ordinary-overlap contracts;
- OrdinaryAutomorphicFormsAndModularityLifting (#1066), especially §§2.1, 5.3, 5.8 and its ownership boundary with ClassicalSerreModularity §I.1;
- ClassicalSerreModularity's §I.1 starting-theorem contracts;
- AutomorphicGaloisRepresentations, §§3.10–3.14 and §§4.1–4.7;
- GL2AutomorphicRepresentationsAndTransfer, R17.4 and the odd solvable residual inputs of R17.5;
- ModularityAndLanglandsExtensions (#1180), especially Scope, §1.4 and the existing ECMIQ input boundary;
- HilbertModularForms (#1724), Scope and §11.3.

The decisive findings are:

1. ECMIQ's geometry and character-congruence theory are already over arbitrary number fields. They are suppliers, not new goals. Its terminal `imaginary_quadratic_modularity` (§8.6) and its CM-specific descent/lifting do not cover totally real fields; its boundary explicitly leaves that extension outside scope.
2. The CM Part II continues that CM proof direction. The totally real reflection descent changes the field and the directly invoked lifting theorems. It does not extend the CM Part II's endpoint, and that Part II's name is already reserved. A sibling design with the filed name is appropriate, not another independently named extension planning the same CM theory.
3. GL2ModularityLifting owns the general lifting arithmetic. However its currently stated Kisin exports require strong residual modularity, ordinary component information and, in §5.10, a residue-field restriction. I did not silently upgrade those exports to LeHung26 Proposition 3.1. The brief records the precise source for the required refinement and makes its upstream ownership/export an acceptance risk for the design.
4. ModularityAndLanglandsExtensions §1.4 treats a mod-five representation under an unramified-at-five hypothesis; it is not an all-fields theorem for arbitrary elliptic curves. Its CM residual criterion §2.29 is an ECMIQ consumer, not a totally real supplier to reverse in the order.
5. HilbertModularForms §11.3 explicitly treats base-field elliptic modularity, exact conductor and full local factors as additional inputs. Its analytic/dictionary theory does not already prove this target. It is a concrete prospective consumer.
6. The overlap tool reports no second open PR changing ECMIQ and no cited section deleted by an open head. Its vocabulary neighbors were checked as supplier/application candidates, not interpreted as automatic ownership.

The filed name is unused by an existing roadmap, open roadmap head, other package or order entry, apart from this target's own source-register reservation. No existing owning section or declaration was found for the new headline or reflection theorem. Thus `duplicate` and `merge-into` are unsupported. The rational and imaginary-quadratic modularity roadmaps are existing work, preserved as inputs; the new field branch and different lifting direction justify `design` with Base none.

## Pinned libraries and order

I searched both pinned source trees (Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`), including actual declaration and path searches for totally real/CM fields, elliptic torsion/Tate actions, Hilbert forms, automorphic representations, regular algebraicity, attached representations and local–global compatibility. Mathlib has `NumberField.IsTotallyReal`, `NumberField.IsCMField`, maximal real subfields and the associated field arithmetic. Tau Ceti has elliptic Tate-module/Galois-action and reduction interfaces, including `WeierstrassCurve.tateModuleGaloisRepresentation` and its inertia/good-reduction results. These do not supply GL₂ automorphic representations over number fields, the Hilbert attachment or this modularity theorem. A second broad search for those automorphic/Hilbert carriers returned no matches. No elaboration or build was needed or run for a no-Lean triage.

The supplied order places GL2AutomorphicRepresentationsAndTransfer at 100, AutomorphicGaloisRepresentationsPartII/AutomorphicGaloisRepresentations at 165–166, ClassicalSerreModularity at 169, OrdinaryAutomorphicFormsAndModularityLifting at 173, GL2ModularityLifting at 174, and ECMIQ at 194. ModularityAndLanglandsExtensions follows at 195. The brief proposes the new branch after 194 and before 195, with all generic refinements delivered at their earlier owners. It does not import later PotentialAutomorphyInfrastructurePartII or the Hilbert newform application to prove their input. The CM sibling is independent in either direction. I did not edit the order.

## Source verification and corrections

I read the operator-staged LeHung26 extraction, including the full totally real argument and its descent/status paragraphs. I fetched all eight additional works needed for the brief through the sources service and read the cited statements. Legal metadata is recorded for all nine works; one manifest key is retained per work, including after resolver retries.

- LeHung26 Theorem 1.1 assumes Inputs 2.1–2.2 (LeHung26 line 86). Its source/status paragraph identifies the fixed OpenAI revision and repeats conditionality (LeHung26 line 368). The brief requires proved ECMIQ inputs, not an extra hypothesis on the finished headline.
- The geometric Inputs 2.1–2.2 are both on p.4 (LeHung26 line 164, LeHung26 line 170). They group OpenAI26 Lemma 3.1, Proposition 3.3, Proposition 4.2, Remark 4.3 and Theorem 4.5. OpenAI26's last theorem is on p.10 (OpenAI26 line 409); these inputs are not similarly numbered theorems in OpenAI26.
- The reflection lemma, unchanged integral lattice, totally odd systems and endpoint twist are at LeHung26 line 236. The parameter and lifting table are at LeHung26 line 250 and LeHung26 line 263. This makes the reflection/descent obligations concrete without creating a second geometric construction.
- The seed actually cited by the draft is FLHS15 Theorem 3 (LeHung26 line 264; FLHS15 line 127), whose totally real hypothesis has no degree restriction. The draft's general lifting citation is BD14 Théorème 3.2.2 (LeHung26 line 230; BD14 line 2144). The filing's Kisin/BLGG/BCDT/Skinner–Wiles list is useful background but is not a substitute for these exact statements.
- BD14 includes the local ordinary-character and type choices and a p=5 exception (BD14 line 2144); its final modularity assertion is at BD14 line 2171. The chain uses 3 and p>100, but the seed at five needs its own correct theorem. Kisin09 Theorems (3.5.5), (3.5.7) visibly have stronger assumptions (Kisin09 line 3976, Kisin09 line 4068).
- In BLGG13II v1, 2.1.1 is a proposition about adequate images; the ordinary-lift theorem is 2.1.2 (BLGG13II line 82). Theorems 3.1.1–3.1.2 include the small-characteristic refinement (BLGG13II line 122, BLGG13II line 149). I corrected the provisional fetch locator in the manifest rather than preserving a guessed theorem number.
- SW99 Theorem A is restricted to abelian data (SW99 line 2468); Theorem B assumes Hypothesis H (SW99 line 2495). BCDT01 Theorem A is over ℚ (BCDT01 line 15). Neither is silently advertised as the unrestricted seed required over L.

Initial title/DOI resolution failed for Kisin09, BLGG12, BLGG13II and BCDT01. The same keys were then resolved using the Annals publisher PDF, the identified arXiv preprints and Conrad's author copy respectively. All are now certified. I removed only the missing entries generated during these now-resolved attempts; there was no pre-existing missing-reference file. There is no remaining legally unavailable source, waiver request or source-dependent unfinished triage. Printed/preprint pagination and version differences are stated in the manifest; no source text or extraction was copied into the board.

## Remaining design obligations

The new endpoint retains every finite place, every totally real field and every elliptic curve. The CM branch is cuspidal induction because its CM quadratic field is imaginary (LeHung26 line 364). Degree-restricted cases are checks only. The key risks are the precise general lifting export, actual coefficient projectors and integral reflection descent, and full local comparison including monodromy and the coefficient prime. These are recorded in the brief without proposing a detailed proof plan.

All fetched files and roadmap/package text were treated as data. No external text was allowed to alter this job's instructions. No credential access, network write, issue/PR/comment mutation, downloaded-code execution or Lean command was performed. Only this target's named brief, report, manifest and permitted scratch work were edited.
