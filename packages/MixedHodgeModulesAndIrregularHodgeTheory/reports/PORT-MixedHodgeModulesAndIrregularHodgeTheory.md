# PORT-MixedHodgeModulesAndIrregularHodgeTheory

## Result

- Branch: `roadmap/mixed-hodge-modules-and-irregular-hodge-theory`, one commit on `45f58db`.
- Head commit: `2ecdd81240c49bc890c6b68a34a6755ad3d81b97`, message `MixedHodgeModulesAndIrregularHodgeTheory: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/{README.md, Suggested.lean, metadata.toml}`. There is no diff outside the folder.
- Build (`lake build TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory.Suggested`), exact outcome line: `Build completed successfully (18239 jobs).` Warning count: one Lean warning, `Suggested.lean:146:8: declaration uses sorry`. Lake also prints its module-system advisory twice ("imports `Mathlib` … consider adding `module`"). The gate classifies that advisory as Lake's and not a lint (`MODULE_ADVISORY` in the gate). The file keeps the single `import Mathlib` that the brief prescribes.
- Gate summary line: `gate MixedHodgeModulesAndIrregularHodgeTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check, full output:

  ```text
  depcheck: 223 roadmaps, 1985 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README found no cross-roadmap citation and no Lean name that resolves nowhere. Its note that Lean names outside TauCetiRoadmap were not checked is covered below: I checked every Mathlib and Tau Ceti name by hand at the pins.

## Which text was ported

The board checkout of this worker is the main branch of the jobs repository. Its `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md` is still the round-1 submission (commit `4e94c200`, 1150 lines), and its `review.json` is the round-2 review, which has 9 blocking findings. The reviewed text sits on the package's FIX branch: FIX~3 (`7d6c1f36`) through FIX~7 (`cf50494f`) and FIX~8 (`5df5bbfd`).

- REV~7 (of `cf50494`) had two P3 findings and no blocking ones.
- FIX~8 applied both, so `5df5bbfd` is the accepted package.

I ported `packages/MixedHodgeModulesAndIrregularHodgeTheory/{README.md, Suggested.lean, metadata.toml}` at `5df5bbfd`. I read it from a sibling worker's checkout of that branch and did not edit that checkout. Its `Suggested.lean` and `metadata.toml` are byte-identical to the board copies; the README differs in 156 paragraphs.

An unfinished red-team pass on `5df5bbf` (RT~1a, an uncommitted report in another worker's checkout) lists four findings, R01–R04. I treated them as claims: each was checked against the cached source text, found correct and repaired (see "Fixes"). The worker may want to re-point the board's `review.json` to the accepted round.

## Draft pull request body

This roadmap builds Saito's theory of polarizable and mixed Hodge modules on smooth complex quasi-projective varieties, the Kontsevich–Soibelman category of exponential mixed Hodge structures with its projector `Π`, and the irregular Hodge filtration of exponentially twisted de Rham cohomology, as a general library rather than a route to one application. It starts from what the earlier roadmaps supply: algebraic `D`-modules, Deligne's regular-singular Riemann–Hilbert theory, the formal classification of differential modules, the monodromy filtration, pure variations of Hodge structure and their one-variable degenerations, and Tau Ceti's linear pure and mixed Hodge structures and Koszul complexes. On these it constructs:

- algebraically constructible Betti sheaves with rational and complex coefficients, with Kashiwara's regular Riemann–Hilbert correspondence;
- exponential twists and Fourier–Laplace transformation of holonomic modules;
- graded-polarizable variations of mixed Hodge structure, their limits on the full nearby space, admissibility, and Zucker's `L²` theory on curves;
- pure and mixed Hodge modules with their six operations, weights and nearby cycles;
- exponential mixed Hodge structures, the Deligne filtration, `E₁`-degeneration and the strict bifiltered realization;
- the exponential cohomology of a pair `(U, f)`;
- the logarithmic and Newton descriptions of the irregular Hodge filtration.

The end theorems are:

- Saito's projective direct-image and abelianness theorems;
- Esnault–Sabbah–Yu's `E₁`-degeneration with Fresán–Sabbah–Yu's strict bifiltered realization;
- Fresán–Sabbah–Yu's classicality of the `tg` pair cohomology, the Fourier costalk and Hodge-number theorems, and the Matsui–Takeuchi monodromy weights at infinity of `Π M`;
- the Adolphson–Sperber concentration and volume theorem for a Newton-nondegenerate Laurent polynomial, with Yu's Newton–Hodge comparison.

These are the interfaces that the Hodge theory of Kloosterman connections and other exponential motives consume. `Suggested.lean` states the Adolphson–Sperber theorem, the one headline that is statable at the pins, on Mathlib's monoid algebra, convex hull, exposed faces and Lebesgue measure. Its docstring names the carriers that the other headlines lack.

## Roadmaps this one depends on that are still pull requests

ComplexComparisonPartII, FormalConnectionsOpers, PadicDifferentialEquationsAndRigidCohomology, ShimuraData, ShimuraVarieties, LefschetzPencilsAndVanishingCycles, SchemeKTheoryOperations, AnalyticToricGeometryPartII, AlgebraicTopologyPartII, SpringerResolutionAndCharacteristicCycles, and StratifiedSpacesAndTameTopology.

- StratifiedSpacesAndTameTopology is another author's pull request that adds a new folder. It is not in the merge order.
- All the others are earlier than this roadmap in the merge order.

Suppliers on main: ResolutionOfSingularitiesCharacteristicZero, EtaleCohomologyFoundations, EnhancedDerivedSheaves, SchemeAndStackFoundations, AlgebraicCurves, AnalyticToricGeometry (completed) and GroebnerGeometry.

No cited id is defined only by an open revision; the overlap report lists none, and I found none.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already has the required form:

- one module docstring, which names the headlines that are not statable and what each lacks;
- one `sorry`'d theorem, `twistedDeRham_concentration_finrank`, the Adolphson–Sperber headline;
- the twelve real-bodied definitions its statement needs: `LaurentRing`, `eulerDerivation`, `twistedEuler`, `twistedDifferential`, `forms`, `cocycles`, `coboundaries`, `topCohomology`, `latticePoint`, `newtonPolytope`, `faceEulerEval` and `IsNewtonNondegenerate`.

It has no padding, no sorry'd data and no `set_option`, and it imports only `import Mathlib`. It is kept byte-identical.

I checked whether other headlines are statable at the pins. Every other end theorem needs mixed Hodge modules, `F_irr` or exponential mixed Hodge structures, none of which exists at the pins. The `E₁`-degeneration of the Newton filtration (the "Moreover" clause of 12.6, Yu Corollary 4.2) is statable, but the roadmap treats it as an intermediate, not an end theorem, so it is not added.

I also considered Tau Ceti's `TauCeti.koszulComplex` for the twisted de Rham complex and did not use it. That complex is the Koszul complex of a linear functional over a commutative ring, while the twisted de Rham complex is the Koszul complex of the commuting differential operators `θ_j + θ_j(φ)`, which are only `ℂ`-linear. Recasting the Laurent ring as a module over `ℂ[t₁, …, t_n]` through these operators would need a commutation proof inside a definition.

### Mechanical binder check

I appended `#check @name` for all 13 declarations, plus six cited Mathlib names, to the module, built it once, then removed the lines. The elaborated types:

- `LaurentRing : ℕ → Type`
- `@eulerDerivation : {n : ℕ} → Fin n → LaurentRing n →ₗ[ℂ] LaurentRing n`
- `@twistedEuler : {n : ℕ} → LaurentRing n → Fin n → LaurentRing n →ₗ[ℂ] LaurentRing n`
- `@twistedDifferential : {n : ℕ} → LaurentRing n → (Finset (Fin n) → LaurentRing n) →ₗ[ℂ] Finset (Fin n) → LaurentRing n`
- `forms : (n : ℕ) → ℕ → Submodule ℂ (Finset (Fin n) → LaurentRing n)`
- `cocycles` and `coboundaries : {n : ℕ} → LaurentRing n → ℕ → Submodule ℂ (…)`
- `topCohomology : {n : ℕ} → LaurentRing n → Type`
- `latticePoint : {n : ℕ} → (Fin n → ℤ) → Fin n → ℝ`
- `newtonPolytope : {n : ℕ} → LaurentRing n → Set (Fin n → ℝ)`
- `faceEulerEval : {n : ℕ} → LaurentRing n → Set (Fin n → ℝ) → Fin n → (Fin n → ℂ) → ℂ`
- `IsNewtonNondegenerate : {n : ℕ} → LaurentRing n → Prop`
- `twistedDeRham_concentration_finrank : ∀ {n} (φ), affineSpan ℝ (newtonPolytope φ) = ⊤ → IsNewtonNondegenerate φ → (∀ r, r ≠ n → cocycles φ r ≤ coboundaries φ r) ∧ FiniteDimensional ℂ (topCohomology φ) ∧ ↑(finrank ℂ (topCohomology φ)) = ↑n.factorial * (volume (newtonPolytope φ)).toReal`

The file has no section `variable`s, so no binder can have been lost. Each type agrees with README §§12.4 and 12.6. Nothing changed.

The Mathlib checks confirm the exact statements that the README's supplier contracts quote:

- `ZLattice.covolume.tendsto_card_div_pow` (bounded, measurable, null frontier, limit `volume.real s / covolume L`);
- `Convex.addHaar_frontier`, `AddMonoidAlgebra.coeffLinearEquiv`, `IsExposed` (`B.Nonempty → ∃ l : StrongDual 𝕜 E, B = …`), `DerivedCategory` and `Polynomial.derivative_mul`.

Every Tau Ceti name the README uses was found at the pinned commit (`2fd255d`) in the file it cites:

- `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.MixedHodgeStructure`, `TauCeti.Hodge.MixedHodgeStructure.Hom` with `range_inf_F_eq_map_F`, `range_inf_WQ_eq_map_WQ` and `range_inf_iSup_deligneSplittingFamily_eq_map_iSup`;
- `TauCeti.Hodge.MixedHodgeStructureCat` and its instance `abelian` (`Mixed/Abelian.lean:33`);
- `TauCeti.Hodge.IsPolarization`, `Polarization` and `IsPolarizable` (`Polarization.lean:72, 159, 221`);
- `TauCeti.Hodge.tate`, `tate_F` and `HodgeStructureOn.tateTwist`;
- `TauCeti.Ring.IsCohenMacaulay` (`RingTheory/CohenMacaulay/Ring.lean:40`, Noetherian with Cohen–Macaulay localizations, as the README says);
- `TauCeti.LocalCoefficientSystem`;
- `TauCeti.koszulComplex` (`KoszulComplex/Basic.lean:219`), `TauCeti.koszulComplex.homologyZeroEquivSpan` (`:399`) and `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` (`KoszulComplex/Regular.lean:140`), the last stated for `RingTheory.Sequence.IsWeaklyRegular R (List.ofFn x)`.

## Supplier replacements and duplication removals

- **Tau Ceti Koszul complexes (added supplier).** Step 12.5 (c) says that the graded Newton complex, the Koszul complex of a regular sequence of leading forms, is acyclic outside the top degree. That is `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` at the pin, read through Koszul self-duality, with the top cohomology given by `TauCeti.koszulComplex.homologyZeroEquivSpan`. I added both, with `TauCeti.koszulComplex`, to the Scope (as Tau Ceti's, not restated), to the Tau Ceti supplier contracts, and to 12.5's statement, `*Needs:*` and Dependencies. The contract says why the ungraded twisted de Rham complex of 12.4 is not an instance.
- **SpringerResolutionAndCharacteristicCycles §8.1 (added contract).** The README used quasi-coherent left `D`-modules and their coherent subcategory throughout without citing the section that builds them. I added §8.1 to the Scope, to the supplier contract and to the `*Needs:*` and Dependencies of 4.1 (`§§8.1–8.4`).
- **Duplication sweep, by object.** I searched the roadmaps on main, the 449 open heads (with the `roadmaps grep` tool) and the board packages for each object this roadmap owns:
  - perverse sheaves and algebraically constructible complexes;
  - Verdier duality and nearby cycles;
  - regular Riemann–Hilbert;
  - the Kashiwara–Malgrange filtration;
  - Hodge modules and variations of mixed Hodge structure;
  - Fourier–Laplace transformation;
  - twistor `D`-modules;
  - Zucker's `L²` theory;
  - Whitney stratifications;
  - Newton polytopes, Adolphson–Sperber and Kouchnirenko;
  - the irregular Hodge filtration and exponential mixed Hodge structures.

  I found no second owner, so nothing was removed:

  - EtaleDualityAndPerverseSheaves and LefschetzPencilsAndVanishingCycles are étale.
  - ComplexComparisonPartII §§C6.1–C6.6 own finite-coefficient constructible topological coefficients and the `ℚ_ℓ` rationalization of adic systems, not `ℚ`- or `ℂ`-coefficient constructible categories. The README already draws this boundary.
  - Hyperfunctions HF3a's `ℂ`-module `f_!` is identified with ComplexComparisonPartII §C6.1 there.
  - PadicDifferentialEquationsAndRigidCohomology's Adolphson–Sperber material is the `p`-adic Dwork theory of hyperkloosterman sums. Its FSY irregular Hodge input is declared "assumed input data".
  - MappingClassGroupsAndCanonicalRepresentations cites this roadmap's §§3.1–3.3 and 5.6 for the rational variations and owns only real-coefficient variants.
  - PainleveEquations' Riemann–Hilbert is for moduli of parabolic connections.

  Ownership against open pull requests was checked with the tools for all open heads, not only the 213 sibling checkouts. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap.

## Fixes made as an upstream reviewer

Each fix was checked against the cached source text at the cited lines.

1. **§4.2, the Kashiwara–Malgrange characterization omitted bijectivity of `x` (P2).** The listed conditions (coherent `V₀D` pieces, exhaustive, the two shift inclusions, `x∂_x + α` nilpotent on `gr`) admit the constant filtration `U_α O = O`: every `gr^U_α = 0`, so nilpotence holds trivially. The README nonetheless claimed that these conditions characterize `V`.
   - ESY Definition 2.2.2(1c) (ESY line 1029) requires `t′ : V_α → V_{α−1}` to be an isomorphism for `α < 1`.
   - The condition is added to the construction, with that locator, and the API bullet now names it.
   - A negative-control Check is added: `U_0 O = O → U_{−1} O = O` is not onto; the genuine filtration has `V_0 O = O`, `V_{−1} O = xO`, and `gr^V_0 O = ℂ·1`.
2. **§3.4, the third Check is false with no punctures (P3).** With `C° = C = P¹` and `L = ℚ`, the monodromy condition is vacuous but `H⁰ = ℚ` and `H² = ℚ(−1)`. The Check now assumes a connected curve with a nonempty puncture set. Under that assumption:
   - the local invariants vanish, so `j_* = j_!`;
   - the global monodromy is nontrivial, so `H⁰ = 0`;
   - `H² = 0` by duality with the dual variation.
   The empty-puncture case is kept in the Check as the negative control.
3. **§12.9, the Künneth blow-up criterion was wrong (P2).** The route said to blow up where "the pole orders of `f` and `g` have opposite signs". Pole orders are nonnegative, so this never fires. CY §3.1 (CY lines 345–366) blows up `D₁ ∩ D₂` when `Δ_Y = ∏ᵢ (ord_{Dᵢ} f₁ − ord_{Dᵢ} f₂) < 0`, choosing the smallest such value.
   - The route now states that criterion with pole multiplicities `a_D` and `b_D`.
   - A Check is added for `f = 1/x`, `g = 1/y`. The differences are `1` and `−1`, with product `−1`. Before the blow-up, `x = 0`, `y = 0` and `x + y = 0` meet at one point of a surface. On `y = xu` the sum is `(u + 1)/(xu)`, transverse to the exceptional pole, and there the differences are `0`.
4. **§9.1, locator (P3).** "FSY, (A.14), p. 65" is the classical fibre comparison inside the proof of Proposition A.13 (FSY line 2981). The pair-cohomology definitions are the unnumbered opening displays of §A.5, p. 66 (FSY lines 2996–3002). The locator is replaced.
5. **§12.6, an unclear clause.** "The cone-to-Laurent inclusion is a quasi-isomorphism for `λ ≤ 0`" is restated as Yu Theorem 4.1(i) has it (Yu line 1407): for every `λ ≤ 0`, the inclusion of the Newton-filtered subcomplex `F^λ_Newton` into the Laurent complex is a quasi-isomorphism. Check: for `φ = x` and `λ = 0`, the subcomplex `ℂ·1 → ℂ{1, x}` has `H⁰ = 0` and `H¹ = ℂ`, as the Laurent complex does; for `λ = −1`, `ℂ{1, x} → ℂ{1, x, x²}` again has a one-dimensional `H¹`.
6. **Downstream consumers.**
   - EllAdicHomotopyTypesAndWeights is removed. Its README names this roadmap's §§5.1–5.2 only to say that it needs a different realization, Deligne's hyperresolution, and no `*Needs:*` line of it cites this roadmap.
   - Two roadmaps that do cite it are added: MappingClassGroupsAndCanonicalRepresentations (§§3.1–3.3, 5.6) and TopologicalMirrorSymmetryForHitchinSystems (4.6, 5.1 and Layer 9 at `f = 0`, under their former ids H.0/mixed-hodge-module, H.1/operations and P).
7. **Layer 10** had no introductory paragraph; a one-sentence one is added, as the other layers have.

The former-numbering table is kept. KloostermanMomentsAndPotentialAutomorphy (board package: Layers D, F, H.0–H.1, E, I, C, P, G, T, N), MotivicEtaleKTheory (N/logarithmic-filtration) and TopologicalMirrorSymmetryForHitchinSystems (H.0, H.1, P) cite the lettered ids, and the table maps every one of them.

## Adversarial mathematics pass

The table has one row per target, definition and convention. Values are computed; "—" in the last column means no change.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. degrees, `pℚ_X = ℚ_X[d]` of weight `d` | `A¹`; point | `pℚ_{A¹}` weight 1, `D(pℚ_{A¹}) = pℚ(1)` weight −1; point `d = 0` | sound | — |
| Conv. side change and point direct image | `i : pt → A¹`, `V` | left `F_p = Σ F_{p−1−k}V ∂^k`; DR `H¹ = coker ∂ = V`, `F_p H¹ = F_p V`; `F_0 V` enters `F_1` | sound | — |
| Conv. Tate | `ℚ(1)`, `ℚ(−1)` | weights −2, 2; `F^{−1}ℚ(1) = ℂ`, `F⁰ = 0` | matches `TauCeti.Hodge.tate_F` | — |
| Conv. smooth divisor `i^!`, `i^*` | point in `A¹` | `i^!ℚ[1] = ℚ(−1)[−1]`, `i^*ℚ[1] = ℚ[1]` | sound | — |
| Conv. specialization signs | log connection `A e₁ = e₀` | `T = 1 − 2πiA`, `N e₁ = −e₀`, `var(can e₁) = −e₀` | sound | — |
| 1.1 stratification of a map | `xy`; `j : G_m → A¹`; umbrella | fibre `{xy=t} ≅ ℂ^×`, zero fibre two lines; compactification `A¹`, `p = id`; `P¹` admits no map to `A¹` extending `x` (`Γ(P¹, O) = ℂ`) | sound | — |
| 1.2 six operations | `A¹`, `{0}` | `H⁰ = ℚ`, `H²_c = ℚ`; `RΓ_{0} = ℚ[−2]`; `D(ℚ_{A¹}) = ℚ[2]` | sound | — |
| 1.3 perversity | point; `A¹`; node | `Perv(pt) = Vect`; `ℚ[1]` perverse, `ℚ` not; node stalk `H^{−1}` rank 1 vs normalization 2 | sound | — |
| 1.4 cycles and `var` normalization | `t`, `t²`, `Rj_*L[1]`, `j_!L[1]` with `T = 1 + 2πiB` | `pψ(ℚ[1]) = ℚ`; `t²`: rank 2, eigenvalues ±1; `Rj_*`: `var = (2πi)⁻¹(1 − πiB)`, `var∘can = B`, `2πi·var ≠ var_top = 1`; `j_!`: `var = B`, `var_top = 2πiB = 2πi·var` with `N_φ ≠ 0` | sound | — |
| 1.5 Riemann–Hilbert | `O`, `δ₀`, `E^t` | `pDR(O) = ℂ[d]`; `pDR(δ₀)` in degree 0, unshifted degree 1; `E^t` irregular at ∞ | sound | — |
| 2.1 exponential twist | `E^{ct}`, `E^t` on `ℂ[t]` | `tⁿ ↦ n t^{n−1} + c tⁿ`; `d/dt + 1` unitriangular, so bijective; `H⁰_dR(A¹, E^t) = 0` vs `ℂ` | sound | — |
| 2.2 Fourier transform | `δ_a`, `O` | `D/D(τ−a) ↦ D/D(∂_t − a) = E^{at}`; `D/D∂_τ ↦ D/Dt = δ₀`; `FT²δ_a = δ_{−a}`; `[τ, −∂_τ] = 1` | sound | — |
| 2.3 convolution | `δ_a ⋆ δ_b`; `O ⋆ O` | `δ_{a+b}`; `FT = δ₀ ⊗^L δ₀`, `Tor₁ ≠ 0` | sound | — |
| 2.4 localized FT | `δ_a`; `O_{G_m}` via `j_+` vs `j_!*` | `E^{at}`, slope 1; rank 1 vs rank 0 | sound | — |
| 2.5 Fourier duality | `δ_a`, `O` | `𝔻E^{at} = E^{−at} = r_+E^{at}`; both sides `δ₀` on `O` | sound | — |
| 3.1 VMHS | `ℚ_S`, `ℚ(1)`, Kummer, `ℂ(1, t)` | `Q(a,b) = ab` positive on type (−1,−1); `W` flat; nonflat line excluded | sound | — |
| 3.2 limit MHS, primitive sign | Tate family; Legendre; monodromy −1 | `Tα = α − β`, `(log T)α = −β`, `Q(α, β) = 1`, `F¹_lim = ℂα`; Legendre weights 0, 2; `Ψ = Ψ_{−1}` | sound | — |
| 3.3 admissibility | rank-3 `T = 1 + J`; `A² ⊂ P¹×P¹` | `exp(zJ)F⁰(z) = span(a+ib, e)` constant; `N e ≠ 0` forces `N M₀ ⊄ M₋₂ = 0`; limit `F⁰ = ℂe₁` gives dims (1, 0) vs (0, 1) | sound | — |
| 3.4 Zucker | `P¹∖{0,∞}`; genus `g`; **no punctures** | `H^i(P¹, ℚ)`; `H¹` weight 1; `C = P¹`, `L = ℚ`: `H⁰ = ℚ ≠ 0` | Check 3 false without punctures | Check repaired (R02) |
| Layer 3 Legendre example | `R¹π_*ℚ` on `P¹∖{0,1,∞}` | `χ = 2·(−1) + (1+1+0) = 0`, so `H¹ = 0` | sound | — |
| 4.1 Rees strictness | identity shifted by one; `ω_X` | `coker = ℂ[z]/zℂ[z]`, `z`-torsion; `F_{−d}ω = ω`, `F_{−d−1}ω = 0` | sound | — |
| 4.2 V-filtration | `O`, `O(∗0)`, Kummer, `δ₀`, **constant filtration**, `D/D(x∂_x)²` | constant filtration has every `gr = 0` but `x : O → O` not onto; genuine `V_α O = x^{⌈−α⌉}O` (α<0); `δ₀ ∈ gr_1`; `x∘N_φ = 0`, `var∘can = N = −m₀` | characterization incomplete | condition and Check added (R01) |
| 4.3 primitive forms | Tate data on a curve, `w = 2` | `ψS(α, −Nα) = Q(α, β) = 1`; with `N`, `−1`; `φS(can α, can α) = +1` | sound | — |
| 4.4 strict support | `j : G_m → A¹`; monodromy −1 | `j_*pℚ` has quotient `δ₀ℚ(−1)`; `j_! = j_!* = j_*` | sound | — |
| 4.5 projective direct image | `P¹ → pt`; blow-up of `A²` | weights 0, 2 in degrees ∓1; `pℚ_{A²} ⊕ δ₀ℚ(−1)`, both weight 2 (stalk `H*(P¹)[2]`) | sound | — |
| 4.6 `MHM` | `ℚ(−1)`; `Ext¹(ℚ(0), ℚ(1))`; rank-3 on `G_m` | `gr^W_2` only; `ℂ/2πiℚ`; no relative monodromy filtration | sound | — |
| 4.7 abelianness | `δ₀ → j_!pℚ`; `ℚ(1) → E` | `W₀ = δ₀ℚ` equals the image; `W₋₂ ∩ F^{−1} = ℚ(1)_ℂ` | sound | — |
| 5.1 operations | `D(pℚ_{A¹})`; `pℚ ⊗^H pℚ` | weight −1; `Δ^*ℚ[2d] = pℚ_X[d]` | sound | — |
| 5.2 weight bounds | `G_m`; `P¹`; `ℚ(∓1)`; `ℚ[−1]` | `H¹ = ℚ(−1)` (2), `H¹_c = ℚ(0)` (0); `D ℚ(−1) = ℚ(1)`; `ℚ[−1]` ≤ −1, dual ≥ 1 | sound | — |
| 5.3 Hodge cycles | `pℚ_{A¹}`; `i_*V`; monodromy −1 | `ψ = ℚ` of weight 0; `φ = V`; `ψ₁ = 0`, full rank 1 | sound | — |
| 5.4 costalk | `pℚ_{A¹}`; `δ₀V`; one Jordan block | `H¹ i^! = ℚ(−1) = coker 0`; `V`; `coker` of rank-1 `N` on `ℚ²` = 1 | sound | — |
| 5.5 divisor localization | `{0} ⊂ A¹`; node | node stalk `H^{k+1}(T²)`: `ℚ²` (deg 0), `ℚ` (deg 1) vs `ℚ` | sound | — |
| 5.6 rigidity | `pℚ_X`; extension class `x` on `A¹` | `V = ℚ(0)`; class 0 at `x = 0`, `i ∉ ℚ` at `x = i`; fails (a) at ∞ | sound | — |
| 6.1 `EMHS` | `pℚ`, `δ₀ℚ`, `K` | `RΓ = ℚ[1]`; `H⁰ ≠ 0`; `RΓ(K) = cone(ℚ → ℚ) = 0` | sound | — |
| 6.2 projector | `δ₀ℚ`, `pℚ`, `K` | `Π δ₀ = K`, `Π pℚ = 0`, `Π K = K` | sound | — |
| 6.3 tensor | `K ⊗_E K`; `δ_a ⋆ δ_b` | `K`; `Π δ_{a+b}` | sound | — |
| 6.4 weights | `K`; `Π δ₀ℚ(m)` | exp. weight 0, ambient 0 and 1; `−2m` | sound | — |
| 6.5 fibre | `pℚ`; `δ_a V`; `K` | `H¹_dR(A¹, E^θ) = 0`; `V_ℂ`; `ℂ` | sound | — |
| 6.6 Fourier localization | `δ₀`; `O` | `FT(j_!O) = FT(D/D x∂_x) = D/D(∂_t t) = O(∗0)`; `δ₀(∗0) = 0` | sound | — |
| 7.1 Deligne filtration | `δ₀ℚ(−1)`; chart at ∞ | jump at 1; `∂_x e^{1/x} = −x⁻²e^{1/x}` | sound | — |
| 7.2 Laplace specialization | chart change | `∂_θ = −x²∂_x`, so `z∂_θ + τ = −zx²∂_x + τ` | sound | — |
| 7.3 twistor, Deligne type | metric `|t|^a`, `a = 1/2`, `b = 1/4` | growth `⌈b−a⌉ = 0`, so `O`; canonical `⌈b⌉ = 1`, so `tO`; `P¹` direct image weights −1, 1 | sound | — |
| 7.4–7.5 strictness, `E₁` | `δ₀V`; `pℚ_{P¹}`; `K` | two-term complex, `F^pV → V` injective; zero fibre | sound | — |
| 7.6 bifiltered realization | `η : δ₀ → K`; `pℚ → j_*pℚ` | lines of weight 0, jump 0; `0 → ℂ` | sound | — |
| 8.1 classical embedding | `I(ℚ)`; `Π δ_a` | `K`; `φ_{θ,1} = 0` but fibre `ℂ`, so not classical | sound | — |
| 8.2 filtration agreement | `ℚ(−1)`; `K`; nonsplit `E` | jumps 1; 0; `F^{−1}` dim 2, `F⁰` dim 1 | sound | — |
| 9.1 pair cohomology | point; `(A¹, t)`; `(A¹, 0)` | `I(V)`; 0; `H⁰ = I(ℚ)`, `H²_c = I(ℚ(−1))` | sound | locator fixed (R04) |
| 9.2 de Rham realization | `(G_m, x)`; `(A¹, t)` | `dim H¹_dR(G_m, E^x) = 1`; 0 | sound | — |
| 9.3 Künneth and duality | `(G_m, ±x)`; `(A²,x+0)` | `I(ℚ) ⊗ I(ℚ(−1)) → I(ℚ(−1))`; 0; `H^•_c(G_m, 2x)` only in degree 1 | sound | — |
| 9.4 middle degree | `(G_m, x)`; `(A¹, x²)` | weights 0 ≤ 1 ≤ 2; `j_*L[1]` pure weight 1, `RΓ = 0` | sound | — |
| 9.5 divisor sequences | `{0} ⊂ A¹`, `f = x` | `H¹_c(G_m,x) = I(ℚ)`; `H¹(G_m,x) = I(ℚ(−1))` | sound | — |
| 9.6 torus sums | `k = 0, 1, k` | `I(ℚ)`; `I(ℚ(−k))`, `I(ℚ)`; de Rham dim `k!·(1/k!) = 1` | sound | — |
| 10.1 `tg` criterion | `g = 0`; `g = 1`; `g = x²` | `I(ℚ)` and `I(ℚ(−1))`; 0; reduced point | sound | intro added |
| 10.2 zero locus | `g = x`; `g = 0`; `g = xy` | `I(ℚ(−1))` twice; `H^{r−2}_c(A¹)(−1)` only `r = 4`; `H²_Z = ℚ(−1)²`, `H³_Z = ℚ(−2)` (= `H¹, H²` of `G_m²`) | sound | — |
| 11.1–11.2 Fourier costalk | `δ₀V`; `pℚ`; `K`; `δ_a` | `V` in degree 0; `ℚ(−1)` in degree 1; `H⁰ i^!K = ℚ`, `H¹ = ℚ(−1)` vs `H^•_dR(O(∗0)) = ℂ, ℂ`; 0 | sound | — |
| 11.3 Hodge numbers | `pℚ`; size-2 block | `gr⁰_F O` rank 1, so jump 1; `H¹` dim 1 vs rank 2 | sound | — |
| 11.4 constant correction | `δ₀ℚ`; `j_*L[1]` | `M′ = pℚ` weight 1; `Π M = M` | sound | — |
| 11.5 stationary phase | `O`; `δ_a`; `D/D(τ∂_τ)²` | `δ₀` ↔ `ℂ`; 0 ↔ 0; `τ∂_τ ↦ −(t∂_t+1)`, `N` at ∞ `= τ∂_τ` | sound | — |
| 11.6 weights at ∞ | `δ₀ℚ` | `Π = K`, `ψ_{∞,1} = ℚ` weight 0, `M″ = pℚ`, fibre `ℚ` weight 1 | sound | — |
| 12.1 log complex | `(pt,0)`; `x`, `x^m`; `(G_m,x)` | `F^λ = 0` for `λ > 0`; twist `⌊m(q−λ)⌋∞`; compact twist `−{0}` | sound | — |
| 12.2 toric blow-ups | `z/x` on surface; `O(−1)`, `O(−2)` | charts give `z′` and `1/x′`; `H^•(P¹, O(−1)) = 0`; `H¹(P¹, O(−2)) = ℂ` | sound | — |
| 12.3 model independence | `(A¹,x)`; `(G_m,x)`; `(A¹,x²)` | 0; `H¹(F^λ_log) = H⁰(P¹, O)` for `0 < λ ≤ 1`, 0 for `λ > 1`; `O(−1 + ⌊2−2λ⌋)` gives jump `1/2` | sound | — |
| 12.4 Euler, Koszul | `φ = x`; `φ = 0`; `n = 2` signs | `x^m ↦ m x^m + x^{m+1}`, coker `ℂ·1`; `C(n,q)`; `D₁D₂ − D₂D₁ = 0` vs `2D₁D₂` | sound | — |
| 12.4 Newton, nondegeneracy | `x`, `x+x⁻¹`, `(x+y)²`, constant, `n = 0` | `h(m) = m`; `|m|`; common zero on `x + y = 0`; empty face excluded; `ℝ⁰` full | sound | — |
| 12.4 toric sections | `φ = x`, `a = 0, 1`; `n = 0`, `a = −1` | ray coefficients 0, 1, so `{1}`, `{1, x}`; `0 ≠ ℂ` at `a = −1`, hence `a ≥ 0` | sound | — |
| 12.5 graded acyclicity | `x`; `x²`; `x + x⁻¹`; non-saturated `S` | `ℂ[x]/(x²)` dim 2 = `1!·2`; `ℂ[x,y]/(xy, x−y)` dim 2; `t⁴·s⁶t² = s⁴·s²t⁶`, `s²t² ∉ k[S]` | sound | Tau Ceti Koszul cited |
| 12.6 Adolphson–Sperber (Lean) | `n = 0`; `x`; `x+x⁻¹`; `x²`; `x₁+⋯+x_n`; `x` on `G_m²`; `(x+y)²`; `φ = 0`, `n = 1` | 1 = `0!·1`; 1 = `1·1`; 2 = `1·2`; 2 = `1·2`; 1 = `n!/n!`; hypothesis fails and `H¹`, `H²` ≠ 0; nondegeneracy fails at `z = (1, −1)`; `affineSpan{0} ≠ ⊤` and `H⁰ = ℂ` | sound | clause reworded |
| 12.7 Newton = irregular | `x`; `x + x⁻¹` | `h = 0 ≤ 1 − λ` iff `λ ≤ 1`; jumps 0, 1 | sound | — |
| 12.8 constant boundary | `x`; `x+x⁻¹`; `x+y+1/(xy)` | `I(ℚ) ≠ I(ℚ(−1))`; dim 2; area 3/2, so `2!·3/2 = 3` | sound | — |
| 12.9 filtered Künneth, duality | torus sums; `(A²,x²+y²)`; `(G_m,x)`; **`1/x ⊞ 1/y`** | jumps `k` and 0; `1/2 + 1/2`; `ann F^λ = F^{>1−λ}` at `λ ≤ 0` and `0 < λ ≤ 1`; pole pairs (1,0), (0,1), product of differences −1 | blow-up criterion wrong | route and Check fixed (R03) |

The other parts of the brief's pass:

- **Context.** `Suggested.lean` has no section variables; every hypothesis is in its own signature.
- **Generality.** The README's 12.6 and the Lean theorem agree: arbitrary `n`, full dimension as `affineSpan ℝ Δ = ⊤`, and nondegeneracy on nonempty exposed faces not containing 0.
- **Junk values.** `(volume Δ).toReal` is finite, because `Δ` is a compact convex hull. `r > n` gives `forms n r = ⊥`, so that conclusion is trivially true. At `n = 0`, `topCohomology = ℂ ⧸ ⊥` has rank 1.
- **Vacuity.** The headline names the roadmap's objects. No hypothesis contains the conclusion.

## Unresolved

- **Board state.** The board's main checkout holds the round-1 README and the round-2 `review.json`; the accepted text exists only on the FIX branch. The red-team report RT~1a on that branch was unfinished. Its four findings are repaired here, and any further findings it adds will apply to this text.
- **Gaps that later roadmaps request from this roadmap.** This roadmap does not provide them; they are scope decisions for the author:
  - TopologicalMirrorSymmetryForHitchinSystems asks for `gap:geometric-compact-mhs`: compactly supported mixed Hodge realizations of separated finite-type, not necessarily quasi-projective, varieties.
  - The KloostermanMomentsAndPotentialAutomorphy package asks for `gap:irregular-stationary-phase`: vanishing cycles of the inverse Fourier transform at the exponential factors `E^{c_i t} ⊗ R_i`. 11.5 states only the regular, eigenvalue-one case.
- **Riemann–Hilbert owner.** SheafConvolutionOnAbelianVarieties requests the derived regular-holonomic Riemann–Hilbert equivalence from ComplexComparisonPartII (`gap:holonomic-riemann-hilbert-index`). ComplexComparisonPartII does not own it; this roadmap's 1.5 does, and is earlier (263 vs 321). SheafConvolutionOnAbelianVarieties should cite this roadmap's 1.5. This README's Downstream consumers already points there.
- **Gaps this roadmap requests from earlier roadmaps.** None of these suppliers acknowledges them at its head. Two are addressed to roadmaps on main, so they amount to requests for revisions of those roadmaps.

  | Gap | Requested from |
  |---|---|
  | `gap:holonomic-specializability` | SpringerResolutionAndCharacteristicCycles |
  | `gap:regular-holonomic-stability` | SpringerResolutionAndCharacteristicCycles |
  | `gap:rational-complex-local-system-dictionary` | ComplexComparisonPartII |
  | `gap:toric-normal-fan` | AnalyticToricGeometryPartII |
  | `gap:toric-rounded-vanishing` | AnalyticToricGeometryPartII |
  | `gap:blowup-exceptional-divisor` | SchemeAndStackFoundations (on main) |
  | `gap:normal-semigroup-cohen-macaulay` | GroebnerGeometry (on main) |
- **KloostermanMomentsAndPotentialAutomorphy** is named in the Scope (as owner of the Kloosterman-specific objects) and in Downstream consumers. It is a board package in the merge order, not yet on main or an open pull request.
- No passage in any text I read asked for anything outside this job.


Pull request: #2279 (roadmap/mixed-hodge-modules-and-irregular-hodge-theory at 2ecdd81)
