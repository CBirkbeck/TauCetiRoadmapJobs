# Review of ArithmeticGaloisDuality (pull request #3177 at 5a08539)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 34 changed lines since `7e8e228`. The change is two passages of the README: three sentences added to Conventions, *Cohomology*, and the corollary *Cocycle form* of the Greenberg–Wiles formula in §R02.5.1 with its two Checks; both were recomputed, together with the ProfiniteCohomology target and conventions they cite, as this pull request writes them. The corollary follows from the formula and the cocycle counts exactly as displayed, its Check at `F = ℚ`, `M = 𝔽_p` gives `1/p` on both sides, and the description states the change correctly. Accepted with no finding and no small correction; one format note, and nothing left for a human to decide.

## N01 — The Dependencies list of Layer R02.5 (line 6401) does not name ProfiniteCohomology, which the new *Needs:* line of *Cocycle form* (line 6252) cites at §2.1; adding "TauCetiRoadmap ProfiniteCohomology: Layer 2" there would keep the layer's list equal to what its targets need.

## Previous findings

- The previous review of this folder read another pull request (#3027 at `7633b39`) and had no finding and no small correction. Its one format note concerned the page given for Milne's Theorem I.4.10 (a) in §D7.6a; that section is added by #3027 and is not in this head, so the note does not apply here.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| *Cocycle form*, derivation (lines 6234–6253) | general finite `M` | `#Z¹_L/#Z¹_{L^⊥} = (#H¹_L/#H¹_{L^⊥}) · (#M/#H⁰(F,M)) · (#H⁰(F,M^*)/#M^*)` `= ∏_v #L_v/#H⁰(G_v,M)` by the formula | `∏_v #𝓛_v/#M = ∏_v (#L_v · #M/#H⁰(G_v,M))/#M` | equal; the global `H⁰` factors cancel |
| *Cocycle form*, the two counts | `W ⊇ B¹`, `#B¹ = #M/#H⁰` | `#𝓛_v = #L_v · #B¹(G_v,M)`; `#Z¹_L = #H¹_L · #B¹(G_F,M)` | ProfiniteCohomology §2.1: `card W = card π(W) · card B¹`, `card B¹ · card H⁰ = card M` | agree |
| *Cocycle form*, "all but finitely many factors are `1`" | finite `v`, `M` unramified, `L_v` unramified | `#L_v = #H⁰(G_v, M)`, so `#𝓛_v = #M` | factor `#𝓛_v/#M = 1` | holds |
| *Cocycle form*, a complex place | `G_v = 1` | `Z¹ = 0`, `#𝓛_v = 1`, factor `1/#M` | class form: `#L_v/#H⁰ = 1/#M` | agree |
| First Check | `F = ℚ`, `M = 𝔽_p`, `p` odd, `L_v` unramified, `L_∞ = 0` | `Z¹_L = B¹(G_ℚ, 𝔽_p) = 0`; `Z¹_{L^⊥} = B¹(G_ℚ, μ_p)`, order `p/#μ_p(ℚ) = p`; left `1/p` | finite `v`: `#𝓛_v = p·p/p = p`, factor `1`; `𝓛_∞ = B¹(G_ℝ, 𝔽_p) = 0`, factor `1/p` | `1/p = 1/p` |
| Same Check, `p = 3`, against the class form | as above | class form: left `1/1`, right `(3/1)·(1/3) = 1`; cocycle form: `1/3 = 1/3` | ratio of the two forms on each side: `#H⁰(ℚ, μ_3)/#H⁰(ℚ, 𝔽_3) = 1/3` | consistent with the second Check of the formula |
| Second Check | `M = 0` | `Z¹ = 0`, every order `1` | every factor `1/1` | holds |
| ProfiniteCohomology §2.1 Check cited by the corollary | `C₂` by sign on `ℤ/3` | `Z¹ = B¹`, 3 elements; `H⁰ = 0`, `H¹ = 0` | `3 · 1 = 1 · 3` | holds |
| Conventions: `hⁱ` is `Module.finrank k` of the same object | §R02.5.1 *Greenberg–Wiles dimensions* | "Write `hⁱ` for `Module.finrank k` of the corresponding cohomology" | the added sentence | agree |
| Conventions: counts are of classes | whole README searched for counts of cocycles | only the new *Cocycle form* counts cocycles, as a corollary | ProfiniteCohomology Conventions, *Counting* | no contradiction |

- Source locators checked against the text: 0; the changed passages add none. The three cached texts (MilneADT, Lim2012, KolsterMovahhedi2000) were searched for a count of Selmer cocycles: none.
- Library declarations opened at the pin: Mathlib `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`); Tau Ceti `H1pi` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:834`), `restrictScalarsIntIso` and `ofDiscreteModuleRestrictScalarsIntEquiv` (`.../ContCohomology/RestrictScalars.lean:304`, `:656`).
- Cross-roadmap citations resolved at this head: ProfiniteCohomology Conventions *Coefficient rings* and *Counting*, ProfiniteCohomology §2.1 *Cocycle counts from class counts*, ProfiniteCohomology Layer 2 (all in this pull request's own ProfiniteCohomology text, a roadmap on `main`).
- Record of layers: 8 layers at the merge base, the same 8 ids and titles at the head; no heading removed or added; `Suggested.lean` unchanged.
- Changes outside the folder: only the pull request's own folders ClassFieldTheory, ProfiniteCohomology and SelmerIwasawaCohomology.
- Dependency check: `depcheck: 100 roadmaps, 1133 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check of the worker's run passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and no other message. The file is unchanged, so no one-tactic probe and no `#check` comparison was run again.

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems (main), GlobalGaloisDeformationsPartII, CohomologyOfGroups (open), and ShortGRH's IdelicReciprocityCountsAndCyclotomicClassGroups 4.5 (open), which counts Selmer cocycles by an inequality of its own and cites §R02.5.1; nothing shared. SelmerIwasawaCohomology 2A.2, EulerSystemsAndKolyvaginSystems and GlobalGaloisDeformationsPartII cite the Greenberg–Wiles formula of §R02.5.1, whose statement is unchanged. The other open pull request that changes this roadmap (#3027, adding §D7.6a) merges cleanly with this one and touches neither passage.

Source independence: 2 passages compared (changed passages only) with 3 sources, none shared: the added text cites no source and none of the cached texts counts cocycles; largest share MilneADT, at least 45 of the README's locators; contents not compared, since the change adds, removes and reorders no layer.

Research link: The Greenberg–Wiles formula (Darmon–Diamond–Taylor, Theorems 2.18–2.19) is the Selmer-group count behind Taylor–Wiles and Khare–Wintenberger patching, derived from Poitou–Tate duality (Milne 2006; Lim 2012); the added corollary restates it for cocycles. Rests on the README's summary and §R02.5.1.

## Not verifiable

- Darmon–Diamond–Taylor, Theorems 2.18 and 2.19, the source of the untouched formula the corollary is derived from: not opened this round; the corollary was checked against the formula as the README states it and against its computed Checks.

## Source issues

- none

## For the human reviewers

- none
