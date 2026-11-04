# Review of RankZeroOneBSDPartII (pull request #1732 at c42ad8a)

**Verdict:** needs changes

## R01 (P2) — Remove the redundant counting gap from the package plan

**Location.** `packages/RankZeroOneBSDPartII/design/plan.json:1282`, `gaps[4]`, still contains `"slug": "rational-three-isogeny-count"`. Compare the repaired supplier contract at `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:113` and its uses at lines 413 and 437.

**Claim.** The plan still requests all seven rational three-isogeny counting conditions as missing supplier work. The README now correctly imports those conditions, but the declaration read by intake still makes the redundant request identified by the previous R01.

**Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:2148` defines C by items 1–7 and makes them supplier targets. Its rational chart at line 2202 has signed window (−1,1), and line 2236 supplies local masses. The plan retains the same request.

**Exact repair.** Delete only the `rational-three-isogeny-count` object from the plan's top-level `gaps` array. Keep the repaired README's direct Part III citation. Do not replace it with another gap or change any roadmap targets. This is package-plan reconciliation, not a request to edit another folder in the pull request.

**Repair checked on the original instance.** Set F=ℚ and use either the given isogeny or its dual on each nonempty finite-local stratum. The supplier height gives H(−31)=31 and H(137)=137, exactly the README's signed-squarefree ordering; its unit-class masses at 3 are 3/8 each. Thus the same existing contract covers the requested instance after deleting the redundant entry. Four genuinely additional supplier contracts remain.

## Previous findings

- R01 — partly repaired: README lines 113, 413 and 437 now import Part III's seven targets. `packages/RankZeroOneBSDPartII/design/plan.json:1282` still declares the redundant gap; this report's R01 records the remaining repair.
- R02 — repaired: README lines 151–562 now use the cached CGLS, BKLOS and PS line numbers. The references explain page-marker lines; the changed theorem, page and line locators resolve.
- R03 — repaired: README lines 7, 117, 293, 305 and 346 use CMRankZeroConverse Layers 0–6 and §0.1, matching its actual headings and shared proposition.
- R04 — repaired: README lines 489–507 put the model, API and three Checks first; lines 509–521 state the global obstruction; lines 523–536 give the local theorem, proof route, Checks and its own dependencies.
- R05 — repaired: README line 107 distinguishes the existing value-branch construction from the additional derivative branch and infinitude. ArithmeticStatisticsPartVI's supporting target at line 2416 confirms that distinction.

## Verified sound

This is an independent AI incremental re-review of 121 changed lines since 1e5cb6c. The changed README passages, their source locators, cited suppliers and dependent conclusions were checked. Unchanged mathematical tests are explicitly carried from the previous report below. The Lean file and dependency pins are unchanged. No pull-request file was edited.

**Gate, elaboration and direction.** The worker's supplied gate includes `build=0 OK`. I reran the gate: every text, import, metadata, dependency, stray-file, clean-tree and outside-folder check passed. I separately ran the permitted targeted build, which returned `Build completed successfully (8954 jobs).` Direct `lake env lean` on `Suggested.lean` exited successfully with no output or warnings. The outside-folder diff is empty. The dependency check with `--movable` returned:

```text
depcheck: 204 roadmaps, 1631 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Every `*Needs:*` line was read; the repaired citations preserve supply direction. No new algorithm, copied source passage, substitute carrier, sorry'd data, override, route-specific foundational restriction or duplicated construction was introduced.

**Source sample: 15 targets.** All three manifest texts were read in their legal cached author copies, using the numbered extraction, with printed-page markers checked. No new source fetch was needed. Every changed line locator, including those outside the seeded sample, was checked. The source support is as follows; scope diagnostics are calculations correcting the applicability of the source's proof, not claims that the source states those diagnostics.

| Sampled target | Locator checked | What the source supports |
|---|---|---|
| §0.2 small finite Selmer dimension | CGLS lines 2188–2193, Corollary 5.2.2, p. 575; PS lines 59–67, 425–427, 456–462, 510–515, pp. 2, 10–12 | The coefficient comparison needs vanishing rational p-torsion. Alternation modulo divisible kernels supplies a paired finite part; full Sha finiteness is not an input. |
| §1.1 auxiliary fields | CGLS lines 2151–2161 and 2173–2187, Theorem 5.2.1 proof, pp. 574–575 | Odd D<−4, split level and p, and the two complementary nonvanishing branches, with infinitely many fields. The amended gap distinguishes the existing value-branch supplier target. |
| §1.2 corank one over K | CGLS lines 2162–2165 and 2181–2184, pp. 574–575 | Forward low-rank results on the auxiliary twist and the quadratic corank sum give one in both cases. |
| §2.1 augmentation control | CGLS lines 1767–1782 and 1847–1853, Corollary 3.4.2, p. 566; lines 2166–2168, p. 574 | Ordinary self-dual modules and the corank-one torsion-order conclusion. The stronger compact kernel identification remains an explicit Selmer supplier gap, not an assertion that the source supplies a surjection. |
| §2.2 bottom Heegner class | CGLS lines 1934–1958, Remark 4.1.3, equations (4.4)–(4.5), pp. 568–569 | Split stabilization, the full trace, and the separate Howard comparison factor. Neither formula divides by the class number. |
| §2.3 non-torsion | CGLS lines 2001–2007, Corollary 4.2.3, p. 570; lines 2166–2172, p. 574 | Rank-one characteristic equality under (Heeg), (spl), (disc), (Sel) and the two-character exclusion; augmentation and Gross–Zagier yield the stated implication. |
| §3.1 p-converse | CGLS lines 79–95, 171–182 and 2145–2187, Theorem 5.2.1, pp. 574–575 | Odd good Eisenstein prime, local exclusion, r=0 or 1. No residual irreducibility or squarefree-conductor hypothesis. |
| §3.3 finite-Selmer converse | CGLS lines 2188–2193, Corollary 5.2.2, p. 575 | The two finite-Selmer cases and rank/Sha conclusions with the same hypotheses. |
| §4.1 admissible family | BKLOS lines 78–84, §2, pp. 2–3; CGLS lines 2198–2205, p. 575 | Finite local conditions and squareclass height. The README expressly retains the good-reduction condition omitted in the source's twist-arranging argument. |
| §4.2 positive ratio strata | BKLOS lines 674–679, 713–733, 764–766 and 798–811, Proposition 10.1, Theorem 10.5, Proposition 10.7 and §11, pp. 14–18 | Real ratios 1 and 1/3; good ordinary ratio 1 or 3 at three; an attainable ratio 1 at every finite prime other than three, including two. |
| §4.3 prescribed-family bounds | BKLOS lines 157–161 and 642–661, Theorem 2.5 and §9, pp. 4, 14; CGLS lines 2191–2193 | Absolute versus signed ratio convention, bounds 1/2 and 5/6, and conversion only on admissible twists. Part III and Part VII supply the restricted-family counting interfaces. |
| §4.4 positive proportions | BKLOS lines 166–173 and 798–811, Theorem 2.6 and §11, pp. 4–5, 18; CGLS lines 2198–2205 | The local-ratio construction and low-Selmer proportions. The README's good-at-three-twist hypothesis repairs the proof's applicability; it does not claim the unrestricted source conclusion is false. |
| §5.1 nineteen-a3 model | CGLS lines 2206–2215, Remark 5.2.4, p. 575; BKLOS lines 180–186, p. 4 | The displayed equation and curve label agree. Its coefficients, invariants and point count are checked below. |
| §5.2 actual local family | Same CGLS locator; BKLOS lines 180–186 and 654–661, pp. 4, 14 | The numerical statement in the source is accurately identified. The 3/8 conversion-set computation distinguishes a method limitation from a claim about the full rank-one set. |
| §5.3 no good-at-three twist | CGLS lines 79–89 and 2198–2205, pp. 518–519, 575; pinned twist/minimal-model APIs below | The source requires good reduction. The explicit rational flex and negative j-valuation provide the obstruction. The new local proof works for all nonzero d∈ℚ₃. |

Also checked: CGLS Theorem E at lines 219–223, p. 522; its discriminant convention at line 133 and (Sel) at line 179; BKLOS's signed T_m at lines 643–644; PS §2 at line 126, Theorem 8 at line 474 and corrected reduced-group conclusion at line 515. The reference versions agree with the theorem numbering used here. There are no explicitly unverified locators in the changed text.

**Pinned APIs opened.** The following are actual declarations at the unchanged manifest pins, not names inferred from newer documentation. Paths are relative to each pinned library.

| Declaration or object | Pinned location | Relevant hypothesis or behavior |
|---|---|---|
| `WeierstrassCurve.minimal` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299` | Obtained by a variable change; the following instance supplies minimality. The result is a curve over the fraction field, with an integral minimal model. |
| `WeierstrassCurve.HasGoodReduction` | Same file, line 323 | Extends `IsMinimal`; discriminant has multiplicative valuation 1, hence additive valuation 0. Minimality supplies integrality (line 280). |
| `WeierstrassCurve.variableChange_j` | `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:246` | The elliptic j-invariant is unchanged by the minimalizing variable change; this is the new dependency in §5.3. |
| `WeierstrassCurve.quadraticTwistOf` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | Real coefficient body. Trace 0 and norm −d give discriminant parameter 4d, not d. |
| `c₄_quadraticTwistOf`, `Δ_quadraticTwistOf` | Same file, lines 229 and 239 | Scale c₄ and Δ by (4d)² and (4d)⁶; the quotient c₄³/Δ stays fixed. |
| `isElliptic_quadraticTwistOf_iff`, `j_quadraticTwistOf` | Same file, lines 299 and 306 | Ellipticity requires a unit discriminant parameter and an elliptic starting curve. Over ℚ₃, d≠0 suffices; d=0 is excluded. |
| `le_liminf_mul` | `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` | Requires a nontrivial filter, eventual nonnegativity, boundedness of one factor and the specified coboundedness of the other. Ratios in [0,1] satisfy these. |
| `WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84` | Literal arithmetic series; does not by itself identify an entire elliptic continuation. |
| `ContinuousCohomology.tateShafarevich` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` | Localization kernel for a supplied `TopRep ℤ` and local fields; this does not furnish the classical elliptic Galois module and Kummer comparisons. |
| `WeierstrassCurve.Affine.selmerGroup₂`, `selmerGroupA` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`, `SelmerGroupA.lean:129` | Explicit 2-descent groups; they cannot substitute for odd-primary elliptic Selmer groups. |
| `HeckeRing.GL2.Newform.analyticRank`, `analyticOrderAt_L_ne_top`, `analyticRank_eq_zero_iff` | `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:80`, lines 72 and 107 | A newform analytic-rank API exists; its elliptic modular comparison is a separate required interface. |

**Headlines and Lean form.** The four end theorems are §3.1 (p∞ converse), §3.2 (arithmetic rank and full Sha), §3.3 (finite-Selmer converse), and §4.4 (positive low-rank proportions). The module docstring also names the eight intermediate deep targets in §§0.2, 1.1–1.2, 2.1–2.3 and 4.2–4.3 and states their missing interfaces. The odd-primary Selmer, arithmetic anticyclotomic and normalized Heegner carriers remain absent at these pins. The new local obstruction is a single-curve diagnostic, correctly retained in the README. `Suggested.lean` contains zero declarations, so there are zero sorried targets to one-tactic-probe and zero signatures to compare with `#check @name`; no binder can have disappeared. Its single import, namespace and docstring elaborate without a stand-in.

**Suppliers and ownership.** The changed counting contract was opened in full through `roadmaps show`; object searches used `roadmaps grep` over main and the indexed open heads, followed by a board-package README search. The existing owner is Part III, not a new construction here. The local obstruction uses the pinned general twist and variable-change APIs; the explicit W specialization has no competing owner in those searches. Generic local reduction remains EllipticCurves' work. No Lean name is introduced, so no fully qualified declaration collision is possible.

The following supplier sections were reopened to resolve the citations used by the changed passages and their dependencies. Each file below is `TauCetiRoadmap/<name>/README.md` at its open head, except the explicitly noted main/board cases. The entries record section and target checks, not a fresh review of those suppliers' proofs.

| Supplier | Resolved locations and interface |
|---|---|
| ArithmeticStatisticsPartIII | Lines 2148–2257, Supporting uniform estimates, Windowed cubic counting contract, items 1–7: representation, weighted-to-unweighted assembly, height, local masses, main term and tails. The rational specializations are already targets; R01 concerns the redundant plan request. |
| ArithmeticStatisticsPartVI | Lines 2412–2418, Heegner logarithm and low rank: the existing auxiliary nonzero-value twist and forward low-rank implication. The added derivative branch and infinitude are accurately distinguished at README line 107. |
| CMRankZeroConverse | Line 162, §0.1, and Layers 0–6: the rank-r p-converse is an implication predicate, not a theorem assumed without hypotheses. |
| ArithmeticStatisticsPartVII | §5.10 at line 1304; restricted odd and local-subfamily bounds at lines 1491 and 1505; §5.32, Attainable local three-isogeny ratios, line 2339. Both isogeny and dual need C on each nonempty stratum. |
| ArithmeticStatisticsPartI | §§0.1, 0.2, 0.5, 0.6 and 0.15, lines 177, 437, 975, 1117 and 1805; positive squareclass denominator at line 1833. Signed height, compatible local prescriptions, actual denominator and limiting stratum density match. |
| SelmerIwasawaCohomology | §§2.6, 2.9–2.12a, 3.9–3.11, 4.26, 4.28 and 4.29; lines 470, 563–676, 1538–1583, 2330, 2374 and 2509. Elliptic alternation and paired finite reduced group are explicit at lines 2533–2539; quadratic decomposition at line 2467 retains local compatibility. |
| EulerSystemsAndKolyvaginSystems | §8.31 at line 5617, especially Augmentation control at line 5635 and corank-one consequence at line 5647. The control subtarget expressly excludes residual irreducibility, (Sc) and (Irr) from its hypotheses. |
| HeegnerPointEulerSystems | §§8.5–8.6a, 8.13, 8.24, 8.31–8.32, 8.34, 8b.2 and 8b.10, lines 1408–1456, 1561, 1723, 1829–1871, 2077 and 2163. The rational CGLS comparison in §8b.2 includes odd p, even though its separate integral BCK branch requires p>3. |
| GrossZagierAndArithmeticHeights | §§0.1, 8.14, 8.18 and 8.19, lines 304, 5047, 5127 and 5141: same height convention, actual trace and elliptic formula. The squarefree-level §8.17 remains unused. |
| EffectiveClassNumbers | §2.8 at line 640, internal target Gross–Zagier with exact constants: odd D prime to N and all level primes split, with the matched quotient and relative height. |
| EllipticCurveModularity | Layers R29.3–R29.6 at lines 1020, 1261, 1472 and 1605: actual form, conductor, Euler factors, parametrization and continuation. The separate quadratic analytic factorization contract remains declared. |
| ModularIwasawaMainConjectures | §6.1 at line 1980 is the anticyclotomic interface; the equality proof is imported from HeegnerPointEulerSystems. |
| EllipticCurves; PadicMeasuresIwasawaAlgebras | Main: EllipticCurves Layers 1–2, 4–5, 7 and the integral-j criterion at line 827; PadicMeasuresIwasawaAlgebras Layer 4 for the characteristic-ideal/localization conventions. These main roadmaps were also the shape examples read. |
| ModularForms; GlobalNumberFields | Main: ModularForms Layer 7, line 708, supplies arithmetic L-functions and functional equations; `Completed/GlobalNumberFields/README.md:259`, Layer 1, supplies mixed-place weak approximation. |
| RankOneConverse | `packages/RankOneConverse/design/README.md:50` and line 515 resolve PC.0–PC.6. Its irreducible-residual, squarefree-level branch is a scope boundary, not a supplier for the Eisenstein theorem. The resolver's missing-open-roadmap lead therefore does not establish a missing object. |

The four retained gap slugs occur in both README and plan with named owners: `eisenstein-local-dictionary`, `complementary-heegner-twists`, `quadratic-analytic-factorization`, and `cgls-ordinary-control`. The previous audit of the unchanged gaps is carried forward; the new sentence narrows the claimed novelty of the complementary-twist request. These are explicit library obligations, not extra assumptions replacing the headline conclusions. The fifth plan entry is R01.

**Adversarial table (35 rows: 26 carried forward, 9 newly computed).** The first rows carry the previous report's computed tests for mathematically unchanged statements; source-only locator edits were verified separately above. The following new rows compute the amended contract and §5.3 assertions, and explicitly cover the remaining headline implications.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, exclusion at `p=3` | `F₃ˣ={±1}`; `φ|G₃∈{η, ωη}`; alternatives `1, ω`; rational 3-torsion kernel | `η(Frob)=−1`, `η|I=1`; `(ωη)|I=ω|I` nontrivial; product `ω`; `φ=1` rejected | symmetric under `φ↔ψ=ωφ⁻¹` since `ψ=1⇔φ=ω` | Mathematical statement unchanged; carried from [previous review][prior] |
| Conventions, contragredient | `Λ=ℤ₃⟦T⟧`, `γ↦γ⁻¹` | `γ⁻¹−1 = 1/(1+T)−1 = −T/(1+T)`, order 1 at `T=0`; `3` unit in `Λ[1/3]`, `T` not | as stated | Mathematical statement unchanged; carried from [previous review][prior] |
| Conventions, heights | `h_(O)(P)=1, h_(O)(2P)=4` | `h_x=2,8`; `B_x(P,P)=(8−2−2)/2=2=h_x(P)`; half polar form of `h_(O)` gives 1 | as stated, agrees with GZAH §0.1 | Mathematical statement unchanged; carried from [previous review][prior] |
| Conventions, local masses at 3 | signed squarefree `d` | `P(3∤d)=(2/3)/(8/9)=3/4`; classes 1,2: `3/8` each; classes 3,6: `1/8` each; sum 1 | as stated | Mathematical statement unchanged; carried from [previous review][prior] |
| §0.1 bundle | `p=2`; multiplicative `p`; `φ=1`; dual isogeny | rejected, rejected, rejected; `ψ=ωφ⁻¹∉{1,ω}⇔φ∉{ω,1}` | hypotheses match CGLS Theorem E | Mathematical statement unchanged; carried from [previous review][prior] |
| §0.2 `dim Sel_p = corank + 2s` | `(c,s)=(0,0),(1,0),(1,1)`; `ℤ/p²` | dims `0,1,3`; `ℤ/9` admits only the zero alternating pairing | `r∈{0,1}` forces `s=0`; `Sel_p=Sel_{p∞}[p]` needs `E(ℚ)[p]=0`, supplied by the local exclusion | Mathematical statement unchanged; carried from [previous review][prior] |
| §1.1 sign bookkeeping | `r=1`: `w(E)=−1`; `r=0`: `w(E)=+1`; all level primes split | `w(E/K)=w(E)w(E^K)=−1` ⇒ `w(E^K)=+1` resp. `−1`; value resp. derivative branch | matches CGLS (d), (d′) | Mathematical statement unchanged; carried from [previous review][prior] |
| §1.1 discriminant conditions | 2 split; infinitude | `D≡1 (8)` ⇒ odd; excludes `−3,−4` | `u_K=1` available | Mathematical statement unchanged; carried from [previous review][prior] |
| §1.2 corank sum | `r=0,1` | `0+1=1`, `1+0=1`; `K_v=ℚ_p` ⇒ `E(K)[p]⊂E(ℚ_p)[p]=0` | (Sel) and `E(K)[p]=0` hold | Mathematical statement unchanged; carried from [previous review][prior] |
| §2.1 torsion length | `R=Λ_{P₀}`: `X=R`; `X=R⊕R/P₀` | coinvariant dims `1`, `2`; torsion lengths `0`, `1`; `Tor₁^R(k,k)=k` | corank one excludes the second; finite modules vanish after inverting `p` | Mathematical statement unchanged; carried from [previous review][prior] |
| §2.2 bottom factor | split `p`, full trace over `Gal(K[1]/K)` | `Tr((1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1])/u_K = (1−α⁻¹)²P_K`; `u_K=1` for `D<−4` | agrees with CGLS (4.4) | Mathematical statement unchanged; carried from [previous review][prior] |
| §2.2 units | 19a3 admissible twist, `a₃=2`: `X²−2X+3` mod 9 | `α=5`: `25−10+3=18≡0`; `β=6`: `5·6=30≡3`; `α⁻¹≡2`, `(1−α⁻¹)²≡1`; `α²(β−1)²=625≡4` | both units; `a_p≢1 (p)` from `μ≠1` | Mathematical statement unchanged; carried from [previous review][prior] |
| §2.3 equality at `P₀` | `S=R=ℚ₃⟦T⟧`, `κ=T` | tower class nonzero, bottom `0`, `char(S/Rκ)²=(T²)` | shows why `ord_{P₀}char(X_tors)=0` is needed | Mathematical statement unchanged; carried from [previous review][prior] |
| §2.3 Check `N=20, D=−71` | residues | `−71≡1 (8)`, `≡4=2² (5)`, `≡1 (3)`; `(20,71)=1`; `μ(N,D)=0`; `20` not squarefree | coefficient `‖ω_E‖²/(C²√71)` = ECN §2.8's; §8.17 inapplicable | Mathematical statement unchanged; carried from [previous review][prior] |
| §3.1 subtraction | `r=0,1` | `1−1=0`, `1−0=1` | analytic rank `r` | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.1 admissible classes | good ordinary, `φ|G₃=1`; `φ|G₃=η` | classes `1,2,3,6`: only `2` resp. only `1` admissible; `3,6` additive | exactly one unit class each time (also for `ω`, `ωη`) | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.1 negative control | `v₃(j)<0` | `A₃=∅` for every twist | matches §5.3 | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.2 strata | `c₃∈{1,3}` fixed by the admissible class; `c_∞∈{1,1/3}` by sign; bad `ℓ≠3` and `2` set to 1 | global ratios `{1,1/3}` or `{3,1}` | `T₀` and one of `T_{±1}` both inhabited | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.2 Check `d=−31`, `d=137` | residues | `−31≡2 (3)`, `≡1 (8)`, `≡7≡8² (19)`; `137≡2 (3)`, `≡1 (8)`, `≡4=2² (19)` | both prescriptions realised | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.3 lower bounds | even variable with mean ≤1; odd stratum `q+3(1−q)≤4/3` | `P(0)≥1/2`; `q≥5/6` | matches BKLOS §9.2 | Mathematical statement unchanged; carried from [previous review][prior] |
| §4.3 product of lower limits | `μ(Σ₀)=1/8`, `μ(Σ₁)=1/4`; `r_X` alternating `1/2, 1` | `(1/2)(1/8)=1/16`, `(5/6)(1/4)=5/24`; no limit for `B₀` in `Σ₀` | `le_liminf_mul` hypotheses hold (`u,v∈[0,1]`, `atTop` NeBot) | Mathematical statement unchanged; carried from [previous review][prior] |
| §5.1 invariants of `(0,1,1,1,0)` | `b₂=4,b₄=2,b₆=1,b₈=0` | `Δ=−64−27+72=−19`; `c₄=16−48=−32`; `c₆=−64+288−216=8`; `j=32768/19` | as stated | Mathematical statement unchanged; carried from [previous review][prior] |
| §5.1 reduction mod 3 | `x=0,1,2` | `y²+y=0,0,2`: 2,2,1 solutions; 5 affine, 6 total; `a₃=4−6=−2` | ordinary; `a₃≡1 (3)` consistent with `φ|G₃=1` | Mathematical statement unchanged; carried from [previous review][prior] |
| §5.1 tangent at `(0,0)` | partials | `F_x=−1, F_y=1`; tangent `y=x`; residual `x³` | flex, order 3 | Mathematical statement unchanged; carried from [previous review][prior] |
| §5.1 native twist | `t=0,n=−2` | `t²−4n=8`; `Δ=8⁶·(−19)`; squareclass `2` | as stated | Mathematical statement unchanged; carried from [previous review][prior] |
| §5.2 density | `d≡2 (3)` | `3/8=37.5 % < 41.6 % < 5/12≈41.667 %` | conversion ceiling holds | Mathematical statement unchanged; carried from [previous review][prior] |
| Part III counting specialization; R01 | F=ℚ; d=−31,137,18; isogeny and dual; m=−1,0,1 | H(−31)=31, H(137)=137; H([18])=H([2])=2. Means 1+3^m are 4/3,2,4; dual means 4,2,4/3. Local masses at 3: 3/8,3/8,1/8,1/8, sum 1. | Existing supplier target covers the instance; redundant plan gap remains. | README import repaired; delete the plan entry. |
| Amended complementary-twist contract | r=0,1; w(E)=+1,−1; split level | Required twist orders 1,0; products of root signs (+1)(−1)=−1 and (−1)(+1)=−1. Infinitely many D allow excluding −3 and −4. | Value branch already exists; derivative branch and infinitude are the additional work. | Clarification repaired. |
| §3.2 rank and whole Sha | r=0 and 1 after §3.1 | Analytic orders 0 and 1 give Mordell–Weil ranks 0 and 1. Finite Sha contributes p∞-corank 0; rank plus that contribution is 0+0=0 or 1+0=1. | Forward implication is used only after analytic rank is known; no circular finiteness assumption. | Locator corrected. |
| §3.3 finite-Selmer converse | (corank, paired finite dimension)=(0,0),(1,0),(0,2) | Selmer dimensions 0,1,2. The first two give ranks 0,1; the last cannot enter r∈{0,1}. | The alternating-pairing input is necessary; coefficient identification alone would not suffice. | Locator corrected. |
| §4.4 positive proportions | Positive stratum masses 1/8 and 1/4; empty A₃ for W | Bounds (1/2)(1/8)=1/16>0 and (5/6)(1/4)=5/24>0; empty A₃ has mass 0 and fails the good-twist hypothesis. | Stated positive conclusion and its excluded case agree. | Locator corrected. |
| §5.3 obstruction model and API | Coefficients (1,0,3,0,0); point (0,0) | b₂=1,b₄=3,b₆=9,b₈=0; Δ=−216−2187+243=−2160; c₄=1−72=−71; c₆=−1+108−1944=−1837; j=357911/2160. F_x=0,F_y=3 gives tangent y=0 and intersection x³=0. | Elliptic curve and nonidentity rational order-three flex; quotient kernel has order 3. | Definition/API/three Checks now precede use. |
| §5.3 global obstruction | W and every rational nonzero twist | v₃(j)=v₃(71³)−v₃(2160)=0−3=−3; good reduction would give v₃(j)≥0. A₃(W,ι)=∅. | Negative valuation excludes every twist, regardless of kernel character. | Global statement has its own dependencies. |
| §5.3 local obstruction and new proof | d=1,3,2,6 in ℚ₃; trace 0, norm −d | Raw (Δ,c₄): d=1 gives (−8847360,−1136), valuations (3,0); d=3 gives (−6449725440,−10224), valuations (9,2); d=2 gives (−566231040,−4544), valuations (3,0). d=6 gives valuations (9,2). All have j=357911/2160; 9=3·2+3 and 3=3·0+3. | For every integral model k=v₃(c₄)≥0 implies v₃(Δ)=3k+3≥3, incompatible with good reduction's 0. | Minimal-model test and variable-change j dependency are explicit. |
| §5.3 full local quantifier and excluded zero | d=1/3, d=0 | d=1/3 gives Δ=−327680/27, c₄=−1136/9, valuations (−3,−2), still v₃(j)=−3; minimalizing restores integrality, not integral j. d=0 gives Δ=0 and no elliptic j instance. | Arbitrary nonintegral nonzero d is included; zero is correctly excluded. The ≥3 bound concerns integral models only. | New local proof does not incorrectly impose d∈ℤ₃. |

The unchanged boundary tests are retained from the previous review: r=2 can have corank 0 and finite-Selmer dimension 2; D=−3 has u_K=3 and is excluded; p dividing h_K is allowed because no trace is divided by h_K; an empty conditional stratum has the 0/0=0 count convention but no asserted positive conditional proportion. The local diagnostic was additionally checked on all four ℚ₃ squareclasses through units, ramified representatives and unchanged j.

[prior]: packages/RankZeroOneBSDPartII/reports/PRREVIEW-RankZeroOneBSDPartII~1.md

## Not verifiable

- None within this incremental review's scope. CGLS, BKLOS and PS were readable in the manifest's legal author copies. Unchanged mathematical rows explicitly cite the previous review rather than claiming a fresh full review. No missing-reference request was added.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3, proof, printed p. 575: the source says twisting arranges the kernel-character condition so the finite-Selmer converse applies; it should be verified that a good-at-three twist exists; the rational-three-isogeny curve y²+xy+3y=x³ has twist-invariant v₃(j)=−3 and none exists; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed p. 575: the source says the finite-Selmer converse and BKLOS yield at least 41.6% analytic-rank-one twists of nineteen-a3; it should be established beyond the admissible conversion set, whose density is only 3/8=37.5%, or restricted to the intersections with that set; affects the proof.
