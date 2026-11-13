# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (pull request #2268 at 9210046)

**Verdict:** accepted

No finding. Incremental re-review of the 18 lines changed since `16b8147`.

## Previous findings

- R01 — repaired: “Define a subgroup H ⊂ GSp₄(k) to satisfy the reasonableness conditions if (a) … (b) …”; “GSp₄-reasonableness (5.2) is owned here.” Both Lemma 3.20 bullets are back; the slug `near-adequacy-reasonableness` has 0 matches in the folder.

## Verified sound

| Statement | Instances tried | Computed value | Required or competing value | Result / change |
|---|---|---|---|---|
| 5.2 definition, conditions (a), (b) against WHI22 Definitions 3.15, 3.19 | H = Sp₄(𝔽₃); H in the diagonal torus; p = 2 | Sp₄(𝔽₃): 𝔰𝔭₄^∨ simple of dimension 10, H⁰ = 0, trace form 2(xx′+yy′) with 2 ≠ 0. Torus: H⁰ ⊇ dual Cartan, dimension 2 | Source: 1a and 2 for large n, H¹ = 0 only when ζ_p is in the field cut out (WHI22 lines 1064–1068) | Agrees; torus excluded by (a); p = 2 excluded by p ≥ 3 |
| 5.2 API: H¹(ρ̄(G_{F(ζ_p)}), k) = 0 ⇒ H_n independent of n | H_1 = Sp₄(𝔽₃) (perfect); H_1 = (SL₂(𝔽₅)×SL₂(𝔽₅))⋊C₂, p = 5; H_1 = SL₂(𝔽₃), p = 3 | Hom(H_1, ℤ/p) = 0, 0, ℤ/3 respectively; index [H_1 : H_n] = 1, 1, possibly 3 | H_n ◁ H_1 of p-power index, so a proper H_n needs Hom(H_1, ℤ/p) ≠ 0 (WHI22 lines 1073–1077) | Hypothesis is exactly the one needed |
| 5.2 API: adequate H_1 with H¹(H_1, k) = 0 ⇒ reasonable | Conditions of Definition 3.15 against Definition 3.19 with H_n = H_1 | Adequate gives 1a, 1b, 1c, 2; reasonable asks 1a, 2 and 1c conditionally: 3 of the 4 | 1b is the stated H¹(·, k) hypothesis, already inside adequacy | True; matches the “in particular” of Lemma 3.20 |
| Ownership of GSp₄-reasonableness | All READMEs on main and at open heads, by object (“reasonab”) and by slug | Definitions: 1 (this §5.2). Consumers citing §5.2: PR #1746 lines 381, 933; PR #1817 lines 177, 179, 1573. ArithmeticGaloisRepresentations: 0 matches | One owner, earlier than both consumers | Single owner |
| Declared gaps, README against plan | Slugs in `README.md`; slugs in `design/plan.json` | 9 and 9, the same nine | Equal sets | Agrees |
| Downstream line for AbelianSurfacesModularity (“consumes 5.2 … directly”) | PR #1746 at b20dcf8 | Two `*Needs:*` lines name §5.2 (lines 381, 933) | A direct citation exists | Agrees |

Rows for untouched statements stand as in the previous review, of `16b8147`.

- Source locators checked in the changed passages: 3 (WHI22 Definition 3.15 lines 985–994, Definition 3.19 lines 1064–1068, Lemma 3.20 lines 1073–1077). No seeded target lies in a changed passage; 5.4 uses the term defined in 5.2, whose conditions the diff leaves as they were.
- Cross-roadmap citations resolved at current heads: ArithmeticGaloisRepresentations §§7.5, 7.9, 7.11 (headings present at its open head), AbelianSurfacesModularity (PR #1746 at b20dcf8), GSp4NonregularModularityLifting (PR #1817 at 11b3de3).
- Library declarations: the diff adds or changes none; `Suggested.lean` has 0 declarations, so 0 binder checks and 0 one-tactic probes apply; the seven headlines remain named in its docstring with the carriers they lack.
- Gate at this head: every check 0, `OK`; the targeted build passes. `lake env lean` on `Suggested.lean`: exit 0, no output. 0 files changed outside the folder.
- Dependency check output: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`.
- Pull-request text: title and all paragraphs agree with the head; the third paragraph's ownership sentence now matches §5.2 and line 755.
- Remark: in the adequacy bullet the hypothesis H¹(ρ̄(G_{F(ζ_p)}), k) = 0 is part of adequacy (condition 1b); the statement is true as written.

Overlap check: read PotentialAutomorphyInfrastructurePartII, GSp4NonregularModularityLifting, AbelianSurfacesModularity, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructure and GlobalGaloisDeformations (the main-vocabulary list is empty). GSp₄-reasonableness with Whitmore's Lemma 3.20: owner this roadmap's §5.2, cited by the two consumers; other shared objects as in the previous reviews, nothing new shared.

Source independence: changed passages only; 3 passages compared with 1 source (WHI22), none shared beyond the forced list of conditions; largest share BCGP25, unchanged from the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- §3.2(b)'s inputs (★) and (C) remain unproved in the sources and are kept as targets, with §4.8 conditional on the bound; unchanged by this head.

## Source issues

- none

## For the human reviewers

- none
