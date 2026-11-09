# GATE-CalibratedGeometry~6: answers to human review

One comment was unanswered (CBirkbeck, 2026-11-09T13:33:32Z). It makes one point, numbered H01.

## H01 (CBirkbeck) — answered

Confirmed at `35fe690`. `lake build TauCetiRoadmap.CalibratedGeometry.Suggested` exits 0 with no
errors. The merge's diff against its first parent `d70bed50` is empty on
`TauCetiRoadmap/CalibratedGeometry`. The cause of the earlier failure is as stated: five imports of
`TauCetiRoadmap/GrothendieckEulerForms/Suggested.lean` named Tau Ceti modules that do not exist at
the pin (for example `TauCeti.CategoryTheory.GrothendieckGroup.BoundedHomotopy`, which exists only
as `.../BoundedHomotopy/Basic`), and main fixed them in `3b144f54`.

One correction: the merge did not change the pin. `lake-manifest.json` is identical on both parents
(Tau Ceti `2fd255d99`), so the merge brought main's import fix, not a newer pin. The merge also
brought GeometricTopology's renumbering, which moves "smoothing and triangulation comparison item 1"
to GeometricTopology 11.3. This README cited that item, and now cites GeometricTopology 11.3 at
README lines 96–97, 362–365, 758, 772 and 797 (commit `e1665fc1`).

## What changed

One commit, `e1665fc1` "CalibratedGeometry: review repairs (cite GeometricTopology 11.3 for smooth
triangulations after its renumbering)", touching only `TauCetiRoadmap/CalibratedGeometry/README.md`
(11 lines changed). `Suggested.lean` is unchanged.

- Owned elsewhere, smooth-triangulation bullet: "GeometricTopology, smoothing and triangulation
  comparison item 1" → "GeometricTopology 11.3 (smooth triangulations and combinatorial manifolds)".
  The theorem is named Cairns–Whitehead, as GeometricTopology 11.3 names it.
- Supplier contract "From TauCetiRoadmap.GeometricTopology": "the smoothing and triangulation
  comparison item 1 (existence of smooth triangulations of smooth manifolds without boundary …)" →
  "11.3 (the Cairns–Whitehead theorem: every smooth manifold has a smooth triangulation in the
  sense of the pinned `TauCeti.IsSmoothTriangulation`, used directly for closed sources)".
- 2.4 prose, 2.4 *Needs:* line and Layer 2 Dependencies: "smoothing (and triangulation) item 1" →
  "11.3".

Why this is the right target: on main (`d72684a`), GeometricTopology's anchor table says that item 1
of *The smoothing-and-triangulation comparison* "→ Layer 11.3". Its section 11.3 proves that every
smooth manifold has a smooth triangulation for the pinned `TauCeti.IsSmoothTriangulation`.
TangentialBordism, the supplier of the relative refinement, cites that theorem as
"GeometricTopology … Layer11.3". `TauCeti.IsSmoothTriangulation` exists at the pin
(`TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean`, line 191). It means "a `Cⁿ` immersion
on every closed simplex".

## Other citations checked after the merge

The merge (main up to `3987f939`; main is now `d72684a`, with no further change to these files)
changed three roadmaps this README cites. Each cited id was checked against main.

- **RiemannianGeometry.** The merge only added a sub-roadmap pointer and R1 item 5. R1, R5a, R5a.1,
  R5a.2 and R5b keep their headings (R5a at line 1074, R5a.1 at 1097, R5a.2 at 1133, R5b at 1175),
  and R5b still states "no CalibratedGeometry input".
- **GeometricTopology.** Layer 1 (collars, 1.1 "Smooth collars") still resolves. Item 1 of the
  smoothing-and-triangulation comparison moved, and is repaired above.
- **TopologicalKTheory.** T1.5 is still item 5 of T1 (the finite Grassmannian carrier) and T1.6a is
  still item 6. Neither moved.

The other cited roadmaps have no README change between the merge base `eaf17b10` and main
`d72684a`. `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean
name found nowhere.

## Ownership and overlaps

The repair adds no construction. The Cairns–Whitehead theorem is cited to its owner,
GeometricTopology 11.3, which is on main. `scratch/overlaps.md` lists no open pull request that
changes this roadmap and no dropped or revision-only id. For the closest roadmaps in vocabulary (the
ComplexKahlerGeometry revisions), the ids this README cites (K1, K2, K4, K5a, K5b.0, K6.0, K6.1)
exist both on main and at the head checked out for the open revision. Nothing is listed under "only
an open revision defines".

## Signature check

`Suggested.lean` is unchanged this round, so `scratch/signatures.md`, which was elaborated from this
head, gives the exact types. I compared all 26 elaborated types with their README statements. Five
definitions drop section binders. In every case the definition's body does not use the binder, and
every theorem that uses the definition has the binder in its own elaborated type:

| Definition | Binders dropped | Body needs it? | Consumers carrying it (elaborated) |
|---|---|---|---|
| `IsCalibration` | `[FiniteDimensional ℝ E]` | no: `IsSmoothForm`, `mextDeriv`, frame bound via `g.inner` | `immersionVolume_le_of_isCalibratedImmersion` (`[FiniteDimensional ℝ E]`), `isCalibration_specialLagrangianForm` (`[FiniteDimensional ℂ E]`) |
| `IsKahlerMetric` | `[FiniteDimensional ℂ E]` | no: Hermitian identity and a closed fundamental form | `immersionVolume_le_of_isKahlerMetric`, `isCalibration_specialLagrangianForm`, `secondVariation_volume_eq_hodgeEnergy` |
| `IsNormalizedHolomorphicVolumeForm` | `[FiniteDimensional ℂ E]` | no: pointwise linearity and unitary-frame modulus | `isCalibration_specialLagrangianForm`, `secondVariation_volume_eq_hodgeEnergy` |
| `specialLagrangianForm` | `[FiniteDimensional ℂ E]`, `[IsManifold 𝓘(ℂ, E) ∞ M]` | no: pointwise `Re ∘ (e^(−iθ)·) ∘ Ω_x` | `isCalibration_specialLagrangianForm`, `secondVariation_volume_eq_hodgeEnergy` |
| `contractionPullback` | `[FiniteDimensional ℂ E]`, `[IsManifold 𝓘(ℂ, E) ∞ M]`, `[FiniteDimensional ℝ E']`, `[IsManifold I' ∞ N]` | no: pointwise, with the total `mfderiv` | `secondVariation_volume_eq_hodgeEnergy` (all four) |

Dropping these binders only widens the domain of a predicate or construction. No headline loses a
hypothesis, so nothing changed.

## Adversarial pass on what this round touches

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 with closed N triangulated by GeometricTopology 11.3 | N = S¹ with `\|∂Δ²\|`, vertices a<b<c, counterclockwise; N = S² with the tetrahedron `∂[0,1,2,3]` | S¹: signs of `[a,b]`, `[b,c]`, `[a,c]` are +1, +1, −1, and `∂c = (b−a)+(c−b)−(c−a) = 0 = c_(∂N)` with `∂N = ∅`. S²: `c = [1,2,3]−[0,2,3]+[0,1,3]−[0,1,2]`, `∂c = ∂∂[0,1,2,3] = 0` | holds | citation only |
| 11.3's "immersion on each closed simplex" against 2.4's "embedding on each closed simplex" | radial projection `∂Δ² → S¹`; non-example `t ↦ 2t` from `[0,1]` to `ℝ/ℤ` | radial projection is injective with nonzero derivative on each edge, so it is an embedding (compact source, Hausdorff target). `t ↦ 2t` sends 0 and 1 both to 0, so it is not injective; 11.3 excludes it because f is a homeomorphism | agree | none |
| Finite K for compact N (2.4's "finite simplicial complex") | S¹ as above | compact `\|K\|` meets finitely many open simplices: 3 vertices, 3 edges | holds | none |
| `IsCalibration` without the finite-dimensional binder | ℝ³, `dx₁∧dx₂` and `2dx₁∧dx₂` on frame `(e₁,e₂)` | `\|φ(e₁,e₂)\|` = 1 ≤ 1 (accepted) and 2 > 1 (rejected) | as README 2.1 Checks | none |
| `IsKahlerMetric` without the binder | flat ℂ; `dx² + 4dy²` | `g(i,i) = 1 = g(1,1)` (accepted); `g(i,i) = 4 ≠ 1` (rejected) | as README 4.3 Checks | none |
| `IsNormalizedHolomorphicVolumeForm` without the binder | ℂ with `dz`; `dz̄` | `dz(i·1) = i = i·dz(1)`, `\|dz(1)\| = 1` (accepted); `conj(i) = −i ≠ i` (rejected) | as README 5.3 Checks | none |
| `specialLagrangianForm` without the binders | n = 1, `Ω = dz`, `v = (1)` | θ = 0: `Re 1 = 1`; θ = π: `Re(e^(−iπ)) = −1 = −φ_0(v)` | matches the 5.3 bullet `φ_(θ+π) = −φ_θ` | none |
| `contractionPullback` without the binders | `ℝ ⊂ ℂ`, `V = a∂_y`, `w = ∂_x` | `ω(V,w) = g(i·ia, 1) = −a` | matches the 6.5 Check `−Σ a_j dx_j` | none |

## Sources

No source was fetched and none is missing. The repair cites a roadmap section, not a text.
`scratch/needs-references.toml` was not written.

## Build and gate

- `lake build TauCetiRoadmap.CalibratedGeometry.Suggested`, at `35fe690` and again at `e1665fc1`:
  "Build completed successfully (18544 jobs)", exit 0, no errors, 11 warnings "declaration uses
  `sorry`" (lines 71, 128, 162, 168, 198, 206, 239, 280, 289, 326, 374: the 11 headline theorems).
- Gate at `e1665fc1`:
  `gate CalibratedGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`), after the edit: `depcheck: 235 roadmaps, 2257
  edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
