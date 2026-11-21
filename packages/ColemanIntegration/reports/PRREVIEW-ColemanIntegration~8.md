# Review of ColemanIntegration (pull request #2864 at 3aafbcf)

**Verdict:** accepted

**Summary.** Accepted, with three small corrections and one format note, none blocking. The repairs hold at the pins: the restated L0.10, the `NormedSpace.log` substitutions, the induction and namespace names and the RestrictedPowerSeries contract are all correct. The most useful correction is to the new Conventions bullet: it says neither pinned library has a formal primitive of a power series, but the pinned Tau Ceti has `MvPowerSeries.primitive` together with the derivative, characterisation and Gauss-norm results of L0.2–L0.5, so those items should name it. The other corrections are a description that predates the RestrictedPowerSeries merge and two page locators that are off by one. Nothing is left for a human to decide.

## C01 — The new Conventions bullet says neither pinned library has a formal primitive of a power series, but the pinned Tau Ceti has one

An implementer of L0.2 would build a second primitive in Mathlib's namespace when Tau Ceti already has it. The bullet (line 55) ends: "neither pinned library has a formal primitive of a power series". At the Tau Ceti pin, `MvPowerSeries.primitive i` (`TauCeti/RingTheory/MvPowerSeries/Primitive/Basic.lean:58`) is the `R`-linear termwise primitive over a `ℚ`-algebra. Its coefficient at `ν` is `(ν_i)⁻¹·a_(ν−e_i)`, and it has no terms free of `X_i`. Three lemmas match the three targets:

- `MvPowerSeries.pderiv_primitive`, `∂(∫f) = f`, is L0.3.
- `MvPowerSeries.coeff_primitive_pderiv`, `∫∂f = f` minus its constant terms, is L0.3.
- `MvPowerSeries.eq_primitive_iff` is L0.4 with `c = 0`.

`PowerSeries R` is `MvPowerSeries Unit R` by `rfl`. The sibling module `…/Primitive/GaussNorm.lean` proves L0.5(b): the Gauss bound `MvPowerSeries.exists_gaussNorm_primitive_le` (line 117) and restrictedness at a smaller radius, `MvPowerSeries.IsRestricted.primitive` (line 132). `NormedField.exists_norm_inv_natCast_le_rpow` (`TauCeti/Analysis/Normed/Field/NatCast.lean:45`) is the bound `‖1/n‖ ≤ n^s` of L0.1, for any normed field of characteristic zero. All seven `#check` at the pin.

The repair: drop the second sentence of the bullet, and give L0.1–L0.5 *In Tau Ceti:* lines naming these declarations, keeping the items and their statements. The one-variable names of L0.2 can stay as proposed adapters, comparing Mathlib's `PowerSeries.derivative` with `MvPowerSeries.pderiv ()`. The description's matching clause ("since neither pinned library has a formal primitive of a power series") would go as well.

## C02 — The description describes RestrictedPowerSeries as it was before its revision merged

Main is now at `eec0f8c`, which merged the RestrictedPowerSeries revision. Its §2.1 and §7.1 name `PowerSeries.evalAt`, `PowerSeries.OnOpenDisc` and `PowerSeries.OnOpenDisc.evalAtHom`, and its `Suggested.lean` no longer declares `OnOpenDisc` or `eval₂`. Two passages of the description are now out of date:

- "On main, RestrictedPowerSeries §§2.1 and 7.1 name no declaration … so the contract holds whichever of the two merges first."
- "It does not depend on that pull request."

A reader is not told that the contract on main now cites two prototypes that no longer exist, and that this change repairs it. The text would read: "RestrictedPowerSeries, as revised on main, states §§2.1 and 7.1 on these Tau Ceti declarations and has removed the prototypes `OnOpenDisc` and `eval₂` that the contract on main still names; this change brings the contract into line with it."

## C03 — Two page locators are off by one

- L2.2 cites "BHYY §3.1, p. 14". The statement that a torsion point not of p-power order lies outside the residue disc of the identity ends p. 13 of arXiv v2; p. 14 opens with Definition 3.1.
- L2.25 cites "GSWZ Proof of Lem. 3.1, `(175)`, p. 37". Printed p. 37 ends with (174); Lemma 3.1, its proof and (175) are on printed p. 38.

## N01 — Words are still fused to code spans or split across them

Line 1315 reads "the identity sendsv tov". Other spans have a word inside them or are split, for example:

- `corrections(0,log u_1,log u_v)` and `satisfying(H0),(H1)`, line 1301;
- `respectively(0,1,∞)`, line 1311;
- "`1-x,1-u,1`-xu", line 1703;
- "``HurwitzZeta.expZeta``(x,k)", line 1823;
- "2v `− 1 = −`(`1 −` 2v)", line 1645;
- `primitive θ` and `a p`-power, lines 1782–1807, 3136 and 3205.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or source side) | Result | Change |
|---|---|---|---|---|
| L0.10 (restated) | `ℚ₂`, `u = 2`; `u = 0`; radius | `‖2‖=1/2<1`, derivative `1/3`; `log 1 = 0`; `‖1/n‖≤n` ⇒ radius ≥1, `=1` (odd `n`) | true; Mathlib `log_eq_logSeries_sum` and Tau Ceti proof (radius only) match | none |
| L0.10 parenthesis, `ContinuousSMul ℚ≥0` | `ℚ_p`, `q_n = p^(−n)` | `q_n→0` in `ℝ≥0`, `‖q_n‖_p = p^n → ∞` | not continuous: claim true | none |
| Mathlib contract: junk value of `NormedSpace.log` | `x ∈ ℂ_p`, `‖x−1‖ = 1` | terms `‖(x−1)^n/n‖ = 1` for `p∤n`; not summable ⇒ tsum 0 | true | none |
| L0.7 Check, L0.15 `padicLogBranch_one_add` | `u = 3` in `ℚ₃` | both sides `Σ(−1)^(n+1)3^n/n` (logSeries at `u`; `IsLogBranch.hasSum_one_add`) | agree | none |
| L2.1 `polylogSer_one_eq_neg_log` | general `‖z‖<1` | `−log(1−z) = −Σ(−1)^(n+1)(−z)^n/n = Σz^n/n` | true | none |
| L1.19 Check (changed) | `p = 3`: `∫_2^5 dz/z` | `5 ≡ 2` mod 3, disc ⊂ tube; `log(5/2)=log(1+3/2)`, `‖3/2‖=1/3` | true | none |
| RestrictedPowerSeries contract (changed) | definitions at pin | `OnOpenDisc R₀ f ⇔ ∀ r∈(0,R₀), IsRestricted r`; `evalAt = Σ' coeff n • bⁿ`; `evalAtHom` needs `‖b‖<R₀`, complete `A` | true; main §§2.1, 7.1 name them | C02 |
| `Subgroup.indClassFun_indClassFun_subgroupOf` (L3.Fd.2(d)) | elaborated type | needs `L ≤ T`, `L.FiniteIndex`, `f` conjugation-invariant; gives `Ind_T Ind_(L⊂T) f = Ind_L f` | matches the prose | none |
| PadicFunctionalAnalysis §4.5 contract | main §4.5, field `E` | convergence at `1+u`, `‖u‖<1`; product law; `‖u+v+uv‖<1` | supported | none |
| Conventions: no formal primitive at the pins | Tau Ceti `MvPowerSeries.primitive`, `σ = Unit` | coefficient `(n)⁻¹a_(n−1)`, `const = 0`; `pderiv_primitive`; `eq_primitive_iff` | claim false | C01 |
| L0.2–L0.4 (L0.2 a sampled Definition) | `f = 1`; `ZMod p`, `X^(p−1)` | `∫1 = X`; `coeff_(p−1)(g′) = p·coeff_p g = 0` | true | C01 (name declarations) |
| L0.12 / `exists_laurent_primitive_iff` (sampled Theorem) | `n = −1`; `T⁻²dT`; BBK Def. 1, Rem. 2, p. 3 | `0·g(0) = a(−1)`; primitive `−T⁻¹`; source formula `c₋₁Log(Q/P)+Σc_i/(i+1)(…)` | true; locator correct | none |
| L0.15 (Definition) | F §2.1 p. 7; BBK §2 p. 3 | F: branch fixed by `log_a(p)=a`; BBK: homomorphism with series on `|x−1|<1` | supported | none |
| L1.6 (Lemma) | `p = 5`, `φ = z^5`, `m = 1` | fixed points `μ_4∖{1}`: 3 = `p − 2`; BBK Def. 14 p. 8; MP Rem. 8.3(2) p. 12; BH §1.2 p. 3 | supported | none |
| L1.8 (Lemma) | `q = 2`, `λ = 2`; `q = 1` | `|2^m| > 1`; `λ = 1` excluded; BH Thm. 1 p. 6 (weights 1, 2) | true | none |
| L1.40 preimage table | `f_1=v/z, f_2=v(z−1)/(z(v−1)), f_3=(1−z)/(1−v)` | preimages of `(0,1,∞)`: `(∞,v,0)`, `(1,v,0)`, `(1,v,∞)` | true | none |
| L2.2 (Lemma) | `ℂ₃`: 9th and 3rd roots; `p = 2`, `−1` | `3^(−1/6)`, `3^(−1/2)`; `|2|₂ = 1/2`; BHYY statement on p. 13 | true; page off | C03 |
| L2.6 (Comparison) | F Thm. 3.3 p. 15, Ex. 3.25 p. 21 | `G₀ ≈ u^A` characterisation; AB coefficient `−Li₂` | supported | none |
| L2.11 (Lemma) | `m = 2`; `k = 3`; F Ex. 2.19(a), Lem. 2.14 | `Li_k(−1) = (2^(1−k)−1)ζ_p(k)`; `Li₃(−1) = −¾ζ_p(3)`; `ζ_p(2k) = 0` | true; pp. 10–12 correct | none |
| L2.13 (Construction), GSWZ (54) | representations of `m = r+pj`, `j = k+p^(N−1)ℓ`, `0≤k<p^N` | up to `p` per class (README) vs one needed | README right; source misprint | source issue |
| L2.16 (Comparison) | BBdJR §4 class (1)–(2), p. 19; (4), p. 20 | series on `|z−a|<1` for `|a−1| = 1`; `g_n` radius `p^(1/(p−1))` | matches | none |
| L2.18 (Lemma) | `D(z)−p⁻²D(z^p)`; GSWZ (174) p. 37; W Ex. 3 p. 363 | `= Li₂^(p) − log z·Li₁^(p)/2` | true | none |
| L2.25 (Theorem) | `(1−p^(−kf))Li_k(ζ) = Σp^(−ik)ℓ_k(ζ^(p^i))` | `p^k(p^(kf)−1)⁻¹ ∈ p^kℤ_p^×`; GSWZ (175) on printed p. 38 | true; page off | C03 |
| L2.69/L2.70 (headline Theorem) | `(4,2)`; `(5,30)` at `p = 5`; DJ pp. 6, 14 | arguments `4,2,1/2,3/2,3`; `|−25| = 5⁻² < |5|`; DJ relies on Coleman Cor. 6.5b | true; not statable, named in docstring | none |
| L2.71 Euler factor | `p∤N`; `p|N, N≠p` | `Σθ⁻¹(c)Li_k(ε^(pc)) = θ(p)S`; fibre sums vanish | true | none |
| L3.13 / `LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog` | `χ₋₄`, `k = 1, 2` | `G = 2i`; `k=1`: `(πi/2)/(2i) = π/4`; `k=2`: `Im Li₂(i) = 1−1/9+1/25−… = Catalan` | true | none |
| L3.28 (headline Theorem) | `p = 5`, `χ₋₃`, `k = 2`; RJW Thm. 6.7 p. 39; BHYY Thm. 1.1 p. 2 | coset masses × `a⁻²`: `2/3−4/3−4/3+2/3 = −4/3 ≡ 2` mod 5; BHYY has `ω^(1−k)` | twist needed, as stated | source issue (RJW) |
| L3.29 | F (2.2), p. 12 | `lim Li_n = pⁿ/(pⁿ−1)·L_p(n, ω^(1−n))` ⇔ `L_p = (1−p^(−n))ζ_p(n)` | matches | none |
| L3.32 (Comparison) | RJW Lem. 6.4 pp. 37–38, (7.5) p. 42 | Lem. 6.4 at the foot of p. 37, proof on p. 38; (7.5) on p. 42 | locators correct | none |
| L3.36 (headline) | BBdJR Prop. 4.17 p. 22 | hypotheses `N ≥ 2`, `E ⊇ μ_exp(G)`, `χ(−1) = (−1)^(n−1)` | match; not statable, named | none |

- Source locators checked against the text: 82, in F (Assumption 2.1, Lem. 2.2, Props. 2.3–2.5, Notation 2.6, (2.1), Lem. 2.7–2.8, Def. 2.9, Rem. 2.10, Prop. 2.11, Notation 2.12, Thm. 2.13, Lem. 2.14, Thm. 2.18, Ex. 2.19, Thm. 3.3, Ex. 3.25), RJW (Rem. 3.39, Lem. 5.12, Thm. 6.1, Lem. 6.4–6.5, Rem. 6.6, Thm. 6.7, Rem. 6.8, (7.5)), BBK (§2 p. 3, Def. 4, Thm. 5, Def. 7, Alg. 8, 10, 11, Rem. 13, Def. 14), BT (Cor. 3.2, Def. 4.7, Cor. 4.13–4.14, Thm. 4.15, Rem. 5.6, Thm. 5.7), BF (Prop. 2.1, Cor. 2.2, Lem. 2.4, Prop. 3.1), BH (§1.2, Prop. 1, Def. 1, Thms. 1–2, Lem. 1, (1.4)), MP (§5.2, Rem. 8.3), DJ (Prop. 2.10, pp. 6–7, 14), BBdJR (§4 pp. 19–20, (4.11), Rem. 4.16, Prop. 4.17, Rem. 4.19), BHYY (§1, Thm. 1.1, §3.1, Lem. 3.3), GSWZ (Lem. 2.1, (54), (174), (175), Prop. 3.2), W (Lem. 4.3, Ex. 3, Prop. 4.4), BDJ ((1.2), Rem. 1.5, Rem. 2.3, (2.4), Prop. 2.6). All are correct except the two pages of C03.
- Library declarations opened at the pins: 121 dotted library names of the README `#check`ed in one file at the pins; all resolve except `Algebra.TensorProduct`, which is a namespace, not a constant. Also checked: seven primitive and natCast declarations (C01), `PowerSeries R = MvPowerSeries Unit R` by `rfl`, and two Riemann–Roch and Serre-duality names, read in source because their module is not built (`RiemannRoch/Basic.lean:130`, `Scheme/SerreDuality.lean:122`). No `logOneAdd`, `TauCeti.indClassFun` or old pin remains in the README.
- Read at the pins: the Mathlib file `Analysis/Normed/Algebra/Logarithm.lean`, lines 1–140 (definition, `log_eq_logSeries_sum`, `log_eq_tsum`, ultrametric convergence listed as future work), and Tau Ceti's `Logarithm/Basic.lean`, lines 64–121.
- Cross-roadmap citations resolved: the citation tool reports no cross-roadmap citation found nowhere. Checked by hand: PadicFunctionalAnalysis §4.5, RestrictedPowerSeries §§2.1 and 7.1 on main at `eec0f8c`, and BorelRegulators line 730, which leaves L3.Fc.1 here.
- Automatic checks: the gate at this head reports every check 0, OK.
- Elaboration: `lake env lean TauCetiRoadmap/ColemanIntegration/Suggested.lean` gives five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118) and nothing else. `Suggested.lean` is unchanged since the last review. The `#check @` comparison of its nine declarations with the README matches, and `IsLaurentOn` drops only instance binders it does not use.
- Dependency check: `depcheck: 172 roadmaps, 2009 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The diff outside the folder is empty. The merge-base README has 4 layers, and none is removed or retitled; the change consists only of substitutions and spacing.
- Previous review (r7): R01 repaired (the headings now give pins `1b1ccf4b…` and `2fd255d9…`; L0.10 is restated on `NormedSpace.logSeries`; every `logOneAdd` is replaced; the `Subgroup` induction names are used). C01 was repaired but is now overtaken by the merge (C02). N01 is repaired by the new Conventions bullet, whose last clause is C01. N02 is partly repaired (N01). N03 is repaired.
- Overlap check: read PadicHodgeRegulators, PeriodsAndSpecialValues, ZagierConjecturePolylogarithms, HabiroNahmSeries (open), ColemanIntegrationPartII, PolylogarithmFunctions and BorelRegulators (main). Each consumes ColemanIntegration ids, all still present, or supplies to it. BorelRegulators leaves L3.Fc.1's Beilinson-normalised lattice theorem here (its line 730); the other six share nothing. DirichletPadicLFunctions and PadicDifferentialEquationsAndRigidCohomology are suppliers.

Source independence: 82 locators and 6 further passages (Summary against RJW §6, L2.16 against BBdJR p. 19, L1.6 against BBK Def. 14, L3.36 against BBdJR Prop. 4.17, L0.15 against F p. 7, L2.13 against GSWZ Lem. 2.1) compared with 13 sources. Nothing is shared beyond formulas and hypothesis lists that can be written only one way (at most 5 consecutive words). Largest share RJW, 107 of 546 locators. Contents compared with RJW §§1–13: L0–L2 have no RJW counterpart, and L3 draws on RJW §§3, 5, 6 and 7 inside one layer, beside the regulator foundations: independent.

Research link: L3.28 is Coleman's 1982 formula for Kubota–Leopoldt values at positive integers (RJW Thm. 6.7; BHYY Thm. 1.1, extended there to totally real fields). L3.36 is Besser–Buckingham–de Jeu–Roblot's 2009 proof of parts (1)–(3) of the p-adic Beilinson conjecture for abelian Artin motives (Prop. 4.17). L1's integrals underlie Chabauty–Coleman (BBK 2010; McCallum–Poonen). This rests on the README and on these sources as read.

## Not verifiable

- RJW page numbers marked "published" (Essential Number Theory 4, 2025): the version of record was not opened; the arXiv v2 numbering was checked instead.
- Whether the version of record of RJW corrects Theorem 6.7(ii): not read.
- Lazard, Kedlaya *p-adic Differential Equations*, Serre, Weibel, Quillen, Feliu, BC and FPZ: their locators were outside the sample and were not opened.

## Source issues

- **Error** in RJW at Theorem 6.7(ii), p. 39 (arXiv v2): the source gives the left side as `L_p(θ, k)`, in the normalisation of its Definition 5.18. It should be `L_p(θω^(1−k), k)`: for odd `θ` the printed side vanishes (the source notes this vanishing at `s = 1`, p. 36), while for `p = 5`, `θ = χ₋₃`, `k = 2` the right side is ≡ 2 mod 5; affects a stated result.
- **Misprint** in GSWZ at the proof of Lemma 2.1, (54), p. 19 (arXiv v2): the source takes `k` from 0 to `p^N − 1` with period `p^N`, so each prime-to-`p` class is counted `p` times; it should take period `p^(N+1)` as in (53), or `k < p^(N−1)`; affects the proof.

## For the human reviewers

- none
