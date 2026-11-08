# Review of ReductiveGroups (pull request #1676 at e57c60e)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `e57c60eefca05df11857adc5624a76f2ea26d40d`. The folder changed by 380 lines since `9846d26`, the head the previous review read. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates at the branch pin with exactly eight `sorry` warnings. The sampled locators (§1.1, §8.1, §8.2) and every new locator of this round (Milne 16.33(d), 17.10, 1.39, 5.34, 17.15–17.16, 22.43; Conrad, adelic points, Proposition 3.1; Conrad, RGS, 5.1.1, 6.1.1–6.1.2) are right.

Three findings remain, all carried over from the previous review:
- the branch still pins a Tau Ceti revision where the declarations the README cites do not exist, and this round adds more of them (R01, P2);
- the Levi-of-parabolic headline is neither stated nor named as not statable (R02, P2);
- the description states no order against the five conflicting pull requests (R03, P3).

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. The branch pin is Tau Ceti `a91d3aaf` with Mathlib `6b7abb3c` (this head's `lake-manifest.json`); main's pin is Tau Ceti `2fd255d9` with Mathlib `1b1ccf4b`.

**The previous review's findings at this head.**

- **R01** (P2, rebase onto main's pin). *Not repaired.* The manifest still pins `a91d3aaf`, and `git merge-tree --write-tree HEAD origin/main` still reports the two modify/delete conflicts on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. This round's repairs cite about twenty more declarations that exist only at `2fd255d9`. Raised again as R01.
- **R02** (P2, two Layer 7 headlines). *Partly repaired.* `Suggested.lean:152–170` states `exists_conjugate_eq_of_isMaximalTorus`, and `README.md:1640–1655` names it with its route; the signature, its hypotheses and its docstring are right (checked under *Verified sound*). The Levi-of-parabolic headline is still neither stated nor named in the docstring: raised again as R02.
- **R03** (P2, Layer 3A.5's point-topology comparisons). *Repaired.* `README.md:24–37` makes Layer 3A.5 the owner for every local topological algebra `R` with open units and continuous inversion, `README.md:990–1028` states the general-`R` targets with Conrad's Proposition 3.1 as locator and three Checks, `README.md:1030–1044` reduces the complex case to them, `README.md:4009–4012` names ReductiveGroupsPartII RG2.0.1 and ComplexComparisonPartII C-1.1 as consumers, and the "agreeing by the identity on `X(ℂ)`" sentence is gone. The matching citations in those two roadmaps belong to their own pull requests.
- **R04** (P2, Layers 1.1 and 7f restate pinned theorems). *Repaired.* `README.md:172–188` and `:679–693`, `:711–713`, `:748–761` consume `endOfPoint`, `pointsRepresentation`, `pointsAction`, `rTensor_comp_endOfPoint`, `fixedSubcomodule`, `Hom.fixedMap` and the `Comodule/Induced.lean` declarations, keeping only the inverse direction, left exactness, transitivity, the points description and the field transport as targets. `README.md:2214–2235` and `:2256–2269` consume `Subgroup.natCard_fixedBy_mul_natCard`, `Subgroup.AlmostConjugate`, `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, `TauCeti.nonempty_equiv_ind_trivial_iff_forall_natCard_fixedBy_eq` and the two `LineHyperplane.lean` theorems; the target identity and "this roadmap does not treat it as already proved" are gone. The cited declarations exist only at main's pin: see R01.
- **R05** (P3, the repurposed "Layer 8" id). *Repaired.* `README.md:421–432` gives the old → new map. I checked it against main's README: "Layer 7g" (main line 968) → 9E, "Layer 8: classification and existence" (main line 1023) → 9D, the bullet "Relative reductive groups over an affine Noetherian base" (main line 1028) → 9D's "arbitrary affine base", and 9B's bullets "Split reductive group schemes over a base" and "Pinnings" (main lines 1612, 1614) → §§8.1–8.2.
- **R06** (P3, no stated order against the five conflicting pull requests). *Not repaired.* The description is unchanged. Raised again as R03.

## R01 (P2) — the branch pins Tau Ceti `a91d3aaf`, where the declarations the README cites do not exist

**Location.** `lake-manifest.json` (Tau Ceti `rev` `a91d3aaf…`); the new passages `README.md:172–188` (points action and cotensor induction), `:2214–2235` and `:2256–2269` (Layer 7f), `:1667–1673` (parabolic predicate), `:1814–1838` (`Frobenius/FiniteField.lean`), `:301–341` and `:990–1016` (point topology), `:241–274` (orbit geometry); and `Suggested.lean:31–41`, `:51–53`, `:61–69`.

**Claim.** The cited declarations exist in the pinned Tau Ceti.

**Witness.** At `a91d3aaf` none of these files exists; all exist at `2fd255d9`:
- `Algebra/Coalgebra/Comodule/Induced.lean` (`induced`, `inducedEquiv`, `inducedEquiv_comp`, `inducedEquiv_inducedMap_comp`, `inducedMap_id`, `inducedMap_comp`);
- `Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean` (`pointsAction`);
- `GroupTheory/AlmostConjugate.lean` (`Subgroup.AlmostConjugate`) and `LinearAlgebra/Matrix/GeneralLinearGroup/LineHyperplane.lean`;
- `Topology/Algebra/PointTopology/`, `Algebra/AlgebraicGroup/Parabolic/`, `Algebra/AlgebraicGroup/Frobenius/FiniteField.lean`, `AlgebraicGeometry/GroupAction/`.

Also absent at `a91d3aaf`, present at `2fd255d9`: `Subgroup.natCard_fixedBy_mul_natCard` (`GroupTheory/QuotientGroup/Basic.lean:177` there) and `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`RepresentationTheory/CharacterTable/FixedPointCount.lean:183`). The gate's build passes only because `Suggested.lean` uses none of them.

`git merge-tree --write-tree HEAD origin/main` reports two modify/delete conflicts, on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`: this branch deletes both files and main's pin bump edited them.

**Repair.** Rebase onto current main, so that the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, and resolve the two conflicts by keeping the deletion (nothing on main or in an open roadmap imports or cites those modules). The README and `Suggested.lean` need no change for this: every name I checked this round exists at `2fd255d9` with the hypotheses the README states (under *Verified sound*), the new maximal-torus statement uses only `Torus/Maximal.lean` and `HopfIdeal/Conjugation.lean`, which are identical at both pins, and this head's `Suggested.lean` elaborates unchanged at main's pins with the same eight `sorry` warnings (tested from the content checkout, 12 s). Then apply R02, which is written against that pin.

## R02 (P2) — the Levi-of-parabolic headline is neither stated nor named as not statable

**Location.** `README.md:1678–1680`: "Prove that the geometric unipotent radical of `P` descends to a smooth connected `k`-split normal subgroup `U`, and that a reductive `k`-subgroup `L` exists with `P=L⋉U`". `Suggested.lean:51–55`: "the represented quotient `G/P` by a parabolic subgroup, and the root datum extracted from a group lack the required comparison carriers. The parabolic predicate itself is pinned (`TauCeti.HopfIdeal.IsParabolic`, …)".

**Claim.** Every headline that is statable at the pins is stated, and every one that is not is named with its missing carrier.

**Witness.** At the branch pin `a91d3aaf`, `Algebra/AlgebraicGroup/Parabolic/` does not exist, so the docstring's "the parabolic predicate itself is pinned" is false there and the Levi headline is not statable and not named. At main's pin `2fd255d9` it is statable: `TauCeti.HopfIdeal.IsParabolic` (`Parabolic/Basic.lean:248`), `unipotentRadicalDefiningIdeal` and `coinvariants` are the only carriers, and the statement below elaborated there in the previous round with one `sorry` warning. Either way the file does not match the rule.

**Repair.** After R01, add to the `/-! ## Layer 7 -/` section:

```lean
/-- Levi decomposition of a parabolic subgroup. Over every field `k`, a parabolic subgroup `P`
of a connected reductive group `G` has a Levi `k`-subgroup: the geometric unipotent radical of
`P` descends to the `k`-unipotent radical `U`, and some closed subgroup `L` of `P` maps
isomorphically onto `P/U`, so `O(P/U) → O(P) → O(L)` is bijective (Conrad–Feng, §H.1, p. 238;
Proposition 12.3.1, p. 127). -/
theorem exists_levi_of_isParabolic {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp
        (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val)
```

and name it at `README.md:1680`. `conrad-feng` lines 10375–10380 (§H.1, p. 238) give the descent of `R_u(P_k̄)` to a smooth connected normal `k`-subgroup, which is then the native `k`-unipotent radical, and the existence of a Levi `k`-subgroup. Tested on the instance `P = B ⊂ GL₂` over `𝔽₂(s)`: `R_{u,k}(B) = U`, `O(B)^U = k[a^{±1}, d^{±1}] → O(T)` is bijective over the imperfect field; for `P = G`, `R_u = 1` and `J = 0`. If the author prefers to keep it unstated until the rebase lands, the docstring must instead say that the Levi headline is not statable at the branch pin because `IsParabolic` is absent there.

## R03 (P3) — five other open pull requests change this roadmap and conflict with this head; the description states no order

**Location.** The pull-request description, unchanged since the previous review.

**Witness.** The overlap index of 2026-11-08 lists #1332 (same author), #1797, #1807, #1808 and #1854 as conflicting with this head in `README.md`, `Suggested.lean` or the deleted `*Targets.lean` files. The description still describes "the new native companion module" and "one intentional admitted presentation target", neither of which this head has (the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`; `Suggested.lean` admits eight targets).

**Repair.** State in the description which pull request is rebased on which: either this one lands first and the others re-copy or drop the folder, or the reverse. Close or retarget #1332 if this pull request supersedes it. Replace the stale validation paragraph with what the head actually contains.

## Verified sound

**Head, scope, gate.**
- Head `e57c60ee…`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- In the folder the pull request rewrites `README.md` and `Suggested.lean` and deletes seven `*Targets.lean` modules.
- The worker's gate at this head: every check 0, `OK`.
- Dependency check (`--movable`, content main, the board's ORDER.txt): `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, no UPWARD or CYCLE line. ReductiveGroups is on main and not in ORDER.txt.
- `lake env lean` on `Suggested.lean` from the worktree, at `a91d3aaf`/`6b7abb3c`: exit 0 in 17 s, eight warnings, all "declaration uses `sorry`", at lines 110, 123, 143, 165, 181, 203, 367 and 376. `halfTwist_injective` and `halfTwistLoop` are fully proved. The same file, unchanged, elaborated from the content checkout at main's pins `2fd255d9`/`1b1ccf4b`: exit 0 in 12 s with the same eight warnings at the same lines, so the rebase of R01 costs nothing in `Suggested.lean`.

**Padding probe.** On a scratch copy I replaced each of the eight `sorry` by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | exact?` and elaborated it at the branch pin (1 m 29 s). All eight fail: six with "`exact?` could not close the goal" (lines 117, 130, 151, 213, 372, 379 of the copy) and two with a heartbeat timeout at `whnf` (`exists_conjugate_eq_of_isMaximalTorus`, `lang_surjective`). Nothing is padding; no declaration restates a definition, mirrors a Check or computes a value, and the two proved declarations (`halfTwist_injective`, `halfTwistLoop`) are the data the braid headline needs.

**Signatures.** I compared the worker's `#check @…` of all 18 declarations with the README. No binder is lost. The new one:
- `exists_conjugate_eq_of_isMaximalTorus : ∀ {k} [Field k] [IsAlgClosed k] (H : FiniteTypeCommHopfAlgCat k) {I J : HopfIdeal k H.obj}, IsMaximalTorus k H.obj I → IsMaximalTorus k H.obj J → ∃ g, I.conjugate g = J`, as `README.md:1640–1644` states it: algebraically closed field, finite-type affine group with no smoothness or connectedness hypothesis, pinned maximal-torus predicate, conjugation by a rational point.

The other seventeen are unchanged from the previous round (`[CharZero k]` and `AlgebraicClosure k`; `[IsAlgClosed k]`, `[CharP k p]`, `hsm`, `hconn`; `[Finite k]`, `[IsAlgClosed K]`, `hF`; `2 ≤ n`).

**The new maximal-torus headline, at the pin.**
- `TauCeti.HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`, identical at both pins): `Minimal` among Hopf ideals whose quotient satisfies `torusCommHopfAlgProperty`, with `J ≤ I` meaning the subgroup of `I` is contained in that of `J`; so "a torus closed subgroup contained in no larger one", as `README.md:1642–1643` says.
- `TauCeti.HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:66`): the inverse image of `I` under the coordinate automorphism of `x ↦ gxg⁻¹`.
- `TauCeti.HopfIdeal.IsMaximalTorus.exists_isBorelOverAlgClosed_le` (`Borel/Torus.lean:70`, both pins, `[IsAlgClosed k]`): every maximal torus lies in a Borel subgroup, the first step of the route at `README.md:1651–1653`.
- `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:156` at the branch pin, `:149` at main's): takes a fixed maximal torus `D` and the hypotheses `hcontainI`, `hcontainJ` that `I` and `J`, if diagonalizable, are conjugate into `D`. `README.md:1647–1651` and the docstring describe exactly this.
- Milne 2017 (cache `iAG2017.pdf`, printed page = PDF page − 12): Theorem 17.10 at line 14547, p. 354, whose proof is the Borel route of the README; Theorem 16.33 at line 13793, pp. 335–336, with part (d) the conjugacy of multiplicative-type subgroups into `T` by `G_u(k)` used at `README.md:1278–1279` and `:1654–1655`; Corollary 1.39 at line 1134, p. 18, `G_red` an algebraic subgroup over a perfect field.

**Supplier contracts, checked at `2fd255d9` (the pin R01 asks for).**
- `TauCeti.Comodule.endOfPoint` (`Coalgebra/Comodule/PointsAction.lean:78`): `[CommSemiring R] [Semiring H] [Algebra R H] [Coalgebra R H]`, any comodule `V`, any `R`-algebra `A`, as `README.md:172–175` says.
- `TauCeti.Comodule.fixedSubcomodule` (`Coalgebra/Comodule/Fixed.lean:57`): `eqLocus coact ((mk R M C).flip 1)` over a coalgebra with `[One C]`, as `README.md:185–187` says.
- `TauCeti.Comodule.induced` (`Coalgebra/Comodule/Induced.lean:102`): kernel of `cofreeMap coact − cofreeLift (id ⊗ f)` in `M ⊗ C`, under `[CommRing R]`, `f : C →ₗc[R] D`, `[Module.Flat R C]`; `inducedEquiv` (`:215`): `Hom R C N (induced f M) ≃ₗ[R] Hom R D N M` with `N` corestricted, forward map the composite with `inducedEval`. This is `README.md:748–756`.
- `Subgroup.natCard_fixedBy_mul_natCard` (`GroupTheory/QuotientGroup/Basic.lean:177`): `Nat.card (fixedBy (G ⧸ H) g) * Nat.card H = Nat.card (stabilizer (ConjAct G) g) * Nat.card {x // x ∈ (ConjClasses.mk g).carrier ∧ x ∈ H}` for any group, no finiteness, as `README.md:2226–2230` says.
- `Subgroup.AlmostConjugate` (`GroupTheory/AlmostConjugate.lean:92`): equal counts in every conjugacy class. `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`FixedPointCount.lean:183`): under `[Field k] [Finite G] [CharZero k]`, as `README.md:2221–2224` says.
- `TauCeti.indTrivialIso` (`Induction/Permutation.lean:166`, both pins) is `Rep.mkIso (indTrivialEquiv k H)`, as `README.md:2220–2221` says.
- Point topology, parabolic and Frobenius contracts: unchanged from the previous round, where I checked them name by name at `2fd255d9`; this round adds only `locallyCompactSpace_of_finiteType` (`PointTopology/Basic.lean:261`) and `baseChangePointsMulEquiv_symm_frobeniusPoints` (`FiniteField.lean:497`), both present there.

**Cross-roadmap citations, resolved.**
- On main: ReductiveGroupsPartII RG2.0.1 (`README.md:463`, "the point topology") and RG2.3.7 (`:5201`, Lang's theorem); SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6, 4.12; ModularCurves §§0E–0F; LieGroups Layers 2, 7, 8 (`RepresentationTheory/LieGroups`); DGFloer Layer 1; SmoothBundlesConnections B1.0, B1.1, B1.4; GroebnerGeometry G5; IntegralLattices; LieHighestWeight Layers 3–4 and 7; ReflectionInvariantTheory; NilpotentOrbits; CFSGStatement; InductionRestriction.
- At open heads: AdelicAlgebraicGroups AA.3.1 (#792, `README.md:207`); ComplexComparisonPartII C-1.1 (#848, `README.md:30`, `:112`, `:149`). Both are named here as consumers only.
- `roadmaps resolve` finds no cross-roadmap citation missing; the overlap index lists no id dropped by another pull request and no id defined only by an open revision.
- RG2.0.1 on main states `isOpenEmbedding_affineOpen` and the other general-`R` comparisons as its own targets and does not cite this roadmap's §3A.5; CCPII C-1.1 at #848 does not cite it either. Both are later in the supply order (consumers), so ownership stays here and their citations belong to their own pull requests, as the previous review's repair said.

**Seeded sample.**
- **1.1 Rational cohomology and algebraic induction** (`jantzen-1985`, printed page = PDF page − 5): §2.8, the comodule map, line 1100, p. 36; "We assume from 3.2 on that G is a flat k-group scheme", line 1487, matching the README's flat Hopf algebras; §3.3 induction as `(M ⊗ k[G])^H`, line 1507, p. 52, with §3.8 opening at line 1647, p. 58, so §§3.3–3.7 are pp. 52–58; §3.9 injectives and `I ⊗ k[G]`, line 1688, p. 60, part b) the embedding into an injective; §4.2 line 1923, p. 69; §4.7 Lemma a) line 2001, p. 73; §4.14 the Hochschild complex `M ⊗ k[G]^⊗n`, line 2102, p. 77; §4.16 lines 2136–2159, pp. 79–79a. The README's statements (enough injectives by `I ⊗ H`, cofree resolution, cotensor induction with reciprocity) are what these sections state, at the generality "flat `k`-group scheme over a commutative ring".
- **8.1 Split reductive data.** `conrad-rgs` Definition 5.1.1, line 5651, p. 136: a reductive group over a non-empty `S`, a maximal torus `T ≃ D_S(M)`, roots and coroots constant sections of `M`, `M∨`, root spaces free of rank one, imposed even on disconnected `S` (lines 5661–5667). `README.md:2292–2298` restates it with "nonempty affine base" and "even on disconnected bases".
- **8.2 Pinnings.** `conrad-rgs` Definition 6.1.1, line 7725, p. 186: a positive system and trivializing sections of the simple root lines; Remark 6.1.2, line 7738, p. 186: over disconnected `S` a Borel containing `T` need not come from a constant `Φ⁺`. `README.md:2316–2319` and the `Spec(k×k)` Check at `:2330–2332` follow it. The remark ends on p. 186 (the page-187 marker is at line 7752), so "pp. 186–187" is one page generous; not a finding.

**Other locators checked this round** (Milne 2017, printed page = PDF page − 12): Theorem 5.34, line 4643, p. 107 (monomorphism iff closed immersion); Definition 17.15 and Theorem 17.16, lines 14605–14608, p. 356; Theorem 17.9, line 14525, p. 354, with the Borel-conjugacy proof via the fixed point on `G/B`; Corollary 22.43, line 19732, p. 478, with the averaging proof the README's route follows; Definition 17.95, Theorem 17.96 and Corollary 17.97, lines 15742–15767, pp. 382–383. Conrad, *Weil and Grothendieck approaches to adelic points*: Proposition 3.1 at line 168, p. 4 of the author's version: `R` local with `Rˣ` open and continuous inversion, `X` locally of finite type, functoriality, immersions, fibre products, Hausdorff for separated `X` when `R` is, locally compact when `R` is; its proof (lines 175–196) is the chart argument of `README.md:1005–1014`, with the covering of `X(R)` by charts needing `R` local. Conrad–Feng: Definition H.1.1, line 10356, p. 238; Proposition 12.3.1, line 5345, p. 127.

**Adversarial calculations** (values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `exists_conjugate_eq_of_isMaximalTorus` | `SL₂`/ℂ, `T` and `uTu⁻¹`, `u = [[1,1],[0,1]]` | `u·diag(t,t⁻¹)·u⁻¹ = [[t, t⁻¹−t],[0,t⁻¹]]`; `g = u` works | Pass |
| same, non-smooth | `GL₂ × μ_p` over `𝔽̄_p` | `G_red = GL₂ × 1`; tori are `T × 1`; `diag` vs `[[a,b],[b,a]]` conjugate by `[[1,1],[1,−1]]` (`p ≠ 2`), by `[[1,1],[0,1]]`-type element for `p = 2` | Pass |
| same, disconnected and trivial | constant `S₃`; trivial group; `𝔾_a` | only torus trivial: `I = J` = augmentation ideal, `g = 1`, `I.conjugate 1 = I` | Pass |
| same, negative control | `SL₂`/ℝ, diagonal `T` vs `SO₂` | `T(ℝ)` unbounded, `SO₂(ℝ)` compact: not conjugate; excluded by `[IsAlgClosed k]` | Pass |
| same, hypothesis is "torus" | `PGL₂`, `V₄` vs `T` (char ≠ 2) | `V₄` has three elements of order 2, `𝔾_m` has one: `V₄` is in no torus, so `IsMaximalTorus` rejects it; both self-centralizing, dims 0 and 1 | Pass |
| pinned `hcontainI` reading | `GL₂`, `D = T`, `I` = ideal of `uTu⁻¹` | `D.conjugate u ≤ I` says `uTu⁻¹ ⊆ uDu⁻¹`: equality, so the hypothesis holds with `g = u` | Pass |
| Milne 16.33(d) in Layer 5 | `B ⊂ GL₂`, `μ₂ = {±1}`, `T`, `uTu⁻¹` | `μ₂` central, already in `T`; `uTu⁻¹ = u·T·u⁻¹` with `u ∈ U(k)` | Pass |
| §3A.5 chart open embedding, general `R` | `R = ℤ_p`, `D(t) ⊂ 𝔸¹` | `D(t)(ℤ_p) = ℤ_pˣ = ℤ_p ∖ pℤ_p`, open; `t ↦ p` outside | Pass |
| §3A.5 negative control | indiscrete field `R` | units `R ∖ {0}` not open; `D(t)(R) → R` not open; inversion continuous (indiscrete) | Pass |
| §3A.5 local compactness | discrete field `R`; `Spec k[t₁,t₂,…]` | `X(R)` discrete for `X` locally finite type; `R^ℕ` product topology not discrete | Pass |
| §3A.5 separated ⇒ Hausdorff | `𝔸¹`; doubled-origin line | `ℂ` Hausdorff; the two origins have no disjoint neighbourhoods | Pass |
| §1.1 inverse direction | weight-one line of `𝔾_m`/ℤ, universal point `id` | `id` acts on `ℤ[t,t⁻¹] ⊗ M` by `1 ↦ 1 ⊗ t`, the coaction; `2 ∈ ℚˣ` acts by `2`, `3·2 = 6` | Pass |
| §1.1 Hochschild | `ℤ[t,t⁻¹]`, weight one | `d⁰(1) = 1⊗(t−1)`; `d¹(t−1) = t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1 = 0` | Pass |
| §1.1 pinned induction | `C₂ ⊂ S₃`, trivial coefficients | equalizer rank `3 = |S₃/C₂|`; pinned `inducedEquiv` forward = composite with counit evaluation | Pass |
| 7f fixed-coset identity | `S₃`, `H = ⟨(12)⟩`, `g = (12)`; `g = 1` | `g` fixes `H`, swaps `(13)H ↔ (23)H`: `1·2 = 2 = 2·1`; `3·2 = 6·1` | Pass |
| 7f worked example | `GL₃(𝔽₂)` | order `168`; `7` lines, `7` planes; `|P| = |Q| = 24`; pinned almost-conjugate, non-conjugate for `card n ≥ 3` | Pass |
| 7a Lang | `𝔾_a`/𝔽₂, `θ² + θ + 1 = 0`; `𝔾_m`; `SL₂` | `θ² − θ = 1`; `θ⁻¹θ² = θ`; `|SL₂(𝔽₃)| = 24`, `|B⁺(𝔽₃)| = 6`, `24/6 = 4 = |ℙ¹(𝔽₃)|` | Pass |
| 7a fixed-coset lifting control | `H = 𝔽̄_qˣ`, `q` odd, `J = {±1}` | `(±1)^(q−1) = 1`, misses `−1`; `a^(q−1) = −1`: `σ(a) = −a`, coset `{a,−a}` has no fixed point | Pass |
| `linearlyReductive_iff_reductive_identityComponent` | constant `ℤ/p`/𝔽_p (control) | `k[u]/(u^p)` indecomposable, LHS false; `G° = 1` reductive, RHS true; excluded by `[CharZero k]` | Pass |
| `linearlyReductive_iff_torus` | `μ_p`, `𝔾_m`, `SL₂` over `𝔽̄_p` | `μ_p` LR, not a torus, `hsm` fails; `𝔾_m` both; `SL₂` neither (`⟨x^p,y^p⟩ ⊂ R_p` uncomplemented) | Pass |
| `exists_levi_complement` | Borel `B ⊂ GL₂`/ℚ | `O(B)^U = ℚ[a^{±1},d^{±1}] → O(T)` bijective; `→ O(U)` not injective | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2`; ℤ/4 | `det ∅ − 1 = 0`; `x − 1`; `ad − bc − 1`; `[[1,1],[0,1]]⁻¹` upper-right `−1 = 3` | Pass |
| `halfTwist`, `plane_braid` | `n = 2`, `i = 0`, `t = 0, ½, 1` | `(0,1)`; `(½−I/2, ½+I/2)` counterclockwise; `(1,0)`; fixed point `2` at distance `3/2` for `n = 3` | Pass |
| `permutation_nonsplit` | `n = 2`; `n ≤ 1` | `B₂ = ℤ → C₂` by parity; a section needs `2m = 0`, `m` odd: impossible; `n ≤ 1` both trivial, excluded by `2 ≤ n` | Pass |
| §8.1 split datum | `SL₂` vs `PGL₂`; `SL₂/𝔽₂` | root `2ϖ` vs generator; centre `𝔽₂[t]/(t−1)²` of length 2 | Pass |
| §8.2 pinning | `x_α(t)` vs `x_α(2t)`/ℚ; `Spec(k×k)` | tangents `E₁₂` vs `2E₁₂`; `B⁺ ⊔ B⁻` gives signs `(+,−)` | Pass |
| §9A.1b fixed-dimension counts | `D₄` triality; `E₆` reversal | `24` roots: `6 + 3·6`, `12 + 2 = 14 = dim G₂`; `72` roots: `24 + 2·24`, `48 + 4 = 52 = dim F₄` | Pass |
| §9A.1b `A₂` exchange basis | `e = x_α + x_β`, `f = x_{−α} + x_{−β}`, `h = H_α + H_β` | `[e,f] = H_α + H_β` (`α−β` not a root); `[h,e] = (2−1)x_α + (−1+2)x_β = e`; frame `E = e, F = 2f, H = 2h` has index `4` | Pass |
| §10C digit formula | `SL₂`, char 3, `n = 4`; char 2, `n = 2` | `4 = 1 + 1·3`: `dim L(4) = 2·2 = 4`, socle `x⁴, x³y, xy³, y⁴`; `2 = 0 + 1·2`: `dim L(2) = 2`, span `x², y²` | Pass |
| §10B Steinberg | `SL₂`, `p = 2, 3` | `dim = p^1 = 2, 3`; `PGL₂`: `ρ = α/2 ∉ X` | Pass |
| §9B.1 charts | `SL₂(ℤ/4)`, `[[0,1],[3,0]]`; `[[2,1],[3,2]]`/ℤ | `x_α(1)x_{−α}(−1)x_α(1) = [[0,1],[−1,0]] ≡ [[0,1],[3,0]]`, in `D(c)`; `det = 1`, `2, 3` non-units: no single chart | Pass |
| Layer 11 `𝔰𝔩₂` | `𝔱_reg = ℂ*`, `W = ℤ/2` | `B_W = ℂ*` via `t ↦ t²`; `X² − t²` has discriminant `4t²`; the loop `exp(2πis)` lifts to `exp(πis)`, ending at `−1` | Pass |
| old → new numbering | main's headings | 7g (main 968) → 9E; 8 (main 1023) → 9D; 9B bullets (main 1612, 1614) → 8.1–8.2 | Pass |

## Not verifiable

- Cited by locator only (uncertified or not cached): Waterhouse, Borel, Springer, Jantzen 2003 Part II §§3.18–3.19, Conrad–Gabber–Prasad, Lang 1956, Steinberg 1968, Howlett–Lehrer, Dipper–Du, Carter, Serre and Gassmann.
- Cached but in passages unchanged since earlier rounds and not re-read this round: SGA 1 XII, Riche, Gros–Kaneda, Brieskorn, Salvetti, Callegaro, Fox–Neuwirth, Fadell–Neuwirth, Birman–Brendle, Hedén, Dudas–Michel, Frenkel–Kac and McNinch.
- ComplexComparisonPartII #848 is not among the sibling checkouts this brief lists; I read it through `roadmaps grep` only. The heads of #1332, #1797, #1807, #1808 and #1854 were read only through the overlap index.
- Ownership against open pull requests was checked with the roadmaps tool for the point topology (ReductiveGroupsPartII on main, ComplexComparisonPartII #848), the maximal-torus and Levi statements (no open `Suggested.lean` declares `exists_conjugate_eq_of_isMaximalTorus` or a Levi-of-parabolic theorem on these carriers), and the closest roadmaps of the overlap index (GroupSchemesOverABase #1522, SchubertGeometry #1224, RootSystemsPartII #1731, ClassicalGroupsPartII #1492, AdelicAlgebraicGroups #792), whose scope statements were compared in the previous round and are unchanged.

## Source issues

- none
