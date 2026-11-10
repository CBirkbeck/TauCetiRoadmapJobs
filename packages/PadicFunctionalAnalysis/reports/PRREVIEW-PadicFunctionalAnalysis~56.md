# Review of PadicFunctionalAnalysis (pull request #1807 at 7959c07)

**Verdict:** needs changes

This is a full re-review: the folder changed by 719 lines since `7b607c3`. The pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

All eleven findings of the previous review are repaired (see "Previous findings" below). This round has five findings, all on text the previous rounds passed. R01 is blocking: the module docstring says §5.6 is not statable, but its joint-injectivity statement elaborates against `import Mathlib` alone. The worker's gate, the dependency check and elaboration all pass.

## R01 (P2) — §5.6's joint injectivity is statable at the pins; the docstring says §5.6 is not

**Location.**
- `Suggested.lean` lines 42–43: "The annular coefficient ring `H` of §5.6: the ring is itself a target of the roadmap, so no carrier exists before the roadmap builds it."
- README §5.6 joint injectivity, lines 1403–1413.

**Claim.** No statement of the §5.6 headline target can be made before the roadmap builds `H`.

**Witness.** §5.6's *Needs:* line (README lines 1389–1391) names the Mathlib carrier `ℤ_p[[T,U]]/(TU−p)` of `H`. On it, joint injectivity (the block below) elaborates against `import Mathlib` alone: exit 0, one `sorry` warning.

**Repair.**
1. Add this block under the Layer 5 section comment:

   ```lean
   /-- **Joint injectivity of the annular evaluations** (§5.6), on Mathlib's model
   `ℤ_p⟦T, U⟧ / (TU − p)` of the annular ring `H`: a two-variable integral series vanishes at every
   point `(t, p/t)` of `ℂ_p` with `p⁻¹ < |t| < 1` exactly when it lies in the ideal `(TU − p)`. -/
   theorem mem_span_iff_forall_eval_annulus (f : MvPowerSeries (Fin 2) ℤ_[p]) :
       f ∈ Ideal.span {MvPowerSeries.X 0 * MvPowerSeries.X 1 - MvPowerSeries.C (p : ℤ_[p])} ↔
         ∀ t : ℂ_[p], (p : ℝ)⁻¹ < ‖t‖ → ‖t‖ < 1 →
           ∑' n : Fin 2 →₀ ℕ, algebraMap ℚ_[p] ℂ_[p] ((MvPowerSeries.coeff n f : ℤ_[p]) : ℚ_[p]) *
             t ^ n 0 * ((p : ℂ_[p]) / t) ^ n 1 = 0 := by
     sorry
   ```

2. In the README:
   - name `mem_span_iff_forall_eval_annulus` at the §5.6 joint-injectivity sentence (line 1405), as the statement through `H≃ℤ_p[[T,U]]/(TU−p)`;
   - add it to the list at lines 210–215;
   - change line 33 to "§§4.4, 4.6, 4.7, 5.3, 5.4 and 5.6".
3. In the docstring, replace the §5.6 sentence. What has no pinned carrier is the gauge norm on `H[1/T]`, so the Banach–Tate structure and completeness statements of §5.6 are not stated; joint injectivity is stated on Mathlib's model of `H`.

**Tested.**
- The block, spliced into a scratch copy of this head's `Suggested.lean`, elaborates with exit 0. The only output is ten `sorry` warnings.
- The statement is true:
  - "⇒": `TU−p` evaluates to `t·(p/t)−p=0`, and `T(TU−p)` to `t²(p/t)−pt=0`.
  - "⇐": `T` evaluates to `t≠0`. In general, the image `Σ d_m t^m`, with `d_m=Σ_{i−j=m} a_ij p^j`, has a dominant term on `|t|=ρ` for all but finitely many `ρ∈p^ℚ∩(p⁻¹,1)`. Here `|d_m|ρ^m→0` at both ends, because `pρ>1`. So it vanishes identically only if every `d_m` is 0, that is, only if `f∈(TU−p)`.
  - No `t∈ℚ_p` satisfies `p⁻¹<|t|<1`, which is why the statement quantifies over `ℂ_p`.

## R02 (P3) — `exists_eval_eq_principalChar_iff` is §4.6's headline at `t=T_κ`

**Location.** `Suggested.lean` lines 199–214. README §5.4, lines 1314–1317: "This is the case t=T_κ of §4.6 through `TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`."

**Claim.** §5.4's Lean statement is a separate headline.

**Witness.** In a scratch copy this two-line proof closes it (exit 0), from one pinned lemma (`NumberTheory/Padics/WeightSpace.lean:185`) and the sibling headline:

```lean
  rw [TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one]
  exact exists_eval_eq_addChar_iff h _
```

**Why it matters.** What §5.4 adds to §4.6 is the reading on the cosets of `1+p^(h')ℤ_p` in `ℤ_pˣ`. The Lean statement does not state that reading, and the pins have no carrier for locally analytic functions on `ℤ_pˣ`: `TauCeti.LocallyAnalytic` is the only one, and it lives over `ℤ_p`.

**Repair.**
1. Delete `exists_eval_eq_principalChar_iff` from `Suggested.lean`; the README keeps the statement.
2. In the README, unbacktick or drop the name at lines 215, 1315, 1346 and 1369, and drop "5.4" from line 33.
3. In the docstring (line 26), say two things: §5.4's principal-part statement is §4.6's headline at `t=T_κ`, by the pinned lemma; and its coset form needs locally analytic functions on `ℤ_pˣ`, which the pins lack.

**Tested.** The copy with the declaration deleted elaborates with exit 0 and no other output.

## R03 (P3) — Convolution has no Check; §5.6 and Layer 5 Checks are bundled or compute nothing

**Location.**
- §4.7 "Convolution" (lines 1104–1117) defines `λ∗μ`. No Check exercises it: not the two §4.7 Checks lists (lines 1036–1048, 1063–1071), and not the Layer 4 Examples (lines 1121–1151).
- §5.6's ring `H` has one Check bullet bundling four tests (lines 1442–1444).
- Layer 5 lines 1427 ("At p=2, test both sign characters and γ=exp(4)") and 1428–1430 instruct tests but state no computed value.

**Claim.** Every definition has at least three discriminating Checks, one per bullet, each with a computed value.

**Witness.** The line ranges above. The convention `(λ∗μ)(f)=μ(y↦λ(x↦f(x−y)))` would pass every Check in §4.7.

**Repair.** Add these bullets, each computed here.
- **Convolution.**
  - `δ_a∗δ_b=δ_(a+b)`, with transform `(1+T)^a(1+T)^b`. Under `f(x−y)`, `δ_1∗δ_1` would be `δ_0`, with transform `1` instead of `(1+T)²`.
  - `δ_0` is the unit.
  - For `μ'(f)=f'(0)`, `μ'∗μ'` is `f↦f''(0)`, with transform `log(1+T)²` and `T²`-coefficient `1=binom(x,2)''`. Also `‖μ'∗μ'‖_0≤1`, since `n!·coeff_n(log(1+T)²)=±2(n−1)!H_(n−1)` is an integer.
- **`H`.** Split the bullet into three:
  - `TU=p` with `T`, `U` non-units;
  - `Σ_j U^j=(1−U)⁻¹` in `H`, while `‖U^j‖=1` for every `j`, so the partial sums diverge in the gauge;
  - `Σ_j U^j` does not lie in the `p`-adic completion of `ℤ_p[[T]][U]`.
- **Layer 5 at `p=2`.**
  - The sign character `ε` has nontrivial finite part and `T_ε=ε(exp 4)−1=0`.
  - `κ(x)=x` has finite part `ε` and `‖T_κ‖=‖exp(4)−1‖=1/4`.
  - The generator `exp(2)` would diverge, since `‖2‖=r_2`.

## R04 (P3) — Targets without a locator, where the roadmap's own sources give one

**Location and witness.**
- **§0.4, first target (lines 336–344).** No source is given. [JN] Remark 2.1.3(1), p. 8 (JN lines 397–402), states the promotion with `ϖ` in a ring of definition. [KL] Remark 2.4.4, p. 39 (KL line 1538), omits that hypothesis; see Source issues.
- **§1.4 target (lines 444–450).** [JN] §2.1, p. 8 (JN lines 423–428), with [BGR] §3.7.3.
- **§5.3, first target (lines 1241–1257), and §5.2, first target (lines 1194–1202).** [LWX] Notation 2.1, p. 8 (LWX lines 349–356), states `Λ=ℤ_p⟦ℤ_pˣ⟧≅ℤ_p[Δ]⊗ℤ_p⟦T⟧` with `T=[exp(q)]−1` and identifies the `ℂ_p`-valued characters. For §5.2, [RJW] Remark 3.47, pp. 25–26 (RJW lines 1495–1500), covers odd `p`.
- **§5.4 target (lines 1311–1339).** No source. [Col] §I.6, p. 27 (Col lines 1344–1354), shows that a continuous character is `exp(w log x)` on some `1+p^nℤ_p`.
- **§4.5's three targets (lines 933–957).** No source, and none of the cited texts states them.
- **[ST].** "[ST] Theorem 2.2, p. 9" (lines 1082–1083) is the page of the arXiv version (ST line 316). The reference entry (lines 1546–1547) lists only Documenta Math. 6, pp. 447–481.

**Repair.**
- Add the locators above at the targets.
- For §4.5, cite a standard text by its locator.
- Add arXiv math/0102012 to [ST] and say that page numbers refer to it, or give the Documenta page.

## R05 (P3) — The §4.7 restriction bullet needs a later target

**Location.** README lines 1029–1034: "its image is the set of distributions with bounded moments … *Needs:* … and the Amice bijection below for the image."

**Claim.** Targets are in build order.

**Witness.** The bijection is the fourth §4.7 target (lines 1079–1090), stated after this API bullet of `distributions`.

**Repair.** Keep injectivity and `‖μ‖_h≤‖μ‖` in the bullet. Move the image characterisation, which needs `AbstractMeasure.mem_range_amiceTransform_iff` and `amiceTransform_distribution_bijective`, into the bijection target or the "Point masses" target.

## Previous findings

- **R01 — repaired.** The §4.7 bijection is now stated: `distributions` (lines 103–109), `binomialLA` (115–119) and `amiceTransform_distribution_bijective` (134–141), with [Col] Théorème II.2.2 and [ST] Theorem 2.2 cited. §4.7 is no longer in the docstring's list of headlines that are not statable.
- **R02 — repaired.** §5.5 (lines 1343–1347) now reads "a unit level `h'≥v_p(q)` … this is the principal-part level `h'−v_p(q)`".
- **R03 — repaired.** §3.2 (lines 705–709) now has the two cases and "Neither case implies the other".
- **R04 — repaired.** §1.3 (lines 421–427) now has the coset argument: "they lie in at most `dim V` cosets `c_i r^ℤ`".
- **R05 — repaired.** §2.3 (lines 520–527) now reads "a multiplicative pseudo-uniformiser `ϖ` whose norms `‖ϖ‖^ℤ` contain every nonzero scalar norm". This matches the hypotheses `ϖ`, `hR` and `[(unitBallIdeal R).IsMaximal]` of `Bases/DiscreteNorm.lean:38–71`.
- **R06 — repaired.**
  - §0.1 (lines 242–248) moves the summability statement into "In the pinned library".
  - §1.1 (lines 392–395) says "this degenerate case is a Check below. Nothing remains."
- **R07 — repaired.** Line 1504 maps `TCoord`, and the clause table is at lines 1509–1516. Every name that PadicMeasuresIwasawaAlgebras cites on main (its lines 352–367) is mapped.
- **R08 — repaired.**
  - §4.4 bullet 4 now has a *Needs:* line (lines 917–921).
  - Every §4.7 target has one, and so do the §5.3 adic target and separation by weights (lines 1272–1277, 1294–1297).
  - §§4.5 and 5.6 have one *Needs:* line per target.
- **R09 — repaired.**
  - Permutations (lines 608–616), the §4.1 isometry (800–822), the §4.7 theorems (1091–1117) and the countable-type hypothesis of §2.4 (546–558) are now stated.
- **R10 — repaired.**
  - [ST] Theorem 2.2 is cited (line 1083), but see R04 on the page.
  - [Am] Théorèmes 1–3 and Corollaire 1(b)–(c) are cited with pages, and so is [Buz] Lemma 2.3(a)–(b), p. 10.
  - §4.6 now cites [Col] Lemme II.2.1, and §5.5 cites [LWX] Proposition 3.14.
  - The `p=2` sentence on [RJW] Remark 3.47 is at lines 1269–1272, and [RJW] diagram (3.4) at line 1288.
- **R11 — repaired.** Line 1 reads `# Roadmap: p-adic functional analysis`, line 3 opens with `**Summary.**`, and "How to read the build" is at line 189. "Still to formalise" no longer occurs.

## Verified sound

### Gate, dependency check, elaboration

**Gate.**
- The worker's gate at `7959c07` reports every counter zero: `OK`.
- My run of `gate … --base origin/main` reports `outside-folder=26` and zero for every other counter. The 26 files are `README.md` and `Suggested.lean` in each of the 13 folders that the brief names as this pull request's own, and the exclusion diff is empty. This is not a finding.

**Dependency check.**

```text
depcheck: 234 roadmaps, 2265 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Every supplier is on main: AdicSpaces, LocalFieldsRamification and ProfiniteProPGroups under `Completed/`; RestrictedPowerSeries and NewtonPolygons under `TauCetiRoadmap/`.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0. The only output is nine `declaration uses sorry` warnings, at lines 66, 76, 90, 134, 158, 167, 181, 194 and 207.

**Signatures.** I put `#check @` for all 11 declarations in one scratch copy and elaborated it once. All 11 types equal `signatures.md`, so nothing changed. Each declaration carries its binders explicitly:
- `[IsLinearTopology S S] [CompleteSpace S] [T2Space S] [ContinuousSMul ℤ_[p] S]` on both adic theorems;
- `[NormMulClass K] [NormOneClass K] [Module ℚ_[p] K] [NormSMulClass ℚ_[p] K]` on §§4.6 and 5.4. These equal the pinned binders of `Amice/Character.lean:254–256`.

**Padding probe.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | aesop | decide`. None of the nine closes. The targeted probe of R02 is the one exception.

**Imports.** Removing any one of the 13 `TauCeti.*` imports in turn either breaks elaboration or removes a module whose declarations the file names. Seven of them are also reached transitively, which is not a defect.

### Pinned declarations opened (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)

- **All README names.** I elaborated `#check @` for the 330 qualified names the README backticks:
  - 301 resolve in the built modules;
  - the remaining 29 lie in unbuilt modules, and I found each by source. For example, `mapCoeffs` is at `Topology/ContinuousMap/ZeroAtInfty/BaseChange.lean:47`, `diagonalCLM` at `ZeroAtInfty/Diagonal.lean:74`, `CompletedTensor` with `lift`/`map` at `RingTheory/Huber/BanachModule/CompletedTensor.lean:201, 314, 383`, `adaptedNorm` at `Module/AdaptedNorm.lean:44`, and `isBoundedSMul` at `Module/Quotient.lean:102`.
- **Opened and compared with the README:**
  - `LocallyAnalytic`, `ofStage`, `ofStage_transition`, `eval_injective` (`Distribution/LocallyAnalytic.lean:45–101`);
  - `PowerSeries.OnOpenDisc` (`OpenDisc/Basic.lean:100`), which means "restricted at every `0<r<R₀`";
  - `amiceRadius` and `amiceDualNorm` (`Amice/Norm.lean:98, 231`);
  - `onOpenDisc_iff_forall_bddAbove_norm_coeff_mul_norm_factorial` (`:323`) and the `exp` controls (`:342, 349`);
  - `amiceCharCoeff`, `tendsto_amiceCharCoeff_iff`, `addCharExpansion`, `eval_addCharExpansion` and `exists_eval_eq_addChar` (`Amice/Character.lean:88–280`);
  - `WeightSpace.coord`, `tendsto_coord_pow` and `principalChar_eq_addChar_of_value_at_one` (`WeightSpace.lean:156–188`);
  - `isONable_iff_discrete_norm` and `isPotentiallyONable_of_discrete_norm` (`Bases/DiscreteNorm.lean:38–71`);
  - `exists_continuousLinearEquiv_prod_of_countableType` (`Bases/Splitting.lean:87`, over a complete nontrivially normed field).
- **No pinned version of any headline.** `amiceMap` has only `norm_amiceMap_le` and `eval_amiceMap` (`Amice/Basis.lean:494–542`). No pinned lemma relates `amiceTransformEquiv` to `powerSeriesCoordinate`, or `HasEval` to `WeightSpace`.

### Seeded sample and source locators

Each locator below was checked at its line, with its page, its hypotheses and the statement as written.

- **§0.3.** [JN] Lemmas 2.1.6–2.1.7, p. 9 (JN lines 460–499), the corrected comparisons. The common-unit linear comparison is JN lines 485–487.
- **§0.4.** [KL] Remark 2.4.4, p. 39 (KL line 1538); see Source issues. [JN] Remark 2.1.3(1), p. 8 (JN lines 397–402).
- **§2.3.** [Serre] Proposition 1, p. 70 (Serre lines 60–62), for a discretely valued field. Potential orthonormalisability is the remark at Serre lines 49–51. The ring generality is that of the pinned declarations.
- **§2.4.** [Conrad] Lemma 1.1.5: the statement is on p. 6 (Conrad line 274), and the countable-type section via [BGR] 2.7.1/4 is on p. 7 (Conrad lines 298–302), as the README says.
- **§2.6.** [Buz] Lemma 2.3(a)–(b), p. 10 (Buz lines 328–332), with the proof of (b) at Buz lines 343–358. The README's route matches it.
- **§5.6.** [LWX] Lemma 3.15, p. 21 (LWX line 1215). For §5.5, [LWX] Proposition 3.14, p. 21 (LWX line 1141), with the expansion in its proof at LWX lines 1159–1165 (`c∈qℤ_p`, `d∈ℤ_pˣ`).
- **§§4.4 and 3.2.** [Am]:
  - Théorème 1, p. 143 (Amice line 964);
  - Théorème 2, p. 150 (Amice line 1226);
  - Théorème 3, p. 159 (Amice line 1532);
  - Corollaire 1(b)–(c), p. 161 (Amice line 1606), for `u_n=n` with `P_n=n!binom(x,n)`.
- **§§4.4, 4.6 and 4.7.** [Col]:
  - Théorème I.4.7 and Corollaire I.4.8, p. 15 (Col lines 712–714);
  - §II.2, p. 29 (Col line 1457);
  - Lemme II.2.1 and Théorème II.2.2, p. 30 (Col lines 1492–1504), whose proof gives `v_LAh(μ)=inf v_p(⌊n/p^h⌋!b_n)` (Col lines 1536–1541);
  - §II.3 no. 2, p. 31 (Col line 1567);
  - §II.4 no. 6 and Lemme II.4.2, p. 36 (Col lines 1899, 1915).
- **§5.3.** [RJW] Proposition 3.16, p. 16 (RJW line 816); diagram (3.4) and Theorem 3.25, p. 18 (RJW lines 954–959); Theorem 3.43, p. 25 (RJW line 1453); Remark 3.47, pp. 25–26 (RJW lines 1492–1500). RJW assume odd `p` (RJW line 404).
- **Sampled sections with no source.** §§0.1, 0.2, 2.2, 2.5, 3.2, 4.1, 4.3, 4.5 and 5.1 cite only pinned declarations, which I checked above, or none (R04).

### Cross-roadmap citations, resolved on main `69a3eff` and at the open heads

- **Suppliers.** RestrictedPowerSeries §0.3 (line 224), §1.3 (277; module-valued unit-radius `C₀` isometry), §§2.1–2.3 (306, 324, 340) and §7.1 (704). NewtonPolygons Layer 1 and §1.1. AdicSpaces Layer 0. LocalFieldsRamification Layer 1. ProfiniteProPGroups Layer 9.
- **Consumers on main.**
  - AdicSpacesPartII and AdicSpacesPartIII cite §0.4 (18 times), §2.2, §2.4, §§2.1–2.2 and §§2.2, 2.4. All of these exist here.
  - CompactOperators cites §2.6 and §4.4.
  - PadicMeasuresIwasawaAlgebras is the only roadmap citing qualified `TauCetiRoadmap.PadicFunctionalAnalysis.*` names, and each one is mapped (lines 1490–1516).
- **In this pull request.** RigidAnalyticGeometry cites §1.2, Layer 1 and §2.4, the last as "strict exactness of `L⊗̂_K(−)` on countable-type spaces" at its line 593, consistent with §2.4's hypothesis.
- **Open.** LocallyAnalyticDistributions (`roadmaps show`) cites §§1.4, 2.1–2.2, 2.6, 4.3, 4.4 and 4.7, which all exist. Its `Suggested.lean` restates none of these headlines.

### Ownership and overlaps

- `roadmaps grep --lean-only` for `AnalyticStage.amiceMap`, `TauCeti.LocallyAnalytic`, `WeightSpace p S`, `principalChar`, `characterIntegralAlgHom` and `powerSeriesCoordinate` finds only this folder (at this head, #1808 and #1854) and ProfiniteProPGroups.
- PadicMeasuresIwasawaAlgebras' `exists_completedCoordinate` (its `Suggested.lean:650`) is the bare coordinate, not this comparison.
- This roadmap owns §4.7 by RestrictedPowerSeries §7.1's own deferral and LocallyAnalyticDistributions' line 157.
- #1808 and #1854 carry other revisions of this folder. The description's merge-order block orders them after this pull request, so no order is missing.
- The overlaps tool lists no dropped or revision-only id.

### Adversarial table

| Statement | Instance | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `amiceMap_bijective_and_norm_eq` | `E=0` | `C₀(ℕ,0)=0` | `LA_h(0)=0`, norms 0 | holds | none |
| same | `p=2,h=0,E=ℤ_2`, `n=2` | `e_(0,2)=x²−x ↦ (0,−1,1)` | norm 1 `=‖single 2 1‖` | holds | none |
| `isOrthonormalBasis_amiceTerm` | `p=2,h=1`, `n=0,1,2` | `(1;1)`, `(0,2;1,2)`, `(0,−1,2;0,1,2)` | each norm 1; mod 2 triangular | holds | none |
| `exists_eval_eq_addChar_iff` | `p=2,h=0,t=2` | Amice coord `2^n/n!`, `v=s_2(n)`, `=1/2` at `n=2^k` | `‖2‖=1/2=r_0`, not `<` | both false | none |
| same | `p=3,h=0,t=3` | coords `→0` | `1/3<3^(−1/2)` | both true | none |
| `amiceTransform_distribution_bijective` | `μ=f↦f'(0)` | `b_n=(−1)^(n−1)/n` | `log(1+T)`, `n r^n→0` | on open disc | none |
| same | `b_n=1/n!` | `D_0=1`, `D_1=∞` (`p^k` at `n=pk`) | `exp(T)`, radius `r_p<1` | excluded both sides | none |
| same | `δ_(−1)` | `b_n=(−1)^n`, `D_h=1` | `(1+T)^(−1)` on open disc | holds | none |
| `binomialLA` | `p=2,n=2` | level 0: `(0,−1/2,1/2)`, norm 2 | level 1: `2w²∓w`, norm 1 | `=‖m_h(2)‖⁻¹` | none |
| `exists_character_of_hasEval` | `S=0`; `S=ℤ_p,z=p`; `S=ℤ_p[ε]/ε²,z=ε` | unique; `κ(γ)=1+p`; `1+s(x)ε` | coord `0`; `p`; `ε` | holds | none |
| `eq_aeval_binomialSeries` | `x=γ`; `x=ω(δ)` | `κ(γ)`; `κ(ω δ)` | `1·(1+T)`; `finiteChar δ·1` | agree | none |
| same, hypothesis `hκ` | any `S` above | `T^(p^n N)∈p^N(…)⊂I` | `HasEval κ.coord` always | redundant, needed to name `aeval` | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ=δ_a`; `μ=0` | `[ofAdd 1]^a=[ofAdd a]`; `0` | `[ofAdd a]`; `0` | agree | none |
| `measurePairing_injective` | `p` odd `δ_1−δ_(1+p)`; `p=2` `δ_1−δ_(−1)` | `κ=x`: `−p≠0`; sign `ε`: `2≠0` | trivial weight: `0` | separated | none |
| `exists_eval_eq_principalChar_iff` | `κ(x)=x`, `p` odd / `p=2` | `‖q‖=1/p` / `1/4` | `<r_0=p^(−1/(p−1))` / `1/2` | level 0 | R02 |
| same | two-line proof | `rw [principalChar_eq_addChar_of_value_at_one]` | `exact exists_eval_eq_addChar_iff h _` | exit 0 | R02 |
| §5.6 joint injectivity | `TU−p`; `T(TU−p)`; `T` | `t(p/t)−p=0`; `0`; `t` | in span; in span; not | agrees | R01 |
| §5.6 gauge | `U`, `p`, `U^j` | `‖U‖=1`, `‖p‖=α` | `‖U^j‖=1`, partial sums diverge | as stated | R03 |
| §4.7 convolution | `δ_1∗δ_1`; `μ'∗μ'` | `δ_2` (`δ_0` under `f(x−y)`); `f''(0)` | `(1+T)²`; `log(1+T)²`, `T²`-coeff 1 | discriminates | R03 |
| §4.7 derivative Check | `‖μ'‖_h` | `n=p^h`: `p^h` | `v(n)−v(⌊n/p^h⌋!)≤h` for all `n` | `=p^h` | none |
| §4.4 transition | `p=2,h=0`, `n<2`; `n=2` | `m_0/m_1=n!` unit; `2!` | `v=⌊n/2⌋`: 0; 1 | Legendre holds | none |
| §4.3 transition | `p=2`, `x²`, disc `b=1` | `w=1+2v`: `1+4v+4v²` | formula: `1`, `2·2=4`, `4` | holds | none |
| §5.4 conductor bound | `κ=x^kψ`, `h'≥max(m,v_p(q))` | `κ(exp p^(h'))−1=exp(kp^(h'))−1` | norm `≤p^(−h')≤‖q‖<r_p` | holds | none |
| §5.4 level formula | `h=h'−v_p(q)` | `r_h=p^(−1/((p−1)p^h))` | `p^(−q/((p−1)p^(h')))` | equal | none |
| §5.2 valuation | `p=5,m=2`; `p=2,m=3` | `v(ζ_5−1)=1/4`; `v(−2)=1` | `1/(p^0·4)`; `1/2^0` | agree | none |
| §5.5 (R02 r54 repair) | `κ=x`, `h'=v_p(q)`, `r=1` | `‖c‖‖q‖≤‖q‖²` | `<‖q‖r_p` | holds | none |
| §0.4 Checks | `(ℤ_p,p²,p)`; `A₀`, `ϖ=(p,p²)`; `N=max(‖·‖,‖·‖²)` | `g(p)=1,g(p²)=p⁻¹`; `g(1+ϖ)=a²` | not multiplicative; `>max(1,a⁻¹)`; `N(ϖ)N(ϖ⁻¹)=r⁻¹` | as stated | none |
| §0.3 Check (JN 2.1.7) | `|·|` vs `|·|²` on `ℚ_p` | `s=2`, `C₁=C₂=1` | `|a|²≤C|a|` fails at `p^(−n)` | as stated | none |
| §1.3 (r54 R04 repair) | `‖x‖=p^(1/2)|x|_p` | one coset `p^(1/2)p^ℤ` | finitely many values in `[s,2s]` | attained | none |
| §2.3 hypotheses | `𝒪_(ℂ_p)`, `a=p^(1/2)` | `zpowCeil p⁻¹ (p^(−1/2))=1` | `≠p^(−1/2)`, so `hR` fails | correctly excluded | none |
| §2.4 corollary | `M=0`; `N=0` | `E≃0×N`; `E≃M×0` | split, so strict exact after `K'⊗̂` | holds | none |
| §2.6 permutation Check | `σ=(0 1 2)` | `f∘σ⁻¹`: `(1,0),(2,1),(0,2)` | `f∘σ`: `(2,0),(0,1),(1,2)` | discriminates | none |
| §2.6 diagonal | `diag(p^n)` on `C₀(ℕ,ℚ_p)` | `(p^n)` needs preimage `1` | `1` not null | not surjective | none |
| §3.2 | `R=E=ℚ_p²`, `g=(p⁻¹,1)`; `E=0` | `(0,1)`: ratio 1; `1`: ratio `p`; zero map | `‖g‖=p` | as stated | none |
| §4.5 bounds | `p=2`, `z=u=4`; `z=2` | `‖exp 4−1‖=1/4`, `‖log 5‖=1/4` | `‖z‖=1/4`; `‖2‖=r_2`: diverges | as stated | none |
| §5.1 | `γ=exp q`; `x=−1`, `p` odd | `log(exp q)/q=1`; `log 1=0` | `(1,1)`; `(−1,0)` | holds | none |
| §5.3 at `p=2` | `ℤ_2[C_2]` | `𝔽_2[δ]/(δ−1)²` | local, maximal ideal `(2,δ−1)` | as stated | none |
| §4.7 restriction | bounded `μ` | image needs the bijection | stated later (line 1079) | order | R05 |

**A remark that needs no change.** In `eq_aeval_binomialSeries`, the hypothesis `hκ` holds for every weight under the standing hypotheses. `κ(γ)^(p^n)→1`, and `p^N∈I`, so `T^(p^n N)∈I` for every open ideal `I`. The hypothesis is still needed to name `aeval`.

## Not verifiable

- [Sch], [BGR] and [Bel] are settled as uncertified and cited by locator. [BGR] 2.7.1/4 and §3.7.3 were checked through their uses in [Conrad] (Conrad lines 300–302) and [JN] (JN lines 423–428).
- [Am] is an OCR'd scan with garbled formulas. The forms of Corollaire 1(b)–(c) were checked against [Col] I.4.7–I.4.8 and Théorème II.2.2.
- [Mah] was not opened. Mahler's theorem is cited only through the pinned `PadicInt.mahlerEquiv`.
- Ownership against open pull requests was checked with `roadmaps grep`, `roadmaps show` (LocallyAnalyticDistributions, and this folder at #1808 and #1854) and the overlaps index.

## Source issues

- **Gap** in KL at Remark 2.4.4, p. 39: the source says that for any topologically nilpotent unit `z` and ring of definition `A₀`, `inf{cⁿ : z^(−n)x∈A₀}` is a Banach-ring norm; it should be stated for `z∈A₀` (or a power of `z` lying in `A₀`), since `z=(p,p²)` with `A₀={x≡y mod p²}⊂ℚ_p²` breaks ultrametricity; affects a stated result.
