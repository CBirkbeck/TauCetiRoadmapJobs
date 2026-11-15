# Review of HermitianKTheoryOfPoincareCategories (pull request #1266 at db6600d)

**Verdict:** needs changes

## R01 (P3) — The summary overstates the scope of symmetric surgery

**Location:** Pull request description, `roadmap-summary` block, “Approach and generality”: “Surgery and the fibre sequences need only an associative ring and an invertible coefficient, with no hypothesis on two”.
**Claim:** This includes the symmetric surgery advertised in the same block, but that theorem has additional hypotheses.
**Witness:** `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:1018` requires coherence and finite global dimension; its abstract version at line 1006 requires a bounded t-structure and a finite duality bound.
**Repair:** Replace the sentence with: “Quadratic surgery and the classical Grothendieck–Witt fibre sequences work over associative rings with invertible coefficients, without inverting two. Symmetric surgery over rings requires coherence and finite global dimension; §6.4 supplies its bounded-t-structure version.”

## R02 (P3) — Describe the intentionally empty Lean acceptance test

**Location:** Pull request description, roadmap-folder paragraph: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti”; validation paragraph: “with `sorry` as the only warning”.
**Claim:** The description leaves unstated that this new roadmap has no Lean declarations because its headline carriers are unavailable.
**Witness:** `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/Suggested.lean:7` says it “declares nothing”; lines 36–40 contain only an empty namespace. Direct elaboration emits no warnings. The base has no such roadmap folder.
**Repair:** Write: “Adds the new HermitianKTheoryOfPoincareCategories roadmap. Suggested.lean contains import Mathlib, a module docstring explaining the missing headline carriers, and an empty namespace; it declares no definitions or theorems. The targeted build and direct elaboration pass without warnings.” Keep the other validation results.

## Previous findings

- R01 — repaired: `README.md:13,75,1193` assigns the finite quadratic Arf algebra to GeometricTopology and retains only the quadratic Witt-quotient identification here; `Suggested.lean` has no declarations.
- R02 — repaired: `README.md:19` identifies the sphere comparisons as maps under the sphere through the universal property of 2-completion.
- Earlier R03 — repaired: the gate reports `readme-ids-missing=0`; no local Lean declaration names remain to reconcile.

## Verified sound

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| §0.3 Tate collapse | ℤ, trivial and sign actions; ℚ; 𝔽₂ | ℤ: Ĥ⁻¹(trivial)=Ĥ⁰(sign)=0; ℚ: both parities 0; 𝔽₂: both parities 𝔽₂. | Collapse hypotheses retained. |
| §0.3 truncation and periodicity | E=Hℤᵗᶜ², m=1,3; m=0 control | π₁E=π₃E=0, so both cofibres 0; π₀E=ℤ/2 gives nonzero H(ℤ/2) cofibre. | Correct index and direction. |
| §0.4 opposite transport | R=M=ℤ; X=ℤ[1] | Ordinary dual: ℤ[−1]; coefficient dual then ordinary dual: ℤ[1]; bidual evaluation sends 1↦1. | Two reversals preserve degree. |
| §1.3 fibre identifications | Zero category; general Q and its shift | Zero: K=GW=U=V=0; fib(hyp_Q)=GW(Q[−1]); fib(fgt_Q)=ΩGW(Q[1])=ΩU(Q[2]). | Matches paper-ii line 4855. |
| §§1.3–1.5 grouped periodicity | Genuine index m=0, coefficient ℤ | One shift gives (m,sign)=(1,−); two give (2,+); Ĥ⁰(C₂;−ℤ)=0 identifies the first with negative genuine symmetric. | Group summary retains sign change. |
| §2.1 bounds and propagation | Q=Qgs over 𝔽₂; X=R and R[1] | Fibre top degrees −2,−3 equal −r−k; quadratic cofibres start in 0,−1 equal m+conn(DX). | r=2, m=0; bounds agree. |
| §§2.1–2.3 genuine bounds | Genuine indices 0,1,2 | (m,r)=(0,2),(1,1),(2,0); opposite transport evaluates on projective M and keeps these pairs. | Group summary agrees. |
| §3.1 cobordism, inverse and cokernel | Real symmetric lines; q=⟨1⟩ | Signature(q)=1; signature(−q)=−1; q⊕−q has diagonal Lagrangian and signature 0; both quotient descriptions give 1+(−1)=0. | Sign and inverse agree. |
| §3.3 bounds | (n,a,b)=(0,0,0),(0,0,1),(0,0,2) | (conn X,conn L,conn N)=(0,0,−1),(0,−1,−1),(0,−1,−2). | Ceiling/floor distinction preserved. |
| §3.3 width and empty case | (1,1,2); (1,−1,0) | First: X in [−1,0], L,N in [−2,0]; second: X in [0,−1], hence X=0 and L-group=0. | Width/parity restrictions agree. |
| §3.4 Witt quotient | Symmetric plane B=[[0,1],[1,1]] over 𝔽₂ | L=span(e₁), B(e₁,e₁)=0, L⊥=L; both W and L₀⁰˒⁰ kill B. Rank-one unit has class 1 on both sides. | Quotient identification preserved. |
| §3.5 rewritten Check | Quadratic H(x,y)=xy; symmetric B above | H vanishes on first coordinate line and is hyperbolic; B is metabolic but B(e₂,e₂)=1, excluding hyperbolicity. | Quadraticity remains essential. |
| §§3.3–3.6 widening summary | n=a=0, Q=Qgs over ℝ | W(ℝ)=ℤ by signature; both L₀⁰˒⁰ and L₀⁰˒¹ send ⟨1⟩↦1 and hyperbolic plane↦0. | Group summary agrees. |
| §4.4 quadratic comparison | m=0,2; ℤ, n=−2 | Iso bounds 2m−3=−3,1; surjection bounds 2m−2=−2,2; at (m,n)=(0,−2), ℤ/2→0 has kernel ℤ/2. | Sharp boundary preserved. |
| §§4.4–4.5a grouped identifications | 𝔽₂ in degree 0; ℤ in degrees 1,−1,−3 | 𝔽₂: symmetric Witt ℤ/2, even Witt 0; ℤ formation flavours give ℤ/2,0,0, matching the corresponding L-groups. | No flavour conflation. |
| §4.6 free variant | R=ℤ, n=0,1; zero object | Object intervals [0,0],[−1,0]; Lagrangian intervals [−1,0],[−2,0]; finite projectives over ℤ are free; zero maps to class 0. | Rewritten generality retained. |
| §4.12 quadratic versus genuine | R=ℤ, n=2 | Ranicki quadratic=Lq₂=ℤ/2; Lgq₂=Lgs₋₂=0. | Distinction preserved. |
| §§5.2–5.4 projective summary | A=Hℤ; cone of multiplication by 2 | π₀(cone)=ℤ/2; dual has ℤ/2 in degree −1; two-term recognition applies, projective recognition does not. | Group summary separates cases. |
| §5.5 comparison and §§5.6–5.8 instances | (m,p)=(0,−1),(0,0),(0,1),(2,1) | (iso bound, onto bound)=(−3,−2),(−1,0),(0,1),(1,2), respectively, from both displayed minimum formulas. | Sample and grouped applications agree. |
| §§6.0–6.2 truncation summary | ℤ/2 over ℤ; ℤ | Resolution degrees [0,1]; dual homology degree −1; d=1 gives D(C≤0)⊆C≥−1. | Duality bound retained. |
| §§6.3–6.6 symmetric surgery summary | d=1,r=2,n=−3,−2 | n=−3: (a,b)=(1,1); n=−2: (0,1); lower threshold d−2r=−3; even degree 0 gives W(ℤ)=ℤ. | Parity and threshold agree. |
| §§7.4–7.6 comparison summary | ℤ, d=1, 2-torsion free | General classical comparison: injective at 3, bijective from 4; improved: injective at 1, bijective from 2. | Matches §8.4's use. |
| R01: omitted surgery hypothesis | R=𝔽₂[ε]/ε², k=R/(ε) | Repeated ε-resolution gives Extⁱ_R(k,k)=𝔽₂ for every i≥0; no finite global-dimension bound d exists. | Summary must distinguish the two surgeries. |
| R02: Lean contents | This head, base and elaboration | Base folder absent; head has 0 declarations, 0 sorry terms, 0 warnings. | Description needs updating. |

Rows for untouched statements stand as in the previous review of `febd6d9`.

- 28 source locators re-read in Papers I–III; changed seeded targets §§3.1, 3.3, 4.4 and §5.5's regrouped applications included: paper-iii lines 609, 677, 811, 1104; paper-i lines 1113, 1855; paper-ii lines 4837, 5091.
- 3 pinned declarations opened: `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:167,200` and `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218`; the last still requires invertibility of two.
- 0 Lean declarations: signature-binder and one-tactic probes are inapplicable; the docstring identifies the unavailable spectrum/Poincaré carriers for the periodicity, surgery, Ranicki, comparison, multiplicative and classical GW headlines.
- 7 named supplier roadmaps re-read; affected §6.8a, §6.4, E0/E5, §10.12a and Witt-theory references resolve; 0 new supplier edges, 0 overlap-tool conflicts or dropped-id leads.
- Gate: all counters 0, `OK`; worker gate includes `build=0`; separate targeted Lake build succeeds; direct `lake env lean` exits 0 with no output.
- Dependency output: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- 1 README changed, 142 lines since `febd6d9`; 0 outside-folder changes; PR adds 3 files and 1,385 lines against its base; 0 Lean declarations removed against that base.
- Untouched-citation remark: `README.md:71` names `HasFiniteGlobalDimension`; StablePeriodicCurved Layer 4 now states the uniform bound in prose without that identifier.

Overlap check: read GeometryOfNumbersAndQuadraticArithmetic, GeometryOfNumbersAndQuadraticArithmeticPartII, KTheoryFiniteLocalFields, GeneralAlgebraicKTheoryPartII, RefinedTraceMethods, StableHomotopyKTheory and EnhancedDerivedSheaves; Poincaré carriers/exact Witt groups belong to GeometryOfNumbersAndQuadraticArithmetic, enhanced categories to EnhancedDerivedSheaves, ordinary K-theory foundations to StableHomotopyKTheory/GeneralAlgebraicKTheory, stable-category K-theory to RefinedTraceMethods, and the bounded surgery/Witt identifications checked here to this roadmap; the arithmetic successors consume them.

Source independence: changed passages only; 11 rewritten mathematical passages compared with 3 sources, no copied prose or reused artifacts identified; Paper III has the largest share, 95 of 152 explicitly named source references before the bibliography. Its contents (paper-iii line 19) were compared with the regrouping: no layer added, removed or reordered; bounded surgery feeds the short-complex comparison and symmetric surgery feeds the comparison ranges through the stated Needs edges.

## Not verifiable

- Paper IV's spectrum-level multiplicative refinement remains uncertified, as recorded at `febd6d9`; the unchanged §§7.10–7.11 cite Paper III's attribution, not an accessible text of Paper IV.

## Source issues

- **Misprint** in paper-iii at proof of Corollary 1.2.12, printed p.18, line 829: the source says the final injectivity range is n≤2n−3; it should be n≤2m−3; affects the proof.

## For the human reviewers

- Paper IV is cited without an accessible manuscript in `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:1335`; the multiplicative spectrum claims in §§7.10–7.11 retain only Paper III's attribution as source evidence.
