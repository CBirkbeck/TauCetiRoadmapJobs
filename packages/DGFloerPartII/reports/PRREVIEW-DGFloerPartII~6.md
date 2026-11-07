# Review of DGFloerPartII (pull request #1799 at c230d64)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1511 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (123 lines, 17 declarations). The gate passes, the
dependency check reports no problem, the Lean file elaborates with only its 16 `sorry` warnings,
and every elaborated type matches its README statement. The previous review's R02–R06 are
repaired. Its R01 is not, and it is re-raised as R06 below.

Most of the new findings come from the head commit, which takes ownership of material that
earlier roadmaps already own:

- the convenient category (1.0);
- the Clifford chain and real Bott periodicity (2.7–2.8, 4.2a);
- the Euclidean framed collapse (1.4a).

The other findings:

- the finite-capacity conclusion of Theorem I can now be stated at the pins but is missing from
  `Suggested.lean`;
- the nonorientable extension of Proposition 6.36 has no stated conclusion, and a Check in 4.5
  contradicts it;
- three P3 repairs.

Source ids used below:

- `bdho-cotangent`: the base package's manifest id for arXiv:2404.07953v3 (cached, 139 pages). The
  printed page number is the footer at the end of each page in the text.
- `css-derivative`: arXiv:2012.13634v1.
- `eschenburg-hanke`: arXiv:1610.04385v2.

All three were fetched into a scratch manifest only. This folder has no `sources.toml`, and this
review edits none.

## R01 (P2) — Real Bott periodicity and the stable orthogonal groups re-plan HomotopySpheres Layer 4A–4B

**Location.** README lines 64–69 (Scope: "the Clifford chain of iterated minimal centrioles of
`O(16m)` … the stable orthogonal groups, real Bott periodicity and the stable homotopy groups of
`O` and `SO` (4.2a)"). Also §2.7 (lines 856–904), §2.8 (905–961), §4.2a (1182–1231), Summary lines
19–23, and `Suggested.lean` lines 60–85.

**Claim.** This roadmap owns stable `O` and `SO`, the Morse theory of the Bott chain, real Bott
periodicity and the stable table. The Summary says these are needed only by these applications.

**Witness.** HomotopySpheres is merge-order line 72; this roadmap is line 327. At #1287 (head
b3f62ce) it owns:

- 4A.1, stable `O`/`SO` and the finite-to-stable range (lines 1382–1393);
- 4B.1–4B.8, the Bott proof spine (lines 1521–1637);
- `nonempty_orthogonalGroup_bottPeriodicity`, stated at its `Suggested.lean:126`.

That theorem says `k + 11 ≤ n → π_(k+9)(O(n)) ≃* π_(k+1)(O(n))`, which is this file's
`nonempty_pi_add_eight_SO_mulEquiv` with `O` in place of `SO`. Its `Suggested.lean` lines 133–171
state the stable table that `subsingleton_pi_SO_of_stable`, `nonempty_pi_SO_mulEquiv_zmod_two` and
`nonempty_pi_SO_mulEquiv_int` restate. Main's `TauCetiRoadmap/DGFloer/README.md:56` says
"HomotopySpheres Stage 4A–4B supplies stable real Bott periodicity".

There is a second defect in the same material. 2.8 asks for "an explicit `β_k`" (line 921) but
never states it, whereas HomotopySpheres 4B.6 (lines 1568–1603) tabulates the bounds with Bott's
equation numbers.

**Repair.**

1. Delete 2.7, 2.8 and 4.2a, and delete the four 4.2a theorems from `Suggested.lean`. Keep `SO`,
   which 4.3 needs.
2. Add a "From TauCetiRoadmap.HomotopySpheres" contract: 4A.1 (the range `r ≥ i + 2`) and
   4B.7–4B.8 (periodicity and the stable table), consumed by 4.3's stable term `π_(n−1)(O)`.
3. Move the Scope bullets into the "Left to named roadmaps" table.
4. Remove "real Bott periodicity with the stable orthogonal groups" from the Summary.
5. Keep the locally symmetric Jacobi statement of 2.8's last bullet inside 2.1, or cite
   HomotopySpheres 4B.2 and 4B.4.

Tested:

- HomotopySpheres consumes only DGFloer Layer 1 items 2 and 4 (#1287 lines 166, 1183), so the new
  edge points downward and creates no cycle.
- 4.3's `n ≥ 17` stable term is the 4B.8 entry for `n − 1 ≡ 0, 2, 4, 6 (mod 8)`: `ℤ/2, 0, 0, 0`.

## R02 (P2) — The convenient category of 1.0 already has an owner, and 1.2 then uses two compact generations

**Location.** README lines 46–48 (Scope: "compact generation as the right adjoint of the inclusion
of compactly generated spaces, the convenient limits, colimits, mapping spaces and exponential
law, and the pointed smash products, cones, suspensions and loop spaces"). Also §1.0 (lines
307–401) and `Suggested.lean` lines 37–58.

**Claim.** This roadmap owns the coreflection `k` and the pointed convenient category.

**Witness.**

- HomotopySpheres at #284, §3A item 1 (README line 367), owns it: "construct compact generation
  as the right adjoint `k` … prove `i ⊣ k`".
- On main, `TauCetiRoadmap/AlgebraicTopology/README.md:566–568` builds
  `compactReducedSuspensionCarrierComparison` "using only HomotopySpheres §3A.1's coreflection".
  1.2 consumes that comparison and composes it with 1.0's own `k`, so 1.2 uses two compact
  generations.

**Further defects in the same section.**

- `compactlyGeneratedSpace_prod` has no `T2Space Y`. At `X` a point it says that every locally
  compact space is compactly generated. Mathlib proves that only under `[T2Space X]`
  (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:324`, instance at line 355). The
  route's step "`S × Y` is compactly generated" needs it too, and #284 §3A item 1 says "locally
  compact Hausdorff sources".
- 1.0 does not cite Mathlib's k-ification `CompactCoherentification`, `𝐤X`
  (`Mathlib/Topology/Compactness/CompactlyCoherentSpace.lean:120–256`, with
  `instCompactlyCoherentSpace` and `homeo`). For Hausdorff spaces it agrees with
  `TopologicalSpace.compactlyGenerated`
  (`CompactlyGeneratedSpace.to_compactlyCoherentSpace`, `of_compactlyCoherentSpace_of_t2`,
  CompactlyGeneratedSpace.lean lines 365–370).
- The four theorems are API of a carrier, not headline theorems.

**Repair.**

1. Delete 1.0 and its four `Suggested.lean` theorems, together with the docstring sentence that
   lists them.
2. In 1.1, 1.2, Conventions and the supplier contracts, cite HomotopySpheres §3A.1–3A.2 for the
   coreflection, convenient products and exponentials, the pointed category and the
   suspension–loop adjunction. This is what main's AlgebraicTopology and DGFloer
   (`TauCetiRoadmap/DGFloer/README.md:185`) already do. At #1287, §3A's preamble (lines 809–818)
   routes these citations to AlgebraicTopology Stage 4 item 8.
3. Keep 1.1–1.2's comparisons.
4. Add `CompactCoherentification` to the Mathlib contract, with its Hausdorff agreement.

Tested: at `X = pt` the deleted product statement was the unsupported one. The Hausdorff case
that 1.1 uses is covered by #284's "locally compact Hausdorff sources".

## R03 (P2) — The Euclidean framed collapse of 1.4a duplicates GeneralizedCohomology G5 item 2 and TangentialBordism B5

**Location.** README lines 58–60 (Scope: "the framed Pontryagin–Thom collapse of a closed
submanifold of a Euclidean space, with its framed Thom-space factorization, its independence of
the choices and its effect on fundamental classes (1.4a)") and §1.4a (lines 587–649).

**Claim.** This roadmap owns the Euclidean collapse `(ℝⁿ⁺ᵏ)^+ → Th(ν)` and its framed form.

**Witness.**

- On main, `TauCetiRoadmap/GeneralizedCohomology/README.md:1523–1536` (G5 item 2) constructs "the
  unframed collapse `S^N→Th ν`", with independence of embedding, stabilization and metric and with
  fundamental-class duality. It says it "owns the unframed Thom collapse".
- TangentialBordism B5.5 (#942, lines 1482–1495) owns the finite framed specialization.
- 3.1 already consumes both, so this roadmap carries two collapses and never compares them.

**Repair.**

1. Delete 1.4a and its Scope bullet.
2. Restate 1.5 as the comparison of DGFloer Layer 1 item 5's closed-ambient collapse with G5
   item 2's collapse, followed by the framed Thom identification of TangentialBordism B5.5. The
   alternative is HomotopySpheres 5.1.3 at #1287 (lines 1855–1866): `Th(ν) ≃ M₊ ∧ Sᵏ` and the
   augmentation.
3. Keep 1.4a's three Checks as Checks of 1.5.

Tested: the `n = 0`, `k = 1` framed-point Check (degree `±1` by framing sign, the empty cycle
going to the base point) is TangentialBordism B5.1's own Check (#942 lines 1196–1198).

## R04 (P2) — Theorem I's finite-capacity conclusion is statable at the pins but absent

**Location.** `Suggested.lean` lines 19–22: "Not statable at the pins … Theorem I and Propositions
6.29–6.39 (4.2–4.5), which need `Diff(M)` with its `C^∞` topology, the mapping spaces out of
spheres and the fibered-family carriers".

**Claim.** No conclusion of Layers 3–4 can be stated at the pins.

**Witness.** Theorem I's conclusion is `c°_HZ(D*Q) < ∞` (`bdho-cotangent` lines 430–432), and Tau
Ceti at 2fd255d9 has every carrier for it:

- `TauCeti.CotangentBundle.symplecticForm`
  (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.lean:279`);
- `codiscBundle` (`…/Bundle/Codisc.lean:82`);
- `SmoothTwoForm.contractibleHZCapacity` (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean:193`).

A scratch file stating the two examples below elaborates with exactly two `sorry` warnings.

**Repair.** State them, importing `TauCeti.Geometry.Symplectic.Capacity.HoferZehnder`,
`TauCeti.Geometry.Symplectic.Cotangent.Bundle.Codisc`,
`TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville` and
`TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`:

```lean
theorem contractibleHZCapacity_codiscBundle_sphere_lt_top (n : ℕ) (hn : 2 ≤ n)
    [RiemannianBundle (fun x : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 ↦
      TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
      (fun x : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 ↦ TangentSpace (𝓡 n) x)] :
    (TauCeti.CotangentBundle.symplecticForm (𝓡 n)
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)).contractibleHZCapacity
      (TauCeti.CotangentBundle.codiscBundle (𝓡 n)
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) < ⊤ := sorry

theorem contractibleHZCapacity_codiscBundle_lieGroup_lt_top {E : Type} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {G : Type} [TopologicalSpace G]
    [ChartedSpace E G] [Group G] [LieGroup 𝓘(ℝ, E) ∞ G] [CompactSpace G] [ConnectedSpace G]
    [RiemannianBundle (fun x : G ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, E) ∞ E (fun x : G ↦ TangentSpace 𝓘(ℝ, E) x)]
    (hG : ¬ TauCeti.IsAspherical G 1) :
    (TauCeti.CotangentBundle.symplecticForm 𝓘(ℝ, E) G).contractibleHZCapacity
      (TauCeti.CotangentBundle.codiscBundle 𝓘(ℝ, E) G) < ⊤ := sorry
```

- Name both theorems in 4.5.
- Correct the docstring: Theorem H's hypothesis needs classes of `H_*(Map(S², Q))` living over the
  fundamental class, and Theorem G needs a mapping degree.
- Check Theorem B against Mathlib's singular homology
  (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`), Tau Ceti's manifold orientations and
  `SmoothTwoForm.HasContractibleAlmostExistence`, and state it if it is statable.

Tested:

- `G = T¹` is aspherical, so it is excluded, matching 4.3's torus Check.
- `G = SU(2)` has `π₃ = ℤ`, so it is included.
- `n = 2, 3` give Example 6.16 and Proposition 6.34.

## R05 (P2) — The nonorientable Proposition 6.36 has no stated conclusion, and 4.5's `ℝPⁿ` Check contradicts it

**Location.**

- README lines 1317–1319 (4.4: "The source states the result for every closed `H`, even when `M`
  is not orientable … Preserve this generality").
- Lines 1368–1373 (Theorem I list: "homogeneous spaces satisfying Proposition 6.36").
- Lines 1385–1386 (Check: "`ℝPⁿ` is not in the list").

**Claim.** For every `G/H` Proposition 6.36 concludes abundance, yet 4.1 defines abundance only
for oriented manifolds. Theorem I as stated excludes `ℝPⁿ`.

**Witness.** Take `ℝP² = SO(3)/O(2)`, which 4.4's third Check already uses, and let `α` be the
class of a degree-one map.

- A reflection component element `diag(A, det A)` lifts to `diag(−A, 1)` on `S²`, which has
  degree `−1`.
- So `(Φ_H)_*([H] × α)` is `α′`, nonzero in the degree-1 component (Example 6.37), plus a class
  in the degree `−1` component. The sum is nonzero.

**Repair.**

1. In 4.4 state two conclusions. An orientable `M` is abundant. A nonorientable `M` has
   `c°_HZ(D*M) < ∞` through the nonorientable Proposition 6.7, and no abundance is claimed for
   it. Add `ℝP² = SO(3)/O(2)` as the worked nonorientable instance.
2. In 4.5 write "orientable homogeneous spaces satisfying Proposition 6.36", and say that the
   source's Theorem I (`bdho-cotangent` lines 430–445) does not list homogeneous spaces.
3. Replace the Check with: "`ℝPⁿ` is not claimed abundant. `ℝP² = SO(3)/O(2)` meets 4.4's
   hypothesis and gets finite capacity from the twisted form, as the source's covering argument
   (Remark 6.2, cited at line 5215) also gives."

Tested on `ℝP²` with the computation above.

## R06 (P2) — Re-raised: DGFloer on main still owns Theorem B's realization and all of Layer 4

Re-raised: R01 of the previous review. The reason given there was "discharged by the sequencing
alone". That reason no longer holds, because the pull request no longer states the sequencing.

**Location.** README lines 36–41 (Scope: "every numbered statement of its §§6.3–6.4 and §7").

**Claim.** This roadmap is the only owner of §§6.3–6.4, §7 and the realization step of Theorem B.

**Witness.**

- Main's DGFloer at eaf17b1 still carries all of this: the Scope bullet at lines 52–56; the
  Layer 10 item 5 bullet "Multiple realization and Theorem5.14/TheoremB" at line 1567, whose
  compact-image embedding is 3.2's text; and Layer 11 items 1–6 from line 1577.
- DGFloer's revision #1798 (72a3f12) removes them.
- The description's merge order no longer names #1798.

**Repair.** Nothing in the folder. The description's merge-order paragraph should state that
DGFloer's revision #1798 lands before this pull request. This is an order, not a supplier
dependency.

## R07 (P3) — 4.6's dimension-bound Check fails at `k = n`

**Location.** README lines 1410–1412: "Dimension bounds forced by the hypotheses: `Y`
`ℓ`-connected of dimension `n − k` and homologically nontrivial gives `n ≥ 3k − 1` for even `k`
and `n ≥ 2k` for odd `k`".

**Claim.** The hypotheses of Theorem G force these bounds.

**Witness.** Take `Q = Sⁿ`, `X = Sⁿ` (`k = n ≥ 2`) and `Y = {p}`. The intersection is transverse
in a single point, the normal bundle is trivial, and `Y` is `ℓ`-connected for every `ℓ`. Yet
`n ≥ 3n − 1` and `n ≥ 2n` are both false.

**Repair.** Begin the Check with "For `k < n` (so `dim Y > 0`)", and add "for `k = n` the
hypotheses force `Q = Sⁿ` and `Y` a point, and the bound fails". Tested on `Q = Sⁿ`.

## R08 (P3) — 3.2 carries no locator

**Location.** README lines 1009–1019 (the compact-image embedding
`e(x) = (ρ_i(x), ρ_i(x) φ_i(x))_i` and the smoothing of `e ∘ f`).

**Claim.** The section's injectivity, immersion and smoothing claims stand without a source.

**Witness.** Neither 3.2 nor Layer 3's Dependencies cite these results; the Dependencies give only
"the source paper §§1.2 and 5" (line 1082). The source's proof of Theorem 5.14 (`bdho-cotangent`
lines 4273–4279) uses a merely continuous `φ`.

**Repair.** Cite the standard inputs at the claim: the bump-function embedding of a manifold, and
Whitney approximation of continuous maps into a manifold. Lee, *Introduction to Smooth Manifolds*,
2nd ed., Theorem 6.26 is the suggested locator for the second; this review did not read it (see
Not verifiable).

## R09 (P3) — The pull request description no longer matches the README's suppliers

**Location.** The description: its summary ("HomotopySpheres' James construction and Bott
periodicity") and its depends-on list (#1287 and #284 HomotopySpheres, #942).

**Claim.** The open suppliers are HomotopySpheres and TangentialBordism.

**Witness.**

- The README cites GeneralAlgebraicKTheoryPartII §§4.30b–4.30c (lines 87, 221–234, 442–457).
  Those sections exist only at #1742's head (492970e, lines 1206 and 1237).
- The README no longer cites HomotopySpheres.

**Repair.** Regenerate the description from the README:

- list #1742 and its own chain under depends-on and in the merge order;
- restore HomotopySpheres once R01–R03 are repaired;
- name #1798 as R06 asks.

## Previous findings

- **R01 (two owners on main): not repaired.** DGFloer on main is unchanged (lines 52–56, 1567,
  1577 on). It is re-raised as R06, because the description no longer names #1798.
- **R02 (Theorem I asphericity): repaired.**
  - Line 12–13: "manifolds that are not aspherical and are covered by diffeomorphisms".
  - Lines 1369–1372: "manifolds that are not aspherical and are covered by diffeomorphisms
    (Proposition 6.29) or are `ℓ`-covered with `π₂ ≠ 0` or with a first nonzero `π_k`, `k ≥ 3`,
    that is not `ℓ`-torsion (Proposition 6.33)".
- **R03 (DifferentialGeometry Layer 10): repaired.** No DifferentialGeometry citation remains.
  1.4's *Needs:* (lines 567–569) reads "with the homological degree interface the base roadmap
  takes from AlgebraicTopology Stage 6 item 5", and the AlgebraicTopology contract (lines 277–279)
  says the same.
- **R04 (`U(n)`): repaired.** Line 1300 reads "`U(n)` for `n ≥ 2` (`π₃(U(n)) = ℤ`) … while
  `U(1) = S¹ = T¹` is the torus case", and line 1418 reads "`U(n)` for `n ≥ 2`".
- **R05 (projective convention): repaired.** Lines 492–498 pin `U(d+1)/(U(d) × U(1)) → CPᵈ` to
  `[g] ↦ [g e_d]` and the `Sp` analogue. Conventions lines 126–128 use the same convention. A new
  Check (lines 533–539) computes the permutation comparison and the `d ≥ 2` failure of `[g e₀]`.
- **R06 (K7 anchor): repaired.** Line 247 links `../ComplexKahlerGeometry/README.md` without a
  fragment.

## Verified sound

**Gate and build.**

- The worker's gate at c230d64: every scanner is 0, `depcheck=0`, `build=0`, `outside-folder=0`.
  `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check, rerun:

      depcheck: 239 roadmaps, 2426 edges, 0 problem(s)

- `lake env lean` of `Suggested.lean` emits exactly 16 "declaration uses `sorry`" warnings, at
  lines 41, 46, 52, 57, 68, 73, 79, 84, 91, 94, 97, 101, 105, 109, 113 and 120, in 5 s.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. Main and #1798 have the same pins.
- Form: `module` / `public import Mathlib` / `@[expose] public section`. There is no `lemma`, no
  `set_option` and no sorry'd data.

**Signatures.**

- A scratch file importing the built module ran `#check @` on all 17 declarations. The types equal
  the worker's signature file.
- The four 1.0 theorems were reprinted with `pp.explicit`. The k-topology is the codomain topology
  in `continuous_compactlyGenerated_iff` and the instance argument of
  `uCompactlyGeneratedSpace_compactlyGenerated`, so neither statement is about the ambient
  topology.
- The file has no section `variable` (only `universe u w`), so no binder can drop.
- Every elaborated type matches its README sentence. For example, `isOfFinOrder_pi_SO`
  (`Odd (k + 3) → x : π_(k+2)(SO(k+3)) → IsOfFinOrder x`) is "every odd `n ≥ 3`" with `n = k + 3`.

**Padding probe.** `first | infer_instance | simp | rfl` (plus `exact Iff.rfl` and
`exact isOfFinOrder_of_finite x`) was run in a scratch file on seven of the sixteen theorems:

- the four 1.0 theorems;
- `nonempty_pi_add_eight_SO_mulEquiv`;
- `subsingleton_pi2_SO3`;
- `isOfFinOrder_pi_SO`.

All seven fail. The other nine are homotopy-group computations of `SO m`, and the pin has no
lemma about `HomotopyGroup.Pi` of a matrix group. The seven low-rank values are kept as targets,
not padding: each is a fibration computation, and `π₈(SO(9))` corrects the source. The 1.0 and
4.2a theorems are dealt with by R01 and R02.

**Headline theorems.**

| Headline | Status in `Suggested.lean` |
| --- | --- |
| Theorem B (3.3) and its Corollary D/E forms (3.4) | named as not statable (R04 asks for a recheck) |
| Theorem H (4.1) | not statable: its hypothesis "abundant" needs `Map(S², Q)` homology |
| Theorem I (4.5) | finite-capacity conclusion statable and absent (R04) |
| Theorem G (4.6) | not statable: mapping degree, normal bundles |
| Propositions 6.29, 6.31, 6.33, 6.34, 6.36, 6.38, 6.39 | not statable as abundance statements; 6.31 and 6.34 are covered by R04's finite-capacity forms |
| Lemma 6.35 (4.3) | stated, with its seven low-rank values |

**Library declarations opened at the pins.**

Mathlib:

- `TopologicalSpace.compactlyGenerated`, `UCompactlyGeneratedSpace`, `continuous_from_compactlyGenerated`
  (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:68, 91, 72`);
- the T2 section and the weakly locally compact instance (324, 355);
- `to_compactlyCoherentSpace` and `of_compactlyCoherentSpace_of_t2` (365, 370);
- `CompactCoherentification` (`…/CompactlyCoherentSpace.lean:120`);
- `CompactlyGenerated.compactlyGeneratedToTop` (`Mathlib/Topology/Category/CompactlyGenerated.lean:78`);
- `compactlyGeneratedAdjunction` (`Mathlib/Condensed/TopCatAdjunction.lean:175`, universes
  `(u, u+1)` only, so the all-universe left adjoint is not at the pin);
- `Topology.IsQuotientMap.continuous_lift_prod_left` (`Mathlib/Topology/CompactOpen.lean:587`,
  hypothesis `[LocallyCompactSpace Y]`).

Tau Ceti:

- `SmoothTwoForm.HasContractibleAlmostExistence` (`TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean:167`);
- `contractibleHZCapacity` (`…/Capacity/HoferZehnder.lean:193`);
- `CotangentBundle.codiscBundle` (`…/Cotangent/Bundle/Codisc.lean:82`, hypothesis `RiemannianBundle`);
- `CotangentBundle.symplecticForm` (`…/Bundle/Liouville.lean:279`, `ω = −dλ`);
- `TauCeti.IsAspherical`, `HomotopyGroup.pathLoopSpaceMulEquiv` (`…/LoopSpace.lean:321`);
- `LocalCoefficientSystem` (`…/LocalCoefficient.lean:46`).

**Cross-roadmap citations resolved.**

- **GeneralAlgebraicKTheoryPartII** at #1742's head 492970e:
  - §4.30b (line 1206) gives the universal property in compactly generated monoids, and `j` as a
    weak equivalence for connected `W`;
  - §4.30c (line 1237) gives Bott–Samelson over `R` when `H̃_*(W; R)` is free;
  - both as the contract at lines 221–234 says.
- **TangentialBordism** at #942 (1d3ca3f): B5.1–B5.7 (lines 1149–1604) and B6.3 (line 2472,
  "### 10.1 … (B6.3)").
- **Main (eaf17b1):**
  - SmoothBundlesConnections B1.4 (421, anchor matches), B2.2 (605), B2.5 (802), B6.2 (1668),
    B6.3 (1716);
  - RiemannianGeometry R1 (179), R2 (300), R3 (347);
  - MorseTheory M5 (857);
  - ComplexKahlerGeometry K7 (1405), K7.1 (1407);
  - AlgebraicTopology Stages 2 (326), 4 (499), 6 (946), 8 (1602);
  - GeometricTopology Layers 1 (177) and 3 (357);
  - LieGroups Layer 2 (275);
  - GeneralizedCohomology G2 (211), G4 (936, G4.0b at 939), G5 (1373);
  - DGFloer Layers 0–11.
- The base's Proposition 6.7 is stated with the orientation system `|Q|` (`bdho-cotangent` lines
  4420–4431), so "the nonorientable form of Proposition 6.7 (DGFloer Layer 10 item 2)" resolves on
  main.
- **Merge order:** TangentialBordism is line 15, GeneralAlgebraicKTheoryPartII line 326,
  DGFloerPartII line 327, and every other supplier is on main.

**Ownership and overlaps.**

- `roadmaps grep` over the 466 open pull requests and main searched for "compactly generated" /
  "convenient category", "real Bott periodicity" / "stable orthogonal group" / "Clifford chain",
  and "James reduced product". The hits are R01–R02, plus GeneralAlgebraicKTheoryPartII and
  HomotopySpheres 3B for James. The James overlap is between those two roadmaps; this roadmap
  cites one of them.
- The overlap report lists no pull request that changes this folder and no dropped id. Confirmed.

**Seeded source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 2.2 | Prop 6.38 proof, `bdho-cotangent` 5218–5241, printed p. 120 (homogeneous metric, frame `(v, Iv)`, Ziller perfectness, class twice `[T¹_pCPⁿ]`, index 1) | supports the generator and the factor 2; the rank-count route is the README's own and checks out (table) |
| 2.3 | Prop 6.39 proof 5252–5311, pp. 121–122 (index `2(k−1)(2n+1)+3` at 5285, `H_(4n+2) ≅ ℤ` at 5302, fibrewise degree `±2` at 5307) | as stated |
| 2.4 | Prop 6.18 path-loop spectral-sequence pattern; BDHO Chapter 5 not read | own construction; inputs cited (DGFloer Layer 4 item 5, Layer 5 item 4) |
| 2.5 | own computation | checked numerically (table) |
| 2.6 | 5226–5236 and 5257–5310 | `Σ_p`, `dim Σ = 8n + 1`, `±2` as stated |
| 3.1 | Thm 5.14 proof 4273–4277 (Thom, `N·α = φ_*[S]`, `d = Nb`) | as stated |
| 3.2 | no locator | R08 |
| 3.3 | Thm 5.14, 4267–4272, printed p. 98; Thm B 243–246; proof of B 4285–4288 | hypotheses identical |
| 3.4 | Cor D 265–292, Cor E 304–307; the source's convention `ω = dp∧dq = d(p dq)` (3060) | the README's translation by `−σ` is the source's `+σ` under `ω_can = −dλ` |
| 4.1 | Def 6.11 4517–4523, p. 104; Thm 6.12 4525–4546 | identical |
| 4.2 | Def 6.14 4621–4632, Prop 6.15 4633–4643, Ex 6.16 4645, Prop 6.21 4836, Prop 6.23 4849–4856 | identical |
| 4.2a | `eschenburg-hanke` §2 (225–236: `SO_2n` index `≥ 2n − 2`), §4 Thm 4 (299–303) | consistent; ownership R01 |
| 4.4 | Prop 6.36 5141–5158, p. 119 (no orientability assumed); Ex 6.37 5201–5210 | R05 |
| 4.5 | Thm I 430–445, p. 11 (no homogeneous spaces); Props 6.38–6.39 | R05 |
| 4.6 | §7 hypotheses 5354–5364, Thm 7.1 5366–5372, p. 123; Ex 7.4 5382–5396; Prop 7.5 5404 | identical; the bound remark is R07 |
| 4.3 value | `css-derivative` line 222 (stabilization `π₈SO₉ → π₈SO` split with kernel `ℤ/2`), line 249 (`π₈SO₈ = (ℤ/2)³`) | `(ℤ/2)²` as stated |

**Adversarial table** (values computed in this review).

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_pi_add_eight_SO_mulEquiv` | `j = 0, m = 11`; `j = 2, m = 13` | `π₉(SO(11)) = ℤ/2 = π₁`; `π₁₁(SO(13)) = π₁₁(O) = ℤ = π₃(SO(13))`; `π_(j+9)` stable needs `m ≥ j + 11` | true; duplicate | R01 |
| `subsingleton_pi_SO_of_stable` | `(j, m) = (1,4), (3,6), (4,7), (5,8)` | `π₂(SO(4)) = π₄(SO(6)) = π₅(SO(7)) = π₆(SO(8)) = 0` | true | R01 |
| `nonempty_pi_SO_mulEquiv_zmod_two` | `j = 0, m = 3` and `2`; `j = 7, m = 10` and `9` | `π₁(SO(3)) = ℤ/2`, `π₁(SO(2)) = ℤ` (excluded); `π₈(SO(10)) = ℤ/2`, `π₈(SO(9)) = (ℤ/2)²` (excluded) | range sharp | R01 |
| `nonempty_pi_SO_mulEquiv_int` | `j = 2, m = 5` and `4`; `j = 6, m = 9` and `8` | `π₃(SO(5)) = ℤ`, `π₃(SO(4)) = ℤ²`; `π₇(SO(9)) = ℤ`, `π₇(SO(8)) = ℤ²` | range sharp | R01 |
| 4.2a table from `π₀(Ω_i)` | `i = 1, …, 8` | components: `O/U` 2, `U/Sp` 1, `⊔G_p(ℍ)` `ℤ`, `Sp` 1, `Sp/U` 1, `U/O` 1, `⊔G_p(ℝ)` `ℤ`, `O(m)` 2 → `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2` | equals `π_i(O)` | R01 |
| 2.7 energy | `A = J`; one pair `±3i` | `π² tr(JᵀJ) = π²n`; `|A|² = (n − 2) + 18 = n + 16` | agrees | none |
| 2.7 `γ_J` | `A = J_k⁻¹J`, `J ∈ Ω_(k+1)` | `A² = −J_k⁻²J² = −I`; `Aᵀ = −A`; `J_kA = J`, `AJ_k = −J`; `γ_J(1/2) = J` | agrees | none |
| 2.7 involutions and dimension | `J₁J₂J`, `J₁⋯J₆J`; `m = 1` | squares `(−I)(−I) = I`; `(J₁⋯J₆)² = (−1)^15(−1)^6 = −I`, times `J² = −I`; `dim Ω₁ = 120 − 64 = 56 = n²/4 − n/2` | agrees | none |
| 2.8 first Check | `SO(n)`, `±3i` in `x₁x₂` | `eschenburg-hanke` 228–231: only the `3π` planar rotation lies in `SO(3)`; the whole geodesic ends at `−I ∉ SO(3)` | wording loose | deleted by R01 |
| `uCompactlyGeneratedSpace_compactlyGenerated` | any `Y` | `kY` is finer and every probe into `Y` generates it, so the probes of `kY` and `Y` coincide: `k(kY) = kY` | true | R02 |
| `continuous_compactlyGenerated_iff` | `X` compactly generated | (→) `kY` finer; (←) `f ∘ g` is a generating probe | true | R02 |
| `compactlyGeneratedSpace_prod` | `X = pt` | reduces to "locally compact ⇒ compactly generated"; Mathlib only under T2 (line 324) | unsupported | R02 |
| 1.0 Check `ℝ/ℤ₊ × ℚ` | Munkres §22 Ex. 7 | `p × id_ℚ` not quotient; `X ×_k ℚ` a quotient of `ℝ × ℚ`, so `X × ℚ ≠ X ×_k ℚ` | correct | none |
| 1.4a framed point | `n = 0`, `k = 1` | degree `±1` by framing sign; empty cycle has degree `0`; same as TangentialBordism B5.1 Checks | duplicate | R03 |
| Theorem I, spheres | `n = 2, 3`; probe | `S²` (Ex. 6.16), `S³` (Prop. 6.34); statement elaborates | statable | R04 |
| Theorem I, Lie groups | `T¹`, `SU(2)` | `T¹` aspherical, excluded; `π₃(SU(2)) = ℤ`, included | statable | R04 |
| 4.4 nonorientable | `ℝP² = SO(3)/O(2)`, `deg α = 1` | `diag(−A, 1)` has `det = −1`; components `+1`, `−1`; `α′ ≠ 0` | hypothesis holds; 4.5 Check false | R05 |
| 4.4 twisted sign | `ℝP²` | `χ = (det A)³ = −1`, coorientation `−1`, product `+1` | consistent | none |
| 4.4 `dim H = 0` | finite `H` | shriek of degree `0`, reduced condition can fail | hypothesis needed | none |
| 4.6 bound Check | `Q = Sⁿ`, `k = n`, `Y = pt` | `n ≥ 3n − 1` false; `n ≥ 2n` false | Check false | R07 |
| 4.6 Ex. 7.4 | `Q′ = Tⁿ`, `k ≥ 3` | `π₂ = 0`; rationally essential | agrees | none |
| 3.3 hypotheses | `T^r`, `ℝP³`, `S²` | `π_ℓ(T^r) = 0`; `π₃(ℝP³) = ℤ`; `π₂(S²) = ℤ` | agrees | none |
| 3.4 magnetic sign | `T*ℝ²`, `σ = q₁dq₂` | `Ψ'^*λ = λ − π^*σ`; `−d` gives `ω_can + π^*dσ`; source `Ψ` is `+σ` under `ω = dλ` | agrees | none |
| 3.1 torsion | `α` of order `N` | `f_*[∅] = 0 = Nα` | agrees | none |
| 3.2 | `U = ℝⁿ`, `ρ = 1` | `e(x) = (1, x)` | agrees | R08 (locator) |
| 1.2 ring | `n = 2, 3` | `ΩS² ≃ S¹ × ΩS³`: `ℤ` in every degree, `x² ≠ 0`; `n = 3`: even degrees; `H̃(S^(n−1); ℤ) = ℤ` free, so §4.30c applies | agrees | none |
| 1.3 convention | `d = 1, 2` | stabilizer of `[e_d]` is `diag(U(d), U(1))`; for `d ≥ 2`, `diag(A, 1)e₀ = e₁` breaks `[g e₀]` | agrees | none |
| 1.4 degree | `n = 1, 2, 3` | `2, 0, 2`; involution degree `(−1)^n · (−1) = (−1)^(n−1)` | agrees | none |
| 2.1 indices | `CPᵈ`, `HPᵈ` | `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3` (source 5285) | agrees | none |
| 2.2 cells | `d = 2` | `0, 1, 4, 5, 8, 9 = H_*(S¹ × ΩS⁵)`; `a₂ − b₁ = 1` | agrees | none |
| 2.3 cells | `d = 1, 2` | `6k − 3, 6k`; `3, 10, 13, 20`, gaps `3` | agrees | none |
| 2.4 `CP¹` | `E² = H_*(S²) ⊗ H_*(ΩS²)` | `d²: E_(2,q) → E_(0,q+1)` an isomorphism | agrees | none |
| 2.5 `CP²` | fibre classes | `E_(0,4)` killed by `d₄` from `E_(4,1) = ℤ` (`E_(2,3) = 0`); `E_(0,5)` by `d₂` from `E_(2,4)` | agrees | none |
| 2.6 dimensions | `CPᵈ`, `HPᵈ` | `2d − 1 → 2d`; `dim Σ = 8d + 1` gives `dim Σ_p = 4d + 1 → 4d + 2` | agrees | none |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim M + dim N`; constant spheres have reduced shriek `0` | agrees | none |
| 4.2 degrees and Serre | even `n`; `n = 4k − 1`; `2n`-connected `B` | `3n − 3`; `2n − 2`; differentials `r ≤ 2n − 2` vanish | agrees | none |
| 4.3 `π₈(SO(9))` | `SO(8) → SO(9) → S⁸` | `∂(ι)` of infinite order, so `(ℤ/2)³ ↠ π₈(SO(9))`; CSS split, kernel `ℤ/2`: `(ℤ/2)²` | refutes the source's `ℤ₄` | source issue |
| `isOfFinOrder_pi_SO` | `k = 0, 1, 6` | `Odd 3`: `π₂ = 0`; `Odd 4` false, excluding `ℤ²`; `π₈(SO(9))` has exponent 2 | agrees | none |
| 4.3 splitting below range | `n = 3, 7` | formula gives `0 ⊕ ℤ/2`; actual `0` | negative controls right | none |
| 4.5 `d = 0` | `CP⁰`, `HP⁰` | `Map(S², pt) = pt`, no class above degree `0` | excluded correctly | none |

## Not verifiable

- W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977),
  Theorems 3 and 8. Paywalled (Springer); not fetched in this run. The indices were recomputed
  from conjugate points, and they agree with `bdho-cotangent` line 5285.
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959), and Milnor,
  *Morse Theory*, §§21–24. Not in the cache (JSTOR, print). 2.7–2.8 were checked against
  `eschenburg-hanke` §§1–4 instead.
- Steenrod 1967, Strickland's CGWH notes and Munkres §22. Not fetched. 1.0's Checks were verified
  mathematically, and R02 recommends deleting 1.0.
- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorem 6.26, the locator suggested in R08.
  Not read; the author should check the number.
- BDHO, *Morse homology with DG coefficients*, Chapters 5–13, and Hatcher §§4.2 and 4.J. Not
  reread. The DG Morse inputs are consumed from DGFloer.
- [Jap87] Tables 6.VII–6.VIII, cited by the source for Lemma 6.35. Not available. The values were
  checked by exact sequences and `css-derivative`.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source reads
  `π₈(SO(9))` as cyclic of order four; it should be `ℤ/2 ⊕ ℤ/2` (stabilization onto `ℤ/2` is split
  with kernel `ℤ/2`, Crowley–Schick–Steimle); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source
  concludes by Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33,
  the `ℓ`-covered form; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble, printed page 123: the source derives `n ≥ 3k − 1` or
  `n ≥ 2k` from `ℓ`-connectivity of `Y`; it should assume `dim Y > 0`, since `Q = Sⁿ`, `Y` a point
  meets the hypotheses; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance
  for every `G/H` with `H` closed of positive dimension; Definition 6.11 needs `Q` oriented, so
  nonorientable quotients such as `SO(3)/O(2)` need an orientation twist; affects a stated result.
