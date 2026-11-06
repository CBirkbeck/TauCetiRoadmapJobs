# DESIGN-QuasiregularMaps: design report

Deliverables: `packages/QuasiregularMaps/design/README.md`, `packages/QuasiregularMaps/design/plan.json`,
`packages/QuasiregularMaps/sources.toml`, this report. Baseline pins: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`
(the pins of `lake-manifest.json` in the content checkout). Every library declaration named in
the README was located in its file at these pins. The resolver could not check names outside
TauCetiRoadmap on this host, so each one was grepped in the pinned sources with its namespace.
That check corrected one family of names: `essSup`, `ae_le_essSup` and `essSup_le_of_ae_le` are in
the root namespace at the pin, not under `MeasureTheory`.

## What the design covers

Seven layers, 36 targets (10 definitions, 25 theorems, 1 example), 7 gaps:

1. Linear distortion: the minimal stretch; the outer, inner and Hilbert–Schmidt quotients; the
   characterisation and comparison inequalities with equality cases; submultiplicativity; the
   planar case.
2. `K`-quasiregular maps on the Sobolev class of SobolevMapsBetweenManifolds. Covers the outer
   distortion and its attainment, the sign and integrability of the Jacobian, restriction and
   locality, constancy, and the `C¹`, locally Lipschitz, Euclidean and Beltrami descriptions.
3. Inner, maximal and Hilbert–Schmidt distortion of maps; MartioRickmanVaisala1969 (2.24) and
   (2.25), with optimality; the projection warning.
4. Invariance under comparable and conformal metrics, orientation reversal, and `C¹` factors.
5. `ACL^p` maps; `ACL^p = W^{1,p}_loc` for continuous maps; agreement with Definition 2.20.
6. Facts about `C¹` smooth triangulations; simplicial maps; piecewise `C¹` maps are locally
   Lipschitz; non-degenerate orientation-preserving simplicial maps are quasiregular (HP Prop. B.1).
7. Quasiregular ellipticity: orientation and metric independence, transfer along local
   diffeomorphisms, conformal and flat examples, simplicial branched coverings by tori.

### Final targets of the triaged target

| target | design |
| --- | --- |
| T1 (outer distortion attained; Jacobian facts) | §2.2, §2.3, §2.4; locality §2.5; `C¹` §2.7 |
| T2 (inner and outer distortion) | §1.1–§1.3 (pointwise), §3.1–§3.3 (maps); also the Hilbert–Schmidt normalisation §1.4, §3.4 |
| T3 (invariance) | §4.1–§4.4; conformal invariance added in §4.1 |
| T4 (composition, stated) | QuasiregularMaps, Part II (proposed); the `C¹`-factor cases are §4.3–§4.4 |
| T5 (elliptic manifolds) | §7.1–§7.6; transfer along an arbitrary quasiregular map is Part II |
| T6 (Reshetnyak, stated) | QuasiregularMaps, Part II (proposed) |
| T7 (`ACLⁿ`, stated) | §5.1–§5.3, fully planned for every `p ∈ [1, ∞]`, not only `p = n` |
| T8–T10 (Bonk–Heinonen, Prywes, Heikkilä–Pankka) | QuasiregularMaps, Part III (proposed) |
| T11 (`#⁴(S² × S²)`) | QuasiregularMaps, Part III (proposed) |

The target asked that T4, T6 and T8–T11 be "stated targets" carrying `sorry` in `Suggested.lean`.
They are not planned here. Each proof needs theory that no roadmap plans: the modulus of path
families with the Poletsky and Väisälä inequalities, or the nonlinear potential theory of
`𝒜`-harmonic functions (Reshetnyak). For T8–T10 it also needs the pullback of Sobolev forms,
the reverse Hölder inequality for the Jacobian, and the rescaling of Bonk–Heinonen, Prywes and
Heikkilä–Pankka. Stating them as headline targets without that theory would be leaps, and
repository guidance forbids a roadmap that tails off into unplanned statements. They are
therefore split into two proposed Parts, described in the README's Downstream consumers with
exact statements and locators.

### Deviations from the triaged target, with reasons

- **Dimension `n = 1`.** The target excluded it. The definitions are made for `n ≥ 1`, and each
  theorem was checked at `n = 1` (see the table). None fails. The one place where `n ≥ 2`
  matters, the projection of §3.3, carries the hypothesis. The degenerate map `t ↦ max(0, t)`
  is a Check showing why Part II needs `n ≥ 2`.
- **`K ≥ 1` is part of the definition of `K`-quasiregular.** Without it, `K = −1` makes the
  orientation-reversing identity satisfy `‖Df‖ⁿ ≤ K J_f` (`1 ≤ (−1)(−1)`).
- **Composition with `C¹` factors.** The target's "postcomposition with a `C¹` quasiregular map"
  and "precomposition with a `C¹` orientation-preserving local diffeomorphism" are kept. The
  precomposition needs a bounded-distortion hypothesis `K_θ < ∞`; the shear of §2.5 is the
  counterexample without it.
- **Finite coverings (T5).** Generalised to `C¹` orientation-preserving local diffeomorphisms of
  bounded distortion (§7.4); finite coverings of closed manifolds are the special case.
- **Simplicial maps (HP Prop. B.1).** Stated for every `M` with `K_p < ∞` and every `n ≥ 1`, not
  only closed `M`, `N` and `n ≥ 2`. The proof route is Lipschitz plus Rademacher, not Stokes'
  theorem. It needs only Tau Ceti's within-simplex `TauCeti.IsSmoothTriangulation`, not HP's
  neighbourhood-extension notion. The hypothesis "`p` continuous" in §6.3 is a conclusion (the
  pasting lemma), and §7.6 needs no surjectivity of `π`.

## Ownership

- **SobolevMapsBetweenManifolds** is a board target with no design. It is not on main, not in the
  merge order and not an open roadmap pull request. Its triaged target owns the carrier (the class,
  `Df`, `‖Df‖`, `J(A)`, `J_f`, the chain rules and Euclidean compatibility). It lists
  QuasiregularMaps as its consumer and requires to precede it in the merge order. Planning the
  carrier here would duplicate that open work, so every use is a gap naming
  SobolevMapsBetweenManifolds and its target item: `sobolev-maps-class`,
  `sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`,
  `sobolev-maps-chain-rules`, `sobolev-maps-euclidean`.
  - The direction check does not see these gaps; it places the candidate after
    TeichmullerGeometry. The merge order must place SobolevMapsBetweenManifolds before
    QuasiregularMaps once that design is accepted; its likely suppliers are all on main, so it
    will land earlier.
  - The README names the requirement in its supplier contracts as what SobolevMapsBetweenManifolds
    must provide.
- **Owned here although adjacent to other roadmaps:**
  - **Locally Lipschitz maps in `W^{1,p}_loc(M, N)` (§2.8).** The SobolevMapsBetweenManifolds
    target plans only `C¹` maps. Layer 6 needs the Lipschitz case; if that roadmap later absorbs
    it, §2.8 consumes it.
  - **Measure-theoretic facts about `C¹` triangulations (§6.1).** GeometricTopology Layer 11 on
    main plans realizations and the PL side, not `C¹` triangulations. The facts are local
    finiteness, purity, null lower skeleton and bi-Lipschitz top simplices; their proofs are
    analytic (Sard in low dimension, mean value inequality).
- **Not planned here:** descent of an orientation to the orbit space of a free, properly
  discontinuous, orientation-preserving action. It lies in DifferentialGeometry Layer 2's
  direction, which plans pullback orientations and the orientation double cover. It is gap
  `orientation-descent`, proposed for DifferentialGeometry, Part II. Its only use is the
  orientability of `ℝⁿ/Γ` in §7.5. §7.5's statements for a given orientation, and the claim for
  closed orientable flat manifolds, do not need it.
- **Ownership against open work** was checked by object with
  `tauceti-roadmap roadmaps grep` across main and the open roadmap pull requests at their heads.
  - The searches covered quasiregular and quasiconformal maps, the Beltrami equation, bounded
    distortion, `ACL`, smooth triangulations, and orientation descent.
  - No roadmap plans quasiregular maps between manifolds, `ACL^p` maps or distortion of linear
    maps. TeichmullerGeometry §7.4 (open new-roadmap PR, merge order position 271) owns planar
    quasiconformal maps; §2.10 consumes it. PseudoholomorphicCurveAnalysis (main) defers the
    measurable Beltrami theory to TeichmullerGeometry. GeometricTopology's open revision
    (11.3, smooth triangulations) revises a roadmap on main and is not cited; Layer 11 on main is
    cited.
  - FourManifolds (open PR, merge order position 125) does not mention quasiregular maps at its
    head. It precedes this roadmap, so it cannot consume it. The four-manifold classification
    of HeikkilaPankka2025 Corollary 1.2 is placed in Part III, with FourManifolds as a
    supplier of Part III.
  - The board package index lists three packages under review (AnalyticNumberTheory,
    LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory), none related.
- **No `Suggested.lean` declaration name is reused** from a readable roadmap. No
  `Suggested.lean` is written at the design stage. The proposed Lean names are the `name` fields
  of `plan.json`. The README backticks only library declarations, so it makes no
  `Suggested.lean` claims.
- **What `Suggested.lean` can state at the pins.** The manifold-valued class is SobolevMapsBetweenManifolds'
  work and is not defined there. At the pins the acceptance file can state:
  - the linear results of Layer 1 for endomorphisms of an oriented inner product space, with
    `LinearMap.det` as `J`;
  - the Euclidean description of §2.9 as the definition on domains, with `TauCeti.HasWeakFDerivOn`;
  - §3.2 for Euclidean maps, §5.2 and §5.3.

  These are the special cases §2.9 identifies. They must be named as Euclidean statements so that
  the README's manifold generality and the Lean generality do not diverge.

## Notions moved down from later roadmaps

None. No supplier cited is later in the merge order. SobolevMapsBetweenManifolds is consumed
through gaps, as recorded above. TeichmullerGeometry, the only cited roadmap not on main, is in
the merge order and precedes the candidate's placement.

## Proposed Part IIs

- **QuasiregularMaps, Part II (Reshetnyak theory).** Its targets:
  - Reshetnyak's continuity theorem;
  - discreteness, openness and sense preservation of non-constant quasiregular maps;
  - almost-everywhere differentiability and Lusin (N);
  - `J_f > 0` almost everywhere;
  - the composition theorem;
  - transfer of ellipticity along non-constant quasiregular maps;
  - the modulus inequalities, Liouville for `n ≥ 3`, and Rickman's Picard theorem.

  It needs path families and modulus (GeometricMeasureTheory G1 for rectifiable curves), the
  local degree of open discrete maps (DifferentialGeometry Layer 10), and either `𝒜`-harmonic
  potential theory or the modulus method.
- **QuasiregularMaps, Part III (cohomology of quasiregularly elliptic manifolds).** Its targets:
  - Bonk–Heinonen Theorem 1.1;
  - Prywes Theorem 1.1;
  - Heikkilä–Pankka Theorem 1.1;
  - `#^k(S² × S²)` for `k ≥ 4`;
  - Heikkilä–Pankka Corollary 1.2.

  It consumes Part II, DifferentialGeometry Layers 6–9, SobolevDifferentialForms, PDE §2.4
  (Gehring's lemma), and FourManifolds' classification by intersection forms.
- **DifferentialGeometry, Part II (orientation descent).** The gap `orientation-descent`: a free,
  properly discontinuous, orientation-preserving action on an oriented connected manifold
  induces a unique orientation on the orbit space with orientation-preserving projection.

## Gaps

| slug | supplier | section | needed by |
| --- | --- | --- | --- |
| `sobolev-maps-class` | SobolevMapsBetweenManifolds | T2, Scope item 3 | 2.1, 2.2, 2.5, 2.6, 2.7, 2.8, 4.1 |
| `sobolev-maps-weak-differential` | SobolevMapsBetweenManifolds | T2, Scope item 2 | 2.1, 2.2, 2.3, 2.6 |
| `sobolev-maps-norm` | SobolevMapsBetweenManifolds | T3, Scope item 4 | 2.1, 2.2, 4.1 |
| `sobolev-maps-jacobian` | SobolevMapsBetweenManifolds | T4, Scope item 5 | 1.2–1.5, 2.1–2.4, 2.9, 4.1–4.4 |
| `sobolev-maps-chain-rules` | SobolevMapsBetweenManifolds | T1 (a)–(b), Scope item 3 | 4.3, 4.4 |
| `sobolev-maps-euclidean` | SobolevMapsBetweenManifolds | T1, T6 | 2.8, 2.9 |
| `orientation-descent` | DifferentialGeometry | Layer 2 (missing section; proposed Part II) | 7.5 |

## Sources

- **Read at the cited lines** (cached, certified): HeikkilaPankka2025 (arXiv v2),
  Prywes2019 (arXiv v1) and MartioRickmanVaisala1969 (journal open archive). The recognised text
  of the MRV scan is noisy, but the definitions (lines 332–340, 409–419), the inequalities
  (2.23)–(2.25) (lines 426–439), the projection warning (lines 423–425) and `ℓ(T)` (line 127)
  are legible. Each value used was recomputed independently in the table below.
- **Settled as uncertified, cited by locator only:** BonkHeinonen2001, Rickman1993, Vaisala1971,
  Reshetnyak1989, IwaniecMartin2001, Gromov1981, Gromov1999. No request was made for them. Their
  chapter-level locators come from the triaged target and are not verified against the texts.
- **Ahlfors2006** (AMS University Lecture Series 38, DOI 10.1090/ulect/038) is new, cited for
  the standard linear algebra of `z ↦ a z + b z̄` (§1.5) and the analytic definition of planar
  quasiconformality (§2.10). The sources service found no legal open copy: the DOI landing page
  is the publisher's priced e-book, on a host in no licence class. The entry is recorded by hand
  as uncertified with its DOI and chapter locator. Every planar value the design uses was
  computed here (table rows 1.5, 2.10). The text is not needed, so no `needs-references.toml`
  request was made, and the service's automatic `[[missing]]` entry for it was removed.
- `tauceti-roadmap sources check` on `sources.toml`: 0 problems.

No fetched page, paper or roadmap text contained instructions; nothing suspicious to quote.

## Adversarial pass

One row per statement; "values" are the computed sides.

| statement | instances tried | values computed | result | change |
| --- | --- | --- | --- | --- |
| Convention: operator-norm normalisation | `diag(2,1)` | `‖A‖² = 4`, `J = 2`, least `K = 2`; HS: `5/(2·2) = 5/4` | holds; normalisations differ | witness in Conventions, §1.4 |
| Convention: `q_O(0) = 0` | zero map, constant map | `q_O(0) = 0`, `K_O(const) = max(1, 0) = 1`; with `0/0 = ∞`: `K_O = ∞` | needed | Check §1.2, §2.2 |
| Convention: `q_O = ∞` on `J ≤ 0`, `A ≠ 0` | `R = diag(−1,1)`; projection `diag(1,0)` | naive `‖R‖²/J = −1`; `q_O(R) = ∞`; projection `1/0`, set `∞` | needed | Check §1.2 |
| Convention: outer vs maximal "K-QR" | radial `a = 1/2`, `n = 3` | `K_O = 1/a = 2`, `K_I = a^{1−n} = 4`, `K = 4` | terminologies differ by exactly this | witness Conventions, §5.3 |
| Convention: orientation sign | identity `(ℝ², std) → (ℝ², −std)`; reflection | `J(id) = −1`; `J(R) = −det R = 1` | holds | witness Conventions, §4.2 |
| Convention: exponents `n − 1` | `diag(2,1,1)`, `diag(1,1,1/2)` | `(q_O, q_I) = (4, 2)` and `(2, 4)` | both directions attained | witness Conventions |
| Convention: dimension 0 excluded | `n = 0` | `‖A‖⁰ = 1`, `J = 1` (volume form of a point), every map 1-QR | degenerate | excluded, stated |
| 1.1 minimal stretch | `diag(3,1/2)`; shear; zero; projection; `n = 1` | `ℓ = 1/2`, `‖A⁻¹‖ = 2`, product 1; shear `AᵀA` eigenvalues `(3±√5)/2`, `ℓ = 0.618`, basis minimum `1`; zero/projection `ℓ = 0`; `ℓ(a·id) = |a|` | holds; basis model and all-`v` model excluded | Checks |
| 1.2 `q_O`, `q_I` definitions | `diag(2,1)`; `R`; `0`; `−id` in `n = 2, 3` | `2, 2`; `∞, 0`; `0, 0`; `J(−id) = (−1)ⁿ`: `q_O = 1` (`n = 2`), `∞` (`n = 3`) | holds | Checks |
| 1.2 submultiplicativity of `q_O` | all sign cases: `J(A), J(B) > 0`; `A = 0`; `B = 0`; `A ≠ 0, J(A) ≤ 0`; `J(A) > 0`, `J(B) ≤ 0`, `B ≠ 0` | `‖BA‖ⁿ/J(B)J(A) ≤ q_O(B)q_O(A)`; `0 ≤ ·`; `0 ≤ ·`; RHS `∞·q_O(B)` with `q_O(B) ≥ 1` or `∞`, so `∞`; RHS `∞` | holds with `0·∞ = 0` | stated for all `A`, `B` |
| 1.2 submultiplicativity of `q_I` | `R ∘ R = id` | `q_I(id) = 1 > 0 = q_I(R)²` | fails without signs | hypothesis `J(A), J(B) ≥ 0`; Check |
| 1.2 lower semicontinuity of `q_O` | `A_k → 0`; `A_k → A` with `J(A) > 0`; `A_k → A ≠ 0` with `J(A) = 0`, `J(A_k) > 0`; `J(A) < 0` | `q_O(0) = 0 ≤ liminf`; continuous; `‖A_k‖ⁿ/J(A_k) → ∞ = q_O(A)`; eventually `∞` | holds | used in §2.7 |
| 1.3 characterisation, `K ≥ 0` | `K = 0`; `K = −1` with `R` | `K = 0`: `‖A‖ⁿ ≤ 0` iff `A = 0` iff `q_O ≤ 0` ✓; `K = −1`: `1 ≤ 1` true but `q_O(R) = ∞ > −1` | fails for `K < 0` | hypothesis `K ≥ 0`; negative control |
| 1.3 comparison | `diag(2,1,1)`, `diag(1,1,1/2)`, `diag(3,2,1)`, `n = 1`, `diag(1,0)` | `4 = 2²`; `4 = 2²`; `6 < 81/4`, `9/2 < 36`; `1, 1`; `q_O = ∞ > q_I¹ = 0` | holds when `J > 0`; second fails on `diag(1,0)` | hypothesis `J(A) > 0`; equality cases stated |
| 1.4 Hilbert–Schmidt (2.24) | `id`; `diag(2,1)`; `diag(1,ε)`; `diag(1,ε,ε)`; `R`; `0` | `1`; `5/4 ≤ 2 ≤ 5/2`; ratio `2/(1+ε²) → 2`; ratio `3^{3/2}/(1+2ε²)^{3/2} → 3^{3/2}`; `∞ ≤ ∞ ≤ ∞`; `0 ≤ 0 ≤ 0` | holds for every `A`; constant sharp, unattained for `J > 0`, `n ≥ 2` | stated |
| 1.5 planar | `a=1,b=1/2`; `a=0,b=1`; `a=2i,b=0`; `z + z̄/3`; `A = 0` | `3/2, 1/2, 3/4, q_O = 3`; `J = −1`, `∞`; `1`; `(4/3)/(2/3) = 2`; `|b| ≤ k|a|` reads `0 ≤ 0` and `q_O = 0` | holds incl. `A = 0` | Checks |
| 2.1 K-QR definition | id; id to `−o`; fold; `n = 1` `max(0,t)`; `K = −1`; `0 ≤ K < 1` | `1 ≤ 1·1`; `J = −1`; `J = sign x₁`, `‖DF‖ = 1`; `q_O ∈ {0, 1}`; `1 ≤ (−1)(−1)`; `(1−K)‖Df‖ⁿ ≤ 0` | `K ≥ 1` needed; fold excluded | `1 ≤ K` in definition; Checks |
| 2.2 `K_O` | constant; `z²`; radial `a = 2, 1/2` in `ℝ³`; fold; `M = ∅` | `max(1, 0) = 1`; `4|z|²/4|z|² = 1`; `a² = 4`, `1/a = 2`; `∞`; `1` | holds | Checks |
| 2.3 attainment | identity; fold; `M = ∅` | `[1, ∞)`; `∅`, `K_O = ∞`; `[1, ∞)` (`essSup` for the zero measure is `0`) | holds | Checks |
| 2.4 Jacobian of QR | `z²`; projection; radial | `J = 4|z|²`, zero only at `0` with `Df = 0`; `J = 0`, `DP ≠ 0`; `J = a|x|^{n(a−1)}`, integrable since `n(a−1) > −n` iff `a > 0` | holds | Checks |
| 2.5 locality | shear `(x, y + x³/3)`; `z²` on `Re z > 0` | `‖Df‖ = (x² + √(x⁴+4))/2`; `K_O(|x|<R) = ((R² + √(R⁴+4))/2)²` finite; `K_O(ℝ²) = ∞`; injective, `K_O = 1` | locally QR ≠ QR | Checks |
| 2.6 constancy | disjoint balls; Cantor map | `Df = 0`, two values; classical derivative `0` a.e., not constant, not `ACL` | connectedness and Sobolev class needed | Checks |
| 2.7 `C¹` maps | `z²`; `−id`; `(x³, y)`; projection `ℝⁿ → ℝⁿ/ℤⁿ` | `1`; `J = (−1)ⁿ`; `q_O = max(3x²,1)²/(3x²) → ∞`, `q_O = ∞` at `x = 0`; `‖dπ‖ = 1 = J` | holds; smooth homeomorphism not QR | Checks; ess sup = sup via lsc + full support |
| 2.8 Lipschitz | winding map; fold; `|x|^{1/2}` on `ℝ` | singular values `2, 1, 1`, `J = 2`, `K_O = 8/2 = 4`, `K_I = 2/1 = 2`; Lipschitz, not QR; `|x|^{−p/2}` integrable iff `p < 2` | holds; "every p" specific to Lipschitz | Checks |
| 2.9 Euclidean | radial `a > 0`, `a = 0`; opposite orientations | `σ = a r^{a−1}, r^{a−1}`; `‖Du‖ⁿ ≍ r^{n(a−1)}` integrable iff `a > 0`; `a = 0`: discontinuous, `r^{−n}` not integrable; `J = −det` | holds | Checks; removable `{0}` via Tau Ceti lemma |
| 2.10 Beltrami | `z + a z̄` (`a = 1/2`); `z̄`; holomorphic; `{f_z = 0}` | `K_O = (1+1/2)/(1−1/2) = 3`; `J = −1`; `k₀ = 0`, `K_O = 1`; there `f_z̄ = 0`, `Df = 0` | holds; agrees with TeichmullerGeometry §7.4 dilatation | `K_I` clause moved to §3.1 (it needed a later layer) |
| 3.1 `K_I`, `K` | radial `a = 1/2, 2` in `ℝ³`; projection; `z + z̄/2` | `(2, 4, 4)`, `(4, 2, 4)`; `q_I = 0`, `K_I = ∞`; `K_I = K_O = 3` | holds; `K_I = ∞` off the class needed | Checks |
| 3.2 (2.25) for maps | winding; `diag(3,2,1)`; `n = 1`; radial `a = 1/2`, `a = s`, `a = 1/s` | `4 = 2²`; `9/2`, `6` strict; `1, 1`; `4 = 2²`; `(K_I, K_O) = (s, s^{n−1})`, `(s^{n−1}, s)` | holds; optimal for `n ≥ 2` | stated optimality |
| 3.3 projection warning | `n = 2, 3`; `n = 1` | `J = 0 = ℓⁿ`, `‖DP‖ = 1`; `P = 0`, `K_O = 1` | `n ≥ 2` needed for the non-example | hypothesis `n ≥ 2` |
| 3.4 `K_S` (2.24) for maps | identity; `diag(2,1)`; `diag(1,ε)`; winding | `1`; `5/4`, `2`; `2/(1+ε²)`; `6^{3/2}/(3^{3/2}·2) = √2` | holds | Checks; table |
| 3.x table, radial rows | `n = 1` | `q_O = q_I = 1`, formula `K_I = a` would give `a` | radial rows need `n ≥ 2` | caveat added under the table |
| 4.1 comparable metrics | `c² g_N`; `T²`, `dx² + 4dy²`; `dx² + e^{2x}dy²`; `e^{2x}(dx²+dy²)` | factor `1`, `q'_O = q_O`; `‖dπ‖' = 2`, `ρ = 2`, `q'_O = 2 ≤ 4`; `q'_O = e^{|x|}`; `‖id‖' = eˣ`, `J' = e^{2x}`, `q'_O = 1` | holds; conformal changes exactly invariant | conformal statement added; Checks |
| 4.1 conformal invariance | `g'_M = e^{2u}g_M`, `g'_N = e^{2w}g_N` | `‖A‖' = e^{w−u}‖A‖`, `J' = e^{n(w−u)}J`, `ℓ' = e^{w−u}ℓ`; quotients unchanged | holds for unbounded `u`, `w` | added; corrected an example that claimed a factor `e^{2n(max u − min u)}` |
| 4.2 orientations | id to `−o`; reflection to `−std`; constants | `J = −1`; `J = +1`; `Df = 0` | holds | Checks |
| 4.3 precomposition | covering `π`; shear `θ`; reflection `θ` | `K_π = 1`; `K_θ = ∞`, `θ` not QR; `J = −1` | bounded distortion and orientation preservation needed | hypotheses; Checks |
| 4.4 postcomposition | `z² ∘ z²`; isometry; radial `2 ∘ 1/2` in `ℝ³` | `z⁴`, `K_O = 1`; unchanged; identity, `1 ≤ 4·2 = 8`; `x ↦ |x|x` is `C¹`, `df₀ = 0` | holds | Checks |
| 5.1 `ACL`, `ACL^p` | `|x₁|`; Cantor; `|x|^{1/2}` in `ℝ²`; indicator of `{0}` | partials `(sign x₁, 0)`; partials `0` a.e., not AC; `∫_{|x|<1}|x|^{−p/2} < ∞` iff `p < 4`; AC on lines missing `0`, discontinuous | holds; continuity is part of `ACL` | Checks |
| 5.2 `ACL^p = W^{1,p}_loc` | `|x|^{1/2}`; Cantor; `C¹` | `p < 4` both sides; neither; `Du = fderiv u` | holds | Checks |
| 5.3 agreement with MRV | radial `a = 1/2`, `ℝ³`; identity | ours `2`-QR; MRV `K = 4`; all `1` | holds | Checks |
| 6.1 triangulation facts | triangle on `S¹`; tetrahedron on `S²`; `t ↦ t²` on `[0,1]` | pure dim 1, `3` null points; pure dim 2, `6` null arcs; derivative `0` at `0`, inverse `√t` not Lipschitz | injectivity of the differential used | Checks |
| 6.2 simplicial maps | identity; fold for a symmetric triangulation; vertex collapse | non-degenerate, preserving; non-degenerate, reversing on `x₁ < 0`; degenerate | definitions separate the cases | Checks |
| 6.3 piecewise `C¹` ⟹ Lipschitz | `|x₁|`; eight-sector map; continuity hypothesis | `1`-Lipschitz; `L = [[1,−1],[0,√2]]`, `LᵀL` eigenvalues `2 ± √2`, `q_O = (2+√2)/√2 = 1+√2`; pasting lemma gives continuity | holds; continuity hypothesis redundant | continuity made a conclusion |
| 6.4 simplicial maps QR | identity; doubling of `T²`; fold; collapse; strip map `h` | `1`; `dp = diag(2,1)`, `4/2 = 2`; reversing; rank `n−1`, `J = 0`; `q_O = k²/k = k → ∞` | `K_p < ∞` and non-degeneracy needed | hypotheses; Checks |
| 7.1 ellipticity | `ℝⁿ`; constants; ball domain; `n = 1` | identity `K = 1`; constant always QR; chart onto a coordinate ball QR; `ℝ`, `ℝ/ℤ` | "non-constant" and domain `ℝⁿ` needed | Checks |
| 7.2 orientation independence | `f ∘ R` | `J_{(std,−o_N)}(Df(Rx)R) = −J_f(Rx)·det R = J_f(Rx)` | holds | Check |
| 7.3 metric independence | constant rescaling; `T²` with `dx² + 4dy²` | factor `1`; bound `4`, actual `1` (isometric to `ℝ²/(ℤ×2ℤ)`) | holds; bound not sharp | Checks |
| 7.4 transfer | doubling of `T²`; `ℂ∖{0} ⊂ ℂ`; conjugation | `K_q = 2`; `K_q = 1`; `K_q = ∞` | holds; non-constancy via discrete fibres | Checks |
| 7.5 conformal and flat | `ℝⁿ/ℤⁿ`; `exp`; `ℂ/(ℤ+iℤ)`; Klein bottle; `Sⁿ` stereographic | `J_π = 1`; nowhere-zero derivatives; glide reflections reverse orientation; `dσ = 2/(1+|x|²)·isometry` | holds; orientability needed | orientation via pullback and `eq_or_eq_neg`; Killing–Hopf cited for closed flat manifolds |
| 7.6 simplicial coverings by tori | `p = id`; doubling; degenerate; non-surjective `π` | `K = 1`; `2`-QR; excluded; image of `π` open, meets some `κ₁(σ°)`, so `p ∘ π` non-constant | holds without surjectivity | surjectivity hypothesis dropped |
| Build order | every `target:` prerequisite in `plan.json` | no target depends on a later one | after fix | §2.10 no longer cites §3.1 |
| Consumers vs merge order | FourManifolds (position 125) | earlier than the candidate | cannot consume | moved into Part III as a supplier |

## Dependency-check output

```
candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2348 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `tauceti-roadmap roadmaps resolve` on the README reported no
cross-roadmap citation and no Lean name found nowhere. It did not check names outside
TauCetiRoadmap ("no pinned Lake packages on this host"), so every Mathlib and Tau Ceti name was
checked by hand against the pinned sources, as described at the top.
