Verdict: design
Name: QuasiregularMaps
Base: none
Owner: none

## Scope

The roadmap builds quasiregular maps between oriented Riemannian manifolds of one dimension
`n ≥ 2` and the notion of a quasiregularly elliptic manifold, in the generality of the
manifold-valued definition used by Bonk–Heinonen, Prywes and Heikkilä–Pankka
(HeikkilaPankka2025 lines 20–27; Prywes2019 lines 22–27). Throughout, `M` and `N` are
oriented Riemannian `n`-manifolds without boundary, Hausdorff and second countable, `N`
connected where ellipticity is discussed, and the Sobolev carrier is the one
SobolevMapsBetweenManifolds (`TARGET-SobolevMapsBetweenManifolds`, #6021) plans: the class
`W^{1,n}_loc(M, N)` of continuous maps, the a.e.-defined weak differential `Df`, its operator
norm `‖Df‖` and the Jacobian `J_f` defined by `(Df)^* vol_N = J_f vol_M`, with Hadamard's
inequality `|J_f| ≤ ‖Df‖ⁿ`. None of this is re-planned here; it is imported by name and
section.

**Owned here.**

1. *Distortion inequality and the class.* `f : M → N` is `K`-quasiregular (`K ≥ 1`) when it is
   continuous, lies in `W^{1,n}_loc(M, N)` and satisfies `‖Df(x)‖ⁿ ≤ K J_f(x)` for a.e. `x`;
   quasiregular means `K`-quasiregular for some `K`. The outer distortion `K_O(f)` is the
   infimum of the admissible `K`; prove it is attained and equals
   `max {1, ess sup ‖Df‖ⁿ / J_f}` with the convention that the quotient is `0` where both
   vanish (and `+∞` where `J_f = 0 < ‖Df‖`), so a constant map has `K_O = 1`. Elementary
   consequences, each a theorem: `J_f ≥ 0` a.e.; `Df = 0` a.e. on `{J_f = 0}`;
   `J_f ∈ L¹_loc(M)` (from Hadamard and `‖Df‖ ∈ Lⁿ_loc`); the restriction to an open subset
   is quasiregular with no larger constant; quasiregularity is local. Constant maps, and
   `C¹` maps that are orientation-preserving and conformal (in particular identities,
   orientation-preserving isometries, and locally isometric coverings) are `1`-quasiregular.
   In this generality the definition is that of MartioRickmanVaisala1969 Definition 2.20
   (lines 409–412) with `W^{1,n}_loc` in place of `ACLⁿ`, and of Rickman1993 Ch. I.
2. *Inner distortion.* For a linear map `A` between `n`-dimensional oriented inner product
   spaces write `ℓ(A)` for its minimal stretch (the least singular value) and `J(A)` for its
   determinant relative to oriented orthonormal bases. For quasiregular `f` the inner
   distortion `K_I(f)` is the least `K ≥ 1` with `J_f ≤ K ℓ(Df)ⁿ` a.e.
   (MartioRickmanVaisala1969 (2.22), lines 414–416). Prove, first for a single linear map
   through its singular values and then a.e., the two inequalities `K_I(f) ≤ K_O(f)^{n−1}` and
   `K_O(f) ≤ K_I(f)^{n−1}` (MartioRickmanVaisala1969 (2.25), line 438), so that the maximal
   distortion `K(f) = max {K_O(f), K_I(f)}` of Rickman's convention (Rickman1993 Ch. I) bounds
   the same class of maps, with `K`-quasiregular in one sense implying `K^{n−1}`-quasiregular
   in the other. Record the warning of MartioRickmanVaisala1969 lines 423–425: the inner
   inequality alone does not define the class, since a projection of rank `n − 1` satisfies
   it with `K = 1`.
3. *Invariance.* If `g'_M` and `g'_N` are Riemannian metrics uniformly comparable to `g_M`
   and `g_N` (each squeezed between constant multiples of the other), the quasiregular maps
   for the primed and unprimed metrics coincide and the constants change by a factor
   depending only on the comparability constants and `n`; the volume forms and hence
   `J_f` change by a bounded positive density. Hence on a compact manifold the class is
   independent of the metric, and the quasiregular maps `ℝⁿ → N` for compact `N` depend only
   on the smooth structure and the orientation of `N`. Reversing both orientations preserves
   the class and the constants; reversing one orientation sends `J_f` to `−J_f`.
   Precomposition with a `C¹` orientation-preserving local diffeomorphism and
   postcomposition with a `C¹` map that is quasiregular (for example an orientation-preserving
   conformal diffeomorphism or a locally isometric covering) preserve quasiregularity, with the
   product bound on `K_O`, through the chain rules the supplier proves. The composition of two
   arbitrary quasiregular maps is a final target (it rests on Reshetnyak's theorem through
   the a.e. positivity of the Jacobian of a non-constant quasiregular map).
4. *Quasiregularly elliptic manifolds.* For connected oriented Riemannian `N` without
   boundary, `N` is quasiregularly elliptic when a non-constant quasiregular map `ℝⁿ → N`
   exists, and `K`-quasiregularly elliptic when one exists with constant `K`
   (HeikkilaPankka2025 lines 20–21 and 271–273). Prove: for closed `N` both notions are
   independent of the metric (by 3) and of the orientation of `N` (precompose with a
   reflection of `ℝⁿ`, an orientation-reversing isometry); the flat torus `Tⁿ = ℝⁿ/ℤⁿ` is
   `1`-quasiregularly elliptic through its locally isometric covering, and so is any closed
   quotient of `ℝⁿ` or of `Tⁿ` by a free, properly discontinuous, orientation-preserving
   isometric action; if `N` is quasiregularly elliptic and `p : N → N'` is a finite smooth
   orientation-preserving covering of closed manifolds then `N'` is quasiregularly elliptic.
   The transfer along an arbitrary non-constant quasiregular map `g : N → N'` between closed
   connected manifolds is a final target (it needs the composition theorem and the openness
   of the first map and discreteness of the second, so that `g ∘ f` is non-constant).
5. *Stated targets* (`sorry` in `Suggested.lean`): Reshetnyak's theorem, the `ACLⁿ`
   characterisation, and the three cohomological constraints on closed quasiregularly
   elliptic manifolds, listed under Final targets.

**Not owned.** Sobolev maps between manifolds and their Jacobians
(SobolevMapsBetweenManifolds); scalar Sobolev spaces, Morrey's embedding and the
`p = n` borderline (PDE Lane A, Tau Ceti `W1p`); orientations, volume forms, Riemannian
measure, de Rham cohomology, Mayer–Vietoris, the de Rham theorem and the mapping degree
(DifferentialGeometry Layers 2, 6–8, 10, 12); the area and coarea formulas
(GeometricMeasureTheory G2); two-dimensional quasiconformal maps and the Beltrami
equation (TeichmullerGeometry §7.4, PR #1169); the modulus of path families, capacity,
the Poletsky and Väisälä inequalities, value distribution, Rickman's Picard theorem,
Liouville's theorem for `1`-quasiregular maps in dimension `n ≥ 3`, the `L^{1+ε}`
integrability of the Jacobian (Bojarski–Iwaniec, Gehring's lemma), Stoïlow factorisation
in dimension two, and uniformly quasiregular dynamics: these are later roadmaps or Part II
candidates, not planned here. Mappings of finite distortion (IwaniecMartin2001 Ch. 6) are
mentioned only to place the definition; they are not built.

**Generality note on the filed wording.** The filed target asks for `K_O ≤ K_I^{n−1}` and
`K_I ≤ K_O^{n−1}`; these are the correct exponents and are owned as stated. Prywes's bound is
filed as `dim H^k_dR(N) ≤ C(n, k)`; the theorem is the sharp binomial bound
`dim H^k_dR(N) ≤ binom(n, k)`, which is the target below (Prywes2019 lines 28–30; the
constant-only form is Bonk–Heinonen's, with `K` in the constant). The filed claim that
"compositions of quasiregular maps are quasiregular" is kept, but as a stated target in its
general form, because its proof needs Reshetnyak's theorem; the cases with one `C¹` factor
are proved. The filed remark that the roadmap "supplies" DifferentialGeometry's de Rham
cohomology is reversed: de Rham cohomology is consumed here.

## Final targets

Each is stated with its hypotheses, for oriented Riemannian `n`-manifolds `M`, `N` without
boundary, `n ≥ 2`, and the class `W^{1,n}_loc(M, N)` of SobolevMapsBetweenManifolds.

- **T1 (outer distortion attained).** For `f ∈ W^{1,n}_loc(M, N)` continuous, the set of
  `K ≥ 1` with `‖Df‖ⁿ ≤ K J_f` a.e. is either empty or a closed interval `[K_O(f), ∞)`, and
  `K_O(f) = max {1, ess sup_M ‖Df‖ⁿ / J_f}` with `0/0 = 0`. For quasiregular `f`:
  `J_f ≥ 0` a.e., `Df = 0` a.e. on `{J_f = 0}`, `J_f ∈ L¹_loc(M)`. (Standard; the
  definitions are MartioRickmanVaisala1969 lines 409–419 and Rickman1993 Ch. I.)
- **T2 (inner and outer distortion).** For quasiregular `f`,
  `K_I(f) ≤ K_O(f)^{n−1}` and `K_O(f) ≤ K_I(f)^{n−1}`, both sharp; the pointwise lemma is: for
  a linear map `A` between `n`-dimensional inner product spaces with singular values
  `σ_1 ≥ … ≥ σ_n`, `‖A‖ = σ_1`, `ℓ(A) = σ_n`, `|J(A)| = σ_1 ⋯ σ_n`. Hence the class of
  quasiregular maps is the same whether defined by `K_O ≤ K`, by `K_I ≤ K` together with
  quasiregularity, or by `max {K_O, K_I} ≤ K`. (MartioRickmanVaisala1969 (2.25), line 438;
  Rickman1993 Ch. I.)
- **T3 (invariance).** Uniformly comparable metrics on `M` and on `N` define the same
  quasiregular maps, with `K_O` changed by a factor depending only on the comparability
  constants and `n`; for compact `N` the quasiregular maps `ℝⁿ → N` depend only on the smooth
  structure and orientation of `N`. Precomposition with a `C¹` orientation-preserving local
  diffeomorphism `θ : M' → M`, and postcomposition with a `C¹` quasiregular map, preserve
  quasiregularity with `K_O(g ∘ f) ≤ K_O(g) K_O(f)`. (Chain rules of
  SobolevMapsBetweenManifolds; Rickman1993 Ch. I.)
- **T4 (composition, stated).** If `f : M → N` and `g : N → P` are quasiregular, then
  `g ∘ f` is quasiregular with `K_O(g ∘ f) ≤ K_O(g) K_O(f)`. (Rickman1993 Ch. I; rests on
  T6 through the a.e. positivity of `J_f` for non-constant `f`.)
- **T5 (elliptic manifolds).** For closed connected `N`: quasiregular ellipticity and
  `K`-quasiregular ellipticity are independent of the metric and of the orientation of `N`;
  `Tⁿ` with the flat metric is `1`-quasiregularly elliptic; a closed manifold finitely
  covered, orientation-preservingly, by a quasiregularly elliptic manifold is quasiregularly
  elliptic. Stated target: if `M` is quasiregularly elliptic and `g : M → N` is a
  non-constant quasiregular map of closed connected manifolds, then `N` is quasiregularly
  elliptic (T4 together with T6; the special case of a quasiregular piecewise linear
  branched covering `Tⁿ → N` composed with the covering `ℝⁿ → Tⁿ` is the construction at
  HeikkilaPankka2025 lines 32–34 and 85–91).
- **T6 (Reshetnyak's theorem, stated).** A non-constant quasiregular map `f : M → N` with
  `M` connected is open and discrete, is differentiable a.e., satisfies Lusin's condition
  (N), and has `J_f > 0` a.e. (MartioRickmanVaisala1969 Lemma 2.26, lines 440–444, in the
  Euclidean case; Reshetnyak1989 Ch. II; Rickman1993 Ch. I.) Euclidean continuity
  statement: if `u ∈ W^{1,n}_loc(Ω; ℝⁿ)` for an open `Ω ⊆ ℝⁿ` (vector-valued Sobolev
  functions, componentwise in Tau Ceti's `W1p`) satisfies `‖Du‖ⁿ ≤ K det Du` a.e., then `u`
  has a continuous representative (Reshetnyak1989 Ch. II; Rickman1993 Ch. I).
- **T7 (ACLⁿ, stated).** For open `Ω ⊆ ℝⁿ` and continuous `u : Ω → ℝⁿ`, `u` is `ACLⁿ`
  (absolutely continuous on almost every coordinate line segment in every compact cube,
  with partial derivatives in `Lⁿ_loc`; MartioRickmanVaisala1969 Definition 2.16, lines
  332–340) if and only if `u ∈ W^{1,n}_loc(Ω; ℝⁿ)`. (Vaisala1971 Ch. 3; Rickman1993 Ch. I.)
- **T8 (Bonk–Heinonen, stated).** For closed connected oriented `N` of dimension `n ≥ 2`
  and `K ≥ 1`, if `N` is `K`-quasiregularly elliptic then `dim H^k_dR(N) ≤ C(n, K)` for all
  `k`, with `C` depending only on `n` and `K`. (BonkHeinonen2001 Theorem 1.1, as cited by
  Prywes2019 lines 33–34 and HeikkilaPankka2025 lines 61–63.)
- **T9 (Prywes, stated).** For closed connected oriented quasiregularly elliptic `N` of
  dimension `n`, `dim H^k_dR(N) ≤ binom(n, k)` for `0 ≤ k ≤ n`. (Prywes2019 Theorem 1.1,
  lines 28–30.)
- **T10 (Heikkilä–Pankka, stated).** For closed connected oriented quasiregularly elliptic
  `N` of dimension `n ≥ 2` there is an injective homomorphism of graded ℝ-algebras
  `H^*_dR(N) → ⋀^* ℝⁿ`. (HeikkilaPankka2025 Theorem 1.1, lines 18–19.)
- **T11 (a non-elliptic simply connected manifold).** `#^4 (S² × S²)` is not quasiregularly
  elliptic, by T9 and `dim H²_dR(#^4(S² × S²)) = 8 > 6` (Prywes2019 Corollary 1.2, lines
  41–53); this answers the question of Gromov1981 p. 200 (as cited at Prywes2019 lines 37–39
  and HeikkilaPankka2025 lines 57–60). The cohomology computation consumes DifferentialGeometry
  Layer 7 (Mayer–Vietoris) and a Künneth or product computation for `S² × S²` (see Risks).

**Checks** (`Suggested.lean` examples and README sanity statements): the identity and every
orientation-preserving isometry have `K_O = K_I = 1`; `z ↦ z²` on `ℝ² = ℂ` is
`1`-quasiregular and not injective; the winding map `(r, θ, z) ↦ (r, 2θ, z)` on `ℝ³` has
singular values `1, 2, 1`, so `K_O = 4` and `K_I = 2`, attaining `K_O = K_I^{n−1}`; the radial
stretching `x ↦ |x|^{a−1} x` on `ℝⁿ`, `a > 0`, lies in `W^{1,n}_loc` and has `K_O = a^{n−1}`,
`K_I = a` for `a ≥ 1` and `K_O = 1/a`, `K_I = a^{1−n}` for `a < 1`; the fold
`(x_1, …, x_n) ↦ (|x_1|, x_2, …, x_n)` has `‖Df‖ⁿ = |J_f| = 1` but `J_f < 0` on a half-space,
so it is not quasiregular; a projection of rank `n − 1` satisfies the inner inequality with
`K = 1` yet is not quasiregular (MartioRickmanVaisala1969 lines 423–425); the constant map
has `K_O = 1`; the covering `ℝⁿ → Tⁿ` has `J_f = 1`; dimension `n = 1` is excluded.

## Suppliers

- **SobolevMapsBetweenManifolds** (`TARGET-SobolevMapsBetweenManifolds`, #6021, a target, not
  yet designed): the whole carrier, `W^{1,p}_loc(M, N)` for continuous maps, chart
  independence, the weak differential `Df`, the operator norm `‖Df‖`, the Jacobian `J_f` and
  the chart formula, `f^* vol_N = J_f vol_M`, Hadamard's inequality, the Euclidean chain
  rules (a)–(c), the embedding criterion (c) and the Euclidean compatibility (d). It must
  precede this roadmap in the merge order.
- **PDE** on main, Lane A (items 1, 2, 4): weak derivatives, `W^{k,p}`, Morrey's embedding
  and the `p = n` borderline; Tau Ceti `TauCeti.W1p` and the `Wkp` files under
  `TauCeti/Analysis/Sobolev/` for the Euclidean statements T6 (continuity) and T7.
- **DifferentialGeometry** on main: Layer 2 (orientations, `Manifold.Orientation`,
  orientation-preserving maps), Layer 5 (integration of top forms), Layers 6–8 (de Rham
  cohomology as a graded-commutative algebra, Mayer–Vietoris, the de Rham theorem) for T8–T11,
  Layer 10 (degree, used in the README's discussion of sense-preservation), Layer 12.4
  (`riemannianVolumeForm`, `TauCeti.riemannianVolume`, `chartVolumeDensity`).
- **RiemannianGeometry** on main: conventions (Mathlib `IsRiemannianManifold`, Tau Ceti
  `riemannianVolume`), R4 for complete manifolds and the flat torus, metric comparison.
- **GeometricMeasureTheory** on main, G2 (area formula for Lipschitz maps) for the README's
  proof sketches of T4 and T6 and for the null-set transport under quasiregular maps.
- **Mathlib**: finite-dimensional linear algebra (singular values through
  `LinearMap.det`, operator norms, `Orientation` on inner product spaces), the manifold
  instances on `Circle` and products for `Tⁿ`.

## Consumers

- **FourManifolds** (PR #936): the classification of closed simply connected quasiregularly
  elliptic 4-manifolds (HeikkilaPankka2025 Corollary 1.2, lines 94–96) combines T10 with the
  homeomorphism classification by intersection form; the Piergallini–Zuddas branched
  coverings that supply the converse are outside both roadmaps today.
- **SurfaceTopology** and **ConformalMappingPartII** (PR #1407) for the dimension-two
  comparison: closed quasiregularly elliptic surfaces are `S²` and `T²`
  (HeikkilaPankka2025 lines 108–111), and a Stoïlow-type factorisation is a Part II
  candidate.
- **TeichmullerGeometry** (PR #1169) §7.4 is a sibling, not a consumer: its quasiconformal
  maps are planar and defined through the Beltrami equation; a later roadmap should prove
  that a planar quasiconformal homeomorphism is a quasiregular homeomorphism in the sense of
  this roadmap.
- Later roadmaps on geometric function theory: `n`-dimensional quasiconformal mappings and
  the modulus method, value distribution and Rickman's Picard theorem (Rickman1993 Ch. VI),
  uniformly quasiregular dynamics, Liouville's theorem in dimension `n ≥ 3`, the
  Bonk–Heinonen growth bound (HeikkilaPankka2025 Theorem 2.2, lines 284–294) and the
  Gromov-question literature (Gromov1999 Ch. 2).

## Sources

Recorded in `packages/QuasiregularMaps/sources.toml`.

- `HeikkilaPankka2025` (arXiv:2302.11440v2, open repository, certified): the definition of
  quasiregular maps between manifolds and of quasiregular ellipticity (lines 20–27),
  Theorem 1.1 (lines 18–19), `K`-quasiregular ellipticity and Proposition 2.1 (lines
  271–279), Theorem 2.2 citing Bonk–Heinonen Theorem 1.11 (lines 284–294), the
  four-manifold classification (lines 73–96), Appendix B on the quasiregularity of
  non-degenerate orientation-preserving piecewise linear maps (lines 1234–1251), a possible
  extra Check for a later version.
- `Prywes2019` (arXiv:1806.05306v1, open repository, certified): the Euclidean-domain
  definition (lines 22–27), Theorem 1.1 (lines 28–30), Corollary 1.2 (lines 41–53),
  Bonk–Heinonen's `K`-dependent bound and Proposition 1.4 as cited (lines 33–34, 64–65),
  Jacobian integrability remarks (lines 130–135).
- `MartioRickmanVaisala1969` (Annales Academiae Scientiarum Fennicae A I 448, the journal's
  open archive under CC BY 4.0, certified; the recognised text of the scan is noisy):
  `ACL` and `ACLⁿ` (Definition 2.16, lines 332–340), quasiregular maps, outer and inner
  dilatation and the maximal dilatation (Definition 2.20 and (2.21)–(2.22), lines 409–419),
  the comparison with Reshetnyak's and Callender's normalisations (lines 426–436), the
  inequalities (2.25) (line 438), Lemma 2.26 (Reshetnyak's theorem, lines 440–444) and
  Lemma 2.27 (lines 445–450).
- `BonkHeinonen2001` (Acta Math. 186, DOI 10.1007/BF02401840; uncertified: the open copy on
  Project Euclid answered the fetcher with a bot-protection page): Theorem 1.1 (the
  `K`-dependent Betti bound), Proposition 1.4 (`1`-quasiregularly elliptic closed manifolds
  are quotients of the sphere or the torus, as cited by Prywes2019 lines 64–65),
  Theorem 1.11 (the growth bound, as cited by HeikkilaPankka2025 lines 284–294). The design
  job should obtain the text (Acta Mathematica is open on Project Euclid; a local copy or a
  different fetch route is needed).
- `Rickman1993` (Springer Ergebnisse 26; paywalled, uncertified): Ch. I for `ACLⁿ`, the
  definitions, inner and outer dilatation, composition and Reshetnyak's theorem; Ch. VI for
  value distribution (consumers only).
- `Reshetnyak1989` (AMS Transl. Math. Monogr. 73; paywalled, uncertified): Ch. II for
  openness, discreteness and the continuity of mappings with bounded distortion.
- `Vaisala1971` (Springer LNM 229; paywalled, uncertified): Ch. 3 for the `ACL` and
  Sobolev characterisations.
- `IwaniecMartin2001` (OUP; paywalled, uncertified): Ch. 6 (mappings of finite distortion)
  and Ch. 16 (quasiregular mappings), placement only.
- `Gromov1981` (Ann. of Math. Stud. 97, p. 200; paywalled, uncertified): the question on
  simply connected manifolds, as cited by Prywes2019 and HeikkilaPankka2025.
- `Gromov1999` (Birkhäuser; paywalled, uncertified): Ch. 2, the question in book form.

## Risks

- **The carrier does not exist yet.** SobolevMapsBetweenManifolds is an open target with no
  design; every definition here depends on its `W^{1,n}_loc(M, N)`, `Df`, `‖Df‖` and `J_f`.
  The design must consume it by name and section and must not re-plan it; if the two designs
  run concurrently, the interface (chartwise definition for continuous maps, Jacobian relative
  to `vol_M` and `vol_N`, Hadamard's inequality, the three Euclidean chain rules, the
  embedding criterion) must be fixed between them. The merge order must place
  SobolevMapsBetweenManifolds before QuasiregularMaps.
- **`Suggested.lean` against the pinned libraries.** Neither Mathlib nor Tau Ceti has Sobolev
  maps into manifolds, a manifold orientation carrier (Tau Ceti has
  `TauCeti.Orientable` through an oriented atlas, not DifferentialGeometry's
  `Manifold.Orientation`), or a Riemannian volume form; Tau Ceti has `W1p` on open subsets of a
  Euclidean space, `riemannianVolume` and `chartVolumeDensity`. The acceptance file can state
  T1, T2, T6 (both parts) and T7 fully on Euclidean domains with `ℝⁿ` targets (componentwise
  `W1p`, `LinearMap.det`), and the torus statement for `ℝⁿ → Tⁿ`. For T8–T10 the design must
  choose a simple statement of "quasiregular map `ℝⁿ → N`" that the pinned libraries can
  express, for example for `N` a closed embedded submanifold of a Euclidean space with the
  induced metric and orientation, reading `Df` off the weak derivative of the embedded map;
  otherwise these three remain README targets until the supplier lands. `Suggested.lean`
  must not define the manifold Sobolev class itself.
- **De Rham inputs.** T11 needs `dim H²_dR(S² × S²) = 2` and additivity under connected sums;
  DifferentialGeometry has Mayer–Vietoris and `H^*(Sⁿ)` but no Künneth theorem. The design
  should either route through the de Rham theorem (Layer 8) and singular cohomology of
  products, or state T11 conditionally on a product computation it names as an import.
- **Reshetnyak's theorem is far above the library.** T4, T5 (transfer) and T6 are stated
  only; their proofs need the modulus method or the nonlinear potential theory of
  `𝒜`-harmonic functions (Rickman1993 Ch. I–II, Reshetnyak1989 Ch. II), neither planned
  anywhere. The README must present T3's `C¹`-factor cases as the proved content and not
  promise the general composition.
- **Sources.** Rickman, Reshetnyak, Väisälä, Iwaniec–Martin and both Gromov texts are
  paywalled and cited by locator only; theorem numbers inside them are not verified here, so
  the design must cite chapters, or obtain the texts. Bonk–Heinonen is open on Project Euclid
  but the fetcher was blocked by the host's bot protection; its locators are taken from the
  two certified papers that cite it. The scan of MartioRickmanVaisala1969 is image-only and
  its recognised text is noisy; locators are by numbered definition and lemma.
- **Conventions.** The direction of the comparison between `K_O` and `K_I` (`n − 1` on
  either side), the normalisation `‖Df‖ⁿ ≤ K J_f` (not the Hilbert–Schmidt normalisation
  of Reshetnyak and Callender, MartioRickmanVaisala1969 lines 426–436), and the convention
  `0/0 = 0` in `K_O` must be fixed once in the README and in `Suggested.lean`.
