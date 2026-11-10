# Review of SmoothBundlesConnections (pull request #2127 at 9750fb8)

**Verdict:** needs changes

This is a full review of the roadmap folder at `9750fb864f93aeaeff0979ac8358c7cd47955533`. The pull request changes 46 lines of `TauCetiRoadmap/SmoothBundlesConnections/README.md`: the Conventions paragraph on the classical form, the B1.1 presentation theorem with three Checks, and the B1.4 and B2.5 sentences that use it. `Suggested.lean` is byte-identical to main, and nothing outside the folder changes. The previous review read the head of an earlier pull request at Tau Ceti `358314d`. Since then the pin has moved to Tau Ceti `2fd255d` (`lake-manifest.json`). Several of the roadmap's B1 targets are now pinned declarations, and several "not statable" claims in `Suggested.lean` are now false. These pin-driven findings come first because they touch the very paragraph this revision adds.

## Previous findings

The previous review (an acceptance) had no findings, so nothing needs checking finding by finding. The two Checks it confirmed as repaired are unchanged at this head and still read correctly. The first is B6.1, README 1686–1689: “the smooth function `z ↦ z` has `δ_sm(z ↦ z)=−e` … differences at the crossings are `0, 0, −1`”. The second is B5.0, README 1138–1143: “`ġ = dR_g(A(γ̇))` instead gives horizontality for the connection with potential `−A`”. Both are recomputed in rows 27 and 28 of the table.

## R01 (P2) — B1.0–B1.3 plan, and B1.1's new paragraph builds on, a smooth principal-bundle library that the pin already provides

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md` 325–331: “Define a smooth manifold-fibre bundle by smooth overlap maps on the product model … A principal-total-space type synonym carries the original total-space topology and this atlas, with the canonical homeomorphism to `Bundle.TotalSpace`.” The same applies to 335–338 (principal structure, division, local sections), 360–366 (descent, vertical distribution) and the new 351–353 (“the canonical homeomorphism from the principal-total-space synonym”). The Tau Ceti row at 207 names none of these.

**Claim.** These are B1.1 targets, but at the pin they are Tau Ceti declarations: the smooth manifold-fibre bundle, its type-copy total space and homeomorphism, the principal mixin, smooth division, trivializations from sections, descent, the submersion property, the vertical tangent space, equivariant equivalences, pullbacks and cocycle gluing. The roadmap restates them instead of citing them. The new presentation theorem names its carriers only by description. At the pin they are `TauCeti.ManifoldTotalSpace` and `TauCeti.ManifoldTotalSpace.homeomorph`.

**Witness.** `TauCeti.ContMDiffFiberBundle` (`TauCeti/Geometry/Manifold/FiberBundle/Basic.lean:122`), `TauCeti.ManifoldTotalSpace.homeomorph` (`:199`), `TauCeti.PrincipalBundle` (`TauCeti/Topology/FiberBundle/Principal.lean:156`), `ContMDiff.division` (`TauCeti/Geometry/Manifold/FiberBundle/Principal.lean:199`). The open SpinGeometry head already cites them as Tau Ceti's (its README 428–430).

**Repair.** Add to the Tau Ceti row and consume, with these exact names:
- From `Geometry/Manifold/FiberBundle/Basic.lean`: `TauCeti.ContMDiffFiberBundle` (:122), `TauCeti.ManifoldTotalSpace` (:189) with `TauCeti.ManifoldTotalSpace.homeomorph` (:199), `TauCeti.ManifoldTotalSpace.isManifold` (:502), `TauCeti.ManifoldTotalSpace.contMDiff_comp_proj_iff` (:422) and `TauCeti.ManifoldTotalSpace.existsUnique_contMDiff_comp_proj_eq` (:431).
- `TauCeti.ManifoldTotalSpace.isSubmersion_proj` (`Submersion.lean:71`).
- From `Topology/FiberBundle/Principal.lean`: `Bundle.Trivialization.IsEquivariant` and `TauCeti.PrincipalBundle` (:156), `TauCeti.PrincipalBundle.division` (:191), `TauCeti.PrincipalBundle.trivializationOfSection` (:363), `TauCeti.PrincipalBundle.trivial` (:239) and `TauCeti.PrincipalBundle.pullback` (:423).
- From `Geometry/Manifold/FiberBundle/Principal.lean`: `ContMDiff.totalSpaceMk_smul` (:154), `ContMDiff.division` (:199), `TauCeti.PrincipalBundle.contMDiffOn_trivializationOfSection` (:214), `TauCeti.PrincipalBundle.ker_mfderiv_proj_eq_range_mfderiv_totalSpaceMk_smul_one` (:371) and `TauCeti.PrincipalBundle.finrank_ker_mfderiv_proj` (:385).
- `TauCeti.PrincipalBundle.diffeomorphOfEquivariant` (`Principal/Equivariant.lean:93`).
- `TauCeti.ContMDiffFiberBundle.pullback` and `TauCeti.ManifoldTotalSpace.contMDiff_pullback_iff` (`Geometry/Manifold/FiberBundle/Pullback.lean:78`, `:121`).
- `TauCeti.fiberBundleCoreOfGroupCocycle` and `TauCeti.principalBundle_fiberBundleCoreOfGroupCocycle` (`Topology/FiberBundle/GroupCocycle.lean:90`, `:294`).
- `TauCeti.contMDiffFiberBundle_fiberBundleCoreOfGroupCocycle` and `TauCeti.diffeomorphOfCohomologous` (`Geometry/Manifold/FiberBundle/GroupCocycle.lean:78`, `:152`).

Then rewrite the first, second and fourth paragraphs of B1.1 so that they consume these. Keep as targets only what the pin lacks:
- `P ×_M P` as B1.0's transverse fibre product, with division smooth on it;
- the presentation theorem and its converse;
- whatever bundle-isomorphism API the pin lacks.

In the presentation paragraph, write `TauCeti.ManifoldTotalSpace G P_•` for "the principal-total-space synonym", `TauCeti.ManifoldTotalSpace.homeomorph` for "the canonical homeomorphism", and `TauCeti.PrincipalBundle` with `TauCeti.ContMDiffFiberBundle` for "a principal structure with smooth transition functions". In B1.2, consume the trivial and pullback bundles and keep products and the left-to-right conversion as targets. In B1.3, consume cocycle gluing and keep the converse and nonabelian Čech H¹. The pinned convention is `s j = s i • g i j` with cohomologous cocycle `h i⁻¹ * g i j * h j`, which matches README 151–152.

The DifferentialGeometry row at 208 also names pinned declarations as roadmap targets. DifferentialGeometry on main now cites them as Tau Ceti's (its README 419, 456, 745, 839). Move them to the Tau Ceti row with their `TauCeti.` names:
- `SmoothBundleForm` (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean:130`);
- `CurvatureForm` (`DifferentialForm/Curvature.lean:33`);
- `bracketWedge` (`TauCeti/Analysis/Normed/Module/Alternating/BracketWedge.lean:42`);
- `mextDeriv` (`DifferentialForm/ExtDeriv.lean:145`);
- `homotopyOperator` (`DifferentialForm/HomotopyOperator.lean:100`);
- `nonempty_contMDiffRiemannianMetric` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean:69`).

## R02 (P2) — `Suggested.lean` says headlines are not statable because carriers are missing, but the carriers are pinned and Ehresmann's theorem is statable

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean` 32–36: “the smooth manifold-fibre bundle and its compatible local-trivialization carrier are constructions of B1.1 and B1.5; the pins' topological `FiberBundle` does not include those data … the pins have no smooth principal-bundle/local-trivialization carrier.” The same problem is at 38–40 (“the pins have no differential forms on manifolds”), 48–49 (“lack the differential-form and de Rham cohomology carriers”) and 50–53.

**Claim.** Every carrier named as missing exists at the pin. Ehresmann's fibration theorem is a headline that is statable on them and is absent, as is the principal-bundle consequence of B1.4.

**Witness.** A scratch file stating Ehresmann's theorem as below, on `TauCeti.ContMDiffFiberBundle`, `TauCeti.ManifoldTotalSpace` and a `Diffeomorph` onto P, elaborated at the pins with exit 0 and only the `sorry` warning. Forms and de Rham cohomology are pinned: `TauCeti.mextDeriv` (`ExtDeriv.lean:145`), `TauCeti.deRhamCohomology` (`DeRham/Basic.lean:127`).

**Repair.** Add the headline below in B1.5's Lean section and name it in B1.5's prose. The comparison diffeomorphism forces the existential total-space topology to be that of P. The statement includes the base's connectedness and one fixed model fibre, as the README states. The degenerate case, a point base with a constant map, gives back P.

```lean
theorem exists_contMDiffFiberBundle_of_isProperMap
    {E EB H HB P B : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup EB] [NormedSpace ℝ EB] [FiniteDimensional ℝ EB]
    [TopologicalSpace H] [TopologicalSpace HB]
    (I : ModelWithCorners ℝ E H) (IB : ModelWithCorners ℝ EB HB)
    [I.Boundaryless] [IB.Boundaryless]
    [TopologicalSpace P] [ChartedSpace H P] [IsManifold I ∞ P]
    [T2Space P] [SecondCountableTopology P]
    [TopologicalSpace B] [ChartedSpace HB B] [IsManifold IB ∞ B]
    [T2Space B] [SecondCountableTopology B] [ConnectedSpace B]
    (π : P → B) (hπ : Manifold.IsSubmersion I IB ∞ π) (hproper : IsProperMap π)
    (hsurj : Function.Surjective π) (b₀ : B) :
    ∃ (_ : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ)
          {p : P // π p = b₀})
      (_ : TopologicalSpace
          (Bundle.TotalSpace {p : P // π p = b₀} fun b : B => {p : P // π p = b}))
      (_ : FiberBundle {p : P // π p = b₀} fun b : B => {p : P // π p = b}),
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ) ∞
        {p : P // π p = b₀} ∧
      TauCeti.ContMDiffFiberBundle ∞ {p : P // π p = b₀} (fun b : B => {p : P // π p = b}) IB
        𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ) ∧
      ∃ φ : Diffeomorph (IB.prod 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ)) I
          (TauCeti.ManifoldTotalSpace {p : P // π p = b₀} fun b : B => {p : P // π p = b}) P ∞,
        ∀ x, φ x = ((TauCeti.ManifoldTotalSpace.homeomorph _ _).symm x).2.1 := by
  sorry
```

It needs the single extra import `TauCeti.Geometry.Manifold.FiberBundle.Basic`. Treat B1.4's principal consequence the same way. Use an existential `FiberBundle` on `b ↦ {x // Quotient.mk'' x = b}`, the fibre action `x·g = g⁻¹ • x`, `TauCeti.PrincipalBundle` and `TauCeti.ContMDiffFiberBundle`, and an equivariant `Diffeomorph` of `TauCeti.ManifoldTotalSpace` onto M over the quotient. Alternatively, name in the docstring the exact piece that blocks it.

Correct the remaining reasons:
- B3–B5 lack a principal-connection and holonomy (horizontal-lift) carrier. Forms, `TauCeti.SmoothBundleForm`, `TauCeti.CurvatureForm` and `TauCeti.bracketWedge` are all pinned.
- B6.1's comparison lacks the integration map, DifferentialGeometry 8.4's de Rham homomorphism, but de Rham cohomology is pinned. So the Čech–de Rham half is statable on `TauCeti.deRhamCohomology` and the native Čech complex. State it, or say why it is not a headline.
- B6.2–B6.6 lack the first Chern class map. Delete “no principal-bundle structure on bundle data” and “no de Rham cohomology of manifolds”.

## R03 (P2) — The acyclicity headline is about derived `Sheaf.H`, but its route and locator prove only Čech vanishing, and the derived step has no owner here

**Location.** README 1422–1426: “Prove acyclicity of smooth real functions by partitions of unity: `subsingleton_H_smoothSheafAddCommGroup`, the sheaf cohomology `Sheaf.H` … vanishes in every positive degree (Nicolaescu, Example 7.5.31 and Proposition 7.5.32, p. 327”. At 1537–1538 the README calls the derived comparison “not needed here”. `Suggested.lean` 211–218.

**Claim.** Mathlib's `Sheaf.H` is an Ext group in the sheaf category. The H^q of Nicolaescu's Proposition 7.5.32 is Čech cohomology, a direct limit over covers. No target here, no named supplier and no pinned declaration supplies the passage from fine or soft to Ext-acyclic. On main, ComplexKahlerGeometry 2.5 owns “fine-implies-acyclic … using Mathlib's Ext-based sheaf cohomology carrier”, and that roadmap consumes this one (README 62–63).

**Witness.** `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57–58` defines `H n` as `Ext ((constantSheaf J AddCommGrpCat).obj ↧(ULift ℤ)) F n`. `nicolaescu` lines 14705–14709 define the H^q used at line 14779 as the colimit over covers. ComplexKahlerGeometry README 746–750.

**Repair.** Add a B6.1 target before the headline, and record that it moves down from ComplexKahlerGeometry 2.5, which then consumes it. The target: on a paracompact Hausdorff space, a soft sheaf of abelian groups (sections over closed sets extend) has `Sheaf.H` zero in positive degrees, and the sheaf of smooth real functions on the standing manifolds is soft. Cite `demailly-agbook` Ch. IV, Example (4.12), p. 204, for C∞ being soft on paracompact manifolds, and Theorem (4.15), p. 205, for soft implying acyclic; there the cohomology is defined by flabby resolutions (§3.A, p. 200). The route is dimension shifting along an injective resolution:
- injective sheaves are flasque, by the pinned `TauCeti.Topology.isFlasque_of_injective` (`TauCeti/Topology/Sheaves/Flasque/Basic.lean:82`);
- flasque sheaves are soft on paracompact spaces (Demailly (4.10));
- sections are surjective on a short exact sequence with soft kernel (Demailly (4.14), p. 205).

Keep Nicolaescu for the Čech form used by the good-cover comparison. On `S¹` both forms give `H¹(C∞)=0`, while the constant sheaf ℝ has `H¹=ℝ`.

## R04 (P2) — B2.5's new frame-bundle carrier ignores the pinned orthonormal frame bundle, and its complex Hom bundle is not a stated target

**Location.** README 847–851: “The total space of the frame bundle of E is the set of fibrewise invertible maps in the total space of B2.1's Hom bundle of linear maps `𝕜ⁿ → E_x`, a real smooth vector bundle also when `𝕜=ℂ` … no separate topology or atlas is built for frames.” Also 853–854 (orthogonal and unitary reductions) and the Check at 881–883.

**Claim.** The pin already has a frame-bundle carrier for exactly the orthogonal and unitary reductions, with its own topology and equivariant trivializations. The README neither cites it nor compares it with the new open-subset carrier, so B2.5 would build a second O(n)/U(n) frame bundle with a different topology. In addition, Mathlib's smooth Hom bundle is linear over the base field. Over a real base it is the ℝ-linear bundle, so "a real smooth vector bundle also when 𝕜=ℂ" claims a ℂ-linear Hom bundle that B2.1 never states.

**Witness.** The pin has `TauCeti.OrthonormalFrameBundle 𝕜 F E V` (`TauCeti/Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), with the topology of pointwise convergence (`:227`), equivariant trivializations (`:402`, `:499`) and `associatedHomeomorph` (`:564`). The open SpinGeometry head consumes it (its README 466, 1653). `Mathlib/Geometry/Manifold/VectorBundle/Hom.lean:126`.

**Repair.**
- Cite these under Tau Ceti and in B2.5.
- Add the target: for a bundle with fibre inner products, `(b, φ) ↦ φ` from `TauCeti.OrthonormalFrameBundle 𝕜 F E (EuclideanSpace 𝕜 (Fin n))` into the frame bundle is a homeomorphism onto the closed subset of fibrewise isometries, equivariant along `unitary ↪ GL_n(𝕜)`. The orthogonal and unitary reductions of B2.5 are then this pinned carrier, and its principal structure is a B1.1 presentation.
- Add the Check: over a point with rank-one fibre metric `h(u,u)=4u²`, the frames are `ℝ∖{0}` and the orthonormal frames are `{±1/2}`, closed in it, and both topologies on `{±1/2}` are discrete.
- For `𝕜=ℂ`, either state in B2.1 the ℂ-linear Hom bundle `ℂⁿ →L[ℂ] E_x` as a real smooth vector bundle, or take frames as the ℂ-linear invertible maps inside the real Hom bundle. For n=1 these are `ℂ∖{0}`, not `GL₂(ℝ)`.

## R05 (P3) — `exists_regularFiber_smoothEmbedding` is already proved at the pin

**Location.** `Suggested.lean` 69–91. README 236–237: “The headline `exists_regularFiber_smoothEmbedding` asserts the existence of a charted-space structure on it”.

**Claim.** The headline follows in one `exact` from a more general pinned theorem: padding.

**Witness.** In a scratch copy the body `exact TauCeti.exists_regularFiber_smoothEmbedding (by simp) hf BoundarylessManifold.isInteriorPoint hreg` closes it, with exit 0 and no `sorry` warning at the theorem. The pinned theorem (`TauCeti/Geometry/Manifold/RegularValue/ManifoldLevel.lean:257`) allows `C^m` and any interior value.

**Repair.** Delete the theorem from `Suggested.lean`. List `TauCeti.exists_regularFiber_smoothEmbedding` with `TauCeti.regularFiberChartedSpace`, `TauCeti.isManifold_regularFiber`, `TauCeti.isSmoothEmbedding_coe_regularFiber` and `TauCeti.range_mfderiv_coe_regularFiber` under Tau Ceti. Do the same for the kernel distribution, `Manifold.IsSubmersion.isContMDiffDistribution_ker_mfderiv` and `Manifold.IsSubmersion.contMDiffVectorBundle_ker_mfderiv` (`TauCeti/Geometry/Manifold/Distribution/Submersion.lean:138`, `:159`). Rewrite B1.0 and the ownership sentence at README 26–28 to consume them, keeping open restriction, the universal property, chart independence and the transverse fibre product as targets. Turn the first bullet of the module docstring into a pointer to the pinned theorem.

## R06 (P3) — The push gate fails: `letI` in two theorem signatures

**Location.** `Suggested.lean` 82 and 113, `letI := cs`.

**Claim.** Gate rule statement-hygiene, two hits, P3 each. The gate fails, so the roadmap cannot be accepted, even though the hits were on main before this revision.

**Witness.** `gate SmoothBundlesConnections: … statement-hygiene=2 … FAIL` (the worker's run and my rerun agree): “line 113: P3 `letI` in the signature of theorem `exists_freeProperQuotient_isSubmersion`”.

**Repair.** Write `∃ _ : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) (MulAction.orbitRel.Quotient G M), IsManifold … ∧ Manifold.IsSubmersion …`. In Lean 4, a bound variable of class type is a local instance, so the `letI` is unnecessary. This was tested: the line-113 theorem with this binder elaborates at the pins with only the `sorry` warning. After R05 deletes the line-69 theorem, only this hit remains.

## R07 (P3) — B1.4 applies B1.1's right-action presentation to a left action without the conversion, and its *Needs:* omits B1.2

**Location.** README 475–476: “the principal structure is B1.1's presentation of the given manifold M with its orbit projection”. README 488–489: “apply the free proper right H-action to construct G/H; prove G→G/H is a principal H-bundle, presented by the total space G through B1.1”. *Needs:* at 525.

**Claim.** The headline's action is a left `MulAction G M`. B1.1's presentation needs a right action (README 345). The G/H case feeds a right action into a theorem stated for left actions. The conversion `p·g = g⁻¹p` is B1.2's target (README 402–403), and B1.4 does not list B1.2.

**Witness.** Take S₃ acting on itself on the left. Without the inverse, `p·g := g • p` gives `(p·(12))·(23) = (1 3 2) • p` but `p·((12)(23)) = (1 2 3) • p`. With `g⁻¹ • p`, both sides equal `((12)(23))⁻¹ • p`.

**Repair.** In B1.4, write “for the right action `x·g = g⁻¹ • x` of B1.2” for the orbit projection, and “the left action `h • g = g h⁻¹`” where the headline is applied to G/H. Add B1.2 to B1.4's *Needs:*. Add the S₃ computation as a B1.2 Check.

## R08 (P3) — The converse route omits the immersion and dimension step, and no Check tests submersion or second countability

**Location.** README 355–357: “a surjective submersion with a smooth free right action whose orbits are exactly the fibres has such trivializations, the maps `(x,g) ↦ s(x)·g` for local sections s of π”. The API bullet at 376 drops “smooth”.

**Claim.** That `(x,g) ↦ s(x)·g` is a diffeomorphism needs the orbit maps to be immersions and `dim G` to equal the fibre dimension. The cited source asserts this as obvious. It is false without second countability of G. The API bullet's "free action" is also wrong for a continuous action.

**Witness.** Discrete ℝ acting on ℝ² by `(x,y)·g = (x,y+g)`: free, with orbits the fibres of the surjective submersion `(x,y) ↦ x`. Yet `(x,g) ↦ (x,g)` has rank 1 < 2, and the fibres ℝ are not discrete (`kms` lines 4043–4046).

**Repair.** Add to the route:
- the orbit map of a free smooth action has injective derivative, because by constant rank its kernel at 1 is the Lie algebra of the trivial stabilizer;
- a bijective immersion from the second-countable G onto the regular fibre of B1.0 is a diffeomorphism, the dimensions being equal by Sard.

Write “smooth free right action” in the API bullet. Add two Checks. First, the discrete-ℝ example, which the Conventions' second countability of structure groups excludes. Second, `x ↦ x³` on ℝ with the trivial group: the action is free, the orbits are the fibres and the map is surjective, but `d(x³)(0)=0` and the inverse `∛` is not smooth, so the submersion hypothesis is used.

## R09 (P3) — Two broken links, and a completed supplier cited as if it were an active roadmap

**Location.** README 56: “to [HopfRinow](../HopfRinow/README.md) (Layers 1–2)”. README 611: “[ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)”. README 211, the HopfRinow row.

**Claim.** HopfRinow is completed and lives under `Completed/` on main, so the relative link is broken. The ComplexKahlerGeometry anchor matches no heading and lands at the top of the file. A completed roadmap's layers are implemented in Tau Ceti and should be cited as the UniversalCovers row is.

**Witness.** `Completed/HopfRinow/README.md` exists on main and `TauCetiRoadmap/HopfRinow/README.md` does not. ComplexKahlerGeometry README 1438 has the heading “Layer 5: compact Hermitian elliptic theory and Serre duality (K5)”.

**Repair.** Link to `../../Completed/HopfRinow/README.md` and mark the row “HopfRinow (completed) … as implemented in Tau Ceti”, as in README 212. Use the anchor `#layer-5-compact-hermitian-elliptic-theory-and-serre-duality-k5`, or `#51-pointwise-algebra-densities-bundle-tests-and-distributions-k5a` for K5a itself (README 1440 of that file).

## Verified sound

**Gate, dependency check, build.** I reran the worker's gate and got the same summary: every counter 0 except `statement-hygiene=2`, `FAIL` (R06). The worker's run also has `build=0`. The dependency check, run exactly as the brief gives it, printed one line:

```text
depcheck: 229 roadmaps, 2124 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SmoothBundlesConnections'` is empty. The folder's other files (`PROGRESS.md`, `STATUS.md`, `metadata.toml`) are on main and unchanged. `lake env lean` on `Suggested.lean` exits 0 with exactly six `declaration uses 'sorry'` warnings (lines 69, 98, 155, 162, 205, 215) and nothing else.

**Signatures.** I compared the ten elaborated types in the worker's signature file with the README:
- the regular-fibre theorem keeps `Boundaryless`, `IsManifold I ∞`, finite dimension and surjective `mfderiv` on the fibre, with no T2;
- the quotient theorem keeps T2, second countability, `LieGroup`, `ProperSMul`, smoothness and freeness;
- both good-cover theorems keep T2 and second countability, or compactness;
- acyclicity keeps `0 < n` and has no boundaryless hypothesis. Mathlib's `SmoothPartitionOfUnity.exists_isSubordinate` (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:556`) needs none, as README 1427–1428 says.

No binder is lost. The entries “on” and “above,” in that file come from parsing the docstring, not from declarations.

**Padding probe.** I replaced every `sorry` in scratch copies by `simp`, `rfl` and `infer_instance` in turn. All 18 attempts fail. Only the regular-fibre theorem closes, by one `exact` of the pinned theorem (R05).

**Seeded sample.** All five targets were read at their locators in legal source-service copies.
- “Sheaves and exactness”: `nicolaescu` line 14776 (Example 7.5.31, p. 327: smooth forms, hence functions, are fine) and lines 14779–14780 (Proposition 7.5.32: fine over paracompact gives Čech `H^q=0`, q≥1), and lines 15623–15657 (Remark 8.2.2, pp. 350–351, the smooth exponential sequence). The locators are correct. The derived-cohomology gap is R03.
- “Native fixed-cover complex and the displayed coordinates”: `stacks` lines 383–399 (§9, Tag 01ED, pp. 9–10: all ordered tuples with repetitions, explicitly not alternating, with differential (9.0.1)), and `meinrenken` lines 1420–1430 (Example 3.16, p. 36: on a good cover, locally constant cochains are constants on nonempty intersections). Meinrenken indexes by `a₀ ≤ … ≤ a_k`. The README cites him only for the coordinates and uses the Stacks indexing for the complex, which is consistent.
- “Augmentation is a separate, conditional comparison”: `stacks` lines 407–414 (Lemma 9.2, Tag 01EG, p. 10: the degree-zero map is bijective for every cover exactly when F is a sheaf) and lines 678–683 (Lemma 11.6, Tag 01ET, p. 15: Čech equals derived only on covers acyclic on all intersections). Both support the README's caution.
- “Raw refinement maps and homotopies”: `stacks` lines 1066–1087 (Tag 09UY, p. 24, the insertion formula). The README's sign `T_s−T_r=δh+hδ` is correct and the source's sign is a misprint (Source issues, row 22 of the table).
- “Coefficient maps and the connecting morphism”: `nicolaescu` lines 14747–14763 (Theorem 7.5.28, printed p. 326: a short exact sequence of sheaves on a paracompact space gives a natural long exact sequence, with the connecting map built by lifting Čech cochains) and Remark 8.2.2.

The README flags no locator as unverified. The new B1.1 locator Kolář–Michor–Slovák Lemma 10.3 is at `kms` lines 4037–4054, printed p. 87. Its hypotheses are surjective submersion, free right action and orbits equal to fibres, as the README states (proof gap: R08 and Source issues). Meinrenken Theorem 1.21 is at `meinrenken` lines 293–300, p. 10.

**Adversarial table.** Rows 1–16 cover this revision and the findings, rows 17–26 the sampled targets and headlines, and rows 27–30 the carried Checks. All values were computed this round.

| # | Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Presentation theorem, transitions (B1.1, new) | equivariant ψ_U, ψ_V over U∩V | `ψ_V∘ψ_U⁻¹(x,g)=(x,h(x)g)` with `h(x)=pr₂ψ_V(ψ_U⁻¹(x,1))`, a composite of smooth maps; equivariance gives left multiplication | Smooth principal atlas follows | none |
| 2 | Presentation, degenerate cases | G trivial; M empty | G=1: π bijective local diffeomorphism, so a diffeomorphism and the trivial bundle; M=∅ forces P=∅ (cover of ∅) | True | none |
| 3 | Check: `P=M×G` comparison | x∈M, h∈G | fibre `{x}×G`; `⟨x,(x,h)⟩↦(x,h)`; `(x,h)·g=(x,hg)` on both sides | Correct | none |
| 4 | Check: squaring map with ℤ/2 | arcs U₀=S¹∖{1}, U₁=S¹∖{−1}, `s=e^{iθ/2}` | transition +1 on the upper overlap; on the lower `e^{i(θ−2π)/2}=−e^{iθ/2}`, so −1; total space connected, trivial bundle has two components | Nontrivial, agrees with the B1.3 Check | none |
| 5 | Check: `M×G×G`, G on last factor | G=ℤ/2 | fibre has 4 points; orbits `{(x,h,g),(x,h,g+1)}`, 2 per fibre | Not transitive; the orbit hypothesis is used | none |
| 6 | Converse (KMS 10.3) without second countability | discrete ℝ on ℝ² | free; orbits `{x}×ℝ` are the fibres; `(x,g)↦(x,g)` has rank 1 vs 2; ℝ connected vs discrete | Fails | R08 Check |
| 7 | Converse without submersion | `x↦x³`, G trivial | free, orbits are points; `d(x³)(0)=0`; `∛` not smooth at 0 | Not principal | R08 Check |
| 8 | B1.4 left-to-right conversion | S₃, g=(12), h=(23) | without inverse: `(1 3 2)•p` vs `(1 2 3)•p`; with `g⁻¹•p`: both `(gh)⁻¹•p` | Conversion needed | R07 |
| 9 | B2.5 frames as an open set (new) | rank 1 over a point, 𝕜=ℝ | Hom=ℝ, invertible ℝ∖{0} open, GL₁ free and transitive | Correct | none |
| 10 | B2.5 vs pinned orthonormal frames | `h(u,u)=4u²` | orthonormal `f(1)=±1/2`, closed in ℝ∖{0}; pointwise and subspace topologies both discrete | Comparison holds but is not stated | R04 |
| 11 | B2.5 for 𝕜=ℂ | n=1 | ℂ-linear invertible maps: ℂ∖{0}, connected; real Hom invertible: `GL₂(ℝ)`, two components | ℂ-linear bundle needed | R04 |
| 12 | Regular fibre (`Suggested.lean` 69) | f(x,y)=x, c=3; pinned theorem with m=∞ | fibre `{(3,y)}`, dimension 2−1=1; `1≤∞`; J boundaryless so c is interior; `IsRegularValue` unfolds to hreg | Proved at the pin | R05 |
| 13 | Ehresmann (B1.5) statability | point base with constant π; non-proper `ℝ²∖0→ℝ` | point base: `P≅pt×π⁻¹(b₀)`; non-proper: fibre over 0 has 2 components, over 1 has 1 | Statable on pinned carriers (elaborated) | R02 |
| 14 | Acyclicity (`Suggested.lean` 215), derived vs Čech | S¹, n=1 and n=0 | Čech and derived `H¹(C∞)=0`; constant ℝ gives `H¹=ℝ`; `H⁰(C∞)∋1≠0`, so `0<n` is used | True; route gap | R03 |
| 15 | Docstring "no differential forms" | pin | `TauCeti.mextDeriv` (ExtDeriv.lean:145), `TauCeti.deRhamCohomology` (DeRham/Basic.lean:127) exist | False | R02 |
| 16 | Gate repair `∃ _ :` | line-113 theorem | elaborates, one `sorry` warning, no linter warning | Works | R06 |
| 17 | Free proper quotient (98) | trivial G; ℤ on ℝ; Circle on S³; M=∅ with dim G=1 | dimensions dim M−0; 1−0=1; 3−1=2; 0−1=0 by natural subtraction | Consistent | none |
| 18 | Good covers (155/162) | empty manifold; ℝⁿ with `ρ(t)x` | empty index type covers ∅; `ρ(0)x=0`, `ρ(1)x=x`, `ρ(t)0=0` | Consistent | none |
| 19 | Čech coordinates (205) | i=(a,b) with U_a∩U_b=∅; i=(a,a) | ℝ→0 not injective, intersection empty: both false; U_a connected and nonempty: ℝ≅ℝ, both true | iff holds both ways | none |
| 20 | Sheaves and exactness (sample) | `t↦e^{2πit}`; z↦z on S¹ | kernel ℤ on connected opens, 0 on ∅; z↦z has a local log but winding 1, so no global lift | Stalk-exact, not section-surjective | none |
| 21 | Native differential (sample) | c=(2,5); (a,a); c₀₁=2, c₁₂=5, c₀₂=7 | δc(a,b)=3; δc(a,a)=0; δ on the triple 5−7+2=0 | Matches 01ED | none |
| 22 | Refinement homotopy (sample) | U=(X,X), V=(X), r:0↦0, s:0↦1, c=(2,5) | `hδ(c)=c₁−c₀=3=T_s−T_r`; Stacks' `γ−γ′=2−5=−3` | README right, source misprint | none |
| 23 | Augmentation (sample) | 3-arc good cover of S¹, constant ℝ | alternating C⁰=ℝ³, C¹=ℝ³, C²=0, rank δ⁰=2, so `Ȟ¹=ℝ`, while global sections have `H¹=0` | Not a quasi-isomorphism | none |
| 24 | Coefficient maps (sample) | S² in degree 1 | `H¹((ℝ/ℤ)_const)=0`; `H¹(C∞(ℝ/ℤ))≅H²(S²;ℤ)=ℤ` by acyclicity of C∞(ℝ); map 0→ℤ | Not an isomorphism, as stated | none |
| 25 | Hopf normalization (B6.2) | chart z, `F=2du∧dv/(1+r²)²` | `∫=4π∫₀^∞ r(1+r²)⁻²dr=2π`; quotient frame `(x₁,x₂,y₂,y₁)` is even, so positive | Chern number +1 | none |
| 26 | Rank-one Chern–Weil (B6.3) | `F=c·dvol` on S² | period 4πc; integral iff 4πc∈2πℤ; c=½ gives 1, c=⅓ gives ⅔ | Correct | none |
| 27 | B6.1 Check `δ_sm(z↦z)=−e` | 3 arcs, crossing lifts | 0+0+(−1)=−1; with lifts t+k, t+m, t+n: (m−k)+(n−m)+(k−1−n)=−1 | Correct | none |
| 28 | B5.0 group-equation Check | circle bundle over ℝ, `ω=dθ+dx` | θ(t)=t: `ω(ṗ)=2`; `(dθ−dx)(ṗ)=0`; `(−ω)(∂_θ)=−1` | Correct | none |
| 29 | Division order (B1.1 Check) | S₃, p=(12), q=(23) | `p⁻¹q=(1 2 3)`, `qp⁻¹=(1 3 2)`; `p(p⁻¹q)=q`, `p(qp⁻¹)=(1 3)≠q`; pinned `division_eq_of_mem_baseSet` reads `(e p).2⁻¹*(e q).2` | Agrees with the pin | none |
| 30 | Cocycle convention (B1.3 vs pin) | `s_j=s_i g_ij`, `s_i h_i` | README `h_i⁻¹g_ijh_j`; pin `h i⁻¹ * g i j * h j` with `g i j = c j i` | Same convention | none |

**Library declarations opened at the pins.** Mathlib (`1b1ccf4`):
- `CategoryTheory.Sheaf.H` (`Sites/SheafCohomology/Basic.lean:57`);
- `ContMDiffVectorBundle.continuousLinearMap` (`Geometry/Manifold/VectorBundle/Hom.lean:126`);
- `SmoothPartitionOfUnity.exists_isSubordinate` (`PartitionOfUnity.lean:556`);
- `BoundarylessManifold.isInteriorPoint` (`IsManifold/InteriorBoundary.lean:188`).

Tau Ceti (`2fd255d`):
- the forty or so declarations listed in R01, R02, R04 and R05, each opened at the cited line and its namespace checked;
- `TauCeti.IsRegularValue` (`Geometry/Manifold/RegularValue.lean:92`);
- `TauCeti.fundamentalVectorField` and `TauCeti.mlieBracket_fundamentalVectorField` (`Geometry/Lie/FundamentalVectorField.lean`);
- `TauCeti.Topology.isFlasque_of_injective` (`Topology/Sheaves/Flasque/Basic.lean:82`).

The pin has no good-cover, proper-quotient-manifold, associated-bundle, GL frame-bundle, `LpSection` or de Rham-to-singular integration declaration, so those targets stay.

**Cross-roadmap citations resolved.**
- DifferentialGeometry on main: §8.4 keeps `SmoothSimplex.integral_mextDeriv`, chain integration and the de Rham homomorphism as targets “cited as” those names (its README 2588–2606), so the worker's one unresolved lead is a valid citation. §12.1's metric is `TauCeti.nonempty_contMDiffRiemannianMetric` (its README 419).
- ComplexKahlerGeometry on main: 2.5 at 744–790, K5 at 1438, K5a at 1440, K7.1 at 2700, K7.2 at 2798.
- TopologicalSheafCohomology on main: its scope at 7–12.
- The supplied open SpinGeometry head: 426–434, 466, 1653.
- LieGroups (`RepresentationTheory/LieGroups`), AlgebraicTopology, `Completed/UniversalCovers` and every other relative link resolve, except the two in R09.

**Ownership.** A `roadmaps grep` over the 437 open heads and main for the new objects (KMS Lemma 10.3, "orbits are exactly the fibres", equivariant local products, frame bundles) finds no other owner of the presentation theorem or of the GL frame-bundle carrier. FourManifolds, GaugeQuiltFieldTheory, DGFloerPartII and SpinGeometry consume this roadmap's B2.5. The overlap report lists no conflicting head, no dropped id and no id defined only by a revision. Ownership against open pull requests whose files the brief does not supply was not checked beyond that grep.

## Not verifiable

- **kobayashi-nomizu**, Ch. I §5, the new B1.1 locator for the presentation data, together with the other Kobayashi–Nomizu locators. This round the source service resolved the citation only to a JSTOR review landing page and found no legal copy. The data the README lists match the definition that Meinrenken (`meinrenken` lines 296–300) and Kolář–Michor–Slovák (`kms` lines 4017–4034) give.
- **lee-sm** (Corollary 5.14, Proposition 5.38, Theorems 21.10, 21.17) and **lee-rm** (Lemma 6.16, Theorem 6.17): earlier rounds recorded them as paywalled or unavailable. They were not re-requested, and no finding depends on them.

## Source issues

- **Misprint** in stacks at Tag 09UY, §15, printed p. 24: the source says the insertion homotopy satisfies first refinement map minus second equals dh+hd; for that insertion order it should be second minus first, as `(2,5)` gives `hd=3=γ′−γ`; affects the proof.
- **Gap** in kms at Lemma 10.3, proof, printed p. 87: the source says the map `(x,a) ↦ s_α(x)·a` obviously has invertible tangent map; it should prove that orbit maps of a free action are immersions and that `dim G` equals the fibre dimension (Sard, second countability); affects the proof.
