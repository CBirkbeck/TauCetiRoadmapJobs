# Review of SpinGeometry (pull request #1674 at b8de037)

**Verdict:** needs changes

:robot: Incremental AI re-review of the folder `TauCetiRoadmap/SpinGeometry/` at b8de037. The previous review read 60cedda; since then the folder changed by 2 lines (one README link repointed to `Completed/`), and the merge of main moved the pull request's pins to Mathlib `f6090c70` / Tau Ceti `358314d4`. The repointed link is correct. The gate now fails on the targeted build, which is the one blocking finding (R01). The four P3 notes of the previous review are unchanged at this head and are carried below.

## R01 (P1) — The gate's targeted build fails on Lake's module-system warning

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:1`: "import Mathlib".

**Claim:** The file builds under the gate.

**Witness:** The worker's gate at b8de037 reports `build=1 FAIL`. Reproduced from the worktree: `lake build TauCetiRoadmap.SpinGeometry.Suggested` exits 0 but prints "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`", and the gate counts every non-`sorry` warning. The merge of main bumped `lake-manifest.json` to Mathlib `f6090c70`, a module-system Mathlib; at 60cedda the pins were `6b7abb3c` and the same file passed.

**Repair:** Replace the first line by the module-system header, as main's `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:1–3` and `:36` do: line 1 `module`, a blank line, `public import Mathlib`, the module docstring unchanged, then `@[expose] public section` immediately before `namespace TauCetiRoadmap.SpinGeometry`. Nothing else changes (no `end` is needed for the section). Tested: a scratch copy with exactly this header and a byte-identical body elaborates in 6 s with the same five `declaration uses sorry` warnings and no error; an importer of it resolves all 11 declarations by `#check @name` (bare `module` without `public` would make them private and the importer would report unknown identifiers).

## R02 (P3) — Layer 4 target G4.4a consumes Layer 5's G5.3

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:951`: "*Needs:* G4.2–G4.4; AlgebraicTopology §8.9; … G5.3 for the square-root comparison."; also `:179`, `:933–934`, `:949`, `:969`.

**Claim:** G4.4a's rank-two comparison "Compare G5.3's square-root description, retaining the root isomorphism" is placed in Layer 4.

**Witness:** `README.md:1106` (G5.3 *Needs:* G4.1–G4.4; G5.1) and `:1121` (Layer 5 depends on G4.1–G4.4). Layer 4 needs Layer 5 and Layer 5 needs Layer 4: a coarse layer cycle, though the target graph is acyclic (G5.3 does not need G4.4a). The dependency tool counts only roadmap-level edges and does not see it. Unchanged since 60cedda.

**Repair:** Move the two sentences on the G5.3 comparison (`:933–934`, `:949`) to the end of G5.3 as its closing paragraph (G5.3 already needs G4.1–G4.4); delete "G5.3" from G4.4a's *Needs:* line, from Layer 4's Dependencies (`:969`) and from "How to read the build" (`:179`, `:1578`). Tested on TS²: e=2, root with c₁=1, w₂=0, one lift, stable rank 3: unchanged by where the comparison is stated.

## R03 (P3) — G3.1 narrows the associated-bundle descent to compact groups

**Location:** `README.md:582`: "For a compact Lie group G with orthogonal ρ:G→O(V), unitary μ:G→U(E) and intertwining equality …".

**Claim:** The descent of Clifford algebra and module structures to P×_G Cl(V), P×_G V, P×_G E is stated for compact G.

**Witness:** nicolaescu line 29607–29628 (§12.1.5, p. 636) states the construction for a Lie group G with orthogonal ρ and unitary μ, with no compactness, and the route the README names (the invariant tensor and Lemma 12.1.31, nicolaescu line 29637) uses none. Instance: G=ℝ, ρ(t) = rotation by 2t on the plane, μ(t) = diag(e^(−it), e^(it)) on the Fock plane; μ(t)c(v)μ(t)⁻¹ = c(ρ(t)v) holds (it is the spin representation through ℝ→Spin(2)) and every step of G3.1 goes through. Unchanged since 60cedda.

**Repair:** Replace "compact Lie group G" by "Lie group G", keeping the orthogonal and unitary hypotheses, and add the ℝ-instance as a Check (a non-compact group for which the descent still holds). Nothing downstream uses compactness of G: the only groups applied are Spin(n), SO(n) and the rank-zero μ₂.

## R04 (P3) — Roadmap-level reciprocal supply with three roadmaps on main

**Location:** `README.md:1583`: "GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0."; also `:840` (C3.5), `:1277` (G5.5), `:1426` (R7).

**Claim:** SpinGeometry both supplies and consumes GeneralizedCohomology, CharacteristicClasses and RiemannianGeometry.

**Witness:** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes Spin G1.3; main `CharacteristicClasses/README.md:911` consumes G4.1a; main `RiemannianGeometry/README.md:1337` consumes G1.2/G2.2/G3.4. Main's `SpinGeometry/README.md` already cites G5.5, C3.5 and R7 in the other direction, so both edges of all three pairs predate this pull request. Target-level order at both ends of each pair: G1.3 → G5.5 → G5.0/G6.0; G4.1a → C3.5 → G4.3 (recorded identically at `CharacteristicClasses/README.md:940`); G1.2/G2.2/G3.4 → R7 → G6.4. No target cycle; the mechanical check reports 0 problems. Unchanged since 60cedda.

**Repair:** Not repairable inside this folder: roadmap-level acyclicity would need the algebraic and frame foundations (G1–G3, G4.1) to become a separate earlier roadmap with the three merged consumers repointed, which re-plans three roadmaps on main. Recorded at P3 so the human approver sees it; it does not block on its own.

## R05 (P3) — Complete the Kirby source record

**Location:** `packages/SpinGeometry/sources.toml`, entry `kirby`; `README.md:1597–1599`.

**Claim:** The cited works are recorded in the source manifest with their bibliographic data.

**Witness:** The manifest's `kirby` entry has `locator`, `url`, `fetched_from`, `sha256`, `licence_class`, `status` and `cited_for`, but still no `authors`, `title`, `year` or `venue`. Unchanged since the previous review.

**Repair:** The worker adds `authors = "R. C. Kirby"`, `title = "The topology of 4-manifolds"`, `year = 1989`, `venue = "Lecture Notes in Mathematics 1374, Springer"` to the existing `kirby` entry; never a second key.

## Previous findings

- R01 — not repaired: `README.md:951` still ends "G5.3 for the square-root comparison."; `:179`, `:933–934`, `:949`, `:969`, `:1578` unchanged. Carried as R02.
- R02 — not repaired: `README.md:582` still reads "For a compact Lie group G with orthogonal ρ:G→O(V), unitary μ:G→U(E)". Carried as R03.
- R03 — not repaired: `README.md:1583` still states both directions of the GeneralizedCohomology, CharacteristicClasses and RiemannianGeometry edges; not repairable in the folder. Carried as R04.
- R04 — not repaired: the board manifest's `kirby` entry still lacks `authors`, `title`, `year` and `venue`. Carried as R05.

## Verified sound

**The changed passage.** `README.md:15` now links OrthogonalSpinGroups L0–L2 at `../../Completed/OrthogonalSpinGroups/README.md`. On main (a0ad405) and in the worktree `Completed/OrthogonalSpinGroups/README.md` exists and `TauCetiRoadmap/OrthogonalSpinGroups/` does not, so the old link was dead after main's move and the new one resolves. The cited layers exist there: "Layer 0" at `:331`, "Layer 1" at `:408`, "Layer 2" at `:610`. Every other relative link in the README (18 distinct) resolves in the worktree: HopfRinow under `Completed/`, and AlgebraicTopology, CharacteristicClasses, ComplexKahlerGeometry, DifferentialGeometry, GeneralizedCohomology, PseudodifferentialOperators, SpinRepresentations, RiemannianGeometry, SmoothBundlesConnections and TopologicalKTheory under `TauCetiRoadmap/`. No `*Needs:*` line, section number, supplier or Lean statement depends on the changed line beyond the link itself. None of the seeded sample's targets (G1.1–G1.3, G2.3, G3.3, G3.4, G4.2, G4.3, G5.1–G5.3, G6.1–G6.3, G6.5) falls in the change; their locator checks from the previous report stand (nicolaescu and kirby cache ids unchanged).

**Files outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty: the merge commit brought main's changes in, and against the merged main the pull request changes only this folder. The worktree is clean.

**Gate and build.** The worker's gate at b8de037 passes every text scanner (set_option, blob, latex, prnum, sorry-data, residue, imports, readme-ids, target-ids, depcheck, stray-files, outside-folder all 0) and fails only `build=1` on the Lake warning of R01. `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` from the worktree: exit 0 in 22 s, exactly five `declaration uses sorry` warnings (lines 65, 75, 110, 115, 130), no error. `lake build TauCetiRoadmap.SpinGeometry.Suggested`: "Build completed successfully (8954 jobs)" with the module-system warning. The pins: `lake-manifest.json` has Tau Ceti `358314d4` and Mathlib `f6090c70`, and `.lake/packages` resolves to a packages directory whose mathlib and TauCeti checkouts are at exactly those revisions.

**Suggested.lean unchanged.** `git diff --stat 60cedda HEAD -- TauCetiRoadmap/SpinGeometry/` lists only `README.md` (1 insertion, 1 deletion). The 11 elaborated signatures were compared again with their README statements: none lost a section binder (`multiplicityEvaluation_exists` keeps `[FiniteDimensional ℂ S] [Nontrivial S]`, `cliffordScalarTrace_exists` keeps `[InnerProductSpace ℝ V] [FiniteDimensional ℝ V]` and `Q v = -inner v v`, the chirality theorems keep the orthonormal basis and `IsGeometricAction`). `#check @name` for all 11 declarations was run from a scratch importer of the repaired module (R01's header) and each resolves with the same type. The file has a single `import Mathlib`, no `set_option`, no `lemma`, no sorried data, a docstring on every declaration, and names each geometric headline that is not statable with its missing carrier. One-tactic probes and padding: unchanged from the previous report (20 attempts over the five sorried theorems all fail; no padding).

**Dependency check** (the required command at this head):

```text
depcheck: 235 roadmaps, 2063 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Cross-roadmap citations.** The worker's resolver finds every cross-roadmap citation and Lean name of the README somewhere (main or an open head). The repointed OrthogonalSpinGroups citation is resolved above; the remaining citations were resolved at 60cedda (previous report's table) and the cited files are unchanged on main apart from the `Completed/` moves, which the links now follow.

**Ownership.** Unchanged from the previous report: no other roadmap on main, at the open heads the brief lists, or in the board packages constructs the skeletal spin comparison, the regular-module scalar trace or the Spin Lichnerowicz package. Ownership against open pull requests whose files the brief does not give was not checked beyond the grep index. Coordination note for the human: pull request #1780 revises the same folder from main's older shape and declares four of the same Lean names; one of the two must be rebased onto the other.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-SpinGeometry~5, at 60cedda), where each value was computed; the last row is this head's changed statement. Matrices act on columns; A=[[0,−1],[1,0]], B=[[0,i],[i,0]], Γ=diag(1,−1) on the Fock plane; blades e_I in an orthonormal basis with e_i²=−1.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: Clifford sign (prev.) | unit e; v=0 | c(e)²=−1=Q(e); c(0)²=0=Q(0) | holds |
| Conventions: symbols (prev.) | D=i∂ on ℝ, ξ=1 | σ_geom=i; σ_F=i·i=−1; σ_F(D²)=1=ξ² | holds |
| Conventions: curvature sign (prev.) | unit S² | R(e₁,e₂)e₂=e₁, R(e₁,e₂)e₁=−e₂; K=1; Scal=2 | holds |
| G1.1 base-change direction (prev.) | pin | `equivBaseChange ℂ Q : Cl(Q.baseChange ℂ) ≃ ℂ⊗Cl Q`; `.symm` maps the tensor carrier to the base-changed algebra as `README.md:43` says | holds |
| G1.1 positive-to-negative map (prev.) | e with e²=+1 | (ie)²=−1 | holds |
| G1.1 rank 0 (prev.) | V=0 | Cl=ℝ; `evenUnitaryGroup`={±1}; native `spinGroup` = closure of ∅ = {1} | holds, distinct as stated |
| G1.2 Fock plane (prev.) | e₁, e₂=Je₁ | c(e₁)=A, c(e₂)=B; A²=B²=−Id; AB+BA=0; Γ=iAB=diag(1,−1) | holds |
| G1.2 metric normalization (prev.) | w=e₁^(1,0) | h_ℂ(w,w)=1/2; h_J(e₁,e₂)=i=2h_ℂ(e₁^(1,0),e₂^(1,0)) | holds |
| G1.2 rescaling (prev.) | T=2^(p/2) on Λ^p | TεT⁻¹=√2ε; T(−2ι)T⁻¹=−√2ι | holds |
| G1.3 star positivity (prev.) | blades k=0..3 | star(e_I)e_I=+1 every k; τ(star a·a)=Σa_I² | holds; faithful |
| G1.3 negative control (prev.) | Q=+⟨·,·⟩ | star(e)e=−e²=−1, τ=−1<0 | hypothesis necessary |
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
| G3.1 trivial line; compactness (prev.) | a+be; G=ℝ | ‖a+be‖²=a²+b²; μ(t)c(v)μ(t)⁻¹=c(ρ(t)v) | holds without compactness (R03) |
| G3.3 Hermitian insufficient (prev.) | B=diag(i,−i), c(e₁)=A | BA−AB=[[0,−2i],[−2i,0]] | holds |
| G3.4 exterior operator (prev.) | ℝ, (f,h) | D(f,h)=(−h′,f′); D²(x²,0)=(−2,0)=−∂² | holds |
| G4.1a covers; G4.1b differential (prev.) | Spin(2) z=i,−1; θ↦2θ | z²=−1,1; kernel {±1}; derivative 2 | holds |
| G4.2 metric change (prev.) | g′=4g | B^(−1/2)=1/2; ‖e/2‖_g′=1 | holds |
| G4.3 obstruction (prev.) | S² plane bundles e=1,2 | w₂=1,0; lifts 0,1 | holds |
| G4.4 torsor (prev.) | S¹; T² | H¹ orders 2, 4; twice-twisted = original | holds |
| G4.4a skeletal classes; stabilization; rank-two criterion (prev.) | S¹ trivial rank 3; disc; TS²; H²=ℤ,e=2; e=1; H²=ℤ/2 | 2 classes = 2 lifts; cochain 1 but H²=0; e=2, w₂=0, one lift; c=1; none; ρ(e)≠0 | holds |
| G4.4a layer order (prev.) | Needs lines | G4.4a → G5.3 → G4.1–G4.4: 0 target cycles, 1 layer cycle | R02 |
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
| Scope citation "OrthogonalSpinGroups L0–L2" (this head) | path; layers | `Completed/OrthogonalSpinGroups/README.md` exists on main and in the worktree, `TauCetiRoadmap/OrthogonalSpinGroups/` does not; Layers 0, 1, 2 at `:331`, `:408`, `:610` | holds; no change |

## Not verifiable

- Lawson–Michelsohn Chapters I–II and Atiyah–Bott–Shapiro §§6 and 11 are settled as `uncertified` in the manifest (paywalled); cited by locator only, not opened.
- Kirby's OCR is damaged at kirby line 1141 and 1156; the previous report's G4.4a checks use the legible surrounding lines only. G4.4a is untouched at this head.

## Source issues

- none
