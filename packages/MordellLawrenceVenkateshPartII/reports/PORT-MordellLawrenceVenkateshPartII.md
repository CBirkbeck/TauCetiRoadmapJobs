# PORT-MordellLawrenceVenkateshPartII

- **Branch:** `roadmap/mordell-lawrence-venkatesh-part-ii`, created from `e0514d8` (clean tree checked first).
- **Head commit:** `1be51aaedfeb8d7cde360ae3728162bbb26fa7fa`, message
  `MordellLawrenceVenkateshPartII: roadmap (README, Suggested.lean, metadata)`.
- **Folder:** `TauCetiRoadmap/MordellLawrenceVenkateshPartII/` with `README.md` (3598 lines, eleven layers,
  79 subsections, each with a `*Needs:*` line and at least three Checks), `Suggested.lean` (124 lines) and
  `metadata.toml` (`topic = "math.NT"`, the same form as `TauCetiRoadmap/ClassicalArithmeticCompletion/metadata.toml`).
  Nothing outside the folder was edited.

## Build

`lake build TauCetiRoadmap.MordellLawrenceVenkateshPartII.Suggested`, run after the last edit:

```text
Build completed successfully (18239 jobs).
```

There are 4 warning lines:

- 2 × `declaration uses sorry`, at 77:8 (`eulerian_central_mass_le_half`) and at 117:8
  (`integralHypersurfaces_not_zariskiDense`).
- 2 × Lake's notice that `Mathlib` "is designed for use with the module system; consider adding `module`".
  It is the same notice for the same header, printed once by the build step and once by the `irArts` step.
  It comes from the single `import Mathlib` header that the brief requires. Every roadmap on main that
  imports Mathlib without `module` gets it too (for example `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean`).

Apart from this header notice, `sorry` is the only warning.

## Gate

```text
gate MordellLawrenceVenkateshPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (the prescribed `gate --depcheck … --movable` command), after the last edit:

```text
depcheck: 263 roadmaps, 2570 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The one new edge, to PELModuli (merge order line 124; this
roadmap is line 346), points to an earlier roadmap. No notion was moved down.

## Draft pull request body

The Lawrence–Venkatesh method bounds integral points by playing two finiteness statements against each
other. Faltings's lemma leaves finitely many global Galois representations. A p-adic period map then sends
each residue disk into a flag variety, where the points carrying one prescribed local representation form
a locus of large codimension. MordellLawrenceVenkatesh carries the method through the one-dimensional
S-unit and Mordell arguments. This Part II builds its higher-dimensional and coefficient-algebra form:

- **Hodge–Deligne systems.** These package compatible Betti, étale, de Rham and crystalline realizations
  on a smooth arithmetic base, so that an integral point gives a global Galois representation whose local
  restriction is read off from the period map.
- **Coefficient groups.** Coefficient algebras and their semilinear normalizer groups put Frobenius and
  Galois descent into one algebraic group, possibly disconnected.
- **Finiteness of local types.** Three inputs limit the local types: G-semisimplification over fields of
  characteristic zero, finiteness of local nonabelian Galois cohomology, and the balance of induced Hodge
  filtrations that global purity over ℚ forces.
- **Codimension.** A root-pairing estimate and strongly balanced monodromy turn the finiteness of local
  types into codimension bounds.
- **Transfer.** The pure Ax–Schanuel theorem, transferred to p-adic coefficients through Rückert's
  Nullstellensatz and Krull intersection, turns codimension into non-density.

The end theorems are:

- Lawrence–Sawin's coefficient non-density theorem;
- Lawrence–Venkatesh's Theorem 10.1 with its finiteness clause;
- non-density of the integral points of the parameter space of smooth hypersurfaces in `ℙⁿ` of large
  dimension and degree;
- the Shafarevich conjecture, up to `A(K)`-translation, for smooth ample hypersurfaces in abelian varieties
  of dimension at least 4, of dimension 3 away from an explicit exceptional set of degrees, and of
  dimension 2.

The Eulerian-number estimates and Hodge-number asymptotics these applications need are part of it. The
monodromy input for the abelian application comes from SheafConvolutionOnAbelianVarieties. `Suggested.lean`
states the two headlines statable at the pins: the hypersurface non-density theorem, written in
coefficients of integral forms with good reduction, and the central Eulerian mass bound.

## Suppliers that are still pull requests

The README cites these as suppliers. Each is earlier in the merge order, and none of them is imported by
the Lean:

- AbelianSchemesAndArithmeticModuliPartII
- ClassicalAdicEtaleCohomology
- DeligneWeightsAndPurity
- EtaleDualityAndPerverseSheaves
- FaltingsFinitenessAndIsogenyTheorems
- HeightsRationalPointsAndObstructions
- InverseGaloisAndArithmeticFundamentalGroups
- LanglandsParameterStacks
- LefschetzPencilsAndVanishingCycles
- MappingClassGroupsAndCanonicalRepresentations
- MordellLawrenceVenkatesh
- MotivesAndAlgebraicCycles
- PadicDifferentialEquationsAndRigidCohomology
- PadicHodgeTheory
- PELModuli (new in this port)
- SheafConvolutionOnAbelianVarieties
- ShimuraData
- WeilConjectures

Two other open roadmaps are named but are not suppliers:

- EndoscopicTransferAndUnitaryTraceComparison: in Scope only, to say how §2.11 differs.
- LogicAndDefinabilityInNumberTheory: a consumer, at merge order line 350.

Suppliers on main:

- AbelianSchemesAndArithmeticModuli
- AlgebraicModuliForArithmeticGeometry, and through it ResolutionOfSingularitiesCharacteristicZero
- ArithmeticGaloisRepresentations
- Chebotarev (`Completed/`)
- ClassicalArithmeticCompletion
- ComplexComparisonPartII
- ComplexKahlerGeometry
- CrystallineCohomology
- EtaleCohomologyFoundations
- JacobianChallenge
- ReductiveGroups
- ReductiveGroupsPartII
- RestrictedPowerSeries
- SchemeAndStackFoundations

No README id cites a numbering that only an open revision defines. The overlap file lists no open pull
request that changes this roadmap and no dropped id.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form:

- one module docstring;
- the two headline theorems statable at the pins, with the three short definitions they need and
  `HypersurfaceMonomial`;
- no padding, no sorry'd data and no `set_option`.

It is kept. The only change is to the docstring's list of headlines not statable at the pins. That list
now also names the Hodge numbers and monodromy of projective hypersurfaces:

- README §§8.6–8.7: the Jacobian-ring formula and its Eulerian asymptotics;
- README §8.9: the Lawrence–Venkatesh inequalities, LV Proposition 10.2;
- README §9.2: Beauville's big monodromy theorem.

The missing carrier is checked at the pins. Tau Ceti's Hodge structures (`TauCeti/Geometry/Hodge/`) are
abstract linear algebra. Neither library attaches a Hodge structure, a primitive part or a monodromy
representation to the cohomology of a projective hypersurface or a family of them.

I considered stating §8.9 through the coefficient formula of §8.6. I rejected that as an ad hoc encoding:
it would replace the Hodge numbers by a theorem of this roadmap.

**Signature check.** I put `#check @name` for all six declarations into one scratch file and elaborated
it once with `lake env lean`, against the built module. The elaborated types are:

- `eulerian : ℕ → ℕ → ℕ`;
- `eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`;
- `HypersurfaceMonomial : ℕ → ℕ → Type`;
- `@IsSmoothHypersurface : {k : Type u_1} → [inst : Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`;
- `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`;
- `integralHypersurfaces_not_zariskiDense`, with quantifiers in the order
  `∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e, G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval … G = 0`.

No binder is lost. Each type agrees with its README statement (§§8.4, 9.1, 9.3). Nothing changed.

The same scratch file also elaborated these tests, none of which were added to the roadmap:

- `decide` gives `eulerian 0 0 = 1`, `eulerian 3 1 = 4` and `eulerian 4 1 = eulerian 4 2 = 11`.
- `decide` gives the failure of the inequality at `n = 1` and the equality case at `n = 3`.
- The zero form fails `IsSmoothHypersurface`.
- An `example` shows that `IsSmoothHypersurface (n := 2) G` feeds
  `TauCeti.AlgebraicGeometry.projectivePlaneCurve.smoothOfRelativeDimension (K := AlgebraicClosure k)`,
  which proves that `Proj k[x₀, x₁, x₂]/(G)` is smooth of relative dimension one.

## Supplier replacements, added supplier citations and duplication removals

No target was found already proved at the pins or stated by another roadmap, so nothing was deleted and
"Scope and ownership" records no removal. Every Tau Ceti and Mathlib name the README cites was opened at
the pinned commits:

- TauCeti `2fd255d`: `TauCeti.Cocharacter.parabolic` Parabolic.lean:154,
  `TauCeti.Tannaka.fgPointTensorIsoEquiv` Equivalence.lean:188, `MixedHodgeStructure` Basic.lean:72,
  `Hom` Morphism.lean:77, strictness Strictness.lean:110/118/131, `MixedHodgeStructureCat.abelian`
  Abelian.lean:33, `AbelianVariety` Basic.lean:95, `IsAmple` Ample.lean:71, `CartierDivisor`
  Basic.lean:127, `IsEffective` Effective/Basic.lean:45, `intersectionNumber` Basic.lean:111,
  `eulerDegree` Degree.lean:74/130.
- mathlib `1b1ccf4`: `Ideal.iInf_pow_eq_bot_of_isLocalRing` Filtration.lean:432 with
  `[IsNoetherianRing R] [IsLocalRing R] (h : I ≠ ⊤)`, `Finsupp.degree` Weight.lean:216,
  `RingTheory.Sequence.IsRegular` RegularSequence.lean:147.

Neither pin has Eulerian numbers, descents of permutations, a smooth-hypersurface or good-reduction
predicate for forms in `n + 1` variables, or abelian schemes over a base other than a field. Tau Ceti has
only the plane case, below.

The sweep found three inputs whose owner the package did not name. They are now cited.

1. **`H¹(F, H)` in §2.11.** §2.11 used the pointed set of torsors and its Galois-cocycle description
   without a supplier. Three owners already provide them:
   - SchemeAndStackFoundations §§1.15 and 2.3, on main, own torsor classes, on Tau Ceti's
     `CategoryTheory.Sheaf.NonabelianH1` (`TauCeti/CategoryTheory/Sites/NonabelianCohomology/Torsor.lean:226`);
   - PELModuli §M0.9(1) (`smoothAffineTorsor_galoisH1`, `galoisH1_equiv_torsorClasses`) owns their
     description by continuous Galois cocycles for smooth affine groups, connected or not.

   PadicHodgeTheory §5.5, already a supplier, builds on the same §M0.9. §2.11 now cites the three owners
   and keeps only what is new: finiteness over p-adic fields, the classification of rational classes, and
   the unipotent-radical bijection. The edit covers the §2.11 statement, its `*Needs:*` line, the Layer 2
   Dependencies, Scope, a new "From TauCetiRoadmap.PELModuli" contract, a SchemeAndStackFoundations
   contract bullet and a Tau Ceti contract bullet. The PELModuli bullet carries a witness: `μ₂` over `ℚ₃`
   gives the four classes of `ℚ₃^×/ℚ₃^(×2)`. PELModuli has no "local `H¹` is finite" statement (its
   §M0.9(3) is `ker¹` over ℚ), and AdelicAlgebraicGroups §4.1 has none either, so §2.11 still owns the
   finiteness.
2. **Griffiths's residue theorem in §8.6.** The §8.6 route used Griffiths's residue description of the
   Hodge filtration of a smooth hypersurface, cited only to Batyrev–Cox. That is a citation, not a
   supplier. ComplexComparisonPartII, on main, does not have it.
   - PotentialAutomorphyDworkMotivesPartII, open and earlier in the merge order, already asks
     ComplexComparisonPartII for exactly this, as `gap:griffiths-residue-hodge-filtration`.
   - This README now makes the same request under the same name, in its own words and without the
     equivariance clause it does not use, so that ComplexComparisonPartII is the single owner. The
     request carries a witness: the quartic surface's degrees `0, 4, 8` give `gr_F², gr_F¹, gr_F⁰` of
     dimensions `1, 19, 1`.
   - §8.6 keeps only the numerical formula. Its `*Needs:*` line, the Layer 8 Dependencies and Scope are
     updated.
3. **Tau Ceti's plane-curve smoothness.** For `n = 2` the predicate `IsSmoothHypersurface` is exactly the
   hypothesis of Tau Ceti's
   `TauCeti.AlgebraicGeometry.projectivePlaneCurve.smoothOfRelativeDimension` (Smooth.lean:92, on
   `projectivePlaneCurve`, Basic.lean:101).
   - This is recorded in the Tau Ceti contract.
   - A new §9.1 Check states the agreement with the library notion. Its negative control is the line pair
     `x₀x₁`, singular at `(0, 0, 1)`.
   - No higher-dimensional projective hypersurface scheme exists at the pin, so the Lean predicate is kept.

The other objects were searched by object, on main and at the open heads, with `roadmaps grep`:

- **Hodge–Deligne systems.** Only LogicAndDefinabilityInNumberTheory has them, and it is a consumer.
- **Our own vocabulary.** "Coefficient normalizer", "strongly c-balanced", "semibalanced" and "Jacobian
  ring" appear in no other roadmap.
- **Eulerian numbers.** ClassicalArithmeticCompletion §§2.18, 2.39 and 2.56 own them, as cited. Its
  `Suggested.lean` declares no Eulerian number, so `eulerian` here collides with nothing. Its fully
  qualified name is in this roadmap's namespace.
- **Tensor filtrations and splitting cocharacters.**
  - PadicHodgeTheory §3.6 forms `Fil_μ` for the filtered fibre functor of a pair `(b, μ)` of a connected
    reductive group.
  - HodgeTateAndCanonicalSubgroups, BunGAndNewtonStrata and AdmissiblePairsAndPadicHodgeStructures use
    filtered fibre functors.
  - None of them states the general G-filtration with the equal-filtration criterion and restriction to
    `G°` for disconnected `G`, which §2.5 owns.
- **Universal hypersurface monodromy.** LefschetzPencilsAndVanishingCyclesPartII, on main, explicitly
  leaves "monodromy of universal hypersurface families" out of its scope. §9.2 is the owner.
- **G-semisimplification.** LanglandsParameterStacks §§2.3–2.4 and ArithmeticGaloisRepresentations §1.11
  are cited as before.
- **Ax–Schanuel.** AbelianSchemesAndArithmeticModuliPartII Layer B3 and the gap are cited as before.
- **p-adic period maps.** MordellLawrenceVenkatesh and GaloisSectionsPadicPeriodMaps own their own curve
  and section settings. Nothing is shared beyond what Scope states.

## Anything unresolved

- **Supplier gaps.** Ten requests are now declared:
  - the nine of the package, matching `design/plan.json`: gap:eulerian-row-log-concavity,
    gap:log-concave-convolution, gap:eulerian-descent-variance and gap:eulerian-central-limit on
    ClassicalArithmeticCompletion; gap:complete-reducibility-reductive-criterion on
    LanglandsParameterStacks; gap:andre-monodromy-normality on ShimuraData; gap:period-map-ax-schanuel on
    AbelianSchemesAndArithmeticModuliPartII; gap:relative-crystalline-comparison and
    gap:hodge-tate-image-cocharacter on PadicHodgeTheory;
  - gap:griffiths-residue-hodge-filtration on ComplexComparisonPartII, new.

  The roadmap's targets that use them are conditional on these sections being supplied.
- **A later roadmap overlaps §2.3.** GlobalGaloisDeformationsPartII (open, merge order line 403, later
  than this roadmap) asks ReductiveGroupsPartII for a "finite-image semisimplification contract": the
  rational Levi projection for a connected reductive group over an arbitrary field, with
  `G(k)`-conjugacy. Its connected, characteristic-zero case overlaps the rational form of §2.3 here,
  which covers groups with reductive identity component in characteristic zero, up to
  `G°(k̄)`-conjugacy. The fix belongs to the later roadmap, which should cite §2.3 or narrow its
  request. This roadmap cannot cite it, because it is later.
- **Not checked.** Ownership against the board package LawrenceVenkateshMethod, which is on another
  board pull request whose files are not in this checkout.
- **Licence questions for human reviewers, carried over unchanged.**
  - Serre, *Galois cohomology*, is cited by section only and is `uncertified` in `sources.toml`.
  - The LV text was cached from an institutional host that is neither author's institution. The README
    cites the journal and the arXiv version.
- **Build notice.** The module-system notice above remains, because the required header is `import Mathlib`.

## Maintainer notes

1. **Arrangement.** I confirm it is independent of the sources:
   - The layers are named by their mathematics: realizations, coefficients, semilinear groups, period
     transfer, balanced monodromy, balanced gradeds, then the end theorems.
   - Their order is forced by the `*Needs:*` graph: §1.1 needs §§0.3–0.4, §2.1 needs §1.5, §3.1 needs
     §2.5, §4.4 needs §3.2, §5.12 needs §4.2, and §6.1 needs §§5.8 and 5.12.
   - No layer is named after a chapter of LS or LV.
2. **Worked instances without a locator: refuted.** These locators are present in the ported README:
   - Layer 4 Examples: "(LS, Example 6.7, p. 68)".
   - Layer 5 Examples: "(LS, Example 8.6, pp. 75–76)".
   - Worked examples, the `GL₆` item: the same LS Example 8.6 locator.
   - The §§4.2 and 5.3 statements cite the same two Examples.
3. **Licence.** Carried to "Anything unresolved" for human reviewers.

## Untrusted text

The reviews, repair reports, maintainer notes and other roadmaps' text were read as data. None of them
asked for anything outside this job. Nothing suspicious was found.

## Adversarial mathematics pass

Values were recomputed for this port:

- by hand while reading;
- by a scratch script: Eulerian rows by recurrence, checked against a brute-force descent
  count for `n ≤ 6`, central masses, the difference law, second moments, Hodge coefficients, the
  `T`-function, `‖g_M‖²`, the profiles of §8.1, the threshold of §9.2, Fubini numbers and the modular
  character exponents of §5.3;
- in Lean for the declarations, as above.

One row per statement.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Hodge–Tate signs | `ℚ_p(−1)`; `H¹(E)`; `V_pE` | weight 2, jump `+1 = 2/2`, HT `−1`; weight 1, jumps `0, 1`, HT `0, −1`, average `−1/2 = −w/2`; weight `−1`, jumps `0, −1`, HT `0, 1` | consistent with §§5.4, 7.2 | none |
| Conventions: modular character | upper Borel of `GL₂`, `μ = diag(t, 1)` | `det(Ad | Lie B) = a/b`, inverse `a⁻¹b`, pairing `−1` | sign pinned | none |
| Conventions: `N = n!·d` | `n = 2`, principal `φ`, genus-2 `H` | `|e_top(H)| = 2g − 2 = 2 = 2!·1` | consistent with SheafConvolutionOnAbelianVarieties §3.1 | none |
| Conventions: pairing parity | `n = 3`, `4` | middle degree `2` gives a symmetric pairing (`GO`); `3` gives an alternating one (`GSp`) | matches §§1.8, 10.5 | none |
| §0.1 | `ℚ(1)`; Betti rank 2 with étale rank 1 | `φ(t⁻¹) = p⁻¹t⁻¹`, not integral and allowed; `2 ≠ 1` rejected | sound | none |
| §0.2 | `𝔾_m` with monodromy 2; `ℚ(∓1)` | `2L = L` impossible for a rank-one lattice; eigenvalues `q` against `q⁻¹` | sound | none |
| §0.3 | `ℚ(0) ⊕ ℚ(−1) → ℚ(−1)`; identity `ℚ(0) → ℚ(−1)` | `1 = 1`, `0 = 0`; `1` against `0`, `W₀ = ℚ` sent into `0` | strictness Check correct | none |
| §0.4 | Legendre at `λ = 0`; nonsplit étale `H⁰` | `[[1, 2], [0, 1]]`, unipotent and not constant; permutation action | sound | none |
| §0.5 | `(1 − τ)/2` | `((1 − τ)/2)² = (2 − 2τ)/4 = (1 − τ)/2` | idempotent; lattice is an intersection | none |
| §0.6 | dense `SL₂`; finite `G` | dim 3 (not 4); finite group kept | sound | none |
| §0.7 | `Y₀ × X`; Legendre | constant map; Hodge line moves in `ℙ¹` | sound | none |
| §1.1 | `ℚ × ℚ`; `ℚ[ε]`; `E = 0` | reduced; `ε² = 0` nonreduced; no geometric points | sound | none |
| §1.2 | `ℚ[C₂]`; `ℚ[C₃]` against `ℚ³` | `(1 ± g)/2`; `x³ − 1 = (x − 1)(x² + x + 1)`, so `ℚ × ℚ(ζ₃) ≠ ℚ³` | sound | none |
| §1.3 | `E = ℚ × ℚ`; `B(v, w) = v·ι(w)` | dimension `a₁b₁ + a₂b₂` against `(a₁ + a₂)(b₁ + b₂)`; `B(ev, w) ≠ B(v, ew)` | sound | none |
| §1.4 | ranks `(1, 3)`, `(2, 2)`; `E = 0` | total 4 but not equidimensional; `N = 2`; every `N` | sound | none |
| §1.5 | `E = ℚ`, `N = 1, 2`; `E = 0`; `GO₄` | alternating line form `= 0`; Gram determinant 1; zero pairing perfect in odd rank; 2 components | `E ≠ 0` needed and present | none |
| §1.6 | order 3; `p = 5`, order 4 | `[ℚ(μ₃) : ℚ] = 2`; 4 invertible | sound | none |
| §1.7 | singleton; two idempotents | `E_I = ℚ`, rank `N`; `2·6 = 12` | sound | none |
| §1.8 | `n = 3, 4` | `(−1)^(n−1) = +1, −1` | sound | none |
| §1.9 | `C₃`, `e = (2 − γ − γ²)/3` | `(2 − γ − γ²)² = 6 − 3γ − 3γ²`, so `e² = e`; `FeF⁻¹ = e`; `(γF)² = F²` | sound | none |
| §2.1 | `E₀ × E₀`; split `GO₄` | swap in `G ∖ B`; `B` disconnected | sound | none |
| §2.2 | `σ = id`, `d` factors; regular semisimple `GL_N` | `d·dim H`, so the hypothesis is needed; `N ≤ N²` | sound | none |
| §2.3 | rotation `w`; `U` under `diag(t, t⁻¹)`; `GL₂² ⊂ GL₄`, `diag(1, 2, 3, 4)`; `U₃`; involution; `O(xy)/ℚ₃` | `±i`; `((1, t²), (0, 1)) → I`, trace 2; `binomial(4, 2) = 6`; `(u − 1)²` has `(1, 3)` entry `ab`; 3 classes; 4 classes | sound | none |
| §2.4 | `GL₁`; unit sent to a 2-dimensional space | invertible object; not monoidal | sound | none |
| §2.5 | `GL₂` `(1, 0)`/`(2, 0)`; `𝔾_m`, `t^(±1)`; `SL₃` | same Borel, different indexing; chains `ℚe₊` against `ℚe₋`; adjoint weights `1, 1, 2` and `1, 4, 5`, `span(E₁₃, E₂₃)` only in the second chain | sound | none |
| §2.6 | trivial character over `ℚ_(p²)` | `φ(a·1) = σ(a) ≠ a` | base field must be `ℚ_p` | none |
| §2.7 | weights `2, 0, −2` | `T(1/2) = 1`, `T(1) = 2`, `T(2) = 2`, `T(3) = 0` (script) | sound | none |
| §2.8 | two `SL₂` profiles; `(1, 0)` against `(2, 0)` | `(2, 2, 2)`; `{1, 0, 0, −1}` against `{2, 0, 0, −2}` | sound | none |
| §2.9 | `ℚ(i)`, `GL₁`; `GL₂² ⋊ C₂` | `t − ζ ∈ ℤ[t]` iff `ζ = ±1`; `6/2 = 3` classes in `G°`, none in the other component (eigenvalues come in pairs `±x`) | sound | none |
| §2.10 | `H = 1`, `GL₂`; diagonal torus of `GL₃` | 2 pairs; Fubini number 13 (script) | sound | none |
| §2.11 (citations added) | `ℚ_p^×/ℚ_p^(×2)`; `O₀`, `O₁`; tori of `GL₂/ℚ₃`; `𝔾_a ⋊ μ₂`; `ℤ/p` over `𝔽_p`; cocycle `σ ↦ g⁻¹σ(g)` | 4 (`p` odd), 8 (`p = 2`); 1, 4; 4 against `H¹(T) = 1`; 4 = 4; `p` against 1; `g⁻¹στ(g) = c_σ·σ(c_τ)`, matching PELModuli's `c_(στ) = c_σ σ(c_τ)` | sound; convention of the new supplier matches | citations added |
| §3.1 | `ℂ/ℤ[i]`; rank-4 polarization; isotropic plane of `Σx_i²` | `det((1, i), (1, 0)) = −i`; `B(e₁, f₁) = 1`; `Σ|v_i|² = 0` gives `v = 0` | sound | none |
| §3.2 | torus of `SL₂` on `ℙ¹`; rotation `(3 ± 4i)/5` | open orbit `𝔾_m`; `x² − (6/5)x + 1`, not integral | sound | none |
| §3.3 | `W = X × Z`; ambient `X × D_mon` against `X × LGr` | `d − codim Z ≤ 0`; `1 ≥ 0 + 1` against `3 ≥ 2 + 3` false | the ambient is needed | none |
| §3.4 | germ ideal `(xy)`; `Z = D_mon` | `x^m ↦ x^m ≠ 0` in `ℂ{x}`; preimage `= Ω` | sound | none |
| §4.1 | `SO₂`, `{(a, b, ab)}`; `SO₄` | surjects on pairs, dimension `2 < 3`; dimension `9 < 12`, kernel of dimension 3 | the restriction is needed | none |
| §4.2 | 8 indices, `σ = (13)(24)(57)(68)` | each orbit meets 2 classes | strongly 2-balanced, not 4-balanced | none |
| §4.3 | `c = 1` | σ-stable partition with equal sizes | sound | none |
| §4.4 | `GL₂` `(1, 0)`, `e = 1` | `1 ≥ 5/c`, so `c ≥ 5` | sound | none |
| §4.5 | `E = ℚ × ℚ`; `d = 0` | `dim G = 2N²` against `dim H = N²`; a point is dense in itself | sound | none |
| §5.1 | `GL₂ ⊃ T` | `pr∘ι(a) = (a + a)/2 = a`; `(1, 0) ↦ 1/2`; pairing `−1` | direction pinned | none |
| §5.2 | `P = G`; `SL₂` fixed points | `F_M = F`; `0`, `∞` in distinct Borel orbits | sound | none |
| §5.3 | `GL₆` `2+2+2`; `GL₁₂` `4+4+4`; `GL₂² ⋊ C₂` | `γ_P` exponents `(−4, 0, 4)`, `(−8, 0, 8)` on (bottom, middle, top) (script), so the pairing is `4(a₀ − a₂)` and `8(a₀ − a₂)`; `(2, 1, 0)` gives `8 > 0`; `(1, 4, 1)` has averages `1/4, 1, 1/4 ≠ 1/2`; `x₁x₂/(y₁y₂)` pairs to 0, `x₁/y₁` to `−1` | sound | none |
| §5.4 | `ℚ_p(−1)`; elliptic `H¹`; finite image | `+1 = w/2`; a line would need degree `1/2`; weight 0 | sound | none |
| §5.5 | reindex `f` against `F` | type unchanged against changed | sound | none |
| §5.6 | `𝔾_a`, `ψ = −1`; characteristic `p`; `ψ(x, y) = (−x, 2y)` | `v = −u/2`; `p·u = 0` always holds; `u + ψ(u) = 0`, `ψ(v) − v = (2, 0)` for `v = (−1, 0)`, `4y = y` gives `y = 0` | sound | none |
| §5.7 | `diag(2, 1)` | `(2^r − 1)u = 0`, so `Z_U(φ^r) = 0` | sound | none |
| §5.8 | Kummer `ℚ_p ⊕ ℚ_p(−1)`; CM `y² = x³ − x` over `ℚ(i)` | degrees 0, 1 against `1/2`; HT `0, −1` against `−1/2` | purity and the base `G_ℚ` are both needed | none |
| §5.9 | `SL₂`, `w = s`; `SL₃` 3-cycle; `w = 1` | `−s(−α) = −α`; 2 elements each with `w ≠ w⁻¹`; empty, `ℓ = 0` | sound | none |
| §5.10 | `GL₂` `(1, 0)`, `c = e = 1` | `T(1) + T(0 + 1) = 1 + 1 = 2 > B = 1` | the hypothesis fails as stated | none |
| §5.11 | regular semisimple `GL_n` | `n!` Borels, dimension `0 ≤ n` | sound | none |
| §5.12 | `c → ∞` | the limit hypotheses are `A > 0`, `B > T((h⁰ − t)/2)` | consistent with §8.5 | none |
| §6.1 | `GL₂` `(1, 0)`, `d = 1`; `d = 0` | needs `c ≥ 5` and `2·5/c < 1`, i.e. `c > 10`; a point is dense | sound | none |
| §7.1 | `ℚ_p(1)`; `ℚ_(p²)` | `H¹(K, 𝔾_m) = 0`; trivial torsor | sound | none |
| §7.2 | `GSO₄`, `diag(t, 1, t, 1)` against `diag(t, t, 1, 1)` | multiplier `t` for both pairs; planes `⟨e₁, e₃⟩`, `⟨e₁, e₂⟩` isotropic, meeting in a line, so in different rulings | conjugate in `GO₄` only | none |
| §7.3 | `r = 2`; `GSp_(2g)` | `λ ↔ ℓ²/λ`; torus of dimension `g + 1` | sound | none |
| §7.4 | published against arXiv inequality | `A ≥ z + e` | sound | none |
| §7.5 | `z ≤ h⁰`, `e = d`; constant family over `𝔸¹` | `3h⁰/2 + d ≤ A + h⁰` iff `h⁰/2 + d ≤ A`, which holds since `A ≥ h⁰ + d`; `y₀ + ℓℤ[S⁻¹]` infinite, hence dense | sound; monodromy hypothesis needed | none |
| §7.6 | elliptic family | `Sp₂ = SL₂` against `GSp₂ = GL₂` | sound | none |
| §7.7 | `d′ ≤ d` | `T(h⁰ + d′) ≤ T(h⁰ + d)` on `[0, A + h⁰]` | sound | none |
| §7.8 | `M = 1, …, 5`; general `M` | `‖g_M‖² = 19, 85, 231, 489, 891`; ratio `3(2M + 1)/(8M² + 8M + 3) ≤ 3/(4M)`, i.e. `8M² + 4M ≤ 8M² + 8M + 3`; with `Q = q^(m/2+1) ≥ 4` and `Q^(2M) < b/3`, `dim Z ≤ 1.24·3b²/(4M) < 3b²/M` | sound with the corrected cutoff | none |
| §8.1 | `n = 2…6`, `d = 1`, geometric choices; `GO₂`; `GO₆` | `2h⁰` against `dim + rank`: `(4, 6), (4, 6), (36, 42), (16, 20), (488, 600), (246, 314), …`, all strict; `GO₂`: `4 < 4` false; explicit `Λ²` count `7 + 1 = 8` (script) | sound | none |
| §8.2 | `n = 2, 3` | `β = (1/4, 1/2, 1/4)`; `(1/36, 2/9, 1/2, 2/9, 1/36)`, sum 1; shift: `1/2` against `1/4` | sound | none |
| §8.3 | `n = 2, 3, 4, 5, 9` | second moments `1/2, 2/3, 5/6, 1, 5/3 = (n + 1)/6` (script) | sound | none |
| §8.4 / `eulerian_central_mass_le_half` | `n = 0, …, 12` | `n = 1`: `2 > 1`; `n = 2, 3`: equality `4 = 4`, `36 = 36`; `488 ≤ 576`, …, `1.24·10¹⁷ ≤ 2.29·10¹⁷` (script); `n = 0`: `0 ≤ 1` in the range form | `n ≥ 2` needed and present | none |
| §8.5 | `GL₂` profile, `c ≥ 5(e + 4)` | `x ≤ 1/5`, `2x ≤ 2/5 < 1 = B`, `A = 1 ≥ x` | sound | none |
| §8.6 (supplier added) | `(n, d) = (2, 3), (3, 4), (4, 5), (3, 3), (5, 4), (3, 2), (2, 2), (2, 4)` | `(1, 1)`, `(1, 19, 1)`, `(1, 101, 101, 1)`, `(0, 6, 0)`, `(0, 21, 141, 21, 0)`, `(0, 1, 0)`, `(0, 0)`, `(3, 3)` (genus 3) (script); gap degrees `0, 4, 8` give `1, 19, 1` | sound; residue input now owned by ComplexComparisonPartII | gap added |
| §8.7 | plane quartics, cubics | `14` against `19`; `9` and `9` | correction pinned | none |
| §8.8 | threshold; `n = 2` | `40/√6400 = 1/2` exactly, so `n > 6400`; `(n + 1)/(6n) = 1/4` | sound | none |
| §8.9 | uncorrected dimension | `n + 1 < 2n` for `n ≥ 2` | sound | none |
| §9.1 (Check added) | `3(x₀² + x₁² + x₂²)`, `S = {2}`; `x₀^p + x₁^p + x₂^p`; `x₀x₁`; zero form | zero mod 3; all partials 0 in `𝔽_p`; common zero `(0, 0, 1)`; fails the predicate (Lean); `n = 2` agreement with Tau Ceti elaborated | sound | Check added |
| §9.2 | cubic surfaces; quadrics; `(5, 4)`; threshold for `n = 3, 5, 7`, `d = 3, 4, 5` | `(0, 6, 0)`, `dim SO₆ = 15`; ranks 1 and 0; indefinite; the coefficient at `p = (n − 3)/2` is nonzero exactly when `(n − 1)d/2 ≥ n + 1` in all 9 cases (script) | sound | none |
| §9.3 / `integralHypersurfaces_not_zariskiDense` | `G = 1`; `G = 0`; `d = 1`; `S` with composite elements | `G = 1` would say no form has good reduction, false for the Fermat form when `S` contains the primes dividing `d`; `G = 0` refused; hyperplanes are dense, but `D₀` is existential; composites are inert in the predicate | not vacuous, not padding | none |
| §10.1 | `E₁ × E₂`, `[2] × id`; `{x}` | `Stab = E₁[2] × 0`, order 4; `Stab({x}) = 0` | sound | none |
| §10.2 | translates; a singular divisor | same `𝒫_φ`; outside the smooth open | sound | none |
| §10.3 | `K = ℚ(i)`, `S = {(2 + i)}` | `x² − 0.8x + 0.2`, not integral over `ℤ[S′⁻¹]`; discriminant `−4`, a unit in `ℤ[1/10]` | sound | none |
| §10.4 | `x² − 2y² = 0` | only rational point is `(0, 0)` | sound | none |
| §10.5 | `ζI` on `SL₆` | `B = ζ²B`, so `B = 0` | sound | none |
| §10.6 | `d = 8855`, `2·8855` | excluded; allowed | sound | none |
| §10.7 | `E₁ × E₂` pullback | `d(H) = 4·d(H′)` | sound | none |
| §10.8 | `T = 0`; `T = E[2]` | identity; `E(K)/2E(K)` | sound | none |
| §10.9 | `17710` | divisible by `D₁ = 53130/6 = 8855` (script), so excluded | sound | none |
| §10.10 | principal `φ`; `mh` | `g = 1 + 2/2 = 2`; `q(mh) = m²q(h)` | sound | none |
| `eulerian` | `A(0, 0)`, `A(3, 1)`, `A(4, 1)`, `A(4, 2)`; brute force for `n ≤ 6` | `1, 4, 11, 11` (Lean `decide`); rows match the recurrence (script) | determines its object; `A(0, 0) = 1` as in ClassicalArithmeticCompletion §2.18 | none |
| `HypersurfaceMonomial` | `n = 2`, `d = 4` | `15` monomials, so `binomial(6, 4) − 1 = 14` | sound | none |
| `IsSmoothHypersurface` | zero form; `x₀x₁`; `n = 2` | fails (Lean); fails; equals Tau Ceti's hypothesis (Lean) | determines its object; agrees with the library | none |
| `HasGoodReductionOutside` | `3(x₀² + x₁² + x₂²)` against `x₀² + x₁² + x₂²`, `S = {2}` | fails at 3; holds (partials `2x_i` vanish together only at 0) | sound | none |


Pull request: #2461 (roadmap/mordell-lawrence-venkatesh-part-ii at 1be51aa)
