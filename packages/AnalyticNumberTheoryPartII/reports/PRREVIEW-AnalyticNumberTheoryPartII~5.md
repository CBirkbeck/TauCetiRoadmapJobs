# Review of AnalyticNumberTheoryPartII (pull request #1167 at a7edaf5)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 28 lines changed since 1458ecb, all in `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md`: the Layer 5 scope sentence, the AnalyticNumberTheoryPartI supplier paragraph, §5.7 and the Layer 5 dependencies. `Suggested.lean` did not change. However, the merge of main moved the pins (Mathlib `6b7abb3` → `1b1ccf4`, Tau Ceti `a91d3aa` → `2fd255d`, toolchain `v4.36.0-rc2`), and the unchanged file no longer builds cleanly. The mathematics of the new effective route in §5.7 is correct. Its residue lower bound now has a second owner in an open roadmap.

## R01 (P1) — The targeted build fails: `derivedSeries` is deprecated at the new Mathlib pin

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartII/Suggested.lean:85`: "`∀ g ∈ derivedSeries (FundamentalGroup lerchDomain lerchBasepoint) 2,`" in `lerchContinuation_solvable`.

**Claim.** At the new pin the root-namespace `derivedSeries` is a deprecated alias. `lake build TauCetiRoadmap.AnalyticNumberTheoryPartII.Suggested` therefore emits a warning other than `declaration uses sorry`, and the gate's build check fails. The gate records this as part of `build=3 FAIL`.

**Witness.** In `Mathlib/GroupTheory/Solvable.lean`, line 117 at the pin is `@[deprecated (since := "2026-10-17")] alias derivedSeries := derivedSeries`, and line 52 is the definition `Subgroup.derivedSeries`. My targeted build reports the warning at `Suggested.lean:85:12`, with the hint "Replace the deprecated name: Subgroup.derivedSeries".

**Repair.** Write `Subgroup.derivedSeries` at line 85. I tested this on a scratch copy. It elaborates with exactly ten `declaration uses sorry` warnings and nothing else. The elaborated type of `lerchContinuation_solvable` matches the signature inventory except for the namespace of the series. The alias is definitionally the same declaration, so the statement does not change.

## R02 (P1) — The targeted build fails: `Suggested.lean` is not in module form

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartII/Suggested.lean:1–2`, "`import Mathlib`" and "`import TauCeti.AlgebraicTopology.UniversalCover.Action`"; line 41, "`noncomputable section`".

**Claim.** At the new toolchain, Lake warns that the file imports `Mathlib`, a package designed for the module system, without `module`. The warning is emitted twice, at build and at `irArts`. It makes up the other two of the gate's three build failures.

**Witness.** The targeted build log at this head contains: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". The imported Tau Ceti module is itself a module file: `TauCeti/AlgebraicTopology/UniversalCover/Action.lean:6` reads `module`, followed by `public import` lines. CoboundaryExpansion on main uses the module form and passes the gate (`TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:1–3` and `:36`).

**Repair.**
- Replace lines 1–2 with `module`, a blank line, `public import Mathlib` and `public import TauCeti.AlgebraicTopology.UniversalCover.Action`.
- Replace line 41 with `@[expose] public section`, a blank line, then `noncomputable section`, following the CoboundaryExpansion pattern.

I tested this together with R01 on a scratch copy, run through `lake env lean` and followed by `#check @name` for all 25 declarations. The result:
- exactly ten `declaration uses sorry` warnings and no other warning or error;
- 24 elaborated signatures identical to the inventory;
- the 25th identical except for R01's namespace.

The bare `public noncomputable section` variant gives the same result. The Lake-level warning can only be re-checked by the targeted build of the edited file in the pull request.

## R03 (P2) — The effective fixed-degree residue lower bound has two owners

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:727`: "The effective residue lower bound: for each `k≥2` there is an effective `c_k>0` with `κ_F≥c_k/log D_F` for every number field `F` of degree `k`." Line 730: "The residue lower bound and the regulator-ratio bound are local targets used by this count."

**Claim.** The change makes this bound a target owned in §5.7. ArithmeticStatisticsPartV, an open roadmap pull request, states and proves the same object by the same route: the Stark reduction of AnalyticNumberTheoryPartI §2.31e, then `.siegel_gap` of §0.31b. It also takes every residue lower bound of its own part from that statement. The object therefore has two owners, and neither cites the other. AnalyticNumberTheoryPartI does not own it: its §2.31e (`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1610`, head `294c990`) states only the subpower bound, "The constant is allowed to be ineffective".

**Witness.** In `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md` at the head of #1175:
- line 1238 is the heading "Effective fixed-degree residue lower bound";
- line 1240 states "every number field `K≠ℚ` of degree at most `n` satisfies `κ_K≥c_n/log D_K`";
- line 22 says the bound is "built here".

**Repair.** The owner should be the roadmap earlier in the merge order. ORDER.txt lists AnalyticNumberTheoryPartII at line 85 and ArithmeticStatisticsPartV at line 104, and the latter already consumes "AnalyticNumberTheoryPartII §5" (its line 22). Ownership therefore settles here:
1. Give the bound its own subsection, for example `### 5.7a Effective fixed-degree residue lower bound`, stated for `K≠ℚ` of degree at most `n` with constant `c_n=c·min(1/(4n!),c_LS)`.
2. Optionally add the `h_K R_K≥(2c_n/(2π)^n)D_K^(1/2)/log D_K` form, which ArithmeticStatisticsPartV uses.
3. Name it in Scope and ownership (line 15) and in the AnalyticNumberTheoryPartI supplier paragraph (line 41).
4. Have §5.7 cite it.

ArithmeticStatisticsPartV then cites §5.7a instead of building the bound. The alternative is to state the bound in AnalyticNumberTheoryPartI §2.31e, which already holds every input, and cite it from both roadmaps.

The test: after the repair, `roadmaps grep 'κ_K≥c_n/log D_K'` finds one statement and only citations elsewhere.

## R04 (P3) — The new route's discriminant-tower steps cite no input

**Location.** README.md:727: "since `D_K≤D_F` by the discriminant tower formula". README.md:722: "Since `log D_E=log Norm(d(E/F))+r log D_F`". The *Needs:* line at README.md:744 names neither step.

**Claim.** Both steps exist as pinned Mathlib declarations, but the route uses them without naming them. Every input a route uses should be a target, a named supplier section or a pinned declaration.

**Witness.** Both are in `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean` at the pin:
- line 120, `NumberField.discr_dvd_discr : discr K ∣ discr L`;
- line 90, `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`, which states `|disc L| = absNorm(differentIdeal 𝒪 𝒪')·|disc K|^[L:K]`.

**Repair.** Add both names to the §5.7 *Needs:* line. Note with the second that the absolute norm of the relative different equals `Norm(d(E/F))`. The worked instance `F=ℚ(i)`, `E=ℚ(i,√5)` checks out: `400=25·4²`, and the quadratic subfield discriminants 4, 5 and 20 each divide 400.

## Previous findings

The previous report (r4, at 1458ecb) raised no findings of its own. Its six carried historical identifiers all remain repaired at this head; none of their passages is in the diff.

- R01 — repaired: README.md:893 §5.13f keeps `ηα(u)/[(1−qu³)(1−u)]` and the shell-operator derivation with its five-type Checks; the passage is unchanged since r4.
- R02 — repaired: README.md:85–89 imports V8's regular crossed product on native carriers; the obsolete `CrossedProduct` identifier occurs 0 times in the README.
- R03 — repaired: the corrected prose and core-KMS references outside the diff are unchanged; none of the five previously reported identifier residues occurs.
- R04 — repaired: reference entries `[R104]`, `[R106]`, `[R110]`, `[R126]` and `[R127]` remain at README.md:3039–3057 with distinct URLs.
- R05 — repaired: README.md:1716 §6.9c takes the progression prime asymptotic from VonNeumannAlgebras V10.AffineAP, cited in its *Needs:* line (README.md:1720).
- R06 — repaired: `Suggested.lean:287` still states `supercritical_scaling_measures (β : ℝ) (hβ : 1 < β)` with the probability-measure parametrization; the signature is unchanged at the new pins.

## Verified sound

**Gate, build and elaboration.** The worker's push gate fails on `build=3` only; R01 and R02 are those three warnings. My plain gate rerun at this head:

```text
gate AnalyticNumberTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`gate --depcheck … --movable`):

```text
depcheck: 240 roadmaps, 2376 edges, 0 problem(s)
```

The dependency check prints no UPWARD, CYCLE or `moved:` line. AnalyticNumberTheoryPartI, the only supplier the diff adds citations to, is at ORDER.txt line 84, directly above this roadmap at line 85. `git diff --stat origin/main...HEAD` outside this folder is empty. The pin changes come from the merge of main, not from this pull request.

The targeted build `lake build TauCetiRoadmap.AnalyticNumberTheoryPartII.Suggested` reports "Build completed successfully (18264 jobs)". It emits ten `declaration uses sorry` warnings, the deprecation at 85:12 and the module-system warning twice. `lake env lean` on the file exits 0, with the ten sorry warnings and the deprecation.

**Signatures.** I elaborated `#check @name` for all 25 declarations on a module-form scratch copy and compared each with the supplied inventory: 24 are identical and one differs only as in R01. The file has no section `variable` or `include` block. The README↔Lean comparisons and one-tactic padding probes of earlier rounds therefore carry forward unchanged; this diff changes no Lean statement and no README formulation of one.

**Principles on the changed passages.** Checked the scope sentence (line 15), the supplier paragraph (line 41), §5.7 (lines 714–744) and the Layer 5 dependencies. I found:
- no route-specific shortcut;
- no re-planning of another roadmap and no upward supplier;
- no copied passage, algorithm, LaTeX, process word or pull-request number.

The text uses Unicode in code spans throughout.

**Supplier citations resolved** against AnalyticNumberTheoryPartI at its open head `294c990`. Its file lines are given below.
- §0.34 "Uniform exclusion of Landau–Siegel zeros" is at line 811. Its signature `landau_siegel_exclusion` states the effective absolute `c_LS` for every primitive real nonprincipal character of conductor `q≥3`.
- §0.31b, at line 781, carries `.siegel_gap`, `1−β≥c_LS/log q` for every real zero in `(0,1)`.
- §0.9, at line 301, has `quadratic_LFunction_one_lower_bound`, `L(1,χ)≥c/log q`.
- §2.5, at line 1155, identifies the continued residue with `NumberField.dedekindZeta_residue K`. Mathlib defines that residue as the class-number expression (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57`, `dedekindZeta_residue_def` at line 61, limit `tendsto_sub_one_mul_dedekindZeta_nhdsGT` at line 78). This supports "§2.5 … the class-number formula".
- §2.15, at line 1344, has `dedekindZeta_residue_le`: for `d>1`, `κ_K≤(e log D_K/(2(d−1)))^(d−1)`.
- §2.31e, at lines 1610–1618, lists the required interfaces `dedekind_residue_lower_of_zero_gap`, `near_one_dedekind_zero_quadratic_subfield` and `dedekind_residue_subpower_lower`. It also sets the Stark threshold `1/(4n!log D_K)`, which matches §5.7's `1/(4k! log D_F)`.

The `roadmaps resolve` and `overlaps` leads were empty. I verified both of them by hand.

**Ownership by object.** I searched `roadmaps grep` across main and the 466 open heads for `κ_K≥c…log`, effective residue lower bounds, Stark's lemmas and Friedman–Skoruppa. I also searched the board package AnalyticNumberTheory at `310e834`.
- The only second owner found is ArithmeticStatisticsPartV, reported as R03.
- The relative regulator-ratio bound has no other owner.
- The logarithmic relative class-torsion bound has no other owner. ArithmeticStatisticsPartV's "relative small-split-prime torsion bound" is a different statement: it needs `M` completely split small primes and divides by `M`.

**Sources: seeded sample.** Of the fifteen seeded targets, only §5.7 lies in the diff. I fetched LOWW (arXiv 2110.07712v2) through the sources service into a scratch manifest; the package manifest was not edited. Its locators, in the line numbering of the service's text:
- Lemma 2.5 is at lines 393–394, printed p.8. Its proof, at lines 396–399, uses `h_ℓ(L/K)≤h(L/K)≤[L:K]h(L)/h(K)`, Brauer–Siegel and the [FS99] regulator ratio. This matches README.md:720–724.
- Lemma 2.4, at lines 384–390, gives the cokernel `Gal((H_K∩L)/K)` and the bound `≤[L:K]`.
- Cl(L/K) is defined as the norm kernel at line 280, on p.6.
- Proposition 3.4 is stated at lines 535–536, p.11. The section §3.1 that introduces it opens at lines 530–532, p.10. Its proof is line 564.
- Lemma 3.5 and its proof are at lines 539–563, p.11. The h₂ count is at lines 553–556, the S₃ count through `h₃(F/k)` at lines 557–561, and the C₃ count at line 562.

The README locators "Lemma 2.5 and proof p.8, Lemma 3.5 and proof p.11, Proposition 3.4 pp.10–11", and its relative-discriminant-norm convention, agree with these.

The source itself makes the effective claims unconditional:
- Remark 2.7 (lines 403–427, p.8) records that the upper bound of Lemma 2.5 is effective. It deals with an exceptional zero through Aramata–Brauer and Stark, Theorem 3.
- Remark 3.3 (lines 513–517, p.10) records that Proposition 3.4 has effective constants.

So the effective `C(d,ε)` of §5.7, and the `ε`-form of the relative bound, do not depend on AnalyticNumberTheoryPartI §0.34. Only the logarithmic relative bound stated at README.md:721, and its residue lower bound, use §0.34. Citing Remarks 2.7 and 3.3 next to the effectivity claim would let an implementer prove the count without §0.34. This is optional; the README's own derivation is correct.

**Adversarial pass on the changed statements.** All values below are computed in this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.7 relative bound, cokernel step `|ker|≤r h_E/h_F` | `F=ℚ(√−5)` (`h=2`), `E=F(i)=ℚ(i,√5)`, its Hilbert class field | `D_E=4·5·20=400`, `Norm(d(E/F))=400/20²=1`; `h_E=1`, since `ℚ(ζ₂₀)` (`h=1`) is ramified over `E` at 5. Norm image trivial, so the cokernel has order `2=r`, the `≤r` bound is sharp, and `|ker|≤2·1/2=1` | Kernel/cokernel roles correct; bound sharp | R04 only |
| §5.7 tower identity `D_E=Norm(d(E/F))D_F^r` | `F=ℚ(i)`, `E=ℚ(i,√5)`, `r=2` | `Norm(d(E/F))=Norm((5))=25`; `25·4²=400=D_E`; `log 400=5.9915=log 25+2log 4=3.2189+2.7726`; `(D_E/D_F)^(1/2)=10=25^(1/2)·4^(1/2)` | Holds | R04 (name the declaration) |
| §5.7 `D_K≤D_F` for a quadratic `K⊂F` | same `E` as a degree-4 field | quadratic subfield discriminants 4, 5, 20, each dividing 400 | Holds; direction `c_LS/log D_K≥c_LS/log D_F` is the one used | R04 |
| Effective residue lower bound `κ_F≥c_k/log D_F` | `F=ℚ(√−3)`, `ℚ(√5)`; negative control `F=ℚ` | `κ=π/(3√3)=0.6046`, `κ·log3=0.6642`; `κ=2log φ/√5=0.4304`, `κ·log5=0.6927`; `F=ℚ` has `log D=0`, so `k≥2` is required, and §5.7 uses `κ_ℚ=1` separately | Consistent; any admissible `c₂≤0.664` | R03 (ownership) |
| Case split producing `c_k` | `1−β_F≥1/(4k!log D_F)` versus below; `k=2,3` | above: `κ_F≥c/(4k!log D_F)`; below: `.siegel_gap` gives `1−β_F≥c_LS/log D_F`, so `κ_F≥c·min(1,c_LS)/log D_F`; thresholds `1/(8 log D)` (`k=2`) and `1/(24 log D)` (`k=3`). A cubic has no quadratic subfield, so the second case is empty | `c_k=c·min(1/(4k!),c_LS)` | None |
| "stronger than the subpower bound" | `a=1/2`, `D=100` | `log 100=4.605≤D^a/(e a)=10/1.359=7.358`, so `c/log D≥e·a·c·D^(−a)` | Holds | None |
| Residue upper bound (§2.15) used for `κ_E` | `E=ℚ(√−5)`, `m=2` | `κ_E=2π·2/(2√20)=1.4050≤e·log20/2=4.0716` | Holds | None |
| Check "for `F=ℚ`, `h_E≤C_m D_E^(1/2)(1+log D_E)^(m−1)`" | `E=ℚ(√−5)` | left side `2`; `D_E^(1/2)(1+log D_E)=4.472·3.996=17.87`; kernel `=Cl(E)` since `Cl(ℚ)=1`; `1/κ_ℚ=1=1+log 1` | Holds with `C₂≥2/17.87=0.112` | None |
| Check "for quadratic `F`, `κ_F=L(1,χ_F)`" | `F=ℚ(√−3)` | Mathlib's residue `2π·R·h/(w√3)=6.2832/(6·1.7321)=0.6046=π/(3√3)=L(1,χ₋₃)`; conductor of `χ_F` is `D_F≥3`, as §0.9 requires | Holds | None |
| Check "`E=F`": trivial kernel | `E=F`, `r=1` | `|ker|=1`; `Norm(d(F/F))=1`, `D_F^0=1`, so the right side is `C_m(1+log D_F)^m≥1` | Holds | None |
| `ε`-form of the relative bound | `D_E=N·D_F^r` | `(1+log N+r log D_F)^(m−1)(1+log D_F)≤C_(m,δ)(N D_F^r)^δ D_F^δ`; `δ=ε/(r+1)` gives `N^ε D_F^ε` | Recovers LOWW Lemma 2.5 | None |
| §5.7 field count with `h₂` | `F=ℚ(√−5)`, `n=1`; `F=ℚ`, `n=8,23` | `n=1`: `F` and `F(i)`, count `2=h₂(F)`, bound `C·20^(1/2+ε)·2`; `F=ℚ`, `n=8`: `ℚ(√2)`, `ℚ(√−2)`, count 2; `n=23`: `ℚ(√−23)` and the cubic of discriminant `−23`, count 2; `h₂(ℚ)=1` | Consistent; `h₂` factor needed at `n=1` | None |

**Carried adversarial rows.** These rows cover statements the diff leaves untouched. They are carried from r4 (`packages/AnalyticNumberTheoryPartII/reports/PRREVIEW-AnalyticNumberTheoryPartII~4.md`, Verified sound), which attributes its older rows to r3 and r2. They are historical evidence, not new computations.

| Statement | Values recorded | Source |
|---|---|---|
| §6.42 Needs / §6.9c, `N=1,2,4` | `1/φ(N)=1,1,1/2`; main terms `X/log X`, `X/log X`, `X/(2log X)` | r4 |
| §6.9c reciprocal primes; control `N=4,a=2` | coefficients `1,1/2`; the non-reduced class sums to `1/2` | r4 |
| §6.42a interval proof | partner/small count tends to `r>1`; ratios in `[r/(1+δ),r(1+δ)]` | r4 |
| §6.42a, `λ=2`, `β=1/2`, `r=4`, `δ=1/4` | powered ratios in `[√(16/5),√5]⊂[7/4,9/4]`; `β=2` gives a convergent sum | r4 |
| §6.42c, `N=4` | counts `X/(8log X)` and `X/(4log X)`; weight `≥1/(10log X)` | r4 |
| §6.42c finite witness, `X=100` | `(101,109,113)`, `(229,233,241)`; ratios in `[8/5,5/2]`; all `≡1 mod 4` | r4 |
| §§6.42b–c masses and §6.5 | `p=2,q=3`: `1/9`, `1/6`, ratio `3/2`; `101,229`: ratio `229/101`, density `101/229` | r4 |
| §6.42c swap masses | source `≥1/(8λp)` | r4 |
| §§6.42e–f cylinder | densities multiply to `1`; nonnegative closure `[0,∞)` | r4 |
| §6.9 projection | local factor `1/2`; unit-shell projection `2/3` | r4 |
| §5.13f local factor and five types | split `(1+u)²/((1−u)(1−qu³))`; `(2u)`, `(2r)`, `(3u)`, `(3r)` numerators `1+u²`, `1+u`, `1−u+u²`, `1` | r4←r3 |
| §5.13f, `F=ℚ`, `A=ℚ³` | `ζ(2s)³ζ(6s−1)/ζ(4s)²`; ratio `∏(1+p^(−2s))` | r4←r3 |
| DW shell identity | `DΦ₀=1_(R⁴∖P³×P²×P×R)=Φ₁` | r4←r3 |
| `IsScalingMeasure` | `q=1` gives `1•μ`; `μ({0})=2^βμ({0})` forces 0 | r4←r3 |
| `finiteAdeleUnits` | `1` in; `0` and `2` out | r4←r3 |
| `unitOrbitSum` | `Ẑ` mass `ζ⁻¹Σn^(−β)=1`; `W` mass `ζ⁻¹` | r4←r3 |
| `supercritical_scaling_measures` | forward `W` mass `ζ⁻¹`; converse `μ(W)=ζ⁻¹`; control `β=1` gives `μ(W)=0`; mass `m≠1` gives `Ẑ` mass `m` | r4←r3 |
| §6.17 constant; §6.17g; §6.12d; §6.12c; §6.13b; §6.20c | `2C[2ζ′(−1)−log√(2π)−1/4]`; `a₀=1,a₁=1/2`; `a₁=−C/3`, `a₂=C/15`; `e^(−t/4)/√(4πt)`; `√(2π)/Γ(u)`; orders `2g−1` and 1 | r4←r2 |
| `barnesG` values; `barnesG_asymptotic` | `1,1,2,12,34560`; remainder `−1/(720r²)` | r4←r2 |
| §4.3; §4.12a; Hurwitz Bernoulli sign | `½log2π−½`, `B₄(1/2)=7/240`; `b₂=(c²−c+1/6)/2`; `H(0,c)=½−c` | r4←r2 |
| §4.9a; completed Lerch value; §4.5d/f | `f̂₁=−if₁`; `L₊(0)=0`; residue `−2πi/z` | r4←r2 |
| §4.1/§4.6/§4.8/§4.13; §5.1; reflection block | `π²/12`, `g(3)=1/8640`; `½,−½,½`; `κ=0,1,0,1`, `e=+1,−1,−1,+1` | r4←r2 |
| §5.23/§5.26/§5.30x; large sieve and fourth moment | `4/(3π)`, `9/4≤3`; `Q(1+|t|)`, `Q+1` | r4←r2 |

**Headline coverage.** This is carried forward because the Lean file and its module docstring are unchanged. The ten theorems cover:
- Lerch continuation and second-derived invariance;
- the even and odd completed Lerch equations;
- complex Hurwitz continuation with its Bernoulli values;
- the Barnes expansion and derivative estimate;
- the quadratic large sieve and the fourth moment;
- quadratic double-series continuation, matrix equations and growth;
- rational Eisenstein generation;
- critical scaling-measure uniqueness;
- the supercritical parametrization.

The docstring names as not statable, each with its missing carrier, the cubic Shintani results, the KMS phase transition, type III₁ and the compact Selberg determinant. The §5.7 field count is an intermediate target, not a headline.

## Not verifiable

- **AnalyticNumberTheoryPartI §0.34.** The new logarithmic relative bound and its residue lower bound rest on this section. Its truth rests on 2026 sources that Part I cites as [109]–[111]: an OpenAI preprint, B. Green's "On Landau–Siegel zeros" (Hexagon 2610.00311) and T. Tao's sketch. I did not read them; the target belongs to Part I and is reviewed there. Wikipedia's "Siegel zero" article, read as data, describes the proof as claimed and restated by Banks, Kerr, Green and Tao; it does not say the proof has been verified. As noted above, §5.7's effective field count does not need §0.34 (LOWW Remarks 2.7 and 3.3).
- **Friedman–Skoruppa.** The effective constant of the relative regulator ratio bound comes from Friedman–Skoruppa, *Relative regulators of number fields*, Invent. Math. 1999. The sources service resolved its DOI only to a paywalled page, so I recorded it as uncertified in a scratch manifest. The roadmap cites it only through LOWW's proof. LOWW Remark 2.7 records that the Lemma 2.5 upper bound, which uses this input, is effective. I filed no reference request.
- **Unchanged seeded targets.** §§4.11, 4.14, 5.25, 5.26, 6.9, 6.11, 6.17, 6.27, 6.33, 6.37, 6.40, 6.41, 6.43 and 6.44 lie outside the diff and its dependency cone. I did not reopen them; r4 checked §6.9 against nesh00. The README flags no locator as unverified.
- **The Lake module warning after the R02 repair.** Only the targeted build of the edited file in the pull request can confirm that this warning is gone. I could not run it without editing the pull request; the scratch elaboration covers everything else.

## Source issues

- none
