<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6403322125 -->
Review (claude) of 4ed8f9d

Verdict: accepted
Conditional on the announced gaps: `perfectoid-quantitative-cochains`, `crystalline-pro-final-radius`, `lubin-tate-all-local-fields`, `positive-degree-two-obstruction`, `closed-infimal-convolution`, `finite-group-free-scheme-quotient`

1. **F01** (P3) §11.6 cites a VB3 subsection that does not exist at the supplier's head

   Location: `packages/RelativeFarguesFontainePartII/README.md` line 2235, "*Needs:* §1.12; §6.10; TauCetiRoadmap.VectorBundlesAndIsocrystals VB3, General Banach–Colmez spaces."; and `design/plan.json`, gap `positive-degree-two-obstruction`, field `section` = "VB3 general-BC".

   Claim: VB3 has a subsection "General Banach–Colmez spaces" supplying the Banach–Colmez diamond description of `B^(φ=p²)`.

   Witness: at the head of VectorBundlesAndIsocrystals (#1205) Layer VB3 (its line 1177) has no heading or anchor containing "general"; the description `BC(E)(T)=H⁰(X_T,E_T)` lives in "Banach–Colmez section and hypercohomology sheaves" (its lines 1183–1185, anchor `banach-colmez-space-definition`).

   Repair: in line 2235 replace "VB3, General Banach–Colmez spaces" by "VB3, Banach–Colmez section and hypercohomology sheaves"; in `plan.json` set the gap's `section` to "VB3 Banach–Colmez section and hypercohomology sheaves" (the README's contract paragraph at line 57 names no section and needs no change). The object is supplied, so this is a locator, not an unowned prerequisite.

2. **F02** (P3) §9.1 excludes I={0} by its own hypothesis and then asserts that case

   Location: README line 1885, "let I be a compact interval in [0,1) with nonzero endpoints in |F×|. ... At I={0} this is the unramified Witt-field extension."

   Claim: the hypothesis and the I={0} assertion are compatible.

   Witness: {0} has no nonzero endpoint. FF17 Proposition 11.2.15 (line 14810) takes endpoints in `|F| ∩ [0,1[`, and its proof treats `I = {0}` first (line 14819–14820).

   Repair: write "with endpoints in |F| ∩ [0,1), the endpoint 0 allowed" (and the same phrase in §9.3, line 1915, "endpoints in the F-value group", which is read as allowing 0).

3. **F03** (P3) two Mathlib line numbers are off by one at the pin

   Location: README line 39, "`Mathlib/Analysis/Normed/Operator/Banach.lean` (lines 229 and 279)".

   Witness: at the pinned Mathlib (6b7abb3c) `ContinuousLinearMap.isOpenMap` is declared at line 228 and `exists_nonlinearRightInverse_of_surjective` at line 278; lines 229 and 279 are the second lines of those declarations. All other cited Mathlib and Tau Ceti lines were opened and are exact (list under Verified sound).

   Repair: "(lines 228 and 278)".

4. **F04** (P3) the SGA 1 citation of §10.3 had no manifest key and no References entry

   Location: README line 2012, "(FF17, Proposition 7.6.1, pp. 269–270, invoking SGA 1, Exposé V, Corollary 2.4; FF17 line 10861.)"; `sources.toml` and the README `## References` (line 2264) list FF17, KT16, Berger08, ST02, Poonen93 only.

   Witness: the round-1 review's manifest addition was not carried into the package. The sources service was used in this round to fetch SGA 1 (arXiv math/0206203v2, open repository) and it recorded key `SGA1` in `sources.toml`; Exposé V Corollaire 2.4 (SGA1 line 3853) states that for connected `X` with faithful `G`, `X → X/G` is étale iff all inertia groups are trivial, which is what §10.3 uses.

   Repair: add to `## References` the bullet "**SGA1:** A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, arXiv math/0206203v2, Exposé V, Corollaire 2.4." Nothing else changes; the manifest entry is already present.

5. **F05** (P3) three Checks of §2.5 test the same instance

   Location: README lines 733, 735, 736: "π has zero constant coefficient and is not primitive", "Primitivity includes a nonzero constant coefficient; π itself is not primitive", "The element π has zero constant coefficient and fails primitivity".

   Witness: one computed instance (`a_0 = 0` for `π`) appears three times; the definition keeps two discriminating Checks (`[c]−π` of degree 1; the product of two degree-one equations of degree 2, including `c=d`).

   Repair: delete the bullets at lines 733 and 735 and keep line 736, which already contains the `π` instance together with the degree-0 and degree-2 instances.

Reviewed at the head of pull request #1764 (commit 4ed8f9d, the repair commit of round 2); the board checkout was confirmed to be at that head before any file was read. Files reviewed: `packages/RelativeFarguesFontainePartII/README.md` (2270 lines), `Suggested.lean`, `metadata.toml`, `sources.toml`, and `design/plan.json` (its `gaps` list only). The round-1 review and its repair report were read first; every round-1 finding was checked at the current head before the adversarial pass.

## Round-1 findings: repair status

- **F01 (P1, seven ownerless gap records) — repaired.** `design/plan.json` now holds six `gaps`, each with `supplier`, `section` and `needs`; the README states six `gap:` contracts with the same six slugs (`perfectoid-quantitative-cochains`, `crystalline-pro-final-radius`, `lubin-tate-all-local-fields`, `positive-degree-two-obstruction`, `closed-infimal-convolution`, `finite-group-free-scheme-quotient`), one occurrence each. Each legacy record is now a local target: G-MATRIX in §8.9 (README line 1842: "a glueing square of complete Hausdorff Tate rings in the sense of AdicSpacesPartIII §R3.2 ... *matrix-factorisation-strict-surjection*, whose radius depends only on the strict surjection"); G-GENERATORS in §8.6 (line 1797); G-BOUNDARY in §9.5 (line 1951, two counterexamples stated separately); G-HOMOGENEITY in §11.5 (line 2208–2210, the automorphism-extension theorem with its route); G-EQUALCHAR in §§7.6 and 10.7 (lines 1644, 2090) plus the Lubin–Tate gap; G-COORDINATE in §1.9 (line 481); G-RADIUS in §9.4 (line 1934). The four R3.2 names cited in §8.9 exist on main: `TauCetiRoadmap/AdicSpacesPartIII/README.md` lines 9596 (*glueing-square*, conditions (a) strict exactness, (b) density of `R₂ → R₁₂`, (c) maximal ideals of `R` are contractions of primes of `R₁ × R₂`), 9670 (*matrix-factorisation-strict-surjection*, with `c` depending only on the strict surjection), 9696 (*glueing-square-finite-surjectivity*) and 10278 (*glueing-square-finite-projective-descent*). The §11.5 route was checked against Poonen93: Theorem 2 (line 395, p. 10) is exactly the relative embedding theorem used (a valued extension of a subfield of a Mal'cev–Neumann field with divisible value group and algebraically closed residue field embeds over that subfield); Corollaries 5–6 (lines 489 and 500, pp. 12–13) give the embedding into the Hahn field and uniqueness of the maximally complete immediate extension. The route's valuation computation on `𝔽̄_p(x)` (v_F(x) times the x-adic order, constants of valuation 0) and the immediate-extension closing step were recomputed and hold.
- **F02 (P1, duplicated arbitrary-algebra Witt functor) — repaired.** README line 117 now consumes "the ramified Witt functor W_OE(A) of VectorBundlesAndIsocrystals VB−1 on every O_E-algebra A in mixed characteristic". At the head of that roadmap (pull request #1205, "Ramified coefficient rings and coefficient changes") the functor is constructed "for any `𝒪_E`-algebra `A` ... including when the ghost map is not injective", with no finite truncations and no coefficient diagonal, so the two additions kept here (truncations `W_OE,n`, the diagonal Δ with ghost coordinates `(F^n x)`, FF17 line 2276, printed p. 55 as cited) are not duplicates. The duplicate extensionality API is gone (lines 121–123). The contract (line 53) and the `*Needs:*` lines of §§2.1, 2.3, 2.4 (lines 658, 698, 713) cite VB−1. Ownership move recorded: the later roadmap RelativeFarguesFontaine (merge-order position 143, head #1209) still defines `qTwistedWittFunctor` in its §0.11 (its line 339–341); ownership of the Q-twisted comparison sits in §0.1 here (position 140), and that later roadmap must import this section rather than build it again. That is not a defect of this package.
- **F03 (P1, Hahn description admitted infinite norms) — repaired.** §1.11 (line 511) now defines `B_I` as the supplied Gauss completion of `Bᵇ=A[1/π,1/T]` and proves the coefficient criterion "the threshold set S_(ρ,c) is well ordered and v_π(a_alpha) is bounded below on S_(ρ,c)". FF17 line 3536 prints only the well-ordering condition with integral coefficients. The repaired criterion was checked in both directions: necessity by the ultrametric transfer of coefficients from a Cauchy sequence in `Bᵇ` (a coefficient of value at least c agrees in norm with that of `x_m` once `|x − x_m|_ρ < c`), sufficiency by truncating to the finite union of endpoint threshold sets of a compact `J` (a well-ordered support with bounded-below exponents and valuations lies in `T^(−M)π^(−N)A`) and the log-convexity of term values in `ρ`. The five Checks compute correctly (table below). API and three further Checks were added as asked.
- **F04 (P1, field exception for closed maximal ideals) — repaired.** §5.3 line 1246: "the nonzero closed maximal ideals are exactly the ideals m_y" and "The zero ideal is maximal exactly when B_(F,I) is a field, which for I⊆(0,1) happens exactly when I={ρ} with ρ outside the divisible hull of |F×|". The "exactly" was tested: the divisible hull of a nontrivial subgroup of ℝ_(>0) is dense, so every nondegenerate interval in (0,1) contains a classical radius, and for ρ=|c|^(1/d) in the hull a degree-one geometric point of radius ρ has a finite Galois orbit and descends to `Y_F`. The witness Check (ℂ_p^♭, I={p^(−√2)}) is at line 1256; §8.9 covers the field case through the zero prime (line 1844, Check at line 1852).
- **F05 (P2, t ≠ 0 in the graded-fibre theorem) — repaired.** §6.11 line 1536: "Let t be a nonzero element of P_1 and y a degree-one point with div(t)=Σ_(n∈ℤ)[φ^n(y)]", matching FF17 Corollaire 6.4.3 (line 10306: `t ≠ 0`, `div(t) = Σ[φ^n(y)]`). The t=0 rejection Check (line 1546) computes `(cT)² = T·(πT)` with `c=√π ∉ E`, both factors in the target ring and non-associate since the units are `E×`. The normalisation `Pi_minus(a_i) ∈ A∖πA` matches FF17 Théorème 6.4.4 (line 10317); the Frobenius shift `g = φ(∏ Pi_minus(a_i))` is the correct repair of the unshifted printed product (the divisor of `Pi_minus` has translates `n<0` only, which was recomputed from `φ(x)=bx`). §6.10 (line 1521) and §10.8 (line 2105) now require nonzero `t`.
- **F06 (P3, process bullets) — repaired.** Neither sentence remains in the README (grep for both phrases: no match). The replacements compute: §8.6 line 1806 (a rank-one system `(a_D B_J)_J` on `(0,ρ]` whose compact generators vary with `J` while the global sections are free of rank one by §§5.3–5.4); §9.3 line 1925 (`σ(fe) = σ(f)[σ(c)/c]e` is fixed iff `f[c]` is invariant, so the descended module is `B_(F,I)[c]⁻¹e`; `[c]` is a unit of `Bᵇ_C` for every `c ∈ C×`).

No finding was marked "not actionable" in the repair report; nothing is re-raised.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`, no process narrative (the two round-1 process bullets are gone; a grep for "so far", "removed", "checkpoint", "handoff", pull-request numbers and job ids in the README finds none). All 109 numbered subsections were read; every layer ends with `### Examples` and `### Dependencies`; every definition carries an API list and at least three Checks except where noted in R05 (count, not content).

**Elaboration.** `lake env lean` on `packages/RelativeFarguesFontainePartII/Suggested.lean` from the content checkout: exit 0, the only output `declaration uses 'sorry'` at line 40 (about 7 s). No `TauCeti.*` import is used. A scratch copy with `#check @TauCetiRoadmap.RelativeFarguesFontainePartII.exists_strict_laurentClosure_endomorphism` elaborated; the displayed type keeps `p`, `[Fact (Nat.Prime p)]`, `[Field k]`, `[CharP k p]`, `[NormedField K]`, `[Algebra (LaurentSeries k) K]`, `[IsAlgClosure (LaurentSeries k) K]` and the `hvaluation` iff; it agrees with §11.2 (line 2147); no binder was lost. Padding probes on scratch copies: `simp` ("made no progress"), `rfl` (fails), `infer_instance` ("type class instance expected"), `exact?` ("could not close the goal"). The identity map is continuous and fixes `k` but is surjective, so it is not a witness. Nothing is padding; no deletion requested.

**Headline coverage.** The README's headline families are the 18 listed in the round-1 review (weighted Newton zeros, boundary units, primitive factorisation, closed ideals and half-open Bézout, orbit products, finite-jet fundamental sequence, Dedekind charts and the character class group, degree-one generation and the weighted curve, interval bundles, étale annuli and continuous descent, rational functions and covers, Frobenius lines, Runge reconstruction, the nonprincipal positive ideal, the strict endomorphism, the exotic untilt, weakly closed primes, valued-homogeneity orbits). One is stated on native carriers; the module docstring names the other 17 with the missing carrier of each (ramified interval rings, marked untilts, period eigenspaces, annular Banach algebras, the period curve, ...). Each named carrier was checked against the pins: Mathlib has only the p-typical `fontaineTheta`/`BDeRham` and no ramified interval ring; Tau Ceti has the topological `spaY`/`spaX` quotient without the structure sheaf. No statable headline is absent.

**Dependency check** (run from the board checkout with the merge order):

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Merge-order positions: SchemeAndStackFoundations 2, AdicSpacesPartIII 9, AdicEtaleGeometry 10, PerfectoidSpaces 12, DerivedDeRhamCohomology 20, CrystallineCohomology 21, LubinTateFormalModulesAndQuasiCanonicalLifts 53, LocallyAnalyticDistributions 76, PadicDifferentialEquationsAndRigidCohomology 134, PadicHodgeTheory 136, VectorBundlesAndIsocrystals 139, this roadmap 140, RelativeFarguesFontaine 143 (a consumer, cited only under Downstream consumers). AdicSpaces, AlgebraicVectorBundles, NewtonPolygons, OptimalTransport, SchemeAndStackFoundations, AdicSpacesPartIII, AdicEtaleGeometry and PerfectoidSpaces are on main. The citation resolver reported no cross-roadmap citation and no Lean name found nowhere.

**Supplier citations resolved this round** (section exists where cited): VB−1 "Ramified coefficient rings and coefficient changes", "Relative annuli and their section rings", "Marked untilt Cartier divisors and Cartier descent", "Completed local period rings", "Rank-one Frobenius twists", "Homogeneous section ring and partial schematic charts" (#1205 lines 92–201); VB1 "Annular Frobenius descent for bundles" (448), "Finite projective Frobenius modules and integral models" (485), "Slope-sensitive cohomology of standard bundles" (601), "Classical points and annular Dedekind rings" (621), "Regular noetherian geometric curve and PID complements" (661); VB2 classification (1061); VB3 "Lubin–Tate universal cover and sections of O(1)" (1215), "The fundamental untilt sequence and degree-one divisors" (1227); VB0 (223). PerfectoidSpaces P1.19–P1.22, P3.7, P3.11, P3.12 (main, lines 4727–8688). AdicEtaleGeometry A4.2a (main). SchemeAndStackFoundations §0.3 (551), §1.23 (3021). OptimalTransport Layer 5 (663). NewtonPolygons §§0.1–0.6 (211–320), §§2.1–2.3 (512–550). AdicSpaces §§6.1–6.4 (691–800). AlgebraicVectorBundles L0B affine finite-projective comparison (247). CrystallineCohomology CR.1.1 (#857 line 612). DerivedDeRhamCohomology PD.1–PD.7 (#868). LocallyAnalyticDistributions §0.0 (247), §0.2 (399) (#854). PadicDifferentialEquationsAndRigidCohomology RD.0.10, RD.0.18–RD.0.23, RD.0.54 (#1002). PadicHodgeTheory §§1.2–1.4 (#1062 lines 356–391). LubinTateFormalModulesAndQuasiCanonicalLifts LT.0/analytic-log, LT.1/lt-module, LT.2/tate-module-comparison (board package design README, a declared gap). AdicSpacesPartIII R3.2 names as in F01.

**Pinned declarations opened** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `WittVector.fontaineTheta` 165, `fontaineTheta_teichmuller` 182, `surjective_fontaineTheta` 195 (`FontaineTheta.lean`); `fontaineThetaInvertP` 62, `BDeRhamPlus` 75, `BDeRham` 88 (`BDeRham.lean`); `WittVector.Isocrystal` 113; `IsBezout` 65; `IsBezout.TFAE` 55 (with `[IsDomain R]`); `ContinuousLinearMap.isOpenMap` 228, `exists_nonlinearRightInverse_of_surjective` 278 (R03); `ApproximatesLinearOn.image_mem_nhds` 290; `LaurentSeries.valued` 502; `IsAlgClosure` 264; `KaehlerDifferential` 148, `.D` 226, `.linearMapEquivDerivation` 355; `TauCeti.AlgebraicGeometry.WeilDivisor` 45, `.ofPoint` 99, `.weightedDegree` 339; `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` 102; `TauCeti.FarguesFontaine.spaY` (`Y.lean` 116), `spaX` (`Quotient.lean` 56), `isOpenQuotientMap_quotientMap` (107).

**Ownership and duplication.** The board package index (19 packages) was read. Object searches over main and the open heads: "Kaplansky", "Mal'cev", "maximally complete" hit only Erdős–Kaplansky, Kaplansky density (operator algebras), a Mal'cev quotient, and DiamondSixOperations' use of Poonen93 Lemma 4/Theorem 1 for spherical completeness; no roadmap owns the embedding theorem of §11.5. "Fréchet–Stein" and "coadmissible" occur in no heading of any roadmap on main or at an open head, so §8.4 is the owner. Hahn-series period rings (§1.11) are owned nowhere else. The one declared name `exists_strict_laurentClosure_endomorphism` was found in no other `Suggested.lean` by the resolver. Ownership of the Q-twisted Witt comparison against RelativeFarguesFontaine §0.11 is recorded under F02.

**Declared gaps.** All six have a supplier earlier in the order, one `needs` sentence each with hypotheses, and the same slug in `plan.json` and the README. None asks for what is already provided: VB3 at its head has the sufficient positive-slope representability but no degree-two obstruction; CR.1.1 has the site, not the pro-final radius-ρ identification; LT.0–LT.2 retain finite-ℚ_p hypotheses; OptimalTransport Layer 5 has Fenchel–Moreau but no closed infimal-convolution law; SchemeAndStackFoundations §1.23 has coarse quotients without the free-torsor conclusion; PerfectoidSpaces P3 has qualitative almost purity without norm-controlled cochains. The acceptance is conditional on these six.

**Sources.** All five manifest texts plus SGA1 were read as line-numbered extractions. Seeded sample and repaired passages:

| Target | Text opened (theorem, printed page, line) | Outcome |
|---|---|---|
| 0.1 | FF17 Δ with ghosts `(F^n x)` after Lemma 1.2.3, p. 55, line 2276; Prop 1.2.7, p. 57, line 2337; §1.6.1, p. 68, line 2847 | Supported; p. 55 confirmed from the page markers |
| 0.2 | FF17 Lemma 1.4.2(3)–(5), pp. 61–62, lines 2562–2600; Frobenius formula line 2559 | `N_k` bounds and `v_r(φx)=q v_(r/q)(x)` as stated |
| 0.5 | FF17 §1.5.1–1.5.2, pp. 66–67, lines 2748–2800; Jensen line 2845 | Legendre sign, `L(φ1∗φ2)=L(φ1)+L(φ2)`, `Newt(xy)=Newt(x)∗Newt(y)` as stated |
| 1.4 | FF17 Prop 1.8.2 and Cor 1.8.3, pp. 85–86, lines 3559–3605 | Henselian field, completion `ℰ`, degree `[L:F]` |
| 1.8 | FF17 §1.7.2, pp. 80–81, lines 3335–3380 | `ρ̌=q^(−1/r)`, completed colimit; the r-th power is the package's correction |
| 1.11 | FF17 §1.7.5, p. 84, lines 3514–3536 | Printed condition is well-ordering with integral coefficients; repaired criterion is stronger and correct (F03) |
| 1.12 | FF17 §1.10.2, Def 1.10.11, pp. 92–93, lines 3850–3895 | `liminf q^n v(a_n)>0` and the `B⁺` embedding as stated |
| 1.15 | FF17 Def 1.10.14, Lemma 1.10.15, p. 95, lines 3965–3992 | `p`, `m`, local domain, residue `W_OE(k_F)[1/π]` verbatim in content |
| 2.5 | FF17 Def 2.2.1 and §2.2.1, p. 104, lines 4292–4312 | Degree, three equivalences, graded monoid, `Prim_0=A×` |
| 2.8 | FF17 Prop 2.3.2, Rem 2.3.3, pp. 115–116, lines 4742–4777 | Symmetry, ideal equality modulo `a_r`, equal-characteristic `v(a−b)` |
| 2.11 | FF17 Props 2.3.8–2.3.9, Def 2.3.11, Prop 2.3.12, Cor 2.3.13, pp. 117–120, lines 4842–4931 | `q/(q−1)` inequality and homeomorphism as stated; see Source issues for line 4865 |
| 2.12 | FF17 Lemma 2.3.14, Prop 2.3.16, p. 120, lines 4937–4959 | Normalisation `v_y/v_y(π)`; printed difference bound (line 4955) is the one the package replaces |
| 6.3 | FF17 Thm 6.2.1, p. 245, lines 9912–9919 | Graded factorial, free on `P_1∖0/E×` |
| 6.7 | FF17 Prop 6.2.10, Def 6.2.11, pp. 249–250, lines 10106–10131 | Dimension-one solution space, `A∖πA` normalisation, Artin–Schreier lifting |
| 6.11 | FF17 Cor 6.4.3, Thm 6.4.4, p. 254, lines 10306–10327 | `t≠0` and the orbit divisor required (F05); unshifted printed product |
| 7.2 | FF17 Prop 7.1.1, p. 262, lines 10574–10584 | Invariants, `H¹=0` for finite length, equivalence of finite modules |
| 8.10 | FF17 Thm 2.35, p. 26, lines 1129–1131 | Closed iff free, rank ≤ d, for the Fontaine rings; the general-F version is a local target |
| 9.1 | FF17 Prop 11.2.15, Rem 11.2.16, pp. 374–376, lines 14810–14818 | Endpoints in `|F|∩[0,1[`, `I={0}` allowed (R02); almost-étale trace inclusion |
| 9.5 | FF17 Rem 11.2.17, p. 376, lines 14900–14905; Rem 11.1.11, p. 366, lines 14468–14471 | Failure at `B_(0,1]=B⁺[1/[ϖ]]`; essential image = unramified `ρ_i` |
| 10.6 | FF17 §7.8, pp. 272–273, lines 10967–11001 | `deg=−v_π(λ)`, `Pic⁰≅Hom(G_F,E×)`, positive-line section algebra |
| 11.5 | FF17 Préface §1.4, p. 9, lines 459–469; Poonen93 Thm 2 p. 10 line 395, Cor 5 p. 12 line 489, Cor 6 p. 13 line 500 | Homogeneity qualified as stated; embedding theorem is Poonen's Theorem 2 |
| 10.3 | SGA1 Exp. V Cor 2.4, line 3853 | Étale iff trivial inertia for faithful `G` on connected `X` |

No locator flagged as unverified exists in the manifest (all `certified`).

**Computed adversarial table.** Rows cover the sample, the repaired passages, the headline, and every section the round-1 table summarised without values; "pass" means the computation agrees with the statement.

| Target | Instances and values | Result |
|---|---|---|
| 0.1 | `n_ρ(π)` at q=2, r=2: raw 1/4, normalised 1/2, radius 1 gives 1. Δ(π): ghosts (π, F(π)=π); wrong model `[π]` has second ghost `π^q ≠ π`. p=2, A=𝔽₂: `w_1=x_0²+2x_1` vanishes on (0,0,…) and (0,1,0,…). Length 0: zero ring; length 1: A | pass |
| 0.2 | `[a]π²·[b]π³` with |a|=1/2, |b|=1/4: index 5, norm ρ⁵/8; `N_1(πx)=N_0(x)=0`. q=2, v(a)=3, r=2: `v_r(φx)=6+4=10=2·v_1(x)=2·5` | pass |
| 0.3 | `|[ε]−1|_1`: all coordinates lie in `m_F` (reduction to `W(k_F)` kills it) yet multiplicativity with `[ε]−1=([ε^(1/p)]−1)·ξ`, `ξ` primitive of degree 1, and `|·|_1(φx)=|x|_1^p` force `c=c^p`, so `c=1`; sup not attained | pass; the supremum-not-maximum subtlety is why the Check is correct |
| 0.4 | `π−[a]`, v(a)=2: transform min(r,2), values 1, 2 at r=1, 3; `[a]π²`: 2+2r for r≥0, −∞ for r<0 | pass |
| 0.5 | slopes 2, 5: v₁=2, v₃=5, v₆=7, derivative drops 1 at 2 and at 5 | pass |
| 0.6 | `π+[a]`, |a|=q⁻², at ρ=q⁻¹: norm q⁻¹, nonzero; `B_{0}=W_OE(F)[1/π]` is the π-adic completion of `A[1/[ϖ]][1/π]` | pass |
| 0.7 | `(π−[a])²`, v(a)=2: `v_r=2min(r,2)`, left/right derivatives at 2 are 2 and 0, multiplicity 2; slopes are integers since vertices have integer abscissae | pass |
| 0.8 | min(5r, 11.2−3r) on [0.5,1.5]: 2.5, 6.7, max 7 at 1.4 | pass |
| 0.9 | `[a]π²`, v(a)=3: (3+2r, 2) and (3+2r, −2); on `π^n`: n and −n | pass |
| 0.10 | e=2, f=1, q=2: `|π|=|π′|²=1/4=(1/2)²`; `[E′:E]=2`; radii `I^(1/e)` since `π=uπ′^e` | pass |
| 1.1 | `π⁻¹+[a]`: lowest index −1, zero-endpoint norm q | pass |
| 1.2–1.3 | `π−[a]`, v(a)=2: polygon bounded left by 0 and below by 0; unit on an interval avoiding q⁻², nonunit on one containing it | pass |
| 1.4 | L=F: degree 1; unramified degree 2: degree 2 | pass |
| 1.5–1.6 | `v_(r′)(x) ≥ (r′/r)v_r(x)` for r′≤r holds termwise since `v_F(x_n)≥0`; `|π⁻¹|_1=1`, `[a]⁻¹` with v(a)=2 has height −2 | pass |
| 1.7 | `|T^(1/p)|=q^(−1/p)`, `|π|_(q^−r)=q^−r`; `ΣT^j` converges weakly | pass |
| 1.8 | q=2, r=2: `ρ̌=2^(−1/2)`; `‖X‖^2=1/2=|T|_ρ`, `‖π‖^2=1/4=|π|_ρ` | pass |
| 1.9 | p=2: thresholds 1/4 and 2^(−1/2); `[1+t]−1` has zeros at `φ^(−n)` of the ℂ_p untilt, raw radii `(p−1)/(e p^m)`, each with the e embeddings of a totally ramified E: e=2 faces (0,1),(2,1/2),(4,1/4), slopes 1/4, 1/8, lengths 2; slope sum `Σ(p−1)/p^m=1=v_F(t)` | pass |
| 1.10 | `u²v³`: 2r+3 = r(2+3/r); at r=2: 7 and 3.5 | pass |
| 1.11 | q=2, ρ=1/2: `|π⁻¹|=2`, `|T|=1/2`; `π^(−n²)T^n`: terms 2^(n²−n), v_π=−n² unbounded, excluded; `π^(−n)T^n`: terms 1, S=ℕ, v_π=−n unbounded, excluded; `T^(1−p^(−n))`: terms ≥1/q, infinite well-ordered set, in A; `Σπ^nT^(−n)`: terms (qρ)^n, in for ρ<1/q, at ρ=1/q support {0,−1,…} not well ordered | pass (F03) |
| 1.12 | n=−m, v=q^(2m): `q^(−m)v=q^m→∞`; v=m²: `q^(−m)m²→0`, interior terms `q^(−m²)ρ^(−m)→0` | pass |
| 1.13 | `2!` has p-valuation 1 at p=2 and 0 at p=3 | pass |
| 1.14 | rank-one trivial isocrystal: both invariant spaces contain 1; zero isocrystal: both 0 | pass |
| 1.15 | `[a]`, v(a)=2: in `p` and `m`; valuations 1/(n+1): infimum 0, in `m∖p`; an element with a unit coefficient is `π^(n_0)·unit` modulo a finite sum in `p`, so `barB` is local | pass |
| 2.1 | p=2, (1,−1,i,…): coordinatewise double (2,−2,…), (−2)²=4≠2 | pass |
| 2.2 | `S[ε]/ε²`: inverse Frobenius kills ε | pass |
| 2.4 | `θ([ϖ]_Q−π)=π−π=0` | pass |
| 2.5 | `[c]−π`: degree 1; `([c]−π)([d]−π)`: degree 2 also for c=d; `π`: `a_0=0`, not primitive; 1: degree 0 | pass (R05 is redundancy only) |
| 2.6 | `E=𝔽_q((π))`, `a=π−c`, `b=π²`: `(π+c)(π−c)+c²=π²`; `θ([ε])=1` for a root-of-unity system ε≠1 | pass |
| 2.7 | `y=(π−c)`, v(c)=2: `v_y(π)=2`, `|π|_y=q⁻²` versus `|π|_E=q⁻¹` | pass |
| 2.8 | `δ(y,y)=∞`, `d=0`; equal characteristic `δ=v(a−b)`; triple 2,3,2: 2≥min(3,2) | pass |
| 2.9 | bound `v_y(π)≤2`, `δ(y_n,y_m)≥n`: reductions agree modulo `a_3` for n≥3 | pass |
| 2.10 | `Q=2X+X²`: `u_ε=1+[(1+ε)^(1/2)]`; `v_(y_ε)(π)=(1−1/q)v(ε)`; q=2, v(ε)=4: norm 1/4, `πε=ε²` norm 1/8; `1/v` is ultrametric for the formal sum since `v(ε+_LT δ)≥min` | pass |
| 2.11 | unit multiple keeps the point; `ε↦πε`: `v_y(π)=2` becomes 2q; `C_y→C_(φ^k y)` scales the F-normalised valuation by `q^k` (checked on `[x]↦[x^(q^k)]`) | pass; see Source issues |
| 2.12 | f=1, δ>0: min(0,δ)=0 both sides; `0≥δ` false | pass |
| 2.13 | separable quadratic: 2 embeddings, 2 points, contracted degree 1; inseparable: not 2 | pass |
| 3.1–3.3 | `(π−[a])(π−[b])`: two degree-one factors; empty product unit; `y_a=(π−a)`, v(a)=2, `f=π+[b]`, v(b)=3: evaluation valuation 2 = `v_λ(f)` at λ=2, not a slope of f; `(π−[a])²`: multiplicity 2, then 1, then unit | pass |
| 3.4 | I={0}: `π^n` invertible; integral ring: (π) maximal; irrational singleton: field | pass |
| 3.5 | `1−[z]/π=(π−[z])/π`: one zero at |z|; error norms `|z_i|/ρ→0`; repeating a fixed z diverges | pass |
| 3.6–3.7 | order 2 point: coefficient 2; radii `q^(−n)`: locally finite, infinite support; `f=a_y²`, `g=a_y`: 2≥1 and `f/g=a_y`; reversed: pole | pass |
| 4.1–4.3 | L=F: trace identity; degree-p separable in characteristic p: `Tr(1)=0`; `|a|_ρ=1/4`, numerator 1/8: ratio difference 1/2 | pass |
| 4.4 | S₃ with a subgroup of order 2: 3 cosets; two-element orbit: degree 2 | pass |
| 4.5–4.7 | degree-2 point: `[K_y^♭:F]=2`, two conjugates, `A_F→O_(K_y)` not onto; d=2, `|a_0|=q⁻⁶`: radius q⁻³, polygon (0,6)–(2,0) slope 3; degree 3 order 2: jump 6 | pass |
| 4.8 | s=2⁻⁸, ρ=1/4: max(1/16, 1/64)=1/16 for d=1 and d=100 | pass |
| 4.9 | outer bound `|1−a/[a_0]|_ρ ≤ ρ/‖y‖` for a degree-d point: `|a_n|≤‖y‖^(d−n)` from the linear polygon gives `(ρ/‖y‖)^n ≤ ρ/‖y‖`; i=0 factor is 0; `1−h²=(1−h)(1+h)` majorant | pass |
| 5.1 | `|F×|=q^ℚ`, ρ=q^(−√2): field, Spm={(0)}; degree-two radius needs the divisible hull | pass |
| 5.2 | orders (2,1): order 1; (1,2): −1 | pass |
| 5.3 | ℂ_p^♭, I={p^(−√2)}: #Y=0, closed maximal ideals {(0)}, nonzero ones ∅; D=0↦B_I; value-group compact interval: `m_y≠0`, (0) not maximal | pass (F04) |
| 5.4–5.5 | min(2,3)=2 gives `a_y²`; `(f,0)=(f)`, `(0,0)=0`; `g_n=f/a_n`: unit on `B_(J_m)` for late n, not a global unit, union proper and dense | pass |
| 5.6–5.8 | `1/a_y`: order −1; `a_y⁻²·a_y²=1`; invariant constant lies in F | pass |
| 6.1 | q=2, h=1, d=1: `φ(x)=πx` forces `q v_0(x)=v_0(x)`, so `v_0=0`, inherited norm 1; d=0: E; d=−1: 0 | pass |
| 6.2 | `φ(u)π=uπ′` gives `φ(u^d x)=(π′)^d u^d x`; unramified degree 2: `φ′=φ²`, d↦2d | pass |
| 6.3 | degree 2: multiplicities (2) or (1,1); degree 0: empty product | pass |
| 6.4–6.5 | q=2, ρ=1/2: window (1/4,1/2]; weights 3+2=5 versus 2 representatives; `P₂` section: degree 2 | pass |
| 6.6 | `φ(Π₊)=π^dΠ₊/b` by index shift; `b=π−[a]`: first factors `(1−[a]/π)(1−[a^q]/π)`; convergence: `w∈W(m_F)` gives `|φ^n(w)/π^d|_ρ ≤ sup_k (|x_k|ρ^(k/q^n))^(q^n)/ρ^d → 0` | pass |
| 6.7–6.8 | b=1: solutions E, generator 1; `div(Π₋)` has n<0 from `div(φx)=div b+div x`; `φ(Π₊Π₋)=π^dΠ₊Π₋` | pass |
| 6.9 | `π^(−n)[π^n]_LT`: derivative `π^(−n)π^n=1` | pass |
| 6.10 | d=0: `0→E→E→0`; repeated point: `B_dR⁺/(ξ²)` length 2 | pass (F05) |
| 6.11 | t=0: `P/0P=P`, kernel `E·s_y≠0`; `(cT)²=T·(πT)`, c=√π, units E×; `y_2=φ^(−1)y_1`: sup coefficient 1 versus sum 2; `π·Π₋∈πA` rejected | pass (F05) |
| 7.1 | pole orders 2, 3: `ν(ab)=5`; remainder bound ≤3 allows equality | pass |
| 7.2–7.5 | jet order 0: zero module; `B_dR⁺/(ξ²)`: two graded pieces; V=0: `H⁰=H¹=0`; `χψ`, trivial ideal 1, `χχ⁻¹=1` | pass |
| 7.6–7.7 | `Sym⁰=E`; `X²+πX+π` derivative π≠0, `X²−π` derivative 0 in characteristic 2; `s/t`: 1−1=0 | pass |
| 8.1 | `{[a,c),[c,b]}`: finitely many compact pieces of `[a,c)` end below c; `[0,2/3],[1/3,1]`: overlap [1/3,2/3] | pass |
| 8.2–8.3 | ρ=1/4, 1/2: `|π|`=1/4, 1/2; `|π⁻¹|`=4, 2; `(1,2)↦−1`; I=J: diagonal kernel | pass |
| 8.4 | `A_n=K`, `M_n=K²`: limits K, K²; `K[ε]/ε²→K` not flat (length 1) | pass |
| 8.5–8.6 | rank 0: sections 0; trivial rank 2: `B_I²`, identity splitting; `(a_D B_J)_J` on (0,ρ]: compact generators change with J, global sections principal (§5.4) | pass (F06) |
| 8.7 | `O_y/(ξ^n)`: fibre dimension 1, length n; `O_y/(ξ)^(⊕n)`: fibre dimension n | pass |
| 8.8 | `(1+U)Z(1+V)Z⁻¹=1+U+ZVZ⁻¹+UZVZ⁻¹`; `Z=diag(T,T⁻¹)`: `E₂₁↦T⁻²E₂₁` | pass |
| 8.9 | rank 2 identity: `B_(I₁∪I₂)²`; rank 0: 0; irrational singleton: field, coverage by the zero prime; PID case: `m_y B_(I_1)` is a prime contracting to `m_y` by the divisor criterion; strictness from the Banach open mapping over the nontrivially normed E | pass (F01) |
| 8.10 | d=0: only 0; `aR` closed free of rank 1; the dense ideal of §5.5 not finite free | pass |
| 9.1–9.2 | L=F: rank 1; degree p: `Tr(1)=0`; I={0}: `σ(x_n)=x_n` | pass (R02 is wording) |
| 9.3 | `σ(fe)=σ(f)[σc/c]e`, fixed iff `f[c]` invariant; descended `B_(F,I)[c]⁻¹e`; e not fixed when `σc≠c`; `E₁₂E₂₁=E₁₁≠E₂₂` | pass (F06) |
| 9.4 | `|F×|=q^ℚ`, J={q^(−√2)}: no value-group subinterval; `[q^(−√2),q⁻¹]`: endpoint missed | pass |
| 9.5 | `z^p−z=t⁻¹`: totally ramified, cannot factor through `G_(k_F)`; regular representation has nontrivial inertia | pass |
| 10.1–10.3 | q=2, [1/4,1/2]: `1/4≤(1/2)²`; unramified degree 2: `φ²`; inseparable tensor has ε²=0; quadratic residue automorphism fixes the closed point, swaps embeddings | pass |
| 10.4 | inert tower: uniformiser order 1; quotient by its square length 2 while residue degree grows 2→4 | pass |
| 10.5–10.7 | `Φ(e)=π⁻¹e`: degree 1, dual −1, tensor 0; `Φ(e)=0` excluded; `Φ(e)=λ⁻¹e`: `φ(f)=λf`, degree `v_π(λ)`; Koszul `(−s,t)↦−ts+st=0` | pass |
| 10.8 | `π(L(εb^(−1/p^n))/L(ε))^(p^n)`: dominant `π/[b]`; reciprocal gives `π[b]`; at |b|=1/4 ratio 16 | pass |
| 11.1 | `β_j↓√2`: `v(h mod p)≤β_j` and `≥√2`, so `=√2∉ℚ` | pass |
| 11.2 | p=2: d₁=3, d₂=7, d₃=17, `d_(n+1)−2d_n=2n−1→∞`, `d_n/2^n→3`; identity map fails the third conjunct | pass; Lean type checked |
| 11.3–11.4 | closure of `ℚ̄_p` in ℂ_p is ℂ_p, in the strict untilt a proper copy; residues `F`, `k_F`, `W(k_F)[1/π]` of (π), m, `W(m_F)` | pass |
| 11.5 | x=t, y=t²: s=2, `v(σ(t^(1/2)))=1`; ℤ[1/p], p odd: 1/2 not admissible; valuation on `𝔽̄_p(x)` is `v_F(x)·ord_x` since distinct terms have distinct valuations; image maximally complete with group sℚ=ℚ, so F is immediate over it | pass (F01) |
| 11.6 | repeated point: length-2 jet, one-dimensional kernel; `λ≤1` false at 2 gives no converse | pass |

Worked examples 1–9 (README lines 2253–2261) were recomputed with the same values (derivatives 2, 1, 0 for slopes 2 and 5; `‖X‖^r=q⁻¹`; weighted degree 5; Koszul composite 0; exponent shift −2).

## Not verifiable

- The six declared gaps are contracts whose proofs do not exist yet; their statements and suppliers were checked, their eventual proofs were not.
- The general-perfect-field versions of FF17 Theorem 2.35 (§8.10), of the arbitrary-compact descent (§9.4) and of the uniform generation (§8.6) are proof obligations of this roadmap; the sources prove the special cases cited. The routes were checked for owned inputs, not certified.
- Ownership was checked against main, the 19 indexed board packages and the open heads reachable through the roadmap tools; nothing beyond those was searched.

## Source issues

- **Misprint** in FF17 at Préface §1.4, printed p. 9, line 465: the source says the automorphism group of a maximally complete tilt acts transitively on the maximal ideal; it should exclude zero, which every automorphism fixes; affects a stated result.
- **Misprint** in FF17 at §2.3.2 after Proposition 2.3.9, printed p. 118, line 4865: the source says `φ^k` induces an isometry of valued fields `(C_(y_ε1), v)→(C_(y_ε2), v)` when `ε2=π^k ε1`; with the F-normalised valuations of Proposition 2.3.2 the map multiplies valuations by `q^k` (it is an isometry only for the `v(π)=1` normalisation); affects nothing (the package states the `q^k` scaling).
- **Error** in FF17 at §1.7.5, printed p. 84, line 3536: the source says `B_I` is the set of Hahn families with integral Witt coefficients whose threshold sets are well ordered; it should allow `π⁻¹` and require bounded-below `v_π` on each threshold set; affects a stated result.
- **Error** in FF17 at Proposition 2.3.16 proof, printed p. 120, line 4955: the source says valuation differences are bounded below by the point distance; it should be equality of the valuations truncated at that distance (constants refute the printed bound); affects the proof.
- **Error** in FF17 at Théorème 6.4.4, printed p. 254, lines 10316–10318: the source says the unshifted product of the `Π₋(a_i)` generates the ideal of `x` with `φ^n(x)∈y_1⋯y_d` for all `n≥0`; it should be the Frobenius shift of that product, with orbit separation, since `div(Π₋)` omits the `n=0` translate; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4ed8f9d", "job": "REV-PKG-RelativeFarguesFontainePartII~2", "model": "fable", "worker": "fable-rev132"} -->
