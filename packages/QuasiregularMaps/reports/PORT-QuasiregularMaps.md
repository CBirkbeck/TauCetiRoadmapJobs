# Port report: QuasiregularMaps

Branch `roadmap/quasiregular-maps`, head `64a7eb8` (`64a7eb804e666e390197fef9747d4528cb482e17`),
one commit on `9897cdb`: `QuasiregularMaps: roadmap (README, Suggested.lean, metadata)`. It adds
`TauCetiRoadmap/QuasiregularMaps/{README.md,Suggested.lean,metadata.toml}` and touches nothing
else.

## Build

`lake build TauCetiRoadmap.QuasiregularMaps.Suggested`:

    Build completed successfully (18246 jobs).

Warnings: 5, all `declaration uses 'sorry'` (lines 90, 106, 159, 175, 189 of
`TauCetiRoadmap/QuasiregularMaps/Suggested.lean`); no other output.

## Push gate

    gate QuasiregularMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: UPWARD: QuasiregularMaps (#288) -> SobolevMapsBetweenManifolds (#402) at README lines [347, 518, 547, 593, 605, 644]

Every check passes except `depcheck`. During this job the intake inserted SobolevMapsBetweenManifolds
into the merge order the gate reads, at #402, after this roadmap (#288). The push gate has no
`--movable` mode, so it reports the pending move as UPWARD. The dependency check of the brief,
with `--movable`, reports it as a move and finds no problem (both runs below). The gate passes
once the worker moves QuasiregularMaps right after SobolevMapsBetweenManifolds when it submits.
I did not edit the merge order. The earlier gate run, before the insertion, had `depcheck=0`.

## Dependency check

The command of the brief (`--order` the board's `merge-order/ORDER.txt`, which does not yet list
SobolevMapsBetweenManifolds):

    depcheck: 224 roadmaps, 2037 edges, 0 problem(s)

The same check against the order the gate reads (no `--order`):

    moved: QuasiregularMaps moved in the merge order from #288 to #402, right after its last supplier SobolevMapsBetweenManifolds; checked as moved (the worker moves it there when it submits)
    depcheck: 224 roadmaps, 2038 edges, 0 problem(s)

No UPWARD or CYCLE line in either run.

## Draft pull request body

This roadmap builds quasiregular maps between oriented Riemannian manifolds of one dimension `n`,
on the continuous Sobolev class `W^{1,n}_loc(M, N)` of SobolevMapsBetweenManifolds. It starts
from the linear algebra of distortion: the minimal stretch and the outer, inner and
Hilbert–Schmidt distortion of a linear map, on Mathlib's singular values. It then defines
`K`-quasiregular maps by `‖Df‖ⁿ ≤ K J_f` and their outer, inner, maximal and Hilbert–Schmidt
distortions, and proves the sharp Martio–Rickman–Väisälä comparison `K_I ≤ K_O^{n−1}`,
`K_O ≤ K_I^{n−1}`, invariance under comparable metrics, orientation reversal and `C¹` factors, and
the `C¹`, locally Lipschitz, Euclidean and planar (Beltrami) descriptions. On Euclidean domains it
proves that a continuous map is `ACL^p` if and only if it lies in `W^{1,p}_loc`, so the Sobolev
definition agrees with Definition 2.20 of Martio, Rickman and Väisälä. It shows that
non-degenerate orientation-preserving simplicial maps between `C¹`-triangulated manifolds are
quasiregular, and develops quasiregularly elliptic manifolds: independence of the orientation and,
for closed manifolds, of the metric, transfer along local diffeomorphisms, the orientation of an
orbit space, every closed orientable flat manifold, and branched coverings by flat tori. It is
the foundation that Reshetnyak's theorem and the cohomological bounds of Bonk–Heinonen, Prywes and
Heikkilä–Pankka (QuasiregularMaps, Part II and Part III) build on. `Suggested.lean` states, against
the pins, the Euclidean form of the distortion comparison, the `ACL^p` characterisation and the
agreement with Martio–Rickman–Väisälä; the manifold headlines need the Sobolev class between
manifolds, which neither pin has.

## Dependencies that are not on main

- **TeichmullerGeometry** (open roadmap pull request, new folder, earlier in the merge order,
  #287): §7.4 (weak Wirtinger derivatives, planar quasiconformal maps), consumed in §2.10. Read
  at its head `417bd27`.
- **SobolevMapsBetweenManifolds**: not a pull request yet. Its design is accepted on the board and
  the merge order the gate reads lists it at #402. Every manifold statement of Layers 1–4 and 7
  is stated on its class, through six declared contracts (`gap:sobolev-maps-class`,
  `-weak-differential`, `-norm`, `-jacobian`, `-chain-rules`, `-euclidean`), the review's
  conditional gaps. This pull request cannot merge before it.

## What moved from the Lean file to the README

- The proved `example` that the identity of a non-zero Euclidean space is `1`-quasiregular on every
  open set was deleted: it restated the fourth Check of §2.9 (the README keeps the Check). This
  applies the red-team note F02.
- Nothing else. The ten declarations keep their statements: five definitions with real bodies
  on native carriers (`minimalStretch`, `IsQuasiregularOn`, `formalDeriv`, `IsACLOn` and
  `IsACLpOn`) and five headline theorems. The `minimalStretch` docstring
  now states its value `0` on `V = 0`, where there is no unit vector.
- No headline statable at the pins is missing: the five manifold headlines (comparison between
  manifolds, simplicial maps, independence of metric and orientation, flat manifolds, torus
  branched coverings) all need `W^{1,n}_loc(M, N)`, which neither pin has (Tau Ceti's Sobolev
  theory is Euclidean; its manifold Sobolev inequality,
  `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_add`, is for scalar `C¹` functions);
  the docstring says so.

## Supplier replacements and duplication removals

- **SobolevMapsBetweenManifolds citations.** The package cited the board target's ids (`T1`–`T6`,
  "Scope item k"), which will not exist in any roadmap. They now cite the sections of its accepted
  design (`packages/SobolevMapsBetweenManifolds/design/README.md`), whose Downstream consumers maps
  each of this roadmap's requirements to them: the class §4.2, §4.4, §4.5; weak differential and
  null sets §4.3, §3.1; norm §5.1–§5.3; Jacobian §6.1–§6.3; chain rules §4.6 with §3.3; Euclidean
  case §1.2, §7.1. Each section was read and matches the contract that cites it. The six gap
  contracts are kept word for word.
- **Orientation descent moved down.** The package asked DifferentialGeometry, which is on main,
  to add a section beyond its Layer 2 (`gap:orientation-descent`). No roadmap on main or in an
  open pull request plans it: DifferentialGeometry 2.4 is the orientation double cover;
  RiemannianGeometry R4 item 7 proves orientability of `ℝPⁿ` only; Orbifolds orients orbifold
  presentations and coarse local systems, not the quotient manifold. Asking a roadmap on main to
  grow a section re-plans it, so the target is now §7.5 here, "Orientations of orbit spaces": the
  unique orientation of `X/Γ` for which the orbit projection is orientation preserving, for a
  free, properly discontinuous, orientation-preserving `C¹` action, with its converse and the
  orientability criterion for connected `X`. Its route uses pinned declarations only
  (`TauCeti.mfderiv_quotientMk_smul_apply`, `IsLocalDiffeomorphAt.eventually_mapOrientation_eq`,
  `TauCeti.VectorBundleOrientation.ofEventually`,
  `TauCeti.Manifold.Orientation.ofVectorBundleOrientation`, `TauCeti.Manifold.Orientation.ext`). The
  former §7.5 and §7.6 are now §7.6 and §7.7, here and in the Lean docstring. The review's
  conditional gaps drop to the six Sobolev ones.
- **Restatements of pinned material.** None found. No pinned declaration states any target
  (minimal stretch, distortion quotients, `ACL`, the `ACL^p` theorem, quasiregularity, the
  orientation of an orbit space). `scratch/library-matches.md` gave only unrelated hits
  (`IsQuasiregular` of quasispectra, `BoxIntegral.Box.distortion`).
- **Duplication sweep** (by object, over main and the 429 open heads): no other owner of
  quasiregular maps, distortion quotients, `ACL`, quasiregular ellipticity or simplicial maps
  being quasiregular. Kept variants, each now differentiated in one clause under Scope and
  ownership: PseudoholomorphicCurveAnalysis §4.1 (main) has `W^{k,p}_loc(Σ, M)` only for `kp > 2`,
  which misses `p = n = 2`; GeometricTopology 11.3 (main) owns Cairns–Whitehead, while §6.1
  proves measure-theoretic properties of one given `C¹` triangulation; RiemannianGeometry R4
  item 7 (`ℝPⁿ`) and Orbifolds (presentations) as above. Nothing was deleted.
- **Ownership against open pull requests**: checked with `roadmaps grep` over every open head and
  the sibling checkout of TeichmullerGeometry. Cited ids against open revisions of suppliers:
  GeometricTopology 11.1 and 11.3 survive at the head of #1797; DifferentialGeometry 2.1, 2.2,
  12.1, 12.4 and RiemannianGeometry R4 item 7 survive at the head of #1187. Three stale drafts
  (#334 DifferentialGeometry, #1614 PDE, #1791 GeometricTopology) carry much older README
  structures without these numbered sections; the overlap tool, which reads the change each pull
  request makes, listed no dropped id for the package, and `roadmaps overlaps QuasiregularMaps`
  cannot run until the roadmap is in a pull request. A lead for the worker, not a finding.

## Checks of every name

A scratch copy of `Suggested.lean` with the Tau Ceti modules that have built objects imported
and `#check @name` for the ten declarations and 92 cited library names, built once with the
lake command of the brief and then restored, elaborated with no error. The ten elaborated
signatures are identical to the package's (`scratch/signatures.md`) and each matches its README
statement; no section binder was lost and nothing changed. The twelve cited names whose modules
have no built object (`frobenius_apply_eq_sqrt_sum_sq_singularValues`,
`isOpenPosMeasure_riemannianVolume`, `hasWeakFDerivOn_iff_forall_isCompact_closure`,
`hasWeakFDerivOn_of_hasFDerivAt_off_countable`, the two `HasWeakLineDerivOn` lemmas, `W1p`,
`W1p.exists_value_ae_eq_const_of_gradient_eq_zero`,
`DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`, `cantorFunction`,
`not_absolutelyContinuousOnInterval_cantorFunction`, `PreAbstractSimplicialComplex.IsPure`) were
found at the pin with their namespaces by reading the files. The pins have not moved since the
package review (`lake-manifest.json` last changed on 2026-11-05).

`roadmaps resolve` on the new README: one lead, `SobolevMapsBetweenManifolds §3.1`, "no roadmap
on main or in an open pull request"; that is the design-stage supplier above. No Lean name is
unresolved.

## Fixes from the reviewer's read

1. Conventions, dimension `0`: "every map would be quasiregular (`‖A‖⁰ = 1 = J(A)`)" is false
   when the two orientations at `x` and `f(x)` differ, where `J(A) = −1` (the supplier's own §6.1
   Check). Now: `J(A) = ±1` according as they agree, so quasiregularity would only compare signs.
2. §2.9 Check and the Worked example on radial stretches: the formulas `K_O = a^{n−1}`, `K_I = a`
   (`a ≥ 1`) and `K_O = 1/a` (`a < 1`) fail for `n = 1`, where both distortions are `1`. Restricted
   to `n ≥ 2`, with the `n = 1` value stated (red-team note F01).
3. Layer 2 Examples: "the radial stretches realise every value of `K_O ≥ 1`" holds only for
   `n ≥ 2`; now says so.
4. Mathlib contract: `LinearMap.det` is in `Mathlib/LinearAlgebra/Determinant.lean`, not in the
   orientation file (red-team note F03).
5. `minimalStretch` docstring: "the minimum of `|Av|` over unit vectors" has no meaning for
   `V = 0`; the value `0` there is now stated.
6. §7.6: "it carries one when every element of `Γ` preserves the orientation" is now the
   equivalence that §7.5 proves, with its two orientations named.
7. §2.9 `*Needs:*`: the garbled "agreement with §2.1, §2.1 and …" now reads "the definition of
   §2.1 and SobolevMapsBetweenManifolds §7.1".
8. Downstream consumers: Part II and Part III are now labelled as separate roadmaps whose lists
   describe them and are not targets here; Scope's "are not built" for mappings of finite
   distortion now says they lie outside this roadmap and its two sequels.
9. Scope: SobolevMapsBetweenManifolds is now cited by section; Layer 7's "How to read" sentence
   and Dependencies name §7.5's inputs. `Lee2012` (Ch. 15) is added to References for §7.5.

## Adversarial pass

Values computed by hand and by a pure-Python recomputation of every numerical Check
(`scratch/tools/adversarial.py`, output in `scratch/adversarial-output.txt`), including 4000
random matrices per inequality. `q_O`, `q_I`, `q_S` as in §1.2 and §1.4.

| statement | instances | values | result, change |
| --- | --- | --- | --- |
| Conv. dimension | `n = 0`, orientations equal / opposite; `n = 1`, `max(0,t)` | `‖A‖⁰ = 1`, `J = +1` / `−1`; `Df ∈ {0, 1}`, `‖Df‖ = J` | claim false for opposite signs: fixed (1) |
| Conv. normalisation | `diag(2,1)` | `‖A‖² = 4`, `J = 2`, least `K = 2`; HS `q_S = 5/4` | holds |
| Conv. quotients | `R = diag(−1,1)`; `0` | `q_O(R) = ∞`, `q_I(R) = 0`, naive `−1`; `q_O(0) = 0` | holds |
| Conv. two meanings | radial `a = 1/2` in `ℝ³` | `K_O = 2`, `K_I = 4` | holds |
| Conv. orientation sign | `id : (ℝ²,std) → (ℝ²,−std)`; reflection to `−std` | `J = −1`; `J = −det R = +1` | holds |
| Conv. exponents | `diag(2,1,1)`, `diag(1,1,1/2)` | `q_O = 4, q_I = 2`; `q_O = 2, q_I = 4` | holds |
| §1.1 `ℓ` | `diag(3,1/2)`; shear; projection; `n = 0, 1`; index `0`/`n` | `σ = 3, 1/2`, `ℓ‖A⁻¹‖ = 1`; `ℓ = 0.618034 = (√5−1)/2`, basis-min model `1`; `ℓ = 0`; `n = 0`: value `0`; `ℓ(a·id) = |a|`; index `0` gives `3`, index `2` gives `0` | holds; docstring for `V = 0` added (5) |
| §1.2 `q_O`, `q_I`, API | `diag(2,1)`; `R`; `R∘R`; `−id`, `n = 2, 3`; 4000 random `A, B` with `J > 0`, `n = 2..4`; `A = 0`, `B` with `J ≤ 0` | `2, 2`; `∞, 0`; `q_I(id) = 1 > 0 = q_I(R)²`; `1`, `∞`; max `q_O(BA)/(q_O(B)q_O(A)) = 1`, max `q_I` ratio `1`; `0 ≤ 0·∞ = 0` | holds; LSC of `q_O` checked at `0`, at `J ≤ 0`, at `J > 0` |
| §1.3 iffs, (2.25) | `K = −1` with `R`; 4000 random `A`, `n = 1..4`; `diag(2,1,1)`, `diag(1,1,1/2)`, `diag(3,2,1)`; projection | `1 ≤ (−1)(−1)` true while `q_O = ∞`; max `q_I/q_O^{n−1} = 1`, max `q_O/q_I^{n−1} = 1`; `4 = 2²`; `4 = 2²`; `6 < 81/4`, `9/2 < 36`; `q_O = ∞ > 0 = q_I` | holds; equality cases `σ₁ = … = σ_{n−1}` / `σ₂ = … = σₙ` rederived |
| §1.4 `q_S` | `id₃`; `diag(2,1)`; `diag(1,ε)`, `diag(1,ε,ε)`, `ε = .5, .1, .01`; 4000 random | `1`; `5/4 ≤ 2 ≤ 5/2`; ratios `1.6, 1.9802, 1.9998` `= 2/(1+ε²)` and `2.828, 5.044, 5.195` `= 3^{3/2}/(1+2ε²)^{3/2}`; max `q_O/(n^{n/2}q_S) = 1` (only `n = 1`), min `q_O/q_S = 1` | holds |
| §1.5 planar | `a = 1, b = 1/2`; conjugation; `a = 2i`; `z + z̄/3`; `A = 0` | `‖A‖ = 1.5`, `ℓ = .5`, `J = .75`, `q_O = 3`; `J = −1`, `∞`; `1`; `2`; `0 ≤ (1+k)/(1−k)` and `0 ≤ k·0` | holds |
| §2.1 definition | identity; `(M,o) → (M,−o)` with `K = −1`; fold; `max(0,t)`; `0 ≤ K < 1` | `1 ≤ 1`; `1 ≤ 1` but `1 ≤ K` fails; `J_F = sign x₁`, `|J|` accepts; `1`-QR, non-constant; Hadamard forces `Df = 0` | holds |
| §2.2 `K_O` | constant; `z²`; radial `ℝ³` `a = 2, 1/2`; fold | `max(1,0) = 1`; `q_O = 1` off `0`; `4`, `2`; `∞`, naive `1` | holds |
| §2.3 attainment | identity; fold; `M = ∅` | `[1,∞)`; `∅`; `[1,∞)` | holds |
| §2.4 Jacobian | `z²`; projection `n ≥ 2`; radial | `J = 4|z|²`; `J = 0`, `DP ≠ 0`; `∫₀¹ r^{na−1} dr < ∞` iff `a > 0` | holds |
| §2.5 locality | shear `(x, y + x³/3)` at `x = 0, .7, 2`; `M = ∅` | `‖Df‖ = 1, 1.27458, 4.23607` `= (x²+√(x⁴+4))/2`; `max(1, sup ∅ = 0) = 1` | holds |
| §2.6 constancy | two balls; Cantor `(c(x₁),0)`; `max(0,t)` | disconnected; not `ACL`; `J = 1` on `(0,∞)`, `0` on `(−∞,0)` | holds |
| §2.7 `C¹` | `(x³,y)` at `x = 1, .3, .1`; `−id`; `z²` | `q_O = 3, 3.704, 33.33 = max(3x²,1)²/(3x²)`; `J = (−1)ⁿ`; `1`-QR | holds |
| §2.8 Lipschitz | winding map at `(1,2,.3)`; `|x|^{1/2}` on `ℝ` | `σ = 2,1,1`, `J = 2`, `q_O = 4`, `q_I = 2`; `L^p` iff `p < 2` | holds |
| §2.9 `IsQuasiregularOn` | radial `a = 2, 1/2`, `n = 1, 2, 3`; fold; `n = 0`; `Ω = ∅` | `n = 2`: `q_O = q_I = 2`; `n = 3`: `4, 2` / `2, 4`; `n = 1`: `1, 1` against the Check's `a`, `1/a` | Check false for `n = 1`: fixed (2); `det`-based condition rejects fold; `n = 0`: `1 ≤ K·1` |
| §2.10 Beltrami | `z + a z̄`; `z̄`; holomorphic; `K = 2, 3` | `(|a|+|b|)² ≤ K(|a|²−|b|²)` iff `|b| ≤ k|a|`; `k = 1/3, 1/2`; `K_O = (1+k₀)/(1−k₀)` | holds |
| §3.1 `K_I`, `K` | radial `ℝ³`; projection; `n = 2` | `K = 4` both; `K_I(P) = ∞`; `K_I = K_O` | holds |
| §3.2 manifold | winding; `diag(3,2,1)`; radial `a = s, 1/s` | `4 = 2²`; strict; `K_I = s, K_O = s^{n−1}` and reverse | holds |
| `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow` | `det > 0`; `det ≤ 0`; radial `a = 1/2`, `n = 3`, `K = 2`, `x = (.37,−.5,.8)`; `n = 0, 1`; exponent `K` in place of `K^{n−1}` | `q_I ≤ (σ₁/σₙ)^{n−1} ≤ q_O^{n−1}`; `Du = 0`, `0 ≤ 0`; `det = 0.490144`, `K²ℓ³ = 0.490144` (equality); `1 ≤ 1`; `det = ℓ`; `Kℓ³ = 0.245` `<` det | holds, sharp, no change |
| `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` | `det > 0`; `det ≤ 0`; radial `a = 2`, `K = 2`; projection, `K = 1`; constant with `K = 1/2`; `n = 0` | `q_O ≤ q_I^{n−1}`; `Du = 0` from `hf`; `det = 2.08124 = Kℓ³`, `‖Du‖³ = 8.32496 = 4·det`; `hf` fails (`1 ≤ K'·0`); `hK` used; `1 ≤ 1` | holds, both hypotheses needed |
| §3.3 projection | `n ≥ 2`; `n = 1` | `J = 0 = ℓⁿ`, `‖DP‖ = 1`; `P = 0` | holds |
| §3.4 `K_S` | identity; `diag(2,1)`; `diag(1,ε)`; winding; radial rows | `1`; `5/4`; `2/(1+ε²)`; `√2 = 1.41421`; `n = 2`: `1.25` both `a`; `n = 3`, `a = 1/2`: `1.29904` | holds |
| §4.1 metrics | `g'_N = c²g_N`; `T²` with `dx²+4dy²`; `dx²+e^{2x}dy²`; conformal; 3000 random Gram pairs | factor `1`; `‖dπ‖' = 2`, `ρ = 2`, `J' = 2`, `q_O' = 2 ≤ 4`; `q'_O = e^{|x|}`; `q'_O = 1`; max `q'_O/((bβ/(aα))ⁿ q_O) = 0.661` | holds |
| §4.2 orientations | `(M,o) → (M,−o)`; reflection; QR for `(o_M, ±o_N)` | `J = −1`; `+1`; `J = 0` a.e. | holds |
| §4.3 precomposition | `π : ℝⁿ → Tⁿ`; shear `θ`; `θ = R` | `K_π = 1`; `K_θ = ∞`; `J = −1` | holds |
| §4.4 postcomposition | `z⁴`; radial `a = 2` after `a = 1/2` at `x₀` | `1`; result `(.37, −.5, .8) = x₀`, `K_O = 1 ≤ 8` | holds |
| `formalDeriv`, `IsACLOn`, `IsACLpOn` (§5.1) | `(x₂, 0)`; `|x₁|`; Cantor; `|x|^{1/2}`, `p = 2, 3.9, 4, 6`; indicator of `{0}`; `n = 0`; `p = 0`; segment of `[0,1]²` through `(1/2,1/2)` | columns `[[0,1],[0,0]]`; `(sign x₁, 0)` off a null line; not AC on `[0,1]`; `1 − p/2 > −1`: true, true, false, false; discontinuous; boxes vacuous; `MemLp` = measurability; `t ↦ u(1/2,t)` versus the unshifted segment to `(1/2,3/2)` | holds |
| `isACLpOn_iff_exists_hasWeakFDerivOn` | `|x|^{1/2}`; `C¹`; Cantor; strip example at `p = 1/2`; `n = 0`; `Ω = ∅` | agree for each `p`; both; neither; strips disjoint for `k = 1..8` (`2^{−(k+1)} > 8^{−k} + 8^{−(k+1)}`), `Σ 8^k·8^{−k} = ∞` against `Σ 8^{−k/2} < ∞`: `ACL^{1/2}`, no weak derivative; both trivial | holds, `1 ≤ p` used |
| `ae_hasLineDerivAt_of_hasWeakFDerivOn` | `|x₁|`; Cantor; measurability | `sign x₁` off the null line; vacuous; failure set Borel for continuous `u`, Fubini | holds |
| `isQuasiregularOn_iff_isACLpOn` | radial `a = 1/2`, `ℝ³`; identity; `K = 0` constant; `max(0,t)`; `n = 0` | `2`-QR here, `4` in MRV's sense; `1`; `0 ≤ 0·0` but `1 ≤ 0` fails; `f' ∈ {0,1}`; both sides `1 ≤ K·1` | holds, `1 ≤ K` used |
| §6.1 triangulations | triangle on `S¹`; tetrahedron; `t²`; infinite star | `|p(t)|² = 1, .4375, .25, 1` at `t = 0, 1/4, 1/2, 1` (in `[1/4, 1]`); null skeleta; not bi-Lipschitz; not locally finite | holds |
| §6.2–§6.4 simplicial | identity; fold; collapse; `T²` doubling; `h`-stretch `k = 1, 2, 5` | `K_p = 1`; `J < 0` on `x₁ < 0`; `J = 0`; `q_O = 2`; `q_O = 1, 2, 5` | holds |
| Worked example, eight-sector | `L = [[1,−1],[0,√2]]` | `L e₁ = e₁`, `L(1,1)/√2 = e₂`, `det = 1.41421`, `‖L‖² = 3.41421 = 2+√2`, `q_O = q_I = 2.41421 = 1+√2` | holds |
| §7.1–§7.4 ellipticity | identity; ball domain; `n = 1`; `f ∘ R`; `T²` with `dx²+4dy²`; doubling; `ℂ∖{0}` | `1`; every `N` elliptic from a ball; `ℝ`, `ℝ/ℤ`; `J = −(J_f·det R) = J_f`; bound `4`, actual `1`; `K_q = 2`; `exp` | holds |
| §7.5 orbit-space orientation (new) | trivial `Γ`; `ℤⁿ` on `ℝⁿ`; `ℤ` on `ℝ²`, `k·(x,y) = (x+k, (−1)ᵏy)`; antipodal on `Sⁿ`, `n = 1..4`; uniqueness | `π` a diffeomorphism; `dγ = id`; `det diag(1,−1) = −1`, open Möbius band not orientable; `det(−I_{n+1}) = 1, −1, 1, −1`, `ℝPⁿ` orientable iff `n` odd (agrees with RiemannianGeometry R4 item 7); two orientations with `π` preserving have equal tangent orientations at every point | new target, holds |
| §7.6 flat manifolds | `Tⁿ`; `exp`; Klein bottle; rotation by `π` | `J_π = 1`; conformal; glide reflections reverse; fixed point | "carries one when" made an equivalence (6) |
| §7.7 torus coverings | `p = id`; doubling `∘ π`; `ℝ²` grid | `K = 1`; `2`; `1` with non-compact `N` | holds |

## Unresolved

- The push gate's `depcheck` stays at 1 until the worker moves QuasiregularMaps right after
  SobolevMapsBetweenManifolds (#402) in the merge order, as the `--movable` check reports.
- SobolevMapsBetweenManifolds is cited by the section numbers of its accepted design. When it is
  ported, its README's numbering should be compared with §4.2–§4.6, §3.1, §3.3, §5.1–§5.3,
  §6.1–§6.3, §1.2 and §7.1 as cited here.
- `packages/QuasiregularMaps/sources.toml` has no entry for `Lee2012`, now cited for §7.5 by its
  chapter (Ch. 15, uncertified, paywalled). The package's SobolevMapsBetweenManifolds manifest
  carries the same source under the same id.
- No passage in the data read during this job asked for anything outside the job.


Pull request: #2134 (roadmap/quasiregular-maps at 64a7eb8)
