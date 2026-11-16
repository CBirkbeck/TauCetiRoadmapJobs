# Review of ModularIwasawaMainConjectures (pull request #1499 at 4d87fc8)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since 8f21cae; this round reads the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads “Two of the open suppliers, KatoEulerSystems and AutomorphicCongruences, carry the Euler-system and automorphic inputs”, names all five gaps on them, and lists §§0.1, 0.3, 0.4, 0.6–0.10, 0.12–0.13, 1.3–1.5, 2.1–2.3, 3.4–3.5, 4.1–4.3, 4.5, 5.4, 5.10–5.11.

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

:robot: Independent AI review.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description's list of sections whose `*Needs:*` lines cite KatoEulerSystems or AutomorphicCongruences | every `###` section of `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` | README: 26 sections with such a `*Needs:*` line (0.1, 0.3, 0.4, 0.6–0.10, 0.12, 0.13, 1.3–1.5, 2.1–2.3, 3.4, 3.5, 4.1–4.3, 4.5, 5.4, 5.10, 5.11); description: the same 26. | Equal sets. | None. |
| `gap:tate-twisted-components` as the description words it (trivial tame component of T_K(1) and T_K(k−1); reverse bound on T_K(1)); README lines 133, 928, 1102, 1602 | (p,k) = (7,4), (5,2), (3,3), (2,2) | Untwisted trivial component is the ω^(k−1) component of T_K(k−1): ω³ of order 2 at (7,4); ω of order 4 at (5,2); ω² = 1 at (3,3); trivial at p = 2. | Twisted and untwisted components differ unless (p−1) divides (k−1); the gap is not redundant, and the description names the same three statements as the README. | None. |
| Description's gap attribution: two on KatoEulerSystems, three on AutomorphicCongruences | README lines 96, 98, 133, 135, 143 | KatoEulerSystems: modular-zeta-extensions, central-critical-specialization. AutomorphicCongruences: automorphic-endpoints, tate-twisted-components, central-critical-equality. | Agrees with the description. | None. |

The rows of the previous reviews stand for every untouched statement, as in the previous review, of `8f21cae`; the folder's diff is empty.

- Gate rerun at this head: all 27 text, import, name, metadata and folder checks 0, `OK`; the worker's gate adds `build=0`. Outside-folder diff against the base: empty.
- Dependency check: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge-order positions: PadicFamilies 183, KatoEulerSystems 382, AutomorphicCongruences 398, this roadmap 399, which is the supply order the description states.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `declaration uses sorry` warnings (lines 53, 68, 87) and nothing else; the targeted build succeeds with those three and the module-system advisory, exactly as the description's “Validation” line says.
- Cross-roadmap citations resolved again at the open heads: 17 KatoEulerSystems sections (§§2.2, 4.2, 4.3, 4.6, 5.1–5.4, 6.2–6.6, 7.2, 7.4, 7.6, 7.9; head 88ffcc3) and 11 AutomorphicCongruences sections (§§1.11, 2.21, 3.4, 3.7–3.9, 4.3, 4.5, 4.6, 7.9, 7.10; head 4291999) are headings there; both name this roadmap as a consumer only. HeegnerPointEulerSystems has a Layer 8b at its open head.
- Summary block and prose against the head: Kato's formulation at every prime including 2 (README line 36); p = 3 via §1.6; Mahler–Manin (line 1335) and Greenberg–Stevens (§5.7); `TauCeti.completedGroupAlgebra` (line 66) and `TauCeti.tateCurve` (line 13); consumers as in README lines 24 and 179; folder has exactly README, `Suggested.lean`, `metadata.toml`; the change is 2196 insertions adding a new roadmap, no heading or declaration removed.
- Elaborated signatures: the four types in the worker's `signatures.md` agree with README §§0.8, 3.6 and 3.7; no section binder lost. `Suggested.lean` is unchanged, so the padding probes and the statability audit were not rerun.
- Seeded sample: none of its targets falls in a changed passage (there is none); no source locator was reopened.
- Remark on untouched text, no change asked: README line 9 and two supplier headings call KatoEulerSystems and AutomorphicCongruences “proposed”; both are now roadmaps in open pull requests.

Overlap check: read AutomorphicCongruences, KatoEulerSystems, ModularIwasawaMainConjecturesPartII, HeegnerPointEulerSystems (open) and IntegralIwasawaTheory (main); nothing shared: the first two are suppliers naming this roadmap as consumer, Part II and HeegnerPointEulerSystems build on it, IntegralIwasawaTheory owns number-field class-group Iwasawa theory.

Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- “AI assistance: … 0 independent review rounds and 2 red-team rounds … (Fable and Astra)”: the board holds red-team reports for two rounds, which agrees; which models ran them is not recorded where I can read it.
- BSDGP, Kobayashi and Silverman stay settled as uncertified, Serre and Jones as waived; no source was requested this round.

## Source issues

- none

## For the human reviewers

- **Not tested.** The board plan (`packages/ModularIwasawaMainConjectures/design/plan.json`) lists eight gap slugs; README lines 133 and 135 declare two more, `gap:tate-twisted-components` and `gap:central-critical-equality`, both on AutomorphicCongruences. The intake reads the plan (D01).
- **Not tested.** The plan's `manin-period-comparison` asks for a unit comparison at every odd p; README line 149 asks for a fractional ratio, with the p-unit clause only under E[p] irreducible (D02).
- **Not tested.** Source independence was checked on changed passages only, and none changed; the wording and arrangement comparisons of the earlier full rounds were not repeated.
