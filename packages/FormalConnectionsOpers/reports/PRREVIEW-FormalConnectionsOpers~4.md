# Review of FormalConnectionsOpers (pull request #1056 at 19aacea)

**Verdict:** needs changes

Incremental re-review of the 47 lines changed since 1aab7da (the Scope bullets on ComplexComparisonPartII C−1.1 and ReductiveGroups, two new Tau Ceti supplier bullets, §4.3's lower dictionary and its `*Needs:*` line, the Downstream consumers bullet on ReductiveGroups Layer 11), of everything that cites them, and of the gate. The merge of main in `6c422855` bumped the pins: Tau Ceti `a91d3aaf → 2fd255d9`, Mathlib `6b7abb3c → 1b1ccf4b`. `Suggested.lean` is byte-identical to the head the previous review read, and it no longer builds at the new Tau Ceti pin (R01). Every library name and file path the README cites was re-resolved at the new pins (two drifted: R01's name and R08's path). The worker's gate at this head: `build=3 FAIL`, every other check `0`. My dependency check: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti: `TauCeti.AlgHom.mapValue` no longer exists

Location: `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean` lines 112 and 118 (`TauCeti.AlgHom.mapValue (H := H) …`); README line 209 (`TauCeti.AlgHom.mapValue` in `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`).

Claim: the post-composition map on Hopf points is `TauCeti.AlgHom.mapValue` at the pin.

Witness: `lake env lean TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean` at this head: `112:2: Unknown identifier TauCeti.AlgHom.mapValue`, `118:2` the same (the worker's gate shows the same two errors). At the pinned Tau Ceti `2fd255d9`, `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean` opens `namespace AlgHom` at line 64 with no enclosing `TauCeti` namespace and defines `mapValue` at line 143; its full name is `AlgHom.mapValue`, of type `(A →ₐ[R] B) → WithConv (H →ₐ[R] A) →* WithConv (H →ₐ[R] B)` with `[Bialgebra R H]`. At the previous pin `a91d3aaf` the same file had `namespace TauCeti` at line 59, which is why the previous head built.

Repair: replace both occurrences by `AlgHom.mapValue (H := H) …`, and rename the README's bullet at line 209 to `AlgHom.mapValue`. Tested: a scratch copy with exactly that substitution elaborates with only the three `declaration uses sorry` warnings (lines 70, 129, 159), and `#check @name` on all nine declarations prints the same types as the previous review recorded (`[Algebra ℚ R]` on the gauge bijection, `reductiveCommHopfAlgProperty ℂ H` on the factorization, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]` and `IsDifferentialModuleMap F D` on the cyclic-vector theorem).

## R02 (P2) — The complex Lie group `G(ℂ)` with its Lie-algebra identification now has two owners: §4.3 here and ReductiveGroups Layer 3A.5 at the open ReductiveGroups heads

Location: README lines 78–81 ("§4.3 also owns the complex Lie group `G(ℂ)` of every affine algebraic group `G` over `ℂ`, on the native Hopf-point carrier, with the identification of its Lie algebra with the counit derivations … ReductiveGroups Layer 11 consumes it"); lines 1428–1431 ("this is the single construction of the complex Lie group `G(ℂ)` and of the identification of its Lie algebra with the counit derivations, and ReductiveGroups Layer 11 consumes it"); lines 2463–2465.

Claim: this roadmap is the single owner of the complex Lie-group structure on `G(ℂ)` and of the identification of its Lie algebra with Tau Ceti's counit derivations, for every affine algebraic group over `ℂ`.

Witness: pull request #1676 (ReductiveGroups), `TauCetiRoadmap/ReductiveGroups/README.md` lines 850–856 at its head, in Layer 3A.5: smooth charts from ComplexComparisonPartII C−1.1 are applied "to `G` itself, a smooth closed subscheme of some `GLₙ` by Layer 1: `G(ℂ)` is a complex manifold … so `G(ℂ)` is a complex Lie group whose Lie algebra is identified with Layer 2's tangent Lie algebra by the chart at the identity. This complex Lie-group dictionary is owned here and consumed by Layer 11"; its Layer 11 (line 3313) reads "Layer 3A.5 supplies the classical topology, complex-manifold charts and complex Lie-group structure on G(ℂ)" and no longer cites F4.3. The heads of #1808 (ReductiveGroups line 855) and #1797 (line 1230) carry the same passage. Layer 2's tangent Lie algebra is Tau Ceti's counit derivations with the convolution bracket, the same object as here. On main, ReductiveGroups Layer 3A (lines 342–366) already builds the charts on `G(ℂ)` and the homogeneous-space identification from C−1.1, and only Layer 11 (line 1964) cites F4.3. So at the open heads the two roadmaps each build the complex Lie group `G(ℂ)` and its Lie-algebra identification, and each says the other's Layer 11 consumes its own.

Repair: one owner, and ReductiveGroups is the earlier roadmap in the merge order. Delete the sentence at lines 78–81 and the clause "this is the single construction of the complex Lie group `G(ℂ)` and of the identification of its Lie algebra with the counit derivations" at lines 1428–1431; state in §4.3 that the complex Lie-group structure on `G(ℂ)` as a smooth closed subscheme of `GL_N` and the chart-at-the-identity comparison of its Lie algebra with the algebraic tangent Lie algebra are consumed from ReductiveGroups Layer 3A (its smooth-chart construction from C−1.1), and that §4.3 owns only what that layer does not state: the transport of topology, atlas and Lie-group structure to the native carrier `WithConv (H →ₐ[ℂ] ℂ)`, the Maurer–Cartan trivialization and the rank `d`, the germ-to-global counit-derivation equivalence and its bracket compatibility, the realification comparison and the holomorphic exponential chart. Rewrite the Downstream consumers bullet (lines 2463–2465) and the ReductiveGroups Scope bullet accordingly. If instead the intake keeps the ownership here, the ReductiveGroups revisions must cite F4.3 for it; either way the report of one of the two pull requests records the choice.

## R03 (P3) — §3A.5 Check names a lattice the upper bound already excludes

Not repaired since the previous review (its R01). Location: README lines 1267–1269: "a chart without the lower bound `t^N R[[t]]^n ⊂ L` would contain `t^(−k)ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` for every `k` and not be of finite type".

Claim: dropping the lower bound admits `t^(−k)O e₂ ⊕ O e₁` for every `k`.

Witness: with the upper bound `L ⊂ t^(−N)O²` kept, `t^(−k)O e₂ ⊄ t^(−N)O²` for `k > N`, so these lattices are excluded with or without the lower bound. What the lower bound excludes is `t^k O e₂ ⊕ O e₁ ⊂ O²` for `k > N`, of colength `k` in `O²`, unbounded.

Repair: write `t^k ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` (sublattices of `ℂ[[t]]²` of unbounded colength) in place of `t^(−k)ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁`.

## R04 (P3) — §3A.3 needs §4.3, a target of a later layer, and Layer 3A's Dependencies omit Layer 4

Not repaired since the previous review (its R02). Location: README line 1172 (`*Needs:* … §4.3 for the compact comparison`); lines 1341–1344 (Layer 3A Dependencies name Layers 1–3 and "Nothing from Layer 6"; no Layer 4).

Claim: Layer 3A is built before Layer 4 ("How to read the build").

Witness: the DFS over the `*Needs:*` lines of the previous review stands at this head: the only need pointing into a later layer outside a layer's declared internal order is §3A.3 → §4.3. §4.3's compact-form paragraph already constructs the algebraic torus `T` from `T_K` with its integral character lattice, where the comparison `λ ↦ dλ(2πi)` of `Y = X_*(T)` with `ker(exp|_(Lie T_K))` belongs.

Repair: move the comparison sentence of §3A.3 into §4.3's "Compact form and matched torus" paragraph and delete "§4.3 for the compact comparison" from line 1172; otherwise add Layer 4 to Layer 3A's Dependencies and say that §3A.3's last comparison is built after §4.3.

## R05 (P3) — §2.2 Check writes the second jet coefficient as `f″/2` and then evaluates it in characteristic 2

Not repaired since the previous review (its R03). Location: README lines 649–651: "`1 ⊗ f = f + f′ξ + (f″/2)ξ²`, sends `1 ↦ 0`, `ξ ↦ 0`, `ξ² ↦ 2`: its symbol is nonzero in characteristic `≠ 2` and zero in characteristic `2`".

Claim: the displayed jet formula holds in every characteristic.

Witness: `1 ⊗ x^n = (x + ξ)^n = Σ_k C(n,k) x^(n−k) ξ^k`, so the `ξ²` coefficient is the Hasse derivative `C(n,2) x^(n−2)`, equal to `f″/2` only when `2` is invertible; over `𝔽₂[x]` it sends `x²` to `1` while `f″ = 0`. The value `ξ² ↦ 2` is right in both cases since `D(x^n) = n(n−1)x^(n−2) = 2·C(n,2)x^(n−2)`.

Repair: write `1 ⊗ f = f + f′ξ + f^[2] ξ²` with `f^[2]` the second Hasse derivative (`x^n ↦ C(n,2) x^(n−2)`), keeping `ξ² ↦ 2`.

## R06 (P3) — A named declaration of `Suggested.lean` is not named in the README

Not repaired since the previous review (its R04). Location: `Suggested.lean` lines 86–88 (`local instance (priority := high) laurentSeriesCoefficientAlgebra`); README lines 168–172 (the `HahnSeries.instAlgebra` bullet).

Claim: every Lean name of the file appears in the README.

Witness: `laurentSeriesCoefficientAlgebra` occurs nowhere in `README.md` (grep at this head); the other eight declarations do.

Repair: in that Mathlib bullet write "by the local instance `laurentSeriesCoefficientAlgebra`".

## R07 (P3) — §6.4 Check gives the gauge of `exp(t⁻³x)` with the wrong sign

Not repaired since the previous review (its R05). Location: README lines 2016–2017: "the flag of `exp(t⁻³x)` for `x ∈ 𝔫`, whose gauge `3t⁻⁴x` has order `−4`".

Claim: the relevant gauge of `g = exp(t⁻³x)` is `3t⁻⁴x`.

Witness: §6.4 tests `gauge(g⁻¹, A)`; with `h = g⁻¹ = exp(−t⁻³x)`, `h′h⁻¹ = 3t⁻⁴x`, so `gauge(h, 0) = −h′h⁻¹ = −3t⁻⁴x`. The order `−4 < −2` and the conclusion are unaffected.

Repair: write `−3t⁻⁴x`.

## R08 (P3) — The Tau Ceti gluing file cited no longer exists at the pin

Location: README lines 226–227: "`TauCeti.chartedSpaceOfIsOpenEmbedding` and `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding` in `TauCeti/Geometry/Manifold/Gluing.lean`".

Claim: the two declarations live in `TauCeti/Geometry/Manifold/Gluing.lean`.

Witness: at the pinned Tau Ceti `2fd255d9` there is no file `TauCeti/Geometry/Manifold/Gluing.lean`; both declarations are in `TauCeti/Geometry/Manifold/Gluing/Basic.lean` (lines 87 and 135, under `namespace TauCeti` at line 75). The other nine Tau Ceti file paths the README cites exist at the pin.

Repair: write `TauCeti/Geometry/Manifold/Gluing/Basic.lean`.

## R09 (P3) — Downstream consumers no longer names SchubertGeometry, which cites F2.4 on main

Location: README lines 2463–2465 (the ReductiveGroups Layer 11 bullet; the diff deleted the sentence "**SchubertGeometry** and **ComplexKahlerGeometry** consume §2.4's fixed-model comparison").

Claim: the consumers section lists the roadmaps that consume this one.

Witness: `TauCetiRoadmap/SchubertGeometry/README.md` line 111 on main: "Construct the downstream smooth-carrier comparison with FormalConnectionsOpers F2.4: for every separated smooth finite-type ℂ-scheme … identify its independently constructed manifold with the smooth carrier of ComplexComparisonPartII's same analytification". `SchubertGeometry` occurs nowhere in this README at this head. Dropping ComplexKahlerGeometry is right: its line 475 says F2.4 consumes K4, so it is a supplier.

Repair: add a bullet "**SchubertGeometry** consumes §2.4's fixed-model manifold and its comparison with ComplexComparisonPartII C−1.1's smooth carrier."

## Previous findings

- R01 — not repaired: line 1268 still reads "would contain `t^(−k)ℂ[[t]] e₂ ⊕ ℂ[[t]] e₁` for every `k`"; re-raised as R03.
- R02 — not repaired: line 1172 still ends "§4.3 for the compact comparison" and Layer 3A's Dependencies (1341–1344) still omit Layer 4; re-raised as R04.
- R03 — not repaired: line 650 still reads "`1 ⊗ f = f + f′ξ + (f″/2)ξ²`"; re-raised as R05.
- R04 — not repaired: `laurentSeriesCoefficientAlgebra` still absent from the README; re-raised as R06.
- R05 — not repaired: line 2017 still reads "whose gauge `3t⁻⁴x` has order `−4`"; re-raised as R07.

## Verified sound

**Gate and direction.** Worker's gate at 19aacea: `build=3 FAIL` (the two `mapValue` errors and the exit code), every other check `0`. Dependency check run here: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Outside-folder diff against `origin/main`: empty (the long file list in the change set is the merge of main, not a change of this pull request). New `*Needs:*` entries of §4.3 (ReductiveGroups Layers 0–4, 6–9; Tau Ceti characteristic-zero smoothness) point to main and to the pin.

**Lean at the new pins.** Head file: elaboration fails only at lines 112 and 118 (R01); the three `sorry` warnings are at 70, 129, 159 and nothing else is reported. Probe copy with `AlgHom.mapValue`: elaborates with those three warnings only; `#check @name` on the nine declarations gives the same elaborated types as the previous review and the worker's `signatures.md`; nothing else changed at the Mathlib bump (`Differential`, `HahnSeries.ofPowerSeriesAlg`, `HahnSeries.instAlgebra`, `Matrix.GeneralLinearGroup.map`, `LaurentPolynomial.eval₂_C` elaborate as before). Imports `TauCeti.Algebra.AlgebraicGroup.PointsFunctor` and `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic` exist at `2fd255d9` with built object files. The one-tactic padding probes of the previous review were not re-run: the three theorems are unchanged and the pin bump brought no cyclic-vector, loop-factorization or formal-gauge theorem (grep of the new Mathlib and Tau Ceti for `cyclicVector`, `IsDifferentialModule`, `LaurentPolynomial` points, `regularGauge`: none).

**Pinned declarations opened at `2fd255d9` / `1b1ccf4b`.** Tau Ceti: `smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean` line 151: `(k) [Field k] [CharZero k] (H : CommHopfAlgCat k) [Algebra.FiniteType k H] : smoothCommHopfAlgProperty k H`, under `namespace TauCeti`, so the README's full name is right); `HopfAlgebra.finrank_lie_eq_ringKrullDim_of_charZero` (line 178: `(Module.finrank k (Derivation k H (Bialgebra.CounitAlgebra k H k)) : WithBot ℕ∞) = ringKrullDim H` for `[CommRing H] [HopfAlgebra k H] [Algebra.FiniteType k H]`), both as the new supplier bullet states them; `AlgHom.mapValue` (`FunctorOfPoints.lean` 143, R01); `HopfAlgebra.points`, `pointsFunctor`, `FiniteTypeCommHopfAlgCat`, `reductiveCommHopfAlgProperty` (elaborated in the probe); `Bialgebra.CounitAlgebra` (`Tangent/Basic.lean`, under `TauCeti`); `Toric.regularAffinePointHomeomorph` (`Geometry/Toric/Analytic/RegularChart.lean` 185); `zHat`, `zHat.gen`, `hom_ext`, `lift`, `lift_gen`, `lift_unique`, `liftEquiv` (`ZHat/Basic.lean` 66–170); `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker` (`NoSmallSubgroups.lean` 113); `chartedSpaceOfIsOpenEmbedding`, `isManifold_chartedSpaceOfIsOpenEmbedding` (`Gluing/Basic.lean` 87, 135, R08); the module `TauCeti.Algebra.AlgebraicGroup.Tangent.Lie.Basic` and the `ProjectiveGeneralLinear` directory exist. The 42 backticked Mathlib names of the `From Mathlib` section all resolve at `1b1ccf4b` (git grep for their declarations: `exists_isStandardEtale_mvPolynomial` in `RingTheory/Unramified/LocalStructure.lean`, `exists_span_eq_top_isStandardSmooth` in `RingTheory/Smooth/StandardSmoothOfFree.lean`, `exist_openSubgroup_sub_clopen_nhds_of_one` in `Topology/Algebra/OpenSubgroup.lean`, `exist_openNormalSubgroup_sub_open_nhds_of_one` in `Topology/Algebra/ClopenNhdofOne.lean`, `secondCountableTopology_of_countable_cover` in `Topology/Bases.lean`, the three Nullstellensatz lemmas in `RingTheory/Nullstellensatz.lean`, `LieRinehartAlgebra`/`LieRinehartRing`/`anchor` in `Algebra/LieRinehartAlgebra/Defs.lean`, `GroupLieAlgebra`, `LeftInvariantDerivation`, `mlieBracket`, `HahnModule`, `HahnSeries.powerSeriesAlgebra`, `Matrix.linftyOpNormedAlgebra`, `Pseudofunctor.IsPrestack`, `Scheme.PresheafOfModules`, `RootPairing.flip`). The reference link at line 2534 to `LieRinehartAlgebra/Defs.lean` at commit `6b7abb3c` is a permalink and still resolves; the file exists at the new pin.

**Cross-roadmap citations resolved at the current main or head.** ComplexComparisonPartII (#848 head) lines 913–919: "FormalConnectionsOpers F2.4 takes this functor's complex-points, open-subspace, fibre-product, smooth-chart and étale-local-isomorphism comparisons … Fixed-model maximal atlases, second countability, tangent/derivation, toric, group and gauge comparisons belong to F2.4", and line 148 (the supplier table) the same: the rewritten C−1.1 Scope bullet (lines 55–61) matches it exactly, and C−1.1 states no `ChartedSpace`/`IsManifold` structure on complex points of general smooth schemes (its manifold statements, lines 1835–1884, are the Riemann-surface case C1.9). ReductiveGroups on main: Layer 0 (129–175, Hopf/points dictionary on Tau Ceti's `pointsFunctor`), Layer 1 line 207 ("every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into `GLₙ`"), Layer 2 (227–233, `Lie(G)` and `Ad`), Layer 11 line 1964 ("The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here"): the new §4.3 sentence "only ReductiveGroups Layers 0–2 and §2.4" names inputs that exist on main, and main's Layer 11 does consume F4.3; the conflict is with the open ReductiveGroups heads (R02). NilpotentOrbits line 60 on main consumes "F2.4 and lower F4.3 … on the same native Hopf-points carrier: Maurer–Cartan/cotangent rank, fixed complex atlas, tangent/counit derivation bracket comparison", consistent with §4.3's text at this head. SchubertGeometry line 111 and ComplexKahlerGeometry line 475: R09.

**Ownership against open work.** Searched by object (complex Lie group on the complex points of an affine algebraic group; Lie-algebra/counit-derivation identification) in the roadmaps on main (`complex Lie group` occurs in no README on main in this sense besides this one and ImaginaryQuadraticClassNumber's unrelated use), in the heads the brief lists, and through `roadmaps show ReductiveGroups --pr 1676/1808/1797`: the three open ReductiveGroups revisions own it in Layer 3A.5 (R02). The polynomial/formal loop comparison, opers, Drinfeld–Sokolov reduction, Tate modules, the isomonodromy groupoid and the cyclic-vector theorem: no new owner since the previous review (the recorded PadicDifferentialEquationsAndRigidCohomology duplicate of the cyclic-vector theorem stands as recorded there). Open pull requests not listed with files in the brief were searched only through `roadmaps grep` and `roadmaps show`.

**Headline theorems** (Summary, lines 10–19): unchanged since the previous review and unaffected by the diff; stated: `regularGauge_constantCoeff_bijective`, `formalLoop_eq_polynomial_mul_positive`, `exists_cyclicVector`; named in the docstring as not statable: Chevalley–Kostant/Drinfeld–Sokolov normal form, Frenkel–Zhu with torsor triviality, the Poisson structure and the isomonodromy algebroid. No carrier for these appeared at the new pins (grep of `2fd255d9` for `Oper`, `DrinfeldSokolov`, `IsomonodromyGroupoid`, `LoopGroup`: none).

**Sources.** No sampled target (F1.3, F3.1, F3.3, F3.4, F4.2, F5.2, F6.1, F6.4, F7.2–F7.4, F8.1–F8.4) falls in the changed lines; their locators were read in the previous rounds and are unchanged at this head (diff). The new text cites no new source: Cartier's theorem is consumed from Tau Ceti, whose docstring cites Milne, *Algebraic Groups*, Chapter 3 and Waterhouse §11.4.

**Adversarial table.** Rows marked "r3" carry forward the previous report's rows for statements the diff leaves untouched, with their computed values; the last seven rows are new, for the changed passages.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `Res(f′dt) = 0`, `d(t⁻¹)` (r3) | `f = Σ f_j t^j`; `t⁻¹` | `t⁻¹` coefficient of `f′` is `0·f₀ = 0`; `d(t⁻¹) = −t⁻²`; `Res(t⁻¹dt) = 1` | as stated | none |
| §1.1 `⊗^!` witness (r3) | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive; one-sided completion keeps all `t^(−n)` | lies in `⊗^!` only | none |
| §1.2 inverse of `t + t²` (r3) | `ψ = t − t² + 2t³` | `ψ + ψ² = t + O(t⁴)`; truncation `t − t²` gives `t − 2t³ + O(t⁴)` | as stated | none |
| §1.2 contravariance (r3) | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2t + 2t²` | as stated | none |
| §1.2 chain rule, residue (r3) | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `(f′∘φ)φ′ = −t⁻² + 1 + O(t)`, `Res = 1`; `Res(t⁻²·2t dt) = 2` | unit hypothesis needed, as stated | none |
| §1.2 `Aut(O)` semidirect product (r3) | `φ = at`, `Aut⁺` | `φ′(0) = a`; `Der⁺ = t²ℂ[[t]]∂` | as stated | none |
| §1.3 elementary module, lattices (r3) | `R((t))`, `U = t^M O ⊂ L = t^N O` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator (r3) | pairings `i + j = −1`, `i + j = 0` | annihilator of `{i ≥ 0}`: `{j ≥ 1} = tV^∨[[t]]` | as stated | none |
| §1.3 topological nilpotence (r3) | `t`, `t⁻¹`, `0` | `t^n O ⊂ t^N O` for `n ≥ N`; `t^(−n)O ⊄ O`; `0` not injective | as stated | none |
| §2.1 negative control (r3) | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | curvature `dx∧dy ≠ 0`; `xξ(y) = 0`, `∇_ξ = ξ` | hypothesis needed, as stated | none |
| §2.1 dual sign (r3) | `∇ = d + a dx` | `∇^∨ = d − a dx`, `∇ ⊗ ∇^∨ = d`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 Atiyah sequence exactness (r3) | `M = A`; general `M` | `0 → I/I² → P¹(A) → A → 0` splits on the right by the jet, stays exact after `⊗_{A,right} M` | as stated | none |
| §2.2 splitting criterion Leibniz (r3) | `∇s = 1⊗s − σ(s)` | `∇(as) = a∇s + da ⊗ s` with `da ↦ 1⊗a − a⊗1` | as stated | none |
| §2.2 first Check (r3) | `A = k[x]`, `σ(f) = f(1⊗1 − aξ)` | `∇f = (f′ + af)dx`; wrong identification gives `(−1 + ax)dx` | as stated | none |
| §2.2 jet is not `A`-linear (r3) | `s = 1` | `1⊗x − x(1⊗1) = ξ ≠ 0` | as stated | none |
| §2.2 symbol of `(d/dx)²` (r3) | `k[x]`, char `0`, `2`, `3` | `ξ²` coefficient `C(n,2)x^(n−2)`; `D(x^n) = 2·C(n,2)x^(n−2)`, `ξ² ↦ 2`; char `2`: `0`; `f″/2` undefined | conclusion right, formula slips | R05 |
| §2.2 char `p` PBW failure (r3) | `k = 𝔽_p`, `(d/dx)^p` | `(d/dx)^p x^n = 0`; image of `U(A, Der)` has orders `≤ p − 1` | as stated | none |
| §2.2 kernel of order transition (r3) | `A` smooth | `0 → I^m/I^(m+1) → P^m(A) → P^(m−1)(A) → 0`, `I^m/I^(m+1) = Sym^m Ω¹` | as stated with smoothness | none |
| §2.3 flatness criterion (r3) | `∇ = d + yN dx` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N` | signs agree | none |
| §2.3 Bianchi rank one (r3) | `a = y, b = x`; `a = 0, b = x` | `0`; `dx∧dy` | as stated | none |
| §2.4 frame dictionary (r3) | `g = h⁻¹` | `g⁻¹dg = −(dh)h⁻¹` | as stated | none |
| `regularGauge` law (r3) | symbolic | `g′ = gA − Bg`; `(j+1)g_(j+1) = Σ_(i≤j)(g_iA_(j−i) − B_(j−i)g_i)` | docstring recursion exact | none |
| `regularGauge_constantCoeff_bijective` (r3) | `n = 1, A = 1, B = 0, R = ℚ`; `R = 𝔽_p`; `R = ℚ[ε]/ε²`; `n = ∅`; `R = 0` | `g = g₀e^t`; `g = 1 + t^p` solves `g′ = 0` (needs `[Algebra ℚ R]`); `g₀(1 + εt)`; singletons | holds with the stated hypothesis | none |
| §2.4 smoothness controls (r3) | `Spec ℂ[x,y]/(xy)`; `Spec ℂ[x]/x²`; `D(x−1) ⊂ 𝔾_m` | cotangent ranks `2`/`1`; Krull dimension `0`; complex point `x = 2` | as stated | none |
| §3.1 nonreduced unit (r3) | `R = ℂ[ε]/ε²`, `1 + εt⁻¹` | inverse `1 − εt⁻¹`; not of the form `a t^n u` with `a` a unit | as stated | none |
| §3.1 `exp_1`, `K_N` normal (r3) | `𝔾_m`, `ℚ`; `𝔽_p`; `GL_n` | `1 + t + t²/2 + ⋯`; `1/p!` absent; `g(1 + t^N X)g⁻¹ = 1 + t^N gXg⁻¹` | as stated | none |
| §3.2 descent overlap (r3) | `R = k`, `S = k[x]` | `Σ x^n y^n t^n ∉ S((t)) ⊗_{R((t))} S((t))` | as stated | none |
| §3.3 infinitesimal gauge, cocycle (r3) | `g = 1 + εx`; `𝔾_m` | `A + ε([x,A] − x′)`; `(gh)′/(gh) = g′/g + h′/h` | as stated | none |
| §3.3 left action (r3) | `h, g` | `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹` | as stated | none |
| §3.4 `𝔾_m` classes (r3) | `g = c t^n e^f` | `a ↦ a − nt⁻¹ − f′`; classes = (polar part below `t⁻¹`, residue mod `ℤ`) | as stated | none |
| §3.4 stabilizers, deformation complex (r3) | `𝔾_m` over `ℂ`, `𝔽_p` | `g′ = 0 ⇒ g ∈ ℂˣ`; `t^p` over `𝔽_p`; kernel `ℂ`, cokernel `ℂ` | as stated | none |
| §3A.1 non-normality (r3) | `SL₂`, `[[1,t],[0,1]]` | `diag(t,t⁻¹)` conjugate `[[1,t³],[0,1]]`, `diag(t,t⁻¹) ∉ G(ℂ[t])` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` (r3) | `G = 1`; `𝔾_m`; `ℂ[ε]/ε²`, `1 + εt⁻¹`; `SL₂` | singleton; `u = at^n·w`; polynomial factor `u`, positive `1`; `(1−t)⁻¹t⁻¹ − t⁻¹ = (1−t)⁻¹` | holds | none |
| same, hypothesis (r3) | `reductiveCommHopfAlgProperty ℂ H` | split over `ℂ` ⇒ `G_ad` totally isotropic ⇒ Česnavičius Theorem 19 for every `R` | holds | none |
| §3A.2 injectivity (r3) | `t⁻¹ + t` | not in `R[[t]]` | as stated | none |
| §3A.3 semidirect law (r3) | `(λ,w)(μ,v)(ν,u)` | both bracketings `(λ + wμ + wvν, wvu)` | as stated | none |
| §3A.3 `Y/Q^∨` (r3) | `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` | `ℤ`; `0`; `ℤ/2`; `ℤ` | as stated | none |
| §3A.3 conjugation (r3) | `n = [[0,1],[−1,0]]` | `n diag(a,b) n⁻¹ = diag(b,a)` | `t^(−λ)`, as stated | none |
| §3A.3 compact comparison placement (r3) | `*Needs:* §4.3` | forward need from Layer 3A into Layer 4; Layer 3A Dependencies omit Layer 4 | build-order note | R04 |
| §3A.4 Iwahori (r3) | `SL₂` | `[[1,0],[t,1]]` in `I`; `[[1,0],[1,1]]` not; `α(λ) = 2` | as stated | none |
| §3A.5 chart bounds (r3) | `GL₂`, `N = 0, 1` | `t^(−k)O e₂ ⊕ O e₁ ⊄ t^(−N)O²` for `k > N`; `t^kO e₂ ⊕ O e₁` colength `k` | witness wrong | R03 |
| §3A.5 stratum bound (r3) | `t^λ` | `N = max|⟨λ,ω⟩|` bounds the chart | as stated | none |
| §3A.5 Cartan decomposition (r3) | `GL₁`; `SL₂` | `ℂ((t))ˣ = ⊔ Oˣt^n`; elementary divisors `(t,t⁻¹) ≠ (t²,t⁻²)`; `W\(Y⋊W)/W ≃ Y⁺` | as stated | none |
| §3A.5 `SL₂` Schubert variety (r3) | `λ = α^∨` | `dim = 2`; closure adds `L₀`; fibre `ℙ¹` | as stated | none |
| §3A.5 Iwahori–Matsumoto hypotheses (r3) | their `G` | adjoint Chevalley group, any discretely valued field; reductive extension is a target | as stated | none |
| §3A.6 positive double cosets (r3) | `GL₂` | `diag(t,1)`, `diag(1,t)` Weyl-conjugate; `det = t²` component `2` | as stated | none |
| §3A.7 `PGL₂` cocharacter (r3) | `α^∨/2` | `[diag(t,1)]² = [diag(t,t⁻¹)]` | as stated | none |
| §4.1 oper condition (r3) | `PGL₂`, `ψ = t`, `0`, `ε + t⁻¹` | unit in `ℂ((t))`, not `ℂ[[t]]`; never; `t⁻¹(1 + εt)` unit | as stated | none |
| §4.2 normalization (r3) | `[[1,u],[0,1]]` on `[[a,b],[1,−a]]` | `u = −a` gives `b + a² + a′`; `ψ = 2` not normalizable over `ℚ` | as stated | none |
| §4.3 Chevalley checks (r3) | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `ℂ[h²]`; `ℂ[h₁+h₂, h₁h₂]`; exponents `1, 2`; `Lie(μ₂) = 0` | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` (r3) | `a = εt⁻¹` | `q = −εt⁻²` | as stated | none |
| §4.3 torus matching, realification (r3) | `𝔾_m`; `S¹`, `μ_n` | Zariski closure of `S¹` is `𝔾_m`, of `μ_n` is `μ_n` | as stated | none |
| §4.4 `SL₂`-lifts (r3) | `g = diag(√t, 1/√t)` | residue `−½ ∉ ℤ` | as stated | none |
| §5.1 Schwarzian cocycle (r3) | `ψ = t + t²` | `{ψ,t} = −6/(1+2t)²`; `{at,t} = 0` | as stated | none |
| §5.2 evaluation (r3) | `q = t⁻²`, `N = 2, 5` | `eval_q(q_(−2)) = 1`; `q_j ↦ 1` kills no `ker(proj_N)` | as stated | none |
| §5.3 elimination (r3) | `n = 2`, `(a,−a)` | `−y₂″ + (a′ + a² + q)y₂ = 0` | agrees with §4.2 and Frenkel | none |
| §5.4 gauge witness (r3) | `g = [[c − ts, −s],[−s + tc, c]]` | `gA₀ − A₁g = g′` | `gauge(g, A₀) = A₁` | none |
| §6.1 finite monodromy, torsors (r3) | `𝔾_m`; `μ₂` | kernel open ⇒ root of unity; `H¹(ℂ((t)), μ₂) = ℤ/2` | as stated | none |
| `exists_cyclicVector` (r3) | `V = 0`; `D = 0` on `F²`; `𝔽_p(t)`, `V = F^(p+1)` | `Fin 0` independent; no cyclic vector; `D^p v = 0` | both hypotheses needed | none |
| §6.2 Katz candidates (r3) | `e₀ = (1,t)`, `e₁ = (−t⁻¹,0)` | `a = 1`: determinant `t⁻²` | as stated | none |
| §6.2 lattice estimate (r3) | `∇ = ∂ + t⁻²` | relative dimension `−2` | as stated | none |
| §6.3 coordinate derivation sign (r3) | `φ_s = t + sε` | `d/ds f∘φ_s⁻¹ = −εf′`; `r ≤ −2` | as stated | none |
| §6.3 conjugation formula (r3) | `(g⁻¹,1)` | first component `t^(−r) gauge(g⁻¹, A)` | as stated | none |
| §6.3 `SL₂` Schubert cells (r3) | `s₀`, `s₁`, `s₀s₁` | `ℓ = 1, 1, 2` | as stated | none |
| §6.4 order bound (r3) | `A = 0`, `r = −2`; `exp(t⁻³x)` | `gauge(t^(−λ), 0) = λt⁻¹`; `h = exp(−t⁻³x)`, `gauge = −3t⁻⁴x` | sign slip | R07 |
| §6.4 leading coefficient (r3) | `SL₂`, `t⁻²h`; `t⁻²f` | `h` semisimple; at `r = −3`, `A_(−3) = 0`; `f` regular nilpotent | as stated | none |
| §6.5 cohomology (r3) | `μ_n`, `𝔾_m` | `H¹(μ_n) = ℤ/n`; `H²(μ_n) = 0` | as stated | none |
| §7.1 cotangent algebroid (r3) | `{x,y} = 1`; `{x,y} = x`; `k[x,y]/(x²,y²)` | `[dx,dy] = dx`, `anchor(dy)(x) = −x`; `{x²,y} = 2x ≠ 0` | as stated | none |
| §7.2 anchor sign, Heisenberg (r3) | `𝔤 = ℂ`, `t^m`, `t^n` | `−nδ_(m+n,0)` | as stated | none |
| §7.2 freeness (r3) | `𝔰𝔩₂` | `u = −a` forced | as stated | none |
| §7.3 Virasoro, KdV (r3) | `L_n = Res t^(n+1)q` | `c = −6`; `P_q(2q) = 6qq′ − q‴` | as stated | none |
| §7.4 coisotropy (r3) | `I = (q_j : j < 0)` | `{L₂,L₋₂} ↦ −3`; `{L₋₁,L₋₂} = q₁ ∉ I` | as stated | none |
| §7.5 Miura, screening, modes (r3) | `[[−u,0],[1,u]]` | `q = u² − u′`; `δq = 0`; `(q′)_(−a−1) = −a q_(−a)` | as stated | none |
| §8.1 `IsomOp` (r3) | `𝔾_m`; `g ∈ N((t))` | automorphisms `ℂˣ`; `g = 1` forced | as stated | none |
| §8.2 tangent and algebroid (r3) | `𝔰𝔩₂` | `[F_x,F_y] = −F_[x,y]` | as stated | none |
| §8.3 regular extension (r3) | `𝔾_m` | `dlog g ∈ ℂ[[t]]dt ⇒ g ∈ ℂ[[t]]ˣ` | as stated | none |
| §8.4 critical level (r3) | `κ_c = −½ Killing` | `κ₀(h,h) = 2` | as stated | none |
| §4.3 lower dictionary at the new generality (every affine algebraic `G` over `ℂ`) | `μ_n`; `𝔾_a`; `𝔾_m × ℤ/2`; trivial group; `GL_N` | `H = ℂ[x]/(xⁿ−1)`: `𝔤 = 0`, Krull dim `0`, `d = 0`, `n` discrete points modelled on `Fin 0 → ℂ`; `𝔾_a`: `d = 1`; `𝔾_m × ℤ/2`: `d = 1`, both components of dimension `1` by translation, Krull dim `1`; `H = ℂ`: `0 = 0`; `GL_N`: `d = N²`, chart with `det⁻¹` | holds; no nonreduced group exists in characteristic `0` (Cartier), so no counterexample to the smoothness step | none |
| §4.3 Cartier citations | hypotheses at the pin | `smoothCommHopfAlgProperty_of_charZero`: `[Field k] [CharZero k]`, `H : CommHopfAlgCat k`, `[Algebra.FiniteType k H]`; `finrank_lie_eq_ringKrullDim_of_charZero`: `(finrank k 𝔤 : WithBot ℕ∞) = ringKrullDim H`, same hypotheses | "`H` finitely generated" is `Algebra.FiniteType`; both as the bullet states | none |
| §4.3 bracket compatibility | `D, E ∈ 𝔤`, `h ∈ H`, `Δ = μ*` | `D^L h = Σ h_(1) D(h_(2))`; `D^L E^L h = Σ h_(1) D(h_(2)) E(h_(3))`; at `1` (apply `ε`): `Σ D(h_(1))E(h_(2)) = (D*E)(h)`; commutator at `1`: `D*E − E*D` | no minus sign, as stated | none |
| §4.3 "only ReductiveGroups Layers 0–2 and §2.4" | the inputs on main | Layer 1 line 207: faithful closed immersion into `GL_n` for every finite-type affine group scheme; Layer 2: `Lie(G)`, `Ad`; Layer 0: Hopf/points dictionary; §2.4: atlas of a smooth closed subscheme | inputs exist; no connectedness or reductivity used | none |
| Scope and §4.3: ownership of the complex Lie group `G(ℂ)` | ReductiveGroups on main and at #1676/#1808/#1797 | main Layer 11 line 1964 consumes F4.3; #1676 Layer 3A.5 lines 850–856 "owned here and consumed by Layer 11", Layer 11 line 3313 consumes 3A.5 | two owners at the open heads | R02 |
| Scope: §2.4 versus ComplexComparisonPartII C−1.1 | #848 head lines 913–919, 148 | C−1.1 hands "fixed-model maximal atlases, second countability, tangent/derivation, toric, group and gauge comparisons" to F2.4 and keeps complex points, open subspaces, fibre products, smooth charts, étale local inverses | consistent, one owner each | none |
| `polynomialLoopToFormal`, `positiveLoopToFormal` at the new pin | `AlgHom.mapValue` | type `(A →ₐ[R] B) → WithConv (H →ₐ[R] A) →* WithConv (H →ₐ[R] B)` with `[Bialgebra R H]`; elaborated types of both maps unchanged | build fails only on the namespace prefix | R01 |

## Not verifiable

- Nothing new in this round. The previous review's items stand: Kazhdan–Lusztig 1988 §4 Lemmas 6 and 8 and Kazhdan–Lusztig 1980 §2 (paywalled or no legal copy; uncertified in the README); Kostant 1963, Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985, Rinehart 1963 cited by locator and marked uncertified.
- The ReductiveGroups revisions #1808 and #1797 were read through `roadmaps show`, not from a checkout; their line numbers are those of that listing.

## Source issues

- none
