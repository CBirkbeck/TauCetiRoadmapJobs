# Review of SmoothBundlesConnections (pull request #2127 at ca84a4a)

**Verdict:** accepted

🤖 AI-assisted incremental re-review of 55 changed lines since a9e4cd0. No findings remain. This verdict concerns this folder's readiness for human final approval; it is not a pull-request approval.

The diff changes only `TauCetiRoadmap/SmoothBundlesConnections/README.md`; `Suggested.lean` and the library pins are unchanged. I checked the five repairs, the changed passages and their consumers, and reran the gate, dependency check, direct elaboration, declaration checks and padding probes. Untouched mathematics retains the evidence of [r9].

## Previous findings

- R01 — repaired: README 859–864 and 890–897 consume `TauCeti.ContinuousFiberNorm` and continuous Gram–Schmidt frames. The supplier row and Needs line name the declarations; Hermitian metric data, metric-copy compatibility and smoothness remain targets.
- R02 — repaired: README 26–28 and 344–351 consume `ContMDiffVectorBundle.pullback` and retain only smoothness of the pulled-back submersion-coordinate frames; the Mathlib contract and Needs line include the instance.
- R03 — repaired: README 1901 names Mathlib's `Convexity.StdSimplex` as the target of `TauCeti.fullSimplexEquivStdSimplex`.
- R04 — repaired: README 241 includes `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul` with its file. The description's Suppliers paragraph agrees with this addition.
- R05 — repaired: README 2325–2326 includes Demailly IV (4.18) and (4.19), printed p. 205, for modules over soft sheaves of rings.

## Verified sound

**Gate and elaboration.** The worker's gate at this head passes every check, including `build=0` for `lake build TauCetiRoadmap.SmoothBundlesConnections.Suggested`. My gate rerun returned every counter zero and `OK`. The separate dependency check returned:

```text
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Direct `lake env lean` on the requested module exited 0, with exactly seven warnings, all `declaration uses 'sorry'` (82, 124, 157, 219, 226, 269, 283). The PR has no changes outside this folder; the worktree remained clean. No new supplier, narrowed generality, sorry'd data, algorithm, source-derived organisation or prohibited Lean form was introduced.

**Signatures and padding.** A scratch copy with `#check @name` for all **13 actual declarations** elaborated successfully. The worker's extra supposed declaration `on` is text inside the module docstring, not Lean code. All seven theorem signatures retain their required hypotheses: both quotient statements retain both finite-dimensional boundaryless models, Hausdorffness, second countability, smoothness, properness and freeness; Ehresmann retains properness, surjectivity, connectedness and the chosen base point; the good-cover statements retain their respective countability/compactness assumptions; acyclicity retains positive degree. No signature changed. A separate scratch copy tried `solve | simp | rfl | infer_instance` at each of the seven holes: all seven fail, so none of those 21 one-tactic attempts proves a headline. The unchanged exact-library-lemma comparison is carried from [r9].

**Headline coverage.** The README's headlines remain free proper quotients and their principal-bundle presentation, Ehresmann, the flat-bundle representation dictionary, Ambrose–Singer, reconstruction from parallel transport, finite-rank L² sections, good covers, the specified Čech–de Rham–singular comparison, and circle classification with Hopf normalization, rank-one Chern–Weil and flat ambiguity. The seven Lean theorems state the quotient and Ehresmann results, both good-cover existence forms, native Čech coordinates and smooth-sheaf acyclicity. The module docstring still identifies the missing transport/holonomy, section-Hilbert-space, comparison-map and Chern-class carriers for the other headlines. The repairs add no Lean surrogate.

**Pinned declarations inspected.** Mathlib is pinned at `1b1ccf4`, Tau Ceti at `2fd255d`.

- `Mathlib/Geometry/Manifold/VectorBundle/Pullback.lean:27–46`: `ContMDiffVectorBundle.pullback` takes an actual `ContMDiffMap` and a smooth vector bundle, with no Hausdorff assumption. Its transition functions are the original transitions composed with the base map. B1.0 now imports precisely this structure.
- `TauCeti/Topology/VectorBundle/Riemannian/Hermitian.lean:56–58`: `TauCeti.ContinuousFiberNorm` asserts continuity of the norm on the total space. It does not construct metric data. Its polarization result at 123–149 supplies continuity of inner products over an `RCLike` field. B2.2's finite-rank, positive-definite metric data and inherited topology supply the required setting.
- `TauCeti/Topology/VectorBundle/GramSchmidt.lean:33–38,137–188`: `Bundle.Trivialization.orthonormalBasis` (142), `continuous_orthonormalBasis` (159), and `Module.Basis.exists_continuous_local_orthonormalBasis` (182). They use a finite ordered model basis, linear trivializations and continuous fibre norm. The construction is defined on the trivialization's base set and normalizes the inverse images of the model basis. They assert continuity, not smoothness. This matches README 890–897 and the B2.5 consumer at 1074–1089.
- `TauCeti/Geometry/Convex/FullSimplex.lean:39,85–110`: `open Convexity` explains the short name inside that file; the actual target is `Convexity.StdSimplex ℝ (Fin (p+1))`. The coordinate formulas add the missing zeroth barycentric weight. Both `Convexity.StdSimplex` and the Mathlib pullback instance were additionally checked by Lean.
- `TauCeti/Geometry/Lie/FundamentalVectorField.lean:283–319`: the newly listed exponential-flow theorem describes `t ↦ mulInvariantExp (t • ξ) • x`. Its completeness, smooth-action, Lie-group, separation and boundaryless hypotheses are available in B1.1's finite-dimensional setting. This is a supplier-list repair, not a new flow theorem.

**Sources and seeded sample.** The only changed source entry is Demailly's. I reopened `demailly-agbook` lines 10225–10232 and 10258–10272: the page marker is 205, (4.18) concerns modules over a soft unital commutative ring sheaf, and (4.19) gives positive-degree vanishing for smooth-function modules on a paracompact differentiable manifold. It supports README 1700–1706. The stated cut-off/extension argument respects these hypotheses. No locator is newly flagged unverified.

The five seeded targets retain [r9]'s source checks: sheaves and exactness (Demailly IV (4.9)–(4.19), pp. 204–205, and Nicolaescu 7.5.31–32 / 8.2.2); native fixed-cover coordinates (Stacks Tag 01ED and Meinrenken Example 3.16); conditional augmentation (Tags 01EG, 01ET); refinement homotopies (Tag 09UY); coefficient maps (Nicolaescu 7.5.28). Their claims and signs are untouched. Demailly's repaired reference was checked afresh; their computed witnesses appear below.

**Ownership and citations.** The fresh citation resolver found no unresolved cross-roadmap citation. Its library lookup was unavailable in that invocation, so the pinned-file checks above supply that evidence. The worker's `SmoothSimplex.integral_mextDeriv` lead resolves to the explicitly retained citation name in `TauCetiRoadmap/DifferentialGeometry/README.md:2600`, §8.4; §8.3 at 2544–2588 also supplies the smooth-chain carrier and smoothing comparison used by the corrected simplex passage.

The five supplier roadmaps remain DifferentialGeometry, LieGroups, AlgebraicTopology, completed HopfRinow and completed UniversalCovers, all on main `4ec889e`, the same main revision used by [r9]. Their unchanged section contracts retain that review's mathematical comparison. I reread the changed *Needs:* lines and checked the B1.1, B2.3, B2.5 and B6.1 consumers. The metric-specific copy is the identity type transport with inherited topology described in B2.3, not an invocation of its later Riesz or L² conclusions.

The overlap data contain no conflicting head, dropped citation id or citation available only in an open revision. An object search with `roadmaps grep` across main and open heads for continuous fibre norms, local orthonormal bases and Gram–Schmidt found the relevant nearby claims. `TauCetiRoadmap/SpinGeometry/README.md:365–382` at #1674 consumes Tau Ceti's frame construction. `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2347–2354` on main uses Gram–Schmidt for its stronger normal-coframe first-derivative condition. Smooth frames are already within SmoothBundlesConnections on main (README 643); this revision removes the duplicate continuous construction and keeps that existing smooth target. It creates no new competing owner. The listed DifferentialGeometry/ComplexKahlerGeometry overlap revisions do not acquire a new dependency through these repairs.

**Adversarial table.** Rows 1–34 carry forward [r9]'s values for unchanged statements; their locators are those in that report. Rows 35–41 are fresh computations for the changed claims and their consumers. Row 12's finite complex is the alternating Čech model of the three-arc cover, not the raw repeated-tuple complex; its cohomology is the comparison witness.

| # | Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hopf as an orbit bundle (B1.4, 611–614) | `λ•z=λz`; `λ•z=λ⁻¹z` | first converts to `z·λ=λ̄z`, field `−iz`, `ω=−1`; second to `z·λ=λz`, field `iz`, `ω=+1` | Direction pinned | carried from [r9], row 1 |
| 2 | `orbitFiber.rightAction` | elaborated | `op g • x = g⁻¹ • x` by `rfl`; on `Circle`, `ℂ`: `conj l * x` | Matches README 604 | carried from [r9], row 2 |
| 3 | `ℂP¹` carrier (Conventions) | n = 1 | `ComplexProjectiveSpace 1 = orbitRel.Quotient (sphere (0:ℂ) 1) S³` by `rfl` | Correct | carried from [r9], row 3 |
| 4 | Chart readings (Conventions) | `mk 1 v` | `affineChart 0 (mk 1 v) 0 = v₁/v₀` elaborates; `affineChart 1` reads `ratio 1 0 = v₀/v₁` | `z₂/z₁`, `z₁/z₂` | carried from [r9], row 4 |
| 5 | Transition (B1 Examples) | k=0, l=1 | `affineChart_transition` gives `insertNth 0 1 z 0 / insertNth 0 1 z 1 = 1/z`, proved in scratch | Correct | carried from [r9], row 5 |
| 6 | Real structure of the atlas (B1.4) | n = 1 | `IsManifold 𝓘(ℝ, Fin 1 → ℂ) ∞ (ComplexProjectiveSpace 1)` from `restrictScalars_of_ne_zero` elaborates | Correct | carried from [r9], row 6 |
| 7 | Submersion argument (B1.4 Check) | `[1:0]` | section sends `∂_u,∂_v` to `∂_(x₂),∂_(y₂)`; `d(z₂/z₁)` sends them to `1, i`; composite is the identity of ℂ; `f∘R_λ=f` moves it along orbits | Onto everywhere | carried from [r9], row 7 |
| 8 | Quotient orientation (B6.2) | `(1,0)` | `(∂x₁,∂x₂,∂y₂,∂y₁)` is a 3-cycle of `(∂x₁,∂y₁,∂x₂,∂y₂)`, even; with `X=−∂y₁` odd | `z↦[1:z]` positive | carried from [r9], row 8 |
| 9 | Hopf curvature (B6.2) | chart z | `2ρdρ=2r(1+r²)⁻²dr`; `2π∫₀^∞2r(1+r²)⁻²dr=2π`; Chern number 1 | Correct | carried from [r9], row 9 |
| 10 | Hopf cocycle (B1.3) | `s₀`, `s₁`, `w=1/z` | `s₁=(|z|/z,|z|)/√(1+|z|²)`; `s₀·λ=s₁` iff `λ=z̄/|z|` | Correct | carried from [r9], row 10 |
| 11 | Native differential (sample) | c=(2,5,7) | `δc₀₁=3`, `δc₀₂=5`, `δc₁₂=2`; `2−5+3=0`; `δc(a,a)=0` | Matches (9.0.1) | carried from [r9], row 11 |
| 12 | Augmentation (sample) | 3-arc cover of S¹, ℝ | `C⁰=ℝ³`, `C¹=ℝ³`, `C²=0`, rank `δ⁰=2`, `Ȟ¹=ℝ`; global sections have `H¹=0` | Not a quasi-isomorphism | carried from [r9], row 12 |
| 13 | Refinement homotopy (sample) | U=(X,X), V=(X), α=(2,5) | `hδα=(δα)_(0,1)=3=T_sα−T_rα=5−2`; Stacks' order gives −3 | README right | carried from [r9], row 13 |
| 14 | Coefficient maps (sample) | S², q=1 | `H¹((ℝ/ℤ)_const)=0`; `H¹(C∞(ℝ/ℤ))≅H²(S²;ℤ)=ℤ` | `H¹(j)` not iso, as stated | carried from [r9], row 14 |
| 15 | Sheaves and exactness (sample) | `z↦z` on S¹ | local logarithms exist; winding number 1 excludes a global one; kernel on ∅ is 0 | Stalk-exact only | carried from [r9], row 15 |
| 16 | Soft ⇒ `Sheaf.H=0` | constant ℝ on S¹, S={±1} | 0 on one arc, 1 on the other extends to no constant; `H¹=ℝ` | Consistent | carried from [r9], row 16 |
| 17 | Dimension shift | `0→F→I→Q→0` | `H¹(F)=coker(Γ(I)→Γ(Q))=0` by (4.14) at S=X; `Hⁿ⁺¹(F)≅Hⁿ(Q)`, Q soft | Route closes | carried from [r9], row 17 |
| 18 | Module form (B6.1) | Ω¹ on S¹; constant ℝ | `ψf` extended by 0 is global and equals f near S; `1·cos θ` not locally constant | Correct | carried from [r9], row 18 |
| 19 | `exists_freeProperQuotient_isSubmersion` | G=1; ℤ on ℝ; Circle on S³; M=∅, dim G=1 | dims `dim M`, 1, `3−1=2`, `0−1=0` in ℕ with empty quotient | Consistent | carried from [r9], row 19 |
| 20 | `exists_principalBundle_orbitFiber` | ℤ on ℝ | fibre over [0] is ℤ, `0·1=−1`, `φ⟨q,x⟩=x` | Consistent | carried from [r9], row 20 |
| 21 | Ehresmann (headline) | point base; `ℝ²∖0→ℝ`; base `ℝ⊔ℝ` | fibre P, φ identity; fibres with 2 and 1 components; fibres of 1 and 2 points | Hypotheses used | carried from [r9], row 21 |
| 22 | Converse (B1.1) | discrete ℝ on ℝ²; `x↦x³` | rank of Φ is 1 < 2; `dπ(0)=0`, `∛` not smooth | Hypotheses used | carried from [r9], row 22 |
| 23 | Conversion (B1.2) | S₃, g=(12), h=(23) | gh=(1 2 3), hg=(1 3 2); with inverses both sides `(1 3 2)•p` | Correct | carried from [r9], row 23 |
| 24 | Cocycle dictionary (B1.3) | `c i j=g_ji` | `c′ j i=h_i⁻¹c j i h_j`, so `g′_ij=h_i⁻¹g_ijh_j`; cocycle law relabels to `g_ijg_jk=g_ik` | Correct | carried from [r9], row 24 |
| 25 | Good covers | ℝⁿ; two-arc S¹; annulus | `ρ(0)x=0`, `ρ(1)x=x`; overlap has 2 components; π₁=ℤ | Consistent | carried from [r9], row 25 |
| 26 | Čech coordinates iff | empty overlap; (a,a) | `ℝ→0` not injective, intersection empty; `ℝ≅ℝ`, nonempty | Both directions | carried from [r9], row 26 |
| 27 | Acyclicity | S¹, n=1, n=0 | `H¹(C∞)=0`; `H⁰∋1≠0` | `0<n` used | carried from [r9], row 27 |
| 28 | `δ_sm(z↦z)=−e` | 3 arcs | crossing differences 0, 0, −1; `df=dθ/2π` integrates to 1 | Correct | carried from [r9], row 28 |
| 29 | Rank-one Chern–Weil | S²; T² | `4πc∈2πℤ` iff `c∈½ℤ`; `4π²c∈2πℤ` iff `2πc∈ℤ` | Correct | carried from [r9], row 29 |
| 30 | Flat dictionary, Ambrose–Singer, reconstruction | T²; Hopf; constant A | holonomies `exp(−2πia)`, `exp(−2πib)`; `Lie(H⁰)=ℝ`; `−∂_t exp(−tA(v))|₀=A(v)` | Consistent | carried from [r9], row 30 |
| 31 | Čech–singular evaluation | 3-arc S¹ | once around `1+0+0=1`; there and back `1−1=0` | Consistent | carried from [r9], row 31 |
| 32 | `ker(H²(ℤ)→H²(ℝ))` (B6.4) | H₁ finitely generated; H₁=ℚ | `Hom(H₂,ℤ)→Hom(H₂,ℝ)` injective, kernel `Ext(H₁,ℤ)`; `Ext(ℚ,ℤ)` torsion-free | Correct | carried from [r9], row 32 |
| 33 | Lens bundle map (B7) | `(vζ,ζ⁻¹λ)` | `([vζ],vζζ⁻¹λ)=([v],vλ)` | Well defined | carried from [r9], row 33 |
| 34 | ℂ-linear Hom; orthonormal frames (B2) | complex line over a point; `h=4u²` | real dims 4 vs 2; `4a²=1`, `a=±1/2` | Correct | carried from [r9], row 34 |
| 35 | B2.2 continuous Gram–Schmidt frames, 890–897 | Standard rank 2, complex rank 1, rank 0 | `(e₁,2e₂) ↦ (e₁,e₂)`; `2i ↦ i` with norm 1; empty basis maps to empty basis. Raw coordinate map sends `e₂ ↦ (0,1/2)`, normalized map to `(0,1)` | Pinned construction has the claimed normalization; zero-dimensional case included | R01 repaired |
| 36 | B1.0 smooth kernel pullback and local frames, 344–351 | Projection `ℝ³→ℝ`, sphere inclusion; identity submersion | Pulled-back fibre at `(0,1,0)` is `span(e₂,e₃)`, whereas the sphere tangent plane is `span(e₁,e₃)`; pulled-back frame remains `(e₂,e₃)` with constant coordinates. Identity submersion has kernel 0 and empty frame | The pullback is of the kernel bundle, not a new kernel of the composite; smoothness needs no separation axiom | R02 repaired |
| 37 | B6.1 full-simplex carrier, 1898–1902 | Dimensions 0, 1, 2 | Empty coordinate tuple ↦ weight `(1)`; `1/4 ↦ (3/4,1/4)`; `(1/4,1/2) ↦ (1/4,1/4,1/2)`. Each weight sum is 1, and deleting weight 0 recovers the input | Correct target and dimension; qualified name elaborates | R03 repaired |
| 38 | Tau Ceti supplier row: exponential fundamental-field flow, 241 | Usual circle action, `ξ=2`, `x=1`; `ξ=0` | Curve `exp(2it)` has velocity `2i exp(2it)`, equal to its fundamental field; at zero velocity both sides are 0. Reversing the action changes both signs | Consistent with B1.1 and its explicit right/left conversion | R04 repaired |
| 39 | Demailly module acyclicity locators, 2325–2326, supporting 1700–1706 | Smooth one-forms on S¹; constant real sheaf; degree 0 | Smooth one-form sheaf has `H¹=0`; constant sheaf has `H¹=ℝ` and `1·cos θ` is not locally constant; `H⁰(C∞)` contains `1≠0`. A cutoff equal to 1 near S gives `ψf=f` there and 0 outside its support | Module hypothesis and positive degree discriminate the claim; source locators match | R05 repaired |
| 40 | B2.2 continuous norm, polarization and metric-specific copy, 859–868 | Complex line with `h(v,w)=4 conj(v)w`; rank 0 | Norm is `2 abs(v)`, not ambient `abs(v)`; `h(1,i)=4i`. Polarization uses squared norms `8,8,16,0` and gives `(8−8+i(16−0))/4=4i`. In rank 0 the norm and product are 0 | Class applies to the induced-metric copy with the same topology; it does not supply the metric data | Correct new explanatory clause |
| 41 | B2.2 smoothness target, 896–897, consumed by B2.5 | Trivial real line, smooth metric `h_x=e^(2x)`; merely continuous metric `(1+abs(x))²` | Normalizing frame 1 gives `e^(−x)`, with `h_x(e^(−x),e^(−x))=1` and derivative `−e^(−x)`; second metric gives `1/(1+abs(x))`, left/right derivatives at 0 equal +1/−1 | Smoothness is an additional result; continuity alone does not imply it | Remaining target justified |

## Not verifiable

- No changed claim requires an unavailable text. The repaired Demailly locators were read in the supplied legal author-manuscript extraction.
- Carried from [r9], without reopening unchanged source claims: Kobayashi–Nomizu I (Chapter I §5, Chapter II §§1–9, Appendix 4) had no legal copy available there; Lee's *Introduction to Smooth Manifolds* and *Introduction to Riemannian Manifolds* were paywalled. These texts are outside the changed passages and the repaired locator check. This incremental acceptance does not certify those unchanged locators anew.

## Source issues

- none

No new source issue was found in this incremental check. The three previously recorded source issues remain documented in [r9]; their source passages were not reopened in this round.

[r9]: PRREVIEW-SmoothBundlesConnections~9.md
