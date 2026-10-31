# Review of FormalConnectionsOpers (pull request #1056 at 1aab7da)

**Verdict:** accepted

Gate at this head: every check passed (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`). My own dependency check on this README prints `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. No P1 or P2 finding remains; the five findings below are P3 notes for the author to take or leave.

**Status of the previous review's findings (892f8d5).**

- R01 (§2.2 re-planned ComplexComparisonPartII C5.1): repaired. README lines 580–591 ("Consume ComplexComparisonPartII C5.1's characteristic-free algebraic interface … Nothing of that interface is defined again here") keep only symbols, the Atiyah sequence and Lie–Rinehart PBW, exactly what C5.1 leaves to F2.2 at the head of its pull request (`TauCetiRoadmap/ComplexComparisonPartII/README.md` lines 149 and 2393–2397: "it retains symbols, the Atiyah sequence and Lie–Rinehart PBW on top of them"). The Scope bullet (lines 47–56), the supplier contract (lines 290–303) and the Layer 2 stage order (lines 866–869) now put C5.1 below §2.2; the `PrincipalParts` section, its five names and the Summary's principal-parts end theorem are gone from `Suggested.lean` and the README.
- R02 (cyclic-vector headline absent from `Suggested.lean`): repaired. `Suggested.lean` lines 140–165 state `IsDifferentialModuleMap` and `exists_cyclicVector` on Mathlib's `Differential F`; the docstring lists F6.2 under "Stated here" (lines 21–24); §6.2 names both (README lines 1850–1852, 1868–1873).
- R03 (source-cache line numbers as locators): repaired. No "<id> line N" fragment remains (grep for `line [0-9]`/`lines [0-9]` finds nothing); Iwahori–Matsumoto is cited by Proposition 2.34 (iii) with both subgroups `G(ℂ[[t]])` and the extension to reductive `G` is a target (lines 1217–1227).
- R04 (Layer 3A needing Layer 6): repaired by the first option. §3A.5 (lines 1196–1260) now owns the loop Grassmannian, affine flags, lattice charts, Cartan and Iwahori–Bruhat decompositions; §6.3 consumes "§3A.5's loop Grassmannian and affine flag ind-schemes" (line 1903); Layer 3A's Dependencies read "Nothing from Layer 6" (line 1332) and Layer 6's "including §3A.5's loop Grassmannian" (line 2042).
- R05 (wrong series in §3A.2): repaired, line 1116 reads `t⁻¹ + 1 + t + t² + ⋯`.
- R06 (wrong annihilator in §1.3): repaired, lines 512–514 name the constant-term pairing and give `t V^∨[[t]]`.
- R07 (PadicDifferentialEquationsAndRigidCohomology bullet): repaired, lines 2451–2455 state the fact about this roadmap and that the later roadmap "is to import §6.2". The move of the cyclic-vector theorem down from that roadmap's §§RD.1.2–RD.1.7 stands as recorded in the previous report.

## R01 (P3) — §3A.5 Check names a lattice the upper bound already excludes

Location: README lines 1254–1257: "a chart without the lower bound `t^N R[[t]]^n ⊂ L` would contain `t^(−k)ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` for every `k` and not be of finite type".

Claim: dropping the lower bound admits the lattices `t^(−k)O e₂ ⊕ O e₁` for all `k`.

Witness: with the upper bound `L ⊂ t^(−N)O²` kept, `t^(−k)O e₂ ⊕ O e₁ ⊄ t^(−N)O²` for `k > N`, so these lattices are excluded whether or not the lower bound is imposed. What the lower bound excludes is `t^k O e₂ ⊕ O e₁ ⊂ O²` for `k > N`, whose colength `k` in `O²` is unbounded; that is the family that makes the chart fail to be of finite type.

Repair: write `t^k ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` (sublattices of `O²` of unbounded colength) in place of `t^(−k)ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁`.

## R02 (P3) — §3A.3 needs §4.3, a target of a later layer, and Layer 3A's Dependencies omit Layer 4

Location: README lines 1142–1143 ("Compare `Y` with the compact exponential kernel of §4.3 by `λ ↦ dλ(2πi)`"), line 1160 (`*Needs:* … §4.3 for the compact comparison`), lines 1331–1332 (Layer 3A Dependencies: "Layers 1–3 …").

Claim: Layer 3A is built before Layer 4 ("How to read the build", lines 370–375; §3A.7, lines 1314–1317).

Witness: a DFS over every `*Needs:*` line (40 targets, 164 edges) finds no target-level cycle; the only need that points into a later layer outside a layer's own declared internal order is §3A.3 → §4.3. §4.3's compact-form part (lines 1487–1492) already constructs the algebraic torus `T` from `T_K` and its integral character lattice, so the comparison `λ ↦ dλ(2πi)` of `Y = X_*(T)` with `ker(exp|_(Lie T_K))` belongs there.

Repair: move the sentence at lines 1142–1143 into §4.3's "Compact form and matched torus" paragraph, after "`Lie(T) = Lie(T_K) ⊗_ℝ ℂ`", and delete "§4.3 for the compact comparison" from §3A.3's `*Needs:*` line. Otherwise add Layer 4 to Layer 3A's Dependencies and say that §3A.3's last comparison is built after §4.3.

## R03 (P3) — §2.2 Check writes the second jet coefficient as `f″/2` and then evaluates it in characteristic 2

Location: README lines 637–639: "`P²(A) = A[ξ]/(ξ³)`, where `1 ⊗ f = f + f′ξ + (f″/2)ξ²`, sends `1 ↦ 0`, `ξ ↦ 0`, `ξ² ↦ 2`: its symbol is nonzero in characteristic `≠ 2` and zero in characteristic `2`".

Claim: the displayed jet formula and the value `ξ² ↦ 2` hold in every characteristic.

Witness: `1 ⊗ x^n = (x + ξ)^n = Σ_k C(n,k) x^(n−k) ξ^k`, so the `ξ²` coefficient is the Hasse derivative `C(n,2) x^(n−2)` (C5.1's own Check, `TauCetiRoadmap/ComplexComparisonPartII/README.md` lines 2436–2440), which equals `f″/2` only when `2` is invertible; over `𝔽₂[x]` it sends `x²` to `1` while `f″ = 0`. The conclusion is right in both cases: the factorization of `D = (d/dx)²` sends `ξ² ↦ 2` because `D(x^n) = n(n−1)x^(n−2) = 2·C(n,2)x^(n−2)`, which is `0` in characteristic `2`.

Repair: write the jet as `1 ⊗ f = f + f′ξ + f^[2] ξ²` with `f^[2]` the second Hasse derivative (`x^n ↦ C(n,2) x^(n−2)`), and keep `ξ² ↦ 2`.

## R04 (P3) — A named declaration of `Suggested.lean` is not named in the README

Location: `Suggested.lean` lines 86–88 (`local instance (priority := high) laurentSeriesCoefficientAlgebra`); README lines 168–172 ("`Suggested.lean` selects the coefficientwise `HahnSeries.instAlgebra` by a local instance").

Claim: every Lean name of the file appears in the README.

Witness: `laurentSeriesCoefficientAlgebra` occurs nowhere in `README.md` (grep); the other eight declarations do.

Repair: name it in that Mathlib bullet: "by the local instance `laurentSeriesCoefficientAlgebra`".

## R05 (P3) — §6.4 Check gives the gauge of `exp(t⁻³x)` with the wrong sign

Location: README lines 1997–1999: "but not the flag of `exp(t⁻³x)` for `x ∈ 𝔫`, whose gauge `3t⁻⁴x` has order `−4`".

Claim: the relevant gauge of the point `g = exp(t⁻³x)` is `3t⁻⁴x`.

Witness: §6.4 tests `gauge(g⁻¹, A)`; with `h = g⁻¹ = exp(−t⁻³x)`, `h′h⁻¹ = 3t⁻⁴x`, so `gauge(h, 0) = −h′h⁻¹ = −3t⁻⁴x`. The order `−4 < −2` and the conclusion are unaffected.

Repair: write `−3t⁻⁴x`.

## Verified sound

**Gate and direction.** Worker's gate at 1aab7da: every check passed. Dependency check run here: `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)`. Merge-order positions in `ORDER.txt` (367 lines): KacMoody 2, SmoothBundlesConnections 7, CrystallineCohomology 19, ComplexComparisonPartII 38, FormalConnectionsOpers 39, PadicDifferentialEquationsAndRigidCohomology 105, GeometricSatakeAndFusion 115, EndoscopicTransferAndUnitaryTraceComparison 132, GlobalShtukasAndFunctionFieldLanglands 332, SheafTheoreticSmithTheory 333. Every other cited supplier is on main (ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations, AlgebraicVectorBundles, ComplexKahlerGeometry, ComplexManifolds, SmoothBundlesConnections, LieGroups, LieHighestWeight, CharacteristicClasses, AffineMorseLefschetz, ProfiniteCohomology, RootSystems, FormalLaurentPuiseux) or under `Completed/` (AnalyticToricGeometry). Target-level DFS over the 39 `*Needs:*` lines: no cycle; the only cross-layer forward need is R02; §6.1's needs of §§6.2–6.5 follow Layer 6's declared internal order (line 2044–2046).

**Lean.** `lake env lean TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean`: three `declaration uses sorry` warnings (lines 70, 129, 159), nothing else. Imports `Mathlib`, `TauCeti.Algebra.AlgebraicGroup.PointsFunctor`, `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic`; no `set_option`, no sorry'd data, `theorem` only, one module docstring, section comments in README order. A scratch copy with `#check @name` for all nine declarations elaborated once: every elaborated type carries every binder of its README statement (`[Algebra ℚ R]` on `regularGauge_constantCoeff_bijective`; `reductiveCommHopfAlgProperty ℂ H` on the factorization; `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]` and `IsDifferentialModuleMap F D` on `exists_cyclicVector`); the worker's `signatures.md` agrees; nothing changed. `Differential` at the pin (`Mathlib/RingTheory/Derivation/DifferentialRing.lean` line 21) is a `Derivation ℤ R R` with the scoped `′` notation (line 26), so the Lean hypothesis is "a derivation `∂ ≠ 0`" as the README says, and `F` a field makes it a differential field. One-tactic probes on scratch copies: `first | rfl | simp | infer_instance | decide | (intros; simp_all) | exact?`, then `aesop` and `exact?` separately on each of the three theorems: all fail (`aesop` "made no progress" on the gauge bijection; `exact?` "could not close the goal" on the factorization and on the cyclic-vector theorem, also after `simp_all`). No padding. Grep of the pinned Mathlib for `cyclic vector`, `cyclicVector`, `DifferentialModule`, `IsDifferentialModule`: only an unrelated hit in `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`; the theorem is not at the pin.

**Pinned declarations opened** (worktree manifest). Tau Ceti: `zHat` (abbrev, `ZHat/Basic.lean` line 66), `gen` (89), `hom_ext` (125), `lift` (140), `lift_gen` (154), `lift_unique` (158), `liftEquiv` (170); `cohomologicalDimensionAt_le_one`, `cohomologicalDimensionAt_eq_one`, `cohomologicalDimension_eq_one` (`ZHat/CohomologicalDimension.lean`); `TauCeti.AlgHom.mapValue` (`FunctorOfPoints.lean`, type `(A →ₐ[R] B) → WithConv (H →ₐ[R] A) →* WithConv (H →ₐ[R] B)` as `#check` printed); `reductiveCommHopfAlgProperty : ObjectProperty (FiniteTypeCommHopfAlgCat k)`; `regularAffinePointHomeomorph`, `coneChartEquiv` (`Geometry/Toric/Analytic/RegularChart.lean`); `chartedSpaceOfIsOpenEmbedding`, `isManifold_chartedSpaceOfIsOpenEmbedding` (`Geometry/Manifold/Gluing.lean`); `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker`; `CounitAlgebra`; `ProjectiveGeneralLinear`. Mathlib: `HahnSeries.instAlgebra` and `HahnSeries.powerSeriesAlgebra` (`#check` output above; the latter takes `[Algebra S (PowerSeries R)]`, i.e. routes through `R[[t]]` as the README says), `HahnSeries.ofPowerSeriesAlg`, `LaurentPolynomial.eval₂_C`, `Matrix.GeneralLinearGroup.map`, `exists_span_eq_top_isStandardSmooth` (`RingTheory/Smooth/StandardSmoothOfFree.lean`), `exists_isStandardEtale_mvPolynomial` (`RingTheory/Unramified/…`), `secondCountableTopology_of_countable_cover` (`Topology/Bases.lean`), the three `MvPolynomial` Nullstellensatz lemmas (`RingTheory/Nullstellensatz.lean`, `AlgebraicGeometry/…`), `exist_openSubgroup_sub_clopen_nhds_of_one`, `exist_openNormalSubgroup_sub_open_nhds_of_one`, `nhds_basis_clopen`, `LieRinehartAlgebra` (class), `GroupLieAlgebra`, `LeftInvariantDerivation`, `mlieBracket`, `Matrix.exp` (`Analysis/Normed/Algebra/MatrixExponential.lean`), `linftyOpNormedAlgebra`, `HahnModule` (`RingTheory/HahnSeries/Multiplication.lean`).

**Sources read at their locators** (cache ids as in the previous rounds). Frenkel, *Langlands correspondence for loop groups* (printed page = PDF page − 14): §§3.5.3–3.5.4 pp. 91–92 (`Aut(O) = ℂˣ ⋉ Aut⁺(O)`, `Der⁺ = t²ℂ[[t]]∂`); §3.5.7 p. 96, the action on `λ`-forms `ε f′ + λ ε′ f`, and p. 97, the two square roots giving canonically identified operator spaces; §4.1.2 p. 103 (`PGL₂`-opers); §4.2.1 pp. 108–109 (adjoint simple `G`; the reductive extension is this roadmap's); §4.2.2 (4.2-1) and (4.2-2) with the `H[[t]]` normalization; §4.2.4 pp. 112–113 with Lemma 4.2.2 (free `N[[t]]` action, unique `exp(ad U)` representative); §4.2.5 pp. 116–117, (4.2-13)–(4.2-14), operators `∂^n − u₁∂^(n−2) + ⋯` from `Ω^(−(n−1)/2)` to `Ω^((n+1)/2)`; §8.2.1 pp. 233–234 (Miura opers), Proposition 8.2.2, (8.2-7)–(8.2-8) and Proposition 8.2.3 (image of `Fun Op` = intersection of screening kernels); §8.3.2 pp. 246–247 (`Conn` as the level-one hyperplane, `N((t))` moment map, free action "in the same way as in the proof of Lemma 4.2.2", Lemma 8.3.2); §1.2.6 pp. 17–18; Conjecture 10.1.1 p. 310. Frenkel–Gaitsgory: §4.1 (triples `(χ, χ′, φ)`, equivalence `g₂ = g′g₁g` with `∇₁ = Ad_g∇₂`, `∇′₂ = Ad_{g′}∇′₁`, composition `φ′∘φ`), Proposition 4.1.1 and its proof via surjectivity onto `(𝔤/𝔟)((t))dt`, (4.2)–(4.4), §4.3 Lemmas 4.3.1–4.3.2 with the moment map to `(𝔤/𝔟) ⊗ ω` and (4.7), §4.4 Lemma 4.4.1 (co-isotropic, with the discrete locally projective normal bundle assumption) and Lemma 4.4.2 (`Op^reg ×_{pt/G} Op^reg`). Frenkel–Zhu: Theorem 1 (surjectivity of `Op → Loc`); Remark 1 (`GL_n` = cyclic vectors, Deligne pp. 42–43); §2 (`r < −1`, `A_r` nilpotent, possibly zero); Theorem 4 (`A_r` nilpotent, `r ≤ −2`); `X_A = {g : Ad_{g⁻¹}(Ã) − t^(−r) dlog(g⁻¹) ∈ Lie I}/I`, which is §6.4's "order `≥ r` with leading term in the Borel"; §5 Lemma 10 with `r ≤ −1`, the `r ≤ −2`, `I′ ⋊ Aut⁺` stage and the `𝔾_a`/`ℙ¹` involution from Kazhdan–Lusztig 1980 §2. Deligne, LNM 163 (printed = PDF − 3): Lemme II.1.3 pp. 42–43, hypotheses `K` of characteristic `0` and `t` with `dt ≠ 0`, the `e + λ t^k f` exterior-product argument; the companion matrix of a cyclic vector p. 50. Katz: Theorems 1–2 pp. 65–66 (`(n−1)!` invertible, `#k > n(n−1)`, one of the `1 + n(n−1)` translates cyclic Zariski-locally). Steinberg: Theorem 1.9 (perfect `k`, `dim k ≤ 1` ⇒ `H¹(k, G) = 0` for connected linear `G`). Iwahori–Matsumoto: the group is the Chevalley group of a complex semisimple Lie algebra over a field with a nontrivial discrete valuation, residue field not assumed finite, torus `Hom(P_r, K*)` on the root lattice (pp. 2 and 27–28); §1 Proposition 1.15 and Corollary 1.16 (defining relations of the affine Weyl group); Theorem 2.16 (`G = ⊔_{σ ∈ W̃} B ω(σ) B`, p. 36); Propositions 2.33–2.34, (iii) giving `G = ⊔ H₁ ω(σ) H₂` over `W₁\W̃/W₂` (p. 39). Česnavičius: Example 15 (every split semisimple group is totally isotropic), Theorem 16 (= ČF Theorem 4.2), Theorem 17, Theorem 19 (`G(A((t))) = G(A[t,t⁻¹]) G(A[[t]])` for `G_ad` totally isotropic). Česnavičius–Fedorov: Theorem 4.2 with the diagonal-section and degree-`d` pullback steps that §3A.2 restates. Stacks 09CI (order by iterated commutators), 09CK (universal `P^k`), 0H90 (`P^k = (S ⊗ M)/J^(k+1)`, jet `1 ⊗ m`).

**Cross-roadmap citations resolved at the current main or head.** ComplexComparisonPartII (#848): C−1.1 `complexSchemeAnalytification` (line 774; line 794 names F2.4 as consumer), C0.3 `holomorphicBundleDictionary` (1019–1021), C0.4 (1070), C5.1 (2336, the shared interface at 2392–2425 with F2.2 as consumer and "symbols, the Atiyah sequence and Lie–Rinehart PBW" retained by F2.2), `DifferentialOperatorAnalytification` (2442), C5.2 `holomorphicConnectionDictionary` (2598), line 2617 on F2.4's curve specialization. CrystallineCohomology (#857): CR.1.3 (line 1121) with the ordinary connection carrier, Leibniz, base linearity, tensor symmetry, curvature, tensor, Hom/dual and base change (1255–1300); lines 131–134, 1272 and 11535 name this roadmap as consumer. KacMoody (#1124) lines 15 and 153: consumer of F3A only. On main: LieGroups Layer 0 (`lieExp`, lines 233–259), Layer 6 (383–406), Layer 7 (407–425); LieHighestWeight Layer 7 names at lines 981, 989–997, 1066–1067; ReductiveGroups Layer 6B (613–624, naming this roadmap as consumer of the coset-affineness theorem) and Layer 11 (1959–1964, consuming F4.3), Layer 3A Cartier smoothness (261); ReductiveGroupsPartII RG2.5.1 (6724); SchemeAndStackFoundations §1.1 (2071), §§1.14–1.18 (2458–2745); AffineMorseLefschetz A4 (208); ProfiniteCohomology Layer 1 (630) and Layer 11 (1739); FormalLaurentPuiseux L1, L2, L3, L7 (70, 112, 140, 315, with `TauCeti.zHat`); CharacteristicClasses C5.1 (1062–1078); ComplexManifolds Milestones 1, 2, 7 (172, 197, 319); ComplexKahlerGeometry K1, K3, K4 (96, 296, 444); SmoothBundlesConnections B3–B4 (871–979); AnalyticToricGeometry (Completed) `regularAffinePointHomeomorph`, `coneChartedSpace`, `Fan.analyticRealization`, `AffineSemigroupComplexPoint` (282–376). Consumers: AffineLieAlgebras (55, 59, 449), NilpotentOrbits (60, 63, 313), GeometricRepresentationCategories (47, 64), SchubertGeometry (111), ComplexKahlerGeometry (475). PadicDifferentialEquationsAndRigidCohomology (#1002, position 105) still states the cyclic-vector theorem as its own; the move recorded in the previous report stands and is the intake's to reconcile. Two notes for the intake that are not this folder's text: ReductiveGroups line 623 says "FormalConnectionsOpers F6 consumes" the coset-affineness theorem, which now sits in §3A.5; NilpotentOrbits and KacMoody link the old `#f2-…`, `#f4-…`, `#f3a-…` fragments.

**Ownership by object** against main and the open pull requests whose files this brief gives. Loop Grassmannian, affine flag variety, lattice charts, Cartan and Iwahori–Bruhat decompositions over `ℂ`: no roadmap on main builds them (the only Schubert cells on main are the finite ones of LieGroups line 435, SchubertGeometry and TopologicalKTheory). EndoscopicTransferAndUnitaryTraceComparison §3.2 (position 132) builds the equal-characteristic `LG/L⁺G` over `k((ε))` with `k` finite or its closure, and GlobalShtukasAndFunctionFieldLanglands (332) and SheafTheoreticSmithTheory (333) consume that one; GeometricSatakeAndFusion (115) and BunGAndNewtonStrata build the Witt-vector and `B_dR⁺` Grassmannians. This roadmap is the earliest in the order to build the complex loop Grassmannian, so it is the owner; a later unification of the characteristic-free lattice-chart construction is the intake's choice, not a defect here. Opers, Drinfeld–Sokolov reduction, Tate `R`-modules, the polynomial/formal comparison, the isomonodromy groupoid and the cyclic-vector theorem: no other owner on main or among the readable heads except the recorded PadicDE duplicate. Open pull requests not listed with files in the brief were searched only through `roadmaps grep`.

**Headline theorems** (Summary, lines 10–19): classification of regular formal connections by the fibre at `t = 0` (stated, `regularGauge_constantCoeff_bijective`); polynomial factorization of formal loops (stated, `formalLoop_eq_polynomial_mul_positive`); Chevalley–Kostant slice and Drinfeld–Sokolov normal form (docstring: no Lie algebra of a pinned split group over `R((t))` with principal grading and no `W`-action on `Sym(𝔥*)` at the pins; agreed, and a `𝔰𝔩_n` matrix version would be a stand-in); cyclic-vector theorem (stated, `exists_cyclicVector`); Frenkel–Zhu for reductive `G` and torsor triviality (docstring; no torsors with connection over `ℂ((t))` at the pins; agreed); Drinfeld–Sokolov Poisson structure with Miura kernels and the isomonodromy algebroid (docstring; no completed oper function algebra at the pins; agreed). The Cartan decomposition of §3A.5 is not an end theorem of the Summary; its `GL_n` case is Smith normal form over `ℂ[[t]]` and belongs to the Checks.

**Adversarial table** (sampled targets, headlines, every target a finding touches, and the sections new or rewritten since 892f8d5).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `Res(f′dt) = 0`, `d(t⁻¹)` | `f = Σ f_j t^j`; `t⁻¹` | `t⁻¹` coefficient of `f′` is `0·f₀ = 0`; `d(t⁻¹) = −t⁻²`; `Res(t⁻¹dt) = 1` | as stated | none |
| §1.1 `⊗^!` witness | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive; one-sided completion keeps all `t^(−n)` | lies in `⊗^!` only | none |
| §1.2 inverse of `t + t²` | `ψ = t − t² + 2t³` | `ψ + ψ² = t + O(t⁴)`; truncation `t − t²` gives `t − 2t³ + O(t⁴)` | as stated | none |
| §1.2 contravariance | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = ψ(2t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2ψ = 2t + 2t²` | as stated, matches FLP L1 | none |
| §1.2 chain rule, residue | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `(f′∘φ)φ′ = −t⁻²(1+t)⁻²(1+2t) = −t⁻² + 1 + O(t)`, `Res = 1`; `Res(t⁻²·2t dt) = 2` | unit hypothesis needed, as stated | none |
| §1.2 `Aut(O)` semidirect product | `φ = at`, `Aut⁺` | `φ′(0) = a`; `Der⁺ = t²ℂ[[t]]∂` (Frenkel p. 92) | as stated | none |
| §1.3 elementary module, lattices | `R((t))`, `U = t^M O ⊂ L = t^N O` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator | pairings `i + j = −1`, `i + j = 0` | annihilator of `{i ≥ 0}`: `{j ≥ 0}`; `{j ≥ 1} = tV^∨[[t]]` | as stated (repaired) | none |
| §1.3 topological nilpotence | `t`, `t⁻¹`, `0` | `t^n O ⊂ t^N O` for `n ≥ N`; `t^(−n)O ⊄ O`; `0` not injective | as stated | none |
| §2.1 negative control | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | `Ω² ≃ k·dx∧dy`, curvature `dx∧dy ≠ 0`; `ξ(x), ξ(y) ∈ (x,y)` so `xξ(y) = 0`, `∇_ξ = ξ` | hypothesis needed, as stated | none |
| §2.1 dual sign | `∇ = d + a dx` | `∇^∨ = d − a dx`, `∇ ⊗ ∇^∨ = d`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 Atiyah sequence exactness | `M = A`; general `M` | jet `a ↦ 1 ⊗ a` is right-`A`-linear (`(1⊗a)(1⊗b) = 1⊗ab`), so `0 → I/I² → P¹(A) → A → 0` splits on the right and stays exact after `⊗_{A,right} M` | as stated | none |
| §2.2 splitting criterion Leibniz | `∇s = 1⊗s − σ(s)`, `σ` left-`A`-linear | `∇(as) = (a + da)(1⊗s) − aσ(s) = a∇s + da ⊗ s` using `1⊗a = a⊗1 + (1⊗a − a⊗1)` | as stated, with `da ↦ 1⊗a − a⊗1` | none |
| §2.2 first Check | `A = k[x]`, `σ(f) = f(1⊗1 − aξ)` | `∇f = f + f′ξ − f + faξ = (f′ + af)dx`; wrong identification: `(−d + a dx)(x) = (−1 + ax)dx ≠ (1 + ax)dx` | as stated | none |
| §2.2 jet is not `A`-linear | `s = 1` | `1⊗x − x(1⊗1) = ξ ≠ 0`; the zero map is not a connection | as stated | none |
| §2.2 symbol of `(d/dx)²` | `k[x]`, char `0`, `2`, `3` | `1 ⊗ x^n = Σ C(n,k)x^(n−k)ξ^k`; `D(x^n) = 2·C(n,2)x^(n−2)` so `ξ² ↦ 2`; in char `2`, `D = 0`, `ξ² ↦ 0`; `f″/2` undefined in char `2` | conclusion right, formula slips | R03 |
| §2.2 char `p` PBW failure | `k = 𝔽_p`, `(d/dx)^p` | `(d/dx)^p x^n = n⋯(n−p+1)x^(n−p) = 0`; image of `U(A, Der)` spanned by `a(d/dx)^i`, `i < p`, orders `≤ p − 1`; divided-power operator has order `p` | as stated | none |
| §2.2 kernel of order transition | `A` smooth | `0 → I^m/I^(m+1) → P^m(A) → P^(m−1)(A) → 0`, `P^(m−1)(A)` projective as right module for smooth `A`, so `⊗_A M` exact; `I^m/I^(m+1) = Sym^m Ω¹` for a regular diagonal ideal | as stated with the smooth hypothesis | none |
| §2.3 flatness criterion | `∇ = d + yN dx`, `N = [[0,1],[0,0]]` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N`; `(N dy∧dx)(∂_x,∂_y) = −N` | signs agree when `Ω¹` free | none |
| §2.3 Bianchi rank one | `F = (∂_x b − ∂_y a)dx∧dy` | `a = y, b = x`: `0`; `a = 0, b = x`: `dx∧dy` | as stated | none |
| §2.4 frame dictionary | `g = h⁻¹` | `g⁻¹dg = h d(h⁻¹) = −(dh)h⁻¹` | as stated | none |
| `regularGauge` law | symbolic | `gAg⁻¹ − g′g⁻¹ = B ⟺ g′ = gA − Bg`; coefficient of `t^j`: `(j+1)g_(j+1) = Σ_(i≤j)(g_iA_(j−i) − B_(j−i)g_i)` | docstring recursion exact | none |
| `regularGauge_constantCoeff_bijective` | `n = 1, A = 1, B = 0, R = ℚ`; `R = 𝔽_p`; `R = ℚ[ε]/ε²`, `A = εI`; `n = ∅`; `R = 0`; `V`-free `R` | `g = g₀e^t`; `g = 1 + t^p` solves `g′ = 0` with constant term `1` (fails without `[Algebra ℚ R]`); `g₀(1 + εt)`; singletons; singletons | holds with the stated hypothesis | none |
| §2.4 smoothness controls | `Spec ℂ[x,y]/(xy)`; `Spec ℂ[x]/x²`; `D(x−1) ⊂ 𝔾_m` | cotangent ranks `2`/`1`; `Ω¹ ⊗ κ = ℂdx`, Krull dimension `0`, `x ≠ 0` killed by every point; complex point `x = 2` | as stated | none |
| §3.1 nonreduced unit | `R = ℂ[ε]/ε²`, `1 + εt⁻¹` | inverse `1 − εt⁻¹`; `a t^n u` form needs `a = ε`, not a unit | as stated | none |
| §3.1 `exp_1`, `K_N` normal | `𝔾_m`, `ℚ`; `𝔽_p`; `GL_n` | `1 + t + t²/2 + ⋯`; `1/p!` absent; `g(1 + t^N X)g⁻¹ = 1 + t^N gXg⁻¹` | as stated | none |
| §3.2 descent overlap | `R = k`, `S = k[x]` | `Σ x^n y^n t^n ∈ (S ⊗ S)((t)) ∖ S((t)) ⊗_{R((t))} S((t))` | as stated | none |
| §3.3 infinitesimal gauge, cocycle | `g = 1 + εx`; `𝔾_m` | `(1 + εx)A(1 − εx) − εx′ = A + ε([x,A] − x′)`; `(gh)′/(gh) = g′/g + h′/h` | as stated | none |
| §3.3 left action | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹`, so `gauge(h, gauge(g, A)) = gauge(hg, A)` | as stated | none |
| §3.4 `𝔾_m` classes | `g = c t^n e^f`, `f ∈ tℂ[[t]]` | `a ↦ a − nt⁻¹ − f′`, `f′` ranges over `ℂ[[t]]`; classes = (polar part below `t⁻¹`, residue mod `ℤ`) | as stated | none |
| §3.4 stabilizers, deformation complex | `𝔾_m` over `ℂ`, `𝔽_p`; `[ℂ((t)) → ℂ((t))dt]` | `g′ = 0 ⇒ g ∈ ℂˣ`; `t^p` over `𝔽_p`; kernel `ℂ`, cokernel `ℂ` (residue) | as stated | none |
| §3A.1 non-normality | `SL₂`, `[[1,t],[0,1]]` | `n·[[1,t],[0,1]]·n⁻¹ = [[1,0],[−t,1]]`; `diag(t,t⁻¹)` conjugate `[[1,t³],[0,1]]`, `diag(t,t⁻¹) ∉ G(ℂ[t])` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` | `G = 1`; `𝔾_m`, `R = ℂ`; `R = ℂ[ε]/ε²`, `1 + εt⁻¹`; `SL₂` geometric series | singleton; `u = at^n·w`; polynomial factor `u`, positive `1`; `[[1,t⁻¹],[0,1]]·[[1,(1−t)⁻¹],[0,1]]` with `(1−t)⁻¹t⁻¹ − t⁻¹ = (1−t)⁻¹` | holds | none |
| same, hypothesis | `reductiveCommHopfAlgProperty ℂ H` | smooth ∧ geometrically connected ∧ trivial geometric unipotent radical; split over `ℂ` ⇒ `G_ad` totally isotropic (Česnavičius Example 15) ⇒ Theorem 19 for every `ℂ`-algebra `R` | holds | none |
| §3A.2 injectivity | `t⁻¹ + t` | in `R[[t]]` iff `t⁻¹` is: no | as stated | none |
| §3A.3 semidirect law | `(λ,w)(μ,v)(ν,u)` | both bracketings `(λ + wμ + wvν, wvu)`; `n_w t^λ n_v t^μ = n_wn_v t^(v⁻¹λ + μ)` | as stated | none |
| §3A.3 `Y/Q^∨` | `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` | `ℤ`; `0`; `ℤ(α^∨/2)/ℤα^∨ = ℤ/2`; `det∘λ = t^(Σλ_i)`, `ℤ` | as stated | none |
| §3A.3 conjugation | `n = [[0,1],[−1,0]]`, `diag(t,t⁻¹)` | `n diag(a,b) n⁻¹ = diag(b,a)` | `t^(−λ)`, as stated | none |
| §3A.3 compact comparison placement | `*Needs:* §4.3` | DFS: no cycle; forward need from Layer 3A into Layer 4; Layer 3A Dependencies omit Layer 4 | build-order note | R02 |
| §3A.4 Iwahori | `SL₂` | `[[1,0],[t,1]]`: constant term `1 ∈ B`; `[[1,0],[1,1]]`: lower triangular; `diag(t,t⁻¹)[[1,u],[0,1]]diag(t⁻¹,t) = [[1,t²u],[0,1]]`, `α(λ) = 2` | as stated | none |
| §3A.5 chart bounds | `GL₂`, `N = 0, 1` | `N = 0` chart is `{O²}`; `O e₁ ⊕ t⁻¹O e₂` in chart `1`; `t^(−k)O e₂ ⊕ O e₁ ⊄ t^(−N)O²` for `k > N` regardless of the lower bound; `t^kO e₂ ⊕ O e₁ ⊂ O²` has colength `k` | witness wrong | R01 |
| §3A.5 stratum bound | `t^λ`, weights `ω` | `t^λ O^n` has `t^(⟨λ,ω⟩)O` in weight `ω`; `N = max|⟨λ,ω⟩|` bounds the chart; `G(O)` preserves the chain | as stated | none |
| §3A.5 Cartan decomposition | `GL₁`; `SL₂`, `diag(t,t⁻¹)`, `diag(t²,t⁻²)` | `ℂ((t))ˣ = ⊔ Oˣt^n`; elementary divisors `(t,t⁻¹) ≠ (t²,t⁻²)`; `W\(Y⋊W)/W ≃ Y/W ≃ Y⁺` | as stated | none |
| §3A.5 `SL₂` Schubert variety | `λ = α^∨` | `dim Gr^(α^∨) = ⟨2ρ, α^∨⟩ = 2`; closure `= Gr^(α^∨) ∪ {L₀}`, the quadric cone; `Fℓ → Gr` fibre `ℙ(L/tL) = ℙ¹` | as stated | none |
| §3A.5 Iwahori–Matsumoto hypotheses | their `G` | adjoint Chevalley group (torus `Hom(P_r, K*)`), semisimple, any discretely valued field; reductive extension with central torus is the roadmap's target | as stated | none |
| §3A.6 positive double cosets | `GL₂`, `diag(t,1)`, `diag(1,t)`, `diag(t,t)` | Weyl-conjugate, dominant `(1,0)`; `det = t²`, component `2`; truncation `1 + t` of `(1−t)⁻¹` has `det (1+t)²` | as stated | none |
| §3A.7 `PGL₂` cocharacter | `α^∨/2` | `[diag(t,1)]² = [diag(t²,1)] = [diag(t,t⁻¹)]` | as stated | none |
| §4.1 oper condition | `PGL₂`, `ψ = t`, `0`, `ε + t⁻¹` over `ℂ[ε]/ε²` | unit in `ℂ((t))`, not in `ℂ[[t]]`; `0` never; `t⁻¹(1 + εt)` unit | as stated | none |
| §4.2 normalization | `[[1,u],[0,1]]` on `[[a,b],[1,−a]]`; `SL₂` over `ℚ` | `gAg⁻¹ − g′g⁻¹ = [[a+u, b − 2au − u² − u′],[1, −a−u]]`; `u = −a` gives `b + a² + a′`; `diag(s,s⁻¹)` scales `ψ` by `s⁻²`, `ψ = 2` not normalizable | as stated | none |
| §4.3 Chevalley checks | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `det ↦ −h²`, `ℂ[h²]`; `tr` degree `1`, `ℂ[h₁+h₂, h₁h₂]`; exponents `1, 2`, `1 + 2 = 3` positive roots; `Lie(μ₂) = 0`, `G`-invariants even | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` | `a = εt⁻¹`, `b = 0` | `a² = 0`, `a′ = −εt⁻²`, `q = −εt⁻²` | as stated | none |
| §4.3 torus matching, realification | `𝔾_m`; `S¹`, `μ_n` | bounded powers ⇒ `|z| = 1`; Zariski closure of `S¹` is `𝔾_m`, of `μ_n` is `μ_n`; `exp : ℂ → ℂˣ` sends `i(−a,a)` into `S¹` | as stated | none |
| §4.4 `SL₂`-lifts | `g = diag(√t, 1/√t)` on `[[0,q],[1,0]]` | `gAg⁻¹ = [[0,tq],[t⁻¹,0]]`, `g′g⁻¹ = diag(1/(2t), −1/(2t))`, result `[[−1/(2t), tq],[t⁻¹, 1/(2t)]]`; residue `−½ ∉ ℤ` | as stated | none |
| §5.1 Schwarzian cocycle | `ψ = t + t²` | `{ψ,t} = −6/(1+2t)²`; `{at,t} = 0` | as stated | none |
| §5.2 evaluation | rank one, `q = t⁻²`, `N = 2, 5`; `q_j ↦ 1` | `eval_q(q_(−2)) = 1`, same map; `q_j ↦ 1` kills no `ker(proj_N)` | as stated | none |
| §5.3 elimination | `n = 2`, diagonal `(a,−a)` | `y₁ = ay₂ − y₂′`; `−y₂″ + (a′ + a² + q)y₂ = 0`; `(4.2-14)`: from `Ω^(−(n−1)/2)` to `Ω^((n+1)/2)` | agrees with §4.2 and Frenkel | none |
| §5.4 gauge witness | `g = [[c − ts, −s],[−s + tc, c]]` | `g(0) = 1`, `c² − s² = 1`, `gA₀ − A₁g = [[−tc,−c],[ts,s]] = g′` | `gauge(g, A₀) = A₁` | none |
| §6.1 finite monodromy, torsors | `𝔾_m`; `μ₂` | kernel open ⇒ finite index ⇒ root of unity; `H¹(ℂ((t)), μ₂) = ℂ((t))ˣ/2 = ℤ/2` | as stated | none |
| `exists_cyclicVector` | `V = 0`; `D = 0` on `F²`; `F = 𝔽_p(t)`, `V = F^(p+1)` | `Fin 0` family independent, `v = 0`; no cyclic vector; `∂^p` a derivation killing `𝔽_p[t]`, `D^p v = 0` | both hypotheses needed; statement true | none |
| §6.2 Katz candidates | `e₀ = (1,t)`, `e₁ = (−t⁻¹,0)`, `D = ∂` | `c(e, t−a) = e₀ + (t−a)(e₁ − De₀)`; `a = 0`: `0`; `a = 1`: `(t⁻¹,1)`, derivative `(−t⁻²,0)`, determinant `t⁻²` | as stated | none |
| §6.2 lattice estimate | `∇ = ∂ + t⁻²`, `L = ℂ[[t]]` | `f′ + t⁻²f ∈ ℂ[[t]]` iff `f ∈ t²ℂ[[t]]`: relative dimension `−2` | as stated | none |
| §6.3 coordinate derivation sign | `φ_s = t + sε`, `ρ_φ = σ_(φ⁻¹)` | `φ_s⁻¹ = t − sε + O(s²)`, `d/ds f∘φ_s⁻¹ = −εf′`; `D = t^(−r)∂ ⇔ ε = −t^(−r) ∈ t²ℂ[[t]]∂ ⇔ r ≤ −2` | as stated | none |
| §6.3 conjugation formula | `(g⁻¹,1)` on `(t^(−r)A, t^(−r)∂)` | `(g⁻¹)′g = −g⁻¹g′`; first component `t^(−r) gauge(g⁻¹, A)`; FZ's `X_A` condition `= t^(−r)gauge(g⁻¹,A) ∈ 𝔤[[t]]` with constant term in `𝔟` | as stated | none |
| §6.3 `SL₂` Schubert cells | `s₀`, `s₁`, `s₀s₁` | `ℓ = 1, 1, 2`; cells of `s_i` are the `ℙ¹`-fibres minus the base point | as stated | none |
| §6.4 order bound | `A = 0`, `r = −2`; `t^λ`; `exp(t⁻³x)` | `gauge(t^(−λ), 0) = λt⁻¹`, order `−1 ≥ −2`; `h = exp(−t⁻³x)`, `h′h⁻¹ = 3t⁻⁴x`, `gauge = −3t⁻⁴x`, order `−4` | sign slip, conclusion holds | R05 |
| §6.4 leading coefficient | `SL₂`, `A = t⁻²h`; `t⁻²f` | `h` semisimple at `r = −2`; at `r = −3`, `A_(−3) = 0` nilpotent (FZ §2); `f` regular nilpotent, singleton flag | as stated | none |
| §6.5 cohomology | `μ_n`, `𝔾_m` | `ℂ((t))ˣ = ℂˣ × t^ℤ × (1 + tℂ[[t]])`, `H¹(μ_n) = ℤ/n`; `H²(μ_n) = Br[n] = 0` | as stated | none |
| §7.1 cotangent algebroid | `{x,y} = 1`; `{x,y} = x`; `k[x,y]/(x²,y²)` | `[dx, x dy] = 0`; `[dx,dy] = dx`, `anchor(dy)(x) = −x`; `{x²,y} = 2x ≠ 0` | as stated | none |
| §7.2 anchor sign, Heisenberg | `H_x = Res κ(A,x)`; `𝔤 = ℂ`, `t^m`, `t^n` | `{H_x,H_y}(A) = Res κ([A,x] + x′, y)`; `−Res(t^m·nt^(n−1)dt) = −nδ_(m+n,0)` | as stated | none |
| §7.2 freeness | `𝔰𝔩₂`, `N((t))` on `d + f + v` | `u = −a` forced | as stated | none |
| §7.3 Virasoro, KdV | `L_n = Res t^(n+1)q` | `(m−n)L_(m+n) − ½(m³−m)δ`, `c = −6`; `P_q(2q) = 6qq′ − q‴` | as stated | none |
| §7.4 coisotropy | `L_n = q_(−n−2)`, `I = (q_j : j < 0)` | `L_n ∈ I ⇔ n ≥ −1`; `{L₂,L₋₂} = 4L₀ − 3 ↦ −3`; `{L₋₁,L₋₂} = q₁ ∉ I` | as stated | none |
| §7.5 Miura, screening, modes | `[[−u,0],[1,u]]`; `[[1,εx],[0,1]]`; `w[a] ↦ q_(−a−1)` | `q = u² − u′`; Miura form iff `x′ = 2ux`, `δu = −x`, `δq = 0`; `(q′)_(−a−1) = −a q_(−a)` | as stated | none |
| §8.1 `IsomOp` | `𝔾_m`; `(q,q,g)`, `g ∈ N((t))` | arrows `(a, a − dlog g, g)`, automorphisms `ℂˣ`; `g = 1` forced; FG composition `φ′∘φ` = `hg` | as stated | none |
| §8.2 tangent and algebroid | `𝔰𝔩₂`, `∇ = ∂ + f + qe` | class of `αh + βe` is `(β + α′)e`; `𝔤/𝔟`-component of `∇_ad y` is `(y_f′ + 2y_h)f`; `(1−ηy)(1−εx)(1+ηy)(1+εx) = 1 − εη[x,y]`; `[F_x,F_y] = −F_[x,y]` | as stated | none |
| §8.3 regular extension | `𝔾_m`, `a, b ∈ ℂ[[t]]` | `dlog g = a − b ∈ ℂ[[t]]dt ⇒ g ∈ ℂ[[t]]ˣ` | as stated | none |
| §8.4 critical level | `κ_c = −½ Killing` | Killing `= 2h^∨κ₀`; `κ₀(h,h) = 2`, `κ₀^∨(α,α) = 2` | as stated | none |

## Not verifiable

- Kazhdan–Lusztig 1988, §4 Lemmas 6 and 8 (DOI 10.1007/BF02787119), cited at lines 1910–1914: paywalled; the README records it as uncertified.
- Kazhdan–Lusztig 1980, *A topological approach to Springer's representations*, §2 (line 1937): no legal copy found; uncertified in the README.
- Kostant 1963, Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985, Rinehart 1963: cited by locator and marked uncertified; not checked at theorem level.

## Source issues

- **Gap** in frenkel-zhu at §5 Lemma 10, printed page 9: the proof derives the twisted adjoint formula from brackets with every element of `𝔤(F)` and invokes semisimplicity, while the paper's `G` (page 1) is connected reductive, where bracket identities do not detect central directions; it should be proved by differentiating the semidirect multiplication, as §6.3 does; affects the proof.
