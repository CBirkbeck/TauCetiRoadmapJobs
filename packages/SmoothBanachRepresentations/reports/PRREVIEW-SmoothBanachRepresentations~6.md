# Review of SmoothBanachRepresentations (pull request #1145 at 3823a08)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

:robot: Incremental AI re-review of the 49 lines changed since 22d2666 (the new §7.2a, the rewritten §7.3, §7.4 and §8.1 passages, the supplier contracts and the Phillips reference, and `smooth_inverse` without its orbit-continuity hypothesis). All three previous findings are repaired. One repair introduced a new blocking defect: §7.2a asks for agreement with a BanachSpaceTheory B4 comparison map that B4 does not state. One P3 note. The gate passes; the movable dependency check reports no problem.

## R01 (P2) — §7.2a cites B4 for a real-to-complex comparison that B4 does not state

**Location:** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:438`, “Prove that the balancing map agrees with B4's real-to-complex Banach comparison on Banach factors and that it is natural.”

**Claim:** BanachSpaceTheory B4 supplies a comparison between the real completed Banach projective tensor of two realified complex Banach spaces and the realification of their complex tensor, and §7.2a's balancing map is to be shown equal to it.

**Witness:** B4 on main (`TauCetiRoadmap/BanachSpaceTheory/README.md:167–254`) defines the projective and injective norms “over `ℝ` and `ℂ`” separately (:197), with functoriality, symmetry, associativity and “scalar-unit isometries” (:200, the identification `𝕜⊗̂E=E`). It states no map between a real tensor and a complex tensor, no realification and no complexification of tensors; the only realification in that roadmap is in B6's Grothendieck inequality (:397). So the target's second object does not exist where it is cited: an implementer looking for B4's comparison finds nothing to compare with.

**Repair:** Own the Banach case here. Replace the sentence by: “On complex Banach factors the balancing map is the continuous real-linear map from B4's real completed tensor of the realifications to the realification of B4's complex completed tensor induced by `(x,y)↦x⊗y`, through the Banach agreement proved above; prove it has the same kernel description and that it is natural.” Nothing else in B4 is needed.

**Repair test, on the instance that refuted the original:** `E=F=ℂ` are Banach; B4's real tensor of the realifications is `ℂ_ℝ⊗̂_ℝℂ_ℝ` of real dimension 4 and its complex tensor is `ℂ⊗̂_ℂℂ=ℂ` of real dimension 2; the map induced by `(x,y)↦xy` sends `i⊗1` and `1⊗i` to `i`, its kernel is spanned by `i⊗1−1⊗i` and `1⊗1+i⊗i`, and it is the §7.2a balancing map specialised to these factors, exactly the third Check at :448. No B4 map enters.

## R02 (P3) — The family index does not list the roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:13–` (“## The roadmaps”), the index this pull request owns together with the folder.

**Claim:** The index of the RepresentationTheory family lists its roadmaps.

**Witness:** Every other subfolder of the family (AdoIwasawa, CharacterTheory, ClassicalGroups, CompactGroups, InductionRestriction, LieGroups, LieHighestWeight, ModularInduction, QuiverRepresentations, RootSystems, SchurWeyl, SemisimpleAlgebras, SpinRepresentations) has an entry; SmoothBanachRepresentations has none, and the pull request's diff against `origin/main` touches only the two folder files. The entries for ModularInduction and AdoIwasawa were added by the pull requests that added those roadmaps.

**Repair:** Add one bullet in the same shape as its neighbours, linking `SmoothBanachRepresentations/README.md` and naming the content in a sentence (real and complex Banach smooth vectors, support-controlled Dixmier–Malliavin, exactness, tensors, spectral invariance). A note, not a blocker.

## Previous findings

- R01 — repaired: :9 and :64 now say “§7.2a owns the same construction for real spaces and the two scalar-comparison maps … as targets of this roadmap”; §7.2a at :430–449 states the real projective seminorm, Hausdorff completion, universal property, Fréchet completeness, Banach agreement, the complexification isomorphism and the balancing quotient, with an API paragraph and four Checks; every “Part II” mention and the slug are gone (grep finds none). The repair introduced this report's R01.
- R02 — repaired: §7.4 at :459 cites Phillips, Definition 2.2, p.274, Theorem 2.1, p.275, Theorem 2.2, p.277 for the one-parameter model and says “For the group the proofs are given here”, naming the route for each of the three claims; the reference at :522 resolves (see Verified sound).
- R03 — repaired: `Suggested.lean:180` no longer takes `hπ : HasContinuousOrbits π`; the docstring at :177 and the README at :489 (“needs no orbit-continuity hypothesis … `contDiffAt_ringInverse`”) say why.

## Verified sound

Head `3823a087be1246a4a62c7d9876cd57023fe5fa1b`, worktree clean; main is `929496d4`. The brief's outside-folder diff is empty; the diff against `origin/main` lists only `README.md` and `Suggested.lean` of the folder. No file was changed by this review.

### Gate, dependency direction and Lean

The worker's gate at this head passes every check (`build=0 OK`). Run again by this review, the gate's own depcheck prints `NOT IN ORDER: SmoothBanachRepresentations (insert it after its last supplier)`, which the brief says is not a defect; the movable check against the merge-order candidate, which lists this roadmap directly after AutomorphicFormsOnReductiveGroups (lines 63–64), printed exactly:

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All six `*Needs:*` lines of Layers 7–8 were read: they name this roadmap's layers, Mathlib and Tau Ceti declarations, BanachSpaceTheory B4, NoncommutativeGeometry N1 and N6 and BanachAlgebras A1–A2, all on main and earlier; §7.4's line says Phillips is a model, not a supplier; the new §7.2a line names only native declarations, `TauCeti.Complexification`, B4, N1 “as the complex construction compared with” and this roadmap's §7.2.

`lake env lean` on `Suggested.lean` elaborated in 4 s with exactly seven “declaration uses `sorry`” warnings and nothing else. A scratch copy with `#check @name` for all 12 declarations elaborated; the printed types agree with the worker's signature file and with the previous report's binder analysis; the only changed type is `smooth_inverse`, which now reads: for `[NormedRing A] [NormedAlgebra 𝕜 A] [NormedAlgebra ℝ A] [IsScalarTower ℝ 𝕜 A] [CompleteSpace A]`, a Lie group `G` (`LieGroup I ∞ G`, `T2Space G`, `BoundarylessManifold I G`, `FiniteDimensional ℝ V`), `π : ContRepresentation 𝕜 G A` with `π g 1 = 1` and `π g (a*b) = π g a * π g b`, and `a : Aˣ` with smooth orbit, the orbit of `↑a⁻¹` is smooth. It omits the measure-space binders (its statement has no integral) and keeps `CompleteSpace A`, which the README's route needs for `contDiffAt_ringInverse`. The README at :489 states the same generality (unital, complete, any action by algebra automorphisms). On the same copy `smooth_inverse` was tried with `simp` (no progress), `rfl` (fails), `infer_instance` (not a class), `simpa [IsSmoothLieVector] using ha` (type mismatch `↑a` versus `↑a⁻¹`) and `unfold; fun_prop` (not a `fun_prop` goal): not padding. No `set_option`, no sorry'd data, one `import Mathlib`, no `lemma`.

### Seeded source sample

The sample's targets outside the diff (0.1, 1.1, 1.2, 1.5, 2.1, 3.1–3.4, 4.1, 5.1, 6.1, 7.1) are unchanged since 22d2666 and were verified in the previous report's sample table; the previous report's rows stand. The changed targets were re-read:

| Target | Text and locator checked | Support and limits |
|---|---|---|
| 7.3 Smooth tensor comparison | NoncommutativeGeometry N1 main :84–92 (complex: :12 “Algebras are complex”); BanachSpaceTheory B4 main :167–254; §7.2a here | The complex supplier resolves; the real factors and scalar comparisons now resolve to §7.2a of this roadmap; B4 supplies the Banach tensor and universal property as cited at :62 and :453. |
| 7.4 Continuous contragredients | phillips1955 line 188 (Definition 2.2, printed p.274: the adjoint semigroup is the restriction of `T*(s)` to `X⁺`, the closure of the domain of `A*`); line 202–204 (Theorem 2.1, p.275: the adjoint semigroup has the same continuity class, and its generator is the largest restriction of `A*` with domain and range in `X⁺`); line 270–272 (Theorem 2.2, p.277: `X⁺` is the set of `x*` with `T*(s)x*→x*` as `s→0`); lines 160–163 (class C is strong continuity at 0, the strongly continuous case); line 198–199 (footnote: the `*` condition of Definition 2.1 holds automatically for class C) | Numbers and pages match the README. The README's hypothesis “strongly continuous one-parameter semigroup” is Phillips' class C, which satisfies the hypotheses of Theorems 2.1 and 2.2. Phillips' `X⁺` is defined by continuity at 0; with the semigroup law and local boundedness this is continuity on `[0,∞)`, the README's “norm-continuous adjoint orbits”. The group statements are proved by the route the README names (rows 7–9). |
| 7.2a (new) | Mathlib `exists_extension_of_le_sublinear` (`Mathlib/Analysis/Convex/Cone/Extension.lean:159`: a partial linear functional dominated by a positively homogeneous subadditive `N` extends with `g ≤ N`); `UniformSpace.Completion` (`Mathlib/Topology/UniformSpace/Completion.lean:291`); `TauCeti.Complexification` (`TauCeti/Analysis/Normed/Module/Complexification.lean:80`, `Module ℂ` instance at :141 for any real module, `equivProd` to `X × X` at :303, norm only for seminormed `X` at :176–268) | The Hahn–Banach form is the real one and applies to a seminorm (rows 1–2). The complexification's complex structure exists at the pin for a Fréchet space; the README supplies the product topology itself, as it says. Mathlib's completion already separates (it is `SeparationQuotient (CauchyFilter α)`), so the README's explicit separated quotient is redundant but correct. |
| 8.1 Inverse closure | Mathlib `contDiffAt_ringInverse` (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean:772`: `ContDiffAt 𝕜 n Ring.inverse x` for `x : Rˣ`, `[NormedRing R] [NormedAlgebra 𝕜 R] [HasSummableGeomSeries R]`; the instance from `CompleteSpace R` is `Mathlib/Analysis/SpecificLimits/Normed.lean:302`); `ContDiffAt.comp_contMDiffAt` (`Mathlib/Geometry/Manifold/ContMDiff/NormedSpace.lean:81`) | Both exist at the pin with the hypotheses the README states (“at every unit of a complete normed algebra”); the Lean carries `NormedAlgebra ℝ A` and `CompleteSpace A`, which is what the composition needs with `𝓘(ℝ, A)`. |

### Adversarial computations

Rows 1–70 of the previous report stand for the statements the diff leaves untouched; its rows 58, 60 and 68 are superseded by rows 4–6, 7–9 and 11 below.

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | §7.2a pure-tensor formula `π_(p,q)(x⊗y)=p(x)q(y)` | `≤` from the one-term representation. `≥`: with `f` on `span{x}`, `f(cx)=c·p(x)`, one has `f(cx)≤p(cx)` for every real `c` (for `c<0`, `c·p(x)≤|c|p(x)`), so `exists_extension_of_le_sublinear` gives `g≤p` on `E`, and then `|g|≤p` since `−g(y)=g(−y)≤p(y)`; same for `q`; `p(x)q(y)=f(x)g(y)=Σf(x_i)g(y_i)≤Σp(x_i)q(y_i)`. `p(x)=0`: `f=0` works. | Real Hahn–Banach suffices, as the README says; retain. |
| 2 | Seminorm `π_(0,q)` and the zero space | `p=0`: every representation costs `0`, `π_(0,q)≡0`, so `E⊗F` is not Hausdorff for the single pair; `E={0}`: `E⊗F=0`, completion `{0}`. | Fourth Check correct; the separated quotient (or Mathlib's separating completion) is needed; retain. |
| 3 | Check 2, `ℝ²⊗ℝ³` | Dimension `2·3=6`; `π(e₁⊗e₁)=‖e₁‖‖e₁‖=1` by row 1; `(e₁+e₂)⊗e₁−e₂⊗e₁` costs `√2·1+1·1=√2+1>1`. | Infimum, not one representation; retain. |
| 4 | Complexification map is complex-bilinear | Inverse map `(x+ix′, y+iy′)↦(x⊗y−x′⊗y′)⊗1+i(x⊗y′+x′⊗y)⊗1`. Scaling the first argument by `i` sends `(x,x′)↦(−x′,x)`, giving `−(x′⊗y+x⊗y′)+i(x⊗y−x′⊗y′)`; multiplying the original value by `i` gives `i(x⊗y−x′⊗y′)−(x⊗y′+x′⊗y)`: equal. It is the expansion of `(x+ix′)⊗(y+iy′)`. | Complex-bilinear; retain. |
| 5 | Both composites are the identity | Forward of `(x⊗y)⊗1` is `(x⊗1)⊗(y⊗1)`; inverse of that is `(x⊗y−0)⊗1+i·0=(x⊗y)⊗1`. Forward of the inverse of `(x+ix′)⊗(y+iy′)` is `(x⊗1)⊗(y⊗1)+i(x⊗1)⊗(y′⊗1)+i(x′⊗1)⊗(y⊗1)−(x′⊗1)⊗(y′⊗1)=(x⊗1+i·x′⊗1)⊗(y⊗1+i·y′⊗1)`. Check 1: `(1⊗1)⊗1↦1⊗1=1` in `ℂ`; a rescaling by `c≠1` gives `c`. | Isomorphism on dense spans, hence on completions; retain. |
| 6 | Balancing: complex seminorm is the quotient seminorm | A complex representation `t=Σx_i⊗y_i` is a real representation of a lift with the same cost `Σp(x_i)q(y_i)`, so `quotient ≤ π^ℂ`; a real representation of any lift maps to a complex representation of `t` with the same cost, so `π^ℂ ≤ quotient`. `E=F=ℂ`, `p=q=|·|`: `π^ℂ(1)=1`; lifts of `1∈ℂ⊗_ℂℂ` include `1⊗1` (cost 1) and `−i⊗i` (cost 1); kernel elements `i⊗1−1⊗i` and `1⊗1+i⊗i` span a 2-dimensional kernel, `4−2=2`. | Quotient map and kernel as in Check 3; retain. |
| 7 | §7.4 closedness of the norm-continuous dual subspace | `λ_n→λ` in `E′`; `‖λ_n∘π(g⁻¹)−λ∘π(g⁻¹)‖≤‖λ_n−λ‖·sup_{g∈K}‖π(g⁻¹)‖=C_K‖λ_n−λ‖` on compact `K` (Layer 0.1); a uniform-on-compacts limit of norm-continuous maps is norm continuous. `C(S¹)′`: `‖δ_z−δ₁‖=2` for `z≠1`, `δ₁` excluded; Haar measure constant orbit, included; `0` included. | Closed and invariant; retain. |
| 8 | Negative transpose | `π(t)x=e^tx`: `λ∘π(−t)=e^{−t}λ`, derivative at `0` is `−λ`, pairing `−λ(x)`; general: `d/dt|₀λ(π(exp(−tX))x)=−⟨λ,dπ(X)x⟩` for `x∈E¹`. | Sign as stated; retain. |
| 9 | Phillips hypotheses | README applies Theorems 2.1 and 2.2 to strongly continuous semigroups: Phillips' class C (line 162, `T(s)x→x` as `s→0`); Theorem 2.2 is stated for class `(0,A)*`, and footnote 4 (line 198) says the `*` condition is automatic for class C; class C is a subclass of `(0,A)` (lines 155–163). `X⁺` as the closure of `𝔇(A*)` (line 190) equals the norm-continuous orbits (line 270–277). | The source supports the three statements with the README's hypothesis; retain. |
| 10 | §7.2a completion of a quotient (metrizable) | Claimed only for metrizable `E` (Fréchet factors give a countable cofinal family, so `E⊗F` is metrizable). For metrizable `E` and a subspace `N`, the Hausdorff completion of `E/N` is `Ê/N̄`; so the balancing map is onto with kernel the closure of the span. Non-metrizable counterexamples exist, which is why the hypothesis is stated. | Hypothesis present; retain. |
| 11 | `smooth_inverse` without orbit continuity | `h1`, `hmul`: `π(g)a·π(g)(a⁻¹)=π(g)(aa⁻¹)=π(g)1=1` and symmetrically, so `π(g)a` is a unit with inverse `π(g)(a⁻¹)`; `g↦π(g)(a⁻¹)=Ring.inverse∘(g↦π(g)a)`, smooth at each `g` by `contDiffAt_ringInverse` at the unit `π(g)a` composed through `ContDiffAt.comp_contMDiffAt`. Discontinuous instance: swap on `ℂ×ℂ` along a discontinuous character, `a=(1,1)` constant orbit, `a⁻¹=(1,1)` smooth. Zero ring: `0` is a unit with inverse `0`, smooth. | True without `hπ`; matches README :489; retain. |
| 12 | §7.2a Banach agreement | For Banach `E,F` every continuous seminorm is `≤C‖·‖`, so `π_(p,q)≤CC′π_(‖·‖,‖·‖)`: the single pair is cofinal and the completion is B4's tensor (B4 :195–197 defines the same infimum). | Agreement with B4 for the real tensor holds; the real-to-complex clause is R01. |
| 13 | §7.3 suppliers after the rewrite | `𝕜=ℂ`: N1 main :86–92 (seminorms, completion, universal property, Fréchet, B4 agreement); `𝕜=ℝ`: §7.2a. Scalar comparisons: §7.2a. The old “Part II gap” is gone from :9, :64, :453, :455, :478. | Every input is owned; retain. |

### Ownership of the real locally convex tensor

The roadmap grep over the 440 open heads and main for “locally convex projective tensor”, “completed projective tensor”, “projective seminorm”, “balancing map/quotient” and “complexification of … tensor” finds: NoncommutativeGeometry N1 on main (complex only); the open revision of NoncommutativeGeometry (N1.Tensor, real and complex), which is a revision of an existing roadmap and not a citable supplier; LocallyAnalyticDistributions, PadicLocalLanglandsForGL2Qp, CompletedCohomologyPartII and PadicFunctionalAnalysis (nonarchimedean); AutomorphicSpectralTheory §0.11, GanGrossPrasadUnitaryGroups and RefinedTraceMethods (consumers of N1 for complex spaces); and LocallyConvexDuality (open, design stage, not in the merge order), which consumes N1 “over ℝ and ℂ” and states “no second carrier is built”. No roadmap other than this one owns the real locally convex projective tensor or the scalar-comparison maps, so §7.2a's ownership is consistent. Two open roadmaps (LocallyConvexDuality and this one before the repair) read N1 as covering real scalars; N1 on main does not, which is why owning it here is right.

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| NoncommutativeGeometry N1 | main README:84–92, scope :12 | Complex construction; cited for complex factors only. |
| BanachSpaceTheory B4 | main README:167–254 | Real/complex Banach projective tensor and universal property present (:195–206); no real-to-complex comparison (R01). |
| §7.2 Fréchet open mapping theorem (internal) | README:426 | Owned here, cited by §7.2a; no cycle (§7.2 does not use §7.2a). |
| Phillips 1955 | sources cache (msp.org copy, 19 pages), lines 188, 202, 270 | Definition and theorem numbers and printed pages match. |
| AutomorphicFormsOnReductiveGroups §2.7, §0.1a, §2.1; CompactGroups Layer 5; LieGroups 0–3; OneParameterSemigroups Part A; BanachAlgebras A1–A2, A7; NoncommutativeGeometry N6 | unchanged since 22d2666 | Resolved in the previous report; not re-derived. |

Every backticked Lean name of this roadmap's own in the README (`HasContinuousOrbits`, `LieTestFunction`, `smooth_lift`, `smooth_inverse`, `isSmoothLieVector_smear`, `dense_smoothLieVectors`, `scalarParametrix`, `dixmierMalliavin`, `dixmierMalliavin_function`) is declared in `Suggested.lean`, and every Lean name appears in the README (the worker's resolve pass found none missing; confirmed). The headline inventory of the previous report is unchanged except that §7.3's supplier is now owned; §7.3's dense tensor comparison remains named in the docstring as not statable (locally convex tensor carrier), correctly.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Bull. Sci. Math. 102 (1978): no legal readable copy, as in the previous rounds; the README labels its locators uncertified and routes every claim through Casselman, whose text is in the sources cache. Nothing in the diff depends on it.
- The completed proofs of §7.2a (the finest-topology characterisation, the universal property and the completion-of-quotient lemma) were checked as routes with their hypotheses (rows 1–6, 10, 12), not as formal proofs.
- Ownership against open pull requests was checked through the roadmap tool's index and grep and the sibling checkouts the brief lists; the five board packages are arithmetic and logic packages whose contents were not fetched.

## Source issues

- none
