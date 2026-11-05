# Review of RankZeroOneBSDPartII (pull request #1732 at c42ad8a)

**Verdict:** needs changes

This is a full review of the roadmap folder at the same head the previous review read: the folder has 0 changed lines since that review, so its single blocking finding is re-raised unchanged, and the whole roadmap was reviewed again from the sources, the pins and the suppliers as they are now.

## R01 (P2) — The package plan still declares a counting gap that ArithmeticStatisticsPartIII already states as targets

**Location.** `packages/RankZeroOneBSDPartII/design/plan.json`, top-level `gaps`, fifth entry, `"slug": "rational-three-isogeny-count"`, supplier `ArithmeticStatisticsPartIII`, section "Windowed cubic counting contract (support-coregular-count)". The pull request's `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:113` no longer states this gap: it imports the seven conditions directly ("Part III's ... items 1–7, state C(F,φ,Σ) as its own targets for every number field F, every degree-three isogeny φ of abelian varieties and every nonempty family Σ").

**Claim.** The gap asks Part III to "prove the seven conditions C(ℚ,ι,Σ) for every rational three-isogeny and every nonempty finite-local-squareclass family and ratio stratum, for the isogeny and its dual". That is already provided.

**Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md` at its open head, lines 2148–2257: items 1–7 are written as targets ("To prove this target, ...", "The following targets state these estimates"), quantified over every number field `F`, every degree-three isogeny `φ` of abelian varieties and every nonempty `Σ` cut out by finitely many local conditions, in the height `H(s)=∏_(v(s) odd) Nv` (which is `|d|` over ℚ) with the additive-Haar local masses of item 7; finite unions of rectangles are covered by item 7's denominator-weighted sums, which is what the strata `Σ∩T_m` are by ArithmeticStatisticsPartVII §5.10 "Selmer ratio classes are locally defined" (line 1366). Nothing in the slug's `needs` sentence is outside that.

**Exact repair.** Delete the `rational-three-isogeny-count` object from the plan's top-level `gaps` array; add nothing in its place. The pull request's README already carries the right citation (line 113 and the `*Needs:*` lines at 413 and 437), so the roadmap folder needs no edit. If the plan cannot be edited from this pull request, the repair report should say so with that reason, so that the intake does not announce a redundant obligation on Part III's job.

Not repaired since the previous review (same head, 0 changed lines).

## R02 (P3) — "Part II" of a base roadmap that does not exist

**Location.** `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:1` ("rank-zero and rank-one Birch–Swinnerton-Dyer theory, part II") and the Scope paragraph at line 7.

**Claim.** A Part II roadmap's introduction says where the base roadmap stops. No roadmap `RankZeroOneBSD` exists on main, in any of the 441 open roadmap pull requests, in the merge order, or among the board's packages; it occurs only as a forward reference in other roadmaps' consumer lists (for example `TauCetiRoadmap/EllipticCurveModularity/README.md:88` and `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:4401`). A reader will look for a Part I.

**Witness.** `tauceti-roadmap roadmaps grep 'RankZeroOneBSD[^P]'` returns only consumer mentions; `board/packages` contains `RankZeroOneBSDPartII` and no `RankZeroOneBSD`; `ORDER.txt` lists only `RankZeroOneBSDPartII` (line 354).

**Exact repair.** Add one sentence to the first Scope paragraph: that the base (forward Gross–Zagier–Kolyvagin) direction is owned by the named suppliers listed there and that there is no separate `RankZeroOneBSD` roadmap; this roadmap is complete in itself. The folder name is the package's and is not changed here.

## Verified sound

**Previous findings.** R01 — not repaired (above). R02 — repaired: the cached line locators at README lines 151, 168, 195, 211, 240, 258, 276, 303, 319, 336, 375, 393, 411, 427, 465, 483, 519, 534 and the References paragraph at 560–562 all resolve in the cached extractions (checked below). R03 — repaired: line 7 and lines 117, 292, 305 and 346 cite CMRankZeroConverse "Layers 0–6" and "§0.1 The rank-r p-converse proposition", which are its actual headings (lines 160–531 and 162 of its head). R04 — repaired: §5.3 defines the model W, its API and three Checks at lines 489–505, then the global statement at 509 and the local statement at 523, each with its own `*Needs:*`. R05 — repaired: line 107 separates the value branch already proved inside ArithmeticStatisticsPartVI "Heegner logarithm and low rank" (its line 2414 proves the auxiliary nonzero-value twist inside the rank-one deduction) from the derivative branch and infinitude that the gap adds.

**Gate, elaboration, direction.** The worker's gate at this head passes every check including `build=0`. `lake env lean` on `Suggested.lean` exits 0 with no output. The outside-folder diff of the pull request is empty. The dependency check with `--movable` printed

```text
depcheck: 203 roadmaps, 1652 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 354; every supplier it names is earlier (SelmerIwasawaCohomology 51, EulerSystemsAndKolyvaginSystems 90, ArithmeticStatisticsPartI/III/VI/VII 95/99/129/130, EllipticCurveModularity 154, EffectiveClassNumbers 233, GrossZagierAndArithmeticHeights 319, ModularIwasawaMainConjectures 349, HeegnerPointEulerSystems 350, RankOneConverse 351, CMRankZeroConverse 353); EllipticCurves, ModularForms, PadicMeasuresIwasawaAlgebras and GlobalNumberFields are on main. Every `*Needs:*` line (lines 153, 170, 197, 213, 242, 260, 278, 305, 321, 338, 377, 395, 413, 429, 467, 485, 507, 521, 536) was read; none cites a later roadmap or a pull-request number.

**Principles.** No route-specific shortcut (the converse is stated for every good odd Eisenstein prime and every conductor; the good-at-three-twist hypothesis of §§4.2–4.4 is the hypothesis the source's proof actually uses, with §5.3 showing it is not automatic); no re-planned roadmap (Selmer theory, Heegner families, Gross–Zagier, counting and densities are imported by section); no copied passage (the three sources were read against every cited line; the README's sentences are its own); no algorithm; `Suggested.lean` has no declaration, hence no sorry'd data and no `set_option`. No process words or round labels (grep for the usual list is empty).

**Sources: the seeded sample (15 targets) and every flagged locator.** All three manifest texts are the legal author copies in the cache; printed pages were read off the `=== page N ===` markers (CGLS page k = printed 516+k; BKLOS and PS author pagination).

| Target | Locator checked | What the source supports |
|---|---|---|
| 0.1 hypotheses | CGLS lines 79–95 (p. 518–519): odd good p, Eisenstein ⇔ rational p-isogeny, Fontaine ordinarity, (spl), (Heeg); line 133 (disc); lines 171–182 (φ,ψ, ψ=ωφ⁻¹, (Sel), Theorem C); lines 219–223 Theorem E (p. 522) | Hypotheses exactly: p>2 good, E[p]^ss=φ⊕ψ, φ\|G_p∉{1,ω}, r∈{0,1}. The condition is symmetric in φ↔ψ (ψ∉{1,ω}⇔φ∉{ω,1}), so fixing φ as the kernel character of ι adds nothing. |
| 0.2 finite-Selmer dimension | CGLS lines 2188–2193 (p. 575); PS lines 59–68 (p. 2), 425–427 Theorem 5 (p. 10), 456–462 Cor. 6–7 (p. 11), 474–478 Thm 8 (p. 11), 510–515 Cor. 9 (p. 12) | CGLS: E(ℚ)[p]=0 gives Sel_{p∞}[p]=Sel_p. PS: alternating pairing on Sha/div for elliptic curves (introduction), Cor. 9 only under finiteness, with the Sha_nd clause at line 515; the README correctly routes the alternation through SelmerIwasawaCohomology §4.29 (reduced group T×T, line 2539) rather than assuming finite Sha. |
| 1.2 corank one over K | CGLS lines 2162–2165, 2181–2185 (pp. 574–575) | Kolyvagin/Kato on E^K for r=1; Gross–Zagier–Kolyvagin on E^K for r=0; corank sum =1. |
| 2.1 augmentation control | CGLS lines 1767–1783 (§3.4, p. 564: M_E, T, inverse tautological action, ordinary conditions); 1847–1853 Cor. 3.4.2 (p. 566); 2166–2168 | Corank one ⇒ X_tors/P₀X_tors is ℤ_p-torsion ⇒ ord_{P₀} char X_tors = 0, stated "easily"; the compact specialization kernel is not in the source and is the declared gap. |
| 2.2 bottom class | CGLS lines 1934–1958 Remark 4.1.3, (4.4)–(4.5) (pp. 568–569) | Split k=0 stabilization u_K⁻¹(1−α⁻¹σ_p)(1−α⁻¹σ_p*)P[1]; pr_K(κ₁^Hg)=u_Kα²(β−1)²κ₀ when p splits; same Λ-line (lines 1962–1963). No division by h_K. |
| 2.3 non-torsion | CGLS lines 1925–1931 Theorem 4.1.2, 1967–1978 Prop. 4.2.1, 2001–2007 Cor. 4.2.3 (pp. 568–570), 2166–2172 | Under (Heeg),(spl),(disc),(Sel) and the exclusion, equality char(X_tors)=char(S/Λκ∞)² in Λ^ac=Λ[1/p] (line 1992 names Λ^ac=Λ[1/p]); then κ₁ has nonzero image, P_K non-torsion, Gross–Zagier gives order one. |
| 3.1 p-converse | CGLS lines 2145–2187 Theorem 5.2.1 (pp. 574–575) | Statement and both cases of the proof; the Monsky/parity input at 2151–2152 and 2173–2174; the complementary twist existence cited to [18, Thm B.1/B.2] with (a)–(d),(d′). |
| 3.2 rank and Sha | CGLS lines 2147–2148 | "and so rank = r and #Sha<∞" are consequences after the analytic order. |
| 3.3 finite-Selmer converse | CGLS lines 2188–2193 Cor. 5.2.2 (p. 575) | Same hypotheses, dim Sel_p = r. |
| 4.1 admissible family | BKLOS lines 78–86 (pp. 2–3: families by local conditions, height H); CGLS lines 2198–2205 Cor. 5.2.3 | BKLOS supplies the family and height; CGLS's proof says the exclusion "can be arranged by a quadratic twist" and does not mention good reduction, which the standing hypothesis (line 79) needs. |
| 4.2 positive strata | BKLOS lines 674–679 Prop. 10.1 (p. 14); 713–734 Thm 10.5 and Tables 1–2 (pp. 15–16); 764–766 Prop. 10.7 (p. 17); 798–811 §11 (p. 18) | Real ratios 1 and 1/3; at 3 ordinary ratio c(E′)/c(E)=1 and α=1 or 3^d by étale/connected kernel; for p≠3 (including p=2) a twist with c=1; weak approximation assembly. |
| 4.3 bounds | BKLOS lines 157–161 Thm 2.5 (p. 4, absolute T_m); 642–661 §9.1–9.2 (p. 14, signed T_m, parity, 1/2 and 5/6) | As stated; the README's signed/absolute remark at line 31 matches lines 157 and 643. |
| 4.4 proportions | BKLOS lines 166–173 Thm 2.6 (pp. 4–5), 798–811 (p. 18); CGLS 2198–2205 | Positive proportions via T₀, T_{±1} nonempty and Thm 2.5; CGLS's analytic conversion needs the admissible condition, made explicit here. |
| 5.1 nineteen-a3 | CGLS lines 2206–2215 Remark 5.2.4 (p. 575); BKLOS lines 180–186 (p. 4) | Equation y²+y=x³+x²+x, label 19a3, half of squareclasses in T₀ and half in absolute T₁, 25 % and 41.6 %. |
| 5.2 local family | same | The 41.6 % figure is "3-Selmer rank 1" in BKLOS (line 186) and "analytic and algebraic rank 1" in CGLS (line 2214). |
| 5.3 obstruction | CGLS lines 79–89, 2198–2205 | Good reduction at p is standing; Cor. 5.2.3's proof twists only for the character condition. |

No locator in the README is flagged as unverified. All printed-page claims in the References paragraph (lines 560–562) agree with the page markers.

**Pinned declarations opened** (Mathlib `f6090c70`, Tau Ceti `358314d4`; paths relative to each library).

| Declaration | Location | What it says, and what it does not |
|---|---|---|
| `WeierstrassCurve.minimal`, instance `IsMinimal` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299–304` | A chosen variable change maximising the discriminant valuation among integral models; integrality follows (line 282). |
| `WeierstrassCurve.HasGoodReduction` | same file, line 323 | Extends `IsMinimal`; `valuation K (maximalIdeal R) W.Δ = 1`, i.e. Δ a unit. So the local statement of §5.3 is exactly "the minimal model's Δ is not a unit". |
| `hasGoodReduction_iff_isElliptic_reduction` | line 328 | Needs `[IsMinimal R W]`. |
| `WeierstrassCurve.variableChange_j` | `VariableChange.lean:246` | `(C • W).j = W.j` for an elliptic W. |
| `NumberField.finite_setOfPred_logHeight₁_le` | `Mathlib/NumberTheory/Height/NumberField.lean:431` | Northcott for logarithmic height. |
| `WeierstrassCurve.Affine.finite_naiveHeight_le` | `Mathlib/NumberTheory/Height/EllipticCurve.lean:116` | Finiteness below a naive-height bound. |
| `le_liminf_mul` | `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133` | Hypotheses: `f.NeBot`, `0 ≤ᶠ u`, `u` bounded above, `0 ≤ᶠ v`, `v` cobounded for `≥`; conclusion `liminf u * liminf v ≤ liminf (u*v)`. Cutoff ratios in [0,1] along `atTop` satisfy all four. |
| `WeierstrassCurve.LSeries` | `LFunction.lean:84` | The literal Dirichlet series; no continuation. |
| `ContinuousCohomology.tateShafarevich` | `ContCohomology/Sha.lean:71` | A localization kernel for supplied topological data; no elliptic Kummer identification. |
| `WeierstrassCurve.quadraticTwistOf` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | Real body; `a₃ ↦ (t²−4n)·t·a₃`, so t=0 kills a₃ in the twist model (not used by the README's valuation argument, which goes through c₄, Δ and j). |
| `Δ_quadraticTwistOf`, `c₄_quadraticTwistOf` | lines 239, 229 | Δ·(t²−4n)⁶, c₄·(t²−4n)². |
| `isElliptic_quadraticTwistOf_iff`, `j_quadraticTwistOf` | lines 299, 306 | Ellipticity iff `IsUnit (t²−4n)` and E elliptic; equal j when both elliptic. Over ℚ₃ this is d≠0, as the README says. |
| `Point.canonicalHeight_nonneg`, `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` | `CanonicalHeight/Basic.lean:260, 332` | The second carries a Northcott hypothesis, discharged by the number-field instance in the same file as the README states. |
| `WeierstrassCurve.Affine.fg_point_of_numberField` | `MordellWeil/FinitelyGenerated.lean:121` | Mordell–Weil over number fields (`AddGroup.FG W.Point`). The explicit 2-descent groups `selmerGroup₂` (`MordellWeil/SelmerGroup.lean:104`) and `selmerGroupA` (`SelmerGroupA.lean:129`) are the only Selmer carriers at the pin. |
| `TauCeti.GlobalNumberFields.weakApproximation_denseRange` | `NumberTheory/NumberField/Global/Approximation/Weak.lean:204` | Dense range of K in a finite product of finite and infinite completions; exactly what §4.2 uses. |
| `HeckeRing.GL2.Newform.analyticRank`, `analyticOrderAt_L_ne_top`, `analyticRank_eq_zero_iff` | `Newforms/AnalyticInvariants.lean:80, 72, 107` | Newform analytic rank with finite order; the elliptic comparison is a supplier contract, as stated. |
| `TauCeti.Isogeny` | `Isogeny/Basic.lean:139` | Coordinate pullback preserving infinity; no second carrier here. |

**Supplier citations resolved** (each at the roadmap's open head unless noted; line numbers are in that README).

| Supplier | Resolved |
|---|---|
| ArithmeticStatisticsPartIII | "Supporting uniform estimates" line 2138; "Windowed cubic counting contract" line 2148 with items 1–7 at 2150–2257, every number field, every degree-three isogeny, every nonempty finitely-local Σ; orbit count §2.22 line 2055 assumes C and items 1–7 prove it. |
| ArithmeticStatisticsPartVII | §5.10 line 1304: "Selmer ratio of an isogeny" 1306 (signed T_m), "Local Selmer ratio via Tamagawa numbers" (c=(c(E′)/c(E))·\|φ′(0)\|⁻¹), "Tamagawa ratio under potentially good reduction", "Selmer ratio classes are locally defined" 1366 (densities of Σ∩T_m, positive when nonempty), "Three isogeny selmer parity" 1428, "Finitely many twists with rational p torsion" 1442, "Three selmer rank zero in selmer ratio one twists" 1476 (≥1/2, r₃ corrected by rational 3-torsion, under C), "Three selmer rank one in odd selmer ratio twists" (≥5/6), "Positive proportions of three selmer ranks in local subfamilies"; §5.32 line 2264, "Attainable local three-isogeny ratios" 2339 (p≠3 including 2: a twist with c=1). |
| ArithmeticStatisticsPartI | §0.1 line 177 with "Relative density" 249 (r_X with 0/0=0, lower density = liminf) and the tower theorem 307 (needs both limits); §0.2 437 "Family defined by local conditions"; §0.5 975 squareclass height H(t)=N(𝔞(t)); §0.6 1117 "Squarefree integers in residue classes" 1171; §0.15 1805 "Positive squareclass denominator" 1833. |
| ArithmeticStatisticsPartVI | "Heegner logarithm and low rank" line 2412 (analytic rank 0 or 1 over ℚ ⇒ same rank and finite Sha, for every E with modular comparison data; auxiliary nonzero-value twist proved inside); "Elliptic p-parity" 2466 (p∞-corank even iff w=+1, including p=3 and reducible residual action). |
| SelmerIwasawaCohomology | §§2.6 (470), 2.9 (563), 2.10 (592, contragredient duals), 2.11 (622, coranks), 2.12 (650), 2.12a (676), 3.9 (1538), 3.10 (1563), 3.11 (1583, snake sequence with invariant errors), 4.26 (2330), 4.28 (2374, odd p, quadratic-character decomposition), 4.29 (2509; elliptic alternation and reduced ℓ-primary T×T at 2533–2539, no finiteness assumed). |
| EulerSystemsAndKolyvaginSystems | §8.31 line 5617; "Augmentation control" 5635 (good ordinary, (D_K,Np)=1, level and p split, E(K)[p]=0; finite kernel and cokernel; no irreducibility, (Sc) or (Irr), line 5637); corank-one consequence 5647. |
| HeegnerPointEulerSystems | §8.5 1408, §8.6 1433, §8.6a 1456 (scalar and lattice transport factors), §8.13 1561 (pr_K(κ₁^Hg)=u_Kα²(β−1)²κ₀, units), §8.24 1723 (non-torsion bottom class with class-number shifts), §8.31 1829, §8.32 1845, §8.34 1871 (X∼Λ⊕M⊕M including (γ−1)), §8b.2 2077 (rational CGLS Prop. 4.2.1 comparison for odd p), §8b.10 2163 (Eisenstein equality, φ\|G_p≠1,ω, no (Sel)). |
| GrossZagierAndArithmeticHeights | §0.1 305 (h_x=2h_(O), neronTatePairing P P = canonicalHeight P); §8.4 4801; §8.14 5052; §8.15 5066; §8.17 5102 (assumes squarefree N: not used here); §8.18 5132 (y non-torsion ⇔ L′≠0, with the F=ℚ, A=E, B=M₂(ℚ) consequence at 5140); §8.19 5146 (coefficient 2^(−μ)‖ω₀‖²/(C²u²√\|Dc²\|), c=1, χ=1 is the Galois trace). |
| ModularIwasawaMainConjectures | §6.1 line 1980 (interface; (disc),(Heeg),(spl) at 1984). Its p>3 is the interface's own standing hypothesis; the Eisenstein equality is imported from HeegnerPointEulerSystems §8b.10, which includes p=3. |
| EffectiveClassNumbers | §2.8 line 640 "Exact vanishing from a Heegner height gap", classical Heegner trace with π(∞)=O. |
| CMRankZeroConverse | §0.1 line 162: the rank-r p-converse proposition for (A,p,r), analytic rank = order of the actual continuation; Layers 0–6 at 160–531. |
| EllipticCurveModularity, ModularForms | Layers R29.3–R29.6 at lines 1020, 1261, 1472, 1605 (newform, conductor and Euler factors, parametrisation, continuation); ModularForms Layer 7 line 708 (main). |
| EllipticCurves (main) | Layers 1 (423), 2 (647), 4 (793), 5 (1154), 7 (1262); the j-integrality criterion as a theorem at line 827. |
| PadicMeasuresIwasawaAlgebras (main), GlobalNumberFields (completed) | Layer 4 line 2328 (Weierstrass theory, module structure); Layer 1 line 259 (mixed-place weak approximation). |
| RankOneConverse | Exists only as the design package `packages/RankOneConverse/design/README.md`, headings PC.0–PC.6 at lines 50–515; cited here only as a scope boundary, never in a `*Needs:*` line. The resolver's "found nowhere" lead is therefore not a missing object. |

**Declared gaps.** The four gaps stated in the README (lines 67, 73, 81, 107) have named suppliers and the same slugs in the plan; each `needs` sentence is one precise obligation with its hypotheses, and none asks for what the supplier already states (the Part VI value branch is explicitly excluded at line 107; ESKS §8.31 gives the discrete control but not the compact kernel; HPES §8b.10 does not supply the quadratic L-factorization; EllipticCurves Layers 4–5 have no p=3 twist dictionary). The fifth plan gap is R01.

**Ownership.** The Eisenstein p-converse, its finite-Selmer form and the admissible-family conversion were searched by object (`roadmaps grep` over main and the 441 open heads for "Theorem 5.2.1", "Corollary 5.2.2", "Eisenstein ... converse"): no other roadmap states them; CMRankZeroConverse owns the CM branch and RankOneConverse (design) the irreducible-residual branch, both cited as boundaries. The obstruction curve W and the nineteen-a3 model have no owner elsewhere. `Suggested.lean` declares no name, so no fully qualified name can collide. Ownership against open pull requests was checked through the indexed heads.

**Headline theorems and the Lean file.** Headlines: §3.1 (p∞ converse), §3.2 (rank equality and finite Sha), §3.3 (finite-Selmer converse), §4.4 (positive low-rank proportions), with the intermediate deep targets §§0.2, 1.1, 1.2, 2.1–2.3, 4.2, 4.3. None is statable at the pins: there is no classical odd-primary Selmer group with Kummer local conditions (Tau Ceti has only the explicit 2-descent groups `selmerGroup₂`/`selmerGroupA`), no arithmetic anticyclotomic Selmer module, no Heegner family, and no continued elliptic L-function identified with the curve (`WeierstrassCurve.LSeries` is the raw series; the newform `analyticRank` lacks the elliptic comparison). The module docstring names each absent headline and the missing carrier. The two single-curve diagnostics are correctly kept as README targets. With zero declarations there is nothing to one-tactic-probe and no `#check @name` comparison to make; I state that explicitly. The file is a module docstring, `namespace`, `end`, single `import Mathlib`, no `set_option`, no `lemma`.

**Shape.** Summary, Scope and ownership, Conventions (with five Checks), Exact supplier contracts per supplier, How to read the build, Layers 0–5 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Definitions (§0.1, §4.1, §5.1, §5.3 model) have API lists and 5, 5, 5, 3 Checks; every theorem states its hypotheses and has a locator; Unicode mathematics, ASCII in code spans; no LaTeX delimiters.

**Adversarial table** (every value computed here; `adv.py` in scratch reproduces the numerical rows).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, exclusion at p=3 | η unramified quadratic; alternatives 1, ω; rational kernel point | η(Frob)=−1, η\|I=1; ω\|I nontrivial so ωη≠1,ω; product η·ωη=ω; φ=1 rejected | symmetric: ψ=ωφ⁻¹∉{1,ω} ⇔ φ∉{ω,1} | none |
| Conventions, contragredient | Λ=ℤ₃⟦T⟧, γ↦γ⁻¹ | γ⁻¹−1=1/(1+T)−1=−T/(1+T), order 1 at T=0; 3 unit in Λ[1/3], T not | as stated | none |
| Conventions, heights | h_(O)(P)=1, h_(O)(2P)=4 | h_x=2, 8; B_x(P,P)=(8−2−2)/2=2=h_x(P); half polar form of h_(O) would give 1 | agrees with GZAH §0.1 Check `neronTatePairing W P P = canonicalHeight P` | none |
| Conventions, masses at 3 | signed squarefree d | P(3∤d)=(2/3)/(8/9)=3/4; classes 1,2: 3/8 each; 3,6: 1/8 each; total 1 | as stated | none |
| 0.1 bundle | p=2; multiplicative p; φ=1; dual | each rejected; dual character ψ=ωφ⁻¹ passes iff φ does | matches CGLS Thm E hypotheses | none |
| 0.2 dim Sel_p=corank+2s | S=(ℚ₃/ℤ₃)^c⊕M⊕M, (c,s)=(0,0),(1,0),(1,1),(0,1) | dims 0,1,3,2; coranks 0,1,1,0; ℤ/9 admits only the zero alternating pairing | r∈{0,1} ⇒ s=0; (0,1) shows dimension 2 is not corank 0 by the argument | none |
| 0.2 Sel_p≅Sel_{p∞}[p] | E(ℚ)[p]=0 vs ≠0 | kernel of H¹(E[p])→H¹(E[p∞]) is E(ℚ)[p∞]/p; zero iff E(ℚ)[p]=0; E(ℚ_p)[p]≠0 would force φ\|G_p or ψ\|G_p =1 | exclusion supplies the hypothesis | none |
| 1.1 signs | r=1: w(E)=−1; r=0: w(E)=+1; all level primes split | w(E/K)=−1 ⇒ w(E^K)=+1 resp. −1; required twist order 1−r = 0 resp. 1 | branches match (d),(d′) | none |
| 1.1 discriminants | 2 split; infinitude | D≡1 (mod 8) ⇒ odd; infinitely many ⇒ D<−4 available, u_K=1 | as stated | none |
| 1.2 corank sum | r=0,1 | 0+1=1, 1+0=1; K_v=ℚ_p ⇒ E(K)[p]⊂E(ℚ_p)[p]=0 | (Sel) and E(K)[p]=0 | none |
| 2.1 torsion length | R=Λ_{P₀}: X=R; X=R⊕R/P₀ | coinvariant dims 1, 2; torsion lengths 0, 1; Nakayama on M_{P₀} | corank one forces M_{P₀}=0 | none |
| 2.1 Tor term | k=R/P₀R | Tor₁^R(k,k)=k, dimension 1 | cokernel terms rightly retained | none |
| 2.2 trace factor | split p, full trace over Gal(K[1]/K) | Tr((1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1])/u_K=(1−α⁻¹)²P_K; u_K=1 | agrees with (4.4) | none |
| 2.2 units | nineteen-a3 admissible twist, a₃=2: X²−2X+3 mod 9 | roots 5, 6; α≡5, β≡6, 5·6≡3; α⁻¹≡2; (1−α⁻¹)²≡1; α²(β−1)²≡4 | both units; a_p≢1 (mod p) ⇔ μ≠1 | none |
| 2.3 equality at P₀ | S=R=ℚ₃⟦T⟧, κ=T | tower class ≠0, bottom =0, char(S/Rκ)²=(T²) | shows why ord_{P₀}char X_tors=0 is needed | none |
| 2.3 Check N=20, D=−71 | residues | −71≡1 (8), ≡4=2² (5), ≡1 (3); (20,71)=1; μ=0; 20 not squarefree | coefficient as in ECN §2.8; §8.17 inapplicable | none |
| 3.1 subtraction | r=0,1 | 1−1=0, 1−0=1 | analytic rank r | none |
| 3.2 / 3.3 | r=0,1; (corank, s)=(0,0),(1,0),(0,1) | ranks 0,1; finite Sha has corank 0; dimension 2 excluded from r∈{0,1} | forward theorem used only after the converse | none |
| 4.1 admissible classes | good ordinary, φ\|G₃=1; φ\|G₃=η | classes 1,2,3,6 → only 2 resp. only 1 admissible; 3,6 additive | exactly one unit class each time | none |
| 4.1 negative control | v₃(j)<0 | A₃=∅ | matches §5.3 | none |
| 4.2 strata | c₃∈{1,3} fixed by admissible class; c_∞∈{1,1/3}; bad ℓ≠3 and 2 set to 1 | global ratios {1,1/3} or {3,1} | T₀ and one of T_{±1} inhabited | none |
| 4.2 Check d=−31, 137 | residues | −31≡2 (3), ≡1 (8), ≡7≡8² (19); 137≡2 (3), ≡1 (8), ≡4=2² (19); squares mod 19 = {1,4,5,6,7,9,11,16,17} | both prescriptions realised | none |
| 4.3 bounds | even variable mean ≤1; odd: q+3(1−q)≤4/3 | P(0)≥1/2; q≥5/6 (equality at 4/3) | matches BKLOS §9.2 | none |
| 4.3 product rule | B⊆Σ⊆all; N(Σ;X)=0 | r_X(B\|Σ)·r_X(Σ\|all)=r_X(B\|all), both 0 when N(Σ;X)=0 (Part I's 0/0=0) | identity holds at every cutoff | none |
| 4.3 liminf product | μ(Σ₀)=1/8, μ(Σ₁)=1/4; r_X alternating 1/2, 1 | (1/2)(1/8)=1/16, (5/6)(1/4)=5/24; no limit for B₀ | `le_liminf_mul` hypotheses hold (u,v∈[0,1], atTop NeBot) | none |
| 5.1 invariants | (0,1,1,1,0) | b=(4,2,1,0); Δ=−19, c₄=−32, c₆=8, j=32768/19; c₄³−c₆²=1728Δ | as stated | none |
| 5.1 reduction mod 3 | x=0,1,2 | solutions 2,2,1; 5 affine, 6 total; a₃=4−6=−2 | ordinary; consistent with a rational 3-torsion point | none |
| 5.1 tangent at (0,0) | partials | F_x=−1, F_y=1; tangent y=x; residual x³ | flex, order 3 | none |
| 5.1 native twist | t=0, n=−2 | t²−4n=8; Δ=−19·8⁶=−4980736; squareclass 2; −19·2⁶=−1216 differs | as stated | none |
| 5.2 density | d≡2 (3) | 3/8=37.5 % < 41.67 %=5/12 | conversion ceiling | none |
| 5.3 model | (1,0,3,0,0) | b=(1,3,9,0); Δ=−2160=−2⁴·3³·5; c₄=−71; c₆=−1837; j=357911/2160; 71³=357911; v₃(j)=0−3=−3; F_x=0, F_y=3, tangent y=0, residual x³ | elliptic; nonidentity flex of order 3 | none |
| 5.3 global | every twist | same j, v₃(j)=−3<0 ⇒ not potentially good | A₃(W,ι)=∅ | none |
| 5.3 local twists | d=1,3,2,6,1/3 (t=0, n=−d) | (v₃Δ, v₃c₄) = (3,0), (9,2), (3,0), (9,2), (−3,−2); j unchanged; 3v(c₄)−v(j)=v(Δ) in each case | integral model ⇒ v₃(Δ)=3v₃(c₄)+3≥3, never a unit; d=0 excluded (Δ=0) | none |
| Part III redundancy (R01) | F=ℚ, d=−31, 137, 18; ι and dual; m=−1,0,1 | H(−31)=31, H(137)=137, H([18])=H([2])=2; means 1+3^m = 4/3, 2, 4; dual 4, 2, 4/3 | supplier targets cover the instance; plan gap redundant | delete plan entry |

Boundary tests retained: r=2 can have corank 0 with dim Sel_p=2 (excluded from the theorem); D=−3 has u_K=3 and is excluded; p \| h_K is allowed since no trace is divided by h_K; an empty stratum gives no conditional proportion (0/0=0) and the absolute bound degenerates to 0, so §4.4's positivity rests on §4.2's nonemptiness; ramified twists at 3 are additive, so the kernel-character case split never meets them.

## Not verifiable

- None. CGLS, BKLOS and PS were read in the manifest's legal author copies; every supplier cited is readable on main, at its open head, or (RankOneConverse) in the board's design package. No source fetch was needed and no `needs-references.toml` entry was added.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3, proof, printed p. 575: the source says the local kernel-character condition can be arranged by a quadratic twist and then Corollary 5.2.2 applies; it should also arrange good reduction at 3, which no twist of y²+xy+3y=x³ (v₃(j)=−3) has; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed p. 575: the source says Corollary 5.2.2 with the explicit BKLOS bounds gives at least 41.6 % of twists of 19a3 with analytic and algebraic rank one; it should restrict to twists where the p=3 converse applies, a set of density 3/8 < 5/12; affects a stated result.
