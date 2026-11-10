# Review of SmoothBundlesConnections (pull request #2127 at a9e4cd0)

**Verdict:** needs changes

This is a full review of the roadmap folder at `a9e4cd098e32a20ecdb6079ee5ff5c1841acce74`. The pins are unchanged since the previous review: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. All five findings are P3; none is blocking. The four findings of the previous review are repaired.

## Previous findings

| Previous | Passage at this head | Status |
|---|---|---|
| R01 (ℂP¹ planned on a hand-built quotient) | README 191–204: “Its carrier is Tau Ceti's `TauCeti.ComplexProjectiveSpace 1`”. README 611–630 adds the B1.4 target (quotient structure = real structure underlying the homogeneous-ratio atlas, by Meinrenken 1.21's uniqueness clause). README 763–774 reads the parametrizations as `affineParam 0`, `1`. The Tau Ceti row lists the ten declarations. Lines 204 and 2193 now restrict the exclusion to `Projectivization`. | Repaired |
| R02 (Hopf action direction) | README 611–614: “the left action `λ • z = λ⁻¹z` on `S³`, whose conversion `z·λ = (λ⁻¹)⁻¹z = λz` is the Hopf action”. Check at 676–682. `Suggested.lean` 25–27 names the action. | Repaired |
| R03 (consumer of the soft theorem; module form) | README 1684–1690 states the module form with Demailly (4.18)–(4.19). Scope 45–46 and Downstream consumers 2261–2262 name ComplexKahlerGeometry 2.5. Check at 1711–1714. | Repaired |
| R04 (`Homotopy.homologyMap_eq`; Layer 6 title) | README 1825: “`Homotopy.homologyMap_eq`”. `Suggested.lean` 185: “Layer 6: Circle bundles, integral classes, and flat ambiguity”. | Repaired |

## R01 (P3) — B2.2 plans continuous Gram–Schmidt frames and a Hermitian continuity class that Tau Ceti pins

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md`:
- 855–856: “Consume `IsContinuousRiemannianBundle`/`Bundle.ContinuousRiemannianMetric` in the real case; build their complex Hermitian counterparts and real-part comparison.”
- 882–884: “Build unitary local frames by Gram–Schmidt on `Bundle.Trivialization.localFrame` and prove smoothness for smooth metrics, continuity for continuous metrics.”

**Claim.** Two of these targets exist at the pin, over any `RCLike` field, and B2.2 neither cites them nor lists them in its *Needs:* line. B2.5 already consumes the same Tau Ceti development (`TauCeti.ContinuousFiberNorm`, `Bundle.Trivialization.orthonormalFrameBundle`), so the two subsections disagree on what is pinned.

**Witness.** `TauCeti/Topology/VectorBundle/GramSchmidt.lean`: `Bundle.Trivialization.orthonormalBasis` (`:142`), `Bundle.Trivialization.continuous_orthonormalBasis` (`:159`), `Module.Basis.exists_continuous_local_orthonormalBasis` (`:182`). `TauCeti/Topology/VectorBundle/Riemannian/Hermitian.lean:56`: `TauCeti.ContinuousFiberNorm`. All four elaborate with `#check`.

**Repair.**
- At 855–856 write: the Hermitian counterpart of the class `IsContinuousRiemannianBundle` is Tau Ceti's `TauCeti.ContinuousFiberNorm`, consumed. Keep as targets only the Hermitian counterpart of the data structure `Bundle.ContinuousRiemannianMetric` and the real-part comparison.
- At 882–884 write: continuous unitary local frames are Tau Ceti's `Bundle.Trivialization.orthonormalBasis`, continuous by `Bundle.Trivialization.continuous_orthonormalBasis`, applied on the metric-specific copy of the fibres that B2.3 already uses. Keep “prove smoothness for smooth metrics” as the target.
- Add the three Gram–Schmidt declarations to the Tau Ceti row and to B2.2's *Needs:* line.

Tested on B2.2's own Check (README 920–923): for the trivial rank-2 bundle and the model basis `(e₁, 2e₂)`, `orthonormalBasis` is normalized Gram–Schmidt of that family, `(e₁, e₂)`, the frame the Check says restores the isometry.

## R02 (P3) — B1.0 owns the pullback of the kernel bundle, which is one Mathlib instance

**Location.** README 26–28: “the transverse fibre product of smooth maps and the pullback of the kernel bundle of a submersion”. README 344: “Prove smooth pullback of this kernel bundle along smooth maps into X.” README 347–348: “Pullback of the kernel bundle along a smooth map is a smooth vector bundle”.

**Claim.** Tau Ceti makes the kernel fibres a `ContMDiffVectorBundle` (README 342). Mathlib's instance for pullbacks of smooth vector bundles then gives the target with no further argument, and no Hausdorff hypothesis.

**Witness.** `Mathlib/Geometry/Manifold/VectorBundle/Pullback.lean:39`, `ContMDiffVectorBundle.pullback`. In scratch, after binding the structures of `Manifold.IsSubmersion.contMDiffVectorBundle_ker_mfderiv`, the goal `ContMDiffVectorBundle ∞ (Fin (dim E − dim E'') → ℝ) (g *ᵖ fun x ↦ ker (mfderiv f x)) I'` closes by `infer_instance`.

**Repair.**
- Replace the sentence at 344 by: “Its pullback along a smooth map into X is a smooth vector bundle by Mathlib's `ContMDiffVectorBundle.pullback`.”
- Reduce the bullet at 347–348 to the part the instance does not state, if it is wanted: the pulled-back submersion-coordinate frames are smooth local frames of the pullback bundle.
- Drop “the pullback of the kernel bundle” from the owned list at 26–28, and add `ContMDiffVectorBundle.pullback` to the Mathlib row and to B1.0's *Needs:* line.

Tested on B1.0's Check (README 358–360): for `ℝ³ → ℝ` and the inclusion of the unit sphere, the instance gives the rank-two bundle with fibre `span(∂₂,∂₃)`, which differs from the tangent plane `span(∂₁,∂₃)` at `(0,1,0)`.

## R03 (P3) — `StdSimplex` is not a declaration at the pin

**Location.** README 1884–1885: “its identification `TauCeti.fullSimplexEquivStdSimplex` with `StdSimplex`”.

**Claim.** The Mathlib carrier is `Convexity.StdSimplex`. Tau Ceti's file writes the short name only under `open Convexity`.

**Witness.** `#check @StdSimplex` reports “Unknown identifier”; `#check @Convexity.StdSimplex` elaborates. `TauCeti/Geometry/Convex/FullSimplex.lean:39` has `open Convexity`, and `:86` states `fullSimplex p ≃ₜ StdSimplex ℝ (Fin (p + 1))`.

**Repair.** Write `Convexity.StdSimplex` at README 1885.

## R04 (P3) — The Tau Ceti row omits a declaration that B1.1 consumes; the description says the row is complete

**Location.** README 435 and 494 use `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul`. The Tau Ceti row (README 240) does not contain it. Description, **Suppliers**: “The Tau Ceti row of the supplier table lists every Tau Ceti declaration consumed, with its file.”

**Claim.** The supplier contract is the list of consumed declarations by name. One consumed Tau Ceti declaration is missing from it, so the description's sentence is not what the head shows.

**Witness.** The name occurs at README 435 and 494 only. It is declared at `TauCeti/Geometry/Lie/FundamentalVectorField.lean:316`, the file of `TauCeti.fundamentalVectorField`, which the row does list.

**Repair.** In the row, after `TauCeti.fundamentalVectorField`, add “and `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul` (`Geometry/Lie/FundamentalVectorField.lean`)”. The declarations of R01 go in the same row.

## R05 (P3) — The Demailly reference entry omits the two locators of the module form

**Location.** README 1688–1689 cites “Demailly, Chapter IV, Lemma (4.18) and Corollary (4.19), p. 205”. References, README 2306–2309, lists (4.9), (4.10), (4.12), (4.14) and (4.15) only.

**Claim.** Every other entry of the References lists each locator the text uses; this one lags the new citation.

**Witness.** `demailly-agbook` lines 10266–10272: Lemma (4.18) and Corollary (4.19), on the page headed 205 (page marker at line 10225; page 206 starts at line 10273).

**Repair.** In the Demailly entry, after “Theorem (4.15), p. 205”, add “Lemma (4.18) and Corollary (4.19), p. 205 (modules over a soft sheaf of rings)”.

## Verified sound

**Gate, dependency check, build.** My rerun of the gate printed every counter at 0 and `OK`; the worker's run adds `build=0`. The dependency check printed one line:

```text
depcheck: 228 roadmaps, 2062 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The pull request changes only `README.md` and `Suggested.lean` of this folder. `lake env lean` on `Suggested.lean` exits 0 with exactly seven `declaration uses 'sorry'` warnings (lines 82, 124, 157, 219, 226, 269, 283). The suppliers are DifferentialGeometry, LieGroups, AlgebraicTopology and the completed HopfRinow and UniversalCovers, all on main.

**Signatures.** `#check @` for all 13 declarations in one scratch file, compared with the README. Nothing changed since the previous head except the docstring and the section title.
- Both B1.4 theorems keep both models boundaryless, T2 and second countability on M and G, `LieGroup IG ∞`, `ProperSMul`, smoothness and freeness.
- Ehresmann keeps T2 and second countability on P and B, `ConnectedSpace B`, the submersion, properness, surjectivity and `b₀`.
- The good-cover theorems keep T2, `FiniteDimensional`, boundaryless, and second countability or `CompactSpace`.
- Acyclicity keeps `0 < n` and has no boundaryless binder, as README 1693–1694 says.

**Padding probe.** Every `sorry` replaced by `simp`, by `rfl` and by `infer_instance` in three scratch copies: 21 attempts, 21 errors. No library-match lead proves a headline.

**Headlines.** Stated: Ehresmann, the free proper quotient (submersion form and principal-bundle form), good covers, Čech coordinates, smooth acyclicity. Named as not statable with the missing carrier: the flat-bundle dictionary, Ambrose–Singer and reconstruction (holonomy and transport), the `L²` space, the Čech–de Rham–singular comparison, and the circle classification with Chern–Weil (`c₁`). A grep of the pinned Tau Ceti for holonomy, parallel transport, horizontal lifts, associated bundles, Hopf bundle, good covers and soft sheaves finds no carrier.

**Seeded sample.** Each target read at its locator this round.
- **Sheaves and exactness.** `demailly-agbook` lines 10196–10209 (p. 204): (4.9) soft means global sections map onto sections over closed sets; (4.10) flabby implies soft on paracompact spaces; (4.12) smooth functions are soft. Lines 10227–10232 (p. 205): (4.14) and (4.15). Lines 10266–10272 (p. 205): (4.18), (4.19). The README's neighbourhood form of softness agrees by Corollary (4.8), line 10194. `nicolaescu` lines 14776–14780 (printed p. 327) and 15623–15661 (pp. 350–351).
- **Native fixed-cover complex.** `stacks` lines 383–399 (Tag 01ED, pp. 9–10): ordered tuples, explicitly not alternating, differential (9.0.1). `meinrenken` lines 1420–1430 (Example 3.16, p. 36).
- **Augmentation.** `stacks` lines 407–414 (Lemma 9.2, Tag 01EG, p. 10) and 678–680 (Lemma 11.6, Tag 01ET, p. 15).
- **Raw refinement maps.** `stacks` lines 1066–1077 (Tag 09UY, p. 24). The README's `T_s−T_r=δh+hδ` is right (row 13); the source's sign is a misprint.
- **Coefficient maps.** `nicolaescu` lines 14747–14763 (Theorem 7.5.28, printed p. 326).

The README flags no locator as unverified. Also read: `meinrenken` lines 293–302 (Theorem 1.21, p. 10, with the uniqueness clause B1.4 uses), `kms` lines 4037–4054 (Lemma 10.3, p. 87) and 3583–3585 (Lemma 9.2).

**Adversarial table.** All values computed this round.

| # | Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hopf as an orbit bundle (B1.4, 611–614) | `λ•z=λz`; `λ•z=λ⁻¹z` | first converts to `z·λ=λ̄z`, field `−iz`, `ω=−1`; second to `z·λ=λz`, field `iz`, `ω=+1` | Direction pinned | none |
| 2 | `orbitFiber.rightAction` | elaborated | `op g • x = g⁻¹ • x` by `rfl`; on `Circle`, `ℂ`: `conj l * x` | Matches README 604 | none |
| 3 | `ℂP¹` carrier (Conventions) | n = 1 | `ComplexProjectiveSpace 1 = orbitRel.Quotient (sphere (0:ℂ) 1) S³` by `rfl` | Correct | none |
| 4 | Chart readings (Conventions) | `mk 1 v` | `affineChart 0 (mk 1 v) 0 = v₁/v₀` elaborates; `affineChart 1` reads `ratio 1 0 = v₀/v₁` | `z₂/z₁`, `z₁/z₂` | none |
| 5 | Transition (B1 Examples) | k=0, l=1 | `affineChart_transition` gives `insertNth 0 1 z 0 / insertNth 0 1 z 1 = 1/z`, proved in scratch | Correct | none |
| 6 | Real structure of the atlas (B1.4) | n = 1 | `IsManifold 𝓘(ℝ, Fin 1 → ℂ) ∞ (ComplexProjectiveSpace 1)` from `restrictScalars_of_ne_zero` elaborates | Correct | none |
| 7 | Submersion argument (B1.4 Check) | `[1:0]` | section sends `∂_u,∂_v` to `∂_(x₂),∂_(y₂)`; `d(z₂/z₁)` sends them to `1, i`; composite is the identity of ℂ; `f∘R_λ=f` moves it along orbits | Onto everywhere | none |
| 8 | Quotient orientation (B6.2) | `(1,0)` | `(∂x₁,∂x₂,∂y₂,∂y₁)` is a 3-cycle of `(∂x₁,∂y₁,∂x₂,∂y₂)`, even; with `X=−∂y₁` odd | `z↦[1:z]` positive | none |
| 9 | Hopf curvature (B6.2) | chart z | `2ρdρ=2r(1+r²)⁻²dr`; `2π∫₀^∞2r(1+r²)⁻²dr=2π`; Chern number 1 | Correct | none |
| 10 | Hopf cocycle (B1.3) | `s₀`, `s₁`, `w=1/z` | `s₁=(|z|/z,|z|)/√(1+|z|²)`; `s₀·λ=s₁` iff `λ=z̄/|z|` | Correct | none |
| 11 | Native differential (sample) | c=(2,5,7) | `δc₀₁=3`, `δc₀₂=5`, `δc₁₂=2`; `2−5+3=0`; `δc(a,a)=0` | Matches (9.0.1) | none |
| 12 | Augmentation (sample) | 3-arc cover of S¹, ℝ | `C⁰=ℝ³`, `C¹=ℝ³`, `C²=0`, rank `δ⁰=2`, `Ȟ¹=ℝ`; global sections have `H¹=0` | Not a quasi-isomorphism | none |
| 13 | Refinement homotopy (sample) | U=(X,X), V=(X), α=(2,5) | `hδα=(δα)_(0,1)=3=T_sα−T_rα=5−2`; Stacks' order gives −3 | README right | none |
| 14 | Coefficient maps (sample) | S², q=1 | `H¹((ℝ/ℤ)_const)=0`; `H¹(C∞(ℝ/ℤ))≅H²(S²;ℤ)=ℤ` | `H¹(j)` not iso, as stated | none |
| 15 | Sheaves and exactness (sample) | `z↦z` on S¹ | local logarithms exist; winding number 1 excludes a global one; kernel on ∅ is 0 | Stalk-exact only | none |
| 16 | Soft ⇒ `Sheaf.H=0` | constant ℝ on S¹, S={±1} | 0 on one arc, 1 on the other extends to no constant; `H¹=ℝ` | Consistent | none |
| 17 | Dimension shift | `0→F→I→Q→0` | `H¹(F)=coker(Γ(I)→Γ(Q))=0` by (4.14) at S=X; `Hⁿ⁺¹(F)≅Hⁿ(Q)`, Q soft | Route closes | none |
| 18 | Module form (B6.1) | Ω¹ on S¹; constant ℝ | `ψf` extended by 0 is global and equals f near S; `1·cos θ` not locally constant | Correct | none |
| 19 | `exists_freeProperQuotient_isSubmersion` | G=1; ℤ on ℝ; Circle on S³; M=∅, dim G=1 | dims `dim M`, 1, `3−1=2`, `0−1=0` in ℕ with empty quotient | Consistent | none |
| 20 | `exists_principalBundle_orbitFiber` | ℤ on ℝ | fibre over [0] is ℤ, `0·1=−1`, `φ⟨q,x⟩=x` | Consistent | none |
| 21 | Ehresmann (headline) | point base; `ℝ²∖0→ℝ`; base `ℝ⊔ℝ` | fibre P, φ identity; fibres with 2 and 1 components; fibres of 1 and 2 points | Hypotheses used | none |
| 22 | Converse (B1.1) | discrete ℝ on ℝ²; `x↦x³` | rank of Φ is 1 < 2; `dπ(0)=0`, `∛` not smooth | Hypotheses used | none |
| 23 | Conversion (B1.2) | S₃, g=(12), h=(23) | gh=(1 2 3), hg=(1 3 2); with inverses both sides `(1 3 2)•p` | Correct | none |
| 24 | Cocycle dictionary (B1.3) | `c i j=g_ji` | `c′ j i=h_i⁻¹c j i h_j`, so `g′_ij=h_i⁻¹g_ijh_j`; cocycle law relabels to `g_ijg_jk=g_ik` | Correct | none |
| 25 | Good covers | ℝⁿ; two-arc S¹; annulus | `ρ(0)x=0`, `ρ(1)x=x`; overlap has 2 components; π₁=ℤ | Consistent | none |
| 26 | Čech coordinates iff | empty overlap; (a,a) | `ℝ→0` not injective, intersection empty; `ℝ≅ℝ`, nonempty | Both directions | none |
| 27 | Acyclicity | S¹, n=1, n=0 | `H¹(C∞)=0`; `H⁰∋1≠0` | `0<n` used | none |
| 28 | `δ_sm(z↦z)=−e` | 3 arcs | crossing differences 0, 0, −1; `df=dθ/2π` integrates to 1 | Correct | none |
| 29 | Rank-one Chern–Weil | S²; T² | `4πc∈2πℤ` iff `c∈½ℤ`; `4π²c∈2πℤ` iff `2πc∈ℤ` | Correct | none |
| 30 | Flat dictionary, Ambrose–Singer, reconstruction | T²; Hopf; constant A | holonomies `exp(−2πia)`, `exp(−2πib)`; `Lie(H⁰)=ℝ`; `−∂_t exp(−tA(v))|₀=A(v)` | Consistent | none |
| 31 | Čech–singular evaluation | 3-arc S¹ | once around `1+0+0=1`; there and back `1−1=0` | Consistent | none |
| 32 | `ker(H²(ℤ)→H²(ℝ))` (B6.4) | H₁ finitely generated; H₁=ℚ | `Hom(H₂,ℤ)→Hom(H₂,ℝ)` injective, kernel `Ext(H₁,ℤ)`; `Ext(ℚ,ℤ)` torsion-free | Correct | none |
| 33 | Lens bundle map (B7) | `(vζ,ζ⁻¹λ)` | `([vζ],vζζ⁻¹λ)=([v],vλ)` | Well defined | none |
| 34 | ℂ-linear Hom; orthonormal frames (B2) | complex line over a point; `h=4u²` | real dims 4 vs 2; `4a²=1`, `a=±1/2` | Correct | none |
| 35 | Gram–Schmidt frames (B2.2) | `(e₁,2e₂)` | pinned `orthonormalBasis` gives `(e₁,e₂)` | Already pinned | R01 |
| 36 | Kernel-bundle pullback (B1.0) | S² ⊂ ℝ³ → ℝ | `infer_instance` closes it; fibre `span(∂₂,∂₃)` at `(0,1,0)` | Mathlib instance | R02 |
| 37 | `StdSimplex` | `#check` | unknown; `Convexity.StdSimplex` elaborates | Wrong name | R03 |

**Library declarations opened at the pins.** All 230 backticked identifiers of the README were resolved: the Mathlib ones by elaboration in one scratch file, the Tau Ceti ones in the pinned source, the ambiguous ones by `#check` against their modules. Only `StdSimplex` fails (R03).
- Mathlib: `ContMDiffVectorBundle.pullback` (`Geometry/Manifold/VectorBundle/Pullback.lean:39`), `SheafOfModules.toSheaf`, `smoothSheafCommRing` (a `TopCat.Sheaf CommRingCat`, so the forgetful functor of README 1685 is needed), `Circle.coe_inv_eq_conj`, `Homotopy.homologyMap_eq`, `exists_contMDiff_zero_iff_one_iff_of_isClosed` (σ-compact, T2, finite-dimensional).
- Tau Ceti, projective space: `ComplexProjectiveSpace` (`Topology/ComplexProjectiveSpace/Basic.lean:58`), `mk` (`n` explicit), `mk_eq_mk_iff`; `ratio` (`Charts.lean:40`, `v_j/v_k`), `affineParam` (`:120`), `affineChart` (`:166`), `affineChart_transition` (`:216`); `instChartedSpace` (`Geometry/Manifold/Instances/ComplexProjectiveSpace.lean:40`), `contDiffOn_affineChart_transition` (`:54`), `instIsManifold` (`:65`); `IsManifold.restrictScalars_of_ne_zero` (`Geometry/Manifold/Complex/Analytic.lean:115`).
- Tau Ceti, bundles: `TauCeti.PrincipalBundle.trivial`, `.pullback`, `TauCeti.ContMDiffFiberBundle.trivial`, `.pullback`, `TauCeti.ManifoldTotalSpace.homeomorph` (`Basic.lean:199`, from `TotalSpace` to the copy), `.contMDiff_proj`, `.isSubmersion_proj`, `ContMDiff.division` (`Principal.lean:199`), `ContMDiff.totalSpaceMk_smul` (`:154`), `Manifold.IsSubmersion.contMDiffVectorBundle_ker_mfderiv` (`Distribution/Submersion.lean:159`).
- Tau Ceti, sheaves: `TauCeti.Topology.isFlasque_of_injective` (`Topology/Sheaves/Flasque/Basic.lean:82`), `subsingleton_H_succ_of_isFlasque` (`:142`).
- Not findings: `TauCeti.exists_equivariant_contMDiff_chart` (`Geometry/Manifold/GroupAction/Linearization.lean:49`) is the finite-group case of B1.4's equivariant chart at a fixed point of a compact group, and `ProperSMul.exists_slice` (`Topology/Algebra/ProperAction/Slice.lean:92`) the discrete case of its slice theorem. Both are more special than the targets.

**Cross-roadmap citations resolved** on main (`4ec889e`).
- ComplexKahlerGeometry 7.1 (README 2733–2752 there) owns the comparison of `Projectivization` with `TauCeti.ComplexProjectiveSpace`, as README 69–73 here says. Its 2.5 (741–759) still reads “Prove fine-implies-acyclic”; ownership sits here because that roadmap consumes this one, and the consumer's wording is that roadmap's to change.
- RiemannianGeometry R3.3c (its line 1878) is the Hopf map `z ↦ ℂ·z` on the projective line of lines, as README 120–122 says.
- The worker's one unresolved lead, `SmoothSimplex.integral_mextDeriv`, is a DifferentialGeometry 8.4 target, cited as such.
- The overlap report lists no conflicting head, no dropped id and no id only a revision defines.

**Ownership.** `roadmaps grep` over main and the open heads for soft sheaves, fine-implies-acyclic, Ehresmann's theorem, smooth good covers, free proper quotients and Ambrose–Singer: every other hit consumes B1.4, B1.5 or B6.0; none owns them. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's.

## Not verifiable

- **Kobayashi–Nomizu I** (Ch. I §5; Ch. II §§1–9; Appendix 4). No legal copy is in the manifest or the sources cache. Not in the sample. The principal-bundle data it is cited for match `meinrenken` lines 296–302 and `kms` lines 4037–4054.
- **Lee**, *Introduction to Smooth Manifolds* and *Introduction to Riemannian Manifolds*. Paywalled; not in the sample; no finding depends on them.

## Source issues

- **Misprint** in stacks at Tag 09UY, §15, printed p. 24: the source says the first refinement map minus the second equals dh + hd for the displayed insertion homotopy; it should be the second minus the first, as `(2,5)` gives `hd = 3 = γ′ − γ`; affects the proof.
- **Gap** in kms at Lemma 10.3, proof, printed p. 87: the source says the map `(x,a) ↦ s_α(x)·a` obviously has invertible tangent map; it should prove that orbit maps of the free action are immersions and that `dim G` equals the fibre dimension, which needs G second countable; affects the proof.
- **Misprint** in nicolaescu at Theorem 7.5.28, sketch of proof, printed p. 326: the source ends the fixed-cover long exact sequence with `H^{q+1}(U, X)`; it should be `H^{q+1}(U, S_{−1})`; affects nothing.
