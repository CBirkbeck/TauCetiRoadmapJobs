# Review of ComplexComparisonPartII (pull request #848 at d0ac71a)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder has no changed lines since then.

- **Checks.** The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly three `sorry` warnings. No statement closes with one tactic.
- **Carried findings.** The two blocking findings of the previous review are not repaired: R01 (DifferentialGeometry Layers 8–9) and R02 (two owners of the holomorphic exponential sequence).
- **New findings.** The full pass adds two P3 findings: an off-by-one between two numberings of the SNC punctured polydisc, and four README headline targets that the `Suggested.lean` docstring does not name.
- **Sources.** All 15 seeded sample targets agree with their sources at the stated locators, where the text can be read legally.

## R01 (P2) — DifferentialGeometry Layers 8–9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:544` ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."). The same layers are cited at :712–714 (Layer 8 `deRhamEquiv`, Layer 9 `finiteDimensional_deRhamCohomology`), at :2896 (*Needs:* "Layers 5, 8 and 9", `multiplicativePeriodInterface`) and at :3668 and :3680 ("DifferentialGeometry Layer 8's `deRhamEquiv`", rank-one curvature comparison in C5.4).

**Claim:** DifferentialGeometry Layers 8 and 9 supply the de Rham theorem and Poincaré duality.

**Witness:** This is true on main (`DifferentialGeometry/README.md:816`, :852, :862). At the head of #886 (a565de6) the layer headings are 0–5, 5.6 and 12 only. Its line 262 hands the de Rham theorem and duality to DeRhamCohomologyAndDuality, which sits at `ORDER.txt:395`, after this roadmap at :43. The overlap report lists the same dropped id. The pull-request description names neither DifferentialGeometry nor #886.

**Repair:** Leave the README as it is: its citations are correct against main, and no owner earlier in the merge order exists. `deRhamEquiv` occurs only in DifferentialGeometry on main and in DeRhamCohomologyAndDuality (#1768), and a *Needs:* edge to the latter would point upward. Add one sentence to the merge-order paragraph of the pull-request description, saying three things:

- the README consumes `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 8–9 as they stand on main;
- #886 removes those layers;
- before both merge, either #886 keeps the ids or gives an old → new map, or DeRhamCohomologyAndDuality moves ahead of this roadmap in the merge order.

This finding is carried unchanged from the previous review's R01; the head and the description are unchanged.

## R02 (P2) — The holomorphic exponential sequence and `Pic_hol ≅ H¹(O^×)` still have two owners

**Location:** `README.md:146`, the ownership row: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection …, the holomorphic exponential sequence …". Also :90–93 (scope), :3636 ("Prove the holomorphic exponential-sequence description here") and :4907–4909 (consumers K3Surfaces §1.1 and GeometricQuantization §3.3).

**Claim:** C5.4 is the single owner, on every complex manifold, of three things: the exponential sequence, the bijection onto `H¹(M,O_M^×)`, and the identification of the connecting map with the integral first Chern class.

**Witness:** At the head of #1234 (ComplexKahlerGeometry, a2c5e1c3), `ComplexKahlerGeometry/README.md:686–690` says K4.P owns, on every complex manifold, the holomorphic exponential sequence, `Pic_hol(M)≃H¹(M,𝒪×)` and the connecting-map identification. It also says K4.P supplies these to ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3, "which are its consumers"; :765–766 repeats the claim. Both consumers still cite this roadmap's C5.4: K3Surfaces (#1285, 9e7760f) at line 370 and GeometricQuantization (#1186, 663f762) at line 649. The pull-request description records no settlement.

**Repair:** Settle one owner, in one of two ways, and record the settlement.

- **Preferred:** the owner is the earlier roadmap, since ComplexKahlerGeometry is on main and earlier in the merge order.
  - Cite ComplexKahlerGeometry K4.P for the three items.
  - Keep in C5.4 only:
    - the identification of C1.9's `analyticPicardGroup` with K4.P's `Pic_hol` on manifolds;
    - the explicit `δu` cocycle;
    - the `O(±1)`, elliptic-curve and Enriques Checks, as Checks on the consumed map.
  - Rewrite :90–93, :146 and :4907–4909 to match.
  - Name #1234 in the merge-order paragraph of the description, because K4.P exists only at that head.
  - The test instance survives the move: #1234 line 692–694 fixes `c₁(O(−1))·[ℂP¹]=−1` as this README writes it.
- **Otherwise:** keep the target here, and add to the merge-order paragraph of the description that C5.4 owns these items and that #1234 must drop K4.P's ownership sentence and its consumers line before both merge.

This finding is carried unchanged from the previous review's R02.

## R03 (P3) — The punctured polydisc of `sncPolydiscChart` mixes 1-based and 0-based indices

**Location:** `README.md:1051`. The chart takes "the labelled boundary components to `z₁=0,…,z_b=0`", and the next sentence defines "the punctured polydisc using … the inequalities `z_i≠0` for `i<b`". The Checks at :1058–1059 say "`n=b=1` gives `Δ*`" and "`n=b=2` … gives `(Δ*)²`", and the proof at :1053 identifies the complement with `(Δ*)^b×Δ^(n−b)`.

**Claim:** The punctured polydisc is the complement of the `b` labelled hyperplanes.

**Witness:** With the 1-based coordinates `z₁,…,z_n` named in the same sentence, the condition `i<b` imposes `z_i≠0` only for `i=1,…,b−1`. For `n=b=1` there is no condition, so the set is `Δ`, not `Δ*`. For `n=b=2` the set is `Δ*×Δ`, not `(Δ*)²`. Both disagree with the README's own Checks.

**Repair:** Write "the inequalities `z_i≠0` for `1≤i≤b`". Alternatively, index from zero throughout (`z₀=0,…,z_{b−1}=0` and `i<b`). Tested on the refuting instances: `n=b=1` gives `{0<z₁ z̄₁<r₁²}=Δ*`, and `n=b=2` gives `(Δ*)²`, matching :1058–1059.

## R04 (P3) — The `Suggested.lean` docstring does not name four README headline targets among the unstatable ones

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/Suggested.lean:19–50`, the list of headline results that need objects absent from the pins. Its C6 bullet (:43–48) gives as its reason "the classical space of complex points of a general scheme, constructible étale coefficient categories and normalized adic systems". The headline table at `README.md:47–54` lists four targets that no bullet names:

- `sncPolydiscChart` (C-1.4);
- `fibreDimensionLoci` (C0.6);
- `holomorphicPoincare` (C5.1);
- `topologicalCoefficientComparison` (C6.1).

**Claim:** The module docstring names each unstatable headline and what it lacks.

**Witness:** `grep -i` of `Suggested.lean` for "SNC", "fibre-dimension", "Poincaré", "C6.1" and "C0.6" finds nothing. The only related phrase is "topological local-system carrier" at :46. The C6 bullet's reason does not cover C6.1: its local-system dictionary and sheaf/cochain comparison are stated at README :4377–4400 on arbitrary locally path-connected, semilocally simply connected or paracompact locally contractible spaces, with no scheme in sight.

**Repair:** Name each target in its layer's bullet, together with what it lacks:

- `sncPolydiscChart` and `snc_exists_polydiscChart`: the analytification of smooth schemes and SNC divisors.
- `fibreDimensionLoci`: complex analytic spaces and their fibre dimension.
- `holomorphicPoincare`: the sheaf of holomorphic forms on a complex manifold. The pins have only the smooth real forms behind `TauCeti.deRhamCohomology`.
- `topologicalCoefficientComparison`:
  - the direct local-coefficient cochain complex (the pinned `TauCeti.LocalCoefficientSystem.twistedCochainComplex` is Hom from twisted chains, as the README itself says at :351–353 and :579);
  - the c-soft compact-support theory;
  - finite triangulations of `T_X`.

## Previous findings

- **R01 — not repaired.** README :544 still reads "The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9." The description still names neither DifferentialGeometry nor #886, and #886's head is still a565de6 without Layers 8–9.
- **R02 — not repaired.** README :146 still says "C5.4 is the single owner, on every complex manifold, of … the holomorphic exponential sequence". `ComplexKahlerGeometry/README.md:686` at #1234's head still says "K4.P owns, on every complex manifold, the holomorphic exponential sequence". No settlement is recorded.
- R03–R05 of the review before were confirmed repaired by the previous review. I re-checked them on this unchanged head:
  - :1828 (base locally of finite type) and :1844 (proper `f` between schemes locally of finite type) are present;
  - :4678–4682 and the two `⊔`-Checks at :1851 and :4729–4732 are present;
  - the layer comments at `Suggested.lean:62` and :90 are present;
  - :440 has `d_c = d^c/(4π)`;
  - the Kleiman entry at :4982 is present.

## Verified sound

**Gate.** My run of the gate on this head printed the following and exited 0:

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate report on the same head also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. No `design/plan.json` is readable, so no gaps are declared, and none should have been.

**Dependency check.** The check with `--movable` printed, in full:

```text
depcheck: 244 roadmaps, 2469 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. No *Needs:* line names FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles, K3Surfaces, GeometricQuantization, DeRhamCohomologyAndDuality or MotivesAndAlgebraicCycles, all of which are later in `ORDER.txt`. They occur only as consumers.

**Lean (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**

- `lake env lean` on `Suggested.lean` gives exactly three `declaration uses sorry` warnings, at lines 67, 78 and 95, and nothing else.
- The one-tactic probe was run on a scratch copy, first with `first | rfl | simp | infer_instance | aesop | exact?` and then with `exact?` alone. All three statements fail: `simp` leaves goals for the first two, and `exact?` finds nothing for any of them. Nothing is padding.
- `#check @` of the three declarations agrees with the worker's signature file, and no binder is lost.
  - `montelTheorem`: an open set in a finite-dimensional complex normed space, a locally bounded sequence, and a locally uniform subsequential holomorphic limit (README C1.6, :1684).
  - `schwartzFiniteness`: complete metrizable Hausdorff locally convex complex spaces, a surjective `g` and a compact `h` (C1.6, :1709).
  - `nonempty_sheafSingularComparison`: Mathlib's `LocallyContractibleSpace`, an arbitrary `A` and `ULift ℤ` chains, in `Nonempty` form, as C5.1 at :2860 states.
- `LocallyContractibleSpace` is Mathlib's weakest notion (`Mathlib/Topology/Homotopy/LocallyContractible.lean:81`: a null-homotopic neighbourhood inside every neighbourhood). It implies Sella's semi-local contractibility (take the interior of that neighbourhood), which is the hypothesis of the theorem at `sella-comparison` lines 45–47. The docstring's "semilocally contractible" is that notion.
- Duplication checks at the pins:
  - The pinned `TauCeti.montel` (`TauCeti/Analysis/Complex/Conformal/Montel/Basic.lean:58`) is for `Ω ⊆ ℂ` only.
  - The pinned open-mapping theorems (`TauCeti/Topology/Algebra/OpenMapping/Henkel.lean:79`, `.../Complete.lean:116`) need a nonarchimedean source. So `montelTheorem` and `frechetOpenMapping` duplicate nothing.

**Library declarations resolved at the pins (121).** I elaborated a `#check` file for every dotted name in the README that is not a roadmap name: all 102 names of the Mathlib and Tau Ceti supplier contracts (README :476–666), plus 19 more from the body. Seven names failed on the first pass only because of a missing import or an omitted namespace, and all resolve once corrected. `SchemeWeilDivisor.orderAt`, `.sheaf`, `.toLineBundleClass` and `.globalSectionsEquivRiemannRochSpace` are in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/{Order,Sheaf,LineBundle,FunctionField}.lean`. `WeilDivisor.OrderSystem.ofScheme` is in `.../Scheme/Principal.lean:111`. `sheafPullback` and `sheafAdjunctionContinuous` are `CategoryTheory.Functor.*` in `Mathlib/CategoryTheory/Sites/Pullback.lean`. The citations file's lead on `TauCeti.Analysis.Fredholm.CompactPerturbation` is a false positive: the file exists and declares `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` at line 87.

**Seeded sample (15 targets), read at the locators.**

| Target | Locator in README | What the source says (my words) | Agrees |
| --- | --- | --- | --- |
| Riemann surface of a smooth curve (:1864) | SGA 1 XII Props 3.1–3.2, pp. 244–247 | `sga1` lines 9594–9608: étale, smooth and separated are detected on `f^an`; lines 9639–9648: so is proper (p. 245) | yes |
| Curve GAGA as named maps (:1912) | SGA 1 XII Th 4.4, pp. 249–250 | `sga1` line 9805: coherent analytification is an equivalence for proper `X` (p. 249), proof to p. 250 | yes |
| `IsDifferentialOperator` (:2725) | EGA IV₄ §16.7 pp. 36–39, §16.8 incl. 16.8.8, 16.8.9.2, pp. 39–44 | `ega4-4` line 1489: order ≤ n ⇔ every `D(a·)−aD` has order ≤ n−1 (p. 42); line 1526/1537: composition, p. 43; §16.7 from line 1259 (p. 36); §16.9 starts line 1616 (p. 46), matching References "pp. 39–46" | yes |
| `holomorphicConnectionDictionary` (:2933) | Deligne LNM 163, I.2.3–2.15 pp. 6–11, I.2.17–2.19 pp. 12–13 | `deligne-lnm163` lines 230–397 (pp. 6–11): connections, curvature, integrability; line 422: Th 2.17, local systems ⇔ integrable connections, tensor/Hom/dual compatible (p. 12); 2.19 at line 442 (p. 13) | yes |
| `artinDeRhamBetti` (:3171) | Deligne 1968, Lemma 5.5.3, (5.5.4), p. 124 | `deligne-lefschetz-1968` lines 689–701 (p. 124): relative de Rham complex over Artin `A` resolves the constant sheaf `A`, by the `m`-adic filtration; length formula | yes |
| `realComplexCurrentComparison` (:3435) | Demailly I (2.1)–(2.7) pp. 13–15; III (1.14)–(1.15) pp. 133–134; (1.21)–(1.24) pp. 135–136 | `demailly-agbook` line 599: `⟨dT,u⟩=(−1)^{q+1}⟨T,du⟩`; line 617: `d[Z]=(−1)^{m−p+1}[∂Z]` (p. 15); lines 6611/6671/6761/6781/6818 on pp. 133–136 | yes |
| `analyticSetLocalFiniteMass` (:3512) | Demailly III.2.5–2.6, p. 140 | `demailly-agbook` lines 6990–7000 (p. 140): `[A]` by integration over `A_reg`; Lelong's local finite mass | yes |
| Analytic cotangent and log differentials (:3768) | Freitag I.2 pp. 2–5, I.6 pp. 16–18, II.2 pp. 47–48; Deligne 1970 I.2.10–2.15, I.2.22; Kato §§1.7–1.9 | `freitag-complex-spaces` line 255 (Lemma 2.7, substitution, p. 5), line 695 (Lemma 6.2, p. 17), line 1802 (II.2, p. 47); `deligne-lnm163` line 474 (2.22, p. 14). Kato: not verifiable | yes (Kato open) |
| `complexAlgebraicTopology` (:4316) | Hironaka 1975; BCR 9.2.1; SGA 1 XII §§1–3 | SGA 1 part as above (`sga1` lines 9493–9648) | Hironaka/BCR not verifiable |
| `topologicalCoefficientComparison` (:4377) | Sella, Theorem and Lemma 0.1, pp. 2–4; Hatcher §3.H pp. 333–334; Dimca | `sella-comparison` lines 45–47, 69–116; `hatcher-at` line 14578 (direct local cochains, p. 333) | yes (Dimca not verifiable) |
| `artinComparison` (:4528) | SGA 4 XI 3.1, 3.3 p. 549; XI 4.4, 4.6 pp. 552–553; XVI 4.1 p. 638; Milne §21 pp. 130–134 | `sga4` lines 24606, 24629 (p. 549), 24767 (p. 552), 24818 (p. 553), 28350 (p. 638, `f` of finite type between schemes locally of finite type, cases proper / constructible); `milne-lec` lines 5007, 5094, 5142, 5154 (pp. 130–133) | yes |
| `IsIso` of the named unit (:4599) | SGA 4 XVI §4 | `sga4` lines 28345–28362: comparison morphism of the site morphism `ε` | yes |
| `relativeArtinComparison` (:4677) | SGA 4 XVI 4.1 p. 638; XVII 5.3.3, 5.3.4(i) pp. 704–705 | `sga4` line 31733 (5.3.3, p. 704: `ε*Rf_! → Rf^cl_! ε*` iso, via XVI 4.1(i) and way-out); line 31740 (5.3.4(i), p. 705); line 31745 (5.3.5, p. 705) | yes |
| `artinSmoothTrace` (:4742) | SGA 4 XVIII 2.8–2.10, 3.2.5 | `sga4` lines 37190 (2.8, trace on affine space), 37209 (Th 2.9), 37405 (Prop 2.10), 38315 (Th 3.2.5) | yes |
| `adicArtinComparison` (:4780) | Bhatt–Scholze §§5–6, esp. 6.5, 6.7–6.8 | `bhatt-scholze-proetale` lines 1882 (§5.5), 2294 (§6.5), 2579 (§6.7), 2757 (§6.8: ℤ_ℓ-, ℚ_ℓ-sheaves) | yes |

I also checked these locators outside the sample:

- Deligne 1970 I.2.20.3–2.21 (pp. 13–14), I.2.23 (pp. 14–17) and I.2.27–2.29 (pp. 19–21).
- Deligne 1968 (4.2) and Prop 4.3 (p. 120), Prop 5.3 (p. 121) and Th 5.5 (pp. 123–125).
- SGA 1 XII Props 2.1 and 2.4 and Lemma 2.5 (pp. 242–244), Cor 4.3 and Cor 4.5 (pp. 249–251), and Th 5.1 (p. 251).
- SGA 4 XVII Cor 5.3.5 (p. 705).
- Demailly III (2.1)–(2.3) (pp. 138–140).
- Sella Example 0.3 (p. 5), nestings (p. 6) and Steps 1–3 (pp. 7–19).

All agree.

**Adversarial pass (computed).**

| Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| `nonempty_sheafSingularComparison` | `T=∅`; point; `A=0`; Warsaw circle (not LC) | ∅: sheaf category trivial, `H^q=0` / cochains `Hom(0,A)=0`; point: `A,0,0,…` both; `A=0`: 0/0; Warsaw circle: Čech `H¹=ℤ` / singular `H¹=0`, so the hypothesis is needed and present | pass |
| `montelTheorem` | `Ω=∅`; `dim E=0`; `E=ℓ²`, `f_n=⟨·,e_n⟩` | ∅: vacuous; `Ω⊆{0}`: bounded `f_n(0)` has a convergent subsequence; `ℓ²`: sup on unit ball 1, pointwise limit 0, no locally uniform subsequence, so `FiniteDimensional` is needed and present | pass |
| `schwartzFiniteness` | `ℂ`, `g=id`, `h=−id`; `ℓ²`, `g=0`; `h=−id+diag(1/n)` | range 0, codim 1 (finite); `g` not surjective gives codim ∞; noncompact `h` gives `g+h=diag(1/n)` with dense non-closed range, so both hypotheses are used | pass |
| Riemann surface of `C` | `P¹`; `z↦z²` on `G_m` / `A¹`; nodal cubic; doubled origin | transition `z↦1/z` on `ℂ*`; derivative `2z≠0` on `ℂ*`, `=0` at 0; not smooth at node; non-Hausdorff `T_C` | pass |
| `functionFieldToMeromorphic`, divisor clause | `E: y²=x³−x`; `P¹`, `D=∞`; `E∖{∞}` | `ord_∞ x=−2`, `ord_∞ y=−3`; `y` is a parameter at `(0,0)` since `∂/∂x(y²−x³+x)=1`, so `ord x=2`, `div x=2(0,0)−2∞`, degree 0; `h⁰(O(∞))=2` (`a+bz`) vs `0` for the reversed sign; algebraic `Pic=E(ℂ)` vs trivial analytic Pic | pass |
| `IsDifferentialOperator`, principal parts | `[d/dz,z]`; `𝔽₂[z]`, `𝔽₃[z]`; `k[z]` | `=id`; coefficient of `t²` in `(z+t)²` is 1 while `(d/dz)²z²=2=0`; coefficient of `t³` in `(z+t)⁴` is `4z=z`; `P^m=A[t]/t^{m+1}`, composition `t↦t₁+t₂` | pass |
| `holomorphicConnectionDictionary` | `d+z dw`; gauge `g`; `g=h⁻¹`; `d+a dz/z` | curvature `dz∧dw`; `A+g⁻¹dg`; `hAh⁻¹+h d(h⁻¹)=Ad(h)A−(dh)h⁻¹`; horizontal `z^{−a}`, monodromy `exp(−2πia)` | pass |
| `artinDeRhamBetti` | `A=ℂ[ε]/ε²`, `X=P¹_A`; `A=ℂ` | `H⁰,H²` free of rank 1, length 2 = `lg(A)·1`; `H¹=0`; `A=ℂ` recovers `properDeRhamBetti` | pass |
| `realComplexCurrentComparison` | disc (`n=1,q=2`); segment (`q=1`); `δ_a` | `(−1)^{2−2+1}=−1`: `dJ₂[D]=−J₁[∂D]`; `(−1)^{2−1+1}=+1`: `J₀(δ_b−δ_a)`, which is Demailly's (2.7) with `m=2n`, `p=q`; `dJ₀=0` | pass |
| `analyticSetLocalFiniteMass` | `cg≤h≤Cg`, `2d`-volume; line in `ℂ²`; node | the volume density is a square root of a `2d×2d` determinant, giving `c^d μ_g≤μ_h≤C^d μ_g`; finite on compacts, infinite total; sum of two branch areas | pass |
| `AnalyticLogDifferentials` | `ℂ{z,ε}/ε²`; standard log point | relation `d(ε²)=2εdε`, so `Adz⊕(A/ε)dε`; relative to `ℂ[ε]`: `Adz`, `εdz≠0`; units killed by `u⊗u=0`, module `ℂ·dlog t`; relative to itself 0 | pass |
| `complexAlgebraicTopology` | `A¹`; `P¹` with 3 strata; nodal curve; doubled origin | contractible; `ℂ*` a union of open simplices but not a subcomplex; cone on two circles at the node; locally compact, non-Hausdorff | pass |
| `topologicalCoefficientComparison` | `𝔽₃`, monodromy `−1`; `𝔽₅`, transport 2; `(0,1)⊂[0,1]`; `ℤ/2` over `ℤ/4` | `H⁰={v:−v=v}=0`; dual transport `2⁻¹=3`; `H⁰_c=ker(Λ→Λ²)=0`, `H¹_c=coker=Λ`, `H¹((0,1))=0`; periodic resolution, not perfect | pass |
| `riemannExistence` | `z↦zⁿ` on `ℂ*`; `⊔_n G_m` with degree `n` on copy `n` | cyclic deck group `ℤ/n`; finite étale of unbounded degree, `n`-point fibres on component `n` | pass |
| `artinComparison`, named map | `G_m`, `μ_n`, `n≥3`; `Spec ℂ`, `ℤ/4`, `(ℤ/2)[0]` | Kummer class of `z` goes to the root torsor with transport `e^{2πi/n}`; the negated iso gives `e^{−2πi/n}≠e^{2πi/n}` (fails at `n=2`, hence `n≥3`); `Tor_i^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2` for all `i`, outside ctf | pass |
| `IsIso (etaleAnalyticUnit)` ⇔ affine-étale comparison | bounded-below cone `C` | if `RΓ(U,C)=0` for all affine étale `U`, the lowest `H^a(C)` has zero sections on a basis, so it is 0; induction | pass |
| `relativeArtinComparison` | `j:G_m↪A¹`, `μ_n`; `⊔_k` version; `⊕_x(i_x)_*Λ` on `A¹`/`P¹` | `(R¹j_*μ_n)_0≅ℤ/n`, `R^{≥2}=0`; `j` quasi-compact (a qc open meets finitely many components); étale `H⁰` finitely supported vs analytic `H⁰∋1_ℤ` (closed, discrete support): not surjective; on `P¹` both finite | pass |
| `artinSmoothTrace` | `A¹⊔A¹`, `n>1`; `P¹` | `H²_c=Λ²`, trace = addition, kernel `Λ≠0`; `Tr c₁(O(1))=1` | pass |
| `adicArtinComparison` | torsion integral object; `P¹` | `⊗ℚ_ℓ` gives 0 on both sides; `H²` of rank 1 | pass |
| `projectiveComplexGaga`, `properSchemeGagaPushforward` | `P¹_{A¹}`, `O(−2)`; `⊔_k A¹`; `Spec ℂ[ε]` | `h¹(O(−2))=h⁰(O)=1`, so `R¹=O_S`; componentwise iso; `ℂ[ε]` in degree 0 | pass |
| `AnalyticTwist`, `analyticTwistCohomology` | `P¹`, `k=1`; `r=1`, `k=−2,−3` | `h⁰(O(1))=2`; reversed factor gives `O(−1)` with `h⁰=0`; `h¹=binom(1,1)=1`, `binom(2,1)=2` (monomials `Z₀⁻¹Z₁⁻²`, `Z₀⁻²Z₁⁻¹`) | pass |
| C1.3 conventions | metric `e^{−zz̄}`; `ℂ²`, bidegrees `(0,1)`, `(2,1)` | `Θ=∂̄∂ log H=dz∧dz̄`; `dd^c=2i∂∂̄`, so `dd_c=(i/2π)∂∂̄`; `[iΘ,Λ]=p+q−n`: `−1`, `+1` | pass |
| `StronglyOneComplete` | polydisc; `ℂ^a×(ℂ*)^b` | `zz̄−Σlog(r_i²−z_i z̄_i)` is an exhaustion; for harmonic `u=log abs(w)`, `i∂∂̄u²=2i∂u∧∂̄u≥0`, and `u²→∞` at `w→0` | pass |
| `cartanSerreFiniteness` (Hausdorff needed) | two `P¹` glued along `P¹∖{0}` | Mayer–Vietoris: `ℂ⊕ℂ→O(ℂ)→H¹→0`, so `H¹=O(ℂ)/ℂ`, infinite | pass |
| `remmertProperImage`, `remmertSteinExtension` | `(x,y)↦(x,xy)`; points converging to 0 | image `{x≠0}∪{0}`, not closed; closure of a sequence not analytic at 0 | pass |
| `regularSingularDeRhamComparison` | trivial connection on `G_m`, lattices `z⁻¹ℂ{z}`/`ℂ{w}`; `zℂ{z}`; frame `z⁻¹` | `Ē=O(1)`, basis `(1,z⁻¹)`, `d(z⁻¹)=−z⁻¹dz/z`, matrix `diag(0,−1)`, `H⁰=H¹=ℂ`; `O(−1)`, hypercohomology 0; residues `(−1,+1)`, `d=−1`, acyclic | pass |
| `integralLineBundleChernClass` and exponential sequence (R02) | `O(±1)`; `O(p−q)` on `E`; Enriques `K`; `e^{−zz̄}`; `h'=e^φh` | `±` generator; `h⁰=0`, `δ=0`; torsion `c₁≠0`; `(i/π)∂∂̄log‖e‖=−(i/2π)dz∧dz̄`; curvature shifts by `−(i/2π)∂∂̄φ` | pass; owner R02 |
| `multiplicativePeriodInterface` (R01) | `G_m` | `∮dz/z=2πi`, lattice `ℚ·(2πi)⁻¹[dz/z]` | pass; ids R01 |
| `sncPolydiscChart` (R03) | `n=b=1`; `n=b=2` | with `z₁…z_b` and `i<b`: `Δ` / `Δ*×Δ` against the claimed `Δ*` / `(Δ*)²` | fails as written → R03 |

**Cross-roadmap citations resolved (copy named).**

- **Main (65930ba):**
  - EtaleCohomologyFoundations: G.1–G.3, F.0–F.4, 0.7, 0.8, 0.11. All 26 `VanishingCycles.*`/`ClassicalAlgebraic.*` names occur, e.g. `properBaseChange` at :508 and `properSupports` at :567.
  - EnhancedDerivedSheaves: §§0.1–0.4, E1.9 `perfect_proper_pushforward`; all six `ClassicalDerived.*` names occur.
  - SmoothBundlesConnections B1.5 and B6.1–B6.2.
  - CharacteristicClasses: C1.2a, C1.2b `cechSingularCWTypeComparison`, C1.5, and C4 items 1–2 (:1321–1340).
  - ComplexKahlerGeometry: K3.0, `ComponentwiseFiniteRankAssembly`, `BundleTest`, `BundleDistribution`, K5b.0, K6.0, K6.1.
  - RealAnalyticGeometry R3.1 and R3.2 item "0." (:734).
  - GeometricCurrents G1; Hyperfunctions HF3a.
  - AffineMorseLefschetz A4.1 `finite_semialgebraic_triangulation`.
  - SchemeAndStackFoundations: §2.1 `Sheaf.H.pullback`, `Sheaf.higherDirectImage`; §2.2 `leray_spectral_sequence`, `cech_to_cohomology`; §2.6; §2.18; §2.19–2.20 names; §4.12.
  - AlgebraicTopology: Stage 2 item 6 (local coefficient systems), Stage 6 item 1 (direct local-system cochains, :1011–1020), Stage 8.
  - AlgebraicVectorBundles L0C; DerivedModuleAlgebra `perfectInverseSystemEffectivity`.
  - ModularCurves §0B `FiniteFlatCommGroupScheme.cartierDual` and `cartierDualBaseChangeIso` (its `Suggested.lean:194`, :205).
  - Completed UniversalCovers, RealAlgebraicGeometry and HodgeStructures.
- **Open heads:**
  - AlgebraicModuliForArithmeticGeometry (#853, 4f0ad34): Layers 1–3, §2.3 `coherentDevissage`/`devissageViaChow`, §3.5 `ModuliDescent.coherentPresentationDescent`, §6.1 `common_etale_neighbourhood`, §7.4, §7.6.1, §7.7 (all seven `spaceDQCoh` names), §8.3 `ParameterFormalExports`, and `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison`.
  - DerivedDeRhamCohomology (#868, 2f774a9): Layer 2 §§2.1–2.19, including `DeRham.d_leibniz`.
  - CrystallineCohomology (#857, 5231bad): CR.1.3 and the 13 cited paragraph titles of CR.5:log-algebra.1–.4 and CR.5.1.
  - ResolutionOfSingularitiesCharacteristicZero (#1199, caddfb3): §§1.3, 6.2, 6.4.
  - All four are named in the description's merge-order paragraph.

**Ownership against open pull requests.**

- The overlap report's only dropped id is R01; no other pull request changes this roadmap, and no id here is defined only by an open revision. Of the closest roadmaps in vocabulary, #1234 is R02. #1398 (d4190f8) contains no exponential-sequence ownership claim. The tool search finds no other open head claiming the holomorphic exponential sequence.
- AlgebraicModuliForArithmeticGeometry (#853) line 144 hands C3.2a–C3.2g and complex GAGA to this roadmap, and its line 9409 cites C3.2f. So the Picard and coherent-stack targets have one owner.
- #196 (another author, 4bd7237) adds a roadmap `ComplexComparison` whose Layers 1–12 cover the same scheme analytification, triangulation, local systems, Riemann existence, analytic-to-étale site morphism and finite, compact-support and relative Artin comparison as C-1.1 and C6. It is not in `ORDER.txt`. Its declared direct dependencies are CohomologicalPointCounting/ConstructibleEtale, /EtaleBaseChange and /CompactSupport, members of a roadmap this one may never cite, so it cannot serve as an earlier owner. This roadmap is therefore the admissible owner. The README's explicit ownership sentences (:106–112 and :923–924) stand, and I raise no finding.

**Policy.** The README contains no LaTeX, `lemma`, pull-request number, round label or machine path; the gate scanners agree. I found no copied passage, executable algorithm, `set_option` or sorry'd data.

The seven texts read for the sample that the package manifest does not yet record are: `deligne-lnm163` (IAS institutional copy), `deligne-lefschetz-1968` (Numdam), `demailly-agbook` and `freitag-complex-spaces` (author pages), `sella-comparison` and `bhatt-scholze-proetale` (arXiv), and `milne-lec` (author page). This review edits no manifest.

## Not verifiable

- K. Kato, *Logarithmic structures of Fontaine–Illusie* (1989), §§1.7–1.9, pp. 195–196, cited in the analytic log-differentials target: the sources service found no legal copy (JHU Press volume).
- A. Dimca, *Sheaves in Topology* (2004), §§2.1–2.5, 3.2 and 4.1, cited in C6.1: the DOI resolves only to the paywalled Springer page.
- H. Hironaka, *Triangulations of algebraic sets* (PSPM 29, 1975), cited in C6.0: the AMS e-book landing page is not on an open host; no legal copy was found.
- Bochnak–Coste–Roy, *Real Algebraic Geometry*, Theorem 9.2.1, cited in C6.0: paywalled Springer book. The C6.0 statement is the standard compatible-triangulation theorem, and its noncompact extension is constructed in the target itself.
- Kleiman, published numbering "9.6.16" (:4982): the AMS chapter is paywalled; the arXiv locator (Theorem 6.16, pp. 58–59) was verified in the previous round.

## Source issues

- none
