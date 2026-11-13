# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (pull request #2268 at 16b8147)

**Verdict:** needs changes

## R01 (P2) — Reasonableness is now handed in a circle: own it in §5.2

**Location:** `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:81`, “What ArithmeticGaloisRepresentations must provide (gap:near-adequacy-reasonableness, §7.9)”; also lines 12, 18, 586, 603, 679 and the deleted API bullets of §5.2.
**Claim:** The repair of the earlier R01 hands the definition, the stabilization H_n = H_1 and the adequacy implication to ArithmeticGaloisRepresentations, while the roadmap that formerly declared that gap now takes exactly these from §5.2 here. No roadmap states them, and no plan declares the slug.
**Witness:** PR #1746 at b20dcf8, `TauCetiRoadmap/AbelianSurfacesModularity/README.md:136`: “Consume §5.2 … If H¹(H_1,k)=0, the groups H_n equal H_1”; its gap is gone. ArithmeticGaloisRepresentations §7.9 (PR #856): 0 matches for “reasonab”. `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/plan.json`: slug absent.
**Repair:** Make §5.2 the owner again, as both consumers (PR #1746 line 136; PR #1817, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:179` and 1573) cite it:
- line 12: “… GSp₄-reasonable residual representations and their Taylor–Wiles places, …” and close with “GSp₄-reasonableness (5.2) is owned here.”;
- line 18: delete the sentence “The shared contract gap:near-adequacy-reasonableness … symplectic refinements.”;
- delete line 81;
- line 586: “Define a subgroup H ⊂ GSp₄(k) to satisfy the reasonableness conditions if (a) … ; and ρ̄ to be GSp₄-reasonable if …” (no supplier clause);
- restore the two API bullets: “If `H¹(ρ̄(G_{F(ζ_p)}), k) = 0` the groups H_n are independent of n, so the conditions can be checked on H_1 (WHI22 Lemma 3.20).” and “If `H¹(ρ̄(G_{F(ζ_p)}), k) = 0` and `ρ̄(G_{F(ζ_p)})` is GSp₄-adequate (WHI22 Definition 3.15), ρ̄ is GSp₄-reasonable.”;
- lines 603 and 679: drop “(gap:near-adequacy-reasonableness)” and “near-adequacy-reasonableness,”;
- `Suggested.lean:40`: “`GSp₄`-reasonableness” in place of “the symplectic refinements of `GSp₄`-reasonableness”;
- pull-request description, third paragraph, first two sentences: “GSp₄-reasonableness, with Whitmore’s Lemma 3.20, is owned by §5.2; AbelianSurfacesModularity and GSp4NonregularModularityLifting consume it from there.”

Tested: with these lines the two consumer citations resolve to stated content, ArithmeticGaloisRepresentations §§7.5, 7.9, 7.11 are cited only for what PR #856 states, and the nine slugs of the plan again equal the README's.

## Previous findings

- R01 — not repaired: “The shared contract gap:near-adequacy-reasonableness on §7.9 supplies Whitmore’s general reasonableness condition and Lemma 3.20”. The other party to the “shared” contract withdrew it at b20dcf8 and cites §5.2; see R01 above.
- R02 — repaired: “by 6.2 every component of Supp M^χ_∞ has dimension D = dim S_∞ … This selected component also has dimension D by 6.2, so the support component equals it”; §9.6 is cited nowhere (0 matches).
- R03 — repaired: “(1.4, third Check)” and “(2.2(1), Check on the zero ordinary module)”; they are the third of four and the fifth of six Checks, at lines 219 and 282.

## Verified sound

| Statement | Instances tried | Computed value | Required or competing value | Result / change |
|---|---|---|---|---|
| 5.2 ownership of reasonableness | Consumers of §5.2 for Lemma 3.20; declarers of the gap; ArithmeticGaloisRepresentations §7.9 at PR #856 | 2 consumers (PR #1746 line 136, PR #1817 line 179); 0 plans or READMEs declare the slug besides this README; 0 matches in §7.9 | One owner, stated where cited: needs 1 statement, finds 0 | R01 |
| 5.2 stabilization (WHI22 Lemma 3.20) | p = 3: H_1 = Sp₄(𝔽₃), perfect; H_1 with a quotient ℤ/3 | Perfect: no map onto ℤ/3, index [H_1 : H_n] = 3⁰ = 1. With a ℤ/3 quotient: H¹(H_1, k) ≠ 0, H_2 may have index 3 | Lemma needs H¹(H_1, k) = 0 exactly | Statement right; must be stated in §5.2 (R01) |
| 5.2 contract wording against WHI22 Definitions 3.15, 3.19 | Conditions listed at README line 81 versus WHI22 lines 985–994, 1064–1068 | README: H⁰ = 0, detection, conditional H¹ = 0; source: 1a, 2, conditional H¹ = 0 | H¹(H, k) = 0 (1b) and unconditional 1c belong to adequacy only | Agrees; the line is deleted by R01 |
| 6.3(iii) support component equals selected component | R = O⟦x,y⟧/(ϖx,ϖy), M = O; strict inclusion V(x) ⊂ Spec O⟦x⟧ | D = 1; support component Spec O, dim 1; selected quotient O, dim 1: equal. V(x) has dim 1 < 2 | Closed irreducible W ⊂ irreducible C with dim W = dim C forces W = C | Sound; ambient dim R = 2 no longer used |
| 6.3(iii) containment in the selected component | Z on exactly one component above p (6.3(ii)); B = O⟦x,y⟧/(xy), point x = 0, y = ϖ versus origin | One component through the point; two through the origin | A component of Supp M^χ_∞ through Z has p-factor the unique component through Z | Uniqueness from (ii) is what the step uses |
| 6.3 citation of DeformationAndDerivedPatchingAlgebra §6.1 | Finite M over Noetherian R; M = 0 | Finite: full support ⇔ ann ⊂ √0 ⇔ every minimal prime in support; M = 0: support empty | §6.1 at PR #1034 states this for finite modules | Citation resolves |
| Correction locators | §1.4 Checks 1–4; §2.2 Checks 1–6 | Induced example is index 3; zero-module example is index 5 | Text now says “third Check” and names the zero-module Check | Agrees |

Rows for untouched statements stand as in the previous review, of `7bc4293`.

- Source locators checked in the changed passages: 4 (WHI22 Definition 3.15 lines 985–994, Definition 3.19 lines 1064–1068, Lemma 3.20 lines 1073–1077; BCGP25 Theorem 6.3.4 proof lines 6728–6736). Seeded targets falling in the change: 6.3 only; BCGP25 supports the support-and-dimension step as restated.
- Cross-roadmap citations resolved at current heads: ArithmeticGaloisRepresentations §§7.9, 7.11 (PR #856), DeformationAndDerivedPatchingAlgebra §§6.1, 6.5, 9.6 (PR #1034), AbelianSurfacesModularity (PR #1746 at b20dcf8), GSp4NonregularModularityLifting (PR #1817 at 11b3de3).
- Library declarations: none added or changed by the diff; `Suggested.lean` has 0 declarations, so 0 binder checks and 0 one-tactic probes apply; the seven headlines remain named in its docstring with their missing carriers.
- Gate at this head: all 29 checks 0, `OK`; build passes. `lake env lean` on `Suggested.lean`: exit 0, no output. 0 files changed outside the folder.
- Dependency check output: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`.
- Pull-request text: title and paragraphs 1, 2, 4, 5 agree with the head; paragraph 3's §6.3 sentence agrees with the head; its reasonableness sentences are covered by R01.
- Declared gaps: the nine of the plan are unchanged by the diff; the tenth slug in the README is R01.
- The source issues of the review of `7bc4293` stand; the change adds none.

Overlap check: read PotentialAutomorphyInfrastructurePartII, AbelianSurfacesModularity, GSp4NonregularModularityLifting, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructure and GlobalGaloisDeformations (the main-vocabulary list is empty). Owners as in the previous review, except GSp₄-reasonableness with Whitmore's Lemma 3.20: AbelianSurfacesModularity and GSp4NonregularModularityLifting assign it to this roadmap's §5.2, this head assigns it to ArithmeticGaloisRepresentations, which does not state it (R01).

Source independence: changed passages only; 3 passages compared with 2 sources (WHI22, BCGP25), none shared beyond forced hypothesis lists; largest share BCGP25, unchanged from the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- §3.2(b)'s inputs (★) and (C) remain unproved in the sources and are kept as targets, with §4.8 conditional on the bound; unchanged by this head.

## Source issues

- none

## For the human reviewers

- none
