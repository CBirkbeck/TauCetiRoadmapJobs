# Review of QuadraticFormsOverABase (pull request #1930 at 7cf144f)

**Verdict:** accepted

Incremental re-review of the 4 lines changed since 12a2c9e, all in `README.md`: the one bullet of `## Downstream consumers` (ArithmeticStatisticsPartIII §2.8) is replaced by the sentence "No roadmap consumes this one." `Suggested.lean` and `metadata.toml` are unchanged. The previous report had no finding to carry. The new sentence was checked against every roadmap on main and at the open heads and is true; the gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. No finding remains.

## Previous findings

- The previous report (at 12a2c9e) was an acceptance with no finding, so there is none to account for. Its R01–R03 accounting of the review before it stands: the passages it quotes (`README.md:57–66`, `:88–91`, `:318–333`) are byte-identical at this head (the diff touches only `:978`).

## Verified sound

### The changed passage

- **`README.md:976–978`**, "No roadmap consumes this one." Resolved with `roadmaps grep --fixed 'QuadraticFormsOverABase'` over main and the 458 open heads. Outside this folder the name occurs in three roadmaps, none of them as a supplier:
  - LefschetzPencilsAndVanishingCycles (#873), `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:4445`: a Downstream-consumers bullet saying that this roadmap's §2.1 compares its smoothness predicate with ordinarity. This roadmap is the consumer there.
  - QuadraticFormInvariantsPartII (#1834), `README.md:118` and `:2028`: forms on `Fin n → R` over a commutative ring "belong to" this roadmap, and this roadmap identifies its base change with `extendScalars`. Again this roadmap is the consumer (0.2).
  - ArithmeticStatisticsPartII (#1173), `README.md:2162`: a mention in its consumer paragraph, not a `From TauCetiRoadmap.…` contract.
- **ArithmeticStatisticsPartIII §2.8** (#1174, head b20a75d), the consumer the removed bullet named: its README no longer contains `QuadraticFormsOverABase`, `univHalfDisc`, `halfDisc_mapCoeffs` or `halfDisc_comp` (0 hits each). `README.md:1183` there defines `Counting.ternaryDet4` by the polynomial `4adf + bce − ae² − dc² − fb²` and `:1185–1187` state its laws (cubic homogeneity, compatibility with ring maps, `det(δ)²`) itself. So the removed bullet would have been false at that head, and its removal is the correct repair. The object is still accounted for in this roadmap's Scope through ArithmeticStatisticsPartII §1.3's `4 Det` (`README.md:62–63`, unchanged, row 34 below).
- **Nothing else depends on the removed bullet.** `grep -n 'ArithmeticStatistics\|ternaryDet4'` over the folder: the only remaining hit is the Scope sentence at `README.md:62`; `Suggested.lean` never named `Counting.ternaryDet4`. The heading `## Downstream consumers` keeps a non-empty body (gate `empty-sections=0`).
- **Pull-request description:** it names no downstream consumer, so the change makes none of its sentences wrong. The `depends-on` block lists suppliers only.

### Gate, build, dependency check

- **Worker's gate** (`scratch/gate.md` at 7cf144f): every check 0, `build=0`, OK.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 236 roadmaps, 2275 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. QuadraticFormInvariantsPartII is at line 391 of the candidate order, this roadmap at 395.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuadraticFormsOverABase'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration:** `lake env lean TauCetiRoadmap/QuadraticFormsOverABase/Suggested.lean` exits 0 in 10 s with 22 warnings, all `declaration uses 'sorry'`, no error. `git diff --stat 12a2c9e HEAD -- …/Suggested.lean` is empty, so the 39 elaborated signatures of `scratch/signatures.md` (0 lost binders), the earlier `#check @name` comparison and the one-tactic probe (no theorem closes) stand unchanged.
- **`roadmaps resolve`** on this README: no cross-roadmap citation and no Lean name found nowhere.

### Adversarial pass

No statement, definition or Check is changed by the diff. Rows 1–36 are carried from the previous report (review of 12a2c9e, which itself carries rows 1–32 from the review of 464f81f). Row 37 is this round's, for the object the removed bullet was about, recomputed by an exact script.

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1–32 | Conventions, `standard`, 0.1, 0.2 evaluation law and `mapCoeffs_eq_baseChange`, 1.1–1.4, Layer 1 Arf example, 2.1–2.4, 3.1–3.4, 4.1, 5.1–5.2, Layer 4 Examples, 6.1 | as in the previous report | as in the previous report (unchanged statements; `Suggested.lean` identical) | hold | none |
| 33 | 0.2 comparison `mapCoeffs (algebraMap K L) Q = extendScalars Q L` | as in the previous report, row 33 | `x² + x y + a y²` / `x² + x y + a y²`; `x y` / `x y`; `ω² + ω + 1 = 0` on both sides over `𝔽₄` | holds | none |
| 34–36 | Scope: `4 Det` is `δ'` at `n = 3`; its law is `halfDisc_comp`; `δ'(q) ≠ 0` is regularity when `2` is invertible | as in the previous report, rows 34–36 | `0` as polynomials; `4 / 4`, `−1 / −1`; 0 of 105 terms survive; `−2 = 2·(−1)`, `8 = 2·4` | hold | none |
| 37 | The polynomial ArithmeticStatisticsPartIII §2.8 now states itself, `4adf + bce − ae² − dc² − fb²`, against `δ'` at `n = 3` (`½ det(U + Uᵀ)`), so that the Scope sentence still covers it | `u² + v² + w²`; `uv + w²`; `0`; `2(u² + v² + w²)`; `(a, b, c, d, e, f) = (3, 5, −7, 2, 11, 13)` | `4 / 4`; `−1 / −1`; `0 / 0`; `32 / 32` (`= 2³ · 4`, the `aⁿ` rule of 1.3); `−859 / −859` | holds | none |

### Ownership and overlaps

- `scratch/overlaps.md`: no open pull request changes this roadmap, no dropped id is cited, no id depends on an open revision's numbering; the closest roadmap in vocabulary is ArithmeticStatisticsPartII (0.08), whose ternary `4 Det` the Scope already names as `δ'` at `n = 3`.
- Remark, no change asked: ArithmeticStatisticsPartIII §2.8's `Counting.ternaryDet4` is the same polynomial as ArithmeticStatisticsPartII §1.3's `4 Det` (row 37); that roadmap is earlier in the merge order and states it on its own six-coefficient carrier, and this roadmap owns only the general odd-rank `δ'`. The Scope's comparison with §1.3 covers the object.

### Sources

- The changed sentence cites no source, and no sampled target's text is touched; the locators read in the previous two rounds (Conrad 2014, Proposition C.1.4 and §C.1; Voight 2011, (3.2)) stand as recorded there.

## Not verifiable

- Nothing in the changed passage. The earlier reports' items (Knus 1991 IV (3.1), Bichsel–Knus 1994, Parimala 1978, Dieudonné 1955, the Montpellier manuscript) concern untouched text and stand as recorded there.

## Source issues

- none
