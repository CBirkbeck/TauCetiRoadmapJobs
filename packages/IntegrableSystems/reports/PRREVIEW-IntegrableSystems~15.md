# Review of IntegrableSystems (pull request #1651 at 708629f)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

Incremental re-review of 3 changed lines since f049e2f. The folder's only change is `Suggested.lean` lines 51–52: the body of `chosenHamiltonianField` now reads `TauCeti.SmoothBundleForm.eval₂ σ x v w` where it read `σ x v w`. The head merges main, which moved the pins (`lake-manifest.json`: Tau Ceti `358314d` → `2fd255d`, Mathlib `f6090c7` → `1b1ccf4`; `lean-toolchain` v4.35.0-rc3 → v4.36.0-rc2), and at the new pin `TauCeti.SmoothTwoForm` is the alternating `SmoothForm I M ℝ 2` with no curried coercion. The migration is correct (see Verified sound). The new Tau Ceti pin also adds `TauCeti/Geometry/Symplectic/Hamiltonian/`, `Geometry/Manifold/Instances/AddCircle.lean`, the torus and circle-family forms, and `Geometry/Symplectic/Cotangent/Bundle/Liouville.lean`, none of which exist at `358314d`. Checked against that pin, the changed definition and everything built on it restate native Tau Ceti carriers, both headlines stated over them are already proved, and two of the docstring's "not statable at the pins" reasons are now false. These are the two findings below. Both come from the pin change, not from the author's edit.

## R01 (P2) — The I1/I4 carriers restate the pinned Tau Ceti, and both headlines over them are already proved there

**Location.** `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean` lines 45–105: `def chosenHamiltonianField … if h : ∃ v : TangentSpace I x, ∀ w, TauCeti.SmoothBundleForm.eval₂ σ x v w = mvfderiv I g x w then h.choose else 0`, followed by `bracketValue`, `IntegrableSystem`, `regularLevel_lagrangian`, `planarCentralHamiltonian`, `planarAngularMomentum` and `centralForce_commutes`. The README names them at lines 14, 39–41 and 248–249.

**Claim.**
- The changed definition is `TauCeti.SmoothTwoForm.hamiltonianVectorField`, in the same convention ι_{X_g}σ = dg, whenever σ is nondegenerate and `E` is finite-dimensional. Every use in this file is in that setting.
- `bracketValue` is `TauCeti.SmoothTwoForm.poissonBracket` in that setting, and `IntegrableSystem` restates `TauCeti.SmoothTwoForm.IsIntegrableSystem`.
- `regularLevel_lagrangian` and `centralForce_commutes` are theorems of the pinned Tau Ceti. The acceptance test therefore lists, as future work with `sorry`, two results the library already proves.

**Witness.** At pinned Tau Ceti `2fd255d`:
- `Hamiltonian/Manifold.lean:179` (`hamiltonianVectorField`) and `:338` (`poissonBracket`);
- `Hamiltonian/Integrable.lean:172` (`IsIntegrableSystem`) and `:202` (`IsIntegrableSystem.isLagrangian_ker_mfderiv`);
- `Hamiltonian/CentralForce.lean:382`.

A scratch copy derives both headlines from these sorry-free, with no error.

**Repair.**
- In `Suggested.lean`, delete `chosenHamiltonianField`, `bracketValue`, `IntegrableSystem`, `regularLevel_lagrangian`, `planarCentralHamiltonian`, `planarAngularMomentum` and `centralForce_commutes`. Then remove any `TauCeti.*` import nothing uses any more.
- In the module docstring, replace the I1 and I4 parts of "Stated: …" with: proved at the pinned Tau Ceti as `TauCeti.SmoothTwoForm.IsIntegrableSystem.isLagrangian_ker_mfderiv` (I1) and `TauCeti.stdSymplecticForm_poissonBracket_centralForceHamiltonian_angularMomentum` (I4).
- In `README.md`, cite the Tau Ceti declarations in place of this roadmap's names:
  - line 14: "this roadmap's own carrier `bracketValue`" becomes `TauCeti.SmoothTwoForm.hamiltonianVectorField` and `TauCeti.SmoothTwoForm.poissonBracket`, which use the family convention {f,g} = σ(X_f, X_g) = df(X_g);
  - lines 39–42: cite `TauCeti.SmoothTwoForm.IsIntegrableSystem` and `TauCeti.SmoothTwoForm.IsIntegrableSystem.isLagrangian_ker_mfderiv`;
  - lines 248–249: cite `TauCeti.stdSymplecticForm_poissonBracket_centralForceHamiltonian_angularMomentum` for `TauCeti.centralForceHamiltonian` and `TauCeti.angularMomentum` with the standard basis vectors as `u`, `w`.

  The gate requires these README edits once the Lean names go.

**Tested on these pins.** The scratch file elaborates with no error:
- `chosenHamiltonianField σ g y = σ.hamiltonianVectorField g y` for nondegenerate σ, proved through `IsNondegenerate.isInvertible_flat`;
- `bracketValue σ f g y = σ.poissonBracket f g y`;
- `regularLevel_lagrangian`, exactly as stated here: build an `IsIntegrableSystem` from `s` (5 lines), then apply `isLagrangian_ker_mfderiv`;
- `centralForce_commutes`, exactly as stated here: rewrite through `SymplecticForm.poissonBracket_constSmooth`, `planarCentralHamiltonian = centralForceHamiltonian` and `planarAngularMomentum = angularMomentum e₀ e₁`, then apply `CentralForce.lean:382`. The hypothesis `hmass` is never used; Tau Ceti needs only `HasDerivAt V _ ‖q‖` and `q ≠ 0`.

No other roadmap on main or at an open head cites any of the seven names (`roadmaps grep`).

## R02 (P2) — The module docstring's "not statable at the pins" reasons for I2, I2.0 and I3 are false at the new pin

**Location.** `Suggested.lean` lines 23–32:
- "`AddCircle (2 * Real.pi)` carries no `ChartedSpace` or `IsManifold` instance at the pinned Mathlib or Tau Ceti, so the angle torus is not a smooth manifold there";
- I2.0 is excluded "for the same reason";
- "which Tau Ceti has (`cotangentLiouvilleForm`) only on a vector space times its dual".

**Claim.** At Tau Ceti `2fd255d`:
- `AddCircle p` is a smooth manifold for every `p` with `Fact (0 < p)`. Literally, instance search fails for `AddCircle (2 * Real.pi)` only because Mathlib has no global `Fact (0 < 2 * π)`; one local `Fact` supplies it. The angle torus `Fin n → AddCircle p` is a manifold on the pi model.
- The canonical symplectic form exists on the cotangent bundle of every manifold.

So the I2 and I3 bullets rest on missing carriers that the pin now has. The I2.0 bullet names a foundation that the pin largely implements.

**Witness.** At `2fd255d`:
- `AddCircle.instIsManifold` (`Geometry/Manifold/Instances/AddCircle.lean:258`);
- `TauCeti.instIsManifoldPi` (`Geometry/Manifold/IsManifold/Pi.lean:109`);
- `TauCeti.CotangentBundle.symplecticForm` and `isSymplectic_symplecticForm` (`Geometry/Symplectic/Cotangent/Bundle/Liouville.lean:279, :334`).

None of the three files exists at `358314d`.

**Repair.** Re-decide each bullet at the new pin.
- **I2.** Either state the action–angle theorem on the native model, or name the carrier that is still missing. On the native model, the theorem asks for a symplectomorphism from a saturated neighbourhood of a compact connected regular component onto an open subset of `CotangentBundle (ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)) (Fin n → AddCircle p)` with `TauCeti.CotangentBundle.symplecticForm`, under which the integral map factors through the fibre (action) projection. Its λ = Σ Iᵢ dθᵢ gives ω = Σ dθᵢ ∧ dIᵢ, the README's convention at line 190. The topological part is proved at the pin and should be cited, not restated: the regular compact component is homeomorphic to ℝⁿ/Λ with Λ discrete and cocompact (`TauCeti.SmoothTwoForm.IsSymplectic.quotientHamiltonianFlowStabilizerHomeomorph`, `…compactSpace_quotient_hamiltonianFlowStabilizer`, `Hamiltonian/LiouvilleArnold.lean:360, :391`).
- **I2.0.** Drop the bullet. Its carriers are at the pin: `TauCeti.PeriodLine`, `AddCircle.instLieAddGroup`, `AddCircle.diffeomorphAddCircle`, `AddCircle.timeForm`, `TauCeti.torusTimeForm` and `TauCeti.CircleFamily`, with its angle, time and total forms.
- **I3.** Either state the Euler–Lagrange/Hamilton equivalence on `CotangentBundle I Q` with `TauCeti.CotangentBundle.symplecticForm I Q` and `TauCeti.SmoothTwoForm.hamiltonianVectorField`, or replace the reason with the carrier that is actually absent.

**Tested on these pins.** The following scratch examples elaborate with no error:
- `IsManifold 𝓘(ℝ) ∞ (AddCircle (2 * Real.pi))` under a local `Fact (0 < 2 * Real.pi)`;
- `IsManifold 𝓘(ℝ) ∞ (AddCircle 1)` and `IsManifold (𝓘(ℝ).prod 𝓘(ℝ)) ∞ (ℝ × AddCircle 1)` with global instances;
- `IsManifold (ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)) ∞ (Fin n → AddCircle 1)`;
- `(TauCeti.CotangentBundle.symplecticForm (ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)) (Fin n → AddCircle 1)).IsSymplectic`.

The last bullet of the docstring, on spherical-pendulum monodromy, stands: the pin has the stabilizer of a single point (`hamiltonianFlowStabilizer`, `LiouvilleArnold.lean:277`), but no period-lattice bundle over a base.

## Previous findings

- none: the previous report (r14, at f049e2f) accepted the folder with no finding, so there is nothing to account for.

## Verified sound

**The change itself.** At the old pin, `SmoothTwoForm` was a structure of curried bilinear maps with `CoeFun` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61, :77` at `358314d`). At the new pin it is `SmoothForm I M ℝ 2` (`TwoForm/Basic.lean:37`), and `SmoothBundleForm.eval₂ φ x v w = φ.1 x ![v, w]` (`DifferentialForm/Smooth.lean:249`). The first argument is still `v`, which is the order of Tau Ceti's `IsHamiltonianVectorField` (σ(X x, v) = df(v), `Hamiltonian/Manifold.lean:124`) and of `IsNondegenerate.symplecticFormAt_apply` (`Symplectic/Manifold/TwoForm.lean:132`). The convention ι_{X_g}σ = dg of README line 11 is therefore unchanged. The family index and both sibling folders made the same substitution in this head (`git diff f049e2f..HEAD`).

**Elaboration.** `lake env lean` of the file from the worktree:
- 5.6 s, exactly three `declaration uses sorry` warnings, at lines 75, 100 and 124, with no other output;
- `#check @` of all ten declarations in a scratch copy gives types identical, after whitespace normalisation, to the worker's `signatures.md` (10 of 10). The section binders are as recorded in r14.

The Tau Ceti modules the probes import were built first with `lake build` of each (`Hamiltonian.CentralForce`, `Manifold.Instances.AddCircle`, `Manifold.DifferentialForm.Torus`, `Hamiltonian.LiouvilleArnold`, `Manifold.IsManifold.Pi`).

**Gate.**
- The worker's run on this head passes every check, including `build=0` and `depcheck=0`.
- My run: every scanner 0, `depcheck=0`, and `outside-folder=4`, naming only `ConvexityToric/README.md`, `ConvexityToric/Suggested.lean`, `CotangentLagrangian/README.md` and `CotangentLagrangian/Suggested.lean`. The brief lists both folders as the pull request's own, as in r14.
- The brief's exclusion diff against `origin/main` (merge base `f8836c4`) is empty.

Dependency check, with no UPWARD, CYCLE or `moved:` line:

```
depcheck: 235 roadmaps, 2267 edges, 0 problem(s)
```

**Overlaps.**
- One other open pull request (the Tau Ceti pin bump) changes this folder's `Suggested.lean`. The description's generated `merge-order` block orders this pull request first, then that one.
- No cited id is dropped by an open pull request, no cited id is defined only by an open revision, and this pull request drops no id that others cite.
- Ownership of the changed passage: the owner is the pinned Tau Ceti (R01). For untouched text, ownership against open pull requests was not re-checked this round.

**Cross-roadmap citations at this head.**
- CotangentLagrangian `## C3` (its line 225) and `### C3.1` (line 256), and ConvexityToric `## Layer 1` (line 136) and `### 1.1` (line 138), resolve.
- The 2-line change to CotangentLagrangian's README since f049e2f (line 510, now `RoughForm.inChartAt_extChartAt_self`) lies outside the cited sections.
- The worker's `roadmaps resolve` finds no unresolved citation or Lean name.

**Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
- `SmoothBundleForm.eval₂` (`DifferentialForm/Smooth.lean:249`), `SmoothTwoForm` (`TwoForm/Basic.lean:37`), `IsNondegenerate.symplecticFormAt` (`Symplectic/Manifold/TwoForm.lean:122`), `flat_apply` and `IsNondegenerate.isInvertible_flat` (`Symplectic/Manifold/Flat.lean:83, :150`);
- `IsHamiltonianVectorField`, `hamiltonianVectorField`, `IsNondegenerate.eval₂_hamiltonianVectorField`, `poissonBracket`, `IsNondegenerate.poissonBracket_eq_mvfderiv`, `SymplecticForm.hamiltonianVectorField_constSmooth` and `poissonBracket_constSmooth` (`Hamiltonian/Manifold.lean:124, :179, :261, :338, :416, :529, :541`);
- `IsRegularPoint` (`Manifold/RegularValue.lean:86`), `IsIntegrableSystem` and `isLagrangian_ker_mfderiv` (`Hamiltonian/Integrable.lean:172, :202`);
- `centralForceHamiltonian`, `angularMomentum`, the angular-momentum field and conservation (`Hamiltonian/CentralForce.lean:92, :104, :375, :382`), and `stdSymplecticForm` (`Symplectic/StandardCompatible.lean:72`, ω₀((x₁,y₁),(x₂,y₂)) = ⟪x₁,y₂⟫ − ⟪y₁,x₂⟫);
- the AddCircle, pi, torus, circle-family, cotangent-bundle and Liouville–Arnold declarations named in R02.

**Seeded sample.** The six targets ("Quotient and atlas"; "Group, translations and time form"; "Scaling"; "Finite products and open restrictions"; "The positive-period total family"; "Smooth parameter families and estimates") are in README I2.0, which is unchanged since r9. Their computed values carry over from r13 and r14. This round I also recomputed their conventions against the pin's implementation of the same objects, and they agree:
- `AddCircle.mfderiv_diffeomorphAddCircle` (`Instances/AddCircle.lean:624`) gives derivative p⁻¹q, which is the README's D_(p,q)^*dt_q = (q/p)dt_p;
- `DifferentialForm/CircleFamily.lean` has η = p·β, Q^*η = dt − (t/p)dp, dη = dp∧β, Q^*(dη) = p⁻¹ dp∧dt and deck invariance under t ↦ t + kp, which are exactly r13's values.

**Adversarial pass.** Rows for the changed statement and for every statement that depends on it carry computed values. The others carry forward from r14, which carried them from r13.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `chosenHamiltonianField` (changed body) | (a) ℝ², ω₀((a,b),(c,d)) = ad − bc, g = p; (b) σ = 0, g = q; (c) σ = 0, g constant; (d) evaluation order, old vs new | (a) σ(v,w) = v₁d − v₂c = d for all (c,d) gives v = (1,0); Tau Ceti `(σ♭)⁻¹ dp` = (1,0). (b) No solution, since σ(v,(1,0)) = 0 ≠ 1, so 0; Tau Ceti's flat is 0, not invertible, and `inverse` gives 0. (c) Every v solves, so `h.choose` is arbitrary; Tau Ceti gives 0. The two differ only for degenerate σ. (d) `φ.1 x ![v,w]`, v first, as the old curried `σ x v w` | migration correct; equals `SmoothTwoForm.hamiltonianVectorField` for nondegenerate σ and finite-dimensional E (proved in scratch) | R01 |
| `bracketValue` | ℝ², f = q, g = p; general nondegenerate σ | {q,p} = dq(X_p) = dq((1,0)) = 1. Tau Ceti: X_q = (0,−1), so `poissonBracket q p` = ω₀((0,−1),(1,0)) = 0·0 − (−1)·1 = 1. Equality `bracketValue = poissonBracket` proved in scratch for every nondegenerate σ | restates `SmoothTwoForm.poissonBracket` | R01 |
| `IntegrableSystem` | field by field against `IsIntegrableSystem`; n = 1 on ℝ², f₁ = H = (q²+p²)/2 | `symplectic` implies nondegenerate; `finrank E = 2n` ↔ `2·card (Fin n) = finrank E`; componentwise smoothness ↔ `ContMDiff` into `Fin n → ℝ`; involution through `bracketValue` = through `poissonBracket`; `denseRegular` is definitionally `IsRegularPoint`. Oscillator: Tau Ceti `isIntegrableSystem_harmonicOscillator` (`Integrable.lean:358`), critical set {0}, regular set ℝ²∖{0} dense | every `IntegrableSystem` gives an `IsIntegrableSystem` in 5 lines (scratch) | R01 |
| `regularLevel_lagrangian` | scratch proof; n = 0 | proved from `isLagrangian_ker_mfderiv` with no error; n = 0: E = 0, ker = T_xM = 0, and {0} is Lagrangian in the zero space (r13) | already proved at the pin | R01 |
| `centralForce_commutes` | m = 1, V(r) = r², z = ((1,0),(0,1)); scratch proof | dH_z = (V′(1)q/‖q‖, p/m) = ((2,0),(0,1)); X_L = (Rq, Rp) with Rz = ⟪z,e₁⟫e₂ − ⟪z,e₂⟫e₁ (`CentralForce.lean:375`) = ((0,1),(−1,0)); dH(X_L) = 2·0 + (0·(−1) + 1·0) = 0. Scratch proof from `:382` has no error and never uses `hmass` | already proved at the pin, in any dimension and for any m | R01 |
| Docstring I2 and I2.0 bullets | AddCircle (2π), (1), ℝ × AddCircle 1, Fin n → AddCircle 1, T*Tⁿ | all elaborate (2π needs a local `Fact (0 < 2π)`; without it synthesis fails); `CotangentBundle.symplecticForm` on T*Tⁿ is `IsSymplectic` | reason false at `2fd255d` (true at `358314d`, where `Instances/AddCircle.lean` is absent) | R02 |
| Docstring I3 bullet | `#check @TauCeti.CotangentBundle.isSymplectic_symplecticForm` | for every `I`, `M` with `[IsManifold I ∞ M]`: `(symplecticForm I M).IsSymplectic` | reason false at `2fd255d` | R02 |
| Docstring I4 monodromy bullet | pin searched for a period-lattice bundle | only the stabilizer of one point (`LiouvilleArnold.lean:277`); no Λ ⊂ T*B | reason stands | none |
| Seeded I2.0 conventions against the pin | `mfderiv_diffeomorphAddCircle`; CircleFamily forms | derivative p⁻¹q = q/p; Q^*η = dt − (t/p)dp; Q^*dη = p⁻¹ dp∧dt; deck terms k dp cancel | agree with r13's values | none |
| Seeded "Quotient and atlas", "Group, translations and time form", "Scaling", "Finite products and open restrictions", "The positive-period total family", "Smooth parameter families and estimates" | as in r14 (computed in r13) | at most 2⌊2R/p⌋+1 integers meet two compacts in [−R,R]; ∫_γ dt_p = p; D_(q,r)∘D_(p,q) = D_(p,r) since (r/q)(q/p) = r/p; dt₂∧dt₁ = −dt₁∧dt₂, empty product +1; Q^*η = dt − (t/p)dp; ∂_p^k(t/p) = (−1)^k k! t/p^(k+1), bounded by k!R/ε^(k+1) | ✓ (README I2.0 unchanged) | none |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` and the I5 rows | as in r14 (r13, r12, r11, r9) | statements untouched; 13 hypotheses and conclusion identical to `signatures.md` | ✓ | none |
| CotangentLagrangian C3/C3.1 and ConvexityToric Layer 1/1.1 citations | headings at this head | lines 225, 256 and 136, 138 | resolve | none |

**Remarks on untouched text** (no change requested in this incremental round):
- Beyond the two headlines, the new pin implements further targets of this roadmap, which is on main: I1's local and connected-fibre factorization H = h(f) (`IsIntegrableSystem.exists_eventuallyEq_comp`, `exists_eqOn_comp`), invariance under symplectic local diffeomorphisms (`comp_isLocalDiffeomorph`), I2's completeness under properness (`IsIntegrableSystem.isCompleteVectorField_hamiltonianVectorField_of_isProperMap`, `Hamiltonian/Complete.lean:119`) and the transitive action with discrete stabilizer (`Hamiltonian/LiouvilleArnold.lean`), and I4's Runge–Lenz identities, conic orbit and Kepler radial action (`norm_rungeLenz_sq_of_orthonormalBasis`, `norm_fst_eq_div_one_add_sqrt_mul_cos_angle`, `kepler_radialAction_turningRadii`). A `From Tau Ceti` contract naming them would serve the next revision.
- The docstring of `chosenHamiltonianField` still writes `σ x v w` as notation. This disappears under R01's repair.

**Declared gaps.** None declared, and the README has no `gap:` prerequisite.

## Not verifiable

- Spanier, Ch. 6; Conley–Zehnder 1983; Epstein 1966; Arnold; Marsden–Ratiu; Duistermaat 1980; Hofer–Zehnder; Lee. These are settled as uncertified, as in r9 and r11–r14. The passages citing them are unchanged.

## Source issues

- none
