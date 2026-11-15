# Review of QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (pull request #1842 at fda6fe9)

**Verdict:** needs changes

Incremental re-review of 145 changed lines since ee22726: the rename that repairs the previous finding, the regrouping of 33 subsections under 10 group headings (their `###` headings became bold labels with the same numbers), and the 10 new paragraphs that open the groups.

## R01 (P3) — three "consumes" claims of the new group paragraphs disagree with the consumers' `*Needs:*` lines

**Location.** `TauCetiRoadmap/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:350` "§1.9 consumes §1.1 and §§1.4–1.6"; `:576` "§§4.6, 6.4, 7.2, 7.3 and 9.3 consume §2.7"; `:1002` "§6.1 consumes §5.6".

**Claim.** The group paragraphs name the consumers of each grouped target, and (`README.md:209`) each target's *Needs* line lists exactly the inputs of its statement and proof route.

**Witness.** `README.md:469` (§1.9 Needs): `§0.5, §1.4, §1.5, §1.6`, no §1.1; `:1160` (§6.4): `§1.12, §4.6, §6.1, §6.2, §6.3`, no §2.7; `:1121` (§6.1): no §5.6. The proof routes at `:467`, `:1158`, `:1119` do name §1.1, §2.7, §5.6.

**Repair.** The routes side with the new paragraphs, so complete the three Needs lines: `:469` → `*Needs:* §0.5, §1.1, §1.4, §1.5, §1.6; …`; `:1160` → `*Needs:* §1.12, §2.7, §4.6, §6.1, §6.2, §6.3.`; `:1121` → `*Needs:* §1.6, §1.12, §2.2, §4.5, §5.1, §5.6, §5.9.` With these, all 55 consumption claims of the 10 paragraphs agree with the Needs lines (recomputed below); no cycle arises (§1.1 ← §0.x only; §2.7 and §5.6 precede Layer 6).

## Previous findings

- R01 — repaired: `README.md:56` "the `C³` regularity supplied by `LieGroup.minSmoothness_of_isRCLikeNormedField` (`TauCeti/Geometry/Lie/Basic.lean`)"; `Suggested.lean:70` and `:81` carry the same name; the file elaborates (below). The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `quantize` instance resolution (previous R01) | pin Tau Ceti `Geometry/Lie/Basic.lean:45`, `n = 3`, `G` with `[LieGroup 𝓘(ℝ, E) ∞ G]` | head: 0 errors, 7 `declaration uses sorry` warnings (lines 115, 171, 184, 200, 221, 239, 253) | repaired | none |
| Group paragraphs vs Needs lines (R01) | all 55 "X consumes Y" claims of lines 350, 440, 576, 741, 816, 1002, 1115, 1223, 1349, 1449 against the 77 Needs lines | 52 agree; 3 disagree (§1.9←§1.1, §6.4←§2.7, §6.1←§5.6); reverse direction: no consumer outside a group is missing from its paragraph | 3 mismatches | R01 |
| Group paragraphs, internal claims | "§2.7 combines §2.4 with §2.6, which rests on §2.5"; "§8.8 consumes §§8.3, 8.6, 8.7"; "§9.5 consumes all four" | §2.7 Needs `§2.1, §2.4, §2.6`; §2.6 Needs `§0.3, §2.5`; §8.8 Needs `§3.6, §8.3, §8.6, §8.7`; §9.5 Needs has §9.1–§9.4 | agree | none |
| §2.4 (heading changed; sampled) | (i) SU(2), spin l; (ii) quadratic Casimir of 𝔰𝔩₂ | (i) Δ-eigenvalue `1 + c·l(l+1)` vs `|λ_π|² ≍ (l+½)²`: ratio bounded; (ii) `γ(sym p) − p = −|ρ|²`, degree 0 ≤ r − 1 = 1 | consistent | none |
| §5.4 (heading changed; sampled) | `f: 𝔸² → 𝔸¹`, `f = x`, `β = dx∧dy`, `γ = dx` | `α = dy` on the fibre; `β = α ⊗ γ` up to the stated sign; rescaling γ by c gives `α/c` | fibral form determined | none |
| §8.3 (heading changed; sampled) | O a single point (U(1)-type character); O with two open orbits | one probability measure δ_ξ, `∫[a]Ψ = a(ξ)δ_ξ(Ψ)ω({ξ})`; `ξ ↦ δ_ξ` on a non-linear set O, so "linear" is meaningless, as the README says | consistent | none |
| `Suggested.lean` docstring, "local logarithm with its expansion through the bracket term" | pinned Tau Ceti `Geometry/Lie/Exponential/BCH/` | `Basic.lean:89` `lieLocalBCH`; `Bracket.lean:235` `isBigO_lieLocalBCH_representative_sub_bracket` (second order only; no higher Taylor coefficients) | docstring accurate | none |

The rows for the untouched statements stand as in the previous review, of `ee22726`.

- Gate at fda6fe9: every count zero (`set_option=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`). Elaboration with `lake env lean`: exit 0, `sorry` the only warning (7).
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Outside the folder: `git diff --stat origin/main...HEAD` excluding the folder is empty.
- Numbering: all 76 ids 0.1–9.5 survive (43 as `###` headings, 33 as bold labels); no id dropped, no `§` reference in the README or in `Suggested.lean` broken; no old heading title is cited elsewhere in the README; the two open or main roadmaps that name this roadmap (GanGrossPrasadUnitaryGroups, LieHighestWeight) cite none of its section ids. No statement, hypothesis, locator, Check or Needs line changed in the diff apart from line 56.
- Sampled targets in changed passages (§§2.4, 5.4, 8.3: headings only; §1.12 is cited by the new line 440): content checked against nv21 arXiv v3 (lines 2592–2617: the eigenvalue bound and the degree drop; 3574–3589: fibral forms; 6084–6098: the equivariant map, its disintegration and centralizer invariance). The sampled targets outside the changed passages were not re-read.
- Pull request text against the head: title and description name no section heading or number that the regrouping changed; the supplier list and the `Suggested.lean` summary still hold; nothing to correct.
- Overlap check: read AutomorphicSpectralTheoryPartII, GanGrossPrasadUnitaryGroups, AutomorphicSpectralTheory (through `scratch/overlaps.md` and the citing lines found by `roadmaps grep`); nothing shared; the diff adds no object and no supplier.
- Source independence: changed passages only: 10 new group paragraphs and 10 new headings compared with 1 source (nv21, arXiv v3 text), none shared; largest share nv21, 127 of 133 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- The printed page and theorem numbers of nv21 (Acta version) for §§2.4, 5.4, 8.3: the cached published PDF yields no text on this worker (encrypted; the extractor lacks AES support). Content was checked in arXiv v3, whose numbering differs; the locator strings are unchanged since the full review that verified them.
- rossmann78, kostant78, barbasch-vogan80, rangarao72, kostant63, kostant59, whitney57: uncertified, cited by locator only, as before.

## Source issues

- none

## For the human reviewers

- **Not tested.** nv21 has the largest share of the locators (127 of 133); its published text could not be extracted this round, so the changed passages were compared with its arXiv v3 text only, and its table of contents was not compared again.
