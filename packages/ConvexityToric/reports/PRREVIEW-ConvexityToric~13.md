# Review of ConvexityToric (pull request #1651 at 7178817)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of 54 changed lines since 8882c6f (39 insertions, 15 deletions, both files of the folder; nothing changed outside it). The head repairs both findings of the previous report: `Suggested.lean` now carries the module-system header (`module` / three `public import` lines / `public section`) and the gate's build step passes; the kernel clause `ker(φ_α)⊆{I,−I}` is removed from the LieGroups supplier contract and is instead proved in §1.1 from the derivative equation, with a locator into Conrad–Landesman §18 that I re-read. The changed passages were reviewed in full, the new locator was checked against the cached text, the dependency check, the elaboration, a scratch importer and the gate were rerun at this head, and the adversarial table carries the previous rows and adds computed rows for the kernel bound and the header. One finding, not introduced by the diff: since the previous review main merged a rewrite of RootSystems that deleted its Layer 4, so the four citations of "RootSystems Layer 4" in this README now name a section that does not exist on main (R01, P3; the object is at the Tau Ceti pin, so the repair is a repointing).

## R01 (P3) — "RootSystems Layer 4" no longer exists on main; cite the pinned Weyl chambers instead

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:88–89` ("From TauCetiRoadmap.RootSystems, Layer 4's abstract Weyl chambers, transported through the compact comparison"), `:189` ("RootSystems Layer 4" in §1.1's `*Needs:*`), `:298` (Layer 1 Dependencies) and `:407` ("on LieGroups Layer6 and RootSystems Layer4").

**Claim:** RootSystems on main (`RepresentationTheory/RootSystems/README.md` at c9a16a04, rewritten by the merged commit 03a683f6) has Layers 1–3 only: "geometric roots and faithful representations" (`:248`), "the marked Weyl presentation" (`:432`), "classification and concrete Weyl groups" (`:504`). The former "Layer 4: chambers, the fundamental domain, and the longest element" (`:296` of the README at a0ad405e, the copy the previous review resolved) is gone; the new README consumes the chambers from Tau Ceti and says the native chamber contracts "remain available directly to all consumers" (`:246`). A supplier citation of a section that no longer exists is supplier drift; nothing is unowned, because every chamber object this roadmap uses is at the pin.

**Witness:** `grep -n "^## Layer"` on main's RootSystems README prints exactly three layers; `grep -i chamber` on it finds only the Tau Ceti citations at `:191–193` and uses at `:492–495, 523`. At the Tau Ceti pin (358314d4): `TauCeti.dominantChamber` and `TauCeti.openDominantChamber` (`TauCeti/LinearAlgebra/RootSystem/Chamber.lean:135, 138`, the weak and strict simple-coroot sign cones), `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:234`, under `[P.IsRootSystem]`: exactly one orbit point in the closed dominant chamber), `TauCeti.weylChamber` and `TauCeti.openWeylChamber` (`TauCeti/LinearAlgebra/RootSystem/Weyl/Chamber.lean:107, 111`, the Weyl translates), `TauCeti.exists_smul_eq_of_mem_openWeylChambers` (`:186`, transitivity on open chambers) and `TauCeti.existsUnique_mem_openWeylChamber` (`:368`, each regular weight in exactly one open chamber). These are the closed/open chambers, the fundamental domain and the simple transitivity that the old Layer 4 promised and that §3.1's chamber comparison `t*_(ss,+)` uses.

**Exact repair:** In the supplier contracts replace the sentence at `:88–89` by an entry under **From Tau Ceti** naming `TauCeti.dominantChamber`, `TauCeti.openDominantChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean` and `FundamentalDomain.lean`, and `TauCeti.weylChamber` and `TauCeti.openWeylChamber` in `TauCeti/LinearAlgebra/RootSystem/Weyl/Chamber.lean`, as the abstract Weyl chambers transported through the compact comparison (with the hypotheses `[P.IsRootSystem]`, finite `ι`, over ℝ, that the fundamental-domain theorem carries). Replace "RootSystems Layer 4" at `:189` and `:298` by "Tau Ceti's Weyl chambers" and the clause at `:407` by "on LieGroups Layer 6 and Tau Ceti's Weyl chambers". If anything of RootSystems is still consumed, cite its present section (Layer 1.4 for the integral comparison, Layer 2 for the Weyl presentation); otherwise drop RootSystems from the supplier list. Tested on the instance that refutes the original: the `*Needs:*` line at `:189` with the replacement cites only suppliers that exist (LieGroups Layers 1, 2, 6 on main; the five pinned declarations above), and the dependency check loses one edge and no direction. HamiltonianReduction's own "RootSystems Layer4" clause (`SymplecticGeometry/HamiltonianReduction/README.md:143` on main) is main's and is not this pull request's to change.

## Previous findings

- R01 (P2, module-system header) — repaired: `Suggested.lean:1–5` read `module` / `public import Mathlib` / `public import TauCeti.Geometry.Symplectic.Manifold.TwoForm` / `public import TauCeti.Geometry.Toric.Algebraic.Lattice`, and `:36` reads `public section` before `noncomputable section`; the worker's gate at this head shows `build=0 OK`.
- R02 (P3, kernel clause of the rank-one contract) — repaired: `README.md:82–83` state the adapter's map with the derivative and torus equations only, `:85–87` say the kernel bound "is not assumed of the adapter but proved in §1.1", and `:147–154` prove it (injective differential, closed-subgroup theorem, discrete normal subgroup central, centre {I,−I}).

No repair report exists on the board for this folder, so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head 7178817cf2a90fa8f0a7e7378e15187bd4b5bb3a, one commit on the merge 8882c6f. `changes.md`: 44 lines of `README.md` and 10 of `Suggested.lean`, no file outside the folder. The brief's excluding diff (`git diff --stat origin/main...HEAD` minus this folder, the two sibling folders and the family files) is empty. The worktree's `lake-manifest.json` is unchanged: Tau Ceti `358314d4`, Mathlib `f6090c70`.

**Gate.** The worker's gate at this head: every counter 0, `build=0`, `OK`. My run of the brief's gate command stops before its build step with every content counter 0 and `outside-folder=4` for the four sibling-folder files that the brief names as the pull request's own (the same scope false positive as in every previous round):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Dependency check** (the brief's command, `--movable`), with the `*Needs:*` line of §1.1 now citing LieGroups Layers 1, 2 and 6:

```text
depcheck: 233 roadmaps, 2148 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration and the header.** `lake env lean` on `Suggested.lean` exits 0 in 4.8 s with exactly six `sorry` warnings (the headlines at lines 72, 86, 116, 124, 144, 194, each shifted by four lines from the previous head by the new header) and nothing else: no module-system warning, no error. The worker's targeted build produced the olean at this head. A scratch importer that imports `TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` and `#check`s `torus_convexity`, `schur_horn`, `BottSamelson.incidence_moment_range`, `BottSamelson.fixedMoment_convexHull`, `toric_fibers`, `toricImage_delzant`, `HamiltonianTorusData`, `BottSamelson.projectorDiagonal`, `BottSamelson.initialPlane`, `BottSamelson.fixedMoment`, `IntegralFacetPresentation.IsSmoothVertex` and `IntegralFacetPresentation.IsDelzant` resolves all twelve with their full types and 0 errors, so `public section` exports them. The body of the file is unchanged below the header: the worker's `signatures.md` (all 17 declarations, 0 with a dropped section binder) agrees with the importer's types, and the one-tactic probe of the previous round (all six headline sites fail `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`) stands because no statement changed. The seven resolver leads in `citations.md` are the file's own declarations, all resolved by the importer.

**The new §1.1 passage** (`README.md:147–154`, with the API bullet at `:161–163` and the Checks at `:171–182`). Each step checked: (i) su(2) with basis e_k=−(i/2)σ_k has [e_j,e_k]=ε_jkl e_l, the cross product on ℝ³, and a nonzero ideal of (ℝ³,×) contains v^⊥ for some v≠0 and then v itself, so su(2) is simple; (ii) ker(dφ_α) is an ideal not containing H=diag(i,−i) since dφ_α(H)=α∨ and α(α∨)=2≠0, so it is 0; (iii) ker(φ_α) is closed (φ_α is continuous) and normal, and the closed-subgroup theorem gives it the Lie algebra {X : exp(tX)∈ker φ_α ∀t}={X : exp_G(t·dφ_α X)=1 ∀t}=ker(dφ_α)=0, so it is 0-dimensional, hence discrete; (iv) for n in a discrete normal subgroup of connected SU(2), g↦gng⁻¹ is continuous into a discrete set, so constant, so n is central; (v) Z(SU(2))={I,−I}. The locator: conrad lines 3784–3789 (§18, printed page 82, the sketch of proof of Proposition 18.4) integrate a section su(2)→g to a map h:SU(2)→G that is injective on Lie algebras and conclude that its kernel is a 0-dimensional discrete normal subgroup, hence central and finite, hence 1 or {±1}: exactly the argument the README owns, as `:153–154` say. The References entry `:946–948` now lists §18, p. 82 for this bound. The supplier contract `:79–89` and the §1.1 opening `:125–133` agree with each other and with the proof (the adapter supplies the derivative and torus equations and transport; this roadmap adds the integral normalization and the kernel bound). The bullet "retain any order-two kernel" at `:166` is consistent with the bound (the kernel has order 1 or 2).

**LieGroups Layer 2 and the pin.** `RepresentationTheory/LieGroups/README.md` on main (c9a16a04) has `### Layer 2: the closed-subgroup (Cartan) theorem` at `:275`, stating at `:280–283` that a closed subgroup of a finite-dimensional real Lie group is an embedded Lie subgroup with Lie algebra `lieSubalgebraOfSubgroup H`, and Layer 1 (`:261`) the adjoint representations; the `*Needs:*` line at `:184–185` cites exactly these. Tau Ceti at the pin already formalises that layer: `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`TauCeti/Geometry/Lie/Subgroup/Embedded.lean:157`, hypotheses `[FiniteDimensional ℝ E] [LieGroup I ∞ G] [T2Space G]` and `IsClosed (K : Set G)`), `TauCeti.Lie.lieSubalgebraOfSubgroup` (`Subgroup/LieAlgebra.lean:272`) with `mem_lieSubalgebraOfSubgroup` for closed K (`:295`), and `TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup` (`Subgroup/Differential.lean`, the inclusion differential as a Lie equivalence onto that subalgebra), so the consumed theorem exists at the pin with the hypotheses SU(2) satisfies; the README consumes it through the roadmap that owns it, as it already does for Layer 1's adjoint representation, and restates nothing. Mathlib at the pin has no closed-subgroup theorem (grep for "closed subgroup theorem", "Cartan's closed": no hit under `Mathlib/`).

**Cross-roadmap citations.** Main moved from a0ad405e (the copy the previous review resolved) to c9a16a04 by ten commits touching 35 files, among them the READMEs of RootSystems (R01 above) and HeegaardFloer; none of the other changed folders (BanachAlgebras, BanachSpaceTheory, CFSGBasicProperties, EtaleMassFormula, FiniteGroupExtensionSplitting, FlagVarieties, LocalVariationalFieldTheory, MorseNovikov, PrimitivePrimeDivisors, QuantumEnvelopingAlgebras, SchurWeyl) is cited by this README (grep: no hit). HeegaardFloer §4.1 re-resolved: `TauCetiRoadmap/HeegaardFloer/README.md:2475` "4.1 Symplectic and almost-complex foundations (F2.1)", Darboux at `:2477–2480` and `:2531–2543`. The citation the diff adds, LieGroups Layer 2, resolves as above. The remaining citations resolved in the previous round on a0ad405e are in folders unchanged since (HamiltonianReduction R1–R3.1, SmoothBundlesConnections B2.4/B6.2/B6.3, Orbifolds O1–O5 and O4-T, MorseTheory M1–M5, CharacteristicClasses C1–C3, AlgebraicTopology Stage 6, DifferentialGeometry Layers 0–1, 5.5, 6, 10.2, HopfRinow Layers 1 and 4, GeometricTopology Layer 1, SchubertGeometry S2/S9, ComplexKahlerGeometry K7.2, AnalyticToricGeometry Layer 0, Majorization Part A, LieGroups Layers 1 and 6, the family index) and stand. The LieGroups rank-one adapter (Layer 6) remains, as in the previous reports, a citation of a section that LieGroups' open revision builds and main does not yet: a stated contract, not a finding. That revision's Layer 5 (`:547` of its head) also states that a discrete normal subgroup of a connected group is central; §1.1 here uses the fact as a one-clause proof step with its argument, which is not a duplicate target.

**Sources, seeded sample.** Only §1.1 changed; its new locator (conrad §18, p. 82) was re-read as above, and its existing locators (Appendix Q pp. 248–253, Proposition R.2.1 pp. 254–256) are unchanged. The previous report's re-reading of every other sampled target (1.2, 2.1, 3.1, 3.2, 3.3, 4.1, 4.2, 5.1, 5.2) stands with its page rules; the README flags no locator as unverified.

**Adversarial table.** Rows 1–5 and 7–31 are carried from the previous report (PRREVIEW-ConvexityToric~12, which carried them from ~11), whose statements this head leaves untouched; row 6 is recomputed for the kernel bound now owned here, and rows 32–34 are new. `✓` means both sides agree.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period at t=2π (r12 row 1) | SU(2), H=diag(i,−i) | diag(e^(2πi),e^(−2πi))=I, φ(I)=1, so exp_G(2πα∨)=1; at t=π: −I, so H/2 is excluded | ✓ |
| 2 §1.1 metric independence of α∨ (r12 row 2) | ⟨H,H⟩=c for c=1,2 | α♯=(2/c)H, ‖α‖²=4/c, α∨=H for both c | ✓ |
| 3 §1.1 reflection on weights (r12 row 3) | λ(H)=1 | λ−1·α has value −1∈ℤ; H−α(H)α∨=−H∈Λ_Z | ✓ |
| 4 §1.1 root-line conjugation (r12 row 4) | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂, [H,E₁₂]=2iE₁₂, dχ_α(H)=2i=iα(H) | ✓ |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 (r12 row 5) | Ad(exp tH) on A=((0,1),(−1,0)); (1,1),(1,−1); trivial torus | rotation by 2t so H↦2Z, kernel {±I}; det=−2, index 2; Λ_Z={0}, no roots | ✓ |
| 6 §1.1 kernel bound, now owned (recomputed) | φ=id; SU(2)→SO(3); zero map; D=diag(i,−i) | id: dφ injective, kernel {I}⊆{±I}; SO(3): H↦2Z≠0, kernel {I,−I}=Z(SU(2)), bound attained; zero map: dφ(H)=0 so α(dφ(H))=0≠2, the hypothesis fails and the kernel is SU(2); DE₁₂D⁻¹=(i/(−i))E₁₂=−E₁₂ so D∉Z(SU(2)), D in no kernel; ideal test: ker(dφ)∌H so ker(dφ)=0 in simple su(2)≅(ℝ³,×) | ✓ |
| 7 HamiltonianTorusData sign (r12 row 7) | ℂ, dx∧dy, rotation | contraction −y dy−x dx=d(−(x²+y²)/2) | ✓ |
| 8 §1.2 shear / polar J (r12 row 8) | S=((1,1),(0,1)); ω=dq∧dp | Sⁿe₂=(n,1) unbounded; J=A, ω(e₁,Je₁)=1 | ✓ |
| 9 §1.2 irrational rotation (r12 row 9) | e^(iθ) on first ℂ factor | fixed set {0}×ℂ, dimension 2 | ✓ |
| 10 §2.1 Euler sign, closure (r12 row 10) | weight-2 line; irrational ξ | Euler class −2h; closure of exp(ℝξ) is T | ✓ |
| 11 §3.1 `torus_convexity` degenerate and sphere (r12 row 11) | point; S² height | {0}=hull{0}; image [−1,1], fibers circle, point, ∅ | ✓ |
| 12 §3.1 rationality at a vertex (r12 row 12) | CP², m=[1:0:0] | local cone the negative quadrant | ✓ |
| 13 §3.1 rationality at an edge point (r12 row 13) | CP², z₁=0 | cone a half-plane bounded by the edge | ✓ |
| 14 §3.1 nonabelian (r12 row 14) | SU(2) orbit sphere radius r | chamber image {r}; torus projection [−r,r] | ✓ |
| 15 §3.1 gradient inequality (r12 row 15) | p=x⁴ | ‖∇p‖=4p^(3/4), θ=3/4 | ✓ |
| 16 §3.2 `schur_horn` n=2 (r12 row 16) | spectrum (2,0) | diagonals (2t,2−2t) fill hull of (2,0),(0,2) | ✓ |
| 17 §3.2 repeated/empty (r12 row 17) | (1,1); n=0 | {(1,1)}; {()} | ✓ |
| 18 §3.3 projector diagonals (r12 row 18) | 0, V3, initial plane, span(e₁+e₂) | traces 0,3,2,1 | ✓ |
| 19 §3.3 fixed rows at (1,1,1) (r12 row 19) | eight rows | 7 distinct values; rows 2,5 coincide | ✓ |
| 20 §3.3 `fixedMoment_convexHull` corners (r12 row 20) | plane x+y+z=4 with bounds | six corners = rows 1,3,4,8,7,6 | ✓ |
| 21 §3.3 edge coefficients (r12 row 21) | (1,1,1), (2,1,1) | c/D=½, ⅓; a/D=⅔ | ✓ |
| 22 §3.3 KKS/FS sign (r12 row 22) | line (1,w), w=0.1 | μ₁=0.990099; ratio −2π | ✓ |
| 23 §4.1 Liouville / DH (r12 row 23) | unit square; S²; trivial circle | masses 1, 2; density 2π; Dirac 4π | ✓ |
| 24 §4.1 level bundle / O4 label (r12 row 24) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; "O4, item 1" at `Orbifolds/README.md:298` | ✓ |
| 25 §4.2 variation / Hopf (r12 row 25) | Cannas circle; ℂ² reversed diagonal | dA/dc=2π, c₁=+1 | ✓ |
| 26 §5.1 `toric_fibers` / complexity one (r12 row 26) | point; S²; word121 at (1,1,1) | (2,2,0) fixed and not a vertex | ✓ |
| 27 §5.1 presentations (r12 row 27) | ±1 normals; translates; x≥0; rank 0 | [0,1]; [2,3]; not compact; empty Delzant | ✓ |
| 28 §5.1 `toricImage_delzant` degenerate (r12 row 28) | N=0, rank 0, d=0 | region a point, IsDelzant vacuous | ✓ |
| 29 §5.2 periods / area / residual action (r12 row 29) | (a,b)=(2,3), ε=½ | area π/6; w↦−w | ✓ |
| 30 Lean context (r12 row 30) | all 17 `#check` types | binders as in the README | ✓ |
| 31 Lean context at the pins (r12 row 31) | elaboration, probe, importer | 6 `sorry`, 0 errors; 6 of 6 probe sites fail; 12 of 12 resolve | ✓ |
| 32 Module header (new) | `lake env lean` at the pins; scratch importer; gate | 6 `sorry` warnings and 0 other diagnostics; 12 of 12 public declarations resolve with full types; worker's gate `build=0 OK`; the six headline sites moved from lines 68, 82, 112, 120, 140, 190 to 72, 86, 116, 124, 144, 194 (shift 4 = the added `module`, blank, `public section`, blank lines) | ✓ |
| 33 §1.1 closed-subgroup input (new) | kernel of a Lie group map φ:SU(2)→G | Lie(ker φ)={X : exp_G(t·dφX)=1 ∀t}=ker(dφ): for φ=id this is {X : exp(tX)=I ∀t}=0 (exp is injective near 0); for SU(2)→SO(3) also 0, and the kernel {±I} is 0-dimensional, discrete; theorem present at the pin as `isEmbeddedLieSubgroup_of_isClosed` and on main as LieGroups Layer 2 | ✓ |
| 34 RootSystems citation at main c9a16a04 (new) | `README.md:88, 189, 298, 407` against main's RootSystems README | layer headings on main: 1 (`:248`), 2 (`:432`), 3 (`:504`), no Layer 4; at a0ad405e Layer 4 was `:296`; the five chamber declarations exist at the pin (`Chamber.lean:135, 138`, `FundamentalDomain.lean:234`, `Weyl/Chamber.lean:107, 111`) | R01 |

**Ownership and duplication.** The diff adds one owned statement, the kernel bound of a rank-one map SU(2)→G. It is a one-paragraph consequence of the closed-subgroup theorem, not a carrier; searched by object over main and the open heads (`roadmaps grep` for "discrete normal subgroup" and for "ker(φ"): the only hits are this README and LieGroups' open revision `:547` (the central-subgroup lemma, a step not the bound); no roadmap states the bound as a target, LieGroups' open revision builds φ_α with the derivative and torus/normalizer equations only (`:750–752` of its head, as in the previous report), and GeometricQuantization's §3.1a duplicate of the adapter (a consumer of this roadmap, noted in earlier reports as its own defect to remove) does not state the kernel bound either. The previous rounds' searches for Delzant polytopes, Schur–Horn, Duistermaat–Heckman and the eight declaration names stand, nothing else having changed. Ownership against open pull requests was checked through the supplied checkouts.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (`README.md:326–327`): no legal copy found by the sources service in earlier rounds; cited by locator, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only): paywalled; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman in the previous rounds.
- Condevaux–Dazord–Molino (named at `README.md:365`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the route.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- none (the one locator re-read this round, conrad §18 p. 82, is correct; the previous report's errata stand and were collected then).
