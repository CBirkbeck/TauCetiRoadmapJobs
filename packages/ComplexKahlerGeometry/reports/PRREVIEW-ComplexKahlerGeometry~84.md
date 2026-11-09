# Review of ComplexKahlerGeometry (pull request #1807 at 4dfed1c)

**Verdict:** needs changes

Thirteen findings: six blocking (P2) and seven P3. The gate passes and `Suggested.lean` compiles with only its 16 `sorry` warnings. Every statement in `Suggested.lean` survived the adversarial pass. The defects are in supplier ownership, in Layer 6's bundle identities, in the Layer 7 carrier, and in headline theorems that can be stated at the pins but are missing.

## R01 (P2) — Two suppliers are not on main: VariationalMethods and OperatorTheory/UnboundedOperators

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` 425–436 ("From TauCetiRoadmap.VariationalMethods and TauCetiRoadmap.OperatorTheory/UnboundedOperators"). Also 1327–1328, 1818–1833 and 1866–1867 (5.7), 1910–1913 and 1932 (5.8), 2030–2031 (Layer 5 Dependencies) and 106–108 (Scope).

**Claim.** 5.7 and 5.8 take the coercive solution operator, the compact-pair spectral theorem, `CompactFormPair.operator` and `closedFormOperator` from these two roadmaps.

**Witness.** Neither folder exists on main (3090489): there is no `TauCetiRoadmap/VariationalMethods`, and `TauCetiRoadmap/OperatorTheory/` has no `UnboundedOperators`. Both exist only as new-roadmap pull requests, #1028 and #1027, and neither is in the merge order. ComplexKahlerGeometry is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. The dependency check reports 0 problems only because it does not recognise either name.

**Repair.** Delete that contract subsection and every VariationalMethods/UnboundedOperators entry in Needs and Dependencies. Consume Mathlib instead:
- `IsCoercive.continuousLinearEquivOfBilin` (`Analysis/InnerProductSpace/LaxMilgram.lean:105`, real; complex forms through realification);
- `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean:436, 456`).

Then state in 5.7, as this roadmap's own targets:
- the compact self-adjoint Green operator `(Δ + 1)⁻¹` on B2.2's `L²`, compact by Rellich;
- its eigensection expansion;
- the `H²` realization.

In 5.8 replace "VariationalMethods §3.1's finite orthogonal-sum transport" with the finite direct sum of those Green operators.

## R02 (P2) — The twisted Kähler identities and `Δ″_E = Δ′_E + [iΘ(E), Λ]` are stated without the Kähler hypothesis

**Location.** README 2061–2066: "For a Hermitian holomorphic bundle `E` with 4.2's Chern connection, prove … the twisted Kähler identities `[Λ, ∂̄_E] = −i(D′_E)*` … Prove `Δ″_E = Δ′_E + [iΘ(E), Λ]` … (Demailly, Chapter VII, (1.2))."

**Claim.** The paragraph asserts these identities on any Hermitian base. 6.1's first paragraph is about Kähler forms, but this one never requires the base metric `ω` to be Kähler.

**Witness.** The identities fail without it, and the README's own Hopf numbers show this. Take the Hopf surface with trivial `E`, so `Θ = 0`. Then `Δ″ = Δ′` together with conjugation would give `h^(0,1) = h^(1,0)`, but 5.10's Check has 1 ≠ 0. Demailly's general identity (1.2, demailly-agbook line 16274) carries the torsion terms `[D′,τ*] − [D″,τ*]`.

**Repair.** Add "on a Kähler manifold `(X, ω)`" to that paragraph. Cite Demailly VII (1.1) with `τ = 0` for the twisted identities and (1.3), Akizuki–Nakano (line 16281), for `Δ″ = Δ′ + [iΘ(E), Λ]`. Keep (1.2) only if the general torsion form, with `τ = [Λ, ∂ω]`, is stated as well.

## R03 (P2) — Layer 7 headlines can be stated at the pins, but they are missing and the docstring says they are not statable

**Location.** `Suggested.lean` 46–52: "the projective computations of Layer 7, because the pinned complex-manifold structure on `Projectivization ℂ (Fin (n+1) → ℂ)` … cannot be imported beside `import Mathlib`; the torus, Hopf and Iwasawa computations …, whose carriers (complex tori …) are targets of ComplexTori". Also README 7.3, 2287–2289.

**Claim.** No Layer 7 theorem can be stated at the pins.

**Witness.** Both statements below compile, with `sorry`, in a scratch file that imports `Mathlib`, the built `Suggested` module and the pinned `TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace` and `TauCeti.Geometry.Manifold.Algebra.Quotient`:
- `finrank (DolbeaultCohomology (Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) p q) = if p = q then 1 else 0`;
- the torus statement on `AddAction.orbitRel.Quotient L E` with value `choose n p * choose n q`.

`Submodule.instLieAddGroupOrbitRelQuotient` (Quotient.lean:86) is pinned.

**Repair.**
- State `finrank_dolbeaultCohomology_complexTorus`: `L : Submodule ℤ E`, `[DiscreteTopology L] [IsZLattice ℝ L]`, value `(finrank ℂ E).choose p * (finrank ℂ E).choose q`. Import `TauCeti.Algebra.Module.ZLattice.Quotient` for compactness.
- State `finrank_dolbeaultCohomology_complexProjectiveSpace` for `p, q ≤ n`. Add it as a 7.2 target too: Scope line 61 claims the projective Hodge numbers, but 7.2 never states them.
- Rewrite the docstring so that only the Hopf and Iwasawa quotients and the Fubini–Study and line-bundle statements are listed as not statable.

## R04 (P2) — The ℂPⁿ carrier of 7.1 contradicts AlgebraicTopology Stage 4.6 in this same pull request

**Location.** README 2191–2194: "Use the single carrier `Projectivization ℂ (Fin (n+1) → ℂ)` with the pinned quotient topology … (Tau Ceti's `Projectivization.instTopologicalSpace` …, on which AlgebraicTopology Stage 4.6 builds the CW structure) and the pinned complex manifold structure". Also the contract at 315–326 and 7.2 at 2249–2257.

**Claim.** Layer 7 combines Tau Ceti's topology instance and complex atlas with AlgebraicTopology's CW structure on one space.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` 1211–1213, at this head, says this roadmap "takes the quotient topology itself from Mathlib". Its transported CW structure therefore lives on Mathlib's instance. Both instances are named `Projectivization.instTopologicalSpace` (Mathlib `Topology/Algebra/Projectivization.lean:44`, Tau Ceti `:90`), so they cannot both be loaded. As a result, 7.2's comparison of `u` with `[ω_FS]` cannot be formed.

**Repair.** Make Layer 7's carrier the pinned complex manifold `TauCeti.ComplexProjectiveSpace n` (`Geometry/Manifold/Instances/ComplexProjectiveSpace.lean:65`). AlgebraicTopology Stage 4.6 starts from that carrier's native `cwComplex`. Consume Stage 4.6's homeomorphism with `Projectivization` only where Mathlib's carrier is needed. The alternative is to own, in 7.1, the transfer of Tau Ceti's complex affine atlas to Mathlib's instance. Either way, update 7.1, 7.2, the Tau Ceti contract (315–326) and the docstring.

## R05 (P2) — The Frölicher inequality and the Euler-characteristic identity can be stated but appear nowhere

**Location.** README 8.1, 2360–2381. Its Check (2372–2375) asserts that `b_k ≤ Σ_(p+q=k) h^(p,q)` "holds on every compact complex manifold". `Suggested.lean` 53–54 says the spectral sequence "lacks the bicomplex spectral-sequence carrier of AlgebraicTopology Stage 5.0".

**Claim.** No target proves the inequality, and the docstring says Layer 8 has nothing statable.

**Witness.** Both theorems have a source: Demailly VI (11.2) (demailly-agbook line 15950) and (11.7) (line 16000, `Σ(−1)^k b_k = Σ(−1)^(p+q) h^(p,q)`). Both can be stated now with this file's `ComplexDeRhamCohomology` and `DolbeaultCohomology`. Iwasawa values (angella-iwasawa Appendix A): `b = 1,4,8,10,8,4,1` against `Σh = 1,5,11,14,11,5,1`; both alternating sums are 0. The filtered spectral sequence `CochainComplex.spectralSequence` is pinned.

**Repair.** Add both theorems as 8.1 targets with these locators. State them in `Suggested.lean` for compact `M`:
- `finrank (ComplexDeRhamCohomology E M k) ≤ Σ_{p ≤ k} finrank (DolbeaultCohomology E M p (k−p))`;
- the alternating-sum identity, cast to ℤ.

Correct the docstring: the pinned carrier is Tau Ceti `Algebra/Homology/SpectralSequence/Filtered/`; what is missing is the type-filtered complex de Rham cochain complex.

## R06 (P2) — The README says LieGroupoidsPoisson consumes this roadmap, which also consumes LieGroupoidsPoisson

**Location.** README 625–626: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds the complex Lie algebroid structures." Also 2504: "LieGroupoidsPoisson consumes 1.3's eigenbundle and involutivity dictionary". Meanwhile 8.2 and 8.3 (2426, 2469) need "LieGroupoidsPoisson §G1.3a".

**Claim.** Read as written, the two roadmaps supply each other.

**Witness.** `TauCetiRoadmap/LieGroupoidsPoisson/README.md` 85–91 on main says this roadmap "is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here". It adds that this roadmap may consume LieGroupoidsPoisson §G1.6.

**Repair.** Delete both sentences. If 1.3 uses the general subalgebroid/involutivity equivalence, add "LieGroupoidsPoisson §G1.6" to 1.3's Needs.

## R07 (P3) — Several "owned" targets and roadmap contracts are already pinned

**Location.**
- 1.3 (582–591): "Own what the pin lacks. … Extend `N_J` complex-bilinearly to `TM ⊗ ℂ` and prove its type identities"; Scope 30–34.
- 7.1 (2208–2210): "the upgrade of `OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism".
- Contracts 361–372: ComplexManifolds Milestone 3 for the `OnePoint ℂ` atlas, ComplexTori Milestone 1 for the fixed torus.

**Witness.** Each of these is a pinned declaration:
- `baseChange_nijenhuis_*` (`Symplectic/Manifold/Nijenhuis.lean` 283–358) gives every type identity, including `N(v^(0,1), w^(0,1)) = N(v,w)^(1,0)`.
- `OnePoint.diffeomorphProjectivization` (`Instances/OnePoint/Projectivization.lean`) is the 7.1 biholomorphism.
- `OnePoint.instChartedSpace` and `instIsManifold` (`OnePoint/Basic.lean` 207 and 236) are the `OnePoint ℂ` atlas.
- `Submodule.instLieAddGroupOrbitRelQuotient` is the fixed torus.

**Repair.** Delete these targets from 1.3, 7.1 and Scope. Cite the pinned names in the Tau Ceti contract. Narrow the ComplexManifolds Milestone 3 and ComplexTori Milestone 1 contracts to what the pin lacks (descent).

## R08 (P3) — Locators: Angella Theorem 4.1, and (8.5) where the stated form is (8.12)

**Location.**
- README 2432–2434: "Compute `h^(1,0) = 3`, `h^(0,1) = 2`, `b₁ = 4` … (angella-iwasawa, Theorem 4.1 and Appendix A)".
- `Suggested.lean` 333–335 and 342–343: the dimension-form decomposition and Hodge symmetry cited to "Demailly, Chapter VI, (8.5)".

**Witness.** angella-iwasawa Theorem 4.1 (lines 766–774) gives Bott–Chern numbers of the small deformations, not these values; they are in the Appendix A table (lines 917–920). The numerical statements `b_k = Σ h^(p,q)` and `h^(q,p) = h^(p,q)` are Demailly (8.12) (line 15523, p. 313). (8.5) is the canonical isomorphism.

**Repair.** Cite "angella-iwasawa, Appendix A". Cite "(8.12), p. 313" in both docstrings and in 6.2. Keep (8.5) for the canonical decomposition. That decomposition can be stated on classes of d-closed pure-type forms, so state it too or say in 6.2 why it is not.

## R09 (P3) — Substantive targets with no source locator

**Location.**
- 1.2: holomorphic inverse and implicit functions, submanifolds.
- 2.2: the parameter solver.
- 4.1 and 4.3: the section/reconstruction equivalence, holomorphic connections and the Riemann–Hilbert correspondence.
- 5.4: Montel.
- 5.5: the whole Sobolev scale, Rellich and embeddings.
- 5.9: `dvol = ωⁿ/n!` and `∂̄* = −⋆∂⋆`.
- 7.3: torus Hodge numbers and the Hopf diamond.
- 8.2: the Malcev lattice step.

**Witness.** None of these subsections carries a parenthesised source locator; the per-subsection count in the README finds 0 in each. Every theorem needs one.

**Repair.** Add locators, using keys the manifest already settles where possible:
- 8.2: raghunathan-discrete-subgroups Theorem 1.13, p. 23 (the lattice step Sakane invokes, sakane-parallelisable line 113).
- 5.9: Demailly VI §§4–6 (lines 14643–15216) or ballmann-kahler §5.
- 1.2: griffiths-harris Chapter 0 §§1–2.
- 5.5 and 5.7: wells-dacm Chapter IV.
- 4.3 and 7.3: standard texts with a theorem or page locator.

## R10 (P3) — A false Check in 2.3, and a chain-length slip in 3.4

**Location.**
- 2.3 Check, 793–795: "a definition by the Euclidean ball `|z| < 1` would decide both points the other way".
- 3.4, 1013–1015: "the primes `(z₁) ⊂ (z₁, z₂) ⊂ … ⊂ (z₁, …, z_n)` … form a chain of length `n`".

**Witness.** `(1, 0)` has Euclidean norm exactly 1, so the open Euclidean ball also omits it; only `(0.9, 0.9)` is decided differently. The listed chain has `n` primes, which is length `n − 1`; length `n` needs `(0) ⊂ (z₁)` as well.

**Repair.** Change the Check to "would omit `(0.9, 0.9)`; a closed-polydisc definition would contain `(1, 0)`". Start the chain at `(0)`.

## R11 (P3) — The docstring names a missing carrier that Mathlib already has

**Location.** `Suggested.lean` 40–42: "Serre duality and the Hodge theorem with coefficients in a holomorphic vector bundle, Koszul–Malgrange and the Chern connection, which lack the holomorphic-bundle mixin of ComplexManifolds Milestone 7".

**Witness.** ComplexManifolds Milestone 7 on main (README 321–323) says a holomorphic vector bundle "is literally `ContMDiffVectorBundle ∞ F E 𝓘(ℂ, EB)`", and that is native in Mathlib. What is absent at the pin is bundle-valued smooth forms and `∂̄_E`.

**Repair.** Name the carriers that are actually missing: `E`-valued type forms, the bundle Dolbeault operator, and connections on complex bundles.

## R12 (P3) — The rewrite drops heading anchors that roadmaps on main link to

**Location.** README 477–489 ("Former numbering …") maps `K2`, `K5` and `K7` to the new layers, but not their heading anchors.

**Witness.** These relative links on main will stop resolving once this merges:
- SmoothBundlesConnections 576 and PseudodifferentialOperators 2105 (`#k5-compact-hermitian-elliptic-theory-and-serre-duality`);
- MorseTheory 831 (`#k7-projective-torus-and-hopf-examples`).

The overlap check still lists them, and Hyperfunctions cites `#k2-dolbeault-calculus-and-the-local-lemmas`.

**Repair.** Add the three anchor slugs to the former-numbering list, for example "`#k5-compact-hermitian-elliptic-theory-and-serre-duality` → Layer 5", so that citing roadmaps and the overlap check can follow.

## R13 (P3) — Two other open pull requests rewrite this roadmap, and no order is stated

**Location.** The pull request description's merge-order paragraph names only #1101 and the stacked follow-up.

**Witness.** The overlap check finds that #1234 (`ComplexKahlerGeometry: normal frames, Picard and projective examples`, head a6ec295) and #1854 (head 7abe607) both change `ComplexKahlerGeometry/README.md` and `Suggested.lean`, and both conflict with this head.

**Repair.** State in the description which pull request is rebased on which, for #1234 and for #1854.

## Verified sound

**Gate and build.** The worker's gate passes at 4dfed1c (every scanner 0, build 0). The dependency check prints `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. That result is a false negative for R01: neither supplier is on main or in the merge order. No file changes outside the roadmap folders this pull request lists.

**Compilation and signatures.** A scratch copy of `Suggested.lean` compiles under `lake env lean` with the 16 `sorry` warnings and nothing else. I ran `#check @name` on all 27 declarations. All 16 theorems keep their binders. The 9 flagged definitions only lose `[FiniteDimensional ℂ E]`, which their bodies do not use; I changed nothing.

**Padding probe: no padding found.** On the scratch copy:
- `infer_instance` fails for `UniqueFactorizationMonoid` and `IsNoetherianRing` of the stalk;
- the `FiniteDimensional` probe times out;
- `dolbeaultCoboundaries E M p 0 = ⊥` closes by `rfl` and `polydisc` with `n = 0` is `⊤`, confirming the definitions.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Manifold.Orientation.card_eq` (`Orientation/Basic.lean:83`, which forces `m = finrank` in `hodge_theorem_deRham`);
  - `hodgeStar` (`HodgeStar.lean:73`); `codifferential` (`Codifferential.lean:88`);
  - `IsPseudoholomorphicWithinAt` (`JHolomorphic.lean:81`, which needs `HasMFDerivWithinAt`);
  - `IsOfType` (`AlmostComplexType.lean:201`); `typeProjection` (`:282`);
  - `nijenhuis` (`Nijenhuis.lean:158`); `nijenhuis_apply_left` (`:219`); `delBar_delBar_apply` (`Dolbeault/Basic.lean:405`, `−(4)⁻¹ • ∂f(N(v,w))`);
  - `SmoothTwoForm.Tames` and `Compatible` (`TwoForm.lean:174, 231`; `0 < ω(v, Jv)`, matching `IsKahlerForm`);
  - `integralTopForm` (`TopForm.lean:518`);
  - `TauCeti.ComplexProjectiveSpace.instIsManifold` (`:65`); `OnePoint.instIsManifold` (`:236`); `Submodule.instCompactSpaceOrbitRelQuotient` (`ZLattice/Quotient.lean:65`).
- Mathlib: `IsRegularLocalRing` (fields printed); `Projectivization.instTopologicalSpace` (`:44`); `CategoryTheory.Sheaf.H`.
- By name and file, 30 further cited names, among them `CovariantDerivative.leviCivitaConnection`, `TemperedDistribution.MemSobolev`, `BesselPotentialSpace`, `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`, `PowerSeries.IsWeierstrassFactorization`, `Opens.overPullbackSheafEquivOver` and `MDifferentiable.exists_eq_const_of_compactSpace`. All are present.

**Cross-roadmap citations resolved (all present unless stated).**
- On main:
  - ComplexManifolds Milestones 1–7, including 7.4–7.5; ComplexTori Milestone 1;
  - DifferentialGeometry Layers 0, 1, 2, 5, 6, 7, 8 and 12, with `legacySmoothTwoFormEquiv` at line 303;
  - SmoothBundlesConnections B2.1–B2.4, B3.1–B3.3, B4.1–B4.2, B5.0, B5.2 and B6.0–B6.3;
  - PDE §1.3 (A3), §1.7 (A7), §2.2 (B9), §5.3 (E22) and §5.6 (E25);
  - LieGroupoidsPoisson §G1.3a; GeometricTopology §1.7 and §1.7.1; RealAlgebraicGeometry Layer 7; HodgeStructures.
- At this head: AlgebraicTopology Stages 4.6, 4.7, 5.0, 6, 6.3 and 7.
- Absent from main: VariationalMethods and UnboundedOperators (R01).
- On main, SmoothBundlesConnections (line 60) treats this roadmap as a consumer only, so there is no cycle.

**Ownership against open pull requests.**
- GlobalHolomorphicFunctions (#992, Laurent decomposition), CalibratedGeometry (#946, Wirtinger) and DifferentialGeometry (#886) overlap this roadmap. This roadmap is on main and therefore earlier, so the citation is theirs to make.
- ComplexComparisonPartII (#848) has no checkout here, so it was not checked.

**Sources sample (15 targets).**
- 1.3, 3.1, 5.6 and 7.1 cite only pinned names, all opened.
- 3.3: Rainer Theorem 7.4 (line 716).
- 3.5: Demailly I (3.28) (line 1266); II (4.24) p. 98, (4.31) p. 100, (4.32) p. 101.
- 3.2 and 3.4: Demailly II (2.1), (2.3)–(2.4) with uniqueness at line 3817, (2.7), (2.10), (3.19), (4.19), (4.22) and (4.29).
- 4.2: Ballmann 3.18 (line 1400); Demailly V §12 (line 13218), (12.4) and (11.7).
- 5.10: Demailly VI (7.2) and (7.3) (lines 15385 and 15390).
- 6.1: Ballmann 4.17 items 2, 3 and 7, 5.22, 5.25 and 5.31; Demailly VI §5.3 and §6. VII (1.2) is R02.
- 6.2 and 7.2: Demailly IV (6.13)–(6.15) p. 216, V (15.5)–(15.6) p. 278, VI (8.6), (8.12) p. 313 and (8.17).
- 8.3: Angella Theorems 2.1 and 2.3 and Appendix A; Sakane Theorem 1 (p. 187, restated p. 189); Theorem 4.1 is R08.
- 4.3, 4.4, 5.8 and 5.9 have no locator (R09).

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `newlander_nirenberg` | `E=0`; `J=i` on `ℂ`; ℝ⁴ field of 1.3 | identity chart: `id∘i = i∘id`; ℝ⁴: `N_J(∂x,∂u)=[∂y,∂v+y∂x]=∂x≠0`, hypothesis fails | holds |
| `polydisc` | `n=0`; `r=(1,1)`; `r₁≤0` | `n=0` gives `⊤` (probe); `(0.9,0.9)`: `max=0.9<1`, in; `(1,0)`: `1≮1`, out; Euclidean norm 1, also out | definition right; Check wrong (R10) |
| `dolbeault_grothendieck_polydisc` | `n=1`, `φ=z̄ dz̄`; `n=2`, `z̄₂dz̄₁`; `p>n` | `ψ=z̄²/2`; `∂̄(z̄₂dz̄₁)=dz̄₂∧dz̄₁≠0`, excluded; forms of type `(p,q+1)` vanish, `ψ=0` | holds |
| `hartogs_extension` | `n=1`, `K={0}`, `f=1/z`; shell `1≤|z|≤2` | no extension, so `2≤n` is needed; complement has 2 components, so excluded | holds |
| `weierstrass_preparation(_unique)` | `w²−z`; `e^z w`; `d=0`; `f=z` | `u=1, a₀=−z`; `u=e^z`; `u=f`; all iterated derivatives 0, no `d`; uniqueness: `P−P′` has degree `<d` | holds |
| `isRegularLocalRing_holomorphicStalk` | `n=0,1` | `ℂ`, dim 0, `𝔪=0`; DVR, dim 1, `𝔪=(z)` | holds |
| `uniqueFactorizationMonoid_…` | cusp, node | `w²−z³` irreducible; `w²−z²−z³=(w−z√(1+z))(w+z√(1+z))` | holds |
| `rueckert_nullstellensatz` | `f=z²,g=z`; `k=0`; `f=1+z` | `m=2,a=1`; `g≡0`, `m=1`; zero set empty, `m=0`, `a=1/(1+z)` | holds |
| `oka_coherence` | `(z₁,z₂)`; `(z,z²)` | relation `(z₂,−z₁)`; `(z,−1)` generates `h₁=−h₂z` | holds |
| `hodge_theorem_deRham` | `m≠dim`; flat `T²`, degree 1 | `card_eq` forces `m=dim`; harmonic = constant forms, `b₁=2`; `cos x dx=d(sin x)` projects to 0 | holds |
| `DolbeaultCohomology` | `q=0`; compact curve, `(1,0)` | coboundaries `⊥` (`rfl`); image of cocycles has dimension `g`, the ambient quotient is infinite-dimensional | right |
| `…_serre` | Hopf; `ℂP¹` | `h^(0,1)=1=h^(2,1)`, `h^(1,0)=0=h^(1,2)`; `h^(0,0)=1=h^(1,1)` | holds |
| `IsKahlerForm` | `dx∧dy`; `−dx∧dy`; ε-form on `ℂ²` | `κ(1,i)=1`; `−1`, rejected; `κ(v,Jv)≥(1−ε/2)|v|²` but `κ(∂x₁,∂x₂)=ε≠0=κ(∂y₁,∂y₂)`, rejected | right |
| `…_eq_sum_dolbeault` / `_symm` / `even_…` | elliptic; `ℂP¹`; Hopf | `2=1+1`; `b₂=1=0+1+0`; Hopf `0≠1`, excluded by `hω` | holds |
| `lefschetzPow`, `hard_lefschetz` | `ℂ²`; curve `k=0`; `k=n` | `L²(1)=2dx₁dy₁dx₂dy₂`; `L(dx₁dy₁)=dx₁dy₁dx₂dy₂`; `ℂ^c→ℂ^c` iso since `∫ω>0`; `L⁰=id` | holds |
| Conventions `h_T`, Chern | `J`-linearity; frame change; `O(1)` | `h_T(Ju,v)=−i h_T(u,v)`; `A′=g⁻¹Ag+g⁻¹∂g`; `Θ=∂∂̄log(1+|z|²)=−2πiω_FS`, `∫ω_FS=1` | right |
| 6.1 bundle identities | Hopf, trivial `E` | would give `h^(0,1)=h^(1,0)`, but `1≠0` | fails (R02) |
| 6.1 scalar | `ℂ` | `[Λ,L]=1` and `−1`; `[Λ,d]=i∂̄*−i∂*=−(d^c)*` | holds |
| 2.1 Cauchy bound | `1/(1−z)`, `r=1/2`, `ρ=3/4` | error `2^(−N)`; bound `12(2/3)^(N+1)`; `N=0`: `1≤8` | holds |
| 2.2 solver | `q⁻¹`; `q̄` | `u=q⁻¹z̄`; `∂̄_q q̄=1≠0` obstructs | holds |
| 5.6 periods | `dz/z` | `c_U−c_L=0−(−2πi)=2πi`; `dz̄∧dz=2i dx∧dy` | holds |
| 5.5 / 5.7 | weights; `log log`; Peetre `s=−1` | `1≤(1+|ξ|)²/(1+|ξ|²)≤2`; `∫|∇u|²=2π/log 2`; `1≤√2`, wrong form needs `1≤√2/2` | holds |
| 4.3 monodromy | `d+λdz/z` | `s=cz^(−λ)`, `M=e^(−2πiλ)`; `λ=1/2` gives `−1` | holds |
| 6.2 HR | `f dz`; `ℂP¹×ℂP¹` | `i(−2i)|f|²=2|f|²>0`; `−∫(ω₁−ω₂)²=2>0` | holds |
| 7.2 / 7.3 / 8.3 | `ℂP¹`; Hopf; Iwasawa | `(1/π)·2π·½=1`; `h⁰(O(2))=3`; `b=1,1,0,1,1` matches the diamond; `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4` | holds |
| Frölicher (absent) | Iwasawa; Hopf | `b=1,4,8,10,8,4,1 ≤ 1,5,11,14,11,5,1`; `χ=0` on both sides | missing (R05) |

## Not verifiable

- webster-nn, pp. 303–316 (1.4): recorded in the manifest as uncertified (paywalled); not read.
- hormander-alpdo1, Theorems 2.3.4 and 2.3.5 (5.3): uncertified; not read.
- wells-dacm, Chapters II and IV (2.4, 5.7, 5.10, `Suggested.lean` docstrings): uncertified; not read.
- ComplexComparisonPartII (#848): no checkout was provided, so its use of 4.1 was not checked.

## Source issues

- **Misprint** in demailly-agbook at Chapter VII, proof of (1.1), p. 329 (line 16255): the source says "Prop. V-12.??", an unresolved cross-reference to the normal-coordinate-frame proposition; it should cite that proposition of Chapter V §12; affects nothing.
