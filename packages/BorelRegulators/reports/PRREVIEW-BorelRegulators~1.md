# Review of BorelRegulators (pull request #1461 at 0faed68)

**Verdict:** needs changes

The gate passes (every scanner 0, depcheck 0 problems, targeted build OK). The four Lean statements elaborate with `sorry` as the only warning and each is true at the stated generality. No principle is violated: no route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm, no sorry'd data, no `set_option`, no edit outside the folder. One finding is blocking, and it is documentary: two of the ten gaps that `design/plan.json` declares ask MotivicEtaleKTheory for what that roadmap's §7.1 already supplies and for what this roadmap's §§6.0a–6.0b now own, and the README states neither contract.

## R01 (P2) — Two declared gaps ask for what is already provided and the README no longer states them

Location: `packages/BorelRegulators/design/plan.json`, `gaps` entries `universal-deligne` and `infinitesimal-classifying-comparison` (supplier MotivicEtaleKTheory); `TauCetiRoadmap/BorelRegulators/README.md` lines 157–159 (the MotivicEtaleKTheory subsection of Exact supplier contracts).

Claim: the brief lists both as gaps this roadmap declares. `gap:universal-deligne` asks the supplier for the real Beilinson regulator on actual K-groups "together with … real descent, restriction and finite-transfer compatibility, and r_Be∘ψ^a=a^n·r_Be"; `gap:infinitesimal-classifying-comparison` asks it for the isomorphisms from the first infinitesimal nerve to CE*, W and CE*(·,ℝ(n−1)).

Witness: the README's MotivicEtaleKTheory subsection contains no `What MotivicEtaleKTheory must provide (gap:…)` line (the README mentions exactly eight gap slugs, none of these two). Section 6.0a constructs the conjugation, finite-transfer and Adams interfaces itself; §6.0b constructs the infinitesimal classifying comparison itself. MotivicEtaleKTheory at its open head (README line 731) supplies §§3.3–3.4, 4.1–4.2, 7.1 and says the "topological calibration, conjugation/transfer interfaces, infinitesimal comparison and arithmetic theorems remain there", i.e. in BorelRegulators. So both gaps ask for objects that are provided (the character by MotivicEtaleKTheory §7.1, the rest by this roadmap), and the intake would announce them on a supplier that has declined them.

Repair: in the MotivicEtaleKTheory subsection of Exact supplier contracts, state the disposition of each slug in one sentence each, so the declaration the intake reads matches the README: `gap:universal-deligne` is met by MotivicEtaleKTheory §7.1 (the universal Deligne character on actual K-groups) together with §6.0a here (conjugation, transfer, Adams), and `gap:infinitesimal-classifying-comparison` is owned by §6.0b here. The plan entries themselves cannot be edited at the package stage; the operator should drop or mark them discharged at intake. No mathematics changes.

## R02 (P3) — borel1980 is cited with line locators but has no manifest entry

Location: `TauCetiRoadmap/BorelRegulators/README.md` lines 27 ("borel1980 line 29–43"), 507, 571, 600 and the References entry at line 858; `packages/BorelRegulators/sources.toml`.

Claim: every cited work is recorded in `sources.toml`; the README cites `borel1980 line 29–43` and `borel1980 line 43` as passage locators.

Witness: `sources.toml` has entries `weil1961, borel1977, borel1974, burgos2002, beilinson1985, poonen2017, deligne_goncharov2005` and none with id `borel1980`; the text itself is in the sources cache (Numdam `ASNSP_1980_4_7_2_373_0`, two pages, the item list at its lines 29–43).

Repair: record `borel1980` through the sources service (`sources fetch --id borel1980 --locator-scheme page --locator "p.373, items 1–3" --cited-for "Conventions, 4.3, 4.6, 5.1" "https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0/"`), which writes the entry with its sha256 and status. Nothing in the README changes.

## R03 (P3) — The complex-embedding clause of `exists_divisionAlgebra_split_at_infinity` is vacuous

Location: `TauCetiRoadmap/BorelRegulators/Suggested.lean` lines 93–94, the conjunct `∀ σ : F →+* ℂ, … TauCeti.Algebra.IsSplittingField F D ℂ`.

Claim: the theorem asserts splitting at every real and every complex embedding.

Witness: every finite-dimensional central simple algebra over F splits over ℂ along any embedding, since ℂ is algebraically closed (Mathlib `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`, cited by AdelicAlgebraicGroups's own supplier table). For the Hamilton quaternions over ℚ, ℂ⊗D ≅ M₂(ℂ) although D is not split at the real place. So the ℂ-clause holds for every D and adds nothing; the real-embedding clause carries the whole content. The statement is true as written.

Repair: delete the complex-embedding conjunct from the Lean statement (the README's "split at every infinite place" is unaffected: at complex places the condition is automatic, which the README may say in §3.2 as a Check). Author's choice.

## Verified sound

**Gate and build.** The worker's gate at 0faed68: every check 0, build OK. Dependency check run by me: `depcheck: 204 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line. BorelRegulators is at line 277 of the merge order; every supplier it cites is earlier (LFunctions 23, IntegralIwasawaTheory 24, AdelicAlgebraicGroups 30, SchemeKTheoryOperations 33, ArithmeticGaloisDuality 42, ArithmeticKTheory 120, MotivicEtaleKTheory 121, ColemanIntegration 123, HeightsRationalPointsAndObstructions 125, EndoscopicTransferAndUnitaryTraceComparison 132) or on main (CharacteristicClasses, TopologicalKTheory, DifferentialGeometry, AlgebraicTopology, SchemeAndStackFoundations, ClassFieldTheory, RepresentationTheory/SemisimpleAlgebras, LFunctions; NumberFieldArithmetic under Completed). Consumers named (Polylogarithms 281, PeriodsAndSpecialValues 296, HabiroNahmSeries 313) are later. The outside-folder diff is empty. The folder contains only `README.md`, `Suggested.lean`, `metadata.toml`.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all four declarations: four `declaration uses sorry` warnings and nothing else; the elaborated types agree with `scratch/signatures.md` and with the README statements in §§1.3, 3.1, 3.2, 5.1 (same hypotheses: `NumberField F`, `2 ≤ n`, `Even n`, `IsTotallyReal F`, `1 ≤ a`; no dropped section binder, no `include` needed). Imports are `import Mathlib` plus two existing `TauCeti.*` modules. No `lemma`, `set_option`, `#eval`, `#print`. A second elaboration for the one-tactic probe failed before reaching the file: a concurrent worktree flipped the shared packages directory to mathlib f6090c70 at 18:16 and back at 18:19, after which `Mathlib/Algebra/Group/Subgroup/Basic.olean` for the pin is missing. The padding decision below is therefore by reading.

**Padding probe (by reading).** None of the four theorems restates a definition, mirrors a Check, computes a value or treats a boundary case: `dedekindZeta_continuation_leadingTerm` needs the completed functional equation; `period_eq_index` is Albert–Brauer–Hasse–Noether; `exists_divisionAlgebra_split_at_infinity` needs the global Brauer sequence; `exists_pos_rat_dedekindZeta_of_isTotallyReal` is Siegel–Klingen plus the functional equation. No one-tactic closure is possible. The file states every headline that is statable at the pins; the module docstring names the Layer 2–6 headlines that are not (higher Quillen K-groups, Deligne cohomology, adelic and compact-dual carriers), and I confirmed Tau Ceti has no K-theory or Deligne-cohomology carrier directory and Mathlib none at the pin.

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf; every cited file:line resolves to the named declaration): 28 Mathlib — `card_add_two_mul_card_eq_rank` InfinitePlace/Basic.lean:474; `discr` :36 and `discr_ne_zero` :41 Discriminant/Defs.lean; `prod_abs_eq_one` ProductFormula.lean:98; `IsTotallyReal` :47, `nrComplexPlaces_eq_zero_iff` :52 TotallyRealComplex.lean; `nonempty_primesOver` GoingUp.lean:355; `mkQ` :227, `mkQ_surjective` :236; `CSA` :40, `BrauerGroup` :99; `exteriorPower.map` :260, `map_id` :293, `map_comp` :298, `finrank_eq` Basis.lean:173; `covolume_div_covolume_eq_relIndex` :148, `IsZLattice` Basic.lean:433, `covolume` :72, `covolume_pos` :98, `covolume_eq_det` :125; `AnalyticAt` :110; `analyticOrderAt` Order.lean:48 (junk value 0 when not analytic, as the README says); `iteratedDeriv` :55; `dedekindZeta` :49 (an `LSeries`, so the agreement hypothesis on Re>1 is meaningful) and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` :77; `det_fin_zero` :798; `riemannZeta_two` :226, `riemannZeta_four` :232. 15 Tau Ceti — `exists_differentiableOn_eq_dedekindZeta_sub` DedekindZeta.lean:158 (half-plane Re s > 1−1/[K:ℚ], as stated); `exists_eq_mk_centralDivisionRing` Division.lean:69; `mk_matrix` Group.lean:159 (`[NeZero n]`); `index` Index.lean:99, :112, :171, :180, `exists_isSplittingField_finrank_eq_index` :255; `deg` Degree.lean:163, `deg_sq` :239; `IsSplittingField` Splitting.lean:120 (existential size, as the README notes); `mk` Group.lean:139, `instCommGroup` :174 (universe `{u,u}`); `brauerCohomologyEquiv` Comparison.lean:267; `tate` Tate/Basic.lean:91 with `tateLatticeMap = Algebra.linearMap ℤ ℂ` (unscaled, as the README says). Mathlib `Units/Regulator.lean` exists, supporting the Scope sentence on the degree-one regulator.

**Cross-roadmap citations resolved** (section exists where cited, and states what is consumed): ArithmeticKTheory §3.3 (odd-degree surjectivity, rationalSIntegerEquiv) and §3.4 (`borel_rank_order`, stable arithmetic/relative-Lie comparison, ranks r₁+r₂ in degree 1 mod 4 and r₂ in degree 3 mod 4) at head 1418; MotivicEtaleKTheory §§3.3, 3.4, 4.1, 4.2, 7.1, 7.4 at head 1470, with the cone `fib(A_ℝ(p)⊕FᵖA_ℂ→A_ℂ)`, arrow `(a,f)↦f−a`, point inclusion `r↦(0,0,r)` and projection by πₚ, exactly the f−r convention the README's §6.0a assumes, and its consumer line assigning calibration, conjugation/transfer, infinitesimal comparison and arithmetic theorems to BorelRegulators; ColemanIntegration L3.Fc.1 (reg_∞ = ch_(D,n) followed by π_(n−1), through MotivicEtaleKTheory §§7.1, 7.4; finite Galois k); EndoscopicTransferAndUnitaryTraceComparison §6.2 (τ(S)=1 for every simply connected semisimple S, inner forms included); AdelicAlgebraicGroups §§1.2, 1.4, 2.2, 2.3, 2.4, 2.5, 3.4 (H=SL₁(D) with compact quotients), 4.2; ArithmeticGaloisDuality R02.4.5b and R02.4.6 (Grunwald–Wang with the dyadic obstruction); IntegralIwasawaTheory §6.0 (`totallyRealHeckeValue_rational`); GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7, 7.8; StableHomotopyKTheory §§2.3, 2.4, 2.5, 3.37, 4.14; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3 (van Est); SchemeKTheoryOperations §6.8; HeightsRationalPointsAndObstructions §3.6 (cites Poonen 1.5.36 directly, as the Scope says); CharacteristicClasses C5a.1–C5a.7, C6 items 2–3 with `ch(u)=−v` (line 1496) and the ordered suspension (item 3, line 1489); TopologicalKTheory T4 (`β=[L]−1` with L the tautological O(−1), line 150; `(x,y)↦x+iy`, `u=β`, line 879) and T7 item 1 (`c(a)=2u²`, `c(b)=u⁴`, line 1263); DifferentialGeometry Layers 5, 6, 8; AlgebraicTopology Stage 5; SchemeAndStackFoundations §0.28; ClassFieldTheory Layers 5 and 10; SemisimpleAlgebras Layer 6; LFunctions Layer 3 (agreement with Mathlib's `dedekindZeta` on Re s>1, meromorphic continuation, `Λ_K(1−s)=Λ_K(s)`, uniqueness). The worker's `roadmaps resolve` found no unresolved citation and I found none either.

**Ownership by object.** `roadmaps grep` over the 424 open heads and main: "Borel regulator" occurs in PadicHodgeRegulators, Polylogarithms, PeriodsAndSpecialValues and K3BlochGroups only as a consumer (PadicHodgeRegulators line 74 consumes §§2.1–2.3 and 6.0a; PeriodsAndSpecialValues line 29 consumes `r_Bo = −2·r_Be`; both agree with this README). Period = index is used, not proved, by HeightsRationalPointsAndObstructions and EndoscopicTransfer (an example). No other roadmap states the division-algebra existence theorem, the leading-term theorem or the totally real rationality; IntegralIwasawaTheory §6.0 owns the Siegel–Klingen input the README cites. No second `Suggested.lean` declares any of the four names. The ten declared gaps have named suppliers (none `none`); the eight stated in the README are precise and minimal; the two not stated are R01.

**Sources at the sampled locators** (all read in the cache extractions; borel1977's displayed formulas are lost to OCR, so each formula was recomputed independently and the surrounding text checked): borel1977 §1.4 lines 137–139 (d_m = r₁+r₂ for m even nonzero, r₂ for m odd; m = n−1 here, matching dₙ); §1.6 lines 153–163 (Tamagawa product); Lemma 2.2 lines 177–195 (n places with invariant 1/n; the README's two places with ±1/a is an equivalent choice); §2.3–Prop 2.4 lines 196–236 with τ(H)=1 at line 227 and rational local masses at line 231; §§3.3–3.5 lines 289–337 (i-power correction of the comparison; filtration compatibility of α, β at 333–336); Prop 4.3 lines 369–402; §5.2 lines 440–461 (SO_n totally non-homologous to zero for n odd; β* isomorphism range); §5.3–5.4 lines 462–480; Thm 5.5 lines 481–494 (hypothesis n−1>4d(2m+1); proof with n>4d(m+1)² odd) and proof lines 499–551 (regular representation, j+1 copies, Z_j); §6.1–6.2 lines 567–589; Remark 6.3 lines 590–594 (totally real, m odd, s_m=1, rationality); §6.4 lines 595–615. borel1980 lines 29–43 (replace |D| by D; fix an ordered basis and ordering of embeddings; delete i-powers). burgos2002 Remark 4.25 lines 1423–1431 (s(ch_p)(Hur ε)=±(2πi)^p; the sign is exactly what gap:integral-chern-calibration fixes); Cor 9.8 lines 3140–3150; Def 9.10 and Thm 9.12 lines 3222–3257 (R′ ∼ π^(−d_p)·leading coefficient); Lemma 9.18–Remark 9.20 lines 3546–3614 (index 1 in degree 8k+1, 2 in degree 8k+5; (9.4)–(9.5)); Prop 9.22–Cor 9.23 lines 3681–3709; Def 9.24 lines 3733–3745; Prop 9.26 lines 3865–3869 (2π_(p−1)∘Φ); (10.2)–(10.3) lines 3897–3904 (r−f cone); Examples 10.4–10.5 and Remark 10.6 lines 3973–4001; (10.10) line 4015; η lines 4024–4036; Defs 10.7–10.8 lines 4087–4106; Thm 10.9 line 4139–4140; proof lines 4172–4191 (Props 8.9, 8.10, 8.14); Lemma 10.10 and Prop 10.11 lines 4227–4241 (π_(p−1)∘Φ). poonen2017 Thm 1.5.36 lines 1396–1446 (period = index via Grunwald–Wang with local degree n at nonarchimedean and 2 at real places). deligne_goncharov2005 lines 429–440 (ψ^a acts by a^j).

**Adversarial table.** Values computed on each side; Lean refers to `Suggested.lean`.

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §1.3 / Lean `dedekindZeta_continuation_leadingTerm` | F=ℚ, n=2 | d=0, c=ζ(−1)=−1/12 | q·π^(0−2)·ζ(2)=q/6, q=−1/2 | holds, q≠0 |
| same | F=ℚ, n=3 | d=1, c=ζ′(−2)=−ζ(3)/(4π²) | q·π^(1−3)·ζ(3), q=−1/4 | holds |
| same | F=ℚ, n=4 | d=0, c=ζ(−3)=1/120 | q·π^(−4)·ζ(4)=q/90, q=3/4 | holds |
| same, general exponent | n odd: Γ_ℝ poles r₁, Γ_ℂ poles r₂; Λ(n) has π^(r₁/2) from Γ(n/2) | π-exponent −r₁(2n−1)/2−r₂(2n−1)+r₁/2 = r₁+r₂−Nn | d_n−Nn with d_n=r₁+r₂ | agree |
| same | n even: Γ_ℝ(1−n) finite ∝ π^(n/2); Γ_ℂ poles r₂ | π-exponent −r₁n−2r₂n+r₂ = r₂−Nn | d_n−Nn with d_n=r₂ | agree |
| same, order | n=1 (excluded) | order of ζ_F at 0 is r₁+r₂−1 | formula would give r₁+r₂ | hypothesis 2≤n needed and present |
| same, vacuity | Z = continuation with Z(1):=0 | hZ, hseries hold | conclusion independent of Z(1) | non-vacuous |
| §5.1 / Lean `exists_pos_rat_dedekindZeta_of_isTotallyReal` | F=ℚ(√5), n=2 | √5·ζ_F(2)/π⁴ with ζ_F(2)=2π⁴/(75√5) | 2/75 > 0 | holds |
| same | F=ℚ, n=2 and n=4 | ζ(2)/π², ζ(4)/π⁴ | 1/6, 1/90 | holds |
| same, negative control | F=ℚ(i), n=2 | ζ_F(2)=ζ(2)·L(2,χ₋₄)=π²G/6 (G Catalan) | not rational·π⁴ | `IsTotallyReal` hypothesis needed and present |
| same, negative control | F=ℚ, n=3 | ζ(3)/π³ | not known rational | `Even n` needed and present |
| §3.1 / Lean `period_eq_index` | A=F (trivial class) | orderOf 1 = 1 | index(F)=deg F=1 | holds |
| same | invariants (1/2 at 2, 1/2 at 3) over ℚ | period 2 | index 2, dim 4 | holds |
| same | invariants (1/3, −1/3) | period 3 | index 3, dim 9 | holds |
| §3.2 / Lean `exists_divisionAlgebra_split_at_infinity` | a=1 | D=F, finrank 1=1² | ℝ⊗F=M₁(ℝ) | holds; a=0 excluded (no division ring of dimension 0) |
| same | D=(−1,3)/ℚ | Hilbert symbols (−1,3)₂=−1, (−1,3)₃=−1, (−1,3)_∞=+1 | division, split at ℝ, dim 4 | holds (§3.4 Check) |
| same, ℂ-clause | Hamilton quaternions over ℚ | ℂ⊗D≅M₂(ℂ) | real clause fails | ℂ-clause vacuous → R03 |
| §1.1 d_n | ℚ, ℚ(i), ℚ(√5) at n=2,3 | 0,1 / 1,1 / 0,2 | r₂ and r₁+r₂ | agree with Layer 1 Examples |
| §1.1 divided coordinates | ℚ(i), n=2,3 | v(conj σ)=(−1)^(n−1)v(σ) | (t,−t), (t,t) | agree with Checks |
| Conventions δ_F | ℤ[i], basis (1,i), embeddings (id, conj) | det[[1,i],[1,−i]]=−2i | square −4 = disc, |δ|=2 | agree |
| §4.3 discriminant power | ℚ(i), n=2 | δ_F^(−3)=(−2i)^(−3)=−i/8 | |·|=1/8=4^(−3/2) | agree |
| §4.4 cycle dimension and factor | (N,j)=(1,1),(1,2),(2,1) | N(j²+2j)=3,8,6 | (j+1)^(jN)=2,9,4 | agree |
| §4.4 bound | j=1,N=1 | a odd > 4N(j+1)²=16 → a=17 | b=4, block I₁₃, det=Nrd² | agree |
| §4.5 ranks | K=SO_a^(r₁)×SU_a^(r₂), degree 2n−1 | Prim H^(2n−1)(K) = r₁[n even]+r₂ | N−d_n = r₂ (n odd), r₁+r₂ (n even) | agree |
| §4.5 range | N=1,n=3,a=23 / a=22 | 22>20 / SO₂₂ Euler primitive degree 21 | q=5 | agree |
| §2.3 range | ℚ q=5 a=22,21; ℚ(i) q=3 a=26,25 | 21>20, 20=20; 25>24, 24=24 | boundary excluded | agree |
| §3.5 local masses | q=2, a=2,3 | 6/8=3/4; 168/256=21/32 | 1−2^(−2); (3/4)(7/8) | agree |
| §3.5 form scaling | ω=2ω_std at v=2 | |2|₂·3/4=3/8 | correction 1/2 | agree |
| §3.6 unscaled gauge | ℚ(√5), a=2 | Δ^((a²−1)/2)=5^(3/2) | Check value | agree |
| §5.2 conversion | ℚ, n=3 / n=5 / imaginary quadratic | (2π)·2=4π / 2π / 2π | Burgos (9.4)–(9.5): factor 2^(r₁) iff n≡3 mod 4 | agree |
| §5.2 Cartan composite | SU→SU/SO→SU, g↦ggᵗ on π_(2n−1) | 1+(−1)^(n+1) | 2 for n odd (n=3,5) | agree with both Checks |
| §5.1 vs §5.4 exponents | ℚ, n=3 | cohomological ζ(3)/π³ | Tate-divided ζ(3)/π², ratio 4π=(2π)·2 | agree |
| §5.4 leading-term factor | ℚ, n=2 | R=1 vs ζ*(−1)=−1/12 | q=−12 | agree |
| §5.1 Check | ℚ(i), n=2,3 | Δ^((2n−1)/2)=8, 32 | /√Δ=2 → 4, 16 | agree |
| §6.0a / §6.1 projection | n=2: P₁(1), P₁(i); n=3: P₂(1), P₂(i) | 0, i; 1, 0 | kernel ℝ(n) | agree; n=0 junk P₀(1)=1 excluded by n>0 |
| §6.0a cone isomorphism | S(r,f,ω)=(r,f,−ω), d_B(r,f,ω)=(dr,df,r−f−dω) | S∘d_B=(dr,df,f−r+dω) | d_M∘S with d_M(r,f,ω)=(dr,df,f−r−dω) | chain map; S preserves r, so both lifts of ch_n^tw correspond |
| §6.2 sign | Bo=2Be_Burgos (Thm 10.9); shared κ_M∘S=−η_B at a point | r_Be^shared=−r_Be^Burgos | r_Bo=−2r_Be^shared; det ratio (−2)^(d_n) | consistent with PadicHodgeRegulators line 1044 and PeriodsAndSpecialValues line 29 |
| §6.0b CE dimensions | gl₁(ℂ) complex / real | 1,1,0 / 1,2,1 | abelian of dimension 1 / 2 | agree |
| §6.3 Adams | ℚ n=3 a=2; real quadratic n=3 a=2; ℚ n=2 | 8, det 8 / 64 / det 1 on 0 | a^(n d_n) | agree |
| §3.1 Check | ℚ(ζ₃₂)⁺ and fixed field of {1,15} | (ℤ/32)ˣ/{±1}≅ℤ/8; 15=31·17 so (ℤ/32)ˣ/{1,15}≅ℤ/8, 3 generates, −1∉{1,15} | totally ramified at 2 → local degree 8; Frob₃₁=−1 trivial on the real subfield | agree |
| Scope: degree-one regulator | Mathlib pin | `NumberTheory/NumberField/Units/Regulator.lean` exists | README claim | agree |
| Gaps | ten entries in plan.json | eight stated in README | two not stated, asked of a supplier that already supplies / declines them | R01 |

## Not verifiable

- borel1980 item 3: the extraction stops at the colon of "Supprimer les puissances de i dans les relations:" (line 43); the list naming §5.5(1),(4) and §6.2(5) is not in the text. Borel's own text at borel1977 lines 587–589 shows that the printed §6.2 argument carries powers of i, consistent with the README's reading, but the exact list is unverified.
- borel1977's displayed formulas (the measure of §1.6, the volume formula of Prop 2.4, Prop 4.3, Thm 5.5 (1)–(11), Thm 6.2 (1)–(5), §6.4) are absent from the OCR; each was recomputed independently above and the surrounding prose checked. The printed dimension of Z_j at line 518 reads "j²+2j" without the degree factor; whether the print has d(j²+2j) cannot be read from the extraction (the README's N(j²+2j) is the correct value).
- weil1961 (waived) and beilinson1985 (uncertified) are cited by locator only, as the manifest settles.
- The one-tactic probe could not be elaborated after the shared packages directory lost the pinned Mathlib object files (see Verified sound); padding was decided by reading.

## Source issues

- **Error** in borel1977 at §1.4 definition of R_q, p.616, and the formulas at pp.627–628 and §5.5(1),(4), §6.2(5): the source uses the absolute discriminant in the rational forms and carries extra powers of i in the relations; it should be the signed discriminant with a fixed ordered basis and ordering of embeddings, and those i-powers deleted; affects a stated result; corrected in print at borel1980 p.373, items 1–3.
