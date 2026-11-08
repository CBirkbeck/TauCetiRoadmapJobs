# Review of SpinGeometry (pull request #1674 at e586e98)

**Verdict:** accepted

:robot: Incremental AI re-review of the folder `TauCetiRoadmap/SpinGeometry/` at e586e98. The previous review read b8de037; since then the folder changed by 40 lines (28 insertions, 12 deletions): the module-system header of `Suggested.lean`, the G5.3 square-root comparison moved out of G4.4a into G5.3 with a new closing paragraph and two new Checks, and G3.1's associated-bundle descent restated for any Lie group with a non-compact Check. No file outside the folder changed. The gate passes, the dependency check reports no problem, every repair is correct, and no finding remains, so this folder is ready for a human's final approval. The AI does not approve or merge.

## Previous findings

- R01 — repaired: `Suggested.lean:1–3` now read `module`, blank, `public import Mathlib`, and `:36` `@[expose] public section` precedes `noncomputable section`; the body is byte-identical to b8de037. The gate's targeted build passes (`build=0`), `lake env lean` exits 0 with exactly the five `declaration uses sorry` warnings (lines 69, 79, 114, 119, 134), and a scratch importer resolves all 11 declarations by `#check @name` with the types of `signatures.md`.
- R02 — repaired: `README.md:933–934` and `:949` no longer mention G5.3; G4.4a's *Needs:* (`:951`) ends at "C7.3 for the Euler comparison and radial stable framing"; Layer 4's Dependencies (`:967–969`) list no G5.3; `:179` and `:1590` now say "G5.3 compares its square roots with G4.4a's rank-two criterion"; G5.3 gained the comparison paragraph (`:1103–1113`), "G4.4a for the rank-two criterion" in its *Needs:* (`:1116`) and "G4.1–G4.4a" in Layer 5's Dependencies (`:1133`). Layer 4 no longer needs Layer 5; the edge G5.3 → G4.4a points down. The new paragraph and Checks are verified below (no new problem).
- R03 — repaired: `README.md:582` "For a Lie group G with orthogonal ρ:G→O(V), unitary μ:G→U(E)"; `:587` "with no compactness assumed of G"; the G=ℝ instance is the fourth Check at `:602`, with the matrix value recomputed below. nicolaescu line 29607–29610 (§12.1.5, p. 636) states the construction for a Lie group with orthogonal ρ and unitary μ, no compactness.
- R04 — not repaired: settled not actionable; the repair reply marks it not actionable in this folder, with the reason the finding itself gave (all three reciprocal pairs predate the pull request and are on main in both directions: main `GeneralizedCohomology/README.md:42,1908`, `CharacteristicClasses/README.md:911`, `RiemannianGeometry/README.md:117,1337` at c9a16a0, rechecked). Target-level order at both ends is acyclic and the dependency check reports 0 problems. Not re-raised: the reason is right.
- R05 — not repaired: settled not actionable; the repair reply answers that the repair job may not change an existing record of the board manifest and addresses the values to the worker. The `kirby` entry (and, the same way, the `nicolaescu` entry) of `packages/SpinGeometry/sources.toml` still lacks `authors`, `title` and `year`; the entries have `url`, `fetched_from`, `sha256`, `licence_class`, `status` and `cited_for`, and the README's references (`:1597–1611`) carry the full bibliographic data. Not a change to the pull request; left for the worker (`authors = "R. C. Kirby"`, `title = "The topology of 4-manifolds"`, `year = 1989`; `authors = "L. Nicolaescu"`, `title = "Lectures on the Geometry of Manifolds"`).

## Verified sound

**The changed passages, with their sources.**

- G3.1 (`README.md:582–587`, `:602`): nicolaescu line 29601–29628 (§12.1.5, pp. 636–637) requires a Lie group G, an orthogonal ρ, a Clifford module c and a representation μ making diagram (12.1.2) commute, with μ unitary when E carries a metric; no compactness. The invariant-tensor reading of the intertwining law is nicolaescu line 29623–29626, and Lemma 12.1.31 (line 29637) is for an arbitrary Lie group. Example 12.1.33 (line 29651–29662, p. 637) is the SO(V) exterior instance the README names. The descent applies to any principal G-bundle P as stated.
- G5.3 (`README.md:1103–1116`, `:1122–1124`): nicolaescu line 30117–30125 (Example 12.1.54, pp. 648–649) gives Cl₂ ≅ ℍ, Spin(2) = {a+bk : a²+b²=1} ≅ S¹ and the covering e^(iθ) ↦ e^(2iθ): the squaring cover the paragraph relies on. The comparison with G4.4a cites G4.4a's own criterion (`:932–934`: Spin existence iff e(V) ∈ 2H²(X;ℤ), including torsion, via w₂ = ρe) and G4.4's torsor (`:860–862`: free transitive H¹(X;ℤ/2) action by central ℤ/2-twisting). Conventions `:35–36` require CW type for the singular H¹/H² statements, which the line-bundle classification by c₁ needs.
- G4.4a (`README.md:883–969`, untouched except for the deletions): kirby line 1115–1132 (Chapter IV, p. 33) defines the skeletal Spin structure for n ≥ 3 and stabilizes by ε¹ for n = 2 and ε² for n = 1; kirby line 1155–1167 (p. 34) gives existence iff w₂ = 0 and the H¹(X;ℤ/2) torsor; kirby line 1168–1172 the equivalence of the two definitions. (OCR is unreadable at kirby line 1141 and 1156; the surrounding lines carry the statements.)
- Cross-roadmap citations in the changed lines, resolved on main c9a16a0: CharacteristicClasses C3.2 is item 2 of `## C3` (`CharacteristicClasses/README.md:826–841`) and proves `w_n = e(E) mod 2` (`:835`), the equality w₂ = ρe the rank-two criterion uses; C7.3 is item 3 of `## C7` (`:1554–1566`) with TSⁿ's Euler number and the radial extension; AlgebraicTopology §8.9 is Stage 8 item 9 "Relative obstruction cochains" (`AlgebraicTopology/README.md:1870`); TopologicalKTheory T6.4 is item 4 of `## T6` (`TopologicalKTheory/README.md:1021–1030`, principal-bundle descent); SpinRepresentations Layer 2 is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md` (the README's link `:14` resolves there). The worker's resolver lists no citation or Lean name found nowhere.

**Files outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty; the worktree is clean. The folder's `PROGRESS.md`, `STATUS.md`, `metadata.toml` exist on main's copy of the folder too and the gate's `stray-files` is 0.

**Gate, build, elaboration.** The gate at e586e98 (the worker's run and mine): every scanner 0, `build=0`, `OK`. `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` from the worktree: exit 0 in 6 s, five `declaration uses sorry` warnings and nothing else. Pins: `lake-manifest.json` has Tau Ceti `358314d4` and Mathlib `f6090c70`, and `.lake/packages/mathlib` and `.lake/packages/TauCeti` are checked out at exactly those revisions.

**Suggested.lean.** The diff since b8de037 is the five header lines only (`-import Mathlib`, `+module`, `+public import Mathlib`, `+@[expose] public section`); the 11 declarations are byte-identical. A scratch importer (`import TauCetiRoadmap.SpinGeometry.Suggested` and `#check @name` for all 11) elaborates with exit 0 and prints the same types as `signatures.md`: `multiplicityEvaluation_exists` keeps `[FiniteDimensional ℂ S] [Nontrivial S]`, `cliffordScalarTrace_exists` keeps `[InnerProductSpace ℝ V] [FiniteDimensional ℝ V]` and the hypothesis `Q v = -inner v v`, and the four chirality statements keep the `OrthonormalBasis (Fin (2 * ℓ)) ℝ V` and `IsGeometricAction Q ρ` binders; none lost a section binder. The file ends with `end MetricAction` and `end TauCetiRoadmap.SpinGeometry`; no `set_option`, no `lemma`, no sorried data, a docstring on every declaration, and the module docstring names each geometric headline that is not statable with its missing carrier (the square-root comparison moved in this head is listed there as "Plane-bundle square roots need the root-isomorphism and principal-lift comparison"). One-tactic probes and padding: the body is unchanged, so the previous reports' result stands (20 attempts over the five sorried theorems all fail; no padding).

**Dependency check** (the required command at this head):

```text
depcheck: 233 roadmaps, 2148 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Inside the folder, the target-level order of the moved comparison is now G4.1–G4.4 → G4.4a → G5.3 (G5.3's *Needs:* `:1116`; G4.4a's *Needs:* `:951` cites only Layer 4 and suppliers): the coarse Layer 4 ↔ Layer 5 cycle of the previous R02 is gone.

**Ownership.** Unchanged from the previous report: no roadmap on main, at the open heads the brief lists, or in the board packages (`AnalyticNumberTheory`, `LawrenceVenkateshMethod`, `LogicAndDefinabilityInNumberTheory`) constructs the skeletal Spin comparison, the plane-bundle root comparison, the regular-module scalar trace or the Spin Lichnerowicz package. Ownership against open pull requests whose files the brief does not give was not checked beyond the grep index. Coordination note for the human, as before: pull request #1780 revises the same folder from main's older shape and its `Suggested.lean` declares nine of the same fully qualified names (`multiplicitySpace`, `cliffordMultiplication`, `IsGeometricAction`, `chirality`, `chirality_sq`, `chirality_anticommutes`, `positiveSpinors`, `negativeSpinors`, `isCompl_spinors`); whichever merges second must be rebased onto the other.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous reports (PRREVIEW-SpinGeometry~5 at 60cedda, carried through ~13), where each value was computed; the last five rows are this head's changed statements, computed now (matrix identities in a Python script in the scratch directory, the rest by hand). Matrices act on columns; A=[[0,−1],[1,0]], B=[[0,i],[i,0]] on the Fock plane.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: Clifford sign (prev.) | unit e; v=0 | c(e)²=−1=Q(e); c(0)²=0=Q(0) | holds |
| Conventions: symbols (prev.) | D=i∂ on ℝ, ξ=1 | σ_geom=i; σ_F=i·i=−1; σ_F(D²)=1=ξ² | holds |
| Conventions: curvature sign (prev.) | unit S² | R(e₁,e₂)e₂=e₁, R(e₁,e₂)e₁=−e₂; K=1; Scal=2 | holds |
| G1.1 base-change direction (prev.) | pin | `equivBaseChange ℂ Q : Cl(Q.baseChange ℂ) ≃ ℂ⊗Cl Q`; `.symm` maps the tensor carrier to the base-changed algebra | holds |
| G1.1 positive-to-negative map (prev.) | e with e²=+1 | (ie)²=−1 | holds |
| G1.1 rank 0 (prev.) | V=0 | Cl=ℝ; `evenUnitaryGroup`={±1}; native `spinGroup`={1} | holds, distinct as stated |
| G1.2 Fock plane (prev.) | e₁, e₂=Je₁ | c(e₁)=A, c(e₂)=B; A²=B²=−Id; AB+BA=0; Γ=iAB=diag(1,−1) | holds |
| G1.2 metric normalization (prev.) | w=e₁^(1,0) | h_ℂ(w,w)=1/2; h_J(e₁,e₂)=i=2h_ℂ(e₁^(1,0),e₂^(1,0)) | holds |
| G1.2 rescaling (prev.) | T=2^(p/2) on Λ^p | TεT⁻¹=√2ε; T(−2ι)T⁻¹=−√2ι | holds |
| G1.3 star positivity (prev.) | blades k=0..3 | star(e_I)e_I=+1 every k; τ(star a·a)=Σa_I² | holds; faithful |
| G1.3 negative control (prev.) | Q=+⟨·,·⟩ | star(e)e=−1, τ=−1<0 | hypothesis necessary |
| G1.3 normalization (prev.) | n=0,1,2 | tr L₁=1,2,4; 2^(−n)·tr=1 | holds |
| G1.3 cyclicity (prev.) | a=e₁,b=e₂; a=b=e₁ | 0=0; −1=−1 | holds |
| G1.3 Check (prev.) | a=1+e₁+2e₂ | τ(star a·a)=6; unnormalized trace of 1 is 4 | holds |
| G1.3 Morita evaluation (prev.) | V=0,S=ℂ,E=ℕ→₀ℂ; E=0; E=S; general E | T↦T(1) bijective; 0≃0; e(s⊗Id)=s; Hom(S,⊕_I S)=⊕_I ℂ | holds for infinite-dimensional E |
| G1.4 central label and ψ(ω) (prev.) | n=1; n=3; plane (e₁,e₀) | (ie)²=1; (i²e₁e₂e₃)²=1; ψ(ie₁)=−Γ | holds |
| G2.1 Γ² and anticommutation (prev.) | ℓ=0,1,2 | (c₁⋯c_2ℓ)²=(−1)^ℓ; (i^ℓ)²=(−1)^ℓ; Γ²=1; Γc_j=−c_jΓ | holds |
| G2.1 degenerate carriers (prev.) | ℓ=0; S=0 | Γ=Id, S⁺=⊤, S⁻=⊥; S=0 gives ⊥,⊥ complementary | holds |
| G2.1 unused clause (prev.) | Gram diag(1,2) | A†=[[0,2],[−1/2,0]]≠−A, Γ²=1 | skew-adjointness unused; note only |
| G2.2 Hodge formula (prev.) | plane p=0,1,2 | Γ1=i e₁₂, Γe₁=i e₂, Γe₁₂=−i; i^(1+p(p−1))*ω agrees | holds |
| G2.2 Hilbert–Schmidt; reverse-dual chirality (prev.) | plane Id; ℓ=1 | 2^(−1)·2=1; Γ_(S*)=(−1)^ℓΓ_Sᵀ=diag(−1,1) | holds |
| G2.3 product grading (prev.) | two planes | eigenvalues (1,−1,−1,1); cross terms (cΓ+Γc)⊗c_W=0 | holds |
| G3.1 trivial line (prev.) | a+be | ‖a+be‖²=a²+b² | holds |
| G3.3 Hermitian insufficient (prev.) | B=diag(i,−i), c(e₁)=A | BA−AB=[[0,−2i],[−2i,0]] | holds |
| G3.4 exterior operator (prev.) | ℝ, (f,h) | D(f,h)=(−h′,f′); D²(x²,0)=(−2,0)=−∂² | holds |
| G4.1a covers; G4.1b differential (prev.) | Spin(2) z=i,−1; θ↦2θ | z²=−1,1; kernel {±1}; derivative 2 | holds |
| G4.2 metric change (prev.) | g′=4g | B^(−1/2)=1/2; ‖e/2‖_g′=1 | holds |
| G4.3 obstruction (prev.) | S² plane bundles e=1,2 | w₂=1,0; lifts 0,1 | holds |
| G4.4 torsor (prev.) | S¹; T² | H¹ orders 2, 4; twice-twisted = original | holds |
| G4.4a skeletal classes; stabilization; rank-two criterion (prev.) | S¹ trivial rank 3; disc; TS²; H²=ℤ,e=2; e=1; H²=ℤ/2 | 2 classes = 2 lifts; cochain 1 but H²=0; e=2, w₂=0, one lift; c=1; none; ρ(e)≠0 | holds |
| G5.0 external action, adjoints, equivariance (prev.) | Cl(0,1); R_w, ε; g=e₁e₂ | C₊²=Id, c₋²=−Id, C₊c₋+c₋C₊=0; (R_wε)²=‖w‖²; even g commutes | holds |
| G5.3 characters; roots on S² (prev.) | z=cos θ+sin θ e₁e₂; e=2; e=1 | ρ(z)=diag(e^(−iθ),e^(iθ)); E weight z²; c₁(root)=1; 2c₁=1 unsolvable | holds |
| G6.0/G6.3 spin curvature; contraction (prev.) | S²; constant curvature n=0..4 | c₁c₂R^S=½=Scal/4; Σ=0,0,1/2,3/2,3=n(n−1)/4 | holds |
| G6.0 volume signs; KO calibrations (prev.) | Cl(0,4), Cl(0,8); circles, T² | sums 0; periodic kernel 1 → η, antiperiodic 0 | holds |
| G6.1 local operator (prev.) | D=i∂; f=x | D e^(ikx)=−k e^(ikx); [D,x]=c(e) | holds |
| G6.2 curvature factor; perturbation (prev.) | plane B; D′=D+Id | 2c₁c₂B; D′²−D²=2D+Id | holds |
| G6.3 twist (prev.) | F₁₂=if·Id | c₁c₂·if=fΓ, eigenvalues ±f | holds |
| G6.4 harmonics; G6.5 spectra (prev.) | flat circle; point; T²; Sⁿ | (1,1); (1,0); ℤ and ℤ+½; Scal=n(n−1) | holds |
| G6.6 symbol (prev.) | ξ≠0; t∈[0,1] | c(ξ)⁻¹=−c(ξ)/‖ξ‖²; |e^(iπt/2)|=1 | holds |
| G6.7 volume identities; quaternionic parity (prev.) | Cl(0,4); J(z,w)=(−w̄,z̄); flat T⁴ | ω₋²=1; R_ω=−Γ on even part; J²=−Id; index 0=2·0 | holds |
| G3.1 descent for non-compact G (this head, `:582–587`, Check `:602`) | G=ℝ, ρ(t)=rotation by 2t, μ(t)=diag(e^(−it),e^(it)); t=0.3, 1.1, 2.5; v=e₁ and v=e₂ | c(ρ(t)e₁)=cos2t·A+sin2t·B=[[0,−e^(−2it)],[e^(2it),0]]=μ(t)Aμ(t)⁻¹ (difference 0 to 2·10⁻¹⁶ numerically, equal exactly since a·(−1)·b⁻¹=−e^(−2it) and b·a⁻¹=e^(2it) for a=e^(−it), b=e^(it)); at e₂: c(ρ(t)e₂)=[[0,ie^(−2it)],[ie^(2it),0]]=μ(t)Bμ(t)⁻¹; μ unitary, ρ orthogonal, ℝ non-compact | holds; the Check's displayed value is right and the law holds on all of V, not only at e₁ |
| G5.3 comparison: existence (this head, `:1105–1108`) | X=S², e(E)=2; e(E)=1; X=point; H²=ℤ/2 with e its generator | 2c₁=2 ⇒ c₁=1 ⇒ one root (H¹(S²;ℤ/2)=0); 2c₁=1 has no integral solution ⇒ no root, and ρ(1)≠0 ⇒ w₂≠0 ⇒ no lift; point: one root, c₁=0; 2H²=0 so e∉2H² and no root, agreeing with G4.4a's Check `:958` | holds, both directions agree with G4.4a |
| G5.3 comparison: torsor action and Bockstein (this head, `:1108–1113`) | α∈H¹(X;ℤ/2) with real line ℓ_α; X=T²; X=ℝP³; α=0 | (L⊗ℓ_ℂ)^(⊗2)=L^(⊗2)⊗(ℓ⊗ℓ)_ℂ≅E via ℓ⊗ℓ≅ℝ, so roots go to roots; c₁(L⊗ℓ_ℂ)=c₁(L)+β(α) with β(α) the integral Bockstein, 2β(α)=0; T²: H²=ℤ torsion-free ⇒ β=0, c₁ unchanged; ℝP³: β(a)=generator of H²=ℤ/2≠0; α=0 acts trivially | holds; "vanishes when H²(X;ℤ) has no 2-torsion but not in general" is exactly right |
| G5.3 Check T² (this head, `:1122`) | trivial E on T² | roots = {φ: T²→U(1)}/{g²} = H¹(T²;ℤ)/2 = ℤ²/2ℤ² (the null-homotopic maps are squares): 4 = |H¹(T²;ℤ/2)|; every L has 2c₁=0 ⇒ c₁=0 in ℤ; the four G6.5 torus lifts match; a c₁-only count gives 1 | holds; negative control sound |
| G5.3 Check ℝP³ (this head, `:1123–1124`) | trivial E on ℝP³ | solutions of 2c₁=0 in H²(ℝP³;ℤ)=ℤ/2: c₁∈{0,a}, both realized (trivial line; γ_ℂ with c₁(γ_ℂ)=β(w₁γ)=a≠0 and γ_ℂ⊗γ_ℂ=(γ⊗γ)_ℂ trivial); H¹(ℝP³;ℤ)=0 so each L carries one root class; 2 = |H¹(ℝP³;ℤ/2)| | holds |
| G5.3 orientation reversal and labels (this head, `:1101`, unchanged words, re-read against the new paragraph) | J↦−J | E↦E̅, e(E)↦−e(E), c₁(L)↦−c₁(L): a root of E̅ is L̄ = L*, so S⁺ and S⁻ interchange, agreeing with "`S⁻` is the root of E, `S⁺` its dual" | holds |

## Not verifiable

- Lawson–Michelsohn Chapters I–II and Atiyah–Bott–Shapiro §§6 and 11 are settled as `uncertified` in the manifest (paywalled); cited by locator only, not opened. Neither is cited by a changed line.
- Kirby's OCR is unreadable at kirby line 1141 and 1156 (p. 33–34, two lines of the principal definition and of the orientability sentence); the surrounding lines carry every statement G4.4a cites.

## Source issues

- **Misprint** in nicolaescu at Example 12.1.54, printed page 649 (cache line 30125): the source writes the covering map as from Spin(1) to SO(2); it should be from Spin(2) to SO(2), as the displayed formula e^(iθ) ↦ e^(2iθ) and the preceding line Spin(2) ≅ S¹ show; affects nothing.
