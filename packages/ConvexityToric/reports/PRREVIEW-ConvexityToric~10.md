# Review of ConvexityToric (pull request #1651 at 0fa9a49)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of 0 changed lines since d9c6241. The only change in the pull request since the previous review is the IntegrableSystems commit (its README, `Suggested.lean` and the deletion of `AnnulusFixedPointTargets.lean`); this folder is byte-identical to the head the previous review read. Every previous finding was re-verified against this head, main (dd4b28f), the open heads and the pins, the gate and the elaboration were rerun, and the sibling's citations into this folder were re-resolved. The findings below are the previous report's, each confirmed at this head with its witness re-read; R04 is the one that the changed sibling file could have repaired and did not.

## R01 (P2) — The compact rank-one adapter still has three claimed owners

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:119–140` ("construct the normalized compact rank-one comparison on its actual Lie algebra … Construct a real Lie homomorphism su(2)→g … Integrate using LieGroups Layer 4 to a smooth homomorphism φ_α:SU(2)→G") and `README.md:23–25` ("The normalized compact rank-one construction and its period/character comparison belong to Layer 1").

**Claim:** The same construction is planned in this folder, in an open roadmap pull request, and is assigned by this pull request's own family index to a third roadmap. One object, three owners, and the pull request contradicts itself.

**Witness:** (1) `TauCetiRoadmap/GeometricQuantization/README.md:519–562` at its open head (§3.1a, "Normalized compact rank-one period adapter") constructs the averaged metric, the root planes, the su(2) map with the same basis H₀, A₀, B₀ and the same three bracket laws, the integration by LieGroups Layer 4, the kernel in {I,−I}, the reflection X↦X−α(X)α∨ and the same three Checks (SU(2) with exp(2πH₀)=I and H₀/2 excluded; SU(2)→SO(3) with H₀↦2Z; empty root family for a torus). (2) `TauCetiRoadmap/SymplecticGeometry/README.md:66` (this pull request's own file) assigns to LieGroups "its compact REAL root/character/coroot/rank-one comparison with RootSystems" and says "ConvexityToric T1 adds only integral period/character/isogeny normalization, using those real data". (3) The two consumers on main cite LieGroups for it: `SymplecticGeometry/HamiltonianReduction/README.md:143` ("consume LieGroups Layer6's compact REAL root adapter … actual adjoint root characters χ_α with dχ_α=iα … compact rank-one reflection representatives") and `SchubertGeometry/README.md:44` ("Consume the compact rank-one root representatives from LieGroups"). (4) LieGroups on main, `RepresentationTheory/LieGroups/README.md:383–406` (Layer 6), has tori, conjugacy, the Weyl group and Weyl integration and no root characters, coroots or SU(2) maps; its open revision (#1051, a revision of an existing roadmap and therefore never a supplier) builds exactly this object at `RepresentationTheory/LieGroups/README.md:750–751` of that head ("Compact real roots and the Weyl comparison", "Rank-one representatives").

**Exact repair:** Unchanged from the previous report. Make the folder agree with its family index: keep §1.1 to the integral period/weight/isogeny dictionary; state the real adapter as what LieGroups must provide, in the LieGroups subsection of `## Exact supplier contracts` (for compact connected G with maximal torus T: the adjoint characters χ_α with dχ_α=iα, the invariant-metric coroot α∨ with α(α∨)=2, a smooth φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨, kernel in {I,−I} and φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨)); delete the construction sentences at lines 119–137 and the ownership sentence at lines 24–25; keep the Checks, which are consumer-side normalization checks. If the project instead wants this folder to own the adapter until LieGroups carries it, then the family index line 66, the Scope paragraph and GeometricQuantization §3.1a must all say so; that is a human's choice, and either way exactly one roadmap constructs the map. Do not cite GeometricQuantization as a supplier: its §§3.2, 6.3–6.4 consume ConvexityToric T1/T3/T4 (`GeometricQuantization/README.md:144–147, 621, 1156, 1267` at its head), so that edge would be a cycle.

**Test of repair:** Recomputed this round: for SU(2), the three bracket laws hold entrywise, exp(2πH)=I and exp(πH)=−I (so H/2 is excluded); Ad(exp tH) sends A to cos2t·A+sin2t·B, so dAd(H)=2Z and the kernel of SU(2)→SO(3) is {±I}; conjugation by diag(e^(it),e^(−it)) sends E₁₂ to e^(2it)E₁₂; for a torus the root family is empty. All four are §1.1 Checks and survive deleting the construction under either owner.

## R02 (P3) — Delete `BottSamelsonMomentTargets.lean`

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4, 11, 14–50`.

**Claim:** The file repeats seven declarations of `Suggested.lean` (`V3`, `projectorDiagonal`, `moment`, `initialPlane`, `fixedMoment`, `incidence_moment_range`, `fixedMoment_convexHull`) under a second namespace, and violates the Lean form: four `Mathlib.*` submodule imports with no `import Mathlib` (lines 1–4), `set_option autoImplicit false` (line 11), and a docstring that calls the file "not an exhaustive checklist" (lines 7–8).

**Witness:** Lines 16–48 against `Suggested.lean:92–125`: identical bodies and signatures. The gate's `set_option=0` and `mathlib-subimports=0` count only `Suggested.lean`. Both theorems are already in `Suggested.lean` and the README names them there (`README.md:567–568`).

**Exact repair:** `git rm` the file. The README does not link it, so no README edit is needed.

## R03 (P3) — Delete `FixedLocusTargets.lean`

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:1–4, 18–21, 24–42`.

**Claim:** The file states three intermediate linear-algebra steps of §1.2 rather than a headline, one of them padding, and violates the import form (four submodule imports, no `import Mathlib`).

**Witness:** `invariants_stable` (lines 18–21) closes with one term, `fun v hv k => (hcomm k v).trans (congrArg J (hv k))`: a scratch copy with that proof elaborated this round with exit 0 and no warning. `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean:73–80` at the pin) is exactly the fixed-vector equation. `invariants_symplectic` and `fixed_iff_chart_invariant` are the chart and linear steps that `Suggested.lean:18–19` names as not statable at the geometric level; the README keeps them as API bullets (`README.md:227–229, 246–251`).

**Exact repair:** `git rm` the file; keep the three statements as the README API bullets they already are. Nothing in `Suggested.lean` or the README refers to the file.

## R04 (P3) — The sibling's link into this README still points at a renamed heading

**Location:** `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:16` (this pull request's own file, rewritten in the head commit): "[ConvexityToric T1](../ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".

**Claim:** The fragment targets main's heading `## T1. Compact symplectic actions and local models`; this folder's heading is `## Layer 1: Compact symplectic actions and local models` (`README.md:115`), so the link resolves to nothing. The IntegrableSystems README changed by 266 lines in this commit and line 16 was left as it was.

**Witness:** `grep -n 'ConvexityToric/README.md#'` over the three sibling folders and the family index finds this one fragment only; `grep -n '^## Layer 1'` on this README gives line 115 and no heading produces the anchor `t1-compact-symplectic-actions-and-local-models`.

**Exact repair:** In `IntegrableSystems/README.md:16` change the fragment to `#layer-1-compact-symplectic-actions-and-local-models` (the link text "T1" stays, since `README.md:111–112` keeps T1–T5 as the layer labels).

## R05 (P3) — Rationality of the Kirwan polytope is attributed to a theorem that does not state it

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:382–386`: "(Lerman–Meinrenken–Tolman–Woodward, arXiv:dg-ga/9603015v1, Theorem 1.1): μ(M)∩t*_+ is a compact convex rational polytope … (rational facet directions in the weight lattice, with real support constants)".

**Claim:** LMTW Theorem 1.1 states convexity, local polyhedrality and connected fibers; it says nothing about rationality of the facet directions.

**Witness:** lmtw lines 45–50, re-read this round: the theorem's two conclusions are that the moment set is a convex locally polyhedral set (a convex polytope when M is compact) and that each fiber is connected. Rationality comes from the local cones: hnp lines 825–827 (Theorem 4.1(v), printed p. 151) give the tangent cone of the image at μ(m) as t₀^⊥ plus the cone on the t-weights of the symplectic slice.

**Exact repair:** Keep the LMTW locator for convexity and connectedness and attach rationality to its actual input: "rational because, on the symplectic cross-section, the local image cone at every point is t₀^⊥ plus the cone on the slice weights (Hilgert–Neeb–Plank, Theorem 4.1(v), p. 151), which lie in the weight lattice". The statement itself is unchanged.

## R06 (P3) — "Orbifolds O4.1" is not a label of Orbifolds

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:630` ("Construct the actual level principal-torus orbibundle using O4.1") and `:653` ("*Needs:* … Orbifolds O4.1, O4-N/S/R/K/W/T and O5").

**Claim:** Orbifolds on main labels O4's parts by number inside the section and by letter (O4-N … O4-T); "O4.1" occurs nowhere in `TauCetiRoadmap/Orbifolds/README.md`.

**Witness:** `grep -n 'O4\.1' Orbifolds/README.md` on main is empty (re-run this round); the orbibundle/principal-bundle definition is item 1 of `## O4. Orbibundles, forms and the finite-atlas comparison` (`Orbifolds/README.md:296–300`).

**Exact repair:** Write "Orbifolds O4, item 1 (orbibundles and principal bundles)" at both places.

## Previous findings

- R01 — not repaired: `README.md:119–140` still constructs the su(2)→g map, φ_α:SU(2)→G and the coroot; `README.md:23–25` still claims ownership; GeometricQuantization §3.1a and the family index line 66 are unchanged. Carried as R01.
- R02 — not repaired: `BottSamelsonMomentTargets.lean` is present and unchanged (submodule imports lines 1–4, `set_option` line 11). Carried as R02.
- R03 — not repaired: `FixedLocusTargets.lean` is present and unchanged; the one-term proof of `invariants_stable` was rerun. Carried as R03.
- R04 — not repaired: `IntegrableSystems/README.md:16` still carries the fragment `#t1-compact-symplectic-actions-and-local-models` after the file's rewrite. Carried as R04.
- R05 — not repaired: `README.md:382–386` unchanged; the LMTW and HNP locators were re-read. Carried as R05.
- R06 — not repaired: `README.md:630, 653` unchanged; Orbifolds on main still has no "O4.1". Carried as R06.

No repair report exists on the board for this folder (the package directory holds only the nine review reports), so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head 0fa9a4995fc4b90a934dedfd13bbec71e0e7d774; the folder is identical to d9c6241 (`git diff --stat d9c6241..HEAD` touches only the three IntegrableSystems files). The brief's excluding diff (outside this folder, the two sibling folders and the family files) is empty. Mathlib and Tau Ceti pins are those of the worktree's `lake-manifest.json`, unchanged since the previous review.

**Gate.** The worker's gate at this head: every counter 0, build=0, OK. My run of the brief's gate command reports every content counter 0 and `outside-folder=4` for the sibling folders' files, which the brief names as the pull request's own (a scope false positive; the run stops there, before its build step):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly six `sorry` warnings (lines 68, 82, 112, 120, 140, 190) and nothing else. The one-term probe for `invariants_stable` (R03) elaborates with exit 0 and no warning. No other declaration changed, so the previous round's one-tactic results stand: the six headlines and the two remaining companion theorems do not close by `first | rfl | simp | infer_instance | decide | aesop`.

**Dependency check** (the brief's command, `--movable`):

```text
depcheck: 204 roadmaps, 1664 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The nested family order (CotangentLagrangian → HamiltonianReduction → ConvexityToric → IntegrableSystems, `SymplecticGeometry/README.md:10–19`) is respected: this folder cites only HamiltonianReduction among its siblings; IntegrableSystems cites it downstream (its only citation of this folder is the T1 link of R04, and its `Suggested.lean` lives in `TauCetiRoadmap.SymplecticGeometry` with no `ConvexityToric` name); CotangentLagrangian does not cite it. GeometricQuantization (earlier in the merge order, open #1186) is not cited by this folder, which is right because it consumes this folder's T1/T3/T4.

**Signatures.** The worker's `signatures.md` (elaborated `#check @name` of all 17 declarations) was compared with the README statement of each; it is the same file as last round. `torus_convexity`, `toric_fibers` and `toricImage_delzant` carry `FiniteDimensional ℝ E/EG`, `IsManifold I ∞ M`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology`, `CompactSpace M`, `ConnectedSpace M`, `LieGroup IT ∞ T`, `CompactSpace T`, `ConnectedSpace T`, `σ.IsSymplectic`; the toric ones add effectivity and `finrank E = 2 * finrank EG`; `toricImage_delzant` carries the exponential with identity derivative and the 2π period law. `HamiltonianTorusData` omits symplecticity on purpose (`README.md:183`). No binder is dropped. The seven resolver leads are this file's own declarations.

**Headlines.** The README's headline theorems: torus convexity with connected fibers (§3.1), two-sided Schur–Horn (§3.2), the word121 incidence image and its polygon (§3.3), toric fibers and the Delzant property of the image (§5.1); these six are stated. Not statable and named in the docstring (`Suggested.lean:14–31`): the period/root comparison, local normal forms, the geometric fixed-locus theorem, equivariant perfection, Kirwan/Kostant convexity, the norm-square deformation, Duistermaat–Heckman and class variation, Delzant reconstruction/uniqueness and labeled classification; the previous round's search of the pins for a coadjoint orbit, Weyl chamber, Liouville measure, reduced space or orbifold carrier stands, since the pins are unchanged.

**Citations resolved this round** (the ones the findings touch, at their current heads): GeometricQuantization §3.1a (`rev` head of #1186, `README.md:519–562`) and its consumption of ConvexityToric T1/T3/T4 (`:144–147, 340, 390, 621, 1156, 1267, 1312, 1325, 1449, 1469, 1539, 1670, 1734`); the family index `SymplecticGeometry/README.md:66`; LieGroups main Layer 1 (`:261`) and Layer 6 (`:383–406`); LieGroups #1051 head `:750–752`; HamiltonianReduction main `:143`; SchubertGeometry main `:44`; Orbifolds main `:296–300`. The previous report's resolution of every other `*Needs:*` line and supplier contract on main (HamiltonianReduction R1/R2/R2a/R3/R3.1, LieGroups Layers 1–4 and 6, RootSystems Layer 4, SmoothBundlesConnections B2.4/B6.2–B6.3, Orbifolds O1–O7, MorseTheory M1–M5, CharacteristicClasses C1–C3, AlgebraicTopology Stage 6, DifferentialGeometry Layers 0–1/5.5/6, HeegaardFloer §4.1, HopfRinow Layers 1 and 4, GeometricTopology Layer 1, SchubertGeometry S2/S9, ComplexKahlerGeometry K7.2, AnalyticToricGeometry Layer 0, Majorization MAJ-A18–A25) stands: main is still dd4b28f and the README text is unchanged.

**Sources.** No locator changed. The seeded sample's table from the previous report (conrad Appendix Q/R for 1.1; cannas Homework 21 and Proposition 12.6 with hnp Lemmas 2.1–2.2 for 1.2; cannas Homework 21 exercises 3–5 for 2.1; cannas Theorem 27.1, hnp Theorems 3.10/4.1, lmtw Theorem 1.1 and lerman Theorem 1.1 for 3.1; cannas Theorem 27.1 for 3.2; escobar §§3.2/4.1 for 3.3; cannas §30.1–30.2 and moerdijk/vdb-moerdijk for 4.1; cannas Proposition 30.7/Theorem 30.8/§30.3 for 4.2; cannas Definition 28.1, Theorem 28.2, §§29.1–29.3 and delzant Théorème 2.1 for 5.1; lerman-tolman Definitions 1.2–1.4/Theorem 1.5 for 5.2) is carried forward. Re-read this round: lmtw lines 43–50 (Theorem 1.1 and the local-polyhedral definition) and 110–114 (the sign convention ι_ξω=−⟨dΦ,ξ⟩, transported by Φ=−μ as the README says), hnp lines 816–828 (Theorem 4.1 (i)–(v), printed p. 151).

**Adversarial table.** No statement changed, so the previous report's 67 rows are carried forward (each row of that report, with its values, stands at this head); the rows below are the sampled targets, the headlines and the findings' targets, with the values recomputed this round where marked "recomputed" and otherwise taken from the previous report.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| §1.1 su(2) brackets (R01) | H=diag(i,−i), A, B | [H,A]=2B, [A,B]=2H, [B,H]=2A, entrywise (recomputed) | ✓ |
| §1.1 coroot period (R01) | H, H/2 | exp(2πH)=diag(1,1); exp(πH)=diag(−1,−1), so H/2 excluded (recomputed) | ✓ |
| §1.1 root-line conjugation | D=diag(e^(it),e^(−it)), t=π/4 | DE₁₂D⁻¹=e^(2it)E₁₂ (recomputed); [H,E₁₂]=2iE₁₂ | ✓ |
| §1.1 SU(2)→SO(3) (R01) | Ad(exp tH) on A | Ad_D A=cos2t·A+sin2t·B (recomputed): rotation by 2t, dAd(H)=2Z, kernel {±I} | ✓ |
| §1.1 torus/trivial group | rank 0, 1 | no roots, no division; lattices {0} in rank 0 | ✓ (r9 row 7) |
| §1.1 U(2) coupling | (1,1),(1,−1) | det −2, index 2; (1,0) not integral | ✓ (r9 row 6) |
| HamiltonianTorusData sign | ℂ, positive rotation, x=v=(1,0) | ω(ξ_M,v)=−1=d(−r²/2)(v); +r²/2 gives +1 | ✓ (r9 row 9) |
| §1.2 shear / fixed sets / polar J | S=[[1,1],[0,1]]; irrational rotation; g Euclidean | Sⁿe₂ norm² n²+1 unbounded; {0}×ℂ dim 2; J=A, ω(e₁,Je₁)=1, −J gives −1 | ✓ (r9 rows 12–15) |
| §1.2 `invariants_stable` (R03) | fixed v, commuting J | ρ(k)Jv=Jρ(k)v=Jv; one-term proof elaborates (rerun) | padding |
| §2.1 closure / isolated hypothesis / Euler sign | irrational ξ; trivial action on T²; weight-2 line | critical set M^T vs M; b₁(T²)=2 breaks even cells; 2u=−2h | ✓ (r9 rows 20–22) |
| §3.1 `torus_convexity` degenerate and sphere | point, trivial torus; S² height, c=0,±1,2 | {0}=hull{0}; [−1,1]=hull{±1}; fibers circle, point, ∅ | ✓ (r9 rows 24–26) |
| §3.1 nonabelian | SU(2) orbit radius r | sphere not convex; chamber image {r}; projection [−r,r] | ✓ (r9 row 28) |
| §3.1 gradient inequality / trapping | p=x⁴; f=h² on S² | ‖∇p‖=4p^(3/4), length x₀ (x₀=2: 2.0=2.0); south pole shares value 1 | ✓ (r9 rows 29–30) |
| §3.1 rationality locator (R05) | lmtw Theorem 1.1 | convex locally polyhedral + connected fibers only (re-read lines 45–50); rationality from hnp 4.1(v) lines 825–827 | R05 |
| §3.2 `schur_horn` n=2 | spectrum (2,0), t=0,¼,½,1 | diagonals (0,2),(½,3/2),(1,1),(2,0) (recomputed); hull of (2,0),(0,2) | ✓ |
| §3.2 repeated/empty | (1,1); n=0 | UIU*=I gives (1,1); both sets {()} | ✓ (r9 row 33) |
| §3.3 projector diagonals | 0, full, initial plane, span(e₁+e₂) | (0,0,0),(1,1,1),(1,1,0); (½,½,0) | ✓ (r9 row 35) |
| §3.3 `fixedMoment_convexHull` vertices | (1,1,1), (2,1,1), (½,⅓,⅕) | 6 hull vertices each; distinct images 7, 8, 8; rows 2,5 = (2,2,0),(2,2,0); (3,2,0),(2,3,0); (5/6,8/15,0),(8/15,5/6,0) (recomputed) | ✓ |
| §3.3 region corners at (1,1,1) | pairwise intersections inside x+y+z=3, 0≤x,y≤3, 0≤z≤2 | (0,2,2),(0,3,1),(1,3,0),(2,0,2),(3,0,1),(3,1,0) = the six hull vertices (recomputed) | ✓ |
| §3.3 KKS/FS sign | line (1,w), w=0.1 | μ₁=0.990099 vs 1−|w|²=0.99; s=−2; σ=−2π ω_FS | ✓ (r9 row 40) |
| §4.1 Liouville / DH sphere | dx∧dy, 2dx∧dy; height | masses 1, 2; 4π on [−1,1], density 2π; Dirac 4π for trivial action | ✓ (r9 rows 43–44) |
| §4.1 level bundle / O4.1 label (R06) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x); Orbifolds has no "O4.1" (re-grepped) | ✓ / R06 |
| §4.2 convention transport / Hopf | Cannas period 1, α_C(X#)=1; ℂ² reversed diagonal | +2π(c−c₀)c₁; area 2πc, dA/dc=2π with c₁=+1 | ✓ (r9 rows 47–48) |
| §5.1 `toric_fibers` / complexity one | point; S² circle; word121 (1,1,1) | both sides true; endpoints fixed; (2,2,0) fixed, not a vertex | ✓ (r9 rows 52–53) |
| §5.1 interval presentation | normals +1,−1, supports 0,−1; +2 | region {x: 0≤x≤1} (recomputed on −½,0,½,1,3/2 → 0,½,1); translated [2,3] | ✓ |
| §5.1 smooth vertex / Delzant predicate | +2,−2; duplicate facet; supports 0,0; x≥0; rank 0 | not a ℤ-basis; two active indices; fails interior; fails compact; empty presentation Delzant | ✓ (r9 rows 56–57) |
| §5.1 `toricImage_delzant` degenerate | rank 0, N=0, d=0 | region a point, IsDelzant vacuous; exp(2π·0)=1 ↔ 0∈range | ✓ (r9 row 65) |
| §5.2 periods / area | (a,b)=(2,3); (1,1,½),(2,3,½),(2,3,1) | generic 2π, axial π, 2π/3; 2πε/(ab)=(1/a)π(2ε/b): 3.14159, 0.5236, 1.0472 (recomputed) | ✓ |
| §5.2 residual action / power map | first chart, (2,3), k=1 | w↦−w, half disk πε/3; z₁^b, z₂^a scale by e^(−iabθ) | ✓ (r9 rows 63–64) |
| Lean context | all 17 `#check` types | compactness, connectedness, finite dimension, boundaryless, T2, second countable, Lie group, effectivity, half dimension present as in the README | ✓ |

**Ownership and duplication.** Unchanged from the previous report (the pins, main and the folder are unchanged): the eight declaration names occur only in this pull request and in main's own `ConvexityToric/Suggested.lean`; Majorization owns the forward inequality only; no other roadmap constructs Delzant polytopes, symplectic toric manifolds, moment polytopes or Duistermaat–Heckman measures; the rank-one adapter is the one duplicated object (R01). Ownership against open pull requests was checked only through the supplied checkouts and the previous round's `roadmaps grep`.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (cited at `README.md:333–335`): no legal copy found by the sources service in the previous round; cited by locator only, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982: paywalled texts appearing in References only; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman in the previous round.
- Condevaux–Dazord–Molino (named at `README.md:373`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the cited route.
- Elaboration and computed instances do not prove the admitted headlines.

## Source issues

- none (the two locators re-read this round, lmtw Theorem 1.1 and hnp Theorem 4.1, are correct as cited for convexity and the local cones; the ten errata of the previous report stand and are not re-listed)
