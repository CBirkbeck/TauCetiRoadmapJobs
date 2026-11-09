# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 3b084ef)

**Verdict:** accepted

This is an incremental re-review of the one line changed since `00ebbfb`: the last two sentences of the third Check for `quadraticWeilOperators` (`README.md` line 1104, §3.3). The previous finding is repaired, and the repair adds no new defect. This report has no findings.

## Previous findings

- R01 — repaired: line 1104 now says "A model in which the Fourier element is an involution is excluded: the Hartley transform … which is `H = ((1−i)F + (1+i)F⁻¹)/2`, squares to the identity … The cosine transform `C = (F + F⁻¹)/2` is no model either: `C² = (1 + F²)/2` …"

## Verified sound

**Gate, dependency check, build.**
- The gate, rerun at this head, prints `gate GeometryOfNumbersAndQuadraticArithmetic: set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run (`scratch/gate.md`) also has `build=0 OK`.
- Dependency check, verbatim: `depcheck: 239 roadmaps, 2373 edges, 0 problem(s)`. The changed line's supplier, AnalyticNumberTheoryPartII, is at position 50 of the merge order; this roadmap is at 148.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat 00ebbfbd..HEAD` is `README.md | 2 +-` and nothing else. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `Suggested.lean` is unchanged since `04dd46e`. `lake env lean` gives 21 `declaration uses sorry` warnings, no error and no other warning, in 12 s. The warnings are at lines 70, 80, 103, 129, 155, 203, 212, 223, 243, 257, 270, 276, 291, 301, 349, 381, 393, 406, 440, 466 and 476.
- One-tactic probe, rerun on a scratch copy. Each `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | (positivity; done) | (aesop; done) | exact le_rfl | decide`. All 21 theorems fail, with errors at probe lines 76, 85, 109, 137, 163, 208, 217, 235, 248, 266, 272, 278, 296, 309, 351, 388, 403, 416, 442, 470 and 481, so none is padding.
- The 35 elaborated signatures (`scratch/signatures.md`) come from the unchanged file. The 10 "lost binder" leads are the false positives the earlier reports resolved: anonymous-arrow hypotheses, and definitions whose types do not mention the flagged instances.

**Mathematics of the changed sentences.**
- **Fourier convention.** AnalyticNumberTheoryPartII §5.3g, at its open head (`roadmaps show` lines 682–686), fixes:
  - `ψ_ℝ(x) = exp(2πix)` and `f̂(y) = ∫ f(x) ψ_v(B(x,y)) dx`;
  - `dx` as the self-dual measure for `B = xy` on `ℝ`;
  - `f̂̂(x) = f(−τx)`.

  So `F` has kernel `e^(+2πixy)` and `F⁻¹` has kernel `e^(−2πixy)`.
- **Hartley identity.** `cos t + sin t = ((1−i)e^(it) + (1+i)e^(−it))/2`, so `H = ((1−i)F + (1+i)F⁻¹)/2` holds exactly under the + sign of §5.3g. The sign in R01's suggested repair, `(1+i)F + (1−i)F⁻¹`, belongs to the opposite convention. The author's sign is the right one here.
- **`H² = 1`.** Use `(1−i)² = −2i`, `(1+i)² = 2i`, `(1−i)(1+i) = 2`, and `F² = F⁻² = P`, where `P` is reflection. Then `H² = (−2iP + 2·2 + 2iP)/4 = 1` on `S(ℝ)`, and `H` preserves `S(ℝ)`. So the Hartley transform is a genuine involutive model, and the law `F² = (dilation at −1)` excludes it.
- **`C²` is a projection.** `C² = (F² + 2 + F⁻²)/4 = (1 + P)/2`, and `((1+P)/2)² = (1+P)/2`. Its image is the even functions, as stated. The sentence "no model either" holds under both readings:
  - `C` is not an involution, since `C²φ(1) ≠ 1`;
  - the Check excludes `C`, since `C²φ(1) ≠ e^(−4π)`.
- **Degenerate case.** For an even test function, for example `e^(−πx²)`, the sine part integrates to zero. Then `H = C = F` and `F² = 1` on it, so all three models give `e^(−π)` at `1` and none is excluded. The Check's non-even `φ(x) = e^(−π(x−1)²)` is what makes it discriminate.
- **Agreement with the rest of §3.3.** The changed sentences are consistent with:
  - the first Check (line 1102), "dilation at −1 reflects the argument";
  - the definition at line 1098, normalized dilation `|a|^(m/2)φ(ax)`, which is `φ(−x)` at `a = −1`;
  - the supplier-table row (line 267), "two transforms give `φ(−x)`".

  The new text introduces no object, no Lean name and no locator. Its backticked spans are formulas, and the gate's `readme-ids-missing=0` agrees.
- **Style.** The changed line uses Unicode mathematics inside code spans. It has no LaTeX delimiters and no process words.

**Seeded sample.** The changed line is in §3.3, which runs from line 1036 to the §3.4 heading at line 1228. §3.3 is not among this round's sampled targets (2.2, 2.5, 2.6, 2.8, 3.2, 3.4, 4.2, 4.7, 5.1, 6.1, 6.1a, 6.2, 6.7, 6.10b, 6.11). The changed sentences carry no locator, so no sampled target falls in the change. `grep unverified` on the README finds 0 flagged locators.

**Overlaps and citations.**
- `scratch/overlaps.md` reports no other open pull request that changes this roadmap and no dropped ids.
- Its lead that IntegralLattices §7E is defined only by an open revision is false: on main, `TauCetiRoadmap/IntegralLattices/README.md` line 2474 is "**7E. The archimedean factor.**" That text is untouched.
- None of the 22 Lean-name leads in `scratch/citations.md` is at line 1104. They sit at README lines 176, 196, 234, 483, 536, 546, 581, 634, 705, 727, 741, 1283, 1346, 1533, 2177, 2232 and 2757, all in untouched text that the earlier reports passed.

**Adversarial table.** The rows for untouched statements are carried from the previous reports. The new rows carry values computed for the changed sentences, by midpoint Riemann sums on `[−12, 12]` with 24 000 nodes for the first transform and on `[−8, 8]` with 1 200 nodes for the second. The script is in the job's scratch directory, not in the repository. Each value is cross-checked with the closed form.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Every untouched statement (the 50 rows of the r13 table, the 7 rows added by r14, and the r15 rows for the first part of Check 3: `F²φ(1) = e^(−4π)`, the intermediate transform at `y = 0.7`, self-dual `dx`, the sign of `ψ` and `Q = x²/2` against `x²`) | as in those reports | as in those reports | text unchanged; carried |
| `H = ((1−i)F + (1+i)F⁻¹)/2` | `φ = e^(−π(x−1)²)`, `y = 0.7` | direct `Hφ(0.7) = −0.2703034`; stated combination `−0.2703034 + 0i`; opposite signs `(1+i)F + (1−i)F⁻¹` give `0.1377264` | holds with the stated signs under the §5.3g convention |
| `H² = 1` on `S(ℝ)` | same `φ`, `x = 1` | `H²φ(1) = 1.0000000`; algebra `(−2iP + 4 + 2iP)/4 = 1` | holds; the Check excludes `H`, since `F²φ(1) = 3.4873424·10⁻⁶` |
| `C² = (1+F²)/2`, projection onto even functions | same `φ`, `x = 1` | `C²φ(1) = 0.50000174367118`; `(1 + e^(−4π))/2 = 0.50000174367118`; `((1+P)/2)² = (1+P)/2` | holds; `C` is excluded and is not an involution |
| `F²` = dilation at `−1` (recomputed) | same `φ`, `x = 1` | `F²φ(1) = 3.4873424·10⁻⁶ + 4·10⁻¹⁷ i`; `e^(−4π) = 3.4873424·10⁻⁶` | holds |
| Degenerate test function | even `e^(−πx²)`, `x = 1` | `Fφ = Hφ = Cφ`; `F²φ(1) = H²φ(1) = C²φ(1) = e^(−π) = 0.0432139` | no model is separated, so the Check's non-even `φ` is necessary; it uses one |

**Library declarations opened at the pins.** None: the changed line cites no Mathlib or Tau Ceti declaration.

**Cross-roadmap citations resolved.** Two:
- AnalyticNumberTheoryPartII §5.3g, at its open head: the character, the self-dual measure and the double-transform law.
- IntegralLattices §7E, on main, line 2474.

## Not verifiable

- Weil 1964 (*Sur certains groupes d'opérateurs unitaires*), cited at line 1099, is neither in the sources cache nor in the manifest. The changed sentences have no locator and rest on AnalyticNumberTheoryPartII §5.3g, so nothing in the change depends on that text.
- The not-verifiable items of the previous reports are unchanged (Siegel 1945, Banaszczyk 1993, Siegel 1935, Iwaniec 1987, Wall §13A, Kervaire–Milnor, Axler–Bourdon–Ramey and the unsampled sources). The changed line cites none of them.
- Ownership against open pull requests was checked only for the changed line, which introduces no object.

## Source issues

- none
