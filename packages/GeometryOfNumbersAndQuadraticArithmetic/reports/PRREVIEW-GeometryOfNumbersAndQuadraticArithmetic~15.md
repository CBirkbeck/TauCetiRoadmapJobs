# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 00ebbfb)

**Verdict:** needs changes

This is an incremental re-review of the one line added since `04dd46e`, the third Check for `quadraticWeilOperators` (`README.md` line 1104). The previous finding is repaired, and the Check's computed values are right under the README's polar convention and the supplier's Fourier convention. One clause of the new Check is false.

## R01 (P3) — the new Check calls the cosine transform an involution

**Location.** `README.md` line 1104, last sentence: "A model in which the Fourier element is an involution, as the cosine transform is, is excluded."

**Claim.** The cosine transform is an example of an involutive model of the Fourier element, and the Check excludes it for that reason.

**Witness.** On `S(ℝ)`, `Cf(y) = ∫ f(x) cos(2πxy) dx` is `(F + F⁻¹)/2`, so `C² = (1 + P)/2`, which projects onto even functions. For the Check's `φ`, `C²φ(1) = (1 + e^(−4π))/2 ≈ 0.5000017`, not `1`. The half-line cosine transform is an involution only on even functions, and there `F² = id` as well.

**Repair.** Replace "as the cosine transform is" with "as the Hartley transform `f ↦ ∫ f(x)(cos 2πxy + sin 2πxy) dx` is", or delete the clause. Tested on the Check's instance: `H = ((1+i)F + (1−i)F⁻¹)/2` gives `H² = (2iF² − 2iF⁻² + 2)/4 = id` on `S(ℝ)`, since `F² = F⁻² = P`. Numerically `H²φ(1) = 1.0000000`, against `F²φ(1) = e^(−4π)`, so the Check excludes this model, and the model really is an involution.

## Previous findings

- R01 — repaired: line 1104 adds "The Fourier element squares to the dilation at a=−1, not to the identity, because the polar pairing is symmetric (`τ = 1`). Over ℝ with `Q = x²/2`, whose polar pairing is `xy` …", so the block (lines 1102–1104) now has three Checks. The clause in R01 above came in with this repair.

## Verified sound

**Gate, dependency check, build.**
- The gate, rerun at this head, prints `gate GeometryOfNumbersAndQuadraticArithmetic: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run (`scratch/gate.md`) also has `build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check, verbatim: `depcheck: 239 roadmaps, 2373 edges, 0 problem(s)`. In the merge order the supplier of the changed passage, AnalyticNumberTheoryPartII, is at 50 and this roadmap is at 148.
- `Suggested.lean` is unchanged since `04dd46e` (`git diff 04dd46ed..HEAD` on it is empty). `lake env lean` gives 21 `declaration uses sorry` warnings and no error, in 7 s. The warnings are at lines 70, 80, 103, 129, 155, 203, 212, 223, 243, 257, 270, 276, 291, 301, 349, 381, 393, 406, 440, 466 and 476.
- One-tactic probe, rerun on a scratch copy: `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | (positivity; done) | (aesop; done) | exact le_rfl | decide`. All 21 theorems fail, with errors at probe lines 76, 85, 109, 137, 163, 208, 217, 235, 248, 266, 272, 278, 296, 309, 351, 388, 403, 416, 442, 470 and 481, so none is padding.
- The 35 elaborated signatures (`scratch/signatures.md`) are unchanged. The previous reviews compared them with the README, and the 10 "lost binder" leads are the same false positives (anonymous-arrow hypotheses, and definitions whose types do not mention the flagged instances).

**Mathematics of the changed Check.**
- **Polar convention.** Line 55 fixes `B(x,y) = q(x+y) − q(x) − q(y)`, so `Q = x²/2` has polar pairing `xy`, as the Check says. With `Q = x²`, as the previous report proposed, the pairing would be `2xy`, the self-dual measure `√2·dx` and the fixed Gaussian `e^(−2πx²)`, and two of the stated values would fail. The Check's choice of `Q = x²/2` is the one that makes them hold.
- **Supplier convention.** AnalyticNumberTheoryPartII §5.3g (open head, `roadmaps show` line 688) fixes:
  - `ψ_ℝ(x) = exp(2πix)` and `f̂(y) = ∫ f(x) ψ_v(B(x,y)) dx`;
  - the self-dual measure `dx` for `B = xy` on `ℝ`;
  - `exp(−πx²)` as its own transform;
  - `f̂̂(x) = f(−τx)`, with `τ = 1` for a symmetric pairing.

  The Check uses each of these as stated, including the `+` sign that gives the intermediate transform `e^(2πiy)e^(−πy²)`.
- **Dilation.** Line 1098 defines the normalized dilation as `|a|^(m/2) φ(ax)`. At `a = −1` this is `φ(−x)`, which equals `F²` exactly, with no scalar. This agrees with:
  - the first Check (1102), "dilation at −1 reflects the argument";
  - the supplier contract (226), "`τ = 1`";
  - the supplier table row (267), "two transforms give `φ(−x)`".
- **Agreement with the second Check (1103).** Take `K = ℚ`, `V = ℚ`, `Q = x²/2` and `f = φ ⊗ 1_Ẑ`. The local different is trivial at every `p`, so `1_(ℤ_p)` is self-dual and fixed. Then `F²f = f(−·)` is the dilation at the principal idele `−1 ∈ ℚ^×`, and `Θ(F²f) = Σ_ξ f(−ξ) = Θ(f)`, as theta invariance for `a ∈ K^×` requires.
- **Ownership.** The added line introduces no object. The double-transform law it pins is AnalyticNumberTheoryPartII §5.3g's, and it is cited, not restated as a target.

**Seeded sample.** The diff falls in §3.3, a sampled target, but the added Check has no locator. The source line above it (1099, Weil 1964) and the other §3.3 locators are unchanged. The other sampled targets (1.2, 2.1, 2.7, 3.2, 3.4, 4.2, 4.3, 6.3, 6.4, 6.6, 6.8, 6.8a, 6.10, 6.11) are untouched by the diff and were read by the previous reviews. No README locator is flagged unverified (`grep unverified`: 0).

**Overlaps and citations.**
- `scratch/overlaps.md` reports no other open pull request that changes this roadmap and no dropped ids.
- Its lead that IntegralLattices §7E is defined only by an open revision is false: on main, `TauCetiRoadmap/IntegralLattices/README.md` line 2474 is "**7E. The archimedean factor.**" This text is untouched.
- The 22 Lean-name leads in `scratch/citations.md` are all in untouched text; none is in the added line.

**Adversarial table.** The rows for untouched statements are carried from the previous reports. The new rows carry values computed for the changed Check: Riemann sums on `[−12, 12]` with 24 000 nodes (Python script `fourier_check.py` in the job's scratch directory, not in the repository), cross-checked with closed forms.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Every untouched statement (the 50 rows of the r13 table and the 7 rows added by r14: zeta-value conversion, self-dual measure under `ψ(a·)`, Poisson `g^*`, `finiteArfInvariant`, `wallFormGroupArf`, IntegralLattices milestones) | as in the previous report | as in the previous report | text unchanged; carried |
| Check 3: `F²` = dilation at `−1` | `ℝ`, `Q = x²/2`, `ψ_ℝ = e^(2πix)`, `φ = e^(−π(x−1)²)`, `x = 1` | `F²φ(1) = 3.4873424·10⁻⁶ = e^(−4π)`; `φ(1) = 1`; `φ(−1) = e^(−4π)` | holds |
| Check 3: intermediate transform | `y = 0.7` | numeric `−0.0662885 − 0.2040149i`; closed form `e^(1.4πi)e^(−0.49π) = −0.0662885 − 0.2040149i` | holds |
| Check 3: self-dual `dx`, fixed Gaussian | `e^(−πx²)` at `y = 0.7` | `0.2145140` on both sides | holds |
| Check 3: sign of `ψ` | `ψ̄_ℝ = e^(−2πix)` | transform `e^(−2πiy)e^(−πy²)`; `F²φ(1) = 3.4873424·10⁻⁶` again | the conclusion does not depend on the sign; the stated transform matches the `+` sign of §5.3g |
| Check 3: polar convention | `Q = x²/2` against `Q = x²` | pairing `xy` (`dx`, `e^(−πx²)` fixed) against `2xy` (`√2·dx`, `e^(−2πx²)` fixed) | `x²/2` is right under line 55 |
| Check 3: wrong models | Hartley `H`; cosine `C` on `S(ℝ)` | `H²φ(1) = 1.0000000`; `C²φ(1) = 0.5000017 = (1 + e^(−4π))/2` | both excluded; `C` is not an involution (R01) |
| Check 3 against Check 2 | `K = ℚ`, `a = −1`, `f = φ ⊗ 1_Ẑ` | local factors `|−1|_v^(1/2) = 1`; `Θ(F²f) = Σ f(−ξ) = Θ(f)` | consistent |

**Library declarations opened at the pins.** None: the added line cites no Mathlib or Tau Ceti declaration.

## Not verifiable

- Weil 1964 (*Sur certains groupes d'opérateurs unitaires*), cited at line 1099, is neither in the sources cache nor in the manifest, and was not fetched. This review edits no manifest. The added Check has no locator and rests on AnalyticNumberTheoryPartII §5.3g, so nothing in the changed passage depends on that text.
- The not-verifiable items of the previous reports (Siegel 1945, Banaszczyk 1993, Siegel 1935, Iwaniec 1987, Wall §13A, Kervaire–Milnor, Axler–Bourdon–Ramey and the unsampled sources) are unchanged, and the changed line cites none of them.

## Source issues

- none
