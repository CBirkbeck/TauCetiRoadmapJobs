# Review of StochasticCalculus (pull request #1030 at 6d44140)

**Verdict:** accepted

This is an incremental re-review of the 30 lines changed since `d668a62`. Only `README.md` changed: `Suggested.lean` and `metadata.toml` are byte-identical to the previous head, and nothing outside the folder changed. The diff has six hunks:

- the corrected reverse bound in §0.1's proof sketch;
- two §0.1 Checks, one rewritten and one new;
- five locators coarsened to section or chapter level: Karatzas–Shreve §2.7.A → §2.7 in §0.3; §3.2.A → §3.2 in §3.1 twice and in References; Revuz–Yor VIII §1 → VIII in the Layer 8 introduction and §8.2.

The previous finding is repaired, the repair introduces no new problem, and the gate passes. This report has no findings.

## Previous findings

- R01 — repaired: `README.md:404`–`:406` now reads "in the other, `x/(1+x)≤x≤ε` on `{|f−g|≤ε}` and `x/(1+x)≤1` off it give `d(f,g)≤ε·P(Ω)+P(|f−g|>ε)`, where the finite total mass `P(Ω)` multiplies ε". The new Check at `:436`–`:439` records the mass-3 witness of the previous report.

## Verified sound

**Gate, elaboration, dependency check (run on this head, `6d441403`).**

- **Gate:** `gate … StochasticCalculus --base origin/main` exits 0, and every scanner reports 0, including `dropped`, `readme-ids-missing`, `stray-files`, `outside-folder`, `statement-hygiene` and `depcheck`. The worker's gate with the targeted build also reports `build=0`.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StochasticCalculus/Suggested.lean` exits 0 in 7.4 s. It prints exactly 40 warnings, all of them "declaration uses `sorry`", one for each of the 40 theorems. There are no errors and no other output.
- **Suggested.lean is unchanged:** `git diff --stat d668a62f HEAD` touches only `README.md`.
  - The 58 elaborated signatures in `scratch/signatures.md` are therefore those the previous report compared.
  - The one flagged binder is `[MeasurableSpace Ω]` on `stochasticExponential` (`Suggested.lean:513`). Its body is `Real.exp` of `I t ω` minus half the `timeMeasure t` integral of `θ²`, which needs no measurable structure on Ω, so no hypothesis is lost.
  - The previous padding probe (40 theorems, all failing under `first | rfl | infer_instance | trivial | simp`) applies to the unchanged file.
  - The one citation lead, `ElementaryIntegrand.toProcess`, is this roadmap's own `def` at `Suggested.lean:121`.
- **Nothing outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StochasticCalculus'` is empty.
- **Dependency check** (`gate --depcheck … --movable`) prints:

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

  It prints no UPWARD, CYCLE or `moved:` line. StochasticCalculus is line 210 of the merge order. The diff adds no supplier citation.
- **Overlaps:** `roadmaps overlaps StochasticCalculus` (rerun) finds no other pull request changing this folder, no dropped id and no id defined only by an open revision. The diff introduces no new object, so ownership against open work is as settled in the previous report.

**§0.1 internal consistency.**

- The corrected bound at `:404`–`:406` is consistent with the scope at `:399` ("On finite measure spaces") and the finiteness remark at `:415`.
- The limit argument now reads: for every ε, `limsup d(f_n,g)≤ε·P(Ω)`, which tends to 0 because `P(Ω)<∞`. This is correct.
- The Markov direction at `:404` needs no normalization.

**Locators of the changed hunks.** I checked them against a public library scan of the table of contents of Karatzas–Shreve, second edition (toc.uni.li, record FLMF024400):

| Section | Title | Page |
|---|---|---|
| §2.7 | Brownian Filtrations | 89 |
| §2.7.A | Right-continuity of the augmented filtration for a strong Markov process | 90 |
| §2.7.B | A "universal" filtration | 93 |
| §2.7.C | The Blumenthal zero-one law | 94 |
| §3.2 | Construction of the Stochastic Integral | 129 |
| §3.2.A | Simple processes and approximations | 132 |
| §3.2.B | Construction and elementary properties of the integral | 137 |
| §3.2.D | Integration with respect to continuous, local martingales | 145 |

- `§2.7` (`:655`, augmentation) and `§3.2` (`:1419`, `:1450`, `:3813`, the measure `μ_M`) are therefore correct section-level locators. The coarsening removes the open question of the previous report: whether `μ_M` is defined in subsection A or in the preamble on pp. 129–131.
- The untouched `§3.2.B` at `:1546` and `§3.2.D` at `:1486` agree with the same table of contents.
- The References entry at `:3813` agrees with `:1419` and `:1450`.

**Cached texts re-read on the touched line `:2763`–`:2765`.**

- `morters-peres` lines 1491–1493: Theorem 1.38 under the running header "1.4 The Cameron–Martin theorem 25" (line 1486). It has F(0)=0; part (1) is singularity off D[0,1] and part (2) equivalence on it.
- `hairer-spde` lines 1555–1556: Theorem 4.44, absolute continuity of the translate iff h∈H_µ. The page-31 marker is at line 1539 and the page-32 marker at line 1593.

**Adversarial table.**

- Rows marked (new) are computed in this review for the changed statements.
- Rows marked (r7) are carried forward from `PRREVIEW-StochasticCalculus_r7` for statements the diff leaves untouched, with the values recorded there.
- Rows marked (r6) were carried by r7 from `PRREVIEW-StochasticCalculus_r6`.

| Statement | Instances tried | Computed sides | Result; change |
|---|---|---|---|
| (new) §0.1 reverse bound `d≤ε·P(Ω)+P(\|f−g\|>ε)` | one point, `P=3δ_a`, `f−g≡½`, ε=½; `P=2·Leb[0,1]`, `f−g=2` on [0,½], `1/10` on (½,1], ε=1/5 | `d=1 ≤ 3/2+0`; `d=25/33≈0.758 ≤ 2/5+1=7/5` | holds on finite measures; none |
| (new) §0.1 Markov direction `P(\|f−g\|>ε)≤((1+ε)/ε)d` | `P=3δ_a`, `f−g≡½`, ε=¼; the mass-2 example, ε=1/5 | `3 ≤ 5·1=5`; `1 ≤ 6·25/33=50/11` | holds without normalization; none |
| (new) §0.1 limit step | any finite P, fixed ε | `limsup_n d(f_n,g) ≤ ε·P(Ω)`, then ε→0 gives 0; it needs `P(Ω)<∞`, as stated at `:415` | correct; none |
| (new) §0.1 Check: constants on mass m | m=2: n=1,9,99; m=1; m=0 | `d(n,0)=2n/(1+n)`=1, 9/5, 99/50 → 2=m; `d(n,n+1)=2·½=1`, so not Cauchy and no limit; m=1: `d<1`; m=0: `d≡0`, and `AEEqFun Ω ℝ 0` has one class (every set is null) | correct; none |
| (new) §0.1 Check: `P=3δ_a` discriminator | f=½, g=0, ε=½ | `d=3·(½)/(3/2)=1`; `ε·P(Ω)+0=3/2≥1`; `ε+0=½<1` | discriminates the wrong bound; none |
| (new) §0.1 Checks 1–2 vs the corrected bound | `f_1=1_[0,1]` on Leb[0,1], ε=½; two-point, `f=1_{a}`, ε=½ | `d=½ ≤ ½·1+1`; `d=¼ ≤ ½·1+½` | consistent; none |
| (new) §0.3 augmentation (locator only) | Ω finite with full support; Ω=[0,1], trivial `F_t` | only null set ∅, so `F` unchanged; null-or-conull Borel sets | statements unchanged, §2.7 p. 89 correct; none |
| (new) §3.1 `μ_M` (locator only) | Brownian, (1,3]×A, P(A)=½; M=2B | `(3−1)·½=1`; `E[1_A(2B₃−2B₁)²]=4·2·½=4` | statements unchanged, §3.2 p. 129 correct; none |
| (new) Layer 8 introduction, §8.2 (locator only) | h=2t on [0,3]; h=√t on [0,1]; h(0)=1 | energy `∫₀³4=12`; `∫₀¹dt/(4t)=∞`, not a shift; `h(0)=0` forced, so excluded | statements unchanged; singularity also certified by Mörters–Peres 1.38(1); none |
| (r7) §0.5 predictable section | graph of τ≡1; E=∅ | `P(T<∞)=1=P*(πE)`; T=∞ | correct; none |
| (r7) §1.4 time inversion, LLN, bridge, Volterra | `X_t=tB_{1/t}`, s=1, t=2; T=2, s=t=1; K≡1 | `Cov=1=min(1,2)`; `Var=½`; `t+t²+t³/3` | correct; none |
| (r7) §3.3 `⟨∫XdM⟩=∫X²d⟨M⟩` | X=2, M=B, T=3 | `E(2B₃)²=12=∫4dt` | correct; none |
| (r7) §5.5 Lévy | M=2B; (W,W) | `[2B]_t=4t≠t`; `[M¹,M²]_t=t≠0` | both excluded; none |
| (r7) §6.7 separated windows | sign events, s=1 vs s=½ | `¼=¼·1`; `1/3≠¼` | separation needed; none |
| (r7) §7.5 density, singularity, drifted harmonic, generalized Itô | constant θ; θ=1; b≡c, `f=e^{−2cy}` | `E Z_T²=e^{θ²T}`; `B_t/t→1` vs 0; `e^{−2cx}=f(x)` | correct; none |
| (r7) §8.1 Hairer 4.44; §8.2 identification | µ=N(0,1), h=2; h=t, h=2t at times 1,3 | `0.787≤1.365`; norm² 1; mean (2,6), cov ((1,1),(1,3)) | correct; none |
| (r7) §9.2 `LV`, `V+1` reduction | V=1+x², b=x, σ=1, C=1 | `LV=2x²+1≤3(1+x²)`; `V(x₀)≥−1` | correct; none |
| (r6) §0.6 Poisson; §2.1–§2.5, §3.5, §4.4 Poisson identities | rate 2, t=3; α=0; one-jump path | values in r6 | correct; none |
| (r6) §2.2 class D/DL; §2.3 ruin; §6.1, §6.4, §6.5.3, §9.3 Checks; weak-solution headlines | n=1,100; (W,W); 1/(1−z); b≡1 | values in r6 | correct; none |
| (r6) §10.2 generator; `feynmanKac_scalar`; §5.3 Stratonovich; §1.1 Chentsov; `exists_wienerMeasure` | BM x²; OU; u=sin; p=2m | values in r6 | correct; none |
| (r6) §3.4 domain; `IsItoIntegral`; QV predicate; BDG; Itô C²; Lévy, reflection, local time; §7.1 clocks; DDS; Novikov/Girsanov; Cameron–Martin headlines; §8.3; §9.1, §9.4, §9.4a; §4.2; §1.5 | H=2; A=2t; f=x²; θ=2; h=2t, √t; D_n; d=3 Bessel | values in r6 | correct; none |

**Seeded sample.** Of the sampled targets, only "3.1 predictable measures" falls in the changed text. Its two locators were coarsened to Karatzas–Shreve §3.2, checked above. Its Protter Chapter III citation is untouched. The other sampled targets lie in untouched text that earlier rounds verified, and they are not re-checked here.

**Remark (untouched text, no change requested).** `README.md:2050` cites "Karatzas–Shreve, §2.7.A" after both the right-continuity statement and the Blumenthal germ law. The table of contents above puts the zero-one law in §2.7.C, p. 94; §2.7.A covers only the right continuity.

## Not verifiable

- **Revuz–Yor, Chapter VIII** (settled as uncertified), at `:2713` and `:2763`. Springer's chapter and book pages for the third edition redirect to a login, so the section holding the Cameron–Martin density could not be determined. The chapter-level locator is the safe form. The singularity half that `:2713` also attaches to it is certified independently by Mörters–Peres Theorem 1.38(1) and the proof of Hairer Theorem 4.44, both cited at `:2764`–`:2765`.
- **Karatzas–Shreve, §2.7 and §3.2** (uncertified): only the table of contents was read, not the text.
- **Protter, Chapter III** (uncertified), at `:1451`: untouched.
- **MATH5695**: waived.

## Source issues

- none
