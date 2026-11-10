# Review of GeometricTopology (pull request #1797 at ff51f30)

**Verdict:** accepted

This is an incremental re-review. `TauCetiRoadmap/GeometricTopology/` has 0 changed lines since `ad05d6a`, the head the previous review read. The commit in between (`ff51f30`) touches only `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` and `Suggested.lean`. This roadmap neither cites nor is cited by either file.

The previous review raised no finding, and none is raised here. The worker's gate passes. Elaboration, the dependency check, the `#check` audit and the one-tactic probe were re-run at this head and are clean. Every cross-roadmap citation still resolves against main as it now stands (`2bbd3cb`). This folder is ready for a human's final approval.

## Previous findings

- none. The previous report (at `ad05d6a`) raised no finding.
- Its record that r84's R01–R06 were repaired still holds. The folder is byte-identical (`git diff ad05d6a ff51f30 -- TauCetiRoadmap/GeometricTopology` is empty), so the passages it quoted are where it quoted them:
  - R01: Milnor conjecture owner CombinatorialHeegaardFloer, *Scope* lines 324–327;
  - R02: the Poincare3D bullet, lines 11049–11054;
  - R03: *Half-line* Check, lines 2100–2107;
  - R04: `TauCeti.IsAspherical` in `Suggested.lean` lines 290–293;
  - R05: 7.3 hyperbolic Dehn surgery, lines 8818–8830;
  - R06: the #1791 order, stated in the description.

## Verified sound

### Gate, build, dependency check, `#check` audit, probe

- **Gate.** The worker's gate (`gate.md`) shows every check at `0`, `build=0`, then `OK`.
  - My re-run of `gate … --base origin/main` gives every check `0` except `outside-folder=3`.
  - Those three files are the `RepresentationTheory/LieHighestWeight/` files (`README.md`, `Suggested.lean`, the deleted `TypeAHaarTargets.lean`). The brief names that folder as this pull request's own, so they are not a finding.
  - `git diff --stat origin/main...HEAD` outside the two folders is empty.
  - `lake-manifest.json` and `lean-toolchain` are unchanged since `ad05d6a`, so the pins (Tau Ceti `2fd255d`) are those the previous review used.
- **Dependency check** at this head: `depcheck: 234 roadmaps, 2293 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. GeometricTopology is on main and is not listed in `ORDER.txt`, which is correct for a revision of a roadmap on main.
- **Build.** `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` exits 0 with 34 messages, every one `declaration uses 'sorry'`.
  - The file has 34 theorems. The two other lines starting with `theorem` are inside the module docstring (lines 47 and 54).
  - It has no `def`, `abbrev`, `instance`, `opaque`, `variable`, `example`, `lemma` or `set_option`.
  - It has one `import Mathlib` and 29 `TauCeti.*` imports, all of which exist at the pin.
- **`#check` audit.** I put `#check @name` for the 34 theorems in one scratch copy and elaborated it.
  - The types are unchanged from the previous audit. For example, `agol_virtually_haken_of_aspherical : ∀ (M : Type u_1) [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M] (x : M), TauCeti.IsAspherical M x → TauCeti.IsVirtuallyHaken M`.
  - No binder can be lost, since the file has no `variable` block. I changed nothing.
  - The audit copy had one extra `#check @is` error. My script made it by picking up the docstring line 54 ("theorem is proved here"), so it is not a defect of the file.
- **One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | trivial | decide | infer_instance | (simp; done) | exact fun _ => trivial | sorry`. All 34 theorems still fall back to `sorry` (34 `sorry` warnings), so nothing is padding.

### Citations resolved at this round

- **Main moved since the previous review**, from `4820485` to `2bbd3cb`. The only change is the addition of `ClusterAlgebras` and `SpecialFunctionsAiry` (with the generated top-level README and issue-template lists).
  - Neither is cited by this README. Neither states a knot, `3`-manifold, triangulation or mapping-class object. A grep of both for `GeometricTopology|knot|triangulat|mapping class|Dehn twist|3-manifold` finds nothing.
  - The supplier roadmaps on main that this README names have not changed: DifferentialGeometry, HopfRinow (Completed), AlgebraicTopology, TypeAHeckeAlgebras, TemperleyLieb, Subfactors, ReductiveGroups, SuccessiveMinima. The downstream consumers it names have not changed either: CombinatorialHeegaardFloer, Poincare3D, HeegaardFloer, KhovanovHomology, MorseTheory and the others. Their sections resolve as the previous review recorded.
- **Open roadmaps named in ownership and downstream passages** (none is a supplier):
  - FourManifolds, TeichmullerGeometry, TangentialBordism, MordellLawrenceVenkatesh, TemperleyLiebOperatorAlgebras, IndexTheory, RicciFlow, CotangentLagrangian, ConvexityToric.
  - At its open head, TeichmullerGeometry §0.2 ("The diffeomorphism group, paths and smooth isotopies", its README line 290) exists. Its scope line 12 owns the parameter-smoothing converse and says that GeometricTopology Layer 3 does not state it. This matches README lines 2303 and 2373.
  - At its open head, FourManifolds declares `gap:tangent-microbundle-stable-classifier` at its line 209, as README line 338 says.
- `citations.md`: no unresolved citation or Lean name.
- `overlaps.md`: no dropped or revision-only id. #1791 still conflicts with this head in this README, and the description states the order: #1791 is rebased onto this revision. The vocabulary neighbours (FourManifolds, TeichmullerGeometry, KhovanovHomology, PlanarTopology, HomotopySpheres) are unchanged as owners. The README cites none of PlanarTopology, SurfaceTopology or HomotopySpheres.

### Seeded sample

No target of the seeded sample falls in a changed passage, because there is none. As a spot check, I verified three of the sampled targets against the cached sources anyway:

| Target | Locator checked | Result |
|---|---|---|
| 10.2 Novikov–Rosenberg | `calegari2007` line 6702, Theorem 4.35, printed p. 163: taut `F`, `M` not finitely covered by `S¹ × S²`, gives (1) irreducible, (2) leaves `π₁`-injective, (3) transverse loops essential. Line 6876, Theorem 4.37 (Reebless gives `π₂ = 0`, incompressible leaves, essential transversals), §4.6, line 6652. Line 6916, Theorem 4.38, Palmeira, printed p. 168 (`M̃ ≅ ℝ³`). | the README's hypotheses and conclusions match; the "Novikov proper" sentence is the contrapositive of 4.37 |
| 8.5 JSJ | `hatcher-3m` line 531, Theorem 1.9 (compact irreducible orientable; a minimal family is unique up to isotopy); line 576 Lemma 1.10, line 703 Proposition 1.12, lines 761/778/790 Lemmas 1.14–1.16 | the README cites `3Mfds.pdf` numbering and maps it to `3M.pdf` in its References (lines 11074–11081): 3M's Lemma 1.10, Propositions 1.11–1.13 and Lemmas 1.14–1.16 are its Lemma 1.11, Propositions 1.12–1.14 and Lemmas 1.16–1.18. The cached `3M.pdf` agrees with that mapping, and each cited statement matches its description |
| 5.4 cyclic surgery | CGLS, Ann. of Math. 125 (1987), the Cyclic Surgery Theorem (uncached, settled by locator); Moser's criterion | the statement and Checks compute as in the adversarial table below |

The README flags no locator as unverified (a grep for `unverified|uncertified|unchecked` finds nothing).

### Adversarial table

The diff changes no statement. The rows for the headline theorems and earlier-checked statements are carried from the previous review (r85 at `ad05d6a`, which carried its untouched rows from r84 at `308252e`) with the values computed there. The rows marked "this round" were computed for the spot-checked sample targets.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 10.2 Novikov–Rosenberg and Checks (this round) | `S² × S¹` product foliation; `S³`; `L(p, q)`, `p ≥ 2`; linear foliation of `T³` with normal `(1, √2, √3)` | **`S² × S¹`:** reducible, universal cover `S² × ℝ ≠ ℝ³`, so the excluded case is needed. **`S³`:** `π₁ = 1`, so a closed transversal cannot be essential: no taut foliation, though Reeb exists. **`L(p, q)`:** finite covers have finite `π₁`, so none is `S² × S¹`: no taut foliation. **`T³`:** `a + b√2 + c√3 = 0` with `a, b, c ∈ ℤ` forces `a = b = c = 0`, so `P ∩ ℤ³ = 0`; the leaves are injectively immersed planes, dense since `P` is not rational. | holds | none |
| 8.5 JSJ Checks (this round) | `T³` with `∅` and one coordinate torus; two trefoil exteriors glued with fibre to transverse curve; Anosov torus bundle; closed hyperbolic | **`T³`:** both families are torus decompositions (`T² × (0, 1)` is Seifert); only `∅` is minimal. **Glued trefoils:** the closed manifold contains an incompressible torus, so it is not atoroidal; the fibrings do not match, so it is not Seifert; `∅` fails, and one torus is minimal. **Anosov:** not Seifert, not atoroidal; the cut is `T² × (0, 1)`, so 1 torus. **Hyperbolic:** `ℤ² ⊄ π₁`, so `∅`. | holds | none |
| 5.4 cyclic surgery and Checks (this round) | `T(1, 2)` with slope `5`; unknot slopes `∞, 1/2, 5/2`; `T(2, 3)` with `p/q = 5, 6, 7`; granny, `8₃` | **`T(1, 2)`:** `|5 − 1·1·2| = 3`, yet `L(5, 1)`. **Unknot:** `Δ(1/0, 1/2) = 2`, `Δ(1/0, 5/2) = 2`, `Δ(1/2, 5/2) = |2 − 10| = 8`. **`T(2, 3)`:** `|5 − 6| = |7 − 6| = 1`, giving `L(5, 9) = L(5, 4)` and `L(7, 9) = L(7, 2)`; `|6 − 6| = 0` gives `L(2, 3) # L(3, 2) ≅ L(2, 1) # L(3, 1)` up to orientation. **Unknotting:** `u = 2` for both, granny composite, `8₃` prime. | holds | none |
| 2.1 *Half-line* (r85) | `[0, ∞) → ℝ` with `F' = ℝ⁰`, `ℝ`, Cantor set; `F = EuclideanHalfSpace 1` | `ℝ⁰`: 1 component against 2 after removing a point; `ℝ`: an open disc does not embed in `ℝ`; Cantor: the components `[0, c)` are not open intervals; positive control `(x, y) ↦ (y, x)` | holds | none |
| 2.1 *Boundary variants* (r85) | `[0, ∞) → ℝ²` with `F = ℝ`, `ℝ⁰`, `ℝ²`; boundary line in `{y ≥ 0}` | 1 component against 2; one point against an arc; invariance of dimension; identity chart | holds | none |
| `agol_virtually_haken_of_aspherical` (r85) | `S³`, `ℝP³`, `S² × S¹`, `T³`, `K × S¹`, `T³ ⊔ T³`, `∅` | `π₃ ≅ ℤ`, `π₃ ≅ ℤ`, `π₂ ≅ ℤ`: excluded; `T³` and `K × S¹` have cover `ℝ³` and are Haken; not path-connected, or no `x`: excluded | holds | none |
| 7.3 hyperbolic Dehn surgery (r85) | figure-eight, Whitehead, `k = 0`, product neighbourhood | `2v₃ = 2.0298…`; `3.6638…`; Weeks `0.9427…`; `k = 0` makes strictness vacuous; `R = 2` omits `1/0, 0/1, ±1/1` | holds | none |
| Milnor conjecture *Scope* (r85) | `T(1, 7)`, `T(2, 3)`, `T(2, 5)`, `T(3, 4)`, `T(3, 5)` | `0, 1, 2, 3, 4`; `τ(T_{3,4}) = 3` | holds | none |
| Topological Poincaré (r85) | `S² × S¹`; Poincaré sphere | `π₁ = ℤ`; `|π₁| = 120` | holds | none |
| 2.1 Checks, 2.2 Brown (r84) | trefoil cone; `t − sin t`; Möbius core; horned and round spheres | onto `S₃`; derivative `1 − cos t`; one band; horned not bicollared | holds | none |
| 3.1 *C¹ only*, non-compact (r84) | `θ + k⁻² sin kθ`; `x + b(x − k)` | `f′ ≥ 1/2`, `C¹` distance `1/k`; derivative `> 0` | holds | none |
| 4.2, 4.2.2 (r84) | one and `n` crossings; `β`, `γ`, `Mβ` | `V − E + F = 0`, `F = n + 2`; exponent sums `−8, 8, 8`; `V(γ) = t³ + t⁶ − t⁷ + t⁸ − t⁹ + t¹⁰ − t¹¹` | holds | none |
| 4.6.4–4.6.5, 4.8–4.8.2 (r84) | `l − m`; trefoil; unlink; `4₁`; `T(3, 4)`; `L₄` | `0`; `−2s²`; `−1 − s⁻²`; `P(1, z) = 1 + 5z² + 5z⁴ + z⁶`; breadth `12`; Arf `1, 0, 1` | holds | none |
| 4.10.2, 4.11, 5.4.2 (r84) | `(1234)`, `(1243)`; Whitehead link; `S(17, 4)` | `aw² = w²b = (1324)`; `det(tV − Vᵀ) = −2t² + 5t − 2`; orbit `{2, 15, 9, 8} ∌ 4` | holds | none |
| 7.2, 7.4 Checks (r84) | cusp; torus `ω`; smearing; `1, 1` filling | `A/2`; `¼`; `Σ i⁻² = π²/6`; coefficient `1` | holds | none |
| Euler class, Yazdi, Markov, Property P/R, Gordon–Luecke, Mostow (r84) | `S³`, `T³`, `Σ₂ × S¹`, `S² × S¹`; `k = 0`; `σ₀ ∈ B₂`; `S³_{p/q}`; genus two | `|−2| ≤ 2`; tubed torus excluded; empty family; `H₁ = ℤ/p`; `6g − 6 = 6` | holds | none |
| Moise, Hauptvermutung, Manolescu, 10.4, 11.1 (r84) | `φ(tu) = t³u`; `n = 5`; sphere additions; fan | no common subdivision; Corollary 1.3; `χ` even, so the minimum of `|χ|` is `0`; `ℓ¹` distance `2/i → 0` | holds | none |

### Other checks

- **README and Lean agree.** All 34 Lean names occur backticked in the README (`readme-ids-missing=0`), and both files are unchanged.
- **Headlines.** These are unchanged from the previous review. The not-statable list in the module docstring (lines 69 onward) and the "Not stated here although statable" paragraph are as the previous review read them.
- **The description.** Its GeometricTopology paragraph still matches the head. Its LieHighestWeight paragraph is outside this review.
- **Remark on untouched text** (no change requested, carried from the previous review). Lines 506–507 place "(Layer 8.6)" right after "the smooth Poincaré theorem", which can be read as saying 8.6 states the smooth form.
- **Remark on untouched text** (no change requested). The References entry cites Hatcher's `3Mfds.pdf`, whose "Theorem 1.9, p. 18" (line 9526) I could not open. The manifest's `hatcher-3m` entry records `3M.pdf`, where Theorem 1.9 is on printed p. 14 (line 531). The README's own numbering note already reconciles the two files.

## Not verifiable

- The printed page `p. 18` of Hatcher's `3Mfds.pdf` for Theorem 1.9. The cached text is `3M.pdf`, and this review does not fetch new texts or edit the manifest.
- `kirby1997`: the cached text is empty (the PostScript was not rendered). The cited problem numbers are untouched.
- The settled uncertified texts are cited by locator only, and none is newly cited: Lickorish 1997, Moise, Rourke–Sanderson, Ratcliffe, Hirsch, Thurston 1986, Gabai 1983, Farb–Margalit, Monod, Haagerup–Munkholm, Kauffman 1987, Hoste–Thistlethwaite–Weeks, Lickorish 1962/1964.
- Culler–Gordon–Luecke–Shalen (Ann. of Math. 125, 1987) and Moser (Pacific J. Math. 38, 1971) are not in the sources cache. The 5.4 row computes the Checks, not the source text.
- Ownership against open pull requests was checked over the 450 open heads of this round's index in two ways.
  - Through `overlaps.md` and the open heads named above.
  - With `roadmaps grep -i 'Novikov.Rosenberg|JSJ (theorem|decomposition)|cyclic surgery theorem' --readme-only`. Outside this roadmap (on main, here, and in #1791, which revises it), the only hits are FreeGroupsAndLimitGroups (on main, and carried in #1187). Those hits concern JSJ decompositions of groups after Guirardel–Levitt, a different object, so the 3-manifold JSJ theorem has no second owner.

## Source issues

- none
