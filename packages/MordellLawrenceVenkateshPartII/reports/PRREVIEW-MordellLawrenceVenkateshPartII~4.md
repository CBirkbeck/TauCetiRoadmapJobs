# Review of MordellLawrenceVenkateshPartII (pull request #2461 at 460dec4)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `0351865`, and of the pull request's title and description against this head. No finding. Acceptance is conditional on the declared supplier gaps.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: README line 3516 "A correction that changes a statement or a step of a proof is fixed by an explicit instance, in its bullet or in the Checks of a section that uses it; the others correct misprints".
- R02 — repaired: description summary "each source error the proofs use is corrected, with a witness wherever the fix changes a statement or proof step."

## Verified sound

| Statement | Instances tried | Roadmap side | Source or independent side | Result |
|---|---|---|---|---|
| Source corrections preamble (README lines 3516–3518) | all 23 bullets | 19 carry an instance in the bullet or in a using section's Checks (e.g. lines 2384, 2623, 1596); 4 give only a formula | the 4 (LV Example 4, LS Definition 5.44, Lemmas A.5, A.4) are misprints: `f_k/f_(k−1)`, `F^a/F^(a+1)`, `<`, `1/(2·3^i)` | holds |
| LS Lemma A.4 bullet (README lines 3600–3601) | general `j < i`; `a₀ = 0.6`, `a₁ = 0.15`, `i = 2` | bound at index `i` is `1/(2·3^i)`: `a₂ ≤ a₁²/a₀ = 0.0375 < 1/18 ≈ 0.0556` | `a_j/a₀ < 3^(−j)` and nonincreasing ratios give `r_j < 1/3`, so `a_i < 3^(−(i−j))/(2·3^j)`; LS line 4280 prints exponent `j` | holds |
| §8.4 route, which cites the corrected denominators (README lines 2879–2887) | tail sums at `k = 1`; second moment | `Σ_(j≥1) 1/(2·3^j) = 1/4`; `2Σ_(k≥1)(2k−1)·1/(4·3^(k−1)) = Σ k²/3^k = 3/2` | `λ(1+λ)/(1−λ)³` at `λ = 1/3` is `3/2`; `(n+1)/6 ≥ 3/2` iff `n ≥ 8`; LS lines 4255–4321 | holds |
| Description, end theorems of the summary | §§6.1, 7.6, 9.3, 10.6, 10.9, 10.10 | dimension `≥ 4`; 3 off degrees divisible by an exceptional `D_j`; 2 through curves; up to `A(K)`-translation | README Summary lines 18–24 and §§10.9–10.10 say the same | holds |
| Description, "Rückert's Nullstellensatz and Mathlib's Krull intersection", "over any number field" | §3.4 | `K` a number field, `v ∣ p` unramified | README §3.4 lines 1835–1845; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing` | holds |
| Description, validation and assistance lines | build, counts, rounds | `sorry` only warning; 0 outside-folder paths; 0 dependency problems; 12 review and 2 red-team rounds | elaboration and depcheck rerun; outside-folder diff empty; 12 package review reports and 2 red-team rounds on the board | holds |
| `integralHypersurfaces_not_zariskiDense` (cited by the description; statement unchanged) | `#check @` type in the worker's signature file | quantifier order `n₀, n, D₀, d, S, G`; `G ≠ 0`, homogeneous | README §9.3 and the module docstring agree | holds |

The rows for untouched statements stand as in the previous review, of `0351865`.

- Source locators checked against the text: 2 (LS line 4280, exponent `j` printed where `i` is needed; LS line 4303, the reversed comparison).
- Changed passages: 2 (the preamble and the Lemma A.4 bullet); no statement, heading, supplier citation or Lean declaration changed, and no seeded sample target falls in them.
- Gate at 460dec4: every check passed (the worker's run, with the targeted build).
- Elaboration rerun: one warning, `sorry` at `TauCetiRoadmap/MordellLawrenceVenkateshPartII/Suggested.lean` line 94.
- Dependency check rerun: `depcheck: 261 roadmaps, 2598 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file changes outside the folder.
- Overlap leads: none (no other open pull request changes this roadmap, no cited id dropped); the one citation lead, `VanishingCycles.lisseDirectImageTransport`, is a name of EtaleCohomologyFoundations, as the previous review resolved.
- Pull request text: title and description name the added folder and its three files; the head contradicts no sentence and removes or renumbers nothing.
- Remark: the description's paragraph ending "builds its higher-dimensional and coefficient-algebra form:" closes on a colon with no list after it.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh, GaloisSectionsPadicPeriodMaps, KloostermanMomentsAndPotentialAutomorphy, MixedHodgeModulesAndIrregularHodgeTheory, AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometryPartII (scopes as read for `0351865`; the change touches no owned object); nothing shared.

Source independence: changed passages only; 2 passages compared with 1 source (LS), none shared beyond the forced formula `1/(2·3^i)`; largest share LS, 112 of 147 locators in Layers 0–10; contents compared with LS at `0351865`: independent, and the change adds, removes or reorders no layer.

Research link: Layers 0–6 and 10 are the method and main theorems of Lawrence–Sawin (2025, Annals of Mathematics); Layers 7–9 are §§9–12 of Lawrence–Venkatesh (2020, Inventiones); §3.3 uses Bakker–Tsimerman's Ax–Schanuel theorem. Rests on the README's references and the LS and LV texts read.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (§2.11): recorded as uncertified; no legal text is cached.
- §7.4's Check on the arXiv v3 wording of LV's first inequality: only the printed version is cached.
- Public formalisations outside the pinned libraries matching the `Suggested.lean` declarations: not searched.

## Source issues

- **Misprint** in LS at proof of Lemma A.4, p. 91: the source says log-concavity bounds every later term by the bound at the crossing index `j`; it should be the bound `1/(2·3^i)` at the term's own index `i`; affects nothing.
- **Misprint** in LS at proof of Lemma A.5, p. 91: the source says the tail sums exceed the reference sums; it should be the reverse inequality, giving the bound `3/2` from above; affects nothing.

## For the human reviewers

- **Licence.** The cached LV text comes from `bimsa.net` (header of the LV extraction), an institutional site that is neither the publisher's nor the authors'; the README cites the Inventiones article and arXiv:1807.02721v3.
- **Licence.** Serre, *Galois cohomology*, is recorded as uncertified (paywalled); its two locators in README §2.11 (lines 1628 and 1633) were not checked against a text.
