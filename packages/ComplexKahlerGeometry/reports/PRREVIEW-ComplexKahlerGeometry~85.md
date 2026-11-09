# Review of ComplexKahlerGeometry (pull request #1234 at 28004ec)

**Verdict:** needs changes

Seven findings: three P2 and four P3. The gate passes, `Suggested.lean` elaborates with only its 26 `sorry` warnings, and the earlier off-main suppliers are gone.

## R01 (P2) — K6.1.RelativeIntegration takes over DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 and reverses the direction of supply

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2105–2108`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances." Items (i)–(iii) at `:2112–2144` plan the statements as this roadmap's own.

**Claim.** DeRhamCohomologyAndDuality is on main. It already owns all three statements over every real model with corners, which includes the boundaryless case, and it names this roadmap's K6.1 as their consumer. This pull request adds a second owner and states the opposite direction:
- (i) the relative smooth chain comparison is its §2.4 (`:384`);
- (ii) the relative complex `Ω^q(M)⊕Ω^(q−1)(U)`, the cone of a surjection and relative integration with absolute image `deRhamHom[α]` are its §§3.1–3.2 (`:443`, `:465`);
- (iii) the integration comparison, for compact `N` and with compact support, is its §4.1 (`:512`).

**Witness.** On main, `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:72–76` reads: "have a single owner, this roadmap … The open-pair comparison and compact-support formula that ComplexKahlerGeometry K6.1 uses … consumed from §§2.4, 3.1–3.3 and 4.1". `:695` says the same, and so does its open head (`:115–121`, `:1267`). It consumes nothing from this roadmap.

**Repair.**
- Replace the K6.1.RelativeIntegration block (`:2100–2172`) with one sentence: "K6.1 consumes the boundaryless instances of DeRhamCohomologyAndDuality §2.4 (relative smooth chains), §§3.1–3.3 (relative complex, relative integration, relative de Rham isomorphism) and §4.1 (integration comparison, compact and compact-support)".
- Repoint the uses "K6.1.RelativeIntegration (i)/(ii)/(iii)" at `:2018`, `:2074`, `:2082` and `:2090–2093` to §2.4, §3.2 and §4.1.
- Add DeRhamCohomologyAndDuality to K6.1's inputs and to `:2900`.
- Drop the Bott–Tu reference (`:2972`) if nothing else cites it.

Test on the README's own Checks:
- For the coboundary `d(Ψ,0)=(ψdx,Ψ|_U)` on `(ℝ,ℝ∖{0})`, §3.2's evaluation formula `∫_cα−∫_∂cβ` on the path from −1 to 1 gives `1−(1−0)=0`, as the README's sign Check requires.
- For `K=[−1,1]` and `η=ψdx`, the second bullet of §4.1 gives 1, as the compact-support Check requires.

## R02 (P2) — K6.0 states the Kähler identities and `Δ″_E=Δ′_E+[iΘ(E),Λ]` without the Kähler hypothesis

**Location.** README `:1858–1868`: "Develop `L=ω∧·` … Prove `[Λ,∂]=i∂̄*`, `[Λ,∂̄]=-i∂*` … Prove `Δ_d=2Δ_∂=2Δ_∂̄` … For a smooth Hermitian holomorphic bundle E … Prove `Δ''_E=Δ'_E+[iΘ(E),Λ]`".

**Claim.** Both paragraphs leave ω unqualified, while the surrounding text works with arbitrary Hermitian metrics: `:1812` "For an arbitrary smooth Hermitian metric", and K5b.0 at `:1711–1713`. For a non-Kähler ω all four identities acquire torsion terms.

**Witness.** demailly-agbook line 15156 (VI (6.4), p. 305) assumes Kähler. Lines 15221–15228 (VI (6.8), pp. 306–307) give `[Λ,d″]=−i(d′*+τ*)`, `τ=[Λ,d′ω]`. Line 15357 ((6.15), p. 309) and lines 16274–16282 (VII (1.2)–(1.3), p. 330) keep torsion terms unless ω is Kähler.

**Repair.**
- Begin `:1858` with "On a Kähler manifold (X,ω), dω=0," and `:1865` with "For a Hermitian holomorphic bundle E over a Kähler manifold (X,ω)".
- Cite Demailly VI (6.4)–(6.5), pp. 305–306, and VII (1.3), p. 330.
- Keep the pointwise Lefschetz algebra and the Nakano bound for any Hermitian ω.
- If RealAnalyticGeometry R3 needs the Hermitian versions, state VI (6.8) and VII (1.2), with the torsion operator τ, as separate targets.
- Add the Hopf surface as a negative-control Check.

Test: the Hopf surface carries Hermitian metrics, none of them Kähler. For any of them, `Δ_d=2Δ_∂̄=2Δ_∂` together with conjugation would force `h^(1,0)=h^(0,1)`. The README's own Check at `:1796–1797` gives `0≠1`.

## R03 (P2) — The Hodge numbers of complex tori can be stated at the pins but are missing, and the docstring's reason is false

**Location.** `Suggested.lean:85–86`: "the Hodge numbers of complex tori, the Hopf surface and the elliptic flat lines (K7): the pins have no complex torus `ℂⁿ/Λ`". README `:2535–2537` plans `h^(p,q)=binomial(n,p)binomial(n,q)`.

**Claim.** Tau Ceti pins a compact complex Lie group structure on the lattice quotient, so this K7 headline can be stated now. In the probe, `T2Space` is inferred and `finiteDimensional_dolbeaultCohomology` applies to the quotient.

**Witness.** `Submodule.instLieAddGroupOrbitRelQuotient` (`TauCeti/Geometry/Manifold/Algebra/Quotient.lean:86`, a complex Lie group for discrete `L`) and `Submodule.instCompactSpaceOrbitRelQuotient` (`TauCeti/Algebra/Module/ZLattice/Quotient.lean:65`). The statement below elaborates in a copy of the file: 27 `sorry` warnings, no error.

**Repair.** Import `TauCeti.Geometry.Manifold.Algebra.Quotient` and `TauCeti.Algebra.Module.ZLattice.Quotient`, then add under K7:

```lean
theorem finrank_dolbeaultCohomology_complexTorus
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E (AddAction.orbitRel.Quotient L E) p q) =
      (Module.finrank ℂ E).choose p * (Module.finrank ℂ E).choose q := by
  sorry
```

Then make these text changes:
- In the docstring, limit the K7 item to the Hopf surface and the lattice-character lines.
- In README `:2535`, name the theorem and cite the two pinned instances. ComplexTori Milestone 1 keeps only the descent.
- Give the computation a locator or mark it as this roadmap's own (R06).

Test:
- `n=1`: all four `h^(p,q)` equal `1=C(1,p)C(1,q)`.
- `p=2`: `C(1,2)=0`.
- `E=0`: the quotient is a point and `h^(0,0)=1`.

## R04 (P3) — No merge order with #1807, #1808 and #1854, and the order the last repair proposed would recreate a two-roadmap loop

**Location.** The pull-request description: its revision-dependency paragraph names only #1186, besides the #1398 note. README `:2227–2229`: "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2".

**Claim.**
- #1807, #1808 and #1854 change this folder, and their heads conflict with this one (`overlaps.md`). No order is stated.
- At those heads AlgebraicTopology owns the `Projectivization`/sphere-quotient homeomorphism and the transported cells, and ComplexKahlerGeometry K7 consumes them. That is how those revisions cut the loop on main: AlgebraicTopology Stage 7 consumes this roadmap's K7.1/K7.2, while this roadmap consumes AlgebraicTopology Stages 4.6, 6 and 8.
- The last repair report suggests the opposite order: the AlgebraicTopology revisions would "replace their … ownership with citations of ComplexKahlerGeometry K7.1 and K7.2". That keeps AlgebraicTopology consuming this roadmap.
- `roadmaps grep` finds the same ownership clause at #1797 `:1404` and #1807 `:1211`.

**Witness.** On main, AlgebraicTopology `README.md:1593–1594`: "consumes ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure". At #1854 it owns the homeomorphism and the transported cells (`:1074–1079`), and its Stage 7 consumes its own Stage 4.6 (`:2205–2213`).

**Repair (description).** Add this sentence:

> "This pull request merges first. #1807, #1808 and #1854 rebase on it. They keep their move of the homeomorphism and the transported cells into AlgebraicTopology Stage 4 item 6, turn K7.1's single-owner sentence into a citation of that item, and carry this pull request's new sections into their ComplexKahlerGeometry hunks."

The README needs no change at this head: on main no other roadmap owns the comparison.

## R05 (P3) — The README is still not in house shape

**Location.**
- `README.md:1` "# Complex manifolds, Dolbeault theory, and Kähler geometry"
- `:10` "## Conventions and suppliers"
- `:110` "## K1. Complex structures and type calculus"
- `:2864` "## Order and references"

**Claim.** These gaps were carried over from the previous review's R07 and remain:
- there is no `# Roadmap:` title and no **Summary.**;
- scope, conventions and supplier contracts share one section;
- there is no `## How to read the build`;
- the layers are not `## Layer …` headings with `### Examples` and `### Dependencies`;
- K1, most of K2, K3, K4 (before K4.P), K5b and K6.1 have no `*Needs:*` lines;
- there is no `## Downstream consumers` and no `## References`.

The repair report answered "applied differently": the restructure was left to #1854. That does not repair this folder:
- #1854 is a separate open revision whose ComplexKahlerGeometry text lacks this pull request's K4.P, K6.0.Planar*, K6.1.RelativeIntegration, K7.2.* and K7.FlatDegreeZero.
- If this pull request merges first, as both say, main carries the current shape until #1854 rebases.

**Witness.** `grep -c '^### Dependencies'` and `grep -c '^### Examples'` both return 0. Only 9 `*Needs:*` lines start a line, the first at `:972`. DeRhamCohomologyAndDuality on main (`:23`, `:113`, `:188`) shows the target shape.

**Repair.** Apply the previous review's list here. Alternatively, rebase this pull request onto #1854's restructured file and carry the new sections into it. Either way, the folder that merges must have the house shape.

## R06 (P3) — Locators: four targets lack a source or an "own" mark, and two PDE citations use stale labels

**Location and repair.**
- **K2.FiniteRankRunge** (`:282–310`). Rainer is cited only for Runge's theorem. The reconstruction `f(w)=π⁻¹∫_S(w−ζ)⁻¹f∂̄χ` is rainer-advanced-complex-analysis line 1295–1298, Theorem 10.3, printed p. 24. Cite it, and mark the finite-rank operator as this roadmap's own.
- **K5a.PlanarTwoForms** (`:1448–1455`). There is no locator. Cite Rainer, Theorem 12.2, p. 31 (line 1630), for the scalar solver on a domain, and mark the two-form step as this roadmap's own.
- **K5a.ComponentwiseCompact** (`:1603`). There is no locator. Mark it as this roadmap's own adapter.
- **Torus Hodge numbers** (`:2535–2537`). There is no locator. Give one, or mark the computation as this roadmap's own.
- **"PDE Lane A.3"** (`:1009`, `:1271`, `:2885`) and **"PDE Lane B.9"** (`:1283`). PDE on main has no lanes. Cite "PDE §1.3 (A3)" (`TauCetiRoadmap/PDE/README.md:769`, `W^{k,2}=H^{k,2}` for every k) and "PDE §2.2 (B9)" (`:1148`, interpolation).

**Witness.** Rainer prints p. 24 at line 1260 and p. 31 at line 1602; Theorem 12.2 is at line 1630. In PDE's README, `grep -c Lane` returns 0.

## R07 (P3) — `ContinuousFiberMetric` is attributed to SmoothBundlesConnections B2, but no library or roadmap declares it

**Location.** README `:1022–1023`: "the basis-independent Gram⊗h_E metric as B2's `ContinuousFiberMetric`: `h.inner x : V_x →L⋆[𝕜] V_x →L[𝕜] 𝕜`".

**Witness.** `roadmaps grep --fixed 'ContinuousFiberMetric'` finds only this README, on main and at this head, and neither pin declares it. SmoothBundlesConnections B2.2 (`README.md:605–616`) calls the metric "explicit data h … `h.inner x`". Mathlib's real carrier is `Bundle.ContinuousRiemannianMetric`.

**Repair.** Write "as SmoothBundlesConnections B2.2's continuous fibre metric h, with `h.inner x : …`". For the same reason, remove the backticks from `BundleTest`, `BundleDistribution` and `BundleSobolev` (`:1078`, `:1088`, `:1185`). This file does not declare these names, and its docstring says the carriers are not statable.

## Previous findings (review of a6ec295)

- **R01 (off-main suppliers) — repaired.** `grep -c 'GlobalHolomorphic\|VariationalMethods\|UnboundedOperators\|UO-D06\|GH[0-9]'` returns 0. In their place, `:282` makes K2.FiniteRankRunge the roadmap's own target, `:1448` does the same for K5a.PlanarTwoForms, and `:1536–1555` cites the pinned variational and resolvent theorems.
- **R02 (pinned K1 targets) — repaired.** `:115–130`, `:157`, `:161–172` and `:200–203` now cite the pinned orientation, conjugation, implicit-map and involutivity declarations.
- **R03 (Parameter Cauchy–Green) — repaired.** `:334` reads "is Tau Ceti's … and is cited, not proved again", with the four `…_with_param` theorems and their hypotheses.
- **R04 (delta series, OnePoint) — repaired.** `:1166–1171` and `:2237–2246` cite the pinned declarations.
- **R05 (absent headlines) — repaired.** `hodge_theorem_deRham` (`Suggested.lean:321`, README `:1578`) and `finrank_deRhamCohomology_le_sum_dolbeault` (`:527`, README `:2733`) are stated.
- **R06 (second owner of the ℂPⁿ comparison) — partly repaired.** The folder side is unchanged and consistent with main. The merge order is still missing from the description; see R04, which also corrects the proposed order.
- **R07 (house shape) — not repaired.** The LaTeX macros and the process phrase are fixed (`:135`, `:358`, `:2201`). The structure is carried as R05.
- **R08 (locators) — repaired.** `:590–596` splits (2.7) from (2.10) and marks regularity and dimension as the roadmap's own; `:2478` marks the quartic as its own worked example.
- **R09 (Bessel lemma) — repaired.** Both declarations are deleted; `:1285` and `:1686` keep the symbol as prose.

## Verified sound

**Gate and dependencies.**
- The worker's gate and my re-run both show every scanner at 0 and `OK`; the worker's run also has `build=0`.
- The dependency check (`--movable`) printed exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Every roadmap cited as a supplier is on main, among them ComplexManifolds, ComplexTori, DifferentialGeometry, SmoothBundlesConnections, PDE, PseudodifferentialOperators, AlgebraicTopology, RealAnalyticGeometry, GeometricTopology, StableReduction, LieGroupoidsPoisson and Completed/{RealAlgebraicGeometry, HopfRinow, ContourIntegration, HodgeStructures}.
- ComplexComparisonPartII, K3Surfaces, GeometricQuantization, HamiltonianReduction, IndexTheory and FormalConnectionsOpers appear only as consumers.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly 26 `declaration uses sorry` warnings.
- `#check @…` for all 32 declarations elaborates. Theorems keep their binders: `[T2Space M] [CompactSpace M]` on K5b, K6.1 and the Frölicher statement; `[I.Boundaryless]`, compactness and both Riemannian-bundle instances on `hodge_theorem_deRham`.
- The four `signatures.md` leads are definitions whose bodies need no compactness or finiteness binder.
- `hodge_theorem_deRham` needs no `finrank = m` hypothesis: `Orientation.card_eq` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:83`) forces it.
- The one-tactic probe replaced each `sorry` by `first | (simp; done) | rfl | infer_instance | (aesop; done) | (norm_num; done) | trivial`. All 26 theorems still failed, so none is padding.

**Library declarations opened at the pins (Tau Ceti `2fd255d`).**
- `Complex/Orientation.lean:216, 261, 297, 311, 330, 359, 423, 482`; the scoped instance `isManifold_real` `:195`.
- `DifferentialForm/MapCoeff.lean:322`.
- `Analysis/Complex/ImplicitFunction.lean:57`; `Geometry/Manifold/Complex/ImplicitFunction.lean:52`.
- `AlmostComplex/Eigenbundle.lean:96, 149`.
- `Pompeiu/Basic.lean:163, 219, 261, 286`: the factor is π, so `∂̄(π⁻¹∫)=f`, as the README says.
- `Pompeiu/Parameter.lean:75, 124, 158, 182`, with open `s`, compact `k` and `ContDiffOn ℝ n ↿g (s ×ˢ univ)`, as quoted.
- `Topology/FilledIn.lean:61`; `Normed/Module/Exhaustion.lean:86`.
- `Laurent/Basic.lean:49, 59, 82, 87, 123`; `Residue/PrincipalPart.lean:86`.
- `Variational/Spectrum.lean:138, 193, 199, 550`; `LaxMilgram.lean:65`; `LinearPMap/SelfAdjoint.lean:393`; `Resolvent/Compact.lean:68`; `LinearPMap/Eigenbasis.lean:113`.
- `Distribution/DeltaSeries.lean:68, 97`.
- `OnePoint/Projectivization.lean:66, 73, 140`.
- `Classical/FiniteCWType.lean:98`; `EulerCharacteristic/FiniteCWType.lean:163`; `EulerCharacteristic/ComplexProjective.lean:68`.
- `Riemannian/Codifferential.lean:88, 121, 252`: the sign is `(−1)^(m(k+2)+1)` on `(k+1)`-forms, matching the docstring.
- `Riemannian/HodgeStar.lean:73` (`RoughForm.hodgeStar`).
- `Projectivization.instTopologicalSpace`: Tau Ceti `:90`, Mathlib `:44`.
- A scripted pass over all 301 backticked identifiers found each one at a pin, or as one of this file's own names, except the cases in R07.

**Cross-roadmap citations resolved.**
- DifferentialGeometry 0.3, 0.4, 1.1, 2.1, 2.2, 5.4, 5.5, 6.1, 6.2, 8.3–8.5, 12.1, 12.3 and 12.4 are on main.
- PseudodifferentialOperators P1.0, SmoothBundlesConnections B2.2 and B6.1–B6.3, StableReduction Layer 4, GeometricTopology Layer 11 and Completed/HopfRinow Layer 1 are on main.
- LieGroupoidsPoisson §G1.3 (`:636`) is on main. LieGroupoidsPoisson `:85–86` lists this roadmap as a consumer only, and this README never names LieGroupoidsPoisson as a consumer, so there is no loop.
- RiemannianGeometry `:93` on main and at its open head `:749` consume K5a's Hodge theorem, so K5a owns it.
- GlobalHolomorphicFunctions (open) plans `exists_finite_rank_runge_operator` (`Suggested.lean:154`). This roadmap is on main and cannot consume it, so the duty to cite K2.FiniteRankRunge is GlobalHolomorphicFunctions'.
- Runge's theorem is at neither pin (`grep -rl Runge` finds only docstrings).
- Ownership against open pull requests was checked by object for: the Hodge theorem, Frölicher, finite-rank Runge, relative integration (DeRhamCohomologyAndDuality on main and at its open head), the ℂPⁿ comparison (AlgebraicTopology at #1797, #1807 and #1854), and the open heads of CalibratedGeometry, DifferentialGeometry and RiemannianGeometry.

**Sources: the seeded sample, read at the text.**
- **Parameter Cauchy–Green:** no external locator; the pinned names match.
- **K3.HolomorphicStalk:** demailly-agbook lines 3794 ((2.1)) and 3804–3817 ((2.3)–(2.4), with uniqueness), p. 80.
- **K5a:** VI (3.16)–(3.17) at lines 14583 and 14600, p. 295. The statement is compact Riemannian with a flat Hermitian bundle, and every class has a unique harmonic representative.
- **K5a.DistributionLocalStructure:** hormann-steinbauer-distributions line 1522 (Theorem 1.70, printed p. 35) and line 3759 (Theorem 4.22, printed p. 90, with `E_k ∈ C^(k−2)` on pp. 89–90).
- **K5a.PlanarTwoForms and K5a.ComponentwiseCompact:** no locator (R06).
- **K5b.0:** VI §7 at line 15370, p. 309 (`D*_E=−⋆D_E⋆`; principal part one half); (5.2)–(5.3) at lines 14858–14868, p. 300 (`d″*=−⋆d′⋆`).
- **K5b.1:** (7.2) at line 15385, p. 309; (7.3) at line 15390, p. 310.
- **K6.0.PlanarHodge and PlanarLaplacian:** VI (3.1)–(3.5) at lines 14323–14352, p. 291; Theorem 3.9 at line 14386, p. 292; I (3.1) at line 879, p. 20.
- **K6.1.RelativeIntegration:** Bott–Tu is uncertified; the duplication is R01.
- **Fubini–Study:** ballmann-kahler lines 1822–1874, Examples 4.10(5), (4.12)–(4.14), printed pp. 43–44. The coefficient `w̄_i w_j` of `dw_i∧dw̄_j` in (4.13) matches README `:2291`. Demailly VI (4.4) at line 14688, p. 297.
- **K7.2.RationalQuartic:** marked as this roadmap's own; values recomputed in the table.
- **K7.FlatDegreeZero:** berwick-evans-tripathy lines 287–292, §2.1, Remark 2.1, p. 6.
- **New locators:** Rainer Theorem 11.1 at line 1338, printed p. 25, is stated for a domain, as the README says. Demailly VI (11.1)–(11.3) at lines 15946–15969, pp. 322–323. VI (6.4), (6.8), (6.15) and VII (1.2)–(1.3), used in R02.

**Adversarial pass.** 52 rows, each computed this round. Every theorem and definition of `Suggested.lean`, the sampled targets and every target a finding touches are covered. Four rows carry findings (R01–R03); every other row passes.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `newlander_nirenberg` | `n=0`; `ℂ`, `J=i` | discrete M, φ constant to a point; `φ=id` intertwines `i` | Pass |
| `polydisc` | `r=−1`; `n=0` | empty open set; the single point of `Fin 0 → ℂ` | Pass |
| `dolbeault_grothendieck_polydisc` | `n=1,p=q=0`, `φ=dz̄`; `r≤0` | `ψ=z̄`, `∂̄z̄=dz̄`; empty domain, `φ=0`, `ψ=0` | Pass |
| `exists_mixed_parameter_dbar_solution` | `f=1`; `u=z`; `Ω=∅` | `u=z̄`: `(1+i(−i))/2=1`; `u=z`: `(1+i·i)/2=0`, the wrong operator; vacuous | Pass |
| `weierstrass_preparation` | `f=w²−z` | `iteratedDeriv 2 (w²) 0=2≠0`, `d=2`; `u=1`, `a₀=−z`, `a₁=0`, `a_i(0)=0` | Pass |
| `weierstrass_preparation_unique` | `n=0` | the `a_i` are constants vanishing at the point, so 0; `u=f/w^d` is forced | Pass |
| `weierstrass_division` | `w³` by `w²−z` | `w³=w(w²−z)+zw`: `q=w`, `r₀=0`, `r₁=z` | Pass |
| `ruckert_nullstellensatz` | `f=z²`, `g=z`; `k=0` | `m=2`, `h=1`; empty tuple: g vanishes near x, `m=1`, empty sum 0 | Pass |
| `oka_coherence` | `(z₁,z₂)` on ℂ²; `k=0` | relations generated by `(z₂,−z₁)`; `m=0` | Pass |
| `cartan_coherence_reducedIdeal` | `(zw)²` | generator `zw`, not `(zw)²` (`zw` vanishes on the set but is not in `((zw)²)`) | Pass |
| `riemann_extension` | `sin z/z`; `1/z`; `g=0` | extends by 1; excluded by `hbdd`; zero set ℂ has interior, excluded by `hA` | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | stalk ℂ, dimension 0, 𝔪=0; DVR, 𝔪=(z), dimension 1 | Pass |
| `uniqueFactorizationMonoid_holomorphicStalk` | `w²−z³` | irreducible: a factor `w±c(z)` needs `c²=z³`, but `z^(3/2)∉ℂ{z}` | Pass |
| `hartogs_extension_across_point` | ℂ; ℂ² | `1/z` excluded by `2≤finrank`; ℂ²∖{0}→ℂ extends | Pass |
| `hodge_theorem_deRham` | S¹ (`m=1,k=l=0`); flat T²; empty M | `d*(f dθ)=(−1)^3⋆d⋆(f dθ)=−f′`, harmonic `ℝ·dθ`, `b₁=1`; `(1+cos2πx)dx−dx=d(sin2πx/2π)`; all 0, `∃!` gives `α=0` | Pass |
| codifferential sign across sources | Demailly (3.9) vs pin; `m=2` | `(−1)^(mk+1)` and `(−1)^(m(k+2)+1)` have equal parity; at `m=2` both give −1, i.e. `δ=−*d*` of K6.0.PlanarHodge | Pass |
| `dolbeaultCocycles` / `DolbeaultCohomology` | ℂ, degree 1 | `h dz` is ∂̄-closed but of type (1,0), excluded by the type projection; `H^(0,1)(ℂ)=0` | Pass |
| `finiteDimensional_dolbeaultCohomology` | ℂ (non-compact) | `H^(0,0)` = entire functions, infinite-dimensional; excluded by `CompactSpace` | Pass |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf; elliptic with `p=2` | `1=1`; `h^(0,1)=1=h^(2,1)`; without `hp`, `h^(2,0)=0≠1=h^(0,1)` | Pass |
| `IsKahler` | `(ℂ,dx∧dy,i)`; Kodaira–Thurston | `ω(v,iv)=|v|²>0`, closed, `N=0`; symplectic with `N_J≠0`, `b₁=3` | Pass |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ` | `∫ω>0`, so not d-exact, so the hypothesis excludes it | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; elliptic `k=1`; Iwasawa | `1=0+1+0`; `2=1+1`; `4≠5`, so Kähler is needed | Pass |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(0,1)=1≠0=h^(1,0)` without Kähler | Pass |
| `even_finrank_deRhamCohomology_odd` | annulus; Kodaira–Thurston | `b₁=1` with boundary; `b₁=3` with `N_J≠0` | Pass |
| `lefschetzMap`, `hard_lefschetz` | `j=0`; ℂP²; S²×S² | identity; `1↦[ω]²`, `∫=1`; `(aσ₁+bσ₂)²=2ab≠0`, `σ₁²=0` | Pass |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=1`, `p=q=2` | `p≤n` fails, value 0 = no 4-forms on a surface | Pass |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=2` | `1,0,1,0,1`, alternating sum 3 = pinned `eulerChar_complexProjectiveSpace` | Pass |
| `integralCupPow`, `integralCohomology_complexProjectiveSpace` | `n=0`; S²∨S⁴; `u=2g` | `u=0`, `u⁰` generates ℤ; `u²=0` fails `k=2`; `m↦2mg` not onto | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `b₁=4=2·2`; `0=0` | Pass |
| `finrank_deRhamCohomology_le_sum_dolbeault` | point; Hopf `k=1,3,4`; Iwasawa `k=1`; ℂP¹ `k=2` | `1≤1`; `1≤0+1`, `1≤1+0`, `1≤1`; `4≤3+2`; `1≤0+1+0` | Pass |
| Frölicher stable page (K8 Check) | Iwasawa `n=3` | `d_r` vanishes for `r>max(p,n−p)`; `max(p,3−p)+1≤4` | Pass |
| Parameter Cauchy–Green | `g(q,z)=χ(z)q̄` | `∂̄_q∫(w−z)⁻¹g=∫(w−z)⁻¹χ`, nonzero since `∂̄_w` of it is `πχ≠0` (pin `:261`) | Pass |
| K2.FiniteRankRunge | `K=∅`; annulus `{2≤|z|≤3}` in `{|z|<4}`; `f=1` | `0≤0`; `f=1/z`, `sup_L|f|=2/3`, `|∮(f−Af)|=2π` on length `4π` gives `sup_K≥1/2>2ε/3` for `ε<3/4`; `A=0` gives `1>ε` | Pass |
| Pole pushing (Runge step) | `|c|>2sup_K|z|`; `b∈∂V∖Ω` | ratio `|z/c|≤1/2`; `b∉K` and the components of ℂ∖K are clopen in ℂ∖K, so `b∈W` | Pass |
| Rainer 10.3 vs README reconstruction | `w∈K` | `−π⁻¹∬∂̄ψ f/(ζ−w)=π⁻¹∬(w−ζ)⁻¹f∂̄ψ` | Pass |
| Filled exhaustion `K_j=C_(2j)` | pin `:86` | `K_j⊆int C_(2j+1)=int K_j^+`, `K_j^+⊆int K_(j+1)`, each filled | Pass |
| K3 Laurent comparison | `1/z²+3/z+5+z`; `φψ` | `circleLaurentCoeff (−1)=3`; the `(z−a)^(−n)` convention gives 1; `(1/z+1)(1/z−1)`: order −1 is `0`, order −2 is `1` | Pass |
| K5a.PlanarTwoForms | `h=1` on ℂ; wedge order | `u=z̄/(2i)`, `d(u dz)=(1/2i)(2i)dx∧dy`; `dz∧dz̄=−2i dx∧dy` flips the sign | Pass; locator R06 |
| K5a realification adapter | `a_+(u,u)=Q+i‖u‖²` | `Re((1−i)a_+)=Q+‖u‖²≥λ⁻¹(Q+λ‖u‖²)≥(c/λ)‖u‖²_(H¹)`, using `Q≥0`, `λ≥1` | Pass |
| K5a.DistributionLocalStructure | `m=2`; `m=k+2` | `H_2=t_+`, `C⁰`, `D²H_2=δ`; `H_m∈C^(m−2)` as H–S `E_k∈C^(k−2)` | Pass |
| K5a.ComponentwiseCompact | ℂP¹⊔ℂP¹, ranks 0, 2; `M=∅` | finite subcover = both components; empty index, zero spaces | Pass; locator R06 |
| K5b.0 `∂̄*=−*∂*` | `f dz̄` on ℂ | `*(f dz̄)=if dz̄`, `∂` gives `2f_z dx∧dy`, `*` gives `2f_z`, so `−2f_z`, matching the Check `:1793` | Pass |
| K6.0 normal coordinates | `diag(1+z₂+z̄₂,1)`; scaled ℂP¹ | `dω(0)≠0`; `(1+π|w|²)^(−2)`: `H(0)=1`, `dH(0)=0`, `|H−1|≤2π|w|²` | Pass |
| K6.0 Kähler identities | Hopf, any Hermitian metric | `Δ_d=2Δ_∂̄` with conjugation forces `h^(1,0)=h^(0,1)`; actual `0≠1` | Fail, R02 |
| K6.0.PlanarHodge / Laplacian | `x dx+y dy`; `x²+y²`; `|x|³` | `δ=−2`; `δ(h dx∧dy)=2y dx−2x dy`, `Δ_H h=−4` vs `laplaceBeltrami=4`; `Δ_H=−6|x|` | Pass |
| K6.1.RelativeIntegration | `(ψdx,Ψ|_U)`; `K=[−1,1]`, `[−3,3]` | cone pairing `1−(1−0)=0`; pairing 1 for both `K` (= DeRhamCohomologyAndDuality §§3.2, 4.1) | Duplicate, R01 |
| Fubini–Study | `w=(1,i)/√2`; `z=(1,0)`; `c=2`; `diag(1,2)` | `h(e₁,e₂)=i/(8π)` (transposed: `−i/(8π)`); `H_z(v,v)=1/π`; `|c|⁴=16`; `4/π` and pullback `4ω_FS(0)` | Pass |
| K7.2.RationalQuartic | `n=1,2`; general `n` | `(a,b,0,c,d)`; pair sums of `{0,1,3,4}` give `0..8`, kernel `x₀x₃−x₁x₂`; `S_n=S_(n−1)+{0,1,3,4}=[0,4n]` | Pass |
| K7.FlatDegreeZero gauge | arbitrary ρ | `|σ(1)|=e^(u−u)=1`; `Re(aτ)=uReτ−(uReτ−v)=v`, so `|σ(τ)|=1` | Pass |
| K7.FlatDegreeZero curvature, holonomy | flat `ω=dx∧dy`; `(0,v)` | `i∂∂̄u=−(Δ_d u)ω/2`, `u=−2Gφ` gives `iF′=0`; `(λ,v)~(0,ρ(λ)⁻¹v)` | Pass |
| Complex-torus Hodge numbers (absent) | `n=1`; `p=2`; `E=0` | `1=C(1,p)C(1,q)`; `C(1,2)=0`; point `1`; probe: 27 sorry, no error | Statable, R03 |
| `ContinuousFiberMetric` | both pins, all roadmaps | 0 declarations; 2 grep hits, both this README | R07 |

## Not verifiable

- Bott–Tu, Hörmander (ALPDO I), Griffiths–Harris, Wells, Webster and Raghunathan are recorded as uncertified, so their locators were not opened.
- #1797, #1807, #1808 and #1854 were read through `roadmaps grep` and `roadmaps show` only (AlgebraicTopology at #1854 in full).
- The table rows check instances; they are not proofs.

## Source issues

- **Misprint** in demailly-agbook at Chapter VI, (5.2), p. 300: the source extends the star by `u∧⋆v=⟨u,v⟩dV` with a Hermitian product and calls it ℂ-linear of type (n−q,n−p); it should read `u∧⋆v̄=⟨u,v⟩dV` (as in (3.3′)), since `dz∧⋆dz=0` on ℂ; affects nothing.
- **Misprint** in demailly-agbook at Chapter VI, §5.1, p. 300: the source says the vectors ∂/∂z_j form an orthonormal basis of the cotangent space; it should be the tangent space, the covectors dz_j being orthonormal in the cotangent space; affects nothing.
