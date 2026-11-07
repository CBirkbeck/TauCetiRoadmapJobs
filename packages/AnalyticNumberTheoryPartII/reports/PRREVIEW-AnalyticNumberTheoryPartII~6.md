# Review of AnalyticNumberTheoryPartII (pull request #1167 at 480e1c2)

**Verdict:** accepted

:robot: Independent AI review. This is an incremental re-review of the 50 lines changed since a7edaf5: the module-form header and `Subgroup.derivedSeries` in `TauCetiRoadmap/AnalyticNumberTheoryPartII/Suggested.lean`, and in `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` the Layer 5 scope sentence, the Mathlib and AnalyticNumberTheoryPartI supplier paragraphs, §5.7, the new §5.7a, the Layer 5 dependencies, Downstream consumers and reference 128. All four findings of the previous report are repaired, the repairs introduce no new problem, and the gate passes with the build. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean:89` reads `∀ g ∈ Subgroup.derivedSeries (FundamentalGroup lerchDomain lerchBasepoint) 2`; the elaborated type of `lerchContinuation_solvable` shows `Subgroup.derivedSeries` and no deprecation warning is emitted.
- R02 — repaired: `Suggested.lean:1–4` read `module`, `public import Mathlib`, `public import TauCeti.AlgebraicTopology.UniversalCover.Action`; line 43 reads `@[expose] public section` before `noncomputable section`. The worker's gate and my rerun with the build report `build=0 OK`.
- R03 — repaired: §5.7a (README.md:747–762) owns "every number field `K` with `2≤[K:ℚ]≤n` satisfies `κ_K≥c_n/log D_K`" with `c_n=c·min(1/(4n!),c_LS)`; the scope sentence (line 15), the supplier paragraph (line 41), §5.7 (lines 728, 732, 744) and Downstream consumers (line 3014) cite it. ArithmeticStatisticsPartV at its head e95c80e no longer builds the bound: its README.md:56 and :1245 consume it from this roadmap.
- R04 — repaired: README.md:722 names `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow` with `Ideal.absNorm_relNorm` for the tower formula; §5.7a (line 755) names `NumberField.discr_dvd_discr` for `D_F≤D_K`; both are on the *Needs:* lines at 744 and 762.

## Verified sound

**Gate, build and elaboration.** My rerun of the gate at this head with the build and the merge order:

```text
gate AnalyticNumberTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check (`gate --depcheck … --movable`):

```text
depcheck: 240 roadmaps, 2441 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or `moved:` line. ORDER.txt lists AnalyticNumberTheoryPartI at line 90, this roadmap at line 91 and ArithmeticStatisticsPartV at line 110, so the supplier the diff cites is above and the consumer below. `git diff --stat origin/main...HEAD` outside this folder is empty.

`lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all 25 declarations exits 0 in about 4 s with exactly ten `declaration uses sorry` warnings and no other warning or error. All 25 elaborated types are verbatim identical to the worker's signature inventory; the only change from the previous round is the namespace `Subgroup.derivedSeries` in `lerchContinuation_solvable`. The file has no `variable` or `include` block. The README↔Lean comparisons and one-tactic padding probes of earlier rounds carry forward: no Lean statement changed in substance, and §5.7a adds no Lean declaration (it is an intermediate target, not a headline; the headline list and the docstring's not-statable list are unchanged).

**Principles on the changed passages.** The scope sentence, both supplier paragraphs, §5.7, §5.7a, the Layer 5 dependencies, Downstream consumers and reference 128 contain no route-specific shortcut, no re-planning of another roadmap, no upward supplier, no copied passage, no algorithm, no LaTeX, no process word and no pull-request number. Mathematics is in Unicode inside code spans. §5.7 keeps six Checks and §5.7a has six.

**Pinned declarations opened** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):
- `NumberField.dedekindZeta_residue` at `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57`, `dedekindZeta_residue_def` at line 61 (`2^r₁(2π)^r₂·R·h/(w·√|disc|)`, `rfl`), `dedekindZeta_residue_pos` at line 66. For `K=ℚ` the expression is `2·1·1/(2·1)=1`, matching `κ_ℚ=1`.
- `NumberField.abs_discr_gt_two (h : 1 < finrank ℚ K) : 2 < |discr K|` at `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`.
- `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow` at `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:90`, concluding `|disc L| = absNorm(differentIdeal 𝒪 𝒪')·|disc K|^[L:K]`; `NumberField.discr_dvd_discr : discr K ∣ discr L` at line 120.
- `Ideal.absNorm_relNorm (I : Ideal S) : absNorm (relNorm R I) = absNorm I` at `Mathlib/RingTheory/Ideal/Norm/RelNorm.lean:464`, under `Module.Free ℤ R`, `Module.Free ℤ S`, `Module.Finite ℤ S`, which rings of integers satisfy.
- `TauCeti.relDiscr A B := Ideal.relNorm A (differentIdeal A B)` at `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33–36` (namespace `TauCeti` opens at line 24), so `absNorm(relDiscr)=absNorm(differentIdeal)` by `absNorm_relNorm`, as README.md:39 and :722 say.

**Supplier citations resolved** against AnalyticNumberTheoryPartI at its open head 20d500c:
- §0.9 (line 302) `quadratic_LFunction_one_lower_bound`, `L(1,χ)≥c/log q` for conductor `q≥3`.
- §0.31b (lines 775–777) `.siegel_gap`: `1−β≥c_LS/log q` for every real zero `β∈(0,1)`, effective constant of §0.34.
- §0.34 (line 805) `landau_siegel_exclusion`, effective absolute `c_LS`, every conductor `q≥3`.
- §2.5 (line 1149) identifies the residue with `NumberField.dedekindZeta_residue K`.
- §2.7 (lines 1171–1178) `ζ_E=ζ_F·L_f(s,η)` for quadratic `E/F`, extended to the continuations; its Check names the `F=ℚ` case `ζ_K=ζ·L(s,χ_D)`.
- §2.15 (line 1338) `dedekindZeta_residue_le`.
- §2.31e (lines 1604–1619): subpower bound with "The constant is allowed to be ineffective"; interfaces `dedekind_residue_lower_of_zero_gap`, `near_one_dedekind_zero_quadratic_subfield`, `dedekind_residue_subpower_lower`; threshold `1/(4n!logD_K)`; `D_F≤D_K` by the different tower. This matches the scope sentence and the proof route of §5.7a step by step.

**Ownership by object.** `roadmaps grep --fixed` over main and the 466 open heads: `κ_K≥c_n/log D_K` occurs at this roadmap's lines 15 and 749 and as a citation at ArithmeticStatisticsPartV README.md:56; `Effective fixed-degree residue lower bound` occurs only at this roadmap's line 747; `κ_F≥c_k/log D_F` only in ArithmeticStatisticsPartV's citation; `Friedman–Skoruppa` only here. ArithmeticStatisticsPartV at e95c80e cites "AnalyticNumberTheoryPartII §5.7 (effective residue lower bound …)" at its lines 89, 1245 and 1428; the bound now lives in §5.7a, which §5.7 names at line 732, so the citation resolves; sharpening it to §5.7a is that pull request's matter. The bound has one owner.

**Sources.** Of the fifteen seeded targets only §5.7 is in the diff; its locators and the new §5.7a's were checked against the cache.
- Stark74 (image scan, OCR; cache page `N` = printed page `N+133`): Lemma 3 at lines 203–211, printed p. 139 (header at line 182): at most one zero of `ζ_M` in `σ≥1−(4 log D_M)^(−1)`, `|t|≤(4 log D_M)^(−1)`, real and simple, for `M≠ℚ`. Lemma 4 at lines 251–281, pp. 140–141 (headers at lines 224 and 271): `κ>c₄(1−β₁)` with `β₁=β₀` or `1−(4 log D_M)^(−1)`, which is the `c·min(1/log D,1−β)` form up to the factor 4 absorbed in `c`. Lemma 8 at lines 454–462, p. 145 (header at line 427): degree `n>1`, `c(n)=4n!` for nonnormal `k` (4 for normal), a real zero `β≥1−1/(c(n) log D_k)` of `ζ_k` is a zero of `ζ_F` for a quadratic `F⊂k`, proved through Theorem 3 (lines 397–400, p. 144) and `ζ` having no real zero in `(0,1)`. Using `4n!` for every field is valid since `4n!≥4`. All three README locators agree.
- LOWW (arXiv 2110.07712v2): Remark 2.7 at lines 403–427, p. 8: the Lemma 2.5 upper bound is effective, the exceptional-zero case handled by Aramata–Brauer and Stark Theorem 3. Remark 3.3 at lines 513–517, p. 10: Propositions 3.4, 3.6, 3.12 have effective constants. Lemma 2.5 (lines 393–399, p. 8), Lemma 3.5 and Proposition 3.4 (lines 535–563, pp. 10–11) as in the previous report. README.md:737 and :744 describe these correctly.
- Reference 128 (README.md:3046, URL at 3077) is the GDZ copy the cache was fetched from; the board manifest records `Stark74` as certified with locator "Lemma 3; Lemma 4; Lemma 8" and `LOWW` with the two Remarks added. No manifest was edited.

**Adversarial pass on the changed statements.** All values below are computed in this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.7a bound `κ_K≥c_n/log D_K`, Check 1 | `K=ℚ(√−3)`: `r₁=0,r₂=1,D=3,w=6,h=R=1` | `κ=2π/(6√3)=6.2832/10.392=0.6046`; `κ log 3=0.6046·1.0986=0.6642`; without `w`: `2π/√3=3.628=6·0.6046` | Holds; `c₂≤0.6642` | None |
| §5.7a Check 2 | `K=ℚ(√5)`: `r₁=2,D=5,R=log φ=0.48121` | `κ=4·0.48121/(2√5)=1.92485/4.47214=0.4304`; `κ log 5=0.6927`; `hR=0.4812` versus `(2·0.6642/39.478)·2.2361/1.6094=0.0468` | Holds | None |
| §5.7a Check 3 | cubic `x³−x−1`, `D=23`, `r₁=r₂=1`, `w=2`, real root `1.3247` | `R=log 1.3247=0.2812`; `κ=2·2π·0.2812/(2√23)=3.5337/9.5917=0.3684`; `κ log 23=0.3684·3.1355=1.155`; no quadratic subfield since `2∤3` | Holds; only the first case occurs | None |
| Class-number–regulator form `hR≥(2c_n/(2π)^n)√D/log D` | general `r₁+2r₂=[K:ℚ]≤n` | `κ≥c_n/log D` and `κ=2^(r₁)(2π)^(r₂)hR/(w√D)` give `hR≥c_n w√D/(2^(r₁)(2π)^(r₂)log D)≥2c_n√D/((2π)^n log D)` using `w≥2`, `2^(r₁)(2π)^(r₂)≤(2π)^(r₁+r₂)≤(2π)^n` | Holds | None |
| Subpower consequence `κ≥e·a·c_n D^(−a)` | `a=1/2, D=100`; general | `log x/x^a` is maximal at `x=e^(1/a)` with value `1/(ea)`, so `log x≤x^a/(ea)`; `log 100=4.605≤10/1.359=7.358` | Holds | None |
| `D_K≥3 ⇒ log D_K>1` | `K` quadratic with `D=3` | `abs_discr_gt_two` gives `|disc|>2`, integer so `≥3`; `log 3=1.0986>1` | Holds | None |
| Case split and `c_n` | first case `1−β≥1/(4n! log D)`; no zero; second case | first: `κ≥c·min(1/log D,1−β)≥c/(4n! log D)`; no zero: `κ≥c/log D≥c/(4n! log D)`; second: `1−β<1/(4n! log D)≤1/8` so `β>7/8>0`, and `.siegel_gap` gives `1−β≥c_LS/log D_F≥c_LS/log D_K`, so `κ≥c·min(1,c_LS)/log D≥c·min(1/(4n!),c_LS)/log D` | `c_n=c·min(1/(4n!),c_LS)` effective | None |
| `ζ` has no zero in `(0,1)` | `σ=1/2` | `(1−2^(1−σ))ζ(σ)=Σ(−1)^(m−1)m^(−σ)`, alternating with decreasing terms, so `>1−2^(−1/2)=0.293>0`; `1−2^(1/2)<0`, so `ζ(1/2)<0`, nonzero (`ζ(1/2)=−1.4604`) | Holds | None |
| `D_F≤D_K` direction (Check 5) | `K=ℚ(i,√5)`, subfields `ℚ(i),ℚ(√5),ℚ(√−5)` | `D_K=4·5·20=400`; `4∣400`, `5∣400`, `20∣400`; `c_LS/log 4>c_LS/log 400`; reverse fails at `ℚ(i)` since `log 4=1.386<5.992` | Holds | None |
| `K=ℚ` excluded (Check 6) | `K=ℚ` | `D=1`, `log 1=0`; `κ_ℚ=2·1·1/(2·1)=1` from `dedekindZeta_residue_def` | Hypothesis `[K:ℚ]≥2` needed and present | None |
| Quadratic case equals §0.9 (Check 4) | `K=ℚ(√−3)` | `κ=0.6046=π/(3√3)=L(1,χ₋₃)`; conductor `3≥3` | Holds | None |
| §5.7 tower identity with the named declarations | `F=ℚ(i)`, `E=ℚ(i,√5)`, `r=2` | `absNorm(𝔇(E/F))=absNorm(relDiscr)=Norm((5))=25`; `25·4²=400=D_E`; `log 400=5.9915=log 25+2 log 4` | Holds | None |
| §5.7 residue bullet for `F` of degree `≤m` | `[E:ℚ]=m`, `[F:ℚ]=m/r` | `F≠ℚ` has `2≤m/r≤m`, within §5.7a's range; `F=ℚ` uses `κ_ℚ=1` | Consistent | None |
| §5.7 effectivity without §0.34 | the `ε`-form | LOWW Remark 2.7 (upper bound of Lemma 2.5 effective) and Remark 3.3 (Prop 3.4 effective) cover the inputs of Lemma 3.5; only the logarithmic form `(1+log D_E)^(m−1)(1+log D_F)` uses §5.7a | Consistent | None |

**Carried adversarial rows.** The statements the diff leaves untouched keep the rows of the previous report (`packages/AnalyticNumberTheoryPartII/reports/PRREVIEW-AnalyticNumberTheoryPartII~5.md`, Verified sound), which carry r4's rows in turn: the §5.7 cokernel step (`F=ℚ(√−5)`, `E=ℚ(i,√5)`, `|ker|≤2·1/2=1`), the residue upper bound (`κ_E=1.4050≤4.0716`), the `F=ℚ` and `E=F` Checks, the `ε`-form, the field count at `n=1,8,23`, and the Layer 4–6 rows (§6.42, §6.9c, §5.13f, `IsScalingMeasure`, `finiteAdeleUnits`, `unitOrbitSum`, `supercritical_scaling_measures`, §6.17, `barnesG`, §4.3, §4.12a, §4.9a, §5.23/§5.26/§5.30x, large sieve and fourth moment). These are historical evidence, not new computations.

**Headline coverage.** Unchanged: the ten theorems of `Suggested.lean` cover Lerch continuation and second-derived invariance, the two completed Lerch equations, complex Hurwitz continuation, the Barnes expansion and derivative estimate, the quadratic large sieve and fourth moment, the quadratic double-series continuation, matrix equations and growth, rational Eisenstein generation, critical scaling-measure uniqueness and the supercritical parametrization. The docstring names the cubic Shintani results, the KMS phase transition, type III₁ and the compact Selberg determinant as not statable, each with its missing carrier. §5.7a is an intermediate bound, not a headline.

## Not verifiable

- **AnalyticNumberTheoryPartI §0.34.** The logarithmic form of §5.7a rests on it; its truth rests on 2026 sources reviewed with Part I. §5.7's effective `ε`-form does not need it (LOWW Remarks 2.7 and 3.3, checked above).
- **Friedman–Skoruppa.** The relative regulator-ratio bound is cited through LOWW's proof; the paper itself is paywalled (recorded as uncertified in the previous round's scratch manifest). No reference request filed.
- **Unchanged seeded targets.** §§4.2, 4.4, 4.8, 4.17, 5.5, 5.19, 5.20, 5.24, 5.26, 6.3, 6.21, 6.30, 6.31, 6.42 lie outside the diff and its dependency cone and were not reopened. The README flags no locator as unverified.
- **Stark74 OCR.** The cache is an OCR of an image scan; the formulas in Lemmas 3, 4 and 8 are legible enough to confirm the statements quoted above, but individual constants in the displayed formulas were not relied on.

## Source issues

- none
