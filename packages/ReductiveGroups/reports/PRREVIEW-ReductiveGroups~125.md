# Review of ReductiveGroups (pull request #3027 at 18a262e)

**Verdict:** accepted

**Summary.** An incremental re-review of the 53 lines changed since `6f088b9`: accepted. The change is the merge of `main` into the branch, which brings the generated `STATUS.md` and `PROGRESS.md` of the folder to their state on `main`; `README.md` and `Suggested.lean` are unchanged, so the mathematics accepted in the previous review stands, and the statements the new status text names were recomputed and agree with the README. No finding and no small correction; one format note carried over, not blocking. One decision of the human reviewers was applied and nothing else is left for them.

## N01 — The SGA 1 locator of §7a.3 can be made exact

In the citation closing §7a.3 (line 3494), "SGA 1, Exposés I–II, for the differential criterion" still spans two exposés. The criterion the route uses is Exposé II, Corollaire 4.5 (`sga1` line 1592: for `Y` smooth, `f` is smooth at `x` exactly when `X` is smooth at `x` and the map of differentials is universally injective there). Citing it would make the locator exact.

## Previous findings

- N01 — not repaired: line 3494 still reads "SGA 1, Exposés I–II, for the differential criterion"; written again as N01 above (a format note).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Layer 9D, pseudo-reductive = reductive over a perfect field (named by the new status text) | `k` perfect; `k = 𝔽_p(t)`, `K = k(t^(1/p))`, `Res_(K/k) 𝔾_m`; `K = k` | perfect: `R_(u,k)(G)_k̄ = R_u(G_k̄)` by Galois descent, both trivial together; imperfect: dimension `p`, geometric kernel `1 + nilradical` of dimension `p − 1`, `k`-radical trivial; `𝔾_m` | holds; perfectness needed, as the README's worked example says |
| Layer 9D at the pin | the pinned `pseudoReductiveCommHopfAlgProperty_iff_reductive` | `[IsAlgClosed k]` in its signature (`PseudoReductive/Basic.lean`:139); README says "equality over an algebraically closed field" and keeps the perfect-field case as a target | README agrees with the pin |
| Layer 4, `D(M)` smooth iff `M` has no `p`-torsion (named by the new status text) | `μ_p` in characteristic `p`; `μ_n`, `p ∤ n`; `M = ℤ`; characteristic 0 | `k[x]/(x^p − 1) = k[x]/(x − 1)^p`, nonreduced; `x^n − 1` separable, étale; `𝔾_m` smooth; exponent 1, no condition | holds in both directions |

The rows of the previous review for the untouched statements stand as in that review, of `6f088b9`.

- The change since `6f088b9`: `STATUS.md` (44 lines) and `PROGRESS.md` (9 lines) only, both generated; at this head both are identical to the files on `main`. `README.md` and `Suggested.lean` are byte-identical to those the previous review read.
- The new status text against the README: its coverage block lists the 25 layer ids of the README on `main` (it was generated from that README, whose hash it records); Layers 7h and 7i, which this pull request adds, are not in it yet, as expected of a generated file. It reports a library state later than the pin (the perfect-field comparison as proved); the README states the pin's state, which is correct for the pin.
- Library declarations opened at the pin (1): Tau Ceti `pseudoReductiveCommHopfAlgProperty_iff_reductive` (`Algebra/AlgebraicGroup/PseudoReductive/Basic.lean`:139).
- Source locators checked against the text (1): SGA 1, Exposé II, Corollaire 4.5 (`sga1` line 1592), for N01. The seeded targets 1.1, 7.1, 8.1 and 8.2 lie in text the change does not touch; 7.1 was verified in the previous review.
- Changes outside the folder: every file the pull request changes lies in a roadmap folder that is the pull request's own; nothing else is changed.
- Automatic checks: all passed. Dependency check: `depcheck: 125 roadmaps, 1448 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 13 `sorry` warnings and nothing else; single `import Mathlib` followed by `TauCeti.*` modules, no `set_option`. The file is unchanged, so the signature comparison and the one-tactic probe of the previous review stand.
- The description's sentences about ReductiveGroups that were read (its new Layers 7h and 7i, §9D.1, §7.1 and the two centraliser theorems moving into its `Suggested.lean`, the sections FiniteReductiveGroups cites) agree with this head; the change since `6f088b9` alters nothing they describe.

Overlap check: read ClassicalGroupsPartII, LieHighestWeightPartII and SurfaceGroupCharacterVarieties (open), ChevalleyGroups, GroupSchemesOverABase and FlagVarieties (main), and FiniteReductiveGroups, as in the previous review; the change touches no owned object; nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; the change adds no roadmap prose (two generated files, identical to `main`), so 0 new passages were compared; the previous comparison stands (10 passages with 3 sources, none shared; largest share dudas-michel, 9 of 25 citing lines of the added text; contents independent). No layer is added, removed or reordered since `6f088b9`.

Research link: Layers 7h–7i and §§7.1, 7a.1–7a.3 are the Harish-Chandra and Gelfand–Graev theory (Steinberg 1965; Digne–Lehrer–Michel 1992; Dudas–Michel 2015) that Deligne–Lusztig 1976's character theory of finite reductive groups is built on, which DeligneLusztigTheory consumes. This rests on the README's references and dudas-michel §§7–11.

## Not verifiable

- Steinberg 1968, Theorem 8.1 (§7.1 (c)): AMS Memoir behind a paywall; Steinberg 1965, Remark 2.10, announces the result.
- Humphreys 1995 §§2.2, 2.11; Borel §9.1; Deligne–Lusztig 1976 §1; Digne–Michel 1991 Chapter 14 and 2020: publisher paywalls, marked † in the README.
- Digne–Lehrer–Michel 1992, §2 and Theorem 2.9 (§§7i.2–7i.3): publisher paywall, marked † in the README.
- Platonov–Rapinchuk–Rapinchuk 2023, §2.3.3 and Proposition 2.35 (3) (§9D.1): publisher paywall; the statement was checked by computation only.
- The seeded targets 1.1, 8.1 and 8.2 lie in untouched text the change does not affect and were not reviewed.

## Source issues

- none

## For the human reviewers

- The decision on sections leaving the RiemannHypothesisForDirichletLFunctions family was applied: the ReductiveGroups sections that FiniteReductiveGroups and OrbitMeasuresOnAdelicGroups now cite (§§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 9D.1, Layers 7h–7i) state what they are cited for.
