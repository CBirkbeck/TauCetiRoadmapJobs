# Review of GeometricTopology (pull request #1797 at ad05d6a)

**Verdict:** accepted

This is an incremental re-review of the 115 lines of `TauCetiRoadmap/GeometricTopology/` changed since `308252e`. All six findings of the previous review are repaired. I found no new defect in the changed passages or in the text they cite. The gate passes. Elaboration, the dependency check, the `#check` audit and the one-tactic probe are clean. This folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: *Scope and ownership*, lines 324–327, now reads "**The Milnor conjecture** `u(T(p, q)) = g₄(T(p, q)) = (p − 1)(q − 1)/2` … is CombinatorialHeegaardFloer's: its end goal v1, through Lane G, items 7 … and 10 …". The same owner appears in 4.8.3 (lines 6120–6121 and 6183), in 6.5 (line 8433) and in *Downstream consumers* (line 11026).
- R02 — repaired: line 150 ends at "through the eight model geometries (Layer 8.6)". Line 9132 reads "stated in its topological form (its smooth form is Poincare3D's)". Lines 9753 and 9785 read "for the Poincaré route and the eight geometries". *Downstream consumers*, lines 11049–11054, now has a Poincare3D bullet.
- R03 — repaired: lines 2100–2107 read "The inclusion `[0, ∞) → ℝ` is locally flat for no tangential model `F` and complementary model `F'`, the half-space `EuclideanHalfSpace 1` included … every component of an open subset of `ℝ` is an open interval."
- R04 — repaired: `Suggested.lean` lines 290–293 read "`(x : M) (hM : TauCeti.IsAspherical M x)`", with `public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic` at line 31. README 7.4 lines 9008–9011 and *From Tau Ceti* lines 951–955 name the predicate, `of_basepoint` and `of_homotopyEquiv`.
- R05 — repaired: 7.3, lines 8818–8830, reads "Thurston's hyperbolic Dehn surgery theorem, stated here and proved in GeometricTopology, Part II … (Thurston, Theorem 5.8.2 …) … strictly smaller than `vol(M)` (Thurston, Theorem 6.5.6)". *Scope and ownership* lines 285–288 add it to Part II, with its route.
- R06 — repaired: the description now reads "#1791 is rebased onto this revision once this lands and re-applies only its own changes. Radó's theorem stays in Layer 11.2.1: this roadmap does not cite PlanarTopology or SurfaceTopology."

## Verified sound

### Gate, build, dependency check, `#check` audit, probe

- **Gate.** The worker's gate (`gate.md`) shows every check at `0`, then `OK`. My re-run gives every check `0` except `outside-folder=3`. Those three files are the `RepresentationTheory/LieHighestWeight/` files (`README.md`, `Suggested.lean`, and the deleted `TypeAHaarTargets.lean`), which the brief names as this pull request's own. `git diff --stat` outside the two folders is empty.
- **Dependency check** at this head: `depcheck: 234 roadmaps, 2289 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` gives 34 messages, every one `declaration uses 'sorry'`. There are 34 theorems, no `def`, `instance`, `variable`, `example` or `set_option`. The new import exists at the pin, and its `.olean` is built.
- **`#check` audit.** I put `#check @…` for all 34 theorems in one scratch copy and elaborated it. The changed theorem elaborates to `∀ (M : Type u_1) [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M] (x : M), TauCeti.IsAspherical M x → TauCeti.IsVirtuallyHaken M`. This matches README 7.4. No binder is lost, since the file has no `variable` block. I changed nothing.
- **One-tactic probe.** On the scratch copy, every `sorry` was replaced by `first | rfl | trivial | decide | infer_instance | (simp; done) | …`. All 34 theorems still fall back to `sorry`.
  - For `agol_virtually_haken_of_aspherical` I also searched the pin. The only theorems concluding `IsVirtuallyHaken` are the hyperbolic ones in `Geometry/Manifold/Riemannian/Hyperbolic/VirtualHaken.lean:68–83`. `library-matches.md` lists no hit for it.

### Library declarations opened at the pins (Tau Ceti `2fd255d`)

- `AlgebraicTopology/EilenbergMacLane/Basic.lean`:
  - line 59, `IsAspherical X x := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`;
  - line 80, `pathConnectedSpace`;
  - line 90, `of_basepoint`.
- `EilenbergMacLane/HomotopyEquiv.lean:46`: `of_homotopyEquiv (h : IsAspherical X x) (e : X ≃ₕ Y) (y : Y)`.
- `Geometry/Manifold/VirtuallyHaken.lean:63`: `IsVirtuallyHaken`, a finite cover `N` charted on `ℝ³` that is a possibly non-orientable closed Haken `3`-manifold.
- `Geometry/Manifold/LocallyFlat/Basic.lean`:
  - line 173, `IsSliceChart` (`φ '' (φ.source ∩ A) = φ.target ∩ S`);
  - line 375, `IsSliceEmbedding`;
  - line 390, `IsLocallyFlat F F' := IsSliceEmbedding (univ ×ˢ {0})`. `F` and `F'` are arbitrary spaces here, which is why the new *Half-line* Check has to quantify over all of them, and it does.

### Cross-roadmap citations resolved (main, `4820485`)

- **CombinatorialHeegaardFloer**, the new owner of the Milnor conjecture:
  - end goal v1, line 75 (`u(T_{p,q}) = (p−1)(q−1)/2`);
  - Lane G item 7, lines 283–285 (`|τ(K)| ≤ u(K)`, `τ(T_{p,q})`, the Milnor conjecture);
  - item 10, line 302 (`|τ(K)| ≤ g_s(K)`);
  - Lane K, lines 326–330, which consumes this roadmap's Layer 4. So it is downstream, as line 327 says.
- **Poincare3D**:
  - supplier table, line 61: GeometricTopology Layers 1, 2, 7 and 11;
  - 13.1 `poincare_3d_smooth`, line 1411;
  - 15.1, "the adapter to GeometricTopology Layer 8's Poincaré statement", line 1550;
  - 15.2 `poincare_3d_smooth_homotopyEquiv` on `NonemptyDiffeomorphSphere`, line 1593.

  These match the new *Downstream consumers* bullet.
- **Ownership of the hyperbolic Dehn surgery theorem.** I searched `roadmaps grep` for `hyperbolic Dehn (surgery|filling)`, `Dehn (surgery|filling) theorem`, `Theorem 5.8.2` and `all but finitely many slopes`. The only other hit is KleinianGroups (open), its README line 46, which states that it "does not touch the hyperbolic Dehn surgery". No second owner exists.
- `citations.md`: none unresolved.
- `overlaps.md`: no dropped or revision-only id. #1791 conflicts in this README, and the order is now stated (R06).

### Sources checked for the changed passages

- `thurston-gt3m`:
  - Theorem 5.6 (line 2374), for compact oriented `M₀` with conditions (a) and (b) on the holonomy;
  - Lemma 5.8.1 (line 2605);
  - Theorem 5.8.2 (line 2642): a neighbourhood `U` of `(∞, …, ∞)` in `S² × ⋯ × S²`, with Mostow's uniqueness used at line 2658;
  - inequality 5.11.2a and "v is a continuous function on H" (lines 3133–3135, the end of §5.11);
  - the Whitehead-link example converging in `H` (line 3170), followed by the closing Note on Gromov;
  - Theorem 6.5.6 (line 3739): `v(M₁) > v(M₂)` when cusps are replaced by solid tori;
  - §6.6 after Corollary 6.6.2 (lines 3766–3773).

  The 7.3 statement follows from these. Thurston works with oriented manifolds, and 7.3 adds "orientable".
- `agol2013` Theorem 9.1 (line 27): "closed aspherical", as the Lean docstring states.
- `hatcher-3m` Theorem 2.5 (line 1249), cited by the changed *Scope* sentence through 5.4.2. It classifies `L_{p/q}` up to diffeomorphism by `p′ ≡ ±p^{±1} mod q`, with `p` and `q` exchanged, as 5.4.2 says. The proof goes through the torus unique up to isotopy (line 1250), the route 5.4.2 names for Part II.

### Seeded sample

| Target | In the change? | Result |
|---|---|---|
| 5.4.2 | cited by the changed *Scope* sentence ("two theorems that Layers 4.8.3 and 5.4.2 state") | 5.4.2 (lines 7767–7779) states lens-space sufficiency here and necessity as Part II's, matching *Scope*; Hatcher Theorem 2.5 checked above |
| 2.3, 3.1, 3.4, 4.1, 4.2.10, 4.3, 4.5.3, 4.7, 4.7.4, 4.7.6, 4.10.5, 5.1, 5.4, 6.2.1 | no hunk of the diff falls in these sections, and no changed sentence cites them | not re-checked in this incremental review; earlier reviews passed them |

The README flags no locator as unverified.

### Adversarial table

New rows cover every statement the diff changes. The rows for untouched statements are carried from the previous review (r84, at `308252e`) with the values computed there.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 *Half-line* (rewritten) | `[0, ∞) → ℝ` with `F' = ℝ⁰`, `ℝ`, a Cantor set `C ⊂ ℝ`; `F = EuclideanHalfSpace 1` | **`ℝ⁰`:** the box `O × {0} ≅ [0, c)` would be open in `ℝ`, but `[0, c) ∖ {0}` is connected, while an open interval minus a point has 2 components. **`ℝ`:** the box contains `(0, c) × (−ε, ε)`, an open disc, which does not embed in `ℝ`. **`C`:** the components `O × {p}` are `[0, c)`, not open intervals. **Positive control:** the ray `{(0, t)}` in `{y ≥ 0}` with chart `(x, y) ↦ (y, x)` maps onto `H¹ × {0}`. | holds for all `F`, `F'` | none |
| 2.1 *Boundary variants*: a Euclidean `F` excludes `∂N ≠ ∅` | `[0, ∞) → ℝ²` with `F = ℝ`; `F = ℝ⁰`; `F = ℝ²`; `ℝ → {y ≥ 0}` along `y = 0` with `F' = [0, ∞)` | punctured germ: 1 component against 2; `ℝ⁰`: the slice is one point, the image germ an arc; `ℝ²`: an open subset of `ℝ²` is not an arc (invariance of dimension); the boundary-line inclusion is locally flat by the identity chart, so the restriction falls on the domain, as "boundaryless" says | holds | none |
| `agol_virtually_haken_of_aspherical` (new hypothesis) | `S³`, `ℝP³`, `S² × S¹`, `T³`, `K × S¹` (`K` the Klein bottle), `T³ ⊔ T³`, `∅` | `π_(1+2)(S³) ≅ π_(1+2)(ℝP³) ≅ ℤ` and `π_(0+2)(S² × S¹) ≅ ℤ`: all excluded. `T³` and `K × S¹` have universal cover `ℝ³`, so the hypothesis holds, and each is Haken (`T² × pt`, two-sided `K × pt`). `T³ ⊔ T³` is not path-connected and `∅` has no `x`, so both are excluded. Old ⇔ new: a connected manifold is path-connected, and `of_basepoint` moves `x`. | holds | none (R04 repaired) |
| 7.3 hyperbolic Dehn surgery (new) | figure-eight exterior (`k = 1`); Whitehead exterior (`k = 2`); `k = 0`; product neighbourhood | **figure-eight:** `vol = 2v₃ = 2.0298…`; fillings with large slopes have volume `< 2.0298…` (6.5.6), tending to it. **Whitehead (`3.6638…`):** with `s₂ ∉ E₂` fixed and `s₁ → ∞` the limit is `vol(M(s₂)) < 3.6638…`. This case is excluded because the bullet requires every filling slope to leave every finite set. **Weeks:** `0.9427… < 3.6638…`. **`k = 0`:** the strictness clause is vacuous, since it needs "at least one torus filled". **Product neighbourhood:** `Uᵢ ⊇ {|d| > R}`; for `R = 2` the omitted slopes are `1/0`, `0/1` and `±1/1`, a finite set. | holds | none (R05 repaired) |
| Milnor conjecture (new *Scope* bullet) | `T(1, 7)`, `T(2, 3)`, `T(2, 5)`, `T(3, 4)`, `T(3, 5)` | `(p − 1)(q − 1)/2` gives `0, 1, 2, 3, 4`; CombinatorialHeegaardFloer's check `τ(T_{3,4}) = 3` (its line 640) agrees; `(p − 1)(q − 1)` is even for coprime `p, q` | holds; owner on main | none (R01 repaired) |
| Poincaré prose (Layer 8 intro, 8.6 *Needs*, *Dependencies*, Poincare3D bullet) | `S² × S¹`; the Poincaré sphere | `π₁ = ℤ`; `|π₁| = 120`, so neither is simply connected. `Suggested.lean` states only the topological `nonempty_homeomorph_sphere_of_simplyConnected`, and 8.6 line 9678 says "states only the topological form". | holds | none (R02 repaired) |
| 2.1 Checks (r84) | trefoil cone; `t − sin t`; Möbius core | `x ↦ (12)`, `y ↦ (123)` onto `S₃`; derivative `1 − cos t`; one band | holds | none |
| 2.2 Brown (r84) | horned and round spheres | horned not bicollared; Brown Theorem 5 | holds | none |
| 3.1 *C¹ only*, non-compact (r84) | `θ + k⁻² sin kθ`; `x + b(x − k)` | `f′ ≥ 1/2`, `C¹` distance `1/k`, `sup |f″| = 1`; derivative `> 0` | holds | none |
| 4.2 planarity (r84) | one crossing; `n` crossings | `V − E + F = 0`; `F = n + 2` | holds | none |
| 4.2.2 (r84) | `β`, `γ`, `Mβ` | exponent sums `−8, 8, 8`; `V(γ) = t³ + t⁶ − t⁷ + t⁸ − t⁹ + t¹⁰ − t¹¹` | holds | none |
| 4.6.4 and 4.6.5 (r84) | `l − m`; trefoil; unlink; `4₁`; composition | `0`; `−2s²`; `−1 − s⁻²`; determinant `l⁻²(1 − μ²)` | holds | none |
| 4.8, 4.8.1, 4.8.2 (r84) | `T(3, 4)`; split unlinks; trefoil; `L₄` | `P(1, z) = 1 + 5z² + 5z⁴ + z⁶`; spans `1, 2`; breadth `12`; Arf `1, 0, 1` | holds | none |
| 4.10.2 and 4.11 (r84) | `(1234)`, `(1243)`; Whitehead link | `aw² = w²b = (1324)`; `det(tV − Vᵀ) = −2t² + 5t − 2`; determinant `16` | holds | none |
| 5.4.2 (r84) | `S(17, 4)` | orbit `{2, 15, 9, 8} ∌ 4`; `|rs| ∈ {8, 9}` | holds | none |
| 7.2 (r84) | cusp; torus `ω`; smearing | `A/2`; `¼`; `Σ i⁻² = π²/6` | holds | none |
| 7.4 Checks (r84) | `1, 1` filling; Whitehead chirality | coefficient `1 − 0² = 1`; `V ≠ V(t⁻¹)` | holds | none |
| Euler class, Yazdi, Markov, Property P/R, Gordon–Luecke, Mostow (r84) | `S³`, `T³`, `Σ₂ × S¹`, `S² × S¹`; `k = 0`; `σ₀ ∈ B₂`; `S³_{p/q}`; genus two | `|−2| ≤ 2`; tubed torus `2 > 0` excluded; empty family; `H₁ = ℤ/p`; `6g − 6 = 6` | holds | none |
| Moise, Hauptvermutung, Manolescu, 10.4, 11.1 (r84) | `φ(tu) = t³u`; `n = 5`; sphere additions; fan | no common subdivision; Corollary 1.3; `χ` even, so the minimum of `|χ|` is `0`; `ℓ¹` distance `2/i → 0` | holds | none |

### Other checks

- **README and Lean agree.** All 34 Lean names occur backticked in the README. The new backticked Tau Ceti names `TauCeti.IsAspherical`, `.of_basepoint` and `.of_homotopyEquiv` exist at the pin (`readme-ids-missing=0`).
- **Headlines.** The hyperbolic Dehn surgery theorem is not among the end theorems in the *Summary*. 7.3 states it in prose for Part II to prove, and only a 7.4 Check uses it, so leaving it out of `Suggested.lean` is not a missing headline. Layer 5.2 fills link exteriors (`TauCeti.LinkDehnFilling`). Every compact `M̄` with torus boundary is such an exterior: take the core link of any filling.
- **The description.** Its GeometricTopology paragraph matches the head: Part II owns the cyclic and hyperbolic Dehn surgery theorems, CombinatorialHeegaardFloer the Milnor conjecture, and Poincare3D the smooth Poincaré theorem.
- **`PROGRESS.md` and `STATUS.md`** in the folder are on main and are unchanged by this pull request.
- **Remark on untouched text** (no change requested). Lines 506–507 put "(Layer 8.6)" right after "the smooth Poincaré theorem". It points to 8.6's deferral paragraph, but it can be read as saying 8.6 states the smooth form.

## Not verifiable

- `kirby1997`: the cached text is empty, because the PostScript was not rendered. Its problem numbers are untouched by this diff.
- The settled uncertified texts (Lickorish 1997, Moise, Rourke–Sanderson, Ratcliffe, Hirsch, Thurston 1986, Gabai 1983, Farb–Margalit, Monod, Haagerup–Munkholm, Kauffman 1987) are cited by locator only. None is newly cited by the changed passages.
- Kronheimer–Mrowka (*Gauge theory for embedded surfaces I*) and Rasmussen (Invent. Math. 182, Corollary 1) are cited in 4.8.3, in an unchanged sentence. They are not in the sources cache, and I did not fetch them for this incremental review.
- Ownership against open pull requests was checked with `roadmaps grep` over all 452 open heads, as described above.

## Source issues

- **Misprint** in thurston-gt3m at §5.11, printed p. 131 (line 3133): the source numbers the volume inequality 5.11.2, the number already used for Jørgensen's theorem on p. 128; it should be 5.11.2a; affects nothing; corrected in print at the same place (the edition's relabelling note, lines 3134–3135).
- **Misprint** in thurston-gt3m at Theorem 5.8.2, proof, printed p. 116 (line 2661): the source attributes the openness of the trace map's image near the complete structure to an empty citation `[ ]`; it should cite the open mapping property of finite holomorphic maps from a `k`-dimensional analytic germ to `ℂᵏ`; affects nothing.
