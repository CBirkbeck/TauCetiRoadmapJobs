# Review of CotangentLagrangian (pull request #1651 at 8979daa)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

The three findings of the previous review are repaired (see "Previous findings"). The repair made the file state no theorem, on the grounds that every headline is either proved at the pin or not statable. That dichotomy does not hold at this pin:

- two C4 headlines are statable with native carriers and are absent (R01);
- the C3 generating-function theorems, listed as not statable, are stated and proved by the pinned Tau Ceti (R02);
- C1.3, C1.4 and C2.2 still state as targets results the pin proves, without citing them (R03).

## R01 (P2) — Relative Moser and Weinstein's neighborhood theorem are statable at the pins but absent

**Location:** `Suggested.lean:41`–43: "the C4 relative Moser and neighborhood-germ theorems: there is no carrier for a symplectomorphism germ along a submanifold or for a symplectic bundle isomorphism over an embedding". The README targets are `README.md:401`–403 (relative Moser) and `README.md:483`–485 (Weinstein).

**Claim:** the README states both theorems with neighborhoods, not germs: "there are neighborhoods and a diffeomorphism fixing Q pointwise which pulls one form back to the other". Neither needs a bundle isomorphism. The pin's own idiom for a symplectomorphism between open sets is a `Diffeomorph` between `TopologicalSpace.Opens` with a `TauCeti.SmoothForm.mpullback` equation. It is used in `TauCeti/Geometry/Symplectic/Cotangent/Bundle/Opens.lean:96` and `…/Bundle/Lift.lean:88`. So both headlines are statable from native carriers and this file's three abbreviations, with no new definition.

**Witness:** a scratch copy of `Suggested.lean` with the two theorems below elaborates with exit 0 and exactly two `sorry` warnings. `#check @` shows every binder in the elaborated types.

**Repair:** add `public import TauCeti.Geometry.Symplectic.Lagrangian.Embedding.Basic`, and after `canonicalForm`:

```lean
/-! ## C4: Relative symplectic germs -/

open TopologicalSpace in
/-- Relative Moser theorem (Cannas da Silva, Thm. 7.4): two symplectic forms that agree on
all ambient tangent spaces along a compact embedded submanifold are related by a
diffeomorphism of neighborhoods fixing the submanifold pointwise. -/
theorem exists_diffeomorph_opens_of_eq_along {F K Q : Type*} [NormedAddCommGroup F]
    [NormedSpace ℝ F] [TopologicalSpace K] {J : ModelWithCorners ℝ F K} [TopologicalSpace Q]
    [ChartedSpace K Q] [IsManifold J ∞ Q]
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    {σ₀ σ₁ : TauCeti.SmoothTwoForm I M} (h₀ : σ₀.IsSymplectic) (h₁ : σ₁.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    (hσ : ∀ q, σ₀.1 (i q) = σ₁.1 (i q)) :
    ∃ (U₀ U₁ : Opens M) (φ : U₀ ≃ₘ⟮I, I⟯ U₁),
      (∀ q, ∃ h : i q ∈ U₀, (φ ⟨i q, h⟩ : M) = i q) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : U₁ → M) contMDiff_subtype_val σ₁) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U₀ → M) contMDiff_subtype_val σ₀ := by
  sorry

open TopologicalSpace in
/-- Weinstein's Lagrangian neighborhood theorem (Cannas da Silva, Thm. 9.3): a compact
embedded Lagrangian has a neighborhood symplectomorphic to a neighborhood of the zero
section of its cotangent bundle, the Lagrangian going to the zero section. -/
theorem exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding {F K Q : Type*}
    [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
    [TopologicalSpace Q] [ChartedSpace K Q] [IsManifold J ∞ Q]
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {i : Q → M} (hi : hσ.isNondegenerate.IsLagrangianEmbedding J i) :
    ∃ (U : Opens M) (V : Opens (Cotangent J Q)) (φ : U ≃ₘ⟮I, cotangentModel J⟯ V),
      (∀ q, ∃ h : i q ∈ U,
        (φ ⟨i q, h⟩ : Cotangent J Q) = Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) q 0) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → Cotangent J Q) contMDiff_subtype_val
            (canonicalForm J)) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val σ := by
  sorry
```

Then:

- In the module docstring, replace "At these pins it states no theorem" by a sentence naming these two, and narrow the C4 bullet to the theorems that do need a missing carrier: the prescribed-derivative germ theorem and the symplectic and coisotropic neighborhood theorems (a smooth symplectic bundle isomorphism over an embedding, a presymplectic model).
- In `README.md`, give the two names in backticks at the relative Moser sentence (:401–403) and the Weinstein sentence (:485).
- The point-germ relative Darboux theorem (`README.md:420`–424) elaborates in the same idiom, with `TauCeti.SmoothForm.mpullback i hi.1.contMDiff σ₀ = … σ₁` as hypothesis and `∀ᶠ q in 𝓝 q₀, ∃ h : i q ∈ U₀, (φ ⟨i q, h⟩ : M) = i q` as the fixing clause (scratch file, exit 0). State it as well, or name in the docstring what it lacks.

The hypotheses are the README's conventions (`README.md:10`–13): finite-dimensional, boundaryless, Hausdorff, second countable, compact Q. Instances are in the table.

## R02 (P2) — The docstring says the C3 generating-function theorems cannot be stated; the pin states and proves them

**Location:** `Suggested.lean:38`–40: "the C3 generating-function symplectomorphisms, the C3.1 chain dictionary and the convex billiard map: there is no carrier for a symplectomorphism between open cotangent domains". The README targets are `README.md:252`–272.

**Claim:** `README.md:256` sets the generating-function charts "in open subsets of finite-dimensional vector spaces". In that model the pinned Tau Ceti defines the map generated by `S` and proves the C3 results, including both acceptance examples of `README.md:266`–270. The same class of defect as the `ω = −dλ` bullet of the previous review.

**Witness:** `TauCeti/Geometry/Symplectic/Cotangent/GeneratingFunction/Basic.lean:363` (`TauCeti.cotangentGeneratedMap`) and :535 (`TauCeti.eventually_strongDualCotangentSymplecticForm_fderiv_cotangentGeneratedMap`): near the source point the generated map preserves `ω`.

**Repair:** in the docstring, move the generating-function item to "Proved at the pins" with the names below. Keep as not statable only what is: the manifold-level relation on `Q×Q′`, the C3.1 chain dictionary for a specified symplectomorphism between open cotangent domains of a manifold, and the billiard map. In `README.md:252`–272, cite the names at the corresponding sentences, as C1.2 does, and keep as targets what the pin does not have (the manifold-level statement, the mixed Hessian as an intrinsic bilinear map on `T_qQ×T_QQ′`, the cotangent relation of `ℝ→ℝ/2πℤ`).

| README statement (C3) | Pinned declaration (`TauCeti/Geometry/Symplectic/Cotangent/GeneratingFunction/`) |
|---|---|
| relation `p=d_qS`, `P=−d_QS` | `TauCeti.cotangentGeneratingSource`, `cotangentGeneratingTarget` (`Basic.lean:106`, :110) |
| nondegenerate mixed Hessian ⇔ invertible source projection | `TauCeti.cotangentMixedHessian` (:260), `isInvertible_fderiv_cotangentGeneratingSource_iff` (:270) |
| local branch and generated map | `TauCeti.cotangentGeneratingBranch` (:355), `cotangentGeneratedMap` (:363) |
| the generated map preserves `ω` | `TauCeti.eventually_strongDualCotangentSymplecticForm_fderiv_cotangentGeneratedMap` (:535) |
| exact primitive `λ−φ*λ=d(S∘branch)` | `TauCeti.eventually_cotangentLiouvilleForm_sub_cotangentGeneratedMap` (:546) |
| local canonical transformation in finite dimension | `TauCeti.eventually_isInvertible_fderiv_cotangentGeneratedMap` (:560) |
| composition by stationary elimination | `TauCeti.exists_cotangentGeneratingComposition` (`Composition.lean:143`) |
| free particle `S=−‖q−Q‖²/(2t)` | `TauCeti.cotangentGeneratedMap_freeParticleGeneratingFunction_eventuallyEq` (`Basic.lean:695`) |
| oscillator, failure at `t∈πℤ` | `TauCeti.cotangentGeneratedMap_oscillatorGeneratingFunction_eventuallyEq` (`Oscillator.lean:189`), `not_isInvertible_oscillatorPositionProjection_iff` (:71) |
| families `S(q,Q,a)`, immersed Lagrangian | `TauCeti.isLagrangianImmersion_cotangentGeneratingSource_comp_coe` (`Family.lean:335`) |
| charts F₂, F₃, F₄ | `Legendre.lean`, `ThirdKind.lean`, `FourthKind.lean` (`cotangentLegendreChart`, `cotangentFourthKind`) |

## R03 (P3) — C1.3, C1.4 and C2.2 state as targets what the pinned Tau Ceti proves

**Location:** `README.md:18`–22: "Tau Ceti also proves the following, which this roadmap consumes by name and does not restate", followed by C1.2, C2, C2.1 and C4 only. `README.md:53`–60, 202–211, 213–217 and 232–237 then ask to "Prove" results the pin has.

**Claim:** what Tau Ceti states at the pin is cited, not restated. The README does this for C1.2 and leaves the neighbouring items as targets, and the docstring's "Proved at the pins" list has the same omissions.

**Witness:** `TauCeti/Geometry/Symplectic/Cotangent/Bundle/Lift.lean:88`, `Diffeomorph.mpullback_cotangent_symplecticForm`: the cotangent lift of a diffeomorphism pulls the canonical form back to the canonical form, which is `README.md:54`.

**Repair:** at each sentence below, cite the declaration by name ("is Tau Ceti's …; consume it"), extend the list of `README.md:18`–22 to C1.3, C1.4, C2.2 and C3, and add the same names to the docstring's "Proved at the pins" list. What the pin lacks stays a target (the general cotangent pullback relation, the two-point intersection for compact Q, the conormal as an embedded subbundle, Kodaira–Thurston).

| README statement | Pinned declaration (file under `TauCeti/Geometry/Symplectic/`) |
|---|---|
| C1.3: lift preserves λ and ω | `Diffeomorph.mpullback_cotangent_liouvilleForm`, `mpullback_cotangent_symplecticForm` (`Cotangent/Bundle/Lift.lean:69`, :88) |
| C1.4: `T*U ≅ π⁻¹(U)` with forms | `TauCeti.CotangentBundle.mpullback_restrictOpen_symplecticForm` (`Cotangent/Bundle/Opens.lean:96`) |
| C1.4: `T*(M×N)`, ω product | `TauCeti.CotangentBundle.mpullback_prodDiffeomorph_symplecticForm` (`Cotangent/Bundle/Prod.lean:181`) |
| C1.4: fibre translation, symplectic iff `dα=0` | `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm` (`Cotangent/Bundle/Fiberwise.lean:114`), `…_eq_self_iff` (:140) |
| C1.4: fibre negation | `TauCeti.CotangentBundle.mpullback_vectorBundleScalarDiffeomorph_symplecticForm` (:128) |
| C2.2: zero section exact Lagrangian | `TauCeti.CotangentBundle.isExactLagrangianMap_zeroSection` (`Cotangent/Bundle/Graph.lean:178`) |
| C2.2: graph of α Lagrangian iff `dα=0`; exact iff α exact | `TauCeti.CotangentBundle.isLagrangianMap_section_iff` (:107), `exists_isExactLagrangianMap_section_iff` (:160) |
| C2.2: conormal is exact Lagrangian | `TauCeti.CotangentBundle.isExactLagrangianMap_of_conormal` (`Cotangent/Bundle/Conormal.lean:109`) |
| C2.2: diffeomorphism has Lagrangian graph iff symplectic | `TauCeti.SmoothTwoForm.IsNondegenerate.isLagrangianEmbedding_graph_iff` (`Lagrangian/Embedding/Graph.lean:43`) |
| C2.2: Liouville field of `T*M` | `TauCeti.CotangentBundle.isLiouvilleVectorField_vectorBundleEulerField` (`Cotangent/Bundle/EulerField.lean:109`) |
| C2.2: λ-preserving diffeomorphisms are cotangent lifts | `Diffeomorph.existsUnique_cotangent_eq_of_mpullback_liouvilleForm` (`Cotangent/Bundle/Classification.lean:165`) |
| C2.2: closed nonexact torus graphs | `TauCeti.CotangentBundle.not_exists_isExactLagrangianMap_section_torusTimeForm` (`Cotangent/Bundle/Torus.lean:122`) |
| C2.2: `∓λ` on the cosphere bundle are contact | `TauCeti.CotangentBundle.isContactForm_mpullback_neg_liouvilleForm_cosphereBundle`, `isContactForm_mpullback_liouvilleForm_cosphereBundle` (`Cotangent/Bundle/ContactType.lean:98`, :115) |

## Previous findings

- **R01 (consumer break), repaired.** `Suggested.lean:72`–73 now reads `abbrev canonicalForm … := TauCeti.CotangentBundle.symplecticForm I M`, and `README.md:516`–526 gives the contract with the pinned names. `lake env lean` on `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean` (unchanged from main) exits 0, with only its own five `sorry` warnings (46, 57, 73, 94, 100).
- **R02 (`ω = −dλ` "not statable"), repaired.** The bullet is gone; `Suggested.lean:19`–20 cites `TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`.
- **R03 (eight headlines proved at the pin), repaired.** The eight theorems and `liouville`, `IsSmoothOneForm`, `IsLagrangianEmbedding`, `realify` are deleted; `Cotangent` is `TauCeti.CotangentBundle I M`; the imports are `Mathlib` and `Bundle.Liouville`; `README.md:31`–52, 66–70, 144–149, 188–192 and 425–432 cite the library names. The section ids C1–C4, C2.0 and C2.1 are kept.

## Verified sound

:robot: AI review. **Full review** of the folder at `8979daa`. No pull-request file was edited; every probe is a scratch copy.

**Scope and pins.** HEAD `8979daa4`, `origin/main` `8fe2a7be`. The prescribed exclusion diff prints nothing. Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` (manifest and package checkouts agree). The folder holds `README.md` and `Suggested.lean` only.

**Gate and dependency check.** The worker's gate reports every counter zero, `build=0`, `OK`. My literal run reports every content counter zero and `outside-folder=4`: the `ConvexityToric` and `IntegrableSystems` files, which the brief names as the pull request's own. The dependency check prints `depcheck: 234 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with no warning. The three elaborated types equal `signatures.md`; `canonicalForm` keeps `[IsManifold I ∞ M]`. There is no `sorry`, so no one-tactic probe applies; a scratch `example` proves `(canonicalForm (M := M) I).IsSymplectic` by `TauCeti.CotangentBundle.isSymplectic_symplecticForm`.

**Library declarations opened at the pin (65 by `#check`, exit 0, no error; 26 more by file and line).**
- Every Tau Ceti and Mathlib name backticked in the README resolves under the name written: the 12 cotangent-form names of C1.2 and the consumer contract; the two Lagrangian-embedding names; `Matrix.realify`, `realifyAlgHom`, `realify_injective`, `realify_conjTranspose`, `commute_J_realify`, `Matrix.GeneralLinearGroup.realify`; the five maximal-compactness names; the three path-connectedness names; the Witt extension; the eleven `SymplecticForm` names of C2; and the Mathlib names of C1, C2, C2.1 and C3.1.
- Statements compared with the README's prose:
  - `Matrix.realify` is `fromBlocks re (−im) im re` (`LinearAlgebra/Matrix/Realify.lean:103`).
  - `IsLagrangianEmbedding` is immersion, topological embedding and Lagrangian tangent images (`Lagrangian/Embedding/Basic.lean:47`).
  - `eq_inf_unitarySubgroup_of_isCompact_of_le` has exactly the hypotheses of `README.md:192`.
  - The Witt extension has `hdim`, `f : S ≃ₗ T` and `hω`, as `README.md:425`–432 says.
  - `inChartAt_symplecticForm_apply` has the chart-target hypothesis.
  - `Liouville.lean` assumes `[IsManifold I 2 M]`, then `∞`, and no `FiniteDimensional` or `Boundaryless`, as `README.md:51`–52 says.
- The 26 names of R02 and R03 were read in the source files: their object files are not built in this worktree.

**Sources (open copy of Cannas da Silva, author's page, revised January 2006; printed page = PDF page − 8).**
- Prop. 5.1, p. 29 (text line 1300): fixed points ↔ critical points of `ψ(x)=f(x,x)`; the proof's `dψ=(d_xf+d_yf)` is the README's formula.
- Prop. 5.2, p. 30 (line 1331), with its uniqueness hypothesis, and the exercise for the third iterate (line 1352).
- §5.2, pp. 30–32 (lines 1361–1418): period 1, `f=−|χ(x)−χ(y)|`, `∂_xf=v`, `∂_yf=−w`, the cyclic sum.
- Thm. 5.3, p. 32 (line 1420): area-preserving diffeomorphism of a finite-area manifold, as the README says.
- Thm. 6.5, p. 37; Prop. 6.8, p. 39; Thm. 7.4, p. 45; Thm. 8.1, p. 46; Thm. 8.4, p. 48; Thm. 8.6, p. 49; Thms. 9.1 and 9.3, p. 51; §§2.2–2.3, pp. 9–10; the §18.1 exercise, p. 106 (line 4266). All at the stated pages.
- Thm. 8.4 gives the Lagrangian case without a derivative prescription, as `README.md:449`–451 says; its proof (lines 2000–2005) uses a Whitney extension with prescribed `dh_p`, the step the README's tubular construction replaces.

**Cross-roadmap citations resolved (16).** On main `8fe2a7b`:
- HeegaardFloer F2.1 (`README.md:185`), F2.6h (:3320), F3 (:3476);
- DifferentialGeometry Layer 4 (:402), 5.4 (:524);
- LieGroups Layers 2, 7, 9 (:356, :787, :1199);
- SmoothBundlesConnections B1, B2, B6.1;
- GeometricTopology; ComplexKahlerGeometry; `Completed/UniversalCovers`;
- ContactGeometry CG1, CG4, CG5 (:59, :121, :150);
- HamiltonianReduction R1, R3 (:33, :187).

At this head: IntegrableSystems I5.2 (:534), which cites C3.1 back as its supplier (:544, :717). No gap is declared.

**Overlaps and ownership.** #1187 (pin bump) conflicts in this folder; the description's merge-order block states the order (this pull request, then #1187). No cited id is dropped and none of this roadmap's ids is dropped. `roadmaps grep` finds `Cotangent`, `cotangentModel` and `canonicalForm` declared only here (and on main in this folder), and no open roadmap stating relative Moser or Weinstein's theorem in Lean, so this roadmap is their owner.

**Adversarial table.** ω denotes `dq∧dp`, λ `p dq`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `canonicalForm` chart value | T*ℝ, `x=∂q=(1,0)`, `y=∂p=(0,1)` | `y.2 x.1 − x.2 y.1 = 1·1 − 0 = 1`; `−ω` gives −1, `2ω` gives 2 | sign pinned | none |
| `ω=−dλ` | λ = p dq | `−d(p dq) = −dp∧dq = dq∧dp` | agrees | none |
| `realify`, i ↦ J | `A = i·1` | re = 0, im = 1: `fromBlocks 0 (−1) 1 0 = Matrix.J` | README 142–145 agree | none |
| Liouville field (README 213–214) | `Z = p∂p` | `ι_Zω = −p dq = −λ`; flow `(q, eᵗp)`; `L_Zω = d(−λ) = ω` | holds | none |
| Fibre translation (README 59) | α = a(q) dq | `λ ↦ λ+π*α`, `ω ↦ ω−π*dα` | holds | none |
| Free particle (README 266) | `S=−(q−Q)²/(2t)` | `p=∂_qS=(Q−q)/t ⇒ Q=q+tp`; `P=−∂_QS=(Q−q)/t=p` | `(q,p)↦(q+tp,p)` | none |
| F₂ (README 267) | `F₂=qP+tP²/2` | `p=∂_qF₂=P`, `Q=∂_PF₂=q+tP`; t = 0 gives the identity | holds | none |
| Oscillator (README 269–270) | `S_t` | `Q=q cos t+p sin t`; `P=(Q cos t−q)/sin t=−q sin t+p cos t` | holds | none |
| Fixed points (Prop. 5.1) | `S=aqQ+bq²/2+cQ²/2` | `dψ=(2a+b+c)q`; `p=P` at `Q=q` reads `(a+b)q=−(a+c)q` | same equation | none |
| Chains, N = 2 | a = b = c = 1 | `φ=[[−1,1],[0,−1]]`, det 1, `φ²=[[1,−2],[0,1]]` fixes p = 0; critical: `q₁=−q₀`, covector `aq₁+bq₀=0` | same line | none |
| Chains, general quadratic | a, b, c | critical set nonzero iff `(b+c)²=4a²`; `tr φ=−(b+c)/a=±2` | agree | none |
| Billiards: generating signs | chord from s to t | `β̃*λ−λ=−dS=dℓ`; `u=s/L`, `p=Lv`: `p du=v ds` | holds | none |
| Billiards: circle | radius R | chord at angle θ = arccos v subtends 2θ: arc `2R arccos v`, w = v | README 362 | none |
| Billiards: N = 4 maximizer | circle | square `4√2R≈5.66R`; doubled diameter `8R` | doubled diameter, least period 2 | none |
| Billiard measure | `AddCircle L × (−1,1)` | `L·2=2L` | README 343 | none |
| Recurrence | point mass at 0 on ℝ, `f(0)=0`, `f(x)=x+1` otherwise; translation with Lebesgue | U = (0.5, 0.6) never returns in either | full support and finiteness both needed, both stated | none |
| Germ with prescribed derivative | `A=[[1,3],[0,1]]`, Q = q-axis | det 1; `A∂q=∂q`; `Φ(q,p)=(q+3p,p)`, `Φ*ω=ω`, `dΦ=A` | holds; non-symplectic A excluded by the converse | none |
| Witt extension hypotheses (README 431–432) | V = 0, W = ℝ²; f = 2·id on a plane | finranks 0 ≠ 2; `ω(2∂q,2∂p)=4≠1` | both needed | none |
| Killing form (README 194) | `sp(2n,ℝ)`, n = 1 | `(2n+2)tr(XY)=4tr(XY)`, the `sl₂` value | holds | none |
| Cosphere Reeb (README 234–236) | `H=‖p‖²/2`, `ι_Xω=dH` | `X=p∂q`; `λ(X)=‖p‖²=1` on `S*Q` | forward cogeodesic flow is Reeb for `+λ` | none |
| Consumer Checks (README 536–544) | translation, H = p | `σ(∂q,∂p)=1=dH(∂p)`; `2ω` gives 2 | discriminating | none |
| R01: relative Moser statement | Q = M compact; Q a point in ℝ², `σ₁=f·ω`, f(p) = 1; M of dimension 0; Q empty | `σ₀=σ₁`, φ = id; Darboux–Moser at p; trivial; `U₀=U₁=∅` | true in each | R01 |
| R01: Weinstein statement | zero section of `T*S¹`; Q empty; opposite sign of `ω_can` | φ = id; `U=V=∅`; fibre negation fixes the zero section and swaps the sign | true; sign immaterial | R01 |
| R01: elaboration | scratch copy of `Suggested.lean` plus the two theorems | exit 0, `sorry` warnings at 80 and 97; `#check @` shows all binders | statable | R01 |
| R01: relative Darboux | scratch statement | exit 0, one `sorry` warning | statable | R01 |
| R02: generated map | `Basic.lean:363`, :535, :560 | defined on `V × StrongDual ℝ V`; preserves ω near the source point; invertible derivative when finite-dimensional | docstring claim false | R02 |
| Previous R01: consumer | `HamiltonianReduction/Suggested.lean` | exit 0, five `sorry` warnings | repaired | none |
| Gate and depcheck | prescribed commands | content counters 0, `outside-folder=4` (authorized); 234 roadmaps, 2261 edges, 0 problems | pass | none |

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds* (1971), DOI prefix `10.1016`: paywalled, not fetched. It is cited by locator only; the open Cannas da Silva text supplies the checked neighborhood theorems.
- The 26 pinned declarations of R02 and R03 were not elaborated: twelve of their modules have no object file in this worktree. They were read at the pin, file and line.

## Source issues

- **Misprint** in Cannas da Silva, *Lectures on Symplectic Geometry* at §5.2, p. 32: the source says the cyclic sum of the generating function equals the sum of the side lengths; it should be minus that sum, since the generating function is minus the chord length; affects nothing.
