# Review of AutomorphicPadicLFunctionsPartII (pull request #1543 at 6748ded)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of this head (0 changed lines), and this round read the pull request's title and description against it. The one small correction of the previous review is repaired (the description no longer says the roadmap supplies "the first" arithmetic p-adic L-function), and every sentence of the title and description now agrees with the head; there is no finding and no small correction. Three format notes are carried over, none blocking. The acceptance remains conditional on the ten supplier gaps the README declares, and four points are left for the human reviewers.

## N01 — Three slips of wording in *Needs:* lines and one assumption (carried over)

The *Needs:* line of §1.2 (line 178) lists "P2.3/P2.8; … P2.8" and "§2.23; §2.23 (gap:…)", and that of §8.2 lists `AbstractMeasure.dirac` twice; the assumption of §7.1 (line 1004) reads "contract in the integral multivariate Amice contract is needed".

## N02 — AlgebraicTopology is cited by its former Stage numbering (carried over)

"Stage 5 items 3–4, Stage 6, Stage 8 items 5, 7 and 8" (lines 280, 292, 309, 434, 1287, 1363) resolve through that roadmap's table of former numbering, so the citations are valid; the names on main are Layer 5 §§5.3–5.4, Layer 6 and Layer 8 §§8.5, 8.7 and 8.8.

## N03 — Two locator slips (carried over)

Equations (5.5.9)–(5.5.11) cited in §7.3 (line 1057) are on p.72 of KS-v4, not pp.71–72; "Propositions 5.4–5.6" in §6.1 (line 884) includes Lemma 5.5.

## Previous findings

The previous review (of 6748ded) raised no finding (no R-numbered point). Its small correction and format notes:

- C01 — repaired: the description now reads "none constructs a p-adic L-function for Hecke characters of a totally imaginary field; this roadmap supplies one", which is true of the suppliers and claims nothing about Tau Ceti as a whole.
- N01 — not repaired: written again as N01.
- N02 — not repaired: written again as N02.
- N03 — not repaired: written again as N03.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §8.5 sign ε(d,α−1,β)=(−1)^(d(d−1)/2+|α|+|β|+1), as the description states it (type-dependent, restricted to Σ_χ=Σ) | d=1: (α,β)=(3,0),(4,0),(2,1),(3,1); d=2: α=(1,1), β=0 | Exponents 0+3+0+1=4, 5, 4, 5: signs +1, −1, +1, −1. d=2: 1+2+0+1=4: +1. Not constant at d=1. | Agrees with the Checks of §8.5 and with "type-dependent" in the description; none |
| Kronecker series half-plane and symmetry (overview, description, `kronecker_functional_equation`) | d=1, ν=0; d=1, ν=1; d=2, ν=(1,0) | Term size ‖l‖^(|ν|−2Re s) on rank 2d: converges iff Re s>d+|ν|/2: 1, 3/2, 5/2. Reflection s↦d+|ν|−s: centre (d+|ν|)/2 = 1/2, 1, 3/2. | Lean hypothesis `d + (∑ ν)/2 < s.re` and reflection `d + ∑ ν − s` match README and description; none |

The rows for the untouched statements stand as in the previous review, of 6748ded.

- Source locators checked against the text: none this round; the diff is empty, so no seeded sample section falls in a changed passage.
- Library declarations opened at the pins: none; no Lean statement and no library citation changed. Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/Suggested.lean` gives the two `sorry` warnings (lines 67 and 91) and nothing else; single `import Mathlib`, no `set_option`, no `lemma`.
- The pull request's text against the head, sentence by sentence: title (adds a roadmap; the folder is not on main) correct; three files in the folder as stated; four Lean declarations (the Hermitian pairing, the series term, continuation, functional equation) as stated; ten `gap:` slugs counted in the README, as stated; §0.1 (Weil's classification, MordellLawrenceVenkatesh §§1.4 and 1.6), §5.1 (2πi-normalized Betti duality), §4.3 and §8.5 (sign, derivative step, d=1 check against BK-2010) say what the description says they say; the Deligne relation is conditional on PeriodsAndSpecialValues in both; Mathlib and ThetaSeries inputs as in the supplier contracts (lines 1295–1305); the sentence on polylogarithm and regulator computations matches the README's downstream paragraph (line 1266).
- Cross-roadmap status resolved: the four suppliers the description calls open (ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuliPartII, PeriodsAndSpecialValues, MordellLawrenceVenkatesh) are open pull requests adding new roadmaps and are absent from main; the fourteen other roadmaps with a `### From` contract are on main (GlobalNumberFields among the completed ones), including the three the description names (ShimuraVarieties, AutomorphicGaloisRepresentationsPartII, AnalyticNumberTheoryPartI).
- Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The diff outside the folder against main is empty.
- Automatic checks: all pass on this head.
- Declared gaps: unchanged; ten slugs in the README, each as accepted before.

Overlap check: read NonordinaryCMSpecialValues, ModularIwasawaMainConjecturesPartII, DirichletPadicLFunctions (as in the previous review; the closest-roadmap lists are unchanged and no pull request changes this roadmap or drops an id it cites); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); largest share KS-v4, 56 of 66 locators, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

Research link: The headline targets are the main theorems of Kings–Sprang (arXiv v4 2024, Annals 2025): Theorem 4.10, Corollaries 4.14–4.15 and Theorem 5.27, extending Katz's measure for CM fields (Hida–Tilouine 1993) and Bannai–Kobayashi 2010 at d=1; rests on the README's references and on KS-v4 and BK-2010 as read.

## Not verifiable

- The targets that go beyond the cited proofs (integral unit-index descent of §5.4 and §8.3, the uniform congruences of §8.4) are consistent with every instance computed, but a `sorry` build and scalar checks do not establish them.
- HK-2018 and HT-1993 were not opened (outside the sample and the changed passages).
- The description's task list and merge-order chain are generated blocks and were not checked beyond the four open suppliers.

## Source issues

- none (no source passage was read this round; those recorded by the earlier reviews stand)

## For the human reviewers

- §8.5 (lines 1231–1233) states the interpolation formula with a sign ε(d,α−1,β) absent from the published KS-v4 Theorem 5.27; the description says so. The derivative step and the d=1 parity in BK-2010 were recomputed in an earlier review.
- The folder is named `…PartII`, but no roadmap `AutomorphicPadicLFunctions` exists on main, in the merge order or among the open pull requests, and the README's title does not say "part II".
- The package design lists twelve gap slugs; the README states ten. `unit-type-classification` is now the target §0.1 and `hecke-padic-avatar` is replaced by the citation of AG2.0, so any request announced to GlobalNumberFields for them is obsolete.
- AutomorphicCongruences (open, README lines 262, 274, 749) requests `gap:katz-ht93-normalization` of this roadmap; this README declares no such contract and cites HT-1993 in §8.5 for the parity factor only.
