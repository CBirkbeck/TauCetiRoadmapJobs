# FIX-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3

Repair round for the review `REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2` (five
findings, numbered R01–R05 by the review). Files changed:
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`,
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean` (header and module
docstring only) and the top-level `gaps` list of
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/plan.json`. `metadata.toml` and
`sources.toml` are unchanged. The carried-forward ownership question with
ArithmeticStatisticsPartVIII §5.16 was not re-raised by the review and is not touched here.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2/R01 (P1) — applied

**Verified.** Let `f(r, θ) = (r, θ + φ(r))` with `φ = exp(−1/(1 − r)²)` near `r = 1` and
`f_j` its cut-off `φ_j = χ(j(1 − r)) φ`. Each `f_j` is the identity on `r ≥ 1 − 1/j`;
`φ(1 − 1/j) = e^(−j²) > 0`; on the support `r ≥ 1 − 2/j` of `φ_j − φ` the `m`-th derivative is
`O(j^m · j^(−N))` for every `N` (flatness), so `f_j → f` in `C^∞`. The collar-fixing subgroup is not
closed, and a retract of a Hausdorff space is closed. SMA59 line 15–17 (Theorem B) and line 124–129
(Theorem 4) concern the square's identity-near-boundary group only.

**Change.** Old (§2.1): "a collar … retracts `Diff(D, ∂D)` onto the subgroup …". New: the sketch
uses only `π_0 = π_1 = 0` of `Diff(D, ∂D) = TauCeti.DiscDiff 2`, from the new gap
`gap:geomtop-boundary-pointwise-disc-smale` (GeometricTopology §3.4, imported by name); the
collar-fixing subgroup is called non-closed, its inclusion a weak equivalence. The flat-twist
negative-control Check is added.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2/R02 (P1) — applied

**Verified** at the head of the parent roadmap's open pull request,
`TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md` lines 5742–5754: the
class-locus comparison is stated "for a conjugation-invariant `c ⊆ G ∖ {1}`", and lines 5701–5715
put identity entries in *Marked moduli with arbitrary monodromy*. `G = 1`, `c = {1}`, `n = 1` meets
every §5.3 hypothesis; the exact-branch scheme is empty (`H^0` of dimension 0), `CHur_1/G = Conf_1`
has `H_0` of dimension 1.

**Change.** Supplier bullet §IG.5.3: adds `c ⊆ G ∖ {1}` and that identity entries are not points of
the exact-branch scheme. §5.3 proof sketch: `G = 1` handled separately (`Hn^c_{1,0} = Spec ℤ`, empty
for `n ≥ 1`, dimensions `δ_{i0} δ_{n0} ≤ 1`); for `G ≠ 1` a generating class misses `1`. New §5.3
Check (identity inertia). §5.3's statement is unchanged.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2/R03 (P2) — applied

**Verified** at the Tau Ceti pin: `TauCeti.GradedModuleCat` (`GradedModuleCat/Basic.lean`, `[Ring A]`,
ℤ-grading, degree-zero maps), its `Abelian` instance (`Abelian.lean`), `shiftFunctor` with
`(M{n})_p = M_(p−n)`, `enoughProjectives` (`Free.lean` line 225), `TauCeti.BalancedTensorProduct`
with `balance`, `liftEquiv`, `grading` (no Koszul sign), `lid`, `rid`, `finsuppScalarRight`, and the
additive bifunctor `TauCeti.GradedModuleCat.bimoduleModuleTensor`; `TauCeti.trivialGrading`,
`TauCeti.InternalGrading.opposite`, `TauCeti.InternalGrading.ofDecomposition`.

**Change.** Gap `dga-internally-graded-modules` deleted (README and `plan.json`); these
declarations added under *From Tau Ceti*. No adapter remains: a right module is a graded
`(k, R)`-bimodule with `k` trivially graded, and graded `Tor` is `Functor.leftDerived` of
`N ⊗_R −`. Module docstring of `Suggested.lean` now separates the pinned graded-module category from
the missing component algebra and K-complex.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2/R04 (P2) — applied

**Verified** on main, `TauCetiRoadmap/ReductiveGroups/README.md` lines 4396–4486 (11A: plane
configurations only; no disc comparison) and 4487–4521 (11B: "finite reduced crystallographic real
root pairing"; "the explicit source homotopy, rather than an unspecified good-cover lemma";
"homotopy or sufficient two-skeleton comparison"). `Homeomorph.unitBall` is at
`Mathlib/Analysis/Normed/Module/Ball/Homeomorph.lean` line 98.

**Change.** 11A bullet: plane spaces, finite covering, `π_1(Conf_n(ℂ)) ≅ TauCeti.BraidGroup n` by
counterclockwise half twists. 11B bullet: crystallographic root pairings, explicit Salvetti
homotopy; good-cover promise deleted. Gap wording (README, `plan.json`) restricted to
crystallographic pairings. §5.1 uses type `A_(n−1)` and `Homeomorph.unitBall` coordinatewise; two
Checks added.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2/R05 (P3) — applied

**Change.** Old header `module` / `public import Mathlib` / `public import
TauCeti.GroupTheory.SpecificGroups.Braid.Basic` / `@[expose] public section`. New: `import Mathlib`
and `import TauCeti.GroupTheory.SpecificGroups.Braid.Basic`; the `@[expose] public section` line is
deleted. Namespace and every declaration are unchanged; the file elaborates (below).

## Pattern search

- **R01.** `grep` for `retract`, `collar`, `Smale`, `SMA59`, `Diff(D`: the only retraction claim
  was §2.1; the other uses (scope bullet, GeometricTopology contracts, §2.1 definition, §2.5
  *Needs*, Layer 2 *Dependencies*) now name `TauCeti.DiscDiff` and §3.4 where they use them. The
  §2.5 phrase "retract arcs inside disjoint tubular neighbourhoods" is an isotopy of arcs, not a
  retraction of a group, and is correct.
- **R02.** `grep` for `CHur_n/G`, `complex points`, `inertia`: the comparison is used at the
  supplier bullet and in the §5.3 proof sketch only; both repaired. §IG.5.5's fixed-degree
  comparison compares the scheme with its own complex points and needs no change.
- **R03.** Every `DGAInfinity` mention was checked. Layer 0 and Layer 1 contract bullets (graded
  modules, internal direct sums, shifts, tensor products) asked DGAInfinity for the same pinned
  objects: deleted. *Needs* lines changed from DGAInfinity Layers 0/1 to Tau Ceti/Mathlib in §0.6
  (length grading: `AddMonoidAlgebra.gradeBy`, `MonoidAlgebra.toAdditiveAlgEquiv`,
  `TauCeti.InternalGrading.ofDecomposition`), §1.1, §1.2, §1.4, §1.8, §1.11, §1.12, the Layer 0
  and Layer 1 *Dependencies*, the scope list and the Mathlib `leftDerived` bullet. The
  `dga-graded-tor-spectral-sequences` gap no longer asks for graded `Tor` or its comparison with
  `leftDerived` (pinned). It keeps two-variable balance, long exact sequences and the two spectral
  sequences (README and `plan.json`). DGAInfinity Layer 5 citations for `Tor` (§§1.3, 1.5–1.7,
  1.10, 1.16, 1.17) stay.
- **R04.** `grep` for `11A`, `11B`, `reflection arrangement`, `good open`, `Conf_n(ℂ)`, `𝔻`: the
  scope bullet, both ReductiveGroups bullets, the gap, §2.1 (half-twist convention now "transported
  to the disc by the radial homeomorphism of §5.1, which preserves orientation") and §5.1 were
  repaired; Layer 5 *Dependencies* gains `Homeomorph.unitBall`.
- **R05.** No other `public`, `module` or `@[expose]` token remains in `Suggested.lean`.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1: `π_1(Conf_n) → π_0 Diff(D, P; ∂D)` iso from `π_0 = π_1 = 0` of `Diff(D, ∂D)` | `n = 0, 1, 2`; annulus | `n = 0`: base a point, fibre = total, `π_0 = 1 = B_0`; `n = 1`: `Conf_1 = int D` contractible, `π_0` fibre `= 1 = B_1`; `n = 2`: `π_1(Conf_2) = ℤ`, injective (π_1 total = 0) and onto (π_0 total = ∗), `= B_2`; annulus: core twist ≠ 1 in `π_0 Diff(A, ∂A)`, boundary map not onto | only `π_0`, `π_1` needed | sketch narrowed to them |
| Non-closedness of `Diff_c(D)` (new Check) | `j = 2, 10`; `m` arbitrary | `φ(1 − 1/j) = e^(−4) ≈ 0.018`, `e^(−100)`; `f_j = id` on `r ≥ 1/2`, `r ≥ 0.9`; `‖(φ_j − φ)^(m)‖ ≤ C j^m (2/j)^N → 0` for `N > m` | `f ∉ Diff_c(D)`, `f = lim f_j` | Check added |
| Retraction claim (old text) | the sequence above | a retraction `ρ` gives `ρ(f) = lim ρ(f_j) = lim f_j = f`, so `f ∈ im ρ = Diff_c(D)`: contradiction | false | deleted |
| Gap `geomtop-boundary-pointwise-disc-smale` | dimensions 1, 2, 4 | `DiscDiff 1`: diffeomorphisms of `[−1, 1]` fixing ends form a convex set, contractible; `DiscDiff 2`: Smale (claim); `DiscDiff 4`: not contractible given `TauCeti.WatanabeTheorem` (pinned `WatanabeTheorem.not_contractibleSpace_discDiff_four`) | dimension-specific statement, as written | gap stated for `n = 2` only |
| §5.3 with `1 ∈ c` | `G = 1`, `c = {1}`, `n = 0, 1`; `S₃`, transpositions | `n = 1`: `dim H^0(∅) = 0` vs `dim H_0(Conf_1) = 1`; `n = 0`: `Spec ℤ` and `CHur_0 = pt`, `1 = 1`; `S₃`: `1 ∉ c`, comparison applies | comparison false only for `1 ∈ c`; bound `δ_{i0}δ_{n0} ≤ 1 ≤ C^(i+1)` true | hypothesis, separate case, Check |
| §5.3 "nontrivial `G` ⇒ `1 ∉ c`" | `C₂`, `S₃`, `A₄` | `⟨{1}⟩ = 1 ≠ G` in each; generating classes `{s}`, transpositions, a 3-cycle class all miss `1` | true | used in sketch |
| Tau Ceti shift = README `M[q]` | `M = k`, `q = 1`; zero module | `(k{1})_0 = k_(−1) = 0`, `(k{1})_1 = k_0 = k`; the `ℕ`-subtraction model gives `k_0 = k` in degree 0; `0{1} = 0` | same direction and support as §1.1 | contracts cite pin |
| Tau Ceti balanced tensor = README `N ⊗_R M` | `R = k⟨x, y⟩`; `R = k[t]`, `N = M = k` | relation `(m a) ⊗ n = m ⊗ (a n)` with sign `+1` for odd degrees; `[Ring A]` only; `Tor_0 = k`, `Tor_1 = k[1]` | matches §1.2 Checks; Koszul-signed model excluded by "no Koszul sign" | gap deleted |
| Graded `Tor` as `leftDerived` | `GradedModuleCat.enoughProjectives` at `max uA v`; `k`, `R : Type` | universe `max 0 0 = 0`, so modules in `Type` have enough projectives; `bimoduleModuleTensor … N` additive (pinned instance) | definable at the pin | Tor gap narrowed |
| §5.1 plane/disc transport | `z = 0, 1, 2`; `n = 0, 2`; inverse | `h(0) = 0`, `h(1) = 1/√2`, `h(2) = 2/√5`; `h⁻¹(1/√2) = (1/√2)/√(1/2) = 1`; `(0, 1) ↦ (0, 1/√2)`; empty tuple fixed; `h'(r) = (1 + r²)^(−3/2) > 0` (orientation kept) | homeomorphism of configuration spaces commuting with `S_n` | Check added |
| §5.1 type-A specialization | `n = 3`; `I₂(5)` | `A₂` quotient cells `(1, 2, 1)` as in the `Z_3` Check; `4 cos²(π/5) = (3 + √5)/2 ≈ 2.618 ∉ {0, 1, 2, 3}` | needed case inside supplier scope | Check added |
| Suggested header | elaboration | exit 0, two `sorry` warnings, lines 503 and 520 | forms required by the brief | applied |

## Checks

**Elaboration.** From the content checkout,
`lake env lean packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean`: exit 0,
in 4.2 s (the object file of `TauCeti.GroupTheory.SpecificGroups.Braid.Basic` was present; nothing
was built). Output: exactly two warnings, `declaration uses 'sorry'` at lines 503
(`hurwitz_homological_stability`) and 520 (`uniform_betti_bound`).

**Signatures.** A scratch copy with `#check @name` for all 40 declarations (from `IsNonsplitting`
to `uniform_betti_bound`) appended inside the namespace elaborated with exit 0 and the same two
warnings. `hurwitz_homological_stability` keeps `{G : Type} [Group G] [Fintype G] (c : ConjClasses G)`,
`IsNonsplitting c`, `∃ m, 0 < m ∧ (∀ g ∈ c.carrier, g ^ m = 1) ∧ ∃ A B, ∀ (k : Type) [Field k],
(Fintype.card G : k) ≠ 0 → ∀ full p n, A * p + B < n → …` for both the marked and unmarked
stabilizers; `uniform_betti_bound` keeps `∃ C, ∀ k [Field k], … ∀ full i n, Module.rank … ≤ C^(i+1)`
for both fibres; `markedStabilizer` and `unmarkedStabilizer` carry `[Fintype G]` and `[Field k]`.
These agree with README §4.5 and §5.2. Only the header changed, so no binder or type changed. Every
one of the 40 names occurs in the README.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
nowhere. The tool did not check names outside TauCetiRoadmap. Every Mathlib and Tau Ceti name added
this round was opened at the pins: `Homeomorph.unitBall` (line 98), `AddMonoidAlgebra.gradeBy`,
`MonoidAlgebra.toAdditiveAlgEquiv`, `TauCeti.DiscDiff`, `TauCeti.RelativeDiff`,
`Diffeomorph.isClosed_fixingSubgroup`, `TauCeti.GradedModuleCat` and `.shiftFunctor`,
`.enoughProjectives`, `.bimoduleModuleTensor`, `TauCeti.BalancedTensorProduct` and `.balance`,
`.liftEquiv`, `.grading`, `.lid`, `.rid`, `.finsuppScalarRight`, `TauCeti.InternalGrading`,
`.ofDecomposition`, `.opposite`, and `TauCeti.trivialGrading`.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gap consistency.** README and `plan.json` carry the same eight slugs. The suppliers are
ReductiveGroups Layer 11B; AlgebraicTopology Stages 4, 5 and 8; GeometricTopology Layer 1,
Layer 3 and §3.4; and DGAInfinity Layer 5. `dga-internally-graded-modules` is gone from both and
`geomtop-boundary-pointwise-disc-smale` is new in both. Nothing outside the `gaps` list of
`plan.json` changed (the diff is 6 insertions, 6 deletions, all in the list).

**Gate failures listed in the brief:** none.

## For the maintainer

- **New request to GeometricTopology (main), §3.4:** `gap:geomtop-boundary-pointwise-disc-smale`,
  the weak contractibility of `TauCeti.DiscDiff 2` (Smale in boundary-pointwise form). The pinned
  docstring of `TauCeti.DiscDiff` attributes the `n = 2` case to Smale, but nothing is proved at the
  pin. The open TeichmullerGeometry roadmap §0.2 works with collar-fixing subgroups and cites
  GeometricTopology Layer 3.4, without owning this comparison. GeometricTopology on main is the
  owner, earlier than every open roadmap.
- **Withdrawn request to DGAInfinity:** `gap:dga-internally-graded-modules` (pinned in Tau Ceti).
  **Narrowed requests:** `gap:dga-graded-tor-spectral-sequences` (graded `Tor` itself is
  `leftDerived` of the pinned functor) and `gap:reductive-salvetti-homotopy-type` (crystallographic
  root pairings).
- No Lean name changed; no section, layer or target id changed, so no citing roadmap is affected.
- Ownership against open pull requests: checked with `roadmaps grep` for the new gap's object
  (`DiscDiff 2`, boundary-pointwise disc Smale). Hits were the open TeichmullerGeometry roadmap and
  an open revision of GeometricTopology, which keeps §3.4 and its numbering. No new construction is
  owned here.
- No new source was cited; `sources.toml` and `needs-references.toml` were not touched. PAL60 and
  ALEX23 stay settled as uncertified.
