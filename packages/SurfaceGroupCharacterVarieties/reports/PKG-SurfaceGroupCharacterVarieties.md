# PKG-SurfaceGroupCharacterVarieties: package report

Deliverables: `packages/SurfaceGroupCharacterVarieties/README.md`, `Suggested.lean`, `metadata.toml`
(`topic = "math.GT"`, as MappingClassGroupsAndCanonicalRepresentations and GeometricTopology),
`sources.toml` (one `cited_for` entry extended), `design/plan.json` unchanged (its two gaps,
`gcr-reductive-identity-component` and `borel-tits`, are still needed and still stated under their
suppliers' contract subsections).

The README is the accepted design written out, with no target, Check or worked example dropped. The
review that accepted it had no findings; its maintainer notes were all refuted at that head. The
changes are listed below under "Corrections and additions".

## Headline theorems

Stated in `Suggested.lean`, each with `sorry`:

| Headline | README | Lean name |
|---|---|---|
| Non-descent: the action `φ · ρ = ρ ∘ φ⁻¹` of `Aut(Γ)` on `Hom(Γ, H)` descends to `Out(Γ)` iff every homomorphism has commutative image | §1.3 | `exists_outAction_iff_commute` |
| Homeomorphisms of `X ∖ P` extend uniquely over the punctures | §2.2 | `existsUnique_homeomorph_extension` |
| Ambient isotopies of `X ∖ P` extend uniquely, fixing `P` | §2.2 | `existsUnique_ambientIsotopy_extension` |
| The outer action `Ψ_x`: a well-defined homomorphism `Homeo(X) → Out(π₁(X, x))`, `f ↦ [f_δ]`, trivial on homeomorphisms ambient isotopic to the identity | §3.3 | `exists_outerAction` |
| Real Kempf–Ness (i): minimal vectors are the norm minimizers of their orbits | §5.4 | `minimalVectors_eq_normMinimizers` |
| Real Kempf–Ness (ii): an orbit is closed iff it meets the minimal vectors | §5.4 | `isClosed_linearOrbit_iff` |
| Real Kempf–Ness (ii): the minimal vectors of a closed orbit form one `K`-orbit | §5.4 | `linearOrbit_inter_minimalVectors` |
| Real Hilbert–Mumford (iii): a limit along `exp(tα)`, `α ∈ 𝔭`, with closed orbit | §5.4 | `exists_tendsto_closed_linearOrbit` |
| (iv): exactly one closed orbit in each orbit closure | §5.4 | `existsUnique_closed_linearOrbit` |
| Characterizations (a) ⇔ (b) ⇔ (e') ⇔ (f) of reductive representations | §6.7 | `isReductiveRep_tfae` |
| `𝒳(Γ, G^ℝ)` is Hausdorff, locally compact and second countable | §7.1 | `characterVariety_t2_locallyCompact_secondCountable` |
| For complex `G`, the closed-orbit map `Hom(Γ, G(ℂ)) → 𝒳` is the universal Hausdorff quotient | §7.2 | `characterVariety_universalHausdorffQuotient` |
| `Out(Γ)` acts on `𝒳(Γ, G^ℝ)` by homeomorphisms | §7.4 | `exists_outAction_characterVariety` |

The definitions these need, each with a real body: `Out` and the instance `innerAut_range_normal`;
`pointwiseTopology` (scoped) and `conjOrbit`; `symmetricPart`, `IsRealReductiveLinearGroup`,
`minimalVectors` and `linearOrbit`; `adjointRepresentation`, which is Tau Ceti's
`Derivation.adRepresentation` read on `B`-valued points; `IsReductiveRep`; `reductiveConjSetoid`;
and `CharacterVariety` with its quotient topology instance.

Tau Ceti's library of affine groups is what makes the Layer 6–7 headlines statable. At the pin it
has connected reductive groups as finite-type Hopf algebras (`TauCeti.reductiveCommHopfAlgProperty`),
their topologised convolution groups of points, and the adjoint action on counit derivations. The
review accepting the design expected only §§1.3 and 5.4 to be statable; it had not looked for these
carriers.

Not statable at the pins; each is named in the module docstring:

- **§3.4.** The image of the orientation-preserving classes of a closed oriented surface of genus
  ≥ 1 is the subgroup of `Out(π₁)` acting trivially on `H₂(π₁; ℤ)`. Missing: the genus of a
  topological surface, and orientation-preserving homeomorphisms. `TauCeti.IsClosedConnectedSurface`
  exists, but Tau Ceti's orientations are those of smooth manifolds with corners.
- **§3.5.** Non-descent for the based action of `Mod(S*)` of `S = Σ_{g,n}`. Missing: the same genus
  and orientation. Its group-theoretic core, §1.3, is stated.
- **§6.7 (c) and (d).** Reductive identity component of the Zariski closure, and `G`-complete
  reducibility. Missing: a Zariski closure of a set of points of an affine group as a closed
  subgroup scheme, and `G`-complete reducibility.
- **§7.1's minimal-vector model `(M ∩ Hom)/K ≅ 𝒳`.** Missing: the Cartan-compatible realization of
  §5.3, a construction of this roadmap that the pins lack.
- **§7.2's homeomorphism `𝒳(Γ, G(ℂ)) ≅ (Hom(Γ, G)//G)(ℂ)`.** Missing: the representation scheme as
  an affine scheme, and the affine quotient. Its topological content, the universal Hausdorff
  quotient, is stated.

## What the README could not support

Nothing it plans is dropped. Its Lean content is limited to the headlines above. Two kinds of target
stay as README targets only:

- the clauses listed above as not statable;
- the heavy constructions: the representation scheme `Hom(Γ, G)` (§4.1), the affine quotient (§7.2)
  and the realization of §5.3.

## Notions moved down from later roadmaps

None. Every supplier is on main, earlier in the merge order, or another author's open pull request
adding a new roadmap folder (RealSemisimpleLieGroups, #2229 at the index; it is named in the README
by roadmap and section only).

## Duplication sweep (by object) and removals

No target this roadmap owns is deleted; none exists elsewhere. Supplier citations whose objects are
now at the pins were re-pointed to the pinned declarations:

1. ReductiveGroups Layer 0 (affine groups as Hopf algebras and their functors of points). Now cited
   to Mathlib `HopfAlgebra` and Tau Ceti `TauCeti.FiniteTypeCommHopfAlgCat`,
   `AlgHom.convGroupOfSemiring` and `AlgHom.mapValue` (`Algebra/AlgebraicGroup/FunctorOfPoints.lean`).
   Removed from §4.1, §5.2, the Layer 4 and 5 dependencies, and the ReductiveGroups contract.
2. ReductiveGroups Layer 2 (`Lie(G)` and the adjoint representation). Now cited to
   `Derivation.adRepresentation` (`Algebra/AlgebraicGroup/Tangent/Adjoint.lean`) and
   `TauCeti.Bialgebra.CounitAlgebra.algEquivSelf`, in §5.1, §6.1 and the contract. Layer 2 stays
   cited for Lie algebras of closed subgroups and separability.
3. ReductiveGroups Layer 6 (reductivity, and its characteristic-zero equivalence with linear
   reductivity). Now cited to `TauCeti.reductiveCommHopfAlgProperty`,
   `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` and
   `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`
   (`Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:96, 118`), in the Conventions,
   §5.1, §6.3, §7.2 and the Layer 7 dependencies. Layer 6 stays cited for the centre being of
   multiplicative type.
4. ReductiveGroupsPartII §§RG2.0.1 and RG2.0a.2 (local compactness of points; points of Weil
   restrictions). These are read on `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`,
   `TauCeti.PointTopology.isTopologicalGroup` and `TauCeti.Algebra.WeilRestriction.pointsMulEquiv`.
   The sections stay cited for closed embeddings given by finite presentations.
5. LieGroups Layer 9 (on main) owns global matrix models: closed transpose-stable subgroups of
   `GL_N(ℝ)` with finitely many components, as fields of `FiniteCartanMatrixModel`. §5.4's new
   predicate `IsRealReductiveLinearGroup` is declared a kept variant in the Scope and in §5.4: it is
   BohmLafuente2021's polar condition on a subgroup of `GL(V)`. One direction of the comparison is
   proved in the README (transpose-stable by BohmLafuente2021 lines 1021–1022; finitely many
   components). The converse is not claimed.
6. `Out(Γ)` is TeichmullerGeometry §4.2's `OuterAut`. `Suggested.lean` restates it as `Out` only
   because no roadmap can be imported and the pins have no outer automorphism group of an abstract
   group. Tau Ceti `TauCeti.ContinuousOut` needs a topology on the group. Scope and §1.1 say this.

Searched with `roadmaps grep` at the indexed heads and on main, with nothing owned here found
elsewhere:

- "Kempf–Ness": only TensorProductCombinatorics, which has the projective moment-zero direction.
- "minimal vectors": only lattice minima.
- "character variet": only references, Checks and consumer clauses. RealSemisimpleLieGroups'
  Scope leaves character varieties of surface groups to another roadmap, and
  MappingClassGroupsAndCanonicalRepresentations §1.4's `M_r(Γ)` is the `GL_r` case.
- "extends uniquely to a homeomorphism": no match.
- "conjugacy classes of homomorphisms": construction remarks in MordellLawrenceVenkatesh §5.9 and
  GroupActionsOnRiemannSurfaces only.

`Inn(Γ) ≃ Γ/Z(Γ)` is not in Mathlib at the pin. Tau Ceti's `TauCeti.ContinuousAut.ker_conj` is the
continuous-automorphism analogue on a different carrier. The target is kept.

Ownership against open pull requests was checked with `roadmaps grep`, `roadmaps show` and
`roadmaps resolve` at the indexed heads. `roadmaps resolve` finds no cross-roadmap citation and no
Lean name missing.

## Corrections and additions to the design text

- **Conventions.** New paragraph "Affine groups and their points", with the `𝔾_m` witness: points
  `R^×`, Lie algebra spanned by `t ↦ 1`, `Ad` trivial. The real reductive datum is tied to the
  Tau Ceti carrier; `pointwiseTopology` is named.
- **§5.4.** The definitions behind the Lean statements, with an API list and four Checks:
  - `GL(V)` has `M = {0}`;
  - `SO(V)` has `𝔭 = 0` and `M = V`;
  - the unitriangular group is not real reductive, and a definition of `𝔭` without symmetry would
    accept it;
  - the irrational line in a torus shows closedness is needed.
- **§6.1.** `IsReductiveRep` is defined over any field, Hopf algebra and subgroup of points, so the
  README matches the Lean. A Check over `ℂ` is added.
- **§6.7.** Clause (e') (classical closedness of the complex orbit, by §6.5) is named; the Lean
  states it.
- **§7.1.** The general definition of `CharacterVariety` is added; for complex `G` it is
  `CharacterVariety Γ ⊤` with `k = ℂ`.
- **§7.2.** The closed-orbit map is named.
- **§§1.1, 1.3, 2.2, 3.3, 4.1, 4.2, 5.4, 6.7, 7.1, 7.2, 7.4.** Each says which `Suggested.lean`
  declaration states it.
- **Summary.** One sentence on what `Suggested.lean` states.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_outAction_iff_commute` | `Γ = 1`; `Γ = ℤ, H = S₃`; `Γ = H = S₃, ρ = id`; `Γ = F₂, H = ℤ` | `MulAut 1 = 1`, both sides true. `Out(ℤ) = ℤ/2`, cyclic images, both true. `conj (1 2) · id = conj (1 2)⁻¹ ≠ id` while `[conj (1 2)] = 1`, so LHS false; `(1 2)(2 3) ≠ (2 3)(1 2)`, RHS false. `ρ(γ⁻¹δγ) = ρ(δ)`, both true | iff holds both ways | none |
| `existsUnique_homeomorph_extension` | `P = ∅`; `S², {N, S}`; `[0,1], {0}`; `[0,1], {0,1}`; `S¹`, two points; isolated `p` | `e = h`. `(θ, s) ↦ (−θ, −s)` extends to the rotation by `π` swapping `N, S`. `U ∖ {0} = (0, ε]` connected, homeomorphisms of `(0,1]` fix `1` and extend by `0 ↦ 0`. Flip of `(0,1)` extends to the flip. `U ∖ {p}` is two arcs, hypothesis false. `U ∖ {p} = ∅` fails `IsConnected` | true; hypothesis discriminates | none |
| `existsUnique_ambientIsotopy_extension` | `P = ∅`; cylinder rotation `θ ↦ θ + 2πt`; translation `s ↦ s + t` | Rotation about the `NS` axis fixes the poles. The flow from `S` to `N` fixes both and is continuous as `s → ±∞`. Uniqueness: `I × (X ∖ P)` is dense | true | none |
| `exists_outerAction` | point; `S¹`; `T²` shear; `[0,1]` flip; composition law | `Out(1) = 1`. Rotations give `1`, `z ↦ z̄` gives `−1 ∈ ℤ/2`. `(1,0) ↦ (1,1)`, `(0,1) ↦ (0,1)`, column matrix `[[1,0],[1,1]]`. `π₁ = 1`, `Ψ = 1` though the flip is not isotopic to `1` (no injectivity claimed). `(f ∘ g)_{δ ⬝ fε}[γ] = [δ ⬝ fε ⬝ fgγ ⬝ (fε)‾ ⬝ δ̄] = f_δ(g_ε[γ])`, matching `(f * g) x = f (g x)` in `X ≃ₜ X` and in `MulAut` | true | none |
| `symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors` (definitions) | `GL(V)`; `SO(V)`; unitriangular `N ⊆ GL₂(ℝ)`; `{diag(e^{it}, e^{i√2 t})}` on `ℂ²` | Polar decomposition holds, `A = 1` forces `‖v‖² = 0`, `M = {0}`. `exp(2tA) = 1` forces `A = 0`, `M = V`. `N ∩ O(2) = 1`, `𝔭 = 0`, `K exp 𝔭 = {1} ≠ N`; with `𝔭 := 𝔤`, `N = exp 𝔤` would pass. Not closed, `K = G`, `𝔭 = 0`, orbit of `(1,1)` dense in `T²` | definitions separate; closedness needed | Checks added (§5.4) |
| `minimalVectors_eq_normMinimizers` | `G = 1`; `ℝ_{>0}` on `ℝ`; `GL(V)`; `SO(V)` | `M = V = RHS`. `tv² = 0` for all `t` iff `v = 0`; `abs v ≤ λ abs v` for all `λ > 0` iff `v = 0`. `g = ½`, so `v = 0` on both sides. `M = V = RHS` | equal | none |
| `isClosed_linearOrbit_iff` | `ℝ_{>0}` on `ℝ`; `(ℝ_{>0})²` on `ℝ²`; `SL₂(ℝ)` conjugation on `M₂(ℝ)`; `V = 0` | `(0, ∞)` not closed, misses `M = {0}`; `{0}` closed, meets it. Open quadrant not closed, misses `{0}`. Orbit of `[[1,1],[0,1]]` has squared norms `2 + t⁴ → 2`, with `1` in the closure and outside the orbit; the orbit of `diag(2, 1/2)` contains the normal (minimal) `diag(2, 1/2)` and is closed (`tr = 5/2`). `{0}` closed and minimal | iff holds both ways | none |
| `linearOrbit_inter_minimalVectors` | `SO(V)`; `ℝ_{>0}`, `w = 0`; `SL₂(ℝ)`, `w = diag(2, 1/2)` | Orbit ∩ `M` = orbit = `K w`. `{0} = K · 0`. The normal matrices of trace `5/2` and determinant `1` are the symmetric ones, the `SO(2)`-conjugates of `w` | equal | none |
| `exists_tendsto_closed_linearOrbit` | `ℝ_{>0}`, `v = 1`; `(ℝ_{>0})²`, `v = (1,1)` | `α = −1`: `e^{−t} → 0`, `{0}` closed. `α = diag(−1,−1) → 0`, closed; `diag(−1, 0) → (0,1)`, whose orbit `{0} × ℝ_{>0}` is not closed and is excluded by the clause | true; closed-orbit clause needed | none |
| `existsUnique_closed_linearOrbit` | `ℝ_{>0}` on `ℝ`; quadrant; `SL₂(ℝ)`, unipotent | Closure `[0, ∞)` holds the single closed orbit `{0}`. Closed quadrant: orbits `{0}`, two half-axes (not closed), the quadrant; unique `{0}`. Closure = orbit ∪ `{1}`; unique `{1}` | true | none |
| `adjointRepresentation`, `IsReductiveRep` | `𝔾_m` over `k`; `SL₂(ℝ)`, `ρ(1) = [[1,1],[0,1]]`; `GL₂(ℝ)`, `diag(2,3)`; trivial `𝐆`; `GL₂(ℂ)`, unipotent | Derivations of `k[t, t⁻¹]` are `k` (`d t = 1`), `Ad = 1`, all reductive. `u E₂₁ u⁻¹ = [[1,−1],[1,−1]] ≠ E₂₁`, a nontrivial unipotent, not semisimple. Eigenvalues `1, 1, 2/3, 3/2` with matrix-unit eigenbasis. Zero Lie algebra, complemented lattice, true. Same unipotent over `ℂ`, false | discriminating | Check added (§6.1) |
| `isReductiveRep_tfae` | `GL₁`, `Γ = ℤ`; `SL₂(ℝ)`, `ρ(1) = u`; `SL₂(ℝ)`, `ρ(1) = diag(2, 1/2)`; `Γ = 1` | `Ad = 1`, orbits are points: all four true. `diag(t, t⁻¹) u diag(t, t⁻¹)⁻¹ = [[1, t²],[0,1]] → 1` for real and complex `t`: all four false. `Ad` eigenvalues `4, 1, 1/4`, real and complex classes `{tr = 5/2}` closed: all true. All true | consistent | (e') named in §6.7 |
| `reductiveConjSetoid`, `CharacterVariety` | `ℤ`, `SL₂(ℝ)`; torus `G^ℝ`; `Γ = 1` | `[u]` and `[1]` cannot be separated in `Hom/G^ℝ`, and only `[1]` is a point of `𝒳`. Conjugation trivial, so `𝒳 = Hom(Γ^{ab}, G^ℝ)`. A point | matches §7.1 Checks | general definition stated in §7.1 |
| `characterVariety_t2_locallyCompact_secondCountable` | `Γ` free of rank `ℵ₀`, `ℝ^×`; `F_m`, `ℝ^×`; compact `SO(n)` | `(ℝ^×)^ℕ` is not locally compact (finite generation is needed and is in scope). `(ℝ^×)^m` is locally compact and second countable. `M = V`, `𝒳 = Hom/G^ℝ` compact Hausdorff | true; `Group.FG` needed | none |
| `characterVariety_universalHausdorffQuotient` | `GL₁/ℂ`, `ℤ`; `SL₂/ℂ`, `ℤ`, `u` | `q = id` on `ℂ^×`. `q(u) = [1]`; a continuous invariant `F` into a T2 space has `F(u) = F([[1,t²],[0,1]]) → F(1)`, so `F(u) = F(1)`, consistent with factoring through `q` | true | §7.2 names the closed-orbit map |
| `exists_outAction_characterVariety` | `ℤ`, `SO(2)`; inner automorphisms; composition | `𝒳 = SO(2)`, `[−1]` acts by `g ↦ g⁻¹`, fixed points `±1`. `ρ ∘ conj(γ)⁻¹ = conj(ρ γ)⁻¹ ∘ ρ`, same class. `[φψ]·[ρ] = [ρ ∘ ψ⁻¹ ∘ φ⁻¹] = [φ]·([ψ]·[ρ])`, matching `(f * g) x = f (g x)` | true; `hH`, `hG`, `Group.FG` unused (P3; kept at the README's generality) | none |
| Conventions witness, `𝔾_m` | `O = k[t, t⁻¹]` | point `t ↦ λ`; `d(t⁻¹) = −d(t)`, so Der = `k`; `Ad` trivial | correct | added |
| §5.4 kept-variant claim | `g = k exp X` | `gᵀ = exp(X) k⁻¹ ∈ G`; `π₀(G) = π₀(K)` is finite, `𝔭` being connected and `K` compact | the stated direction holds; converse not claimed | added |

Context check (`#check @name` for all 25 declarations, elaborated once in a scratch file):

- Every theorem carries its hypotheses: Layer 2 has `[CompactSpace X] [T2Space X]` and the finite
  `P` with the basis hypothesis; Layer 5 has `[FiniteDimensional ℝ V]`; Layers 6–7 have
  `reductiveCommHopfAlgProperty`, `IsOpen G` and `[Group.FG Γ]`.
- The Layer 5 definitions do not carry `[FiniteDimensional ℝ V]`. They do not need it, and every
  theorem using them does carry it.
- No change was needed after the comparison.

## Elaboration

Command: `lake env lean` on `TauCetiRoadmap/SurfaceGroupCharacterVarieties/Suggested.lean`, run
from the content checkout. No `TauCeti.*` build was needed; the object files were present.

- 13 warnings, all `declaration uses 'sorry'`, one per theorem.
- No other message.

The file starts with `module`, then a single `import Mathlib` and four `TauCeti.*` imports, all
modules that exist at the pinned Tau Ceti:

- `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic`
- `TauCeti.Algebra.AlgebraicGroup.Tangent.Adjoint`
- `TauCeti.Topology.Algebra.PointTopology.Basic`
- `TauCeti.Topology.Homotopy.AmbientIsotopic.Basic`

There is no `set_option`. The file is 365 lines.

## Gate and dependency check

The full gate was run on a scratch copy laid out as `TauCetiRoadmap/SurfaceGroupCharacterVarieties/`:

```text
gate SurfaceGroupCharacterVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 git=1 source-material=0 FAIL
  git: git status --short: fatal: not a git repository (or any of the parent directories): .git
```

The only failure is `git`, because the scratch copy is not a repository.

Dependency check, the command of the brief:

```text
depcheck: 243 roadmaps, 2255 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Sources

No new source was fetched and no `needs-references.toml` was written. Every locator is in the
manifest. BohmLafuente2021's `cited_for` now also names the §5.4 definitions (condition (1), lines
52–62); the new locator lines 1021–1022 (transpose-stability) were read in the cached text and lie
in its Appendix A. Nothing was quoted.

## Untrusted text

No passage in the reviews, the other roadmaps or the sources asked for an action outside this job.
