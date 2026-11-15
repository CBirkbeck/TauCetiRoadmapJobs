# Review of DeligneWeightsAndPurity (pull request #929 at fae1b73)

**Verdict:** accepted

Incremental re-review of the 46 lines changed since 5f2fd53, plus the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: `README.md:1114, 1169, 1176` "Under the hypotheses of [2.9](#29-…)"; `:1126, :1133` "Under hypothesis (iii) of [2.9](#29-…)"; `:1150` "Keep the setting of [2.7](#27-…)". No "Theorem `3.2`" or "Lemma `3.5`" remains.
- R02 — repaired: `README.md:2165` "The property `P_n(f)` is that of [7.3](#73-…)"; 7.3 defines `P_n(f)` at `README.md:2158`.
- R03 — repaired: the description now lists the six suppliers that are not on main, with sections, and eleven on main. All 17 names were checked against main 8ad4192 and the merge order (table below).
- R04 — repaired: the description names GPT-6 (Codex), Astra, Claude Fable 5.1 and Claude Opus 5.5. The trailers on the 19 commits of the folder name Codex, Claude Fable 5.1 and Claude Opus 5.5 only.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 7.2 API (`README.md:2133`), now citing 0.2 (iv) | `α=1+i`, `q=2`; `α=√2`; control `α=q⁻¹` | `n=1`, `d=2`: norm `2=2^{1·2/2}`; `√2`: norm `−2`, modulus `2`; `q⁻¹`: weight `−2`, norm `1/q` not an integer, and not integral, as 0.2 (iv) requires | pass |
| 7.13 (`README.md:2264`), now citing 0.2 (iii) | `α=1+i`, `q=2`, `n=1`, `v(2)=1` | `q^n/α=2/(1+i)=1−i`, the conjugate; couple `(1/2, 1/2)`, `r+s=1=n`; 0.2 (i) would not give the conjugate, so (iii) is the right clause | pass |
| 2.4 (`README.md:1114`) under the hypotheses of 2.9 | `F₀` of weight `β`, `⊗^{2k}` | weight `2kβ`; coinvariants twisted by `(−1)` give eigenvalue `q^{kβ+1}` on `H²_c`, so the pole is at `t=q^{−kβ−1}`; `ψ`, `β`, (i)–(iii) are all stated in 2.9 (`:1160`) | pass |
| 7.6 (`README.md:2182`), reworded to "the conclusion of 7.8" | *Needs* lines of 7.6, 7.7, 7.8 | 7.6 needs 7.3–7.5 and suppliers, not 7.8; 7.7 needs 7.6; 7.8 needs 7.6 and 7.7, so there is no cycle; the quoted conclusion equals 7.8's (`:2198`) | pass |
| 7.15 (iii) (`README.md:2310`), now citing 7.12 (ii)–(iii) | WII line 2686–2692 | (3.3.11) relaxes "smooth" where Poincaré duality is used; 7.12 (ii) is (3.3.5) and (iii) is (3.3.6), the two clauses of 7.12 that assume `X₀` smooth; 7.12 (i) has no such hypothesis | pass |
| 8.10 (sampled; `README.md:2507`), now citing 8.9 | WII line 4154–4159, p. 248; `ℚ̄_ℓ(−1)` on `𝔾_m` | (6.2.5) c), d) on printed p. 248; 8.9 (b) with `K=ℱ₀[0]`: `ℋ⁰` punctually pure `w+0`; `ℚ̄_ℓ(−1)`: weight `2`, `RHom(K,ℚ̄_ℓ)=ℚ̄_ℓ(1)` of weight `−2 ≤ −2` | pass |
| 8.2 API (`README.md:2406`), now citing 0.7 | `K=ℚ̄_ℓ(−1)[−3]` on `Spec 𝔽_q` | `H³=ℚ̄_ℓ(−1)`, eigenvalue `q`, weight `2=w+3`, so `w=−1`; 8.9 (c) gives `0+(−3)−2(−1)=−1`: the same | pass |
| 9.8 (`README.md:3113`), now citing 9.1 | `ℙ¹` (`n=1`), `ℙ²` (`n=2`) | `ℙ¹`, `r=1`: `P⁰=ker η²=H⁰`, dim `1=b₀−b₋₂`; `r=0`: `P¹=0=b₁−b₋₁`; `ℙ²`, `r=0`: `P²=ker(η:H²→H⁴)=0=b₂−b₀`; 9.1 defines `P^{n−r}` as `ker η^{r+1}` | pass |
| The other 15 replaced ids (`README.md:2190, 2240, 2300, 2357, 2380, 2481, 2535, 2757, 2852`, …) | each link's target against the object named in the sentence | 7.6 reduced situation, 7.2 integral sheaf, 7.13 couple, 0.12 base extension, 8.1 weights `≤ w`, 8.6 setting, 8.2 purity, 8.22 semisimplicity (`𝔾_m` is normal), 8.20 potential property: 15 of 15 land on the definition used | pass |
| Description: suppliers | 17 roadmaps named in the README | not on main (merge-order line): AbelianSchemesAndArithmeticModuli 43, InverseGaloisAndArithmeticFundamentalGroups 54, ArithmeticGaloisRepresentations 58, ArithmeticGaloisDuality 62, LefschetzPencilsAndVanishingCycles 70, ModularCurvesPartII 73; this roadmap 74; the other 11 are on main; consumers at 96 and 109 | pass |
| Description: section lists and summary block | each list against the README's citations; summary claims against the head | all six section lists agree with the README; `IsWeilNumber` takes `q : ℝ`; `WeierstrassCurve.hasse_bound` and `LinearMap.BilinForm.IsAlt.even_finrank` exist at the Tau Ceti pin; §10.2, §10.5 and §10.6 match the "final layer" sentence; 10 Lean declarations, 3 files | pass |

Rows for untouched statements stand as in the previous review, of 5f2fd53: the diff changes no statement and no line of `Suggested.lean`.

- Gate rerun at fae1b73: every scanner is zero (`set_option=0 … source-material=0 OK`), and the worker's run adds `build=0`. Dependency check: `depcheck: 247 roadmaps, 2246 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` gives five `sorry` warnings (lines 82, 96, 111, 154, 179) and no error. The file is unchanged since 5930b27, so the signatures and padding probes stand; `primitivePiece` not carrying `[FiniteDimensional K V]` is correct, since its type does not need it.
- Internal links: 1022 links against 209 headings with GitHub slugs, 0 unresolved. `DWP.n/<slug>` catalogue ids remaining: 0. "Theorem 3.3.1" as a bare number in prose: 0.
- Source locators opened this round: 3, namely WII line 2599–2612 for the reduction in the proof of (3.3.1), p. 205, WII line 2686–2692 for (3.3.11) and WII line 4143–4159 for (6.2.5), printed pp. 247–248. Of the seeded sample only 8.10 lies in a changed passage; the other 14 targets are untouched.
- Cross-roadmap citations: no roadmap links this README by anchor (`roadmaps grep 'DeligneWeightsAndPurity/README\.md#'`: no match). The diff renumbers nothing, so the citations by section number in EtaleDualityAndPerverseSheaves and WeightsInEtaleCohomology (§§8.1, 8.2, 8.9, 8.11, 8.12, 9.1, 9.7) still resolve. No file outside the folder changed.
- Overlap check: read LefschetzPencilsAndVanishingCycles (supplier; it names this roadmap as the user of its pencil theory), EtaleDualityAndPerverseSheaves and WeightsInEtaleCohomology (consumers; the latter states that DeligneWeightsAndPurity owns Weil numbers, weights and weight transport), WeilConjectures and FourierDeligneTransform (as in the previous review); the lists for main and for named results are empty; nothing shared.
- Source independence: 3 passages compared with 1 source, changed passages only (`README.md:2182`, `:2310` and `:2507` against WII lines 2599–2612, 2686–2692 and 4154–4159), none shared; the other 20 edits replace an id by a section link. Largest share WII, 140 of 217 locators. No layer was added, removed or reordered, so the contents comparison stands from the earlier reports.
- Remark on untouched text (no change requested): the package `sources.toml` records Lef and WII, two of the eight works the README cites.

## Not verifiable

- Nothing this round needed an unreadable text. [Int] (SGA 7 II, XXI §5) is still cited by locator only, outside the changed passages.

## Source issues

- none

## For the human reviewers

- none
