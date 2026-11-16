# Review of FourierDeligneTransform (pull request #2132 at e1ab460)

**Verdict:** accepted

No findings. Incremental re-review of the 6 lines changed since b215ba1 (`TauCetiRoadmap/FourierDeligneTransform/README.md:20`, `:621` and `:626`), and of the pull request's title and description against this head.

## Previous findings

- none: the previous review, of b215ba1, had no finding (its R01–R03 bullets recorded repairs of an earlier round; the three repaired sentences of the description are unchanged at this head).

## Verified sound

| Statement or scope | Instances | Computed values: changed text versus target | Result | Change |
|---|---|---|---|---|
| README:621, sections DeligneWeightsAndPurity §§2.12–2.16 and §§4.5–4.7 use | the two Dependencies paragraphs of DeligneWeightsAndPurity (layers DWP.2 and DWP.4) at its open head | First list: 12 ids (0.2, 2.2, 2.3, 2.5, 2.6, 3.2, 3.4, 3.7, 3.8, 4.1, 4.2, 5.4) on both sides. Second: 6 ids (3.4, 4.1, 4.2, 5.2, 5.5, 5.6) on both sides. | Equal | none |
| README:621, “curve estimate (its §§6.4–6.5) by the Fourier-transform argument …, square improvement (its §§6.1–6.3) as a second, independent proof” | *Needs* lines of DeligneWeightsAndPurity §§6.4, 6.5 and 6.1–6.3 | §6.4 and §6.5 need §§4.6–4.7 and none of §§6.1–6.3; each of §§6.1–6.3 says no other target depends on it. | Agrees | none |
| README:621, “the tame local Fourier transform of §5.6” and §5.5, as used by DeligneWeightsAndPurity §4.6 | `F = ℒ_χ(x/(x − 1))` on `𝔸¹ ∖ {0, 1}`, `χ` nontrivial; `F = Λ` on `𝔸¹` | First: `rk F′ = a_0 + a_1 = 2`, `rk_{0′} = 2 − 1 + 0 = 1 = dim H¹_c`; sequence dimensions `1, 2, 1, 0`. Second: `0, 0, 1, 1` (README:610). | §§5.5–5.6 give the four-term sequence §4.6 reads | none |
| README:621, “finite Plancherel identity of §0.2”, as used by DeligneWeightsAndPurity §2.16 | `f = δ_0` on `𝔽_q`; `f = 1` on `𝔽_q` | `Σ|𝔉f|² = q`, `q·Σ|f|² = q`. Second: `𝔉f = q·δ_0`, `Σ|𝔉f|² = q²`, `q·Σ|f|² = q²`. | Agree | none |
| README:626, “the weight-zero clause is DeligneWeightsAndPurity §2.13”; Gauss-sum line of §5.4 | `q = 3`, `χ` quadratic, `ψ(1) = ω`; trivial `ψ` | `g(χ, ψ) = ω − ω² = i√3`, `g(χ⁻¹, ψ⁻¹) = −i√3`, product `3 = q`, weight 1. Trivial `ψ`: constant sheaf, trace 1, weight 0. | §2.13 there states both; CongruenceSpectralGap §4.2b cites §2.13 for weight zero | none |
| README:20, “purity of the transform of a pure middle extension on the affine line … is DeligneWeightsAndPurity §4.5” beside KL85 Théorème (2.2.1) left to Part II | `ℒ_χ` on `𝔾_m`, weight 0, `r = 1` | §4.5 there: sheaf weight `β + 1 = 1`. KL85 lines 413–414: perverse weight `m + r = 1 + 1 = 2`, so `H^{−1}` has weight 1. | Consistent; §4.5 is the line case for lisse-at-`∞` irreducibles, (2.2.1) the relative theorem via Weil II: no shared owner | none |
| Supply direction after the change | merge order; dependency check | FourierDeligneTransform at line 77, DeligneWeightsAndPurity at line 80; DeligneWeightsAndPurity states that this roadmap consumes nothing from it; the README names it only under ownership deferrals and consumers. | No upward edge, no cycle | none |

Other adversarial rows stand as in the previous review, of b215ba1.

- Increment: 6 changed README lines (3 sentences or bullets), 0 changed Lean statements, 0 paths outside the folder; head e1ab460e6052bb41a4b61eeeb39b56ba33ca9953 confirmed.
- Cross-roadmap citations resolved at the cited heads: 8 (DeligneWeightsAndPurity §§2.12–2.16, 2.13, 4.5, 4.5–4.7, 6.1–6.3, 6.4–6.5 at its open head; CongruenceSpectralGap §4.2b and its supplier lines at its open head); every heading and use exists as cited. Internal section numbers named in README:621 and :626 (16 ids) all exist with the content named.
- Source locators reopened: 3 (LAU87 lines 2613–2657, the heading of (4.4) to the end of its proof; KL85 lines 413–414 and 425–430); each supports the sentence that cites it. None of the fifteen seeded sample targets lies in a changed passage; they stand as verified before.
- Library declarations: none new; `Suggested.lean` is unchanged with 0 declarations, so signature and one-tactic probes have no instances.
- Pull request text: title, summary block and every prose sentence compared with the head; “Fourier proofs of curve weight bounds” and the consumer sentence agree with README:621; no supplier is added or dropped, no section renumbered; line counts 639 + 57 + 1 = 697 unchanged.
- Gate rerun at this head: every counter 0, `OK`. Dependency check: `depcheck: 260 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean` on `TauCetiRoadmap/FourierDeligneTransform/Suggested.lean`: exit 0, no output.
- Remark: README:626 says §§2.2–2.5 construct the weight-free part, while CongruenceSpectralGap §4.2b cites §§2.2–2.3 and 2.5; the wider range contains the narrower.

Overlap check: read DeligneWeightsAndPurity, CongruenceSpectralGap and EtaleDualityAndPerverseSheaves where they name the transform; nothing shared: DeligneWeightsAndPurity owns every weight statement (§§2.12–2.16, 4.5–4.7, 6.4–6.5) and cites FourierDeligneTransform as owner of the transform and the character sheaves; CongruenceSpectralGap cites both likewise.

Source independence: changed passages only; 3 passages compared with 2 sources (LAU87, KL85), none shared; largest share LAU87, 151 of 202 locators as counted earlier; no layer added, removed or reordered, so the contents were not compared again.

Research link: the transform of Layers 3–5 is the one Deligne introduced and Laumon (1987) used to reprove the curve estimate of Deligne's Weil II (1980), and that Katz–Laumon (1985) and Katz (1990) use for exponential sums; README summary and Downstream consumers, LAU87 §4.4.

## Not verifiable

- SGA45-ST and KW01 are settled as uncertified and cited by locator only; no changed passage depends on them.

## Source issues

- none

## For the human reviewers

- none
