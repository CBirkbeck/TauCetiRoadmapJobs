# Review of ConvexityToric (pull request #1651 at d9c6241)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

This round reads the same head as the previous review (d9c6241), so no finding of that review can have been repaired; the change set is empty. Every finding below was re-verified from scratch against main, the open heads and the pins, and the whole roadmap was reviewed again (sources, adversarial pass, duplication, supplier order, shape, headlines).

## R01 (P2) — The compact rank-one adapter has three claimed owners; give it one

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:119–140` ("construct the normalized compact rank-one comparison on its actual Lie algebra … Construct a real Lie homomorphism su(2)→g … Integrate using LieGroups Layer 4 to a smooth homomorphism φ_α:SU(2)→G") and the ownership sentence at `README.md:23–25`.

**Claim:** This construction is planned in two open pull requests, and the pull request's own family index assigns it to a third roadmap. The roadmap therefore contradicts its own index, and the object has no single owner.

**Witness:** (1) `TauCetiRoadmap/GeometricQuantization/README.md:519–562` at its open head (#1186) plans the same averaged metric, root planes, su(2) map with the same basis H₀,A₀,B₀ and bracket laws, integration by LieGroups Layer 4, kernel in {I,−I}, reflection law and the same three Checks. (2) `TauCetiRoadmap/SymplecticGeometry/README.md:66` (this pull request's own file, unchanged from main) says LieGroups owns "its compact REAL root/character/coroot/rank-one comparison with RootSystems" and that "ConvexityToric T1 adds only integral period/character/isogeny normalization, using those real data". (3) The two other consumers on main cite LieGroups for it as well: `HamiltonianReduction/README.md:143` ("consume LieGroups Layer6's compact REAL root adapter … actual adjoint root characters χ_α with dχ_α=iα") and `SchubertGeometry/README.md:44` ("Consume the compact rank-one root representatives from LieGroups"). (4) LieGroups on main (`RepresentationTheory/LieGroups/README.md:383–406`, Layer 6) has tori, conjugacy, the Weyl group and Weyl integration, and no root characters, coroots or SU(2) maps; its open revision (#1051, a revision of an existing roadmap and so never a dependency) builds exactly this object at its head (`README.md:750–751`, "Compact real roots and the Weyl comparison", "Rank-one representatives").

**Exact repair:** Make the roadmap agree with its family index: keep §1.1 to the integral period/weight/isogeny dictionary, and state the real adapter as what LieGroups must provide, in the LieGroups subsection of `## Exact supplier contracts`, with the exact contract (`What LieGroups must provide: for compact connected G with maximal torus T, the adjoint characters χ_α with dχ_α=iα, the invariant-metric coroot α∨ with α(α∨)=2, and a smooth φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨, kernel in {I,−I} and φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨)`); delete the construction sentences at 119–137 and the ownership sentence at 24–25, and keep the Checks (they are consumer-side normalization checks). If instead the project wants this folder to own the adapter until LieGroups carries it, then the family index line 66, the Scope paragraph and GeometricQuantization §3.1a must all say so; that choice is a human's, and either way exactly one roadmap constructs the map. Do not cite GeometricQuantization: its §§3.2, 6.3–6.4 consume ConvexityToric T1/T3/T4 (`GeometricQuantization/README.md:144–147, 621, 1156, 1267`), so that edge would be a cycle.

**Test of repair:** Under either owner the consumer-side values stay: for SU(2), α(H)=2 and exp(2πH)=I, exp(πH)=−I (computed below, rows 2–4); for SU(2)→SO(3), Ad(exp tH) rotates the (A,B)-plane by 2t so dAd(H)=2Z and the kernel is {±I} (row 5); for a torus the root family is empty (row 7). All three are Checks of §1.1 and survive deleting the construction.

## R02 (P3) — Delete `BottSamelsonMomentTargets.lean`

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4, 11, 14–50`.

**Claim:** The file repeats seven declarations of `Suggested.lean` (`V3`, `projectorDiagonal`, `moment`, `initialPlane`, `fixedMoment`, `incidence_moment_range`, `fixedMoment_convexHull`) under a second namespace `TauCetiRoadmap.SymplecticGeometry.ConvexityToric.BottSamelson`, and violates the Lean form: four `Mathlib.*` submodule imports and no `import Mathlib` (lines 1–4), `set_option autoImplicit false` (line 11), a docstring calling the statements "aids, not an exhaustive checklist" (lines 6–9).

**Witness:** `diff` of lines 16–48 against `Suggested.lean:92–125` shows identical bodies and signatures; the gate's `set_option=0` and `mathlib-subimports=0` count only `Suggested.lean`. The file elaborates (two `sorry` warnings), so nothing is lost by removing it: both theorems are already in `Suggested.lean` and the README names them there (`README.md:567–568`).

**Exact repair:** `git rm` the file. The README does not link it, so no README edit is needed.

## R03 (P3) — Delete `FixedLocusTargets.lean`

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:1–4, 18–21, 24–42`.

**Claim:** The file states three intermediate linear-algebra steps of §1.2 rather than a headline, one of them padding, and violates the import form (four submodule imports, no `import Mathlib`).

**Witness:** `invariants_stable` (lines 18–21) closes with the single term `fun v hv k => (hcomm k v).trans (congrArg J (hv k))` (scratch probe, exit 0 for that declaration): the native `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73–80`) is exactly the fixed-vector equation. `invariants_symplectic` and `fixed_iff_chart_invariant` do not close by one tactic (`first | rfl | simp | infer_instance | decide | aesop` fails on both), but they are the chart and linear steps that `Suggested.lean:18–19` already names as not statable at the geometric level; the README keeps them as API bullets (`README.md:227–229, 246–251`).

**Exact repair:** `git rm` the file; keep the three statements as the README API bullets they already are. Nothing in `Suggested.lean` or the README refers to the file.

## R04 (P3) — The heading rename broke the sibling's link into this README

**Location:** `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:16` (this pull request's own file): "[ConvexityToric T1](../ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".

**Claim:** The fragment pointed at main's heading `## T1. Compact symplectic actions and local models`; this folder now has `## Layer 1: Compact symplectic actions and local models` (`README.md:115`), so the fragment resolves to nothing.

**Witness:** `grep -o 'ConvexityToric/README.md#[a-z0-9-]*'` over main, the three sibling folders and GeometricQuantization finds this one fragment only; no heading of the new README produces the anchor `t1-compact-symplectic-actions-and-local-models`.

**Exact repair:** In `IntegrableSystems/README.md:16` change the fragment to `#layer-1-compact-symplectic-actions-and-local-models` (the label "T1" in the link text stays, since `README.md:111–112` keeps T1–T5 as the layer labels).

## R05 (P3) — Rationality of the Kirwan polytope is attributed to a theorem that does not state it

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:382–386`: "(Lerman–Meinrenken–Tolman–Woodward, arXiv:dg-ga/9603015v1, Theorem 1.1): μ(M)∩t*_+ is a compact convex rational polytope … (rational facet directions in the weight lattice, with real support constants)".

**Claim:** LMTW Theorem 1.1 proves convexity, local polyhedrality and connected fibers; it says nothing about rationality of the facet directions.

**Witness:** lmtw lines 45–50: "The moment set Φ(M)∩t*_+ is a convex locally polyhedral set. In particular, if M is compact then the moment set is a convex polytope. 2. Each fiber of the moment map Φ is connected." Rationality comes from the local cones: hnp lines 825–827 (Theorem 4.1(v)) give the tangent cone of the image at μ(m) as t₀^⊥ + cone of the weights of the symplectic slice.

**Exact repair:** Keep the LMTW locator for convexity and connectedness, and attach rationality to its actual input: "rational because, on the symplectic cross-section, the local image cone at every point is t₀^⊥ plus the cone on the slice weights (Hilgert–Neeb–Plank, Theorem 4.1(v), p. 151), which lie in the weight lattice". The statement itself is unchanged.

## R06 (P3) — "Orbifolds O4.1" is not a label of Orbifolds

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:630` ("Construct the actual level principal-torus orbibundle using O4.1") and `:653` ("*Needs:* … Orbifolds O4.1, O4-N/S/R/K/W/T and O5").

**Claim:** Orbifolds on main labels O4's parts by number inside the section and by letter (O4-N … O4-T); "O4.1" occurs nowhere in `TauCetiRoadmap/Orbifolds/README.md`.

**Witness:** `grep -n 'O4\.1' Orbifolds/README.md` is empty; the orbibundle/principal-bundle definition is item 1 of `## O4. Orbibundles, forms and the finite-atlas comparison` (`Orbifolds/README.md:298–307`).

**Exact repair:** Write "Orbifolds O4, item 1 (orbibundles and principal bundles)" at both places.

## Previous findings

- R01 (P2, two owners for the rank-one construction) — not repaired (head unchanged). Re-verified above with the family index and the two main consumers as additional witnesses; carried as R01.
- R02 (P3, companion imports) — not repaired; folded into R02 and R03 here.
- R03 (P3, `set_option` in the polygon companion) — not repaired; folded into R02 here.
- R04 (P3, `invariants_stable` padding) — not repaired; the one-term proof was rerun; folded into R03 here.
- R05 (P3, add `sources.toml` to the folder) — dropped. No roadmap folder on main carries a `sources.toml` (`find TauCetiRoadmap Completed -name sources.toml` on main is empty); the provenance manifest lives on the board package, and this is a revision of an existing roadmap with no board package manifest. The roadmap's References section carries the locators.
- R06 (P3, stale companion catalogue) — not repaired; folded into R02 and R03 here.
- R07 (LieGroups Layer 1 adjoint supplier) — was repaired at this head; the citation resolves (`RepresentationTheory/LieGroups/README.md:261–273`).

No repair report marks any finding not actionable, so nothing is settled and no `Re-raised` line applies.

## Verified sound

**Scope.** Head d9c6241ddf3eee896a30005868f0acdaf7a72244; Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; main dd4b28f. The brief's excluding diff (outside this folder, the two sibling folders and the family files) is empty. The folder diff against main is 745 added and 83 deleted README lines plus the rewritten `Suggested.lean` and two added companions: a revision in place that keeps the five layers in their original order (`README.md:13`) and every main target; not a re-plan.

**Gate.** The worker's gate at this head passes with build=0. My run of the brief's gate command reports every content counter 0 and `outside-folder=4` for the two sibling folders' files, which the brief names as the pull request's own (a scope false positive; it stopped before the build step):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
```

The targeted build `lake build TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` completed (8988 jobs). `lake env lean` on `Suggested.lean` exits 0 with exactly six `sorry` warnings (lines 68, 82, 112, 120, 140, 190); the two companions elaborate with three and two `sorry` warnings. A manual policy scan of all four files (process words, round labels, pull-request numbers, LaTeX delimiters, `lemma`, machine paths, "optional/deferred") finds only the companion's `set_option` (R02).

**Dependency check** (the brief's command, `--movable`):

```text
depcheck: 204 roadmaps, 1664 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The nested family order (CotangentLagrangian → HamiltonianReduction → ConvexityToric → IntegrableSystems, `SymplecticGeometry/README.md:10–19`) is respected by hand: this folder cites only HamiltonianReduction among its siblings, and IntegrableSystems cites it downstream. GeometricQuantization (merge order line 139, open #1186) is not cited, which is right since it consumes this folder.

**Signatures.** A scratch file with `#check @name` for all 17 declarations elaborates; each type was compared with its README statement. `torus_convexity`, `toric_fibers` and `toricImage_delzant` carry `FiniteDimensional ℝ E/EG`, `IsManifold I ∞ M`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology`, `CompactSpace M`, `ConnectedSpace M`, `LieGroup IT ∞ T`, `CompactSpace T`, `ConnectedSpace T`, `σ.IsSymplectic`; the toric ones add effectivity and `finrank E = 2 * finrank EG`; `toricImage_delzant` carries the exponential with identity derivative and the 2π period law. `HamiltonianTorusData` omits symplecticity on purpose (`README.md:183`). No binder is dropped; the worker's `signatures.md` agrees. The seven resolver leads are this file's own declarations.

**Headlines and padding.** The README's headline theorems: torus convexity with connected fibers (§3.1), two-sided Schur–Horn (§3.2), the word121 incidence image and its polygon (§3.3), toric fibers and the Delzant property of the image (§5.1); these six are stated. Not statable at the pins and named in the docstring: the period/root comparison, local normal forms, the geometric fixed-locus theorem, equivariant perfection, Kirwan/Kostant convexity, the norm-square deformation, Duistermaat–Heckman and class variation, Delzant reconstruction/uniqueness and labeled classification; I checked that no pinned carrier exists for a compact coadjoint orbit, a Weyl chamber, a Liouville measure, a reduced space or an orbifold (no `moment map`, `Delzant`, `Liouville measure`, `Duistermaat` or `Schur–Horn` declaration in the pinned Mathlib or Tau Ceti beyond a doc comment in `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:45`). One-tactic probe (`first | rfl | simp | infer_instance | decide | aesop`) on a scratch copy: all six headlines fail (unsolved goals at the six proof sites); `fixed_iff_chart_invariant` and `invariants_symplectic` fail; `invariants_stable` closes by one term (R03). The eleven definitions have real bodies on native carriers (`Submodule.starProjection`, `EuclideanSpace`, `Module.Basis`, `TauCeti.Toric.IsIntegralLattice`, `Set.extremePoints`, `interior`).

**Pinned declarations opened.** `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131`, needs `HasOrthogonalProjection`, automatic on the finite-dimensional `V3`); `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:58`); `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73`); `LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero` and `finrank_rootSpace_eq_one` (`Mathlib/Algebra/Lie/Weights/Killing.lean:555, 608`, in the finite-dimensional, Killing, Cartan, split context the README says it will supply); `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:433`); `Basis.addHaar` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:254`); `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`) and `IsSymplectic` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:92`: closed and fiberwise nondegenerate, nothing else); `TauCeti.Toric.IsIntegralLattice` (`TauCeti/Geometry/Toric/Algebraic/Lattice.lean:87–93`: free, finite, `IsBaseChange`, as the README says); `RiemannianIsometry.riemannianExp_mfderiv` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean:117`, boundaryless both sides, no completeness).

**Ownership and duplication.** `roadmaps grep --lean-only` for the eight declaration names finds them only in this pull request and in main's own `ConvexityToric/Suggested.lean` (the `IntegralFacetPresentation` family and `toricImage_delzant` already exist there; this is the same roadmap). `roadmaps grep --readme-only` for Schur–Horn: Majorization MAJ-A18–A25 on main owns the forward inequality only (`Majorization/README.md:147–166, 212`), as the Scope says. Delzant polytopes, symplectic toric manifolds, moment polytopes and Duistermaat–Heckman: no other open roadmap or main roadmap constructs them (GeometricQuantization consumes T4's measure; AnalyticToricGeometryPartII at its head has no symplectic content; the #1187 hit is a copy of the family index). The rank-one adapter is the one duplicated object (R01). Ownership against open pull requests was checked only through the supplied checkouts and `roadmaps grep`.

**Supplier citations resolved on main** (every `*Needs:*` line and contract): HamiltonianReduction R1 (`:33–50`), R2 (`:127–156`, KKS, `g*/G ≃ z(g)*×t*_(ss,+)` at `:147`), R2a.1–5 (`:157–181`, heights, root-plane Hessians, regular critical set Wμ, even cells), R3 (`:187`), R3.1 (`:262–279`, proper-orbit slice `Y=G×_H(m*×V)`); LieGroups Layers 1 (`:261`), 2–4 (`:275–357`), 6 (`:383–406`); RootSystems Layer 4 (`:296–320`, chambers); SmoothBundlesConnections B2.4 (`:776–801`, constructs the Liouville measure of a symplectic form, so T4 "applies" it correctly), B6.2–B6.3 (`:1668–1738`, dual-character c₁(Hopf)=1, curvature 2π); Orbifolds O1–O7 (`:87–787`), O4-N/S/R/K/W/T (`:314–419`), O5 (`:672`); MorseTheory M1–M5 (`:90–648`); CharacteristicClasses C1–C3 (`:211–1036`, finite models `ET_N=(S^(2N+1))^m` and the standard-character sign −h at `:522–528`); AlgebraicTopology Stage 6 (`:946`); DifferentialGeometry Layers 0–1 (`:268–340`), 5.5 (`:528`), 6 (`:782`); HeegaardFloer §4.1 (`:2081`); HopfRinow Layers 1 and 4 (`Completed/HopfRinow/README.md:264, 495`, isometry transport at `:521`); GeometricTopology Layer 1 (`:177`, tubular neighbourhoods `:218`); SchubertGeometry S2 (`:38–45`), S9 (`:107–128`), word121 acceptance (`:140`); ComplexKahlerGeometry K7.2 (`:1444`, normalized Fubini–Study form); AnalyticToricGeometry Layer 0 (`Completed/AnalyticToricGeometry/README.md:186–201`, `IsIntegralLattice` API); Majorization MAJ-A18–A25 (`:153–166`). The only unresolved label is "O4.1" (R06).

**Sources, seeded sample.** Cache texts (content hash, printed-page rule): conrad `bf051df7…` (PDF page = printed); cannas `0b1c3a1f…` (printed = marker − 8); hnp `d1611380…` (printed = marker + 127); lmtw `e47b0f8e…`; lerman `f7da6544…`; escobar `0673b7d6…`; delzant `6bb784eb…` (printed = marker + 313); lerman-tolman `e33ce367…`; moerdijk `54648d1a…`; vdb-moerdijk `2624069f…`.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | conrad lines 11244–11329 (Appendix Q, pp. 248–249: rank-one reduction, Lemma Q.1.1, sl₂ triple with pairing 2); lines 11552–11602 (Proposition R.2.1 and both proofs, pp. 254–256: coroot with ⟨a,a∨⟩=2 and r_a(x)=x−⟨x,a∨⟩a, SU(2)/SO(3) kernel case) | Supports the coroot/reflection comparison and the SU(2)/SO(3) Check. Ownership is R01. The source's real-eigenvalue slip (line 11285) is under Source issues; the README keeps i. |
| 1.2 | cannas lines 6630–6662 (Homework 21, exercises 1–2, p. 174: averaged metric, equivariant exp_p, T_pFix=∩ker(Id−dψ), J-invariance of the eigenspace); lines 2802–2806 (Proposition 12.6, p. 70, polar J); hnp lines 461–559 (Lemmas 2.1–2.2, pp. 141–143, local normal form and quadratic moment ½Σ‖v_α‖²α in the source's ι_ξω=−dλ, ω(Iv,w)>0 conventions) | Supports the fixed-locus route; the README's generalization to any metric-preserving K uses only what the exercise uses (each dψ_θ(p) an isometry of the chosen ball). The sign conversion is pinned by direct computation (row 9). |
| 2.1 | cannas lines 6663–6716 (Homework 21, exercises 3–5, pp. 174–175: μ^X Morse–Bott, even index, Crit(μ^X)=Fix(T_X) with T_X the closure, level connectedness by induction) | Supports the critical-set-closure, even-index and connected-level targets. Kirwan Part I §§4–5 not obtainable (Not verifiable). |
| 3.1 | cannas lines 6472–6528 (Theorem 27.1, p. 169, and proof); hnp lines 769–802 (Theorem 3.10, pp. 149–150) and 816–828 (Theorem 4.1, p. 151: proper moment map, closed locally polyhedral convex image, connected fibers, local cones t₀^⊥+cone P_V); lmtw lines 45–50 (Theorem 1.1, v1 p. 2) and 112 (sign ι_ξω=−⟨dΦ,ξ⟩); lerman lines 117–135 (Theorem 1.1, p. 3) and 139–230 (proof, pp. 3–5, Łojasiewicz inequality, finite length, single limit) | Hypotheses match (compact connected; proper moment map for the local-global route). LMTW's opposite sign is transported as the README says. Rationality is not in LMTW Theorem 1.1 (R05). |
| 3.2 | cannas Theorem 27.1 applied to the compact orbit (lines 6472–6479); Majorization MAJ-A18–A25 on main | Supports Kostant projection convexity in the form stated; the two-sided realization is this folder's own, computed in rows 32–33. |
| 3.3 | escobar lines 301–314 (§3.2, p. 8: moment map Σ diag(P_{V_i})); lines 448–500 (§4.1, pp. 12–13: product embedding, fixed-point images) | Supports the projector-sum moment map and the fixed-point image method; the weights, signs and inequalities are recomputed in rows 35–42. Three source slips under Source issues. |
| 4.1 | cannas lines 7177–7251 (Definitions 30.1–30.2, Theorem 30.3, Corollary 30.4, pp. 191–192); moerdijk lines 457–520 (§§4.1–4.4, nerve and classifying space) and 632–642 (§5.5 principal bundles); vdb-moerdijk lines 116–134 (§2, diagonal of the bisimplicial nerve) | Supports the DH measure definition and the sphere density 2π. Theorem 30.3's overbroad statement is under Source issues; the README restricts to effective actions or the affine support. |
| 4.2 | cannas lines 7320–7358 (Proposition 30.7, Theorem 30.8, p. 194, with the convention remark: period-1 circle, ι_{X#}α=1, c=[−β]); lines 7359–7400 (§30.3, pp. 195–196, degree n−1 polynomial) | Supports the variation identity; the transport to the 2π right-connection convention is recomputed in row 47 and gives the README's +2π(c−c₀)c₁(P). |
| 5.1 | cannas lines 6725–6788 (Definition 28.1 and the facet description, pp. 177–178, outward normals with ≤); lines 6822–6845 (Theorem 28.2, p. 179); lines 6933–7045 (§§29.1–29.3, pp. 183–185: level, freeness at vertices, splitting); delzant lines 239–246 (Théorème 2.1, p. 320) and 438–450 (§3, pp. 325–326) | Supports classification, uniqueness and reconstruction; the inward/outward conversion is row 60. The §29.3 section-through-any-stabilizer slip is under Source issues. |
| 5.2 | lerman-tolman lines 73–97 (Definitions 1.2–1.4, Theorem 1.5, v1 pp. 2–3) | Supports the labeled-polytope classification scope (compact, connected, effective, dim T = ½ dim M). Weighted-slice values are rows 61–64. |

**Adversarial table (67 rows, values computed this round; `✓` means both sides agree).**

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period lattice | S¹, exp(t)=e^(it), k=0,1,2 | exp(2π)=1; dχ_k=ik so (1/i)dχ_k=k; Λ_Z=ℤ, ker exp=2πℤ | ✓ |
| 2 §1.1 su(2) brackets | H=diag(i,−i), A, B as displayed | [H,A]=2B, [A,B]=2H, [B,H]=2A, all three checked entrywise | ✓ |
| 3 §1.1 root-line conjugation | D=diag(e^(it),e^(−it)), t=π/4 | DE₁₂D⁻¹=e^(2it)E₁₂, DE₂₁D⁻¹=e^(−2it)E₂₁; [H,E₁₂]=2iE₁₂, [H,E₂₁]=−2iE₂₁ | ✓, factor i present |
| 4 §1.1 coroot period | H, H/2 | exp(2πH)=I; exp(πH)=−I, so H/2 is excluded; pairing 2 versus 1 | ✓ |
| 5 §1.1 SU(2)→SO(3) | Ad(exp tH) on A,B | Ad_D A=cos2t·A+sin2t·B: rotation by 2t, so dAd(H)=2Z, kernel {±I} | ✓ |
| 6 §1.1 U(2) coupling | (1,1),(1,−1) in ℤ² | det=−2, index 2; (1,0)=½(1,1)+½(1,−1) not integral | ✓ |
| 7 §1.1 torus/trivial group | rank 0 and 1 | no roots, no α∨, no division; lattices {0} in rank 0 | ✓ |
| 8 §1.1 α∨ metric independence | g₁⊕g₂ semisimple, center z | B([a,b],y)=B(a,[b,y])=0 kills cross terms and z⊥[g,g]; on a simple factor B is unique up to scale and α♯/‖α‖² is scale-invariant | ✓ |
| 9 HamiltonianTorusData sign | ℂ, positive rotation, x=(1,0), v=(1,0) | ξ_M=(0,1); ω(ξ_M,v)=−1; d(−r²/2)(v)=−1; positive quadratic gives +1 | ✓, excludes +r²/2 |
| 10 reversal / constant | field (y,−x); μ+7 | both sides +1; constant contributes 0 | ✓ |
| 11 trivial torus on a point | T=1, EG=0 | every equation 0=0; μ unique | ✓ |
| 12 §1.2 shear | S=[[1,1],[0,1]] on ℝ² | det 1 preserves dq∧dp; fixed line p=0, restricted ω=0; Sⁿe₂=(n,1), ‖·‖²=n²+1 unbounded, so no invariant inner product | ✓ |
| 13 §1.2 fixed sets | trivial K; irrational rotation on first ℂ of ℂ² | M; {0}×ℂ, tangent dimension 2 | ✓ |
| 14 §1.2 polar J | g Euclidean, ω=dq∧dp | g(Au,v)=ω(u,v) gives Ae₁=e₂, Ae₂=−e₁, −A²=I, J=A, ω(e₁,Je₁)=1; −J gives −1 | ✓ |
| 15 §1.2 polar scaling | ω=2dq∧dp | A=2J₀, (−A²)^(−1/2)=I/2, J=J₀, ω(e₁,Je₁)=2>0 | ✓ |
| 16 §1.2 local weights | +1, −1, 0 | μ=−r²/2 (Hessian −Id, index 2), +r²/2 (index 0), fixed plane | ✓ |
| 17 §1.2 no completeness | open unit disk, v=(1/2,0), quarter turn | exp₀(dR v)=(0,1/2)=R(exp₀ v), norm 1/2<1 | ✓ |
| 18 §1.2 invariant stability | fixed v, commuting J | ρ(k)Jv=Jρ(k)v=Jv, one-term proof | ✓ (padding, R03) |
| 19 §1.2 restricted nondegeneracy | S₃ permuting ℝ³⊕ℝ³, J swaps copies with a sign | fixed space span((1,1,1),0),(0,(1,1,1)); restricted ω=[[0,3],[−3,0]], det 9 | ✓ |
| 20 §2.1 closure T_ξ | ξ irrational in T²; ξ=0 | closure T², critical set M^T; closure {1}, critical set M | ✓ |
| 21 §2.1 isolated hypothesis | S² height; trivial action on T² | indices 0,2, Betti (1,0,1); b₁(T²)=2, even-cell conclusion fails | ✓ |
| 22 §2.1 Euler sign | weight-2 circle line | class 2u=−2h, standard character −h (CharacteristicClasses `:528`) | ✓ |
| 23 §2.1 coadjoint heights | SU(2) sphere; central orbit | two points, indices 0,2; one point, b₀=1 only | ✓ |
| 24 §3.1 degenerate | point, trivial torus; c off image | range {0}=hull{0}; fiber ∅ preconnected | ✓ |
| 25 §3.1 ineffective | trivial circle on S² | image {c}, affine dimension 0 | ✓ |
| 26 §3.1 sphere | μ=h, c=0,±1,2 | image [−1,1]=hull{±1}; fibers circle, point, ∅ | ✓ |
| 27 §3.1 products/subtori/shift | S²×S²; diagonal circle; +3 | [−1,1]², [−2,2], [2,4] | ✓ |
| 28 §3.1 nonabelian | SU(2) orbit radius r | sphere not convex (0 absent); chamber image {r}; torus projection [−r,r] | ✓ |
| 29 §3.1 gradient inequality | p=x⁴ | ‖∇p‖=4|x|³=4p^(3/4); x(t)=x₀/√(1+8x₀²t); length x₀=p(x₀)^(1/4)/(4·¼) (x₀=2: 2.0=2.0) | ✓ |
| 30 §3.1 trapping | f=h² on S², C=north pole | south pole has the same value 1: an energy band alone is not near C | ✓, README adds trapping |
| 31 §3.1 rationality locator | LMTW Theorem 1.1 | states convex locally polyhedral and connected fibers only | R05 |
| 32 §3.2 Schur–Horn n=2 | spectrum (2,0), t=0,¼,½,1 | diagonals (0,2),(½,3/2),(1,1),(2,0); hull of (2,0),(0,2) is the segment | ✓ |
| 33 §3.2 repeated/empty | (1,1); n=0 | UIU*=I gives (1,1) only; both sets {()} | ✓ |
| 34 §3.2 pairing | H=diag(2,0), X=i diag(θ₁,θ₂) | −i tr(HX)=2θ₁ real | ✓ |
| 35 §3.3 projector diagonals | 0, full, initial plane, span(e₁+e₂) | (0,0,0),(1,1,1),(1,1,0); (½,½,0), trace 1 (not (1,1,0)) | ✓ |
| 36 §3.3 fixed flags | L₁∈{e₁,e₂}, coordinate P∋L₁, coordinate L⊂P | 2·2·2=8; each of the eight rows recomputed from a·1_{L₁}+b·1_P+c·1_L | ✓ |
| 37 §3.3 hull vertices | (a,b,c)=(1,1,1),(2,1,1),(½,⅓,⅕),(1,2,3) | 6 hull vertices = rows 1,3,4,8,7,6 in every case; rows 2,5 coefficients of row 6: (½,½),(⅓,⅔),(2/7,5/7),(¾,¼)=(c/(a+c),a/(a+c)); distinct images 7, 8, 8, 8 | ✓ |
| 38 §3.3 region vertices | (1,1,1): all pairwise intersections of the six lines inside the region | (0,2,2),(0,3,1),(1,3,0),(2,0,2),(3,0,1),(3,1,0) = the README's six | ✓ |
| 39 §3.3 a=0 boundary | a=0,b=c=1 | rows collapse to the 6 permutations of (2,1,0); theorem hypotheses exclude a=0 | ✓ |
| 40 §3.3 KKS/FS sign | line (1,w) near e₁, w=x+iy | μ₁=1/(1+|w|²)=1−|w|²+… (0.990099 vs 0.99 at w=0.1); weight −1 on w; ι_{(y,−x)}(s dx∧dy)=s(x dx+y dy)=−2(x dx+y dy) so s=−2; FS density 1/π; σ=−2π ω_FS | ✓ |
| 41 §3.3 kernel/complexity | diagonal scalars; swap e₂,e₃ | scalars fix all subspaces; swap moves P₀; effective rank 2, complexity 3−2=1 | ✓ |
| 42 §3.3 trace | ranks 1,2,1 | a+2b+c | ✓ |
| 43 §4.1 Liouville normalization | dx∧dy, 2dx∧dy, point | masses 1, 2, 1 (SmoothBundlesConnections B2.4 Check agrees) | ✓ |
| 44 §4.1 DH sphere | height; trivial action | 4π on [−1,1], density 2π (cannas Corollary 30.4); Dirac mass 4π | ✓ |
| 45 §4.1 level bundle | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | ✓ |
| 46 §4.1 isotropy | order k | full-isotropy integral of 1 is 1/k | ✓ |
| 47 §4.2 convention transport | Cannas: period 1, α_C(X#)=1, [ω_t]=[ω_red]+t[−β_C] | X#=2πξ^left, t_C=2πc, α_C=−α/(2π): [ω(c)]=[ω(c₀)]+(c−c₀)[F]; [F/2π]=c₁(P)_ℝ gives +2π(c−c₀)c₁ | ✓ |
| 48 §4.2 Hopf | ℂ², reversed diagonal, μ=c | |z|²=2c, area π·2c=2πc; dA/dc=2π=2π⟨c₁(Hopf),[CP¹]⟩ with c₁=+1 (SBC B6.2 `:1704`) | ✓ |
| 49 §4.2 common weight k | k, k=2 | areas 2πc/k, 2πc/k²; πc, πc/2 | ✓ |
| 50 §4.2 disk/rectangle | μ=r²/2≤R; [0,R]×[0,S] | radius √(2R), area 2πR; (2π)²RS | ✓ |
| 51 §4.2 degree | dim 2n, rank m | reduced dimension 2(n−m), degree ≤ n−m; sphere constant 2π | ✓ |
| 52 §5.1 toric fibers | point/trivial torus; S² circle | both sides true; fixed images are endpoints, interior fibers free circles | ✓ |
| 53 §5.1 complexity one | word121 (1,1,1) | (2,2,0) fixed but not a vertex | ✓ |
| 54 §5.1 interval | normals +1,−1, supports 0,−1; +2 | [0,1]; supports 2,−3 give [2,3]; one constant changes length | ✓ |
| 55 §5.1 empty list | rank 0; rank 1 | point; all of ℝ (unbounded) | ✓ |
| 56 §5.1 smooth vertex | +1 at 0, −1 at 1; +2,−2; duplicate facet | ℤ-bases; same region, not a basis; two active indices | ✓ |
| 57 §5.1 Delzant predicate | supports 0,0; x≥0 alone; rank 0 | {0} fails interior; fails compact; empty presentation Delzant | ✓ |
| 58 §5.1 class formula | [0,c], normals +1,−1, supports 0,−c | −2π(0·D₁−c·D₂)=2πc D₂; area 2πc | ✓ |
| 59 §5.1 volumes | simplex size c; rectangle | (2π)ⁿcⁿ/n!, n=0 gives 1; (2π)²ab | ✓ |
| 60 §5.1 inward/outward | cannas ⟨x,v_i⟩≤λ_i | u_j=−v_j, λ↦−λ gives ⟨x,u_j⟩≥λ_j; interval consistent | ✓ |
| 61 §5.2 periods | (a,b)=(2,3) | generic 2π; axial π, 2π/3 | ✓ |
| 62 §5.2 area | (1,1,½),(2,3,½),(2,3,1) | 2πε/(ab)=(1/a)π(2ε/b): 3.14159, 0.5236, 1.0472 both sides; ε=½ gives π/(ab) | ✓ |
| 63 §5.2 residual action | first chart, (2,3), k=1 | w↦e^(−3πi)w=−w; half disk πε/3 | ✓ |
| 64 §5.2 power map | (e^(−iaθ)z₁,e^(−ibθ)z₂) | z₁^b, z₂^a both scale by e^(−iabθ): well defined; axes to [1:0],[0:1] | ✓ |
| 65 toricImage_delzant degenerate | rank 0, N=0, d=0 | region a point, IsDelzant vacuous; exp(2π·0)=1 ↔ 0∈range | ✓ |
| 66 Lean context | all 17 `#check` types | compactness, connectedness, finite dimension, boundaryless, T2, second countable, Lie group, effectivity, half dimension present as in the README | ✓ |
| 67 padding probe | 9 sorried theorems | 8 fail one tactic; `invariants_stable` closes | R03 |

Sibling context (data, not re-reviewed here): CotangentLagrangian's recurrence text (`CotangentLagrangian/README.md:362–365`) says the Liouville measure is not constructed there, consistent with this folder's deferral to SmoothBundlesConnections B2.4; IntegrableSystems consumes T1 (R04 is only its link fragment).

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (cited at `README.md:333–335` for rational equivariant perfection): the sources service finds no legal copy (probe this round: "no legal source found"); cited by locator only.
- Atiyah, *Convexity and commuting Hamiltonians* (1982): the DOI landing page returns HTTP 403 (probe this round); the README cites it in References only, and the convexity statement was checked in Cannas da Silva Theorem 27.1.
- Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 are Springer texts the service records as uncertified; they appear in References only, and their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman.
- Condevaux–Dazord–Molino (named at `README.md:373` beside Hilgert–Neeb–Plank for the local-to-global route) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the cited route.
- Elaboration and computed instances do not prove the admitted headlines.

## Source issues

- **Error** in cannas at Theorem 30.3, printed p. 191 (cannas lines 7215–7226): the source says every proper Hamiltonian torus pushforward has a piecewise polynomial Lebesgue density on g*; it should require an effective action or restrict to the affine support, since a trivial circle action pushes forward to a point mass; affects a stated result.
- **Error** in escobar at §4.1, printed p. 13 (escobar lines 480–484): the source says a general point of G/P̂_k has moment image a Weyl conjugate of the fundamental weight; it should say only torus-fixed points do, general points giving convex combinations; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13 (escobar lines 485–488): the source writes the Bott–Samelson moment map as a sum of embedding-after-moment composites; it should be moment-after-embedding; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12 (escobar lines 459–464): the kth embedding component uses an unbound product index and the factor-position parabolic; it should use the product through k and the kth letter's parabolic; affects a stated result.
- **Misprint** in lerman at Theorem 1.1(2), printed p. 3 (lerman lines 131–135): the source says the map (t,x)↦φ_t(x) on [0,∞]×S_C takes values in C; it should take values in S_C with the infinite-time endpoint in C; affects a stated result.
- **Gap** in lerman at the proof after Lemma 2.2, printed p. 4 (lerman lines 180–183): the source says properness gives a value band |f−b|<D inside the neighbourhood U of the component C; another critical component can share the value b, so trapping on the stable stratum is needed; affects the proof.
- **Error** in cannas at §29.3, printed p. 186 (cannas lines 7036–7040): the source says the sequence splits using a right inverse through any point stabilizer; interior stabilizers are trivial, so a vertex stabilizer must be chosen; affects the proof.
- **Misprint** in conrad at Appendix Q.1, printed pp. 248–249 (conrad lines 11283–11289): the source says ad(H) acts on a complex root line by a real integer Lie(a)(∂θ)∈ℤ; the eigenvalue carries the imaginary unit, 2πin for unit-period coordinates or in for angular coordinates; affects the proof.
- **Misprint** in hnp at §2 after Lemma 2.1, printed p. 142 (hnp lines 527–529): the source says the equivariant Darboux–Weinstein lemma is applied to compact groups which do necessarily preserve the symplectic form; it should say do not necessarily, as the sign character shows; affects nothing.
- **Error** in hnp at Proposition 1.16(ii), printed pp. 139–140 (hnp lines 420–435): the source says the extreme points of a proper linear image equal the image of the extreme points; only the inclusion Ext(φ(C))⊆φ(Ext(C)) holds, as projecting the unit square by x+y gives {0,2}⊊{0,1,2}; affects a stated result.
