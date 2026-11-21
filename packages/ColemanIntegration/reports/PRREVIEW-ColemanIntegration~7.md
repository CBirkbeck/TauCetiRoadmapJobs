# Review of ColemanIntegration (pull request #2864 at 2e623b0)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding. The changed contract line is correct at the actual Tau Ceti pin. But the supplier contracts still name older Mathlib and Tau Ceti commits as their pins, and at the older Tau Ceti commit the new line is false. At the actual pins, five Tau Ceti names cited in the same contracts no longer exist: four `NormedSpace.logOneAdd…` names, on which L0.10, L0.15 and L2.1 are stated, and the induction-transitivity lemma of L3.Fd.2. The sampled mathematics holds: the headline formulas, the Checks recomputed and 13 source locators. There is one small correction to the description, three format notes and one question for the author; nothing is left for a human to decide.

## R01 (P2) — The supplier contracts name pins that are not the roadmap's, and at the actual pins five cited Tau Ceti declarations do not exist

An implementer of L0.10 (and of the logarithm APIs of L0.15 and L2.1, and of L3.Fd.2(d)) is sent to declarations the pinned Tau Ceti does not have. The pin headings also make the line this pull request adds false. `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, but the headings "From Mathlib (pinned at `6b7abb3c…`)" (line 3315) and "From Tau Ceti (pinned at `a91d3aaf…`)" (line 3326) give older commits. At `a91d3aaf` the Tau Ceti tree has no `OnOpenDisc` anywhere (`git grep` finds nothing; there is no `RingTheory/PowerSeries/OpenDisc/`), so the new line 3340 does not hold under the pin the README states. At `2fd255d9`, `#check` fails with "Unknown constant" for `NormedSpace.logOneAdd`, `NormedSpace.logOneAddSeries`, `NormedSpace.hasFPowerSeriesOnBall_logOneAdd` and `NormedSpace.logOneAdd_eq_tsum`. These are cited at lines 184, 213–219, 397, 409, 417, 608, 1020, 1442–1457, 1536, 3328 and 3351. `TauCeti.indClassFun_indClassFun_subgroupOf` (lines 2734, 2744, 3303, 3334, 3344) fails the same way. All five existed at `a91d3aaf`, so they went stale when main's Tau Ceti pin moved.

At the pin, the logarithm is Mathlib's `NormedSpace.log`, with series `NormedSpace.logSeries` (`Mathlib/Analysis/Normed/Algebra/Logarithm.lean:72, 90`). Tau Ceti has `NormedSpace.one_le_logSeries_radius` and `NormedSpace.log_hasFPowerSeriesOnBall` (`TauCeti/Analysis/Normed/Algebra/Logarithm/Basic.lean:71, 102`), both still under `[ContinuousSMul ℚ≥0 𝕂]`, and the second is centred at 1. So L0.10's ultrametric radius bound is still needed: neither pin has it, and Mathlib's file lists it as future work. The induction lemma is now `Subgroup.indClassFun_indClassFun_subgroupOf` (`TauCeti/RepresentationTheory/Induction/ClassFunction.lean:349`), and induction itself is `Subgroup.indClassFun` (line 194), not the `TauCeti.indClassFun H` of line 3333. The supplier PadicFunctionalAnalysis §4.5 is likewise stated on `NormedSpace.log` on main (its README lines 958–962), not on "the native `NormedSpace.logOneAdd` carrier" that line 3351 describes.

The smallest repair is in four parts:
- Set the two headings to the manifest pins.
- In L0.10, state the bound for `NormedSpace.logSeries K K` and the expansion as `HasFPowerSeriesOnBall NormedSpace.log (NormedSpace.logSeries K K) 1 1`, citing the two Tau Ceti theorems above.
- Elsewhere, write `NormedSpace.log (1 + u)` for `NormedSpace.logOneAdd K K u`.
- Use the `Subgroup` names for the induction API.

## C01 — The description says RestrictedPowerSeries §7.1 and §2.1 "are stated on Tau Ceti's own declarations", which is true of the open revision of that roadmap, not of main

On main, RestrictedPowerSeries §§2.1 and 7.1 name no declaration. Its `Suggested.lean` still declares the two prototypes the old line cited: `eval₂` at line 76 and `OnOpenDisc` at line 184. A reader who checks the sentence against main finds the opposite. Would read: "At the head of the RestrictedPowerSeries revision, §7.1 and §2.1 are stated on Tau Ceti's own declarations; the contract now names those declarations directly, so it holds whichever of the two merges first." The rest of the description matches the head. One README line changes. The condition and the sum L3.6 uses are the same as before: main's prototype `OnOpenDisc` has the same body as Tau Ceti's, and `eval₂ (RingHom.id K)` is the `evalAt` sum with `•` read as `*`.

## N01 — About 80 backticked names are proposals that `Suggested.lean` does not declare

Examples are `PowerSeries.primitive` and its seven API names in L0.2, `discAnalytic.*` in L0.7, `GoodReductionPair.*` in L1.1 and `padicPolylog*` in L2.5. `PowerSeries.primitive` reads as a Mathlib name. Writing them in prose, or marking them as proposed names, would let a reader tell a proposal from a declaration.

## N02 — Words are fused with numbers and code spans

Examples are "For primep, every brancha" and "including2" in L2.69 (lines 2264, 2266), "close to0 and6 is close to1" in L2.31 (line 1860), and "Definition2.9 and Remark2.10" in the locators of L0.24–L0.25.

## N03 — Two Tau Ceti names in the JacobianChallenge contract (line 3347) omit their namespace

They are `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.eulerCharBelow_sheaf_eq_relativeDegree_add_one_sub_genus` and `…SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero` at the pin.

## Questions for the author

- How is L3.Fc.1's lattice-image assertion for `reg_∞` meant to be proved? Its *Needs* supply only the rank (ArithmeticKTheory §3.4) and no route to the lattice. BorelRegulators §§2.3 and 5.3 prove the Borel-normalised form for every number field, and its §6.2 compares the two regulators. BorelRegulators' scope section (main, line 730) leaves L3.Fc.1 here, describing it as "for finite Galois number fields", but L3.Fc.1 now covers every number field. I could not tell whether the two roadmaps intend to own the same theorem in two normalisations. The merge order (ColemanIntegration before BorelRegulators) stops this roadmap from citing BorelRegulators.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Changed line 3340 (L3.6 contract) | `#check` at `2fd255d9`; main's RestrictedPowerSeries prototypes | `OnOpenDisc` body identical; `evalAt = ∑' coeff n f • bⁿ`; `evalAtHom : OnOpenDisc.subring R R₀ →+* A`, needs `‖b‖<R₀`, complete `A` | true at the actual pin; false at stated pin `a91d3aaf` (no `OnOpenDisc`) | R01 |
| L0.10 and Tau Ceti contract (logarithm) | `#check` of four names at `2fd255d9` and `git grep` at `a91d3aaf` | unknown constants now; present before; pin has `logSeries`, radius under `ContinuousSMul ℚ≥0`, expansion at centre 1 | stale names; mathematics unaffected | R01 |
| L3.Fd.2(d) induction transitivity | `#check` | `TauCeti.indClassFun_indClassFun_subgroupOf` unknown; `Subgroup.indClassFun_indClassFun_subgroupOf` exists (line 349) | renamed | R01 |
| L3.13, `LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog` | `χ₋₄, k=1`; `N=1` | `G=i−i³=2i`; sum `Li₁(i)−Li₁(−i)=πi/2`; quotient `π/4=L(χ₋₄,1)`; `N=1,k=1`: `complexPolylog 1 1=0` vs `ζ` junk at 1 | holds; `2 ≤ N` needed and present | none |
| Summary and L3.28: unit claim, `p=5, θ=χ₋₃, k=2` | Riemann sums of `∫x⁻²dμ_{ε^c}` mod `5⁷` in `ℤ₅[ε]` | `G⁻¹Σθ⁻¹(c)Li₂^{(5)}(ε^c) ≡ 43807 mod 5⁷`, `≡ 2 mod 5`, `ε`-part 0 | right side a 5-adic unit; untwisted `L₅(θ,2)=0` (θ odd) | none |
| L3 Examples, coset masses | `(μ_ζ−μ_{ζ²})/(ζ−ζ²)` on `a+5ℤ₅`, `a=1..5` | `2/3, −1/3, −1/3, 2/3, −1/3`; weighted by `a⁻² mod 5`: `−4/3 ≡ 2` | matches the computation above | none |
| L0.15 Check, `log(4)` in `ℚ₃` | series to 200 terms mod `3¹²` | `303798`, digits `0,1,2,1,0,2,2,0,1,0,2,1` | equals the stated expansion | none |
| L2.5 Checks | inversion, reflection, `Li₂(1)=0` | `Li₂(−1)=0`; `Li₂(2)=−Li₂(−1)=0`; `Li₂(1/2)=−log²2/2`; `Li₂(1/p)=−Li₂^{ser}(p)−a²/2` | all hold | none |
| L2.1 Check `‖Li₂(p)−p‖=p⁻²` | `p≥5`; `p=3` | `n=2`: `p⁻²`; `n=p`: `p^{−(p−2)}`; at `p=3` the `n=3` term is `3⁻¹` | holds; `p≥5` needed | none |
| L2.18 branch change | `β=a−b`, `u=v(z)`, `w=v(1−z)` | `(β/2)(u·log_b(1−z) − w·log_b z)`; on `|z|>1` inversion gives `−βu(log_a z+log_b z)/2` | agrees with DJ p. 7 | none |
| L2.69/L2.70 (headlines) | `(x,y)=(4,2)`; `(5,30)` at `p=5` | arguments `4, 2, 1/2, 3/2, 3`; `|5−30|=5⁻²<|5|` | Checks hold; not statable at the pins, named in docstring | none |
| L2.71 parity | `χ₋₄, k=1` | `S=θ(−1)(−1)^{k+1}S`; `Li₁(i)−Li₁(−i)=0` p-adically | consistent with Summary parity | none |
| L3.3 (BF Prop. 2.1) | `p=3, w=−1`; BF's `a=0..pᵐ−1` | `−1/2, 1/2, −1/2`, total `w/(1−w)`; BF's measure differs by `δ₀` | same moments on `ℤ_p^×` | none |
| L0.A1 Checks | `(T+p)(T⁻¹+p)` at `ρ=p⁻²`; `T−p` on `(1/p,1)` | `p⁻¹·p² = p = |fg|`; inverse `Σpᵏ T^{−k−1}` | hold | none |
| L0.A2(d) vs Lazard Prop. 4 | valuation and radius conventions | unit iff `n_{ρ₁}=N_{ρ₂}`; degree `N_{ρ₂}−n_{ρ₁}` | agrees, p. 55 | none |
| L2.Fa Checks | inversion `x=1/3, 1/4`; distribution `m=2` | `πi/3` (principal Log direct), `πi/2`; `π²/6=2(π²/6−π²/12)` | hold | none |
| L3.36 (headline) Checks | `[−1]₃`; `N=2` | `[−1]₃=4([i]₃+[−i]₃)=8[i]₃`; `ζ(n)=2^{n−1}(1−2^{n−1})⁻¹Pₙ(−1)` (BBdJR p. 22) | hold; not statable, named | none |
| L3.29 Check | distribution `m=2, k=3` | `Li₃(−1)=(1/4−1)Li₃(1)` | holds | none |
| `existsUnique_logLaurent_primitive` (L0.22) | `d(Σ G_k Tⁿ lᵏ)`; `F=0` | coefficient `(n+1)G_k(n+1)+(k+1)G_{k+1}(n+1)`; top `G_{D+1}` constant `F_D(−1)/(D+1)`; `F=0 ⇒ G=0` | statement correct | none |
| `exists_laurent_primitive_iff` (L0.12) | `n=−1`; `I=(0,∞)` | `0·g(0)=a(−1)`; converse `g(n+1)=aₙ/(n+1)`, decay from nearby radii (I open) | correct both ways | none |
| `logBranch_laurent_transcendental` (L0.21) | `log_a`; `‖z‖∈I` | `IsLogBranch` satisfied by `log_a`; `z≠0`, so value at 0 unused; ℤ-sum summable (ultrametric) | non-vacuous, correct | none |
| `existsUnique_primitive_disc` (L0.8) | `r=∞`; `b=a` | radius preserved by L0.5; uniqueness among whole-disc series | correct | none |
| L0.1 | `s=log(1/‖p‖)/log p` | `‖n‖⁻¹ = p^{s·v_p(n)} ≤ nˢ` | holds | none |
| L3.6 Checks | `dop(T²)`, `unitsZPow 2 (−1)` at `p=2` | `2T+2T²`; `1` | hold | none |
| L3.5 Checks | `w=ζ_p`; general `w` | radius `|1−ζ_p|=p^{−1/(p−1)}`; `F̃⁽¹⁾_w=−log(1−w)+Σ(w/(1−w))ᵐTᵐ/m` | hold | none |
| L2.2 Checks | 9th and 3rd roots in `ℂ₃` | `3^{−1/6}`, `3^{−1/2}` | hold | none |
| L3.Fc.1 Checks | `3+4i`; `ℚ(2^{1/3})` | `n=2`: `4i`, `n=3`: `3`; dimensions `1=r₂`, `2=r₁+r₂` | hold | question |
| RJW Thm. 6.7(ii) correction (L3.28) | as printed, `p=5, χ₋₃, k=2` | printed left side `L₅(θ,2)=0`; right side `≡2 mod 5` | README's twist needed | source issue |

- Source locators checked against the text (13): RJW Def. 5.18 and Rem. 5.19 (5.7) p. 35, Lem. 6.5 and (6.5) p. 38, Thm. 6.7 p. 39; BHYY Thm. 1.1 p. 2; BBdJR Rem. 4.16 p. 21, Prop. 4.17 p. 22; DJ Prop. 2.10 p. 6; BF Prop. 2.1 p. 2; F (2.1), Lem. 2.7–2.8 p. 9; BH §1.3.2 p. 5; Lazard Prop. 1 pp. 50–51, Prop. 2 pp. 53–54, Prop. 4 p. 55 (printed pages confirmed from running heads). All support the statements as written. The seeded sample named only target kinds, so I chose these across L0–L3.
- Library declarations opened: 135 library-namespaced names of the README `#check`ed at the pins. Unknown: the four `logOneAdd` names and `TauCeti.indClassFun_indClassFun_subgroupOf`; the rest resolve (eight `PowerSeries.primitive*` names are proposals; the module paths exist as files). The changed line's three declarations were `#check`ed after `lake build TauCeti.RingTheory.PowerSeries.OpenDisc.Eval`, and their files were read (`OpenDisc/Basic.lean:100`, `EvalAt.lean:96`, `OpenDisc/Eval.lean:110`). No polylogarithm, Coleman integral or Kubota–Leopoldt function is at either pin, so the docstring's list of statements that cannot be stated holds.
- `#check @` of the nine `Suggested.lean` declarations compared with the README: they match. `IsLaurentOn` drops instance binders it does not need. No change.
- Cross-roadmap citations resolved: none unresolved by the citation tool; spot-checked on main DirichletPadicLFunctions §0.6 names, PadicFunctionalAnalysis §4.5 (now on `NormedSpace.log`), ArithmeticKTheory §3.4 (`borel_rank_order`, `borel_rank_centralSimple`), MotivicEtaleKTheory §§2.0a, 7.1, 7.4, and RestrictedPowerSeries §§2.1, 7.1 on main and at its open revision.
- Automatic checks: gate at this head, every check 0, OK. `lake env lean TauCetiRoadmap/ColemanIntegration/Suggested.lean`: five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118), nothing else. No `set_option`; single `import Mathlib`. One-tactic probe decided by reading: none of the five theorems closes in one step.
- Dependency check: `depcheck: 172 roadmaps, 2009 edges, 0 problem(s)`; no UPWARD or CYCLE line. Diff outside the folder: empty. Previous review (r6): no open finding to re-check.
- Overlap check: read PadicHodgeRegulators, ColemanIntegrationPartII, PolylogarithmFunctions, PadicDifferentialEquationsAndRigidCohomology, ZagierConjecturePolylogarithms and BorelRegulators. The first four consume from here or supply RD.0–RD.6 to it, and none shares an object; ZagierConjecturePolylogarithms shares nothing. BorelRegulators proves Borel's lattice theorem in its own normalisation and leaves L3.Fc.1's Beilinson-normalised form here, the earlier owner (see the question).
- Source independence: 19 passages compared with 8 sources (the 13 locators above, plus the Summary against RJW §6, L0.6 against BH, L3.36 against BBdJR p. 22, L3.6 against RJW (6.5), L2.18 against DJ pp. 6–7 and L3.3 against BF). Nothing is shared beyond formulas and the hypothesis list of L3.36, which can be written only one way (at most 6 consecutive words). Largest share: RJW, about 107 of about 565 locators. Contents compared with RJW (§§1–13): L0–L2 have no RJW counterpart, and L3 draws on RJW §§3, 5 and 6 inside one layer, next to the regulator foundations: independent.
- Research link: L3.28 is Coleman's 1982 formula for Kubota–Leopoldt values at positive integers (RJW Thm. 6.7, p. 39). Besser–Buckingham–de Jeu–Roblot (2009, Prop. 4.17) use it with Besser–de Jeu's syntomic regulator (2003) for the p-adic Beilinson conjecture of L3.36. L1's integrals feed Chabauty–Coleman (Balakrishnan–Bradshaw–Kedlaya 2010; McCallum–Poonen). This rests on the README and on RJW and BBdJR as read.

## Not verifiable

- Page numbers marked "published" for RJW (Essential Number Theory 4, 2025): the version of record was not opened; the arXiv v2 numbering was checked instead.
- Whether the version of record of RJW corrects Theorem 6.7(ii): not read.
- Quillen, Kedlaya *p-adic Differential Equations*, Serre and Weibel locators: books not in the sample and not opened.

## Source issues

- **Error** in RJW at Theorem 6.7(ii), p. 39 (arXiv v2): the source says the left side is `L_p(θ, k)` in the normalisation of its Definition 5.18; it should be `L_p(θω^{1−k}, k)`, since for p = 5, θ = χ₋₃, k = 2 the printed side vanishes by parity while the right side is ≡ 2 mod 5; affects a stated result.

## For the human reviewers

- none
