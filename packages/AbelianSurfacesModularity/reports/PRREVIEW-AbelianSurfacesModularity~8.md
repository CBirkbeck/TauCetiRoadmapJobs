# Review of AbelianSurfacesModularity (pull request #1746 at 081ea3d)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 30 lines changed since `cfb92db`: the three stale supplier pointers and the re-derived near-adequacy comparison of the previous report are repaired, each new citation (GL2ModularityLifting §1.7, OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3, EllipticCurveModularityPartIIGL2TypeAbelianVarieties §3.6) was opened at the supplier's head and states what is consumed, and the title and description agree with this head. One small correction (two references left dangling by the repair) and one format note (carried over), neither blocking. For the humans: the main source is an arXiv preprint, and the README departs from it in two verified places.

## C01 — Two references in the supplier contracts lost their antecedent in the repair

A reader of the contracts cannot tell which section or which extensions are meant.

- In the contract for OrdinaryAutomorphicFormsAndModularityLiftingPartII (line 1166): "Consume §1.3 … over a finite field containing the eigenvalues; §2.5 extends it to any field of characteristic two." Inside that supplier's subsection "§2.5" reads as the supplier's section, and its Layer 2 has only §§2.1–2.3; the section meant is §2.5 of this roadmap. "§2.5 above extends it" would say so.
- In the contract for PotentialAutomorphyInfrastructurePartII (line 1146): "Consume PL.0, Soluble base change and descent of automorphy, for the corresponding automorphic comparisons." The sentence it corresponded to (the solvable extensions with prescribed completions) now stands in the GL2ModularityLifting subsection. "for the automorphic comparisons along the solvable extensions of GL2ModularityLifting §1.7" would restore the reference.

## N01 — Four Mathlib line numbers point one line above the declaration

Carried over unchanged (Mathlib contract, lines 1064 and 1066): `Matrix.J` is at line 59 and `Matrix.symplecticGroup` at line 102 of `Mathlib/LinearAlgebra/SymplecticGroup.lean`; `alternatingGroup` is at line 73 and `card_alternatingGroup` at line 137 of `Mathlib/GroupTheory/SpecificGroups/Alternating.lean`.

## Previous findings

- No R-numbered finding: the review of `cfb92db` accepted with two small corrections and one format note, accounted for here.
- C01 (three supplier pointers) — repaired: §3.1, §3.2 and the contract now cite "GL2ModularityLifting §1.7, Soluble extensions with prescribed completions"; §0.3 keeps only AL.2 Global Godement–Jacquet theory; §7.3 cites "§3.6, Modularity of abelian varieties of GL₂-type". The repair left two dangling references (C01 above).
- C02 (near adequacy re-derived) — repaired: §2.5 route, scope paragraph and contracts now cite "OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3" and keep here only the scalar extension to the original characteristic-two field.
- N01 (Mathlib line numbers) — not repaired: "(lines 58 and 101)", "(line 72)", "(line 136)"; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.5 near adequacy of A₅(b), now by supplier §1.3 | 𝔽₂ → 𝔽₁₆ → k; H = 1 in rank 2 | orders 3, 5 have eigenvalues in 𝔽₄, 𝔽₁₆, so 𝔽₁₆ is finite and suffices; dim ad = 16; H = 1: U = ad⁰, dim 3 ≠ 0 | §1.3 hypothesis (finite k containing eigenvalues) met; trivial group fails on both sides | citation only |
| §3.1 solvable totally real extension, now GL2ModularityLifting §1.7 | E_v = ℝ at real places; D = field of ϱ̄; χ_v of 2-power order | E totally real; D/F Galois with group A₅, disjointness keeps image of order 60; E_v = cyclic 2-power field of χ_v kills χ_v | §1.7 gives soluble Galois E disjoint from D with every E_w ≅ E_v: exactly what is used | citation only |
| §3.1 statement against source (seeded sample) | BCGP25 Lemma 8.3.1, line 8508 | hypotheses (1) image S₅(b) or A₅(b), (2) conjugations of order 2 in A₅(b); conclusion ρ̄(G_E) = ρ̄(G_E⁺) = A₅(b), ordinary RACSDC π on GL₄ | Same as README | none |
| §7.3 GL₂-type input, now supplier §3.6 (seeded sample) | ℚ-simple GL₂-type surface; count | [K_f:ℚ] = 2 = dim A; ∏ over 2 embeddings of a quadratic has degree 4 = 2·dim A; 34 − 2 = 32; BCGP25 Theorem 10.2.1 at line 9790 | §3.6 states modularity over ℚ with coefficient-field systems, as consumed | citation only |
| §0.3 Needs after removing the paired-products pointer | Remaining AL.2 citation | Entire continuation and Λ(s) = ±Λ(2−s) use only Global Godement–Jacquet theory (AL.2.4), still cited | No input lost | citation only |

The rows for the untouched statements stand as in the previous review, of `cfb92db`.

- Source locators checked against the text: 4 in BCGP25 (Lemma 8.3.1 line 8508; Theorem 10.2.1 line 9790; Lemma 5.3.1 and Definition 5.3.3 near lines 5402–5425, as cited by supplier §1.3).
- Library declarations opened at the pin: 4 in Mathlib (N01).
- Cross-roadmap citations resolved at the open heads: GL2ModularityLifting §1.7; OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3 and §5.2, and its Layer 2 headings; EllipticCurveModularityPartIIGL2TypeAbelianVarieties §3.6; PotentialAutomorphyInfrastructurePartII §0.9, §5.2, §5.4 through its table of earlier identifiers (PL.0/soluble-descent, PL.4/strongly-residually-odd, PL.4/relaxed-adequacy). No remaining occurrence of the three pointers of the earlier C01.
- Supplier order: GL2ModularityLifting, the one supplier added, is earlier in the merge order. Dependency output: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks rerun at this head: every check 0, `OK`. Outside the folder: 0 files changed against the base. Declared gaps: unchanged by the diff.
- Elaboration of `Suggested.lean`: exit 0, no output; 0 declarations, so no signature comparison and no one-tactic probe applies. Headlines: unchanged, none statable at the pins, each named in the module docstring.
- Pull request text: title, summary block and four prose paragraphs read against the head. It says the pull request adds the roadmap (1301 lines added, nothing on main), that `Suggested.lean` has no declarations, that the topic is `math.NT`, and names GL2ModularityLifting §1.7 and OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3 and §5.2 as this head has them; no sentence is contradicted and no supplier change is left unstated.

Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, ModularityAndLanglandsExtensions, ModularityAndLanglandsExtensionsPartII, EllipticCurveModularityImaginaryQuadratic, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, LocalGaloisDeformationRings as in the previous review (the third list is empty), and at this head OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3 again; the near-adequacy/relaxed-adequacy comparison is owned by that §1.3 and is now cited, not restated; nothing else shared.

Source independence: changed passages only; 4 passages compared with 1 source (BCGP25), none shared; largest share BCGP25, 82 of 96 locator groups as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layer 6 states Theorems A and B and Theorems 9.5.1–9.5.5 of Boxer–Calegari–Gee–Pilloni (2025), Layer 7 their Theorem 10.2.1 with the Galois types of Fité–Kedlaya–Rotger–Sutherland (2012), Layer 9 their Theorem 10.3.9; it builds on their 2021 potential modularity paper. Rests on the sources read.

## Not verifiable

- KIS99, THORNE17 and FC90 locators: settled as uncertified; no text. None lies in a changed passage.
- The items listed as not verifiable in the review of `cfb92db` (columns of BCGP25 Table 6.4.4; projective classes of the explicit curves) are in untouched text and were not reopened.

## Source issues

- none new in the changed passages; the five issues in BCGP25 recorded by the review of `cfb92db` stand.

## For the human reviewers

- Scope: the source with 82 of 96 locator groups, BCGP25, is cited as arXiv v1 (2025), a preprint; the README's References give no journal publication for it.
- Scope: in §4.6 and §4.7 the README departs from BCGP25 (an added hypothesis in Lemma 9.2.13; a coupled-period construction replacing the proof of Lemma 9.2.14). Both departures were checked by computation in the review of `cfb92db`; no refereed source states them.
