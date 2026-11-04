# Review of ConvexityToric (pull request #1651 at bd2dba9)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** accepted

Full review of the folder at bd2dba9 (203 changed lines since 0fa9a49: the README's §1.1, the LieGroups supplier contract, the Scope paragraph, the §3.1 rationality locator, the §4.1 Orbifolds label, and the deletion of the two companion Lean files; `Suggested.lean` is byte-identical to the previous head). Every previous finding was checked against this head first, then the whole roadmap was reviewed: the gate, the dependency check, elaboration and the one-tactic probe were rerun, every cross-roadmap citation was re-resolved on main (dd4b28f) and at the open heads the brief supplies, the seeded sample was re-read at the cached texts, and the adversarial table below carries the values. No finding blocks: the two findings are P3.

## R01 (P3) — The sibling's link into this README still targets a renamed heading

**Location:** `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:16` (this pull request's own file): "[ConvexityToric T1](../ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".

**Claim:** The fragment is the anchor of main's heading `## T1. Compact symplectic actions and local models`; this folder's heading is `## Layer 1: Compact symplectic actions and local models` (`README.md:118`), so the link resolves to nothing. Unchanged since the previous review.

**Witness:** `grep -n 'ConvexityToric/README.md#'` over the three sibling folders and the family index finds this one fragment; `grep -n '^## Layer 1'` on this README gives line 118, and no heading produces the anchor `t1-compact-symplectic-actions-and-local-models`.

**Exact repair:** In `IntegrableSystems/README.md:16` change the fragment to `#layer-1-compact-symplectic-actions-and-local-models` (the link text "T1" stays; `README.md:114–115` keeps T1–T5 as the layer labels).

## R02 (P3) — The kernel clause of the rank-one contract is not something LieGroups states

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:81–83` ("a smooth homomorphism φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨, ker(φ_α)⊆{I,−I} and φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨)") and `:125` (the same clause in §1.1), with "Layer 1 constructs none of these" at `:85`.

**Claim:** LieGroups' Layer 6 states the derivative, torus and normalizer equations of φ_α but never the kernel. The clause is therefore neither supplied nor owned.

**Witness:** `RepresentationTheory/LieGroups/README.md` on main, Layer 6 (`:383–406`), has no root characters, coroots or SU(2) maps at all; at the open head of its revision (its "Rank-one representatives" paragraph, `:751`) the map is built with "the derivative and torus/normalizer equations" and "restriction and conjugation laws", and the only kernel mentioned in that layer is ker α (`:752`). The consumers on main (`SymplecticGeometry/HamiltonianReduction/README.md:143`, `SchubertGeometry/README.md:44`) cite only the characters, coroots, reflections and representatives.

**Exact repair:** Either delete "ker(φ_α)⊆{I,−I}" from the contract at `:82` and from `:125` (nothing in Layers 1–5 uses it: the SU(2)→SO(3) Check at `:161–162` and the "retain any order-two kernel" bullet at `:150` are consumer-side observations), or keep it and own it in §1.1 with its one-line proof, which is this roadmap's own work: dφ_α is a Lie algebra map out of the simple algebra su(2) with dφ_α(H)=α∨≠0, hence injective, so ker(φ_α) is a closed normal subgroup of SU(2) with trivial Lie algebra, hence discrete and normal in a connected group, hence central, hence inside {I,−I}. Tested on the two Checks: for φ=id the kernel is {I}; for SU(2)→SO(3) it is {I,−I}; both satisfy the clause and neither needs more than the centre of SU(2).

## Previous findings

- R01 (P2, three owners of the rank-one adapter) — repaired. `README.md:122–129` now reads "consume LieGroups Layer 6's compact real root adapter … None of these real data is constructed here", the construction sentences (averaged metric, su(2) brackets, Layer 4 integration, coroot definition) are gone, the Mathlib Killing/sl₂ contract is gone from `:53–58`, the Scope paragraph `:23–26` assigns the adapter to LieGroups Layer 6 and keeps "only the integral period/character/isogeny normalization" here, and `*Needs:*` at `:168–169` drops LieGroups Layer 4. The folder now agrees with the family index (`SymplecticGeometry/README.md:66`) and with the two consumers on main (`HamiltonianReduction/README.md:143`, `SchubertGeometry/README.md:44`). What the contract asks for matches what LieGroups' open revision builds at its head (`:750`: χ_α with dχ_α=iα, α∨=2α♯/‖α‖², reflection X↦X−α(X)α∨, "character PERIODS and integral lattice/isogeny refinements are consumed later by ConvexityToric T1"; `:751`: SU(2)→G with dφ(diag(i,−i))=α∨ and the torus/normalizer equations), except the kernel clause (R02 above). State for the human approver: LieGroups on main does not yet carry the adapter (its Layer 6 is tori, the Weyl group and Weyl integration); the citation is of a section still in a revision pull request, the same state as the two consumers already on main, and GeometricQuantization §3.1a at its open head (`GeometricQuantization/README.md:519–562`) still constructs the same adapter while consuming ConvexityToric T1/T3/T4 (`:144, 390, 621, 1156, 1267, 1312, 1325`); that duplicate is GeometricQuantization's to remove, not this folder's. One attribution slip, not a finding: the Ad-invariant inner product and the splitting g=z(g)⊕[g,g] that `:78–79` ascribe to the Layer 6 adapter are consumed by that adapter from LieGroups' Layer 5A at the open head (`:750`).
- R02 (P3, `BottSamelsonMomentTargets.lean`) — repaired: the file is deleted; the folder holds `README.md` and `Suggested.lean` only.
- R03 (P3, `FixedLocusTargets.lean`) — repaired: deleted; the three statements survive as the §1.2 API bullets (`README.md:219–220, 240–243`).
- R04 (P3, sibling anchor) — not repaired; carried as R01.
- R05 (P3, rationality attributed to LMTW Theorem 1.1) — repaired. `README.md:374–382` cites LMTW Theorem 1.1 "for convexity, polyhedrality and connected fibers" and attaches rationality to Hilgert–Neeb–Plank Theorem 4.1(v): re-read at hnp lines 825–827 (printed p. 151), the local cone of the image at μ(m) is t₀^⊥ plus the cone on the t-weights of the symplectic slice at m, t₀ the Lie algebra of the stabilizer of m; the README's gloss that the slice weights are in the weight lattice and t₀^⊥ is rational is right (the stabilizer is a closed subgroup of T, its identity component a subtorus, so t₀ is spanned by lattice vectors). The transport "on the symplectic cross-section" is the torus case the theorem covers.
- R06 (P3, "Orbifolds O4.1") — repaired: `README.md:627, 650` now say "Orbifolds O4, item 1 (orbibundles and principal bundles)", which is item 1 of `## O4. Orbibundles, forms and the finite-atlas comparison` (`Orbifolds/README.md:296–298` on main).

No repair report exists on the board for this folder (the package directory holds the ten review reports only), so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head bd2dba90c8440a8c794da6c0d64f37ec67545dd4; the brief's excluding diff (outside this folder, the two sibling folders and the family files) is empty. The worktree's `.lake/packages` resolves to the Lake directory holding Mathlib `6b7abb3c` and Tau Ceti `a91d3aa`, the revisions of the worktree's `lake-manifest.json`.

**Gate.** The worker's gate at this head: every counter 0, build=0, OK. My run of the brief's gate command gives every content counter 0 and `outside-folder=4` for the four sibling-folder files, which the brief names as the pull request's own (a scope false positive; that run stops before its build step):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Dependency check** (the brief's command, `--movable`):

```text
depcheck: 204 roadmaps, 1664 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The family order (CotangentLagrangian → HamiltonianReduction → ConvexityToric → IntegrableSystems, `SymplecticGeometry/README.md:80`) is respected: this folder cites only HamiltonianReduction among its siblings; IntegrableSystems cites it downstream (R01); CotangentLagrangian does not cite it. GeometricQuantization (earlier in the merge order) is not cited here, which is right since it consumes T1/T3/T4.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly six `sorry` warnings (lines 68, 82, 112, 120, 140, 190) and nothing else. One-tactic probe (`first | rfl | simp | infer_instance | decide | aesop` at each of the six proof sites, scratch copy): all six fail with unsolved goals (the probe log shows the two conjuncts of `torus_convexity`, the set equality of `schur_horn`, both Bott–Samelson equalities, both directions of `toric_fibers`, and the existential of `toricImage_delzant` open). No padding: the eleven definitions (`HamiltonianTorusData`, `V3`, `projectorDiagonal`, `moment`, `initialPlane`, `fixedMoment`, `IntegralFacetPresentation`, `pairing`, `region`, `IsSmoothVertex`, `IsDelzant`) have real bodies on native carriers and exist only to make the six headlines statable.

**Signatures.** The worker's `signatures.md` (elaborated `#check @name` of all 17 declarations) was compared with the README statement of each; the file is unchanged since the previous head because `Suggested.lean` is unchanged. `torus_convexity`, `toric_fibers` and `toricImage_delzant` carry `FiniteDimensional ℝ E/EG`, `IsManifold I ∞ M`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology`, `CompactSpace M`, `ConnectedSpace M`, `LieGroup IT ∞ T`, `CompactSpace T`, `ConnectedSpace T` and `σ.IsSymplectic`, as `README.md:40–47, 175` require; the toric ones add effectivity and `finrank E = 2 * finrank EG`; `toricImage_delzant` carries the exponential with identity derivative and the 2π period law of `README.md:783–787`. `HamiltonianTorusData` omits symplecticity on purpose (`README.md:175`). No binder is dropped. The seven resolver leads are this file's own declarations.

**Headlines.** The README's headline theorems: torus convexity with connected fibers (§3.1, `torus_convexity`), two-sided Schur–Horn (§3.2, `schur_horn`), the word121 incidence image and its polygon (§3.3, `incidence_moment_range`, `fixedMoment_convexHull`), toric fibers and the Delzant property of the image (§5.1, `toric_fibers`, `toricImage_delzant`): all six stated. Named in the docstring as not statable (`Suggested.lean:14–31`): the period/root comparison, local normal forms, the fixed-locus theorem, equivariant perfection, Kirwan and Kostant convexity, the norm-square deformation, Duistermaat–Heckman and class variation, Delzant reconstruction/uniqueness and labeled classification. The pins are unchanged since the previous rounds' search for a coadjoint orbit, Weyl chamber, Liouville measure, reduced space or orbifold carrier; none exists in Mathlib `6b7abb3c` or Tau Ceti `a91d3aa`.

**Pinned declarations named in the supplier contracts**, opened at the pin: `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:58`), `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131`), `Set.extremePoints` (`Mathlib/Analysis/Convex/Extreme.lean:70`), `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73`), `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:433`), `Basis.addHaar` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:254`); `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`), `TauCeti.SmoothTwoForm.IsSymplectic` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:92`), `TauCeti.Toric.IsIntegralLattice` (`TauCeti/Geometry/Toric/Algebraic/Lattice.lean:87`: fields `free`, `finite`, `isBaseChange`, so "finite freeness and real scalar extension" at `README.md:64` is exactly what it says), `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean:117`: hypotheses `I.Boundaryless`, `J.Boundaryless`, `T2Space M`, `T2Space N`, no completeness, matching `README.md:65–69`).

**Cross-roadmap citations resolved this round on main (dd4b28f) and at the open heads.** HamiltonianReduction R1 (`:33`), R2 (`:127`, with `g*/G ≃ z(g)*×t*_(ss,+)` at `:147`), R2a items 2–4 (`:157` ff., items at the listed positions), R3 (`:187`, locally-free level and slice descent at `:258–260`), R3.1 (`:262`); SmoothBundlesConnections B2.4 (`:776`, Liouville measure of a symplectic form at `:781`), B6.2 (`:1668`, dual-character `c₁(P)` and the Hopf normalization), B6.3 (`:1716`); Orbifolds O1–O7 (`:87, 154, 246, 296, 672, 740, 767`), O4-T (`:419`) and the inline labels O4-N/S/R/K/W (`:83, 334, 365, 387, 66`), O4 item 1 (`:298`); MorseTheory M1–M5 (`:90, 124, 430, 458, 611`); CharacteristicClasses C1–C3 (`:211, 550, 720`), with `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m` and `u_i=−h_i` at `:312–318`; AlgebraicTopology Stage 6 (`:946`); DifferentialGeometry Layers 0–1 (`:268, 311`), 5.5 (`:528`), Layer 6 (`:782`), 10.2 (`:884`); HeegaardFloer §4.1 (`:2081`, Darboux charts); HopfRinow Layers 1 and 4 (`Completed/HopfRinow/README.md:264, 495`); GeometricTopology Layer 1 (`:177`); SchubertGeometry S2 (`:38`), S9 (`:107`) and the word121 bullet (`:140`); ComplexKahlerGeometry K7.2 (`:1444`, normalized Fubini–Study form); AnalyticToricGeometry Layer 0 (`Completed/AnalyticToricGeometry/README.md:186`); Majorization MAJ-A18–A25 (`OperatorTheory/Majorization/README.md:153–165`, forward Schur–Horn milestone `:212`); RootSystems Layer 4 (`RepresentationTheory/RootSystems/README.md:296`); LieGroups Layer 1 (`:261`) and Layer 6 (`:383`, see R02 and the R01 note); LieGroups' open revision `:750–752`; GeometricQuantization's open head `:519–562` and its ConvexityToric citations.

**Sources, seeded sample** (cache texts and printed-page rules: cannas `0b1c3a1f…`, printed = marker − 8; hnp `d1611380…`, printed = marker + 127; conrad `bf051df7…`, marker = printed; lmtw `e47b0f8e…`; lerman `f7da6544…`; escobar `0673b7d6…`; lerman-tolman `e33ce367…`; delzant `6bb784eb…`; moerdijk `54648d1a…`; vdb-moerdijk `2624069f…`). The README flags no locator as unverified.

| Target | Locator re-read this round | Result |
| --- | --- | --- |
| 1.1 | conrad lines 11244–11252 (Appendix Q opens at marker 248, pp. 248–253: rank-one reduction via Z_H(T_a)/T_a, SO(3) and SU(2)); lines 11552–11602 (Proposition R.2.1 and both proofs, markers 254–256: a unique a∨∈X_*(T) with r_a(x)=x−⟨x,a∨⟩a, reduction to SU(2)/SO(3) with ⟨a,a∨⟩=2, kernel of order 1 or 2) | Supports exactly what the rewritten §1.1 uses: the coroot as an integral cocharacter and the reflection on the character lattice. The real-eigenvalue slip at line 11285 is in Source issues. |
| 1.2 | cannas lines 6630–6640 (Homework 21, marker 182 = p. 174: averaged metric, invariant J); lines 2802–2806 (Proposition 12.6, marker 78 = p. 70, polar J canonical after a metric, smooth); hnp lines 461–470 and 530–559 (Lemmas 2.1–2.2, markers 14–16 = pp. 141–143: local normal form T₀×T₁-slice, weight decomposition V=⊕V_α, moment ½Σ‖v_α‖²α in the source's conventions) | Hypotheses match; the generalization to any metric-preserving K uses only the equivariant exponential of the exercise. The sign transport is pinned by row 7 below. |
| 2.1 | cannas lines 6663–6716 (Homework 21, exercises 3–5, markers 182–183 = pp. 174–175: Morse–Bott, even index, Crit μ^X = Fix(T_X), connected regular levels by induction) | Supports the critical-set, even-index and connected-level targets. Kirwan Part I §§4–5 under Not verifiable. |
| 3.1 | cannas lines 6472–6480 (Theorem 27.1, marker 177 = p. 169: compact connected, connected levels, convex image = hull of fixed-point images); hnp lines 769–790 (Theorem 3.10, markers 22–23 = pp. 149–150: local-global principle for proper locally fiber-connected maps with local convexity data) and 816–828 (Theorem 4.1 (i)–(v), marker 24 = p. 151); lmtw lines 45–50 (Theorem 1.1: compact Lie group, proper moment map, moment set convex locally polyhedral, polytope when M compact, connected fibers); lerman lines 117–135 (Theorem 1.1, marker 3 = p. 3; proof markers 3–5) | Hypotheses match. The repaired rationality attribution (R05) is right: rationality is in hnp 4.1(v), not in LMTW 1.1. |
| 3.2 | cannas Theorem 27.1 (lines 6472–6479) applied to the compact orbit; Majorization MAJ-A18–A25 on main | Supports Kostant projection convexity as stated; the two-sided realization is this folder's own (rows 12–13). |
| 3.3 | escobar lines 301–314 (§3.2, marker 8: moment map Σ diag(P_{V_i})); lines 448–470 and 480–500 (§4.1, markers 12–13: product embedding, fixed-point images) | Supports the projector-sum moment map and the fixed-point method; the weights, signs and inequalities are recomputed in rows 14–18. Three source slips in Source issues. |
| 4.1 | cannas lines 7177–7229 (Definitions 30.1–30.2 and Theorem 30.3, marker 199 with printed "191" at line 7229); moerdijk lines 460–515 (§§4.1–4.5, markers 11–12) and 632–640 (§5.5 principal bundles, marker 14); vdb-moerdijk lines 116–134 (§2, diagonal of the bisimplicial nerve) | Supports the DH-measure definition and the groupoid principal-bundle/classifying-space comparisons. Theorem 30.3's overbroad statement in Source issues; the README restricts to effective actions or the affine support. |
| 4.2 | cannas lines 7320–7340 (Proposition 30.7 and Theorem 30.8, marker 202 = p. 194: ω_red − tβ, [ω_t]=[ω_red]+tc with c=[−β]); lines 7359–7366 (§30.3, marker 203 = p. 195) | Supports the variation identity; the transport to the 2π right-connection convention is row 21. |
| 5.1 | cannas lines 6725–6735 (Definition 28.1, markers 185–186 = pp. 177–178: simple, rational, smooth); lines 6822–6830 (Theorem 28.2, marker 187 = p. 179); lines 6933–6940 (§29.1, markers 191–193 = pp. 183–185, ⟨x,v_i⟩≤λ_i presentation); delzant lines 239–246 (Théorème 2.1: equal images give an equivariant symplectomorphism commuting with the moment maps) | Supports classification, uniqueness and reconstruction; the inward/outward conversion is row 24. |
| 5.2 | lerman-tolman lines 73–97 (Definitions 1.2–1.4 and Theorem 1.5, markers 2–3: effective, dim T = ½ dim M, rational simple polytope with facet labels n_F, isomorphism iff labeled polytopes isomorphic, every labeled polytope occurs) | Supports the labeled-polytope scope; weighted-slice values are rows 26–28. |

**Adversarial table** (values computed this round; `✓` means both sides agree; the roadmap's statements are unchanged except at §1.1, §3.1's rationality sentence and §4.1's label, and the previous rounds' rows on the unchanged statements stand).

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period at t=2π | SU(2), H=diag(i,−i) | diag(e^(2πi),e^(−2πi))=I, φ(I)=1, so exp_G(2πα∨)=1; at t=π: diag(−1,−1)=−I, exp(πH)=−I, so H/2 is excluded | ✓ |
| 2 §1.1 metric independence of α∨ | ⟨H,H⟩=c for c=1,2 | α(H)=2, α♯=(2/c)H, ‖α‖²=4/c, α∨=2α♯/‖α‖²=H for both c | ✓ |
| 3 §1.1 reflection on weights | SU(2) fundamental weight λ(H)=1 | λ(α∨)=1, λ−1·α has value 1−2=−1∈ℤ; on cocharacters X=H: H−α(H)α∨=H−2H=−H∈Λ_Z | ✓ |
| 4 §1.1 root-line conjugation | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂, d/dt at 0 gives [H,E₁₂]=2iE₁₂, so dχ_α(H)=2i=iα(H) | ✓ |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 | Ad(exp tH) on A=((0,1),(−1,0)); (1,1),(1,−1); trivial torus | rotation by 2t so H↦2Z, kernel {±I}; det=−2, index 2, (1,0)=½(1,1)+½(1,−1) not integral; Λ_Z={0}, no roots, no division | ✓ |
| 6 §1.1 kernel clause (R02) | φ=id; SU(2)→SO(3) | kernels {I} and {I,−I}; neither is stated by LieGroups on main or at its head | R02 |
| 7 HamiltonianTorusData sign | ℂ, dx∧dy, positive rotation at (x,y) | field (−y,x), contraction −y dy−x dx=d(−(x²+y²)/2); +(x²+y²)/2 gives the opposite sign | ✓ |
| 8 §1.2 shear / polar J | S=((1,1),(0,1)); Euclidean g, ω=dq∧dp | Sⁿe₂=(n,1), norm² n²+1 unbounded, no invariant positive metric; A(q,p)=(−p,q), A²=−1, J=A, ω(e₁,Je₁)=1, −J gives −1 | ✓ |
| 9 §1.2 irrational rotation | e^(iθ) on first ℂ factor, θ/2π∉ℚ | fixed set {0}×ℂ, tangent dimension 2; trivial K gives M | ✓ |
| 10 §2.1 Euler sign, closure | weight-2 line; irrational ξ in T² | Euler class 2u=−2h (CharacteristicClasses `u_i=−h_i`); closure of exp(ℝξ) is T, critical set M^T; ξ=0 gives all of M | ✓ |
| 11 §3.1 `torus_convexity` degenerate and sphere | point with trivial torus; S² height, c=0,±1,2 | {0}=hull{0}, fiber a point; image [−1,1]=hull{±1}; fibers circle, point, ∅ (preconnected) | ✓ |
| 12 §3.1 rationality (R05) at a vertex | CP² standard T², m=[1:0:0], README sign μ=μ(p)−½Σα_i|z_i|² | t₀=t, t₀^⊥=0, slice weights (1,0),(0,1), local cone μ(m)−cone{(1,0),(0,1)}: the negative quadrant at the vertex of the simplex | ✓ |
| 13 §3.1 rationality at an edge point | CP², m with z₁=0, z₂z₃≠0 | stabilizer the circle (e^(iθ),1), t₀=ℝ(1,0), t₀^⊥={(0,y)} the edge line, slice weight (1,0), cone a half-plane bounded by the edge: rational | ✓ |
| 14 §3.1 nonabelian | SU(2) orbit sphere radius r | full image not convex (0 missing); chamber image {r}; cross-section a single point, cone 0; torus projection [−r,r] | ✓ |
| 15 §3.1 gradient inequality | p=x⁴ | ‖∇p‖=4|x|³=4p^(3/4), θ=3/4, tail bound ∫=|x₀|; at x₀=0 both 0 | ✓ |
| 16 §3.2 `schur_horn` n=2 | spectrum (2,0), U=((√t,√(1−t)),(−√(1−t),√t)) | diagonal (2t,2−2t); t=0,½,1 give (0,2),(1,1),(2,0) = hull of (2,0),(0,2) | ✓ |
| 17 §3.2 repeated/empty | (1,1); n=0 | UIU*=I so {(1,1)}; both sides {()} | ✓ |
| 18 §3.3 projector diagonals | 0, V3, initial plane, span(e₁+e₂) | (0,0,0),(1,1,1),(1,1,0),(½,½,0); traces 0,3,2,1 | ✓ |
| 19 §3.3 fixed rows at (1,1,1) | eight rows | (3,1,0),(2,2,0),(3,0,1),(2,0,2),(2,2,0),(1,3,0),(0,3,1),(0,2,2): 7 distinct values; rows 2,5 coincide | ✓ |
| 20 §3.3 `fixedMoment_convexHull` corners | plane x+y+z=4, 0≤x,y≤3, 0≤z≤2 | pairwise active pairs give (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) = rows 1,3,4,8,7,6; (0,1,3) excluded by z≤2, (4,0,0) by x≤3 | ✓ |
| 21 §3.3 edge coefficients | (a,b,c)=(1,1,1) and (2,1,1) | (2,2,0)=½(3,1,0)+½(1,3,0), c/D=½; (3,2,0)=(1−⅓)(4,1,0)+⅓(1,4,0), c/D=⅓; (2,3,0) at ⅔=a/D | ✓ |
| 22 §3.3 KKS/FS sign | line (1,w), w=0.1 | μ₁=1/(1+|w|²)=0.990099, quadratic term −|w|²; σ(∂x,∂y)=−2, FS area-1 value 1/π, ratio −2π | ✓ |
| 23 §4.1 Liouville / DH | dx∧dy, 2dx∧dy on unit square; S² height; trivial circle | masses 1, 2; 4π on [−1,1], density 2π; Dirac 4π | ✓ |
| 24 §4.1 level bundle / O4 label (R06) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x); "O4, item 1" is `Orbifolds/README.md:298` | ✓ |
| 25 §4.2 variation / Hopf | Cannas period-1 circle, c=[−β]; ℂ² reversed diagonal | transported to +2π(c−c₀)c₁(P)_ℝ; area 2πc, dA/dc=2π, c₁=+1 | ✓ |
| 26 §5.1 `toric_fibers` / complexity one | point; S² circle; word121 at (1,1,1) | both directions trivially true on a point; endpoints fixed, interior fibers free circles; (2,2,0) fixed and not a vertex | ✓ |
| 27 §5.1 presentations | normals +1,−1, supports 0,−1; translate by 2; +2,−2 supports 0,−2; x≥0 alone; rank 0 | [0,1]; [2,3]; same region, 2 not a ℤ-basis; not compact; empty presentation Delzant | ✓ |
| 28 §5.1 `toricImage_delzant` degenerate | N=0, rank 0, d=0 | exp(2π·0)=1 ↔ 0∈range true; region the point, IsDelzant vacuous with `Fin 0` basis | ✓ |
| 29 §5.2 periods / area / residual action | (a,b)=(2,3), ε=½; first chart k=1 | axial periods π, 2π/3, generic 2π; area 2πε/6=πε/3=π/6; w↦e^(−2πi·3/2)w=−w, half disk | ✓ |
| 30 Lean context | all 17 `#check` types | compactness, connectedness, finite dimension, boundaryless, T2, second countable, Lie group, effectivity, half dimension present as in the README | ✓ |

**Ownership and duplication.** `roadmaps grep --readme-only` for Delzant polytope, Schur–Horn and Duistermaat–Heckman over main and the 441 open heads hits only main, this pull request, GeometricQuantization (a consumer of T1/T3/T4 and the forward-cited §3.1a duplicate noted above), the family-index copy in another family pull request and Majorization (forward inequality only, as the Scope says). The eight declaration names of `Suggested.lean` occur only in this pull request and in main's own `ConvexityToric/Suggested.lean`. Ownership against open pull requests was checked through the supplied checkouts and `roadmaps grep`.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (`README.md:326–327`): no legal copy found by the sources service in earlier rounds; cited by locator, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only): paywalled; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman.
- Condevaux–Dazord–Molino (named at `README.md:365`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the route.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- **Misprint** in hnp at §2, remark after Lemma 2.1, printed p. 142: the source says the equivariant Darboux–Weinstein lemma is applied to compact groups which do necessarily preserve the symplectic form; it should say do not necessarily; affects nothing.
- **Error** in cannas at Theorem 30.3, printed p. 191: the source says every proper Hamiltonian torus pushforward has a piecewise polynomial Lebesgue density on g*; it should require an effective action or restrict to the affine support, since a trivial circle action gives a point mass; affects a stated result.
- **Error** in escobar at §4.1, printed p. 13: the source says a general point of G/P̂_k has moment image a Weyl conjugate of the fundamental weight; only torus-fixed points do, general points give convex combinations; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13: the source writes the Bott–Samelson moment map as a sum of embedding-after-moment composites; it should be moment-after-embedding; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12: the k-th embedding component uses an unbound product index and the factor-position parabolic; it should use the product through k and the k-th letter's parabolic; affects a stated result.
- **Misprint** in lerman at Theorem 1.1(2), printed p. 3: the source says the map (t,x)↦φ_t(x) on [0,∞]×S_C takes values in C; it should take values in S_C with the infinite-time endpoint in C; affects a stated result.
- **Misprint** in conrad at Appendix Q.1, printed pp. 248–249: the source says ad(H) acts on a complex root line by a real integer; the eigenvalue carries the imaginary unit; affects the proof.
