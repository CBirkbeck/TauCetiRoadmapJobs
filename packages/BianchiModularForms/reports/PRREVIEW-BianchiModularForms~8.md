# Review of BianchiModularForms (pull request #1719 at 722ea50)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 70ba211: the folder is unchanged, main was merged into the branch, and the description was rewritten. This round read the title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`TauCetiRoadmap/BianchiModularForms/README.md`: the roadmap, 10 layers (0–9) and 66 numbered sections"; the head has Layers 0–9 and 66 `### k.n` headings.
- R02 — repaired: the description now says "two headline theorems stated against the pinned Mathlib, its only import", names both with their sections, "the eight definitions they need", and the docstring's list of unstatable headlines; all match `Suggested.lean`.

## Verified sound

| Statement | Instances and values on each side | Result |
|---|---|---|
| §1.2 / `finrank_H1_sub_cuspidal` (description: "number of its cusps whose stabilizer contains no rotation") | `K = ℚ(√−5)`, `𝔫 = 𝔞 = 𝓞_K`: two cusps, each stabiliser contains a conjugate of `diag(−1, 1)` (`tr² = 0 ≠ −4 = 4 det`), right side 0; left side `0 − 0`, since the involution acts by −1 on the 2-dimensional `H¹(PSL₂(𝓞_K), ℂ)`. | Sound. |
| Same, `K = ℚ(√−3)`, `𝔫 = 𝔞 = 𝓞_K` | One cusp; `diag(−1, 1)` in its stabiliser, right side 0; `PSL₂(𝓞_K)^ab = ℤ/3` finite, left side `0 − 0 = 0`. | Sound. |
| §9.3 / `cuspidalH1_sl2Image_eq_bot_iff` (description: "Vogtmann's level-one vanishing classification") | `d_K = −20`: `dim H¹(PSL₂) = 2`, two torus cusps contribute 2, cuspidal part 0, −20 in the set. `d_K = −40`: rank of `PSL₂^ab` is 3, two cusps, cuspidal dimension 1, −40 not in the set. Set has 14 elements = radicands 1, 2, 3, 5, 6, 7, 11, 15, 19, 23, 31, 39, 47, 71. | Sound, both directions. |
| Description (summary block and prose) against the head | Trivial central character (`README.md:24–26`); all ideal classes (`:20–21`); weights `k ≥ 2` in Layer 1 only (`:32–33`); analytic rank and `L`-ratio (`:14–15`, Layer 6); nine fields (`:17`, `:80`); diamond invariants (`:967`); Hecke ring, classical newforms, ideal Dirichlet series (`:214–236`); `bmf`, `ecnf` (`:50–51`); integral Hecke module and period pairing (`:2346–2348`). | No sentence contradicted. |

Rows for every other statement stand as in the previous review, of `70ba211`.

- Folder change since `70ba211`: 0 lines; `git diff --stat origin/main...HEAD` outside the folder is empty (the files listed as changed outside the folder since `70ba211` are main's, brought in by the merge); the folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.NT"`, as the description says).
- Description against the change: it adds a roadmap not on main (95 headings and 10 declarations added, none removed); the description's counts (10 layers, 66 sections, 2 theorems, 8 definitions, sole import `Mathlib`) each recounted at the head and equal.
- Gate, rerun on this head: every counter 0, `OK`; the worker's gate with the targeted build reports `build=0 OK`.
- Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with exactly two `declaration uses sorry` warnings (lines 140, 160); single `import Mathlib`, no `set_option`. Elaborated signatures compared with the README: the four definitions flagged as losing `[NumberField K]` are those the README says need only a field (`README.md:43–46`); both theorems keep every binder.
- Seeded sample: no target falls in a changed passage (none changed); the README flags no locator as unverified; 0 source locators re-read this round.
- Cross-roadmap citations: the resolver lists none unresolved (its eight "Lean names" are LMFDB knowl ids). Re-resolved at the open heads: MaassForms §2.1(v) (Mellin transform of `K_ν`, DLMF 10.43.19), KleinianGroups `isFundamentalDomain_of_facePairing`, `bianchiGamma`, `catalanConstant / 3`, ModularityAndLanglandsExtensions §§4.26, 4.27, 4.40, 4.43: all present. The eight suppliers of the description's dependency block are the eight open roadmaps the README names.
- Overlap check: read MaassForms, HilbertModularForms, KleinianGroups, EllipticCurvePeriodsAndModularParametrizations, SiegelModularForms, ModularForms, LFunctions, ZerosOfLFunctions; weight-0 Maass forms on `PSL₂(ℤ[i])\ℍ³` — MaassForms Layer 7; `H3`, `bianchi`, `bianchiGamma`, covolumes — KleinianGroups; weight-two Bianchi forms at level `𝔫` — this roadmap (MaassForms and HilbertModularForms defer to it by name; the other four do not mention Bianchi objects); nothing owned twice.

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Swan 1971 (Adv. Math. 6): recorded `uncertified` in the manifest; cited by locator, as in the previous reports.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, outside what this review reads.

## Source issues

- none

## For the human reviewers

- none
