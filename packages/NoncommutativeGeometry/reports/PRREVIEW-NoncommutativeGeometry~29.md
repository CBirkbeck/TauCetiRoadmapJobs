# Review of NoncommutativeGeometry (pull request #1143 at ff20b6b)

**Verdict:** accepted

This is an incremental re-review. It covers the 32 lines of `TauCetiRoadmap/NoncommutativeGeometry/README.md` changed since ae7c72a and the rewritten pull-request description. `Suggested.lean` has not changed since ae7c72a.

This report has no findings. All three findings of the previous report are repaired, and the repairs introduce no new problem. The gate passes.

## Previous findings

- R01 — repaired: the description's own "Merge order" section now reads "This roadmap is on main, so it is the owner: #866 merges after this pull request; #866 replaces those definitions with a citation of NoncommutativeGeometry N6; #866 drops the consumer entry".
  - The README side was already correct (README 50–56 and 1867–1873).
  - #866 is still at 1377338a. Its `TauCetiRoadmap/OperatorKTheory/README.md` lines 1782–1784, 1796–1798 and 2324–2326 still define `A_θ` and τ, and still list this roadmap as a consumer of K7.
  - #866 cannot repair this before this pull request merges. Main's `TauCetiRoadmap/NoncommutativeGeometry/README.md` line 57 still says "K7 owns all real-parameter rotation C*-presentations", and a revision on a pull request is never a dependency.
  - So the order stated in the description is the whole of this pull request's share of the repair. The rest is for #866's own review after this merge.
- R02 — repaired: the description now says "both its README and its Suggested.lean"; "states one headline theorem with sorry: `bijective_matrixExtension`"; "x⊠_u y … x⊠_s y"; "no AlgebraicKTheory section is an input"; "Nothing from SmoothBanachRepresentations Layer 8 is an input".
  - The build report for 84190a1e is gone.
  - The #866 order from R01 has been added.
  - Every claim was checked against the head; see Verified sound.
- R03 — repaired: README 1391–1396 now reads "the pinned `TauCeti.OperatorIdealFamily.mul_singularValue_le_gauge_logarithmic_mul` gives `(j+1)μ_j(|D|⁻ⁿ)≤‖|D|⁻ⁿ‖_(1,∞)log(2+j)` with N4's quasi-norm, and `μ_j(|D|⁻¹)=μ_j(|D|⁻ⁿ)^(1/n)`".
  - N5's *Needs:* line (1476) adds that name and `OperatorIdealFamily.logarithmic`.
  - The suggested test is now a Check at 1434–1439, the circle equality at j=1.
  - The previous report's remark on N4 (an uncited `μ_N≤σ_N/N`) is also repaired, at 1210–1213 and on N4's *Needs:* line (1308).

## Verified sound

**Gate, dependency check, build and signatures.**
- `gate … NoncommutativeGeometry --base origin/main` at ff20b6b: every scanner is 0 and the result is `OK`, exit 0. The worker's gate at the same head adds `build=0`.
- The dependency check (`--movable --pr 1143`) prints `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The branch and main pin the same versions: Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.
- Since the merge base, main has changed only `STATUS.md` and `PROGRESS.md` in this folder. `git merge-tree` merges the head into main cleanly.
- `lake env lean TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. Its only warning is `declaration uses sorry` at 64:8.
- I appended `#check @TauCetiRoadmap.NoncommutativeGeometry.bijective_matrixExtension` to a scratch copy, because the file is a `module`. The elaborated type matches `signatures.md` exactly:
  - binders `[CommRing R] [Algebra ℚ R]`, `[Ring A] [Algebra R A]`, `[AddCommGroup M] [Module R M]` and `[Fintype ι] [DecidableEq ι] [Nonempty ι]`;
  - conclusion `Function.Bijective (matrixExtension M ι n)`.
  - No binder is lost, and the type agrees with the README's N1.Cyclic statement.
- Padding: the pin has only cochain-level injectivity (`matrixCochainExtension_injective`, `RingTheory/CyclicCohomology/Matrix.lean`:292). Nothing there makes the cohomology map bijective, and `matrixExtension` (497) has only `matrixExtension_mk`. The headline does not close in one tactic.

**Library declarations opened at Tau Ceti 2fd255d, `Analysis/OperatorIdeal/Family/Logarithmic.lean`.**
- `public section` at line 61.
- `logarithmic` at 163: gauge `⨆ N, K_(N+1)(T)/log(N+2)` in `ℝ≥0∞`, which is ∞ outside the ideal.
- `gauge_logarithmic` at 210: the same supremum, written over N≥1 as `K_N/log(1+N)`. This is the README's "the supremum above" (1166–1170).
- `kyFanGauge_le_gauge_logarithmic_mul` at 232.
- `mul_singularValue_le_gauge_logarithmic_mul` at 239: `((N:ℝ≥0∞)+1)·a_N(T) ≤ gauge T · ofReal(log(N+2))` for every bounded `T : E →L[𝕜] F` between Hilbert spaces, with no membership hypothesis. This justifies the contract's "for every N and every bounded T" (343–347).
- The linear Dixmier trace that main's `PROGRESS.md` mentions (`linearDixmierTrace`, at Tau Ceti 7ca783d) is absent at the pin. `Family/` has no `DixmierTrace/` directory. So N4 still has to construct it, as the README says.

**The changed passages, claim by claim.** Values are in the table below.
- **Contract, 343–347.** The bound, the gauge and the scope match line 239.
- **N4, 1169–1170.** "Its quasi-norm ‖T‖_(1,∞), the supremum above" is the pinned gauge.
  - Connes normalises differently: on p. 310 (connes94 line 11654) his norm is `sup_(N≥2) σ_N/log N`. The README fixes its own normalisation explicitly, and nothing in the README uses Connes' normalisation.
- **N4, 1209–1213.** `m(n)−m(n−1) = μ_(n−1)/log(1+n) − m(n−1)·log(1+1/n)/log(1+n)`.
  - The first term is at most `‖S+T‖_(1,∞)/n` by the pinned bound at N=n−1, and `‖S+T‖_(1,∞)` is finite because the ideal is closed under sums.
  - The second term tends to 0 because m is bounded.
  - n=1 involves the junk value m(0)=0/0 in one term only, which no generalized limit sees.
- **N5, 1391–1396.** The pinned bound at N=j is exactly the displayed inequality. `μ_j(|D|⁻¹)=μ_j(|D|⁻ⁿ)^(1/n)` holds for positive compact |D|⁻¹, because t↦tⁿ is increasing. Then `Σ_j μ_j(|D|⁻¹)^q ≤ Σ_j (C log(2+j)/(j+1))^(q/n)`, which is finite exactly when q>n.
- **N5 circle Check, 1434–1439.** Recomputed for N≤2·10⁶; see the table.
- **Notation.** `‖·‖_(1,∞)` denotes only the logarithmic gauge throughout the README (345, 1169, 1213, 1394, 1435, 1437). The weak trace class `S_(1,∞)` never uses the symbol, so the new notation collides with nothing.

**Locators in the changed paragraphs, read in the cache.** No new locator was added. These are in or next to the changed paragraphs:
- (γ) on p. 311 (connes94 line 11720);
- Definition 2 and the additivity of Tr_ω on positive operators in L^(1,∞) on p. 312 (connes94 lines 11754–11762);
- Proposition 3(b) on p. 312 (connes94 line 11767).

The README's "Connes IV.2, p. 312, after Definition 2 … the duplication condition (γ) on p. 311" is exact.

CRSZ Theorem 16(b), Definition 13(d) and Connes IV.2 Theorem 8 next to N5's changed lines were read in r28 and are unchanged. The seeded sample of 15 locators, verified in r27, is carried; none of them falls in the changed lines.

**The description (R02), checked against the head.**
- The README headings are the house shape, and each of N1–N7 ends with Examples and Dependencies (lines 777–1845).
- The supplier list matches the roadmap contract table (440–449) and every *Needs:* line (580, 775, 930, 1160, 1308, 1476, 1668, 1845). All seven suppliers are on main.
- The four former suppliers are named on main's README lines 53–58. None of them is an input at the head.
- Main's `Suggested.lean` declares `CyclicTwoCocycle`, `torusTwoCochain`, `torusTwoCocycle`, `NormalizedEvenCycle`, `SpectralTriple` and `positiveProjection` (lines 30–102). The head declares only `bijective_matrixExtension`.
- The docstring names `UniversalForms.cycleCocycle_trace` and `traceDerivationPairCocycle`, and lists the four headlines that are not statable.
- The Hardy-product signs and pairings match README 1700–1723.
- The N5 bullet matches 1386–1396.
- The generated block (this pull request → #1187) agrees with the new order (#866 after this one).

**Ownership and overlaps.**
- `roadmaps grep` for the pinned bound's name, and for the inclusion of `L^(1,∞)` into `S_q`, finds only this README. No other roadmap owns the summability step.
- `overlaps.md`: this roadmap cites no id that an open pull request drops, and no id that only an open revision defines. This pull request drops no id that another roadmap cites.
- #1187 (pin bump) is ordered after this pull request.
- The citation check finds nothing missing.

**Adversarial pass.** Values were computed in pure-Python scratch scripts. Rows marked (r28) carry that report's values, for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: pinned bound, every N and every bounded T (343–347) | N=0; T=0; T=diag((j+1)^(−1/2)), outside the ideal; circle \|D\|⁻¹, j<2·10⁶ | N=0: a₀=‖T‖ ≤ (‖T‖/log 2)·log 2, equality; T=0: 0≤0; outside: gauge ∞ in ℝ≥0∞ and log(N+2)≥0.693, so the right side is ∞; circle: 0 violations | true; Logarithmic.lean:239 has no membership hypothesis | none |
| N4: ‖T‖_(1,∞) is "the supremum above" (1169–1170) | T=diag(1/(j+1)), N≤10⁶ | sup H_N/log(1+N)=1.442695 at N=1, which is 1/log 2 (the pin's first term ‖T‖/log 2); N=2 gives 1.365; Connes' sup_(N≥2) σ_N/log N is a different normalisation | true | none |
| N4: consecutive differences tend to 0 via the pinned bound at N=n−1 (1209–1213) | S+T on ℓ²⊕ℓ², each 1/(j+1) twice | nμ_(n−1)=2.0 against ‖S+T‖ log(1+n) ≥ 1.984·log(1+n) = 4.76, 13.71, 27.41 at n=10, 10³, 10⁶; m(n)−m(n−1)=8.0·10⁻³, 5.0·10⁻⁶, 1.2·10⁻⁹ | true | none |
| N5: summability from the pinned bound, μ_j(\|D\|⁻¹)=μ_j(\|D\|⁻ⁿ)^(1/n) (1391–1396) | circle, n=1; N4's block T in the n=2 witness | circle: 2μ₁=4 against (4/log 3)·log 3=4.000; block T: gauge 2.48534, and (j+1)μ_j against gauge·log(2+j) gives 4 vs 4.000 at j=3, 2 vs 5.46 at j=7, 4 vs 8.69 at j=31; witness μ_(2j+1)(D⁻¹)²=μ_j(T) | true; S_q exactly for q>n | none |
| N5 circle Check: quasi-norm and equality (1434–1439) | σ_N/log(1+N), N≤2·10⁶; j=0, 1 | 2.88539 (N=1), 3.64096 (N=2) = 4/log 3, 3.36629 (N=3), 2.17512 (N=2·10⁶), decreasing to 2; j=1: 4=4.0000; log(1+j) at j=0: 2 against 0 | true; the log(1+j) variant is refuted | none |
| N4 and N5 *Needs:* lines (1308, 1476) | the gate's readme-ids check; the pinned file | both names resolve (logarithmic:163, bound:239, inside the public section) | true | none |
| R02: description against head | main's and the head's Suggested.lean; *Needs:* lines; main README 53–58 | 7 declarations on main against 1 at the head; 7 suppliers, all on main; 4 former suppliers absent from every *Needs:* line | true | none |
| R01: `A_θ` order | #866 at 1377338a; main NCG README 57 | #866 lines 1782–1784, 1796–1798, 2324–2326 unchanged; main still gives K7 the rotation presentations; the description orders #866 after this pull request | order stated; #866 must follow after the merge | none |
| N4 additivity Check (1246–1253) (r28) | N=10⁶ | 2H_N=28.785453; σ_N(S+T)=27.399160; means 2.08356 and 1.98322 | true | none |
| N5 hypothesis at n=1 (1386–1391) (r28) | circle; N4's block T | both readings are the logarithmic ideal; σ_(2M)/log(1+2M)=2.2082 at M=10⁵ | the two coincide | none |
| N5 hypothesis at n=2 (1450–1461) (r28) | D=diag(μ_j(T)^(−1/2))⊗σ₁ | σ₁σ₃+σ₃σ₁=0; (2j+2)μ_(2j+1)(D⁻¹)²=4, 8, 12, 16 | strictly weaker; Check true | none |
| [F,π(a)]=([D,π(a)]−Fδ(π(a)))\|D\|⁻¹ (r28) | random 6×6; circle z | error 1.3·10⁻¹⁵; the order δ(a)F gives error 19.17 | true | none |
| \|D\|⁻¹∈S_q exactly for q>n (r28) | n=2 witness, q=2, 2.5, 3 | q=2 diverges (35.19 to 131.19); 17.38/18.09; 12.40/12.46 | true | none |
| N5 theorem, degenerate case (r28) | finite-dimensional H, n=1 | φ_ω=0 and τ₁(c)=0 | 0=0 | none |
| `bijective_matrixExtension` (r28) | ℚ against M₂(ℚ), n=0, 1; ι=∅; R=0 | HC⁰ 1 vs 1; HC¹ 0 vs 0; ι=∅ needs `Nonempty`; R=0 gives 0 vs 0 | true | none |
| N1.Tensor cross norms (r28) | ℓ¹₂⊗ℓ¹₂ | projective 4; injective 2 (ℝ), 2.828427 (ℂ) | true | none |
| N1.Cyclic S normalisation, signs (r28) | shuffles; M₂(ℂ); circle ψ | signs sum 2; (bφ)=1; ψ(z⁻¹,z)=1, ψ(z,z⁻¹)=−1 | true | none |
| N2 pairing constants, Bott class (r28) | m=0..5; two points z | 1/m!; −0.159155i=1/(2πi); 0.8011537i both sides | true | none |
| N3 Hardy calibration, Schatten (r28) | ℓ²(ℤ) at ±50; diag(2,1) | τ₁=2; pairing −1 = ind(PzP); Hölder 4≤5; ζ(1.1)=10.5844 | true | none |
| N4 non-measurable operator; L^(1,∞)∖S_(1,∞) (r28) | recursion to k=60; k=1..5 | 0.743683 / 0.756317; σ bounds 7…39 ≤ 9…49 | true | none |
| N5 bounded transform, absolute value (r28) | diag(0,1,−1); diag(k+½) | 1−F²=\|(D−i)⁻¹\|²; D⁻¹ gives 1−1=0 | true | none |
| N6 multiplier, rotation, projections (r28) | θ=½, ¼; random idempotent | e(θ)=i vs e(−θ)=−i; Tr e=Tr p=2 | true | none |
| N7 Fourier triple, Hardy product, Heisenberg (r28) | R=200, 800; W=(σ₁−σ₂)/√2 | ratios 0.14616, 0.14853 tending to 0.15915; ((1+i)√π)²/(2πi)=1; c₁=1 | true | none |
| CRSZ bullet, 2-torus sign (r28) | R=60, 150 | 12.5659i, 12.5663i against 4π; Fγ gives the negative | true | none |

## Not verifiable

- None. Every locator in or next to the changed passages was read in the cached connes94 and carey-rennie-sukochev-zanin texts.

## Source issues

- none
