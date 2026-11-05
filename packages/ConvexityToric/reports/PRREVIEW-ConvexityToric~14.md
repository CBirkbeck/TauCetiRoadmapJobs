# Review of ConvexityToric (pull request #1651 at 5eaa255)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of 27 changed lines since 7178817 (21 insertions, 6 deletions, `README.md` only; `Suggested.lean` is byte-identical to the previous head and nothing changed outside the folder). The head repairs the one finding of the previous report: the four citations of "RootSystems Layer 4" are gone, the supplier contracts now name the pinned Tau Ceti chamber declarations under **From Tau Ceti** with their hypotheses, and §1.1's `*Needs:*` line, Layer 1's Dependencies and §3.1 cite "Tau Ceti's Weyl chambers". Every declaration the new passage names was opened at the Tau Ceti pin with its `variable` block, the hypothesis description was compared with those blocks line by line, the LieGroups and HamiltonianReduction citations it leans on were re-resolved on main, and the gate, the dependency check and the elaboration were rerun at this head. One finding, outside the folder but in a file the brief names as the pull request's own: the family index still says that RootSystems owns the closed-wall chamber theorem and that this roadmap's T3 and T4 consume RootSystems, which the folder no longer cites anywhere (R01, P3).

## R01 (P3) — The family index still routes this roadmap's chambers through RootSystems

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** After this head the folder cites RootSystems nowhere (`grep RootSystems` on `ConvexityToric/README.md`: 0 hits); its supplier contracts (`README.md:70–87`) consume the chambers from Tau Ceti, and §3.1 (`:422`) builds on "LieGroups Layer 6 and Tau Ceti's Weyl chambers". Layer 4 (Liouville and Duistermaat–Heckman, `:634–733`) never consumed RootSystems in any head. On main, RootSystems (`RepresentationTheory/RootSystems/README.md`, Layers 1–3 at `:248, 432, 504`) no longer owns a closed-wall chamber theorem: it cites `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` itself (`:191–194`) and says the native chamber contracts remain available directly to all consumers (`:246`). So the index describes a supply edge the roadmap does not have and an owner that does not exist. The two lines are unchanged from main, so the pull request did not write them; but the brief names the family index as the pull request's own, and the diff under review is what makes the index false for this roadmap.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty; `grep -n RootSystems` on the index prints `:66` and `:80`; the folder's dependency check lists no RootSystems edge (229 roadmaps, 2124 edges, 0 problems, after 233/2148 in the previous round).

**Exact repair:** At `:66` replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" by "Tau Ceti's `TauCeti.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain". At `:80` replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" by "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3". Tested on the instance that refutes the original: with those two edits the index names, for T3 and T4, exactly the suppliers that §3.1's and Layer 4's `*Needs:*` lines name, and no roadmap that the folder does not cite. HamiltonianReduction's own "RootSystems Layer4" clause (`SymplecticGeometry/HamiltonianReduction/README.md:143, 145, 147` on main) is main's roadmap and is not this pull request's to change.

## Previous findings

- R01 (P3, "RootSystems Layer 4" no longer on main) — repaired: `README.md:70–87` name `TauCeti.dominantChamber`, `TauCeti.openDominantChamber`, `TauCeti.weylChamber`, `TauCeti.openWeylChamber`, `TauCeti.exists_smul_eq_of_mem_openWeylChambers`, `TauCeti.existsUnique_mem_openWeylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` with their files and hypotheses; `:204`, `:313` and `:422` cite "Tau Ceti's Weyl chambers"; the RootSystems sentence at the old `:88–89` is deleted and nothing of RootSystems is cited.

No repair report exists on the board for this folder, so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head 5eaa2558cf3d7a1601d32fef1b24e6711774fd32, one commit on 7178817. `changes.md`: 27 lines of `README.md`, no other file. `git diff --stat 7178817c..HEAD -- Suggested.lean` is empty. The brief's excluding diff (`git diff --stat origin/main...HEAD` minus this folder, the two sibling folders and the family files) is empty. `lake-manifest.json` is unchanged: Tau Ceti `358314d4`, Mathlib `f6090c70`.

**Gate.** The worker's gate at this head: every counter 0, `build=0`, `OK`. My run of the brief's gate command stops before its build step with every content counter 0 and `outside-folder=4` for the four sibling-folder files the brief names as the pull request's own (the same scope false positive as in every previous round):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Dependency check** (the brief's command, `--movable`), with the RootSystems edge gone:

```text
depcheck: 229 roadmaps, 2124 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. (The previous round printed 233 roadmaps and 2148 edges against the merge order of that day; the counts are the order file's, not this folder's.)

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 6.2 s with exactly six `sorry` warnings (lines 72, 86, 116, 124, 144, 194, the same six headline sites as at 7178817) and no other diagnostic. The file did not change, so the worker's `signatures.md` (17 declarations, 0 with a dropped section binder), the previous round's scratch importer (12 of 12 public declarations resolve with full types) and the one-tactic probe (all six headline sites fail `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`) stand. The seven resolver leads in `citations.md` are the file's own declarations, resolved in the previous round.

**The new supplier passage (`README.md:70–87`) against the Tau Ceti pin 358314d4.** Every name opened with its `variable` block:

- `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:97–99`: `[CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] (P : RootPairing ι R M N)`; `:127` `(b : P.Base)`; `:131` `[Preorder R]`; `:135` `dominantChamber := {x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`; `:138` `openDominantChamber` with `0 <`. The README's "weak and strict sign cones of the simple coroots of a base of a root pairing over an ordered commutative ring" is this (a preorder on the ring suffices at the pin; ℝ, the consumer's ring, has it).
- `TauCeti/LinearAlgebra/RootSystem/Weyl/Chamber.lean:97–101`: the same pairing data plus `[LinearOrder R] (b : P.Base)`; `:107` `weylChamber w := w • dominantChamber P b`; `:111` `openWeylChamber`; `:186` `exists_smul_eq_of_mem_openWeylChambers`, under `[LinearOrder R]` only, gives `∃ u, u • C = D` for two open chambers ("their Weyl translates", "transitivity on open chambers"). Section `Covering` `:330–331`: `[IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced]`; `:368` `existsUnique_mem_openWeylChamber [P.IsRootSystem] (hx : IsRegularWeight P x) : ∃! w, x ∈ openWeylChamber P b w` ("each regular weight in exactly one open chamber").
- `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:79–81` the pairing data with `(b : P.Base)`; `:124` `[LinearOrder R]`; `:135` `[IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced]`; `:234` `existsUnique_mem_orbit_inter_dominantChamber [P.IsRootSystem] (x : M) : ∃! y, y ∈ MulAction.orbit P.weylGroup x ∩ dominantChamber P b` ("each Weyl orbit meets the closed dominant chamber in exactly one point, walls included").
- Mathlib `Mathlib/LinearAlgebra/RootSystem/Defs.lean:120–122`: `class IsRootSystem` with `span_root_eq_top` and `span_coroot_eq_top`, which is the README's "a root system means that the roots span their module and the coroots theirs".

So the sentence "The last two assume a root system over a linearly ordered strict ordered commutative ring with finite index set, crystallographic and reduced with reduced flip" lists exactly the instance arguments of `:368` and `:234` (`CommRing`, `LinearOrder`, `IsStrictOrderedRing`, `Finite ι`, `IsCrystallographic`, `IsReduced`, `flip.IsReduced`, `IsRootSystem`), neither more nor fewer, and the first five names carry no hypothesis beyond the order on `R`, as the sentence implies.

**The transport sentence.** "The real root system of a compact connected Lie group satisfies all of these on the semisimple part t_ss*, the span of its roots": for the real root/coroot pairing of (t_ss*, t_ss) the roots span t_ss* by definition and the coroots α∨=2α♯/‖α‖² span t_ss because ♯ is an isomorphism; α(β∨)∈ℤ (crystallographic); the only multiples of a root that are roots are ±α (reduced); and β∨ ∥ α∨ forces β♯ ∥ α♯, so β ∥ α, so β=±α and β∨=±α∨ (flip reduced). The identification of the geometric Weyl group N(T)/T with `RootPairing.weylGroup` is LieGroups Layer 6 on main (`RepresentationTheory/LieGroups/README.md:383–398`, "N(T)/T ≃ W(root system)", a stated milestone), the "compact comparison" the README names; the compact real root adapter beyond it is, as in every previous round, a citation of a section LieGroups' open revision builds (#1051 is a revision of an existing roadmap and is cited as main). The decomposition `t*_+=z(k)*×t*_(ss,+)` agrees with §3.1 (`:422`) and with HamiltonianReduction R2 on main (`SymplecticGeometry/HamiltonianReduction/README.md:143–147`, "z(g)*×t*_(ss,+)", the centre an unrestricted Euclidean factor on which roots vanish).

**The other changed lines.** `:204` (§1.1 `*Needs:*`) and `:313` (Layer 1 Dependencies) now both cite LieGroups Layers 1, 2 and 6, so the Dependencies paragraph agrees with the `*Needs:*` line, which the previous head's Dependencies ("Layers 1 and 6") did not after Layer 2 was added in 7178817. `:422` reads "LieGroups Layer 6 and Tau Ceti's Weyl chambers" with the space in "Layer 6" that the old "Layer6" lacked.

**Cross-roadmap citations.** Main moved from c9a16a04 (the previous round's copy) to 156df567; none of the folders changed in between is cited by this README beyond LieGroups, RootSystems and HamiltonianReduction, which were re-resolved above. The remaining citations resolved in earlier rounds (HamiltonianReduction R1–R3.1, SmoothBundlesConnections B2.4/B6.2/B6.3, Orbifolds O1–O5 and O4-T, MorseTheory M1–M5, CharacteristicClasses C1–C3, AlgebraicTopology Stage 6, DifferentialGeometry Layers 0–1, 5.5, 6, 10.2, HopfRinow Layers 1 and 4, HeegaardFloer §4.1, GeometricTopology Layer 1, SchubertGeometry S2/S9, ComplexKahlerGeometry K7.2, AnalyticToricGeometry Layer 0, Majorization Part A, the family index) are in folders unchanged since and stand.

**Sources, seeded sample.** The diff touches no locator: it replaces supplier citations only. The previous rounds' re-reading of every sampled target (1.1 with conrad §18 p. 82 and Appendix Q/R, 1.2, 2.1, 3.1, 3.2, 3.3, 4.1, 4.2, 5.1, 5.2) stands with its page rules; the README flags no locator as unverified.

**Adversarial table.** Rows 1–33 are carried from the previous report (PRREVIEW-ConvexityToric~13, which carried rows 1–31 from ~12), whose statements this head leaves untouched; row 34 is recomputed for the repaired citation and rows 35–38 are new. `✓` means both sides agree.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period at t=2π (r13 row 1) | SU(2), H=diag(i,−i) | diag(e^(2πi),e^(−2πi))=I, φ(I)=1, so exp_G(2πα∨)=1; at t=π: −I, so H/2 is excluded | ✓ |
| 2 §1.1 metric independence of α∨ (r13 row 2) | ⟨H,H⟩=c for c=1,2 | α♯=(2/c)H, ‖α‖²=4/c, α∨=H for both c | ✓ |
| 3 §1.1 reflection on weights (r13 row 3) | λ(H)=1 | λ−1·α has value −1∈ℤ; H−α(H)α∨=−H∈Λ_Z | ✓ |
| 4 §1.1 root-line conjugation (r13 row 4) | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂, [H,E₁₂]=2iE₁₂, dχ_α(H)=2i=iα(H) | ✓ |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 (r13 row 5) | Ad(exp tH) on A=((0,1),(−1,0)); (1,1),(1,−1); trivial torus | rotation by 2t so H↦2Z, kernel {±I}; det=−2, index 2; Λ_Z={0}, no roots | ✓ |
| 6 §1.1 kernel bound (r13 row 6) | φ=id; SU(2)→SO(3); zero map; D=diag(i,−i) | id: kernel {I}⊆{±I}; SO(3): kernel {I,−I}=Z(SU(2)), bound attained; zero map: α(dφ(H))=0≠2, hypothesis fails, kernel SU(2); DE₁₂D⁻¹=−E₁₂ so D∉Z; ker(dφ)∌H so ker(dφ)=0 in simple su(2) | ✓ |
| 7 HamiltonianTorusData sign (r13 row 7) | ℂ, dx∧dy, rotation | contraction −y dy−x dx=d(−(x²+y²)/2) | ✓ |
| 8 §1.2 shear / polar J (r13 row 8) | S=((1,1),(0,1)); ω=dq∧dp | Sⁿe₂=(n,1) unbounded; J=A, ω(e₁,Je₁)=1 | ✓ |
| 9 §1.2 irrational rotation (r13 row 9) | e^(iθ) on first ℂ factor | fixed set {0}×ℂ, dimension 2 | ✓ |
| 10 §2.1 Euler sign, closure (r13 row 10) | weight-2 line; irrational ξ | Euler class −2h; closure of exp(ℝξ) is T | ✓ |
| 11 §3.1 `torus_convexity` degenerate and sphere (r13 row 11) | point; S² height | {0}=hull{0}; image [−1,1], fibers circle, point, ∅ | ✓ |
| 12 §3.1 rationality at a vertex (r13 row 12) | CP², m=[1:0:0] | local cone the negative quadrant | ✓ |
| 13 §3.1 rationality at an edge point (r13 row 13) | CP², z₁=0 | cone a half-plane bounded by the edge | ✓ |
| 14 §3.1 nonabelian (r13 row 14) | SU(2) orbit sphere radius r | chamber image {r}; torus projection [−r,r] | ✓ |
| 15 §3.1 gradient inequality (r13 row 15) | p=x⁴ | ‖∇p‖=4p^(3/4), θ=3/4 | ✓ |
| 16 §3.2 `schur_horn` n=2 (r13 row 16) | spectrum (2,0) | diagonals (2t,2−2t) fill hull of (2,0),(0,2) | ✓ |
| 17 §3.2 repeated/empty (r13 row 17) | (1,1); n=0 | {(1,1)}; {()} | ✓ |
| 18 §3.3 projector diagonals (r13 row 18) | 0, V3, initial plane, span(e₁+e₂) | traces 0,3,2,1 | ✓ |
| 19 §3.3 fixed rows at (1,1,1) (r13 row 19) | eight rows | 7 distinct values; rows 2,5 coincide | ✓ |
| 20 §3.3 `fixedMoment_convexHull` corners (r13 row 20) | plane x+y+z=4 with bounds | six corners = rows 1,3,4,8,7,6 | ✓ |
| 21 §3.3 edge coefficients (r13 row 21) | (1,1,1), (2,1,1) | c/D=½, ⅓; a/D=⅔ | ✓ |
| 22 §3.3 KKS/FS sign (r13 row 22) | line (1,w), w=0.1 | μ₁=0.990099; ratio −2π | ✓ |
| 23 §4.1 Liouville / DH (r13 row 23) | unit square; S²; trivial circle | masses 1, 2; density 2π; Dirac 4π | ✓ |
| 24 §4.1 level bundle / O4 label (r13 row 24) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; "O4, item 1" at `Orbifolds/README.md:298` | ✓ |
| 25 §4.2 variation / Hopf (r13 row 25) | Cannas circle; ℂ² reversed diagonal | dA/dc=2π, c₁=+1 | ✓ |
| 26 §5.1 `toric_fibers` / complexity one (r13 row 26) | point; S²; word121 at (1,1,1) | (2,2,0) fixed and not a vertex | ✓ |
| 27 §5.1 presentations (r13 row 27) | ±1 normals; translates; x≥0; rank 0 | [0,1]; [2,3]; not compact; empty Delzant | ✓ |
| 28 §5.1 `toricImage_delzant` degenerate (r13 row 28) | N=0, rank 0, d=0 | region a point, IsDelzant vacuous | ✓ |
| 29 §5.2 periods / area / residual action (r13 row 29) | (a,b)=(2,3), ε=½ | area π/6; w↦−w | ✓ |
| 30 Lean context (r13 row 30) | all 17 `#check` types | binders as in the README | ✓ |
| 31 Lean context at the pins (r13 row 31) | elaboration, probe, importer | 6 `sorry`, 0 errors; 6 of 6 probe sites fail; 12 of 12 resolve | ✓ |
| 32 Module header (r13 row 32) | `lake env lean`; importer; gate | 6 `sorry` warnings, 0 other diagnostics; worker's gate `build=0 OK` | ✓ |
| 33 §1.1 closed-subgroup input (r13 row 33) | kernel of φ:SU(2)→G | Lie(ker φ)=ker(dφ)=0 for id and SU(2)→SO(3); kernel discrete; present at the pin as `isEmbeddedLieSubgroup_of_isClosed` and on main as LieGroups Layer 2 | ✓ |
| 34 Chamber citations at main 156df567 and the pin (recomputed) | `README.md:70–87, 204, 313, 422` | RootSystems on main has Layers 1–3 only (`:248, 432, 504`) and is cited 0 times in the folder; the seven Tau Ceti names exist at `Chamber.lean:135, 138`, `Weyl/Chamber.lean:107, 111, 186, 368`, `FundamentalDomain.lean:234`; depcheck 0 problems | ✓ |
| 35 Hypothesis sentence vs the pin (new) | the two `existsUnique` theorems; the five other names | `:368` and `:234` each carry `CommRing`+`LinearOrder`+`IsStrictOrderedRing R`, `Finite ι`, `IsCrystallographic`, `IsReduced`, `flip.IsReduced`, `IsRootSystem` = the README's eight-clause sentence; `dominantChamber` needs `Preorder R` only, `weylChamber`/`exists_smul_eq…` `LinearOrder R` only; `IsRootSystem` = both spans ⊤ (`Defs.lean:121–122`) | ✓ |
| 36 Chamber theorems in rank 0 and rank 1 (new) | ι=∅; A₁ over ℝ with `coroot' x = 2x` | ι=∅: both chambers = M, W trivial, orbit {x}∩M={x}, exactly one; every x regular, in the one open chamber. A₁: dominant {x≥0}, open {x>0}, W={1,s}, s x=−x, orbit {x,−x}∩{x≥0}={|x|} (one point, also at the wall x=0); x>0 lies in the chamber of 1 only, x<0 in s•(0,∞)=(−∞,0) only; s carries (0,∞) onto (−∞,0) | ✓ |
| 37 Centre factor and flip-reducedness (new) | U(2): t*=ℝ², α=(1,−1), α∨=(1,−1); A₂ count | t_ss*=ℝ(1,−1) (span of roots), z*=ℝ(1,1); t*_+={x≥y}={(c,c)+(a,−a): c∈ℝ, a≥0}=z(k)*×t*_(ss,+), wall x=y = z*, no root nonzero on z*; β∨=cα∨ ⇒ β=±α ⇒ c=±1; A₂: 6 open chambers, ρ in the dominant one only, |W|=6 | ✓ |
| 38 Family index vs the folder (new) | `SymplecticGeometry/README.md:66, 80` | index: "RootSystems owns … closed-wall chamber theorem", "T3/T4 consume RootSystems"; folder: 0 RootSystems citations, T3 on Tau Ceti's chambers (`:422`), T4 on HamiltonianReduction R3 and Layer 4.1 (`:733, 916`); main's RootSystems cites the chambers from Tau Ceti (`:191–194, 246`) | R01 |

**Ownership and duplication.** The diff adds no owned statement: it replaces four supplier citations by the pinned declarations that already own the chambers, which is the direction the brief asks for (defer to the library). `roadmaps grep` for `existsUnique_mem_orbit_inter_dominantChamber` finds the same citation in RootSystems on main (`:193`), confirming that the folder and its former supplier now consume one owner. Nothing else in the folder changed, so the previous rounds' searches for Delzant polytopes, Schur–Horn, Duistermaat–Heckman, the kernel bound and the eight declaration names stand. Ownership against open pull requests was checked through the supplied checkouts.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (`README.md:361–362`): no legal copy found by the sources service in earlier rounds; cited by locator, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only): paywalled; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman in the previous rounds.
- Condevaux–Dazord–Molino (named at `README.md:400`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the route.
- The LieGroups Layer 6 compact real root adapter beyond main's stated milestone N(T)/T ≃ W(root system) is built in LieGroups' open revision, cited as main: a stated contract, as in every previous round.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- none (the diff touches no locator; the previous reports' errata stand and were collected then).
