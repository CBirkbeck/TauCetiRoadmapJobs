# Review of ComplexKahlerGeometry (pull request #1398 at b55cf4d)

**Verdict:** needs changes

Full review of the repaired head b55cf4d (607 changed lines since 4f5ca96, the head the previous review read). Paths are relative to `TauCetiRoadmap/ComplexKahlerGeometry/` unless they are library paths. "Branch pin" means this head's `lake-manifest.json`: Tau Ceti 358314d4, Mathlib f6090c70. "Main's pin" means the content repository's manifest: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

The repair stated Rückert, Oka and Cartan, moved the library-owned targets into the Tau Ceti contract, and fixed the typography. It did not merge main: the head still pins 358314d4, still conflicts with main in `Suggested.lean`, and now cites 115 Tau Ceti declarations that exist only at main's pin. Five findings remain: one P1, one P2, three P3. All five are carried from the previous review; no new defect was found in the repaired text.

## Previous findings (review ~52 at 4f5ca96)

- **R01 (P1, pin): not repaired, broadened.** The manifest is unchanged (358314d4); `git merge-tree origin/main HEAD` still reports three stages for `Suggested.lean`. The repair added about sixty more main-pin names to the contract (`README.md:217–312`). Re-raised below as R01.
- **R02 (P2, docstring and three absent headlines): not repaired.** `Suggested.lean:19–31` is unchanged. Re-raised as R02, together with the Lean part of R04.
- **R03 (P2, Rückert, Oka, Cartan statable): repaired.** `Suggested.lean:190–235` states the three theorems in the proposed shape; `:37–38` names only Hartogs extension as not statable. All three elaborate, resist the one-tactic probe, and pass the degenerate instances (table rows 1–8).
- **R04 (P2, library-owned targets): README part repaired, Lean part not.** §2.1, K1, §3.2, K5a and §7.1 now cite the pinned declarations by name (`README.md:220–312, 376–396, 523–531, 551–576, 637–652, 823–840, 1574–1578, 2405–2419`). `Suggested.lean:77–79` still spells out the body of `TauCeti.IsFilledIn`, `:111–112` the body of `TauCeti.conjWirtingerDeriv`, and `:185` keeps the `IsDomain` conjunct. Folded into R02.
- **R05 (P2, DifferentialGeometry §5.5 dropped by #886): partly repaired.** The two dropped names `legacySmoothTwoFormEquiv` and `legacySmoothTwoFormEquiv_isClosed_iff` are gone (`README.md:87–89`), and the three citations now read "§5.5 (densities)". The id is still 5.5. Re-raised as R03 at P3.
- **R06 (P3, description): not repaired.** `scratch/pull-request.md` is the b8db421 description. Re-raised as R04.
- **R07 (P3, GeometricTopology 1.7/1.7.1 only at #903): not repaired.** Re-raised as R05.
- **R08 (P3, LaTeX macros, misattribution): repaired.** No `\bar`, `\setminus`, `_{`, `^{` or `$` remains in the README; `README.md:198–199` attributes `ImplicitFunctionData.analyticAt_implicitFunction` to Tau Ceti and `:314–316` `contDiffAt_implicitFunction` to Mathlib.

## R01 (P1) — The README's supplier contract names 115 Tau Ceti declarations absent at the branch pin, and the head does not merge into main

**Location.** `lake-manifest.json` (Tau Ceti 358314d4). `README.md:20, 23–29` ("The pinned Tau Ceti owns the scalar compact-support Cauchy–Green transform with its parameter dependence, filled compact exhaustions, the canonical orientation of a complex manifold, the flat `(1,0)`-pullback criterion, …"), `:195–345` (From Tau Ceti), and the layer citations at `:376–396, 433–447, 506–520, 523–531, 551–576, 637–652, 823–840, 1152–1160, 1574–1578, 1762–1766, 2405–2419`.

**Claim.** The README is written against main's pin; the Lean file and the gate run against the branch pin. Of the 190 backticked library names in the README, 115 occur nowhere in the branch pin's Tau Ceti or Mathlib sources and all 190 occur at main's pin (the only names absent at main's pin are this roadmap's own ten and the four VariationalMethods/UnboundedOperators names, which live in open pull requests). The previous review counted 54 such names; the repair added the Cauchy transform, filled exhaustions, the complex orientation, the `(1,0)` criterion, the joint implicit function theorem, the meromorphic germ field, projective space, form complexification, the type projections and the Dolbeault calculus, all absent at 358314d4. At the same time `git merge-tree --write-tree origin/main HEAD` reports a content conflict in `Suggested.lean` (main's pin bump changed the file after the merge base a0ad405), so the pull request cannot merge as it stands.

**Witness.** At the branch pin there is no file containing `IsFilledIn`, `complexManifoldOrientation`, `meromorphicGerms`, `complexificationEquiv`, `typeProjection`, `kerDelBarZeroEquiv`, `affineChart` for `Projectivization`, or `SmoothSimplex`. At main's pin each is at `TauCeti/Topology/FilledIn.lean:61`, `Geometry/Manifold/Complex/Orientation.lean:216`, `Analysis/Meromorphic/Germ.lean:55`, `Geometry/Manifold/DifferentialForm/Complexification.lean:84`, `Geometry/Manifold/DifferentialForm/AlmostComplexType.lean:282`, `Geometry/Manifold/DifferentialForm/Dolbeault/Holomorphic.lean:131`, `LinearAlgebra/Projectivization/AffineChart.lean:101`, `Geometry/Manifold/SmoothSingular/Integral.lean`.

**Repair.** Merge `origin/main`, resolving `Suggested.lean` by keeping this head's file. The manifest then pins 2fd255d9 and 1b1ccf4b. I elaborated a scratch copy of this head's `Suggested.lean` against main's pins: exit 0, exactly the ten `sorry` warnings, so the file survives the merge unchanged. Then apply R02.

**Tested.** Every clause the README attaches to a main-pin name was read at that pin (list under Verified sound); none misdescribes its declaration.

## R02 (P2) — After the merge, three headlines are statable and absent, the docstring describes the wrong pin, and three statements re-encode library objects

**Location.** `Suggested.lean:19–31` ("Three of them are statable on carriers that the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have"); `:77–79`, `:111–112`, `:185`; `README.md:69–70`.

**Claim.** At main's pin, which R01's merge brings in:

- `TauCeti.SmoothAlmostComplexStructure.nijenhuis`, `ofComplexManifold`, `SmoothForm.IsOfType`, `delBar`, `SmoothForm.hodgeStar`, `SmoothForm.codifferential` and `deRhamCohomology` all exist, so the local Newlander–Nirenberg theorem, the local Dolbeault–Grothendieck lemma and the de Rham Hodge decomposition are statable headlines that the file omits.
- `hRunge` at `:77–79` is the body of `TauCeti.IsFilledIn K Ω` symbol for symbol (the README says so at `:564–565`; the definition is not exposed, so the unfolding lemma at `FilledIn.lean:66` is the comparison).
- The solver's `(fderiv ℝ u z 1 + I * fderiv ℝ u z I) / 2` at `:111–112` is `TauCeti.conjWirtingerDeriv (fun w ↦ u ((p, q), w)) z 1`; I proved the equality at main's pin by `rw [conjWirtingerDeriv_apply]; simp; ring`.
- The `IsDomain` conjunct of `holomorphicStalk_factorial` closes by `inferInstance` at main's pin (instance `TauCeti.holomorphicStructureSheaf.smoothStalkIsDomain`, `StructureSheaf/Domain.lean:93`, elaborated in a scratch file importing that module), so after the merge it is padding.

**Witness.** `Nijenhuis.lean:158`, `AlmostComplexStructure.lean:76, 221`, `Dolbeault/Basic.lean:95`, `Riemannian/Codifferential.lean:88`, `DeRham/Basic.lean:127`, `FilledIn.lean:61–66`, `Wirtinger/Basic.lean` (`conjWirtingerDeriv_apply`), `Domain.lean:93`, all at 2fd255d9.

**Repair.** After R01: state the three theorems on those carriers (the shapes proposed in review ~52 R02 still fit: a chart whose derivative intertwines `J` with `I` for `J.nijenhuis = 0`; `delBar`-exactness of `delBar`-closed `(p,q)` forms, `q > 0`, on a polydisc; a unique representative killed by `mextDeriv` and `codifferential` in each class of `TauCeti.deRhamCohomology` on a compact oriented Riemannian manifold). Delete the sentence and three bullets at `:19–31`. Write `hRunge` as `TauCeti.IsFilledIn K Ω`, the solver's equation through `TauCeti.conjWirtingerDeriv`, and drop the `IsDomain` conjunct, importing the three modules. Add the new names to `README.md:65–70`.

## R03 (P3) — DifferentialGeometry §5.5 is 5.5a at the head of open revision #886; the citation names the content but keeps the old id

**Location.** `README.md:1192` "DifferentialGeometry §5.5's `RoughDensity` carrier (its densities part)", `:1236` "§5.5 (densities)", `:1564` "§5.5's (densities) agreement".

**Claim.** At #886's head 8f9be9a, item 5.5 is split into "5.5a Densities, for every finite-dimensional real model" and "5.5b Smooth faces, abstract boundary and corner Stokes"; `RoughDensity` is in 5.5a. The repair identifies the content, so a reader can find it, but the cited id is still one that #886 deletes, and `scratch/overlaps.md` keeps listing it. The description states no order between the two pull requests.

**Witness.** Main `DifferentialGeometry/README.md:528` "5.5 Densities, and Stokes with corners"; #886 `:1227` "5.5a Densities…", `:1228` `RoughDensity`, `:1257` "5.5b…".

**Repair.** Write "§5.5 (5.5a at the head of its open revision)" at the three lines, or state in the description that this pull request merges before #886 and that #886 owes the map 5.5 → 5.5a. The mathematics is unchanged.

## R04 (P3) — Four open pull requests conflict with this head in this folder, no order is stated, and the description describes an earlier head

**Location.** The pull-request description (`scratch/pull-request.md`).

**Claim.** `scratch/overlaps.md` lists #1234, #1807 and #1808 as conflicting with this head in `README.md` and `Suggested.lean`, and #1854 in `Suggested.lean`. The description names none of them and gives no rebase order. It still describes head b8db421: "The new companion file … `PlanarHodgeTargets.lean`", "three theorem targets are explicitly admitted". This head has no such file, rewrites both roadmap files, and admits ten theorems.

**Witness.** `git diff --stat a0ad405 HEAD -- TauCetiRoadmap/ComplexKahlerGeometry` gives `README.md | 2195` and `Suggested.lean | 699` with no `PlanarHodgeTargets.lean`; `scratch/overlaps.md`, "Other open pull requests that change this roadmap", has the four entries.

**Repair.** In the description only: rewrite the summary for this head; state the order, for example "#1234 rebases onto this; this merges before #1807, #1808 and #1854"; add the dependency names R03 and R05 ask for.

## R05 (P3) — GeometricTopology Layers 1.7 and 1.7.1 exist only at the head of open revision #903, which the description does not name

**Location.** `README.md:2559` "[GeometricTopology Layer 1.7]… smooth classification of compact surfaces", `:2562` "Layer 1.7.1 … polygon/CW model", `:2635`, `:2835`.

**Claim.** The cited content exists and supports what is claimed here (genus `(2 − χ)/2`, `rank H₁ = 2j`, the one-vertex polygon model with word `[a₁,b₁]⋯[a_j,b_j]`), but only at #903's head. #903 revises an existing roadmap, so its numbering is a dependency that the description must name.

**Witness.** Main `GeometricTopology/README.md` has no "### 1.7" heading. At #903's head fa2b5cc, `:1021` "### 1.7 Compact smooth surfaces" and `:1073` "### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models".

**Repair.** In the description only: name #903 in the dependency block. Nothing in the folder changes.

## Verified sound

### Gate, build, signatures, padding

- **Worktree.** At `b55cf4d8a512d473d58e10de13da242f64d852bd`, clean. Merge base with `origin/main`: a0ad405. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder's other files are `PROGRESS.md`, `STATUS.md` (both generated) and `metadata.toml`.
- **Gate, rerun from the worktree with `--base origin/main`.**

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

- **Dependency check (movable).**

```text
depcheck: 239 roadmaps, 2354 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. Every `*Needs:*` line and supplier citation names Mathlib, Tau Ceti, a roadmap on main, or VariationalMethods/UnboundedOperators (open suppliers already in the dependency block).
- **Elaboration at the branch pin.** `lake env lean Suggested.lean`: exit 0 in 28 s, exactly ten ``declaration uses `sorry` `` warnings at lines 74, 94, 123, 137, 155, 172, 181, 195, 208, 226.
- **Elaboration at main's pins.** A scratch copy elaborated from the content checkout: exit 0 in 7 s, the same ten warnings. So R01's merge needs no change to the file.
- **Signatures.** I put `#check @name` for all ten declarations in one scratch file and elaborated it once. Each type agrees with `scratch/signatures.md` and with its README statement. The file declares no `def` or `instance`, so no section binder can be lost; `mixed_parameter_solver` carries `[I.Boundaryless]`, `[IsManifold I ∞ P]`, `[T2Space P]`, `[SecondCountableTopology P]`, `[FiniteDimensional ℂ E]` explicitly, the two stalk theorems `[FiniteDimensional ℂ E]`, `{M : Type}` and `[IsManifold 𝓘(ℂ, E) ∞ M]`.
- **Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide | (constructor <;> infer_instance)`. All ten fail (errors at the ten probe lines 88, 114, 130, 147, 167, 177, 188, 200, 217, 235). At main's pin the `IsDomain` conjunct alone closes; that is R02.
- **Header and form.** `module`, `public import Mathlib`, `@[expose] public section`, one namespace, one module docstring, `theorem` only, no `lemma`, `set_option`, `example`, `#eval`, `#print` or sorry'd data. Every Lean name appears in the README (`:65–70`, `:553`, `:612`, `:793–797`, `:870–871`, `:879`, `:890`, `:910`).

### Adversarial pass

| # | Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `ruckert_nullstellensatz` | n = 1, f₁ = z², g = z at 0 | g vanishes on {0}; m = 1 needs z ∈ (z²), false; m = 2: z² = 1·z² | Holds; `∃ m` is needed, matches the Check at `README.md:959` |
| 2 | same, k = 0 | any n, any g | `(∀ i ∈ Fin 0, …) → g y = 0` forces g = 0 near x; m = 1 gives 0 = empty sum; m = 0 would need 1 = 0 | Holds with m = 1 |
| 3 | same, n = 0 | f₁ = c ≠ 0 | `hvan` vacuous; m = 0, h₁ = c⁻¹: 1 = c⁻¹c | Holds |
| 4 | `oka_coherence` | f = (z, z) on ℂ | a₁z + a₂z = 0 ⇒ a₁ = −a₂ in a domain; generator (1, −1), m = 1 | Holds; an empty family would force (1,−1) = 0 |
| 5 | same | f = (z, w) on ℂ²; k = 0; f₁ = 1 | a₁z = −a₂w with z, w coprime in a UFD ⇒ (a₁,a₂) = c·(w, −z), m = 1. k = 0: relation module 0, m = 0. f₁ = 1: a₁ =ᶠ 0, m = 0 | Holds |
| 6 | `cartan_coherence_reducedIdeal` | f₁ = z² on ℂ; f₁ = zw on ℂ² | A = {0}, I_A = (z): generator z; z² alone misses z. A = {zw = 0}: zw is squarefree, generator zw | Holds; `README.md:959` agrees |
| 7 | same, degenerate | k = 0; f₁ = 1 | A = U, every h vanishing near y is 0, m = 0. A = ∅, g₁ = 1 vanishes on ∅ vacuously, h = h·1 | Holds; `README.md:960` agrees |
| 8 | V not inside U | any | Each statement is existential in V, so V can be shrunk into U; no hypothesis `V ⊆ U` is needed | No change |
| 9 | `finite_rank_runge_approximation` | K = ∅; K = {0}, Ω = ℂ | K = ∅: L = ∅, N = 0, bound vacuous. K = {0}: ζ₀ = 0, g₀ = 1, error 0; A = 0 has error 1 on f = 1 | Holds |
| 10 | `hRunge` versus `TauCeti.IsFilledIn` | definition at `FilledIn.lean:61–64` | `∀ x ∈ Ω \ K, ¬ (IsCompact (closure (connectedComponentIn (Ω \ K) x)) ∧ closure (…) ⊆ Ω)` | Identical; R02 |
| 11 | `hRunge` necessity | Ω = ℂ, K = {2 ≤ \|z\| ≤ 3}, f = 1/z | ∮_{\|z\|=5/2} dz/z = 2πi, 0 for entire g, so sup_K\|f − g\| ≥ 2/5; on Ω = {1 < \|z\| < 4} the hypothesis holds and g = f | Hypothesis needed, `README.md:590–593` agrees |
| 12 | Filled exhaustion parity (`README.md:650–652`) | K_j = K(2j), K_j⁺ = K(2j+1) | K(2j) ⊆ int K(2j+1) and K(2j+1) ⊆ int K(2j+2) by `exists_isFilledIn_compact_exhaustion`; each filled | Holds |
| 13 | `mixed_parameter_solver` | P = ℝ, Q = ℂ∖{0}, f = pq | u = pq z̄: (u_x + i u_y)/2 = (pq + i(−ipq))/2 = pq; ∂u/∂q̄ = 0 | Holds |
| 14 | same | P = Q = point, f = 1; Ω = ∅ | u = z̄ gives 1, u = z gives (1 + i·i)/2 = 0; Ω = ∅ has no evaluation point | Holds, z excluded |
| 15 | Solver's ∂̄ versus `conjWirtingerDeriv` | v = 1 | `conjWirtingerDeriv u z 1 = (Du 1 + I • Du I)/2` (`Wirtinger/Basic.lean`), proved equal by `simp; ring` at main's pin | R02 |
| 16 | Cauchy–Green normalisation (`README.md:523–531`) | Tau Ceti's transform | `conjWirtingerDeriv (∫ (w−z)⁻¹ • f z) w 1 = π • f w` (`Pompeiu/Basic.lean:261`), so T = π⁻¹∫ has ∂̄T f = f; Pompeiu `f w = (2π)⁻¹∫(w−z)⁻¹(∂ₓf + i∂ᵧf)` = π⁻¹∫(w−z)⁻¹∂̄f = T(∂̄f)(w) | Both identities as stated |
| 17 | same, weak normalisation | radial φ, φ(0) = 1 | ∫(1/(πζ))∂̄φ dA = ∫₀^∞ φ′(r) dr = −1 = −φ(0) | Holds |
| 18 | `weierstrass_preparation` | n = 0, f = w² + w³ | derivatives 0, 0, 2: d = 2, u = 1 + w, a = (0, 0) | Holds |
| 19 | same | n = 1: w² − z; 1 + z + w; z | d = 2, u = 1, a₀ = −z; d = 0, u = f; for f = z every `iteratedDeriv d (w ↦ 0) 0 = 0`, `hd` fails | Holds, z excluded |
| 20 | `weierstrass_division` | n = 0, g = w², f = 1 + w + w² | q = 1, r = (1, 1); q′ = 0 would need remainder of degree 2 ∉ span{1, w} | Unique |
| 21 | `holomorphicStalk_noetherian`/`_factorial` | E = 0; E = ℂ; E = ℂ² | stalk ℂ; ideals (zˢ); zw with z, w nonassociate primes; real smooth germs e^{−1/x}·(reflection) = 0 | Holds; ℂ-model essential |
| 22 | Principal coefficient index (`README.md:833–835`) | k ≥ 1 | library: coeff (k+1) = (2πi)⁻¹∮ (z−a)^k f (`Residue/PrincipalPart.lean:86`); README: order −k ↦ (z−a)^{k−1} | Same after k ↦ k+1 |
| 23 | Convolution Check (`README.md:865`) | z⁻¹ · z⁻¹(1+z) | = z⁻² + z⁻¹; coefficients 1 and 1; principal parts alone give z⁻² | Holds |
| 24 | `d^c = i(∂̄−∂)`, `dd^c = 2i∂∂̄` (`README.md:82, 125`) | f = \|z\|² | d^c f = 2x dy − 2y dx, dd^c f = 4 dx∧dy; ∂∂̄f = dz∧dz̄ = −2i dx∧dy, 2i·(−2i) = 4 | Equal |
| 25 | Planar star and δ (`README.md:1796–1801, 1832–1833`) | dz, dz̄; h = x² + y² | *dz = dy − i dx = −i dz, *dz̄ = i dz̄; δ(h dx∧dy) = h_y dx − h_x dy = 2y dx − 2x dy; Δ_H h = −(h_xx + h_yy) = −4 | Holds |
| 26 | Codifferential sign (`README.md:1762–1763`) | Demailly VI (3.9), p = k − 1; main pin | (−1)^{m(k−1)+1} = (−1)^{m(k+1)+1}; library `(−1)^(m(K+2)+1)` on (K+1)-forms, K + 1 = k | Equal |
| 27 | Lefschetz (`README.md:2127–2130`) | ℂ: 1, ω; ℂ²: 1 | ΛL1 = 1 = n − 0; [Λ,L]ω = −ω = (1 − 2)ω; on ℂ², ΛL1 = 2 | Holds; Demailly 5.9 gives [L,Λ] = p + q − n |
| 28 | Hodge–Riemann sign (`README.md:2255–2256`) | n = 1, α = dz | i^{1}(−1)^0 ∫ dz∧dz̄ = i(−2i)·area = 2·area > 0 | Positive |
| 29 | Nijenhuis conventions (`README.md:441–447`) | library formulas | `nijenhuis_apply`: [JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]; `delBar_delBar_apply`: −(4)⁻¹ • ∂f(N(v,w)) | Match the README |
| 30 | Chevalley–Eilenberg factor (`README.md:2696–2697`) | Heisenberg [X,Y] = Z | standard dZ*(X,Y) = −Z*([X,Y]) = −1; source: 2δf(x₁,x₂) = f([x₁,x₂]) with the opposite bracket gives δZ* = −½, times 2 = −1 | Comparison correct |
| 31 | Iwasawa (`README.md:2650, 2777`) | φ₃ | dφ₃ = −φ₁∧φ₂ (`angella-iwasawa` line 510); h^{1,0} = 3, h^{0,1} = 2, b₁ = 4 (lines 701, 719–724); 5 ≠ 4 | Holds |
| 32 | Projective instances (`README.md:2405–2419`) | n = 0, 1 | `instPathConnectedSpace` needs `[Nontrivial V]`, true for `Fin (n+1) → ℂ`; `diffeomorphProjectivization` for every order, model `𝓘(𝕜, Fin 1 → 𝕜)` | Holds |
| 33 | R01: contract names | 190 backticked library names | 115 absent at 358314d4; 0 library names absent at 2fd255d9 | Finding R01 |

### Sources checked (the seeded sample and the locators the findings touch)

Every locator below was opened at the stated line of the cache and says what the README says, at the generality stated.

- **§2.1.** `demailly-agbook` line 879 (I (3.1), p. 20), 918 (I (3.4), p. 21: 1/(πz) is a fundamental solution of ∂/∂z̄). `rainer-advanced-complex-analysis` lines 1338 (Theorem 11.1, printed p. 25, for a domain), 1437 (Lemma 11.3, p. 27) and 1550 (Theorem 11.7, p. 29); the cache's page markers are six ahead of the printed numbers.
- **§3.0, §3.2, §5.1, §5.6.** No source locator; their library citations are listed below.
- **§3.1 and the Layer 3 headlines.** `demailly-agbook` lines 3794 (II (2.1), p. 80), 3804–3806 (II (2.3)–(2.4), p. 80), 3872 (II (2.7), p. 81), 3931 (II (2.10), p. 82), 4286 (II (3.19), p. 89), 4742 (II (4.22), p. 97, called Hilbert's Nullstellensatz there), 4842 (II (4.29), p. 99, Cartan 1950), 4929 (II (4.31), p. 100).
- **§4.1.** `demailly-agbook` lines 4007 and 4047: II (3.2) on p. 84 and (3.3) on p. 85, the cocycle and locally free sheaf comparison.
- **§5.4.** Line 14386: VI (3.9), p. 292, `d* = (−1)^{mp+1} ⋆d⋆`.
- **§5.5.** Lines 14323 (VI (3.1), p. 291) and 14386 (VI (3.9), p. 292); I (3.1) at line 879.
- **§5.7.** Lines 14360 (VI (3.6), p. 292), 14375 (VI (3.8), p. 292), 14386 (VI (3.9)), 14675 (VI (4.2), p. 296, `dV = ωⁿ/n!`), 15370 (VI §7, p. 309, `D* = −⋆D⋆` with its (0,−1) component).
- **§5.8.** Lines 15377, 15385 (VI (7.1), (7.2), p. 309) and 15390 (VI (7.3), p. 310).
- **§6.0.** Lines 14652 (VI 4.1, p. 296), 14688 (4.4, p. 297), 14700 (4.6, p. 297), 14736 (4.8, p. 298), 14871–14873 ((5.4)–(5.5), p. 300), 14948 (5.9, p. 301), 14967 and 14987 (5.11, (5.15), p. 302), 15156 (6.4, p. 305), 15190 and 15210 (6.5, 6.7, p. 306), 16248 (VII 1.1, p. 329), 16281 (VII 1.3, p. 330), 16637–16652 (VII (6.1)–(6.3), p. 338), 16819 and 16828 (VII (7.1)–(7.2), p. 341).
- **§6.1.** `lojasiewicz-triangulation` line 512: §3, Theorem 2, for a countable real-analytic manifold and a locally finite semianalytic family.
- **§7.1.** `demailly-agbook` line 13684: V §15.A, p. 277, the charts `τ_j`.
- **§7.2.** Lines 13691 and 13699 (V (15.1)–(15.2), p. 277), 13780 (V (15.8), p. 279), 14688 (VI 4.4, p. 297).
- **§8.1.** `angella-iwasawa` lines 480–512 (§3.1, pp. 9–10, structure equations), 700–724 (the tables); `chevalley-eilenberg` lines 1167–1232 (§23, (23.1)–(23.2), pp. 115–116 of the journal); `sakane-parallelisable` lines 85–105 (§2 and Theorem 1, pp. 188–189).
- **§8.2.** `sakane-parallelisable` lines 106–115 (p. 189: A = C^m(G), lattice steps citing [11] p. 31 Corollary 1 and p. 23 Theorem 1.13).
- **Total.** 52 locators opened, all correct.

### Library declarations opened at main's pin (2fd255d9)

Each is the declaration the README cites, with the hypotheses the README states:

- `TauCeti.IsFilledIn` (`Topology/FilledIn.lean:61`); `IsOpen.exists_isFilledIn_compact_exhaustion` (`Analysis/Normed/Module/Exhaustion.lean:86`, proper real normed space, `K n ⊆ interior (K (n+1))`, union Ω, each filled).
- `HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one` (`Pompeiu/Basic.lean:261`, `= π • f w`), `two_pi_inv_smul_integral_sub_inv_smul_fderiv_apply_one_add_I_smul_apply_I` (`:163`), `hasFDerivAt_integral_sub_inv_smul` (`:219`), `differentiableOn_integral_sub_inv_smul_compl` (`:286`), `Complex.locallyIntegrable_sub_inv` (`CauchyKernel.lean:36`), `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` (`Wirtinger/Potential.lean:41`, `1 ≤ n`).
- `contDiffOn_integral_sub_inv_smul_with_param` (`Pompeiu/Parameter.lean:75`, open s in a real normed space, `n : ℕ∞`, family vanishing outside a compact k), `hasFDerivAt_integral_sub_inv_smul_with_param` (`:124`), `conjWirtingerDeriv_integral_sub_inv_smul_with_param` (`:158`, complex parameter space) and `differentiableAt_integral_sub_inv_smul_with_param` (`:182`).
- `complexManifoldOrientation` (`Complex/Orientation.lean:216`, `[IsManifold 𝓘(ℂ, E) 1 M]`, indexed by `Fin (2 * finrank ℂ E)`), `complexOrientationLift` (`:297`, `Fin (finrank ℝ E)`), `complexOrientationLift_sign` (`:311`, `= 1`), `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (`:359`), `complexManifoldOrientation_opens_eq_pullback` (`:423`), `eq_prod_complexManifoldOrientation_iff` (`:482`).
- `SmoothForm.complexDz`, `complexDzBar` (`Plane/Complex.lean:41, 46`), `mpullback_complexDz` (`:103`, no regularity), `exists_mpullback_complexDz_eq_smul_iff` (`:153`), `differentiableAt_iff_forall_exists_mpullback_smul_complexDz_eq_smul` (`:177`, real differentiability at z), `differentiableOn_iff_forall_exists_mpullback_complexDz_eq_smul` (`:193`, open s).
- `exists_jointImplicitFunction_of_eventually_differentiableAt` (`Analysis/Complex/ImplicitFunction.lean:57`, finite-dimensional E₁, E₂, invertible partial derivative, conclusion with the local-uniqueness `iff`) and `exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Geometry/Manifold/Complex/ImplicitFunction.lean:52`, charts in the order-1 maximal atlases).
- `meromorphicGerms` (`Analysis/Meromorphic/Germ.lean:55`), `holomorphicStructureSheaf.toMeromorphicGerms` (`StructureSheaf/MeromorphicGerm.lean:59`), `exists_toMeromorphicGerms_eq_iff` (`:87`, `0 ≤ meromorphicOrderAt`), `exists_eq_toMeromorphicGerms_div` (`:111`), `isFractionRing_meromorphicGerms` (`:141`), `regularPart` (`:166`), `evalInvSub_principalPart_add_toMeromorphicGerms_regularPart` (`:199`), `evalInvSub_add_toMeromorphicGerms_eq_iff` (`:207`), `meromorphicGerms.principalPart` (`Analysis/Meromorphic/PrincipalPart.lean:188`), `coeff_principalPart_succ_eq_circleIntegral` (`Contour/Residue/PrincipalPart.lean:86`), `meromorphicGerms.pullback` (`Analysis/Meromorphic/Pullback.lean:40`), `OpenPartialHomeomorph.meromorphicGermsEquiv` (`:130`, in `namespace OpenPartialHomeomorph`), `meromorphicGerms.derivation` (`Derivation.lean:58`), `rangeToMeromorphicGermsEquiv` and `regularEval` (`RegularEval.lean:63, 80`), `smoothStalkIsDomain` (`Domain.lean:93`, `{X : Type}`, `[I.Boundaryless]`, finite-dimensional E).
- `Projectivization.instTopologicalSpace`, `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` (`Topology/Algebra/Projectivization.lean:90, 149, 188, 215, 251`), `affineOpenPartialHomeomorph` (`:311`), `affineChart` (`LinearAlgebra/Projectivization/AffineChart.lean:101`, ratios by `Fin.succAbove`, inverse `Fin.insertNth i 1 z`), `instChartedSpace` and `instIsManifold` (`Geometry/Manifold/Instances/Projectivization.lean:54, 82`, every `r : ℕ∞ω`), `OnePoint.diffeomorphProjectivization` (`Instances/OnePoint/Projectivization.lean:140`).
- `SmoothForm.complexificationEquiv` (`Complexification.lean:84`, `c ⊗ ω ↦ c • ω`), `complexificationEquiv_tmulConj` (`:106`), `_baseChange_mextDerivₗ` (`:125`, `[IsManifold I 2 M]`), `mextDerivₗ_eq_zero_iff_realPart_imaginaryPart` (`:133`), `exists_mextDerivₗ_eq_iff_realPart_imaginaryPart` (`:146`), `_baseChange_mpullback` (`:169`).
- `SmoothAlmostComplexStructure.typeProjection`, `sum_typeProjection`, `mpullback_typeProjection` (`AlmostComplexType.lean:282, 298, 510`); `del`, `delBar` (`Dolbeault/Basic.lean:86, 95`), `IsOfType.del`, `IsOfType.delBar` (`:140, 145`), `IsOfType.mextDerivₗ_eq_add_del_add_delBar_add` (`:151`), `mapCoeff_delBar_of_map_smul_conj` (`:243`), `mpullback_delBar` (`:267`), `delBar_delBar_apply`, `del_del_apply` (`:405, 414`); `delBar_wedgeWith` (`Dolbeault/Leibniz.lean:147`); `mextDerivₗ_eq_del_add_delBar_ofComplexManifold`, `del_del_ofComplexManifold`, `delBar_delBar_ofComplexManifold`, `del_delBar_add_delBar_del_ofComplexManifold` (`Dolbeault/ComplexManifold.lean:150–172`, `[IsManifold 𝓘(ℂ, E) ∞ M]`); `kerDelBarZeroEquiv` (`Dolbeault/Holomorphic.lean:131`, finite-dimensional E, complete F); `ofComplexManifold` (`Complex/AlmostComplexStructure.lean:76`) and `nijenhuis_ofComplexManifold` (`:221`).
- `nijenhuis` (`Symplectic/Manifold/Nijenhuis.lean:158`), `nijenhuis_apply` (`:170`), `nijenhuis_antisymm` (`:207`), `isInvolutiveComplexDistribution_eigenspace_I_iff` and `_neg_I_iff` (`AlmostComplex/Eigenbundle.lean:96, 149`).
- `SmoothForm.codifferential` (`Riemannian/Codifferential.lean:88`) and `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`:252`, `[BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M]`, one form compactly supported).
- That is 93 declarations, all present and as described. The 54 names the previous review listed (Hodge stars, de Rham complex, homotopy operator, Poincaré lemma, realification, Osgood, `SmoothSimplex.integral`, `MapCoeff` facts) were re-found at this pin by the token sweep.
- **Mathlib names** (`exteriorPower.hodgeStar`, `CovariantDerivative.leviCivitaConnection`, `ImplicitFunctionData.contDiffAt_implicitFunction`, `ContDiffAt.to_localInverse`, `smoothSheafCommRing`, `isUnit_stalk_iff`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`, `meromorphicOrderAt_eq_int_iff`, `OnePoint.equivProjectivization`, `Opens.overPullbackSheafEquivOver`, `IsCoercive.continuousLinearEquivOfBilin`, `MemSobolev`, `BesselPotentialSpace`, `fourierMultiplierCLM`, `TestFunction.continuous_iff_continuous_comp`, `verticalClosedStrip`, `norm_le_interp_of_mem_verticalClosedStrip'`, `SchwartzMap.fourier_convolution`, `MontelSpace`, `BoundedContinuousFunction.arzela_ascoli`, `Complex.starConvex_one_slitPlane`, `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`, `AnalyticAt.restrictScalars`, `MDifferentiable.exists_eq_const_of_compactSpace`, `MDifferentiable.isLocallyConstant`): found at both pins by the sweep.

### Cross-roadmap citations resolved

- **On main (167d0d6).** ComplexManifolds Milestones 1–7; ComplexTori Milestone 1; DifferentialGeometry 0.1–0.4, 1.1–1.4, 2.1, 2.2, 5.2–5.5, 8.3–8.5, 12.1, 12.4; SmoothBundlesConnections B2–B6; PDE 1.3 (A3), 2.2 (B9); PseudodifferentialOperators P1.0, P1.1; LieGroupoidsPoisson G1.3a, G1.6; RealAnalyticGeometry R0–R5; AlgebraicTopology Stages 3, 4, 6, 7, with Stage 4.6 (`AlgebraicTopology/README.md:271`, the projectivization quotient topology) and `cwSubcomplexNeighborhoods`, `simplicialRealizationCW`; GeometricTopology Layer 11; `Completed/RealAlgebraicGeometry` Layer 7; `Completed/HodgeStructures`; DGFloer's filtered-complex spectral sequence. The `scratch/citations.md` list has no cross-roadmap citation found nowhere.
- **At open heads.** UnboundedOperators UO-D06 (`existsUnique_selfAdjoint_of_closed_form`) and VariationalMethods §§2.2–2.4, 3.1, 4.3, 5.1–5.3 (`CompactFormPair.operatorDomainV`, `exists_compact_selfAdjoint_shifted_inverse`, `mem_operatorDomainV_iff_summable`), the three Lean names `scratch/citations.md` lists; both pull requests are in the description's dependency block. DifferentialGeometry at #886 (R03) and GeometricTopology at #903 (R05).
- **Anchor map.** `README.md:349–361` maps every dropped `#k…` anchor to its section, one line per anchor, covering the three ids `scratch/overlaps.md` lists (`#k2-…`, `#k5-…`, `#k7-…`) and their citing roadmaps.

### Ownership

- **GlobalHolomorphicFunctions (#992) and DeRhamCohomologyAndDuality (#1768).** Both name this roadmap as a consumer; this roadmap is on main and earlier, so it is the owner of the Runge, solver and relative-integration targets, and `README.md:56–63` records that nothing is imported from them. The Cauchy–Green transform is now Tau Ceti's at main's pin, which both must cite in their own reviews. Settled, not a finding.
- **PseudodifferentialOperators.** Item-level order density line (§5.1) → P1.0 → distributional action (§5.1), no item cycle; the dependency check agrees. Settled.
- **CalibratedGeometry (#946), SobolevDifferentialForms (#1609), ComplexComparisonPartII (#848).** As in review ~52: one owner each; #848's K4.P overlap belongs to #1234's copy of this folder, not to this head, which has no K4.P.
- **No collisions with other roadmaps.** `roadmaps grep --lean-only` finds `ruckert_nullstellensatz`, `oka_coherence` and `cartan_coherence_reducedIdeal` only in the other open copies of this same folder (#1234 has all three, #1807 and #1808 have `oka_coherence`), which is the same-folder conflict R04 covers, not a second owner.

## Not verifiable

- `webster-nn` (§1.1), `hormander-alpdo1` (§5.2, Theorem 2.3.5), `wells-dacm`, `griffiths-harris` (§3.2) and `raghunathan-discrete-subgroups` (§8.2) are settled as uncertified and cited by locator; I did not request them.
- The three headlines R02 asks for were not elaborated at main's pins in their final form; only the carriers' existence and the three re-encodings (rows 10, 15 and the `IsDomain` instance) were checked there.
- Ownership against the open pull requests the brief lists without files was not checked.

## Source issues

- none
