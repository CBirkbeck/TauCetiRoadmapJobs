# Review of RankZeroOneBSDPartII (pull request #1732 at 1e5cb6c)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/RankZeroOneBSDPartII/README.md` and `TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean`. The worker's gate passes every check (depcheck 0 problems, build OK, outside-folder diff empty). One P2 finding (a declared gap that asks a supplier for what that supplier already states as its own targets) and four P3 notes. The mathematics of the converse route, the admissible-family statistics and the two scope diagnostics checked out on every instance computed below.

## R01 (P2) — gap:rational-three-isogeny-count asks ArithmeticStatisticsPartIII for what it already states

**Location.** `TauCetiRoadmap/RankZeroOneBSDPartII/README.md` line 115 ("What ArithmeticStatisticsPartIII must provide (gap:rational-three-isogeny-count): Prove the seven conditions C(ℚ,ι,Σ) …"), line 415 (`*Needs:*` of §4.3), and `design/plan.json` `gaps[4]`.

**Claim.** The seven conditions `C(ℚ,ι,Σ)` are missing from the supplier and must be requested as a gap.

**Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md` at the head of its pull request, "Windowed cubic counting contract" (Supporting uniform estimates): items 1–7 are each stated as targets with a proof route ("To prove this target, …", with `**Needs:**` lines), for every number field `F`, every degree-three isogeny `φ` of abelian varieties and every nonempty family `Σ` defined by finitely many local conditions, in the unweighted squareclass height `H(s)=∏_{v(s) odd} Nv`. The contract header says `C(F,φ,Σ)` is the conjunction of exactly those items. The ℚ-instance for `ι`, its dual, every stratum and the signed-squarefree height (which is that `H` over ℚ) is therefore a specialisation of targets the supplier already owns; the gap is not minimal.

**Repair.** Replace line 115 by a plain supplier citation: "ArithmeticStatisticsPartIII, Windowed cubic counting contract, items 1–7, supplies `C(F,ι,Σ)` for every number field, degree-three isogeny and finite-local-condition family; it is applied here with `F=ℚ`, `ι` and its dual, and the strata `Σ∩T_m`." In §4.3's `*Needs:*` (line 415) and Layer 4's Dependencies (line 437) cite that contract instead of the gap slug, and drop the `rational-three-isogeny-count` entry from `design/plan.json`'s `gaps`. The supplier contract then reads as what Part VII's "Positive proportions of three selmer ranks in local subfamilies" already assumes, discharged by Part III's own targets, which is the state of the suppliers at their heads.

## R02 (P3) — Line locators do not match the cached extractions

**Location.** Every "CGLS line N", "BKLOS line N", "PS line N" locator (README lines 3, 153, 170, 197, 213, 242, 260, 278, 305, 321, 338, 377, 395, 413, 429, 467, 485, 501, 541–543).

**Claim.** The README says line locators count lines of the `pdftotext -layout` extraction of each linked PDF.

**Witness.** Against the worker's cached texts the cited lines land elsewhere: CGLS line 73 is a table-of-contents entry (§5.1.3), line 1745 is inside the proof of Theorem 3.2.1, line 1828 is in the proof of Theorem 3.4.1, line 1891 is equation (4.1), line 2027 is the definition of `H¹_{F_ac}` on p. 571; BKLOS line 149 is a page number, line 612 is the proof of Theorem 8.1, line 681 is a page marker; PS line 403 is Corollary 4. The theorem and printed-page locators are all correct (see Verified sound).

**Repair.** Replace the line locators by the cache's lines, or drop them and keep theorem and page: CGLS standing hypotheses lines 79–95 and 171–182; Theorem E line 219; Corollary 3.4.2 line 1847; Remark 4.1.3 with (4.4)–(4.5) lines 1934–1958; Corollary 4.2.3 line 2001; Theorem 5.2.1 line 2145; Corollary 5.2.2 line 2191; Corollary 5.2.3 line 2198; Remark 5.2.4 line 2206. BKLOS §2 family and height lines 78–84; absolute `T_m` line 157; Theorem 2.5 line 159; signed `T_m` line 643; §9.2 line 654; Proposition 10.1 line 674; Theorem 10.5 line 713; Proposition 10.7 line 764; §11 line 798. PS §1 line 59 (correct as cited); §2 line 126; Theorem 5 line 425; Corollaries 6–7 lines 456 and 461; Theorem 8 line 474; Corollary 9 line 510. Then make the References paragraph's description of the line convention match.

## R03 (P3) — CMRankZeroConverse is cited by a section label it does not use

**Location.** README line 7 ("CMRankZeroConverse §§C.0–C.6"), line 119 (section heading text "Section C.0 “Rank-r p-converse”"), line 307 (`*Needs:*` "CMRankZeroConverse §C.0 “Rank-r p-converse”"), line 348.

**Claim.** The shared rank-r p-converse proposition is CMRankZeroConverse §C.0.

**Witness.** `TauCetiRoadmap/CMRankZeroConverse/README.md` at the head of its pull request: the proposition is "### 0.1 The rank-r p-converse proposition" (Layer 0), and its layers are numbered 0–6; no section carries a "C." label. Its statement ("corank Sel_(pInfinity)(A/Q) = r implies analyticRank(A) = r") is the one this roadmap consumes.

**Repair.** Cite "CMRankZeroConverse §0.1 'The rank-r p-converse proposition'" at lines 119, 307 and 348, and "CMRankZeroConverse Layers 0–6" at line 7.

## R04 (P3) — §5.3 defines its model and states its local-form target after the section's `*Needs:*` line

**Location.** README lines 489–517: the theorem paragraph and its `*Needs:*` (line 503), then "Define the obstruction model W …" (line 505) with API and Checks, then "Prove the obstruction in its local form …" (line 517) with no `*Needs:*` of its own.

**Claim.** One subsection, one target.

**Witness.** The house shape puts a definition with its API and Checks before the theorems that use it, and every target carries its own `*Needs:*`; here the local-form target's inputs (`WeierstrassCurve.minimal`, `WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.quadraticTwistOf`, EllipticCurves Layer 5) are only listed for the preceding global statement.

**Repair.** Move the "Define the obstruction model W" block (definition, API, Checks) to the start of §5.3, state the global obstruction, then the local-form statement with its own `*Needs:*` line naming the three pinned declarations and EllipticCurves Layers 4–5.

## R05 (P3) — gap:complementary-heegner-twists overlaps an existing ArithmeticStatisticsPartVI construction

**Location.** README line 107 and line 199.

**Claim.** Both complementary twist branches are missing from the supplier.

**Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md` at its head, "Heegner logarithm and low rank": "The rank-one criterion over Q uses an auxiliary quadratic twist with nonzero central value and prescribed splitting, supplied by the quadratic-twist nonvanishing theorem [123], Theorem B …; prove that specialized auxiliary-twist existence here as part of the deduction." The value branch with prescribed splitting is already a target there; what is new is the derivative branch (twist order one when `w(E)=+1`) and the infinitude of odd fundamental `D<−4`.

**Repair.** Keep the gap (its derivative half is genuinely absent) but say in the sentence at line 107 that the value branch extends that target's auxiliary-twist construction, so the intake's announcement asks only for the derivative branch and the infinitude.

## Verified sound

**Gate and direction.** The worker's gate at 1e5cb6c: every check passes (set_option 0, latex 0, prnum 0, sorry-data 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, build 0). `git diff --stat origin/main...HEAD` outside the folder: empty. Dependency check re-run with `--movable`:

```text
depcheck: 204 roadmaps, 1626 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: RankZeroOneBSDPartII at position 353, after SelmerIwasawaCohomology (50), EulerSystemsAndKolyvaginSystems (89), ArithmeticStatisticsPartI/III/VI/VII (94/98/128/129), EllipticCurveModularity (153), EffectiveClassNumbers (232), GrossZagierAndArithmeticHeights (318), ModularIwasawaMainConjectures (348), HeegnerPointEulerSystems (349), RankOneConverse (350), CMRankZeroConverse (352). `lake env lean` on `Suggested.lean` elaborates with no output (2 s).

**Principles.** No route-specific shortcut (the admissible family is defined for every rational 3-isogeny and the good-at-3-twist hypothesis is stated, not hidden), no re-planned roadmap (Selmer theory, pairing, Heegner families, Gross–Zagier, statistics are all imported by section), no copied passage, no algorithm, no sorry'd data, no `set_option`, no process words or pull-request numbers in the README (grep for deferred/optional/removed/so far/checkpoint/handoff/packet/round/PR: none).

**Sources (seeded sample).** All three texts are in the cache and were read at the printed pages. CGLS (cache pages = printed −516): standing hypotheses pp. 518–521 (Eisenstein prime = odd good prime with `E[p]` reducible; `E[p]^ss=F_p(φ)⊕F_p(ψ)`, `ψ=ωφ⁻¹`; (Heeg), (spl), (disc), (Sel)); Theorem E p. 522 (`φ|G_p≠1,ω`, `r∈{0,1}`, corank `r` ⇒ `ord_{s=1}L=r`, rank `r`, Sha finite); Corollary 3.4.2 p. 566 (corank one ⇒ `ord_{P₀}char(X_tors)=0`); Theorem 4.1.2 p. 568 (`X∼Λ⊕M⊕M`, divisibility in `Λ[1/p,1/(γ−1)]`, in `Λ[1/p]` under corank one); Remark 4.1.3 pp. 568–569, (4.4) `P[1]_α=u_K⁻¹(1−α⁻¹σ_p)(1−α⁻¹σ_p*)P[1]` at split `p`, (4.5) `pr_K(κ₁^{Hg})=u_Kα²(β−1)²κ₀`, `β=pα⁻¹`; Corollary 4.2.3 p. 570 (equality `char(X_tors)=char(S/Λκ∞)²` in `Λ_ac` under (Heeg),(spl),(disc),(Sel) and the local exclusion); Theorem 5.1.2 p. 572 (Gross–Zagier with `u_K⁻²c_E⁻²|D_K|^{−1/2}‖ω_E‖²ĥ(P_K)`, `P_K=Σ_σπ(x₁)^σ`); Theorem 5.2.1 p. 574 and its proof pp. 574–575 (conditions (a)–(d), (d′), root number `w(E/K)=−1`, `[18, Thm B.1/B.2]`); Corollary 5.2.2 p. 575 (`E(ℚ)[p]=0` ⇒ `Sel_{p∞}[p]=Sel_p`); Corollary 5.2.3 and Remark 5.2.4 p. 575 (19a3, 41.6 % and 25 %). BKLOS (author version): §2 pp. 2–4 (local conditions, Haar mass on finite local squareclasses, `H(s)`, absolute `T_m`, Theorem 2.5 (a) `½µ(T₀)` rank 0, (b) `5/6 µ(T₁)` 3-Selmer rank 1, Theorem 2.6, 19a3 remark p. 4); §9.1–9.2 p. 14 (signed `T_m`, parity `dim Sel₃≡m`, the 1/2 and 5/6 arguments); Proposition 10.1 p. 14; Theorem 10.5 with Tables 1–2 pp. 15–16 (ordinary: `c(E′)/c(E)=1`, `α=1` or `3^d` by kernel outside or inside the formal group); Proposition 10.7 p. 17 (`p≠3` ⇒ some twist has `c=1`, including `p=2`); §11 p. 18. PS (author version): §1 p. 2 (Cassels: pairing on `Ш(E)` nondegenerate modulo the maximal divisible subgroup and alternating), Theorem 5 and Corollaries 6–7 pp. 10–11, Theorem 8 and Corollary 9 pp. 11–12 (finite `Ш_nd`: `T×T` or `ℤ/2×T×T`). Each sampled target's statement is supported by its source at the stated hypotheses; the two scope diagnostics (§§5.2–5.3) are the README's own computations, recomputed below.

**Pinned declarations opened** (Mathlib and Tau Ceti at the manifest pins). Mathlib: `WeierstrassCurve.minimal` (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` line 299), class `HasGoodReduction` extending `IsMinimal R W` with `valuation K (maximalIdeal R) W.Δ = 1` (line 323), `hasGoodReduction_iff_isElliptic_reduction` (line 328, needs `[IsMinimal R W]`), `NumberField.finite_setOfPred_logHeight₁_le` (`Mathlib/NumberTheory/Height/NumberField.lean` line 431), `WeierstrassCurve.Affine.finite_naiveHeight_le` (`Mathlib/NumberTheory/Height/EllipticCurve.lean` line 116, under `[Northcott (logHeight₁ (K := F))]`), `le_liminf_mul` (`Mathlib/Topology/Algebra/Order/LiminfLimsup.lean` line 133: `[f.NeBot]`, `0 ≤ᶠ u`, `u` bounded under `≤`, `0 ≤ᶠ v`, `v` cobounded under `≥`; the README states exactly these), `WeierstrassCurve.LSeries` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` line 84), `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` line 71, for `A : TopRep ℤ (absoluteGaloisGroup K)`). Tau Ceti: `TauCeti.Isogeny` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` line 139), `WeierstrassCurve.quadraticTwistOf` (line 169 of `QuadraticTwist/Basic.lean`; `a₃ := (t²−4n)·t·a₃`), `Δ_quadraticTwistOf` (line 239: `(t²−4n)⁶·Δ`), `isElliptic_quadraticTwistOf_iff` (line 299), `j_quadraticTwistOf` (line 306), `WeierstrassCurve.Affine.Point.canonicalHeight_nonneg` and `…_eq_zero_iff_isOfFinAddOrder` (`CanonicalHeight/Basic.lean` lines 260, 332, under `[W.toAffine.IsElliptic]`), `WeierstrassCurve.Affine.fg_point_of_numberField` (`MordellWeil/FinitelyGenerated.lean` line 121), `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`Approximation/Weak.lean` line 204, finsets of finite and infinite places), `HeckeRing.GL2.Newform.analyticRank`, `analyticOrderAt_L_ne_top`, `analyticRank_eq_zero_iff` (`Newforms/AnalyticInvariants.lean` lines 80, 72, 107). Selmer carriers at the Tau Ceti pin: only the explicit 2-descent `WeierstrassCurve.Affine.selmerGroup₂` and `selmerGroupA` (`MordellWeil/SelmerGroup.lean` line 104, `SelmerGroupA.lean` line 129); no odd-`p` or `p^∞` Selmer group, no elliptic Sha on `E(K̄)`.

**Headline theorems and Suggested.lean.** Headlines: §3.1 (p∞ converse), §3.2 (rank and full Sha), §3.3 (finite-Selmer converse), §4.4 (positive proportions). None is statable at the pins: each needs `Sel_{p∞}` or `Sel_3` of a rational elliptic curve (absent, see above) or finiteness of `Ш(E/ℚ)` as a group of the elliptic Galois module (Mathlib's kernel takes a `TopRep`, and no Galois module `E(ℚ̄)` exists at the pin), and the analytic rank of `E` needs the modular identification the docstring names. The docstring says so, per theorem and per missing carrier. Nothing is stated, so there is no padding to probe and no `#check` comparison to make; `lake env lean` elaborates the file cleanly. The §5.3 local obstruction would be statable (`minimal`, `HasGoodReduction`, `quadraticTwistOf` over `ℚ_[3]`) but is a single-curve diagnostic, correctly kept out of the Lean.

**Cross-roadmap citations resolved** (each at its head or on main): SelmerIwasawaCohomology §§2.6, 2.9–2.12a, 3.9–3.11, 4.26, 4.28, 4.29 (the last contains "The elliptic specialization and alternation": alternating pairing on `Ш(E/K)`, kernels the maximal divisible subgroups, reduced ℓ-primary part `T×T`; and the general radical theorem); EulerSystemsAndKolyvaginSystems §8.31 (CGLS Theorem 3.4.1, Corollary 3.4.2, and the named "Augmentation control" in the elliptic instance `p∤2N`, `(D_K,Np)=1`, split level and `p`, `E(K)[p]=0`, with its corank-one Check); HeegnerPointEulerSystems §§8.5, 8.6, 8.6a, 8.13 (`pr_K(κ₁^{Hg})=u_Kα_p²(β_p−1)²κ₀`), 8.24, 8.31, 8.32, 8.34 (`X∼Λ⊕M⊕M`, divisibility in `Λ[1/p]` including `(γ−1)`), 8b.2, 8b.10 (Eisenstein equality interface; it adds no (Sel) hypothesis, stronger than what §2.3 uses); GrossZagierAndArithmeticHeights §§0.1 (`h_x=2h_(O)`, `B_x(P,P)=h_x(P)`), 8.14, 8.15, 8.17 (squarefree `N`, correctly not used), 8.18 (the `F=ℚ, A=E, B=M₂(ℚ)` criterion), 8.19 (`2^{−μ(N,D)}‖ω₀‖²ĥ_K/(C²u²√|Dc²|)`, `f(∞)=O`); EffectiveClassNumbers §2.8 "Gross–Zagier with exact constants" (coefficient `‖ω_E‖²/(C²u²√|D|)`, odd `D` prime to `N`, all level primes split); ModularIwasawaMainConjectures §6.1; ArithmeticStatisticsPartI §0.1 (relative density, `r_X(S|T)` with `0/0=0`, tower theorem assuming both limits), §0.2 (family defined by local conditions), §0.5 (quadratic twist squareclass family), §0.6 (squarefree integers in residue classes), §0.15 (positive squareclass denominator); ArithmeticStatisticsPartVI "Heegner logarithm and low rank" (analytic rank 0 or 1 ⇒ rank and finite Sha for every `E/ℚ` with modular comparison data) and "Elliptic p-parity"; ArithmeticStatisticsPartVII §5.10 ("Selmer ratio of an isogeny" with signed `T_m`, "Local selmer ratio via tamagawa numbers", "Selmer ratio classes are locally defined", "Three isogeny selmer parity" with the `dim E(F)[3]` correction, "Positive proportions of three selmer ranks in local subfamilies") and §5.32 "Attainable local three-isogeny ratios"; ArithmeticStatisticsPartIII "Windowed cubic counting contract" (R01); EllipticCurveModularity Layers R29.3–R29.6 (R29.6 has no quadratic base-change factorisation, so that gap is minimal); ModularForms Layer 7; EllipticCurves Layers 1, 2, 4, 5, 7 on main; PadicMeasuresIwasawaAlgebras Layer 4 on main; GlobalNumberFields Layer 1 (Completed); CMRankZeroConverse §0.1 (R03). RankOneConverse exists as a board design package (PC.0–PC.6 as cited); its PC.4/PC.6 auxiliary fields are Skinner's (squarefree level, `p≥5`, irreducible residual, a residually ramified prime kept nonsplit), a different object from §1.1's all-split CGLS field. No other open pull request owns the Eisenstein converse (`roadmaps grep` for the CGLS converse: only ArithmeticStatisticsPartVII cites Corollary 5.2.3, as a source for its 3-Selmer proportions).

**Declared gaps.** All five have a named supplier and the same slug in `design/plan.json` and the README. `eisenstein-local-dictionary`, `quadratic-analytic-factorization`, `cgls-ordinary-control`: precise, with hypotheses, and absent from the supplier at its head. `complementary-heegner-twists`: precise; partial overlap noted in R05. `rational-three-isogeny-count`: R01.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Conventions, exclusion at `p=3` | `F₃ˣ={±1}`; `φ|G₃∈{η, ωη}`; alternatives `1, ω`; rational 3-torsion kernel | `η(Frob)=−1`, `η|I=1`; `(ωη)|I=ω|I` nontrivial; product `ω`; `φ=1` rejected | symmetric under `φ↔ψ=ωφ⁻¹` since `ψ=1⇔φ=ω` | none |
| Conventions, contragredient | `Λ=ℤ₃⟦T⟧`, `γ↦γ⁻¹` | `γ⁻¹−1 = 1/(1+T)−1 = −T/(1+T)`, order 1 at `T=0`; `3` unit in `Λ[1/3]`, `T` not | as stated | none |
| Conventions, heights | `h_(O)(P)=1, h_(O)(2P)=4` | `h_x=2,8`; `B_x(P,P)=(8−2−2)/2=2=h_x(P)`; half polar form of `h_(O)` gives 1 | as stated, agrees with GZAH §0.1 | none |
| Conventions, local masses at 3 | signed squarefree `d` | `P(3∤d)=(2/3)/(8/9)=3/4`; classes 1,2: `3/8` each; classes 3,6: `1/8` each; sum 1 | as stated | none |
| §0.1 bundle | `p=2`; multiplicative `p`; `φ=1`; dual isogeny | rejected, rejected, rejected; `ψ=ωφ⁻¹∉{1,ω}⇔φ∉{ω,1}` | hypotheses match CGLS Theorem E | none |
| §0.2 `dim Sel_p = corank + 2s` | `(c,s)=(0,0),(1,0),(1,1)`; `ℤ/p²` | dims `0,1,3`; `ℤ/9` admits only the zero alternating pairing | `r∈{0,1}` forces `s=0`; `Sel_p=Sel_{p∞}[p]` needs `E(ℚ)[p]=0`, supplied by the local exclusion | none |
| §1.1 sign bookkeeping | `r=1`: `w(E)=−1`; `r=0`: `w(E)=+1`; all level primes split | `w(E/K)=w(E)w(E^K)=−1` ⇒ `w(E^K)=+1` resp. `−1`; value resp. derivative branch | matches CGLS (d), (d′) | none |
| §1.1 discriminant conditions | 2 split; infinitude | `D≡1 (8)` ⇒ odd; excludes `−3,−4` | `u_K=1` available | none |
| §1.2 corank sum | `r=0,1` | `0+1=1`, `1+0=1`; `K_v=ℚ_p` ⇒ `E(K)[p]⊂E(ℚ_p)[p]=0` | (Sel) and `E(K)[p]=0` hold | none |
| §2.1 torsion length | `R=Λ_{P₀}`: `X=R`; `X=R⊕R/P₀` | coinvariant dims `1`, `2`; torsion lengths `0`, `1`; `Tor₁^R(k,k)=k` | corank one excludes the second; finite modules vanish after inverting `p` | none |
| §2.2 bottom factor | split `p`, full trace over `Gal(K[1]/K)` | `Tr((1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1])/u_K = (1−α⁻¹)²P_K`; `u_K=1` for `D<−4` | agrees with CGLS (4.4) | none |
| §2.2 units | 19a3 admissible twist, `a₃=2`: `X²−2X+3` mod 9 | `α=5`: `25−10+3=18≡0`; `β=6`: `5·6=30≡3`; `α⁻¹≡2`, `(1−α⁻¹)²≡1`; `α²(β−1)²=625≡4` | both units; `a_p≢1 (p)` from `μ≠1` | none |
| §2.3 equality at `P₀` | `S=R=ℚ₃⟦T⟧`, `κ=T` | tower class nonzero, bottom `0`, `char(S/Rκ)²=(T²)` | shows why `ord_{P₀}char(X_tors)=0` is needed | none |
| §2.3 Check `N=20, D=−71` | residues | `−71≡1 (8)`, `≡4=2² (5)`, `≡1 (3)`; `(20,71)=1`; `μ(N,D)=0`; `20` not squarefree | coefficient `‖ω_E‖²/(C²√71)` = ECN §2.8's; §8.17 inapplicable | none |
| §3.1 subtraction | `r=0,1` | `1−1=0`, `1−0=1` | analytic rank `r` | none |
| §4.1 admissible classes | good ordinary, `φ|G₃=1`; `φ|G₃=η` | classes `1,2,3,6`: only `2` resp. only `1` admissible; `3,6` additive | exactly one unit class each time (also for `ω`, `ωη`) | none |
| §4.1 negative control | `v₃(j)<0` | `A₃=∅` for every twist | matches §5.3 | none |
| §4.2 strata | `c₃∈{1,3}` fixed by the admissible class; `c_∞∈{1,1/3}` by sign; bad `ℓ≠3` and `2` set to 1 | global ratios `{1,1/3}` or `{3,1}` | `T₀` and one of `T_{±1}` both inhabited | none |
| §4.2 Check `d=−31`, `d=137` | residues | `−31≡2 (3)`, `≡1 (8)`, `≡7≡8² (19)`; `137≡2 (3)`, `≡1 (8)`, `≡4=2² (19)` | both prescriptions realised | none |
| §4.3 lower bounds | even variable with mean ≤1; odd stratum `q+3(1−q)≤4/3` | `P(0)≥1/2`; `q≥5/6` | matches BKLOS §9.2 | none |
| §4.3 product of lower limits | `μ(Σ₀)=1/8`, `μ(Σ₁)=1/4`; `r_X` alternating `1/2, 1` | `(1/2)(1/8)=1/16`, `(5/6)(1/4)=5/24`; no limit for `B₀` in `Σ₀` | `le_liminf_mul` hypotheses hold (`u,v∈[0,1]`, `atTop` NeBot) | none |
| §5.1 invariants of `(0,1,1,1,0)` | `b₂=4,b₄=2,b₆=1,b₈=0` | `Δ=−64−27+72=−19`; `c₄=16−48=−32`; `c₆=−64+288−216=8`; `j=32768/19` | as stated | none |
| §5.1 reduction mod 3 | `x=0,1,2` | `y²+y=0,0,2`: 2,2,1 solutions; 5 affine, 6 total; `a₃=4−6=−2` | ordinary; `a₃≡1 (3)` consistent with `φ|G₃=1` | none |
| §5.1 tangent at `(0,0)` | partials | `F_x=−1, F_y=1`; tangent `y=x`; residual `x³` | flex, order 3 | none |
| §5.1 native twist | `t=0,n=−2` | `t²−4n=8`; `Δ=8⁶·(−19)`; squareclass `2` | as stated | none |
| §5.2 density | `d≡2 (3)` | `3/8=37.5 % < 41.6 %=5/12` | conversion ceiling holds | none |
| §5.3 invariants of `(1,0,3,0,0)` | `b₂=1,b₄=3,b₆=9,b₈=0` | `Δ=−216−2187+243=−2160=−2⁴3³5`; `c₄=1−72=−71`; `c₆=−1+108−1944=−1837`; `j=357911/2160`; `v₃(j)=0−3=−3` | multiplicative at 3, persists under every quadratic twist | none |
| §5.3 tangent and twists | `(0,0)`; `d=0,1,3` | `F_x=0, F_y=3` ⇒ `y=0`, residual `x³`; `d=0` singular; `v₃(Δ)=3, 9`; `v₃(j)=−3` both | `A₃(W,ι)=∅` | none |

**Degenerate instances also tried.** `r=2` with `(c,s)=(0,1)`: `dim Sel_p=2`, corank 0, so §0.2 correctly stops at `r≤1`. `D=−3`: `u_K=3`, excluded by `D<−4`. `p∣h_K`: allowed; §2.2 divides by nothing. Empty stratum: §4.3 asserts nothing (denominator convention `0/0=0`). Curve with no good twist at 3 (§5.3): §§4.2–4.4 vacuous, as the explicit hypothesis intends.

## Not verifiable

- none. All three cited texts are in the cache and readable; every supplier roadmap was read at its open head, on main, or (RankOneConverse) in its board design package.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3, proof, printed p. 575: the source says the local condition on the kernel character can be arranged by a quadratic twist, so Corollary 5.2.2 applies; it should be that Corollary 5.2.2 also needs good reduction at 3, which no quadratic twist of `y²+xy+3y=x³` (`v₃(j)=−3`, rational 3-isogeny) has; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed p. 575: the source says Corollary 5.2.2 with BKLOS gives at least 41.6 % of twists of 19a3 with analytic and algebraic rank one; it should be that only the twists with `d≡2 (mod 3)`, of density 3/8 < 5/12, satisfy the local hypothesis `φ|G₃≠1,ω` of Corollary 5.2.2; affects a stated result.
