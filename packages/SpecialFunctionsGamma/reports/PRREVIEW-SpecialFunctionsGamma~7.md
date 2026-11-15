# Review of SpecialFunctionsGamma (pull request #2191 at b805908)

**Verdict:** needs changes

## R01 (P3) — the description lists AnalyticNumberTheoryPartII as an open pull request; it is on main

**Location:** pull request description, **Overlaps with other roadmaps**, under "**Open pull requests.** The scope was chosen to avoid them": "#1167 (AnalyticNumberTheoryPartII §4.3, `barnesG`) owns the Barnes `G`-function, which is outside this roadmap; the README names it."

**Claim:** #1167 is no longer open. AnalyticNumberTheoryPartII is on main, so the bullet belongs in the "On main" list and the roadmap is not an open pull request to avoid.

**Witness:** main has `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:170` "### 4.3 Barnes G-function" and `:178` `barnesG`; the folder's last commit on main is `0a61b759 … (#1167)`; the index of open roadmap pull requests has no #1167.

**Repair:** delete the #1167 bullet from "Open pull requests" and add under "On main": "AnalyticNumberTheoryPartII §4.3 (`barnesG`) owns the Barnes `G`-function, which is outside this roadmap; the README names it."

## Previous findings

- none: the previous report, of `b805908`, had no finding of its own (its two bullets accounted for findings of `5d705b1`, both repaired).

## Verified sound

The folder did not change since `b805908`; this round reads the title and description against the head.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| Description: 5.12.10 holds "for all parameters in the printed ranges" (`beta_loop_one`, `README.md:847`) | `(a, b, ε)` = `(1.3 + 0.4i, −1, 0.5)`, a pole of `Γ(b)`; `(1.7, −2, 0.4)`; `(0.6 − i, −2.5 + 0.8i, 0.7)` and `ε = 0.2` | `0.3000000 + 0.4000000i`; `−0.1050000`; `0.04976587 + 0.05438445i` for both `ε` / `Γ(a) Γ(a + b)⁻¹ Γ(1 − b)⁻¹`: `a − 1 = 0.3 + 0.4i`; `−0.105`; `0.04976587 + 0.05438445i` | holds |
| Description: 5.12.11 in the same sentence (`beta_loop_zero`, `README.md:859`; the head states it with `Γ(a)` in the numerator and `a ∉ {0, −1, …}`, which contains DLMF's range) | `(−0.5 + 0.7i, 1.2 − 0.3i)` at `ε = 0.4` and `0.8`; `a = 1`, `b = 1.5`; `a = 2`, `b = 0.7 + i` | `0.6704172885 + 0.4376724737i` for both `ε`; `< 2·10⁻¹⁵`; `< 4·10⁻¹⁵` / `(e^{2πia} − 1) Γ(a)Γ(b)/Γ(a + b)`: `0.6704172885 + 0.4376724737i`; `0`; `0` | holds |
| Description: "73 theorems, with the 6 definitions", "imports only Mathlib", "covering every layer" | `Suggested.lean` at the head | 73 `theorem`, 6 `def`; one import; section comments for Layers 1–8 / 73, 6, Mathlib only, every layer | holds |

All other rows stand as in the previous review, of `b805908`.

- Gate: the worker's run reports every check 0, the build included. My run reports the same except `depcheck: NOT IN ORDER`, from the configured order, which lacks this roadmap. The candidate order lists it at line 279, after ExplicitNumberFields; the dependency check with the candidate order prints `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`. No file outside the folder changed.
- Elaboration: `lake env lean` of `Suggested.lean` gives 73 `sorry` warnings and nothing else; the file is unchanged, so its signatures stand as checked before.
- Description against the head, 31 statements checked, 1 wrong (R01). Matching: the eight layers and their formula ranges (`README.md:58–86` and the layer headings); the Mathlib and Tau Ceti inputs (`README.md:88–111`); the three conventions (`README.md:170–176`, `:201–204`, `:185–186`); the Beyond list (`README.md:1231–1249`); the dependency sections; "adds the roadmap" (not on main; 1862 insertions, 0 deletions).
- Cross-roadmap citations of the description resolved, 15:
  - on main: ZerosOfLFunctions 1.2–1.4 (`README.md:510`, `:520`, `:529`); AsymptoticExpansions 1.1, 1.3, 4.1–4.3, 8.6 (`:281`, `:320`, `:544`, `:552`, `:562`, `:1052`); SpecialFunctionsHypergeometric 4.2, 6.3 (`:629`, `:844`); SpecialFunctionsParabolicCylinder 6.6(a) (`:103`); AnalyticNumberTheoryPartI §1.8a (`:1122`); SpecialFunctionsAiry 7.1 (`:1126`); ConformalMappingPartII 5.6 (`:740`); GlobalHolomorphicFunctions 6.1 (`:1843`, `:1875`); RandomMatrices 5.2–5.3 (`:818`, `:839`); AnalyticNumberTheoryPartII §4.3 (`:170`);
  - at open heads: ExplicitNumberFields 1.1a (#1944, `README.md:1315–1323`); ExplicitZetaBounds 1.1–1.3, 2.4–2.5 (#1954, `README.md:832`, `:857`, `:881`, `:1028`, `:1046`).
- Pinned libraries: neither pin declares `digamma_eq_gaussSeries`, and pinned Tau Ceti has `Analysis/SpecialFunctions/Gamma.lean` but no `Gamma/` directory, as the description says of the pin.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma; the lists are those of the previous review and the owners stand: 5.4.3 and 5.8.3 SpecialFunctionsParabolicCylinder 6.6(a); 5.12.3 for complex parameters and 5.13.3 SpecialFunctionsHypergeometric 6.3; 5.5.6 at `n = 3` SpecialFunctionsAiry 7.1; 5.7.6 and 5.15.1 on `Re z > 0` ExplicitNumberFields 1.1a. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share DLMF, as before; contents not compared again (no layer added, removed or reordered).
- Remarks on untouched text, no change asked: `README.md:130` cites "ZerosOfLFunctions 1.1–1.3" where the supplier contracts (`README.md:213–219`) and the description name 1.2–1.4; scope item 7 ("DLMF §§5.15–5.16") still spans 5.15.1 on `Re z > 0`.

## Not verifiable

- The description's paragraph on Tau Ceti main ("merged after that pin": the Gauss series of `ψ`, the real digamma function, `|Γ(x + iy)| ≤ Γ(x)`, the name `Complex.digamma_eq_gaussSeries`): only the pinned Tau Ceti is available to this review.
- "the roadmap topics check passes": the check is not among the tools of this review; the gate's `metadata` check is 0.
- DLMF §5.9, Widder (1941), Titchmarsh (1939), Andrews–Askey–Roy (1999) and Temme (1996): not read this round; no passage citing them changed.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:1251–1277` names the author's `lean-DLMF` repository (stated there as Apache-2.0) as source material for Layers 1–8; `Suggested.lean` was not compared with that repository's declarations.
