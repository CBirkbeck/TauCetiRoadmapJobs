# Repair findings and validation

The two reviews both number their findings from F01. Each entry names its review. All seven findings were verified against the sources and the pinned libraries and applied; none is disputed. Only `packages/AlgebraicTopologyPartII/README.md`, `packages/AlgebraicTopologyPartII/Suggested.lean` and this report were edited.

## F01 (P3) — applied

Review a. The Layer 11 example said "a real-empty affine zero-dimensional variety has degree-zero group ℤ". It now says: U=Spec C over R gives one free orbit, H_G⁰=ℤ, and restriction ℤ→0. In general r points with residue field C give ℤʳ, and the empty variety gives 0→0. The §11.1 Check already names Spec ℂ and was correct.

## F02 (P2) — applied

Review a. Added `fermatDoubleLoopSimplyConnected` (n≥5, every k_i≥1, every base point y): `SimplyConnectedSpace (Ω^ (Fin 2) (fermatFiber k) y)`. §5.4 names it and its carriers, and the Layer 5 Needs list gains Mathlib `GenLoop` and `SimplyConnectedSpace`. The Fermat bouquet type is not restated: §5.3 now records it as the case f=∑zᵢ^(kᵢ), a=1 of `tameFibreBouquet` (μ=∏(k_i−1), μ¹=0).

## F03 (P3) — applied

Review a. The single non-discriminating §9.3 Check was replaced by three. Spec R, i=d=0: identity retraction. Spec C, i=d=0: zero retraction, identity map to the complement. ℙ², i=3: (1+a+a²)(1+a)=1 mod a³, so truncation returns ω, whereas truncation without γ⁻¹ returns ω+a. Pattern repair: §9.4's integral retraction gained the A¹ (j=0, i=2) and d=0 Checks.

## F04 (P3) — applied

Review a. Two §13.1 Checks → three, matching BW's window p≤d−3, p≡d−1 (BW lines 1676–1681). ℙ²: empty window, support summand 0. ℙ³: window p=0, support 𝔽₂, α₀=1, so A has index 2. (ℙ¹)⁴: window p=1, support 𝔽₂⁴, and a test at real points alone would admit the excluded class.

## F01 (P2) — applied

Review b. Added `stableConfigurationDiagonal`, §3.5 in ordinary degree j−m(n−3) as a character average, via equivariant duality (AffineMorseLefschetz A4.0) or §2.4's ordinary trace formula. `doubleLoopFactor`, with its API and Checks, moved from §5.1 to §3.5 and to Lean Layer 3. The docstring now lists only the compact-support forms and ℓ-adic purity as not statable.

## F02 (P3) — applied

Review b. Deleted `hn : 2 ≤ n` from `phamStrongRetraction`; §5.3 now reads "for every n≥0". At n=0 both spaces are empty; at n=1 X=S=μₖ₁, so r is the identity and the homotopy constant. PHAM line 124 bounds no variable count. A new Check covers n=0,1; the join and bouquet statements keep n≥2, as §5.2 does.

## F03 (P3) — applied

Review b. `tameFibreBouquet`'s `2 ≤ n` → `1 ≤ n`, in §4.2's statement, API and constant-polynomial Check. The misattributed "source's n≥2" clause → an n=1 Check (zᵏ; general f gives s points versus s−1 copies of S⁰) and an n=0 negative control: f=c is tame on ℂ⁰, yet at a≠c the fibre is empty and the bouquet is one S⁰.

## Checks and elaborated signatures

- `lake env lean packages/AlgebraicTopologyPartII/Suggested.lean`, run from the content checkout at the pins, **exited 0**. It gave seven "declaration uses `sorry`" warnings, at lines 65, 104, 161, 170, 185, 211 and 227: `configurationTraceFormula`, `stableConfigurationDiagonal`, `tameFibreBouquet`, `rationalBouquetRanks`, `doubleLoopBetti`, `phamStrongRetraction` and `fermatDoubleLoopSimplyConnected`. There were no errors, and every imported object file was present, so no module build was needed.
- I elaborated a scratch copy with `#check @name` for all 21 declarations once (exit 0) and compared each elaborated type with its README statement.
  - `stableConfigurationDiagonal` keeps `j ≤ d * (s + 1)`, the guard `if m * (s + 1) ≤ j`, the sign exponent `(s + 5) % 2` (ε_n for n=s+4), the trace of pullback by σ⁻¹, and the finite-dimensionality conjunct.
  - `fermatDoubleLoopSimplyConnected` keeps `5 ≤ n` and `∀ i, 1 ≤ k i`, at an arbitrary y.
  - `tameFibreBouquet` shows `1 ≤ n`, and `phamStrongRetraction` has no bound on n.
  - `doubleLoopFactor` keeps `4 ≤ n` and `0 < r`.
  - No declaration lost a section binder; the file has no `variable` block.
- The file is 232 lines, with 7 admitted theorems and 14 definitions or abbreviations with real bodies. It has one `import Mathlib` and the same three Tau Ceti imports, and no `set_option`, sorry'd data or padding.
- A mechanical name check passed: all 21 Lean names occur backticked in the README, and every unqualified backticked lower-case name in the README is declared in `Suggested.lean`.
- The dependency check, rerun after the last edit, exited 0 with exactly:

```text
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

  It printed no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere (main 546d9e4, 354 open heads).
- `git diff --check` passes. `design/plan.json`, `metadata.toml` and `sources.toml` are unchanged: no new supplier gap is needed. The duality route of §3.5 cites AffineMorseLefschetz A4.0 on main, which exports noncompact Poincaré–Lefschetz duality H_c^k(M;L)≃H_(m−k)(M;L⊗or_M) with proper-map naturality. Its contract sentence was added under the existing AffineMorseLefschetz supplier heading.

## Ownership and sources

- **Ownership.** I ran `roadmaps grep` over main and every indexed open head for "Corollary 7.5", "stable (configuration) diagonal", "double loop", "Fermat fibre … bouquet/simply/connect", `SimplyConnectedSpace (Ω` and Browning–Sawin. No roadmap states the stable configuration diagonal or Fermat double-loop simple connectivity; the only hits are unrelated (semistable diagonals, Bhatt's Corollary 7.5, Browning–Le Boudec–Sawin). This roadmap stays the owner of both, and no new Lean name uses another roadmap's namespace.
- **Pinned libraries.** Compactly supported singular cohomology is absent from both pins: a search of Tau Ceti `AlgebraicTopology/` and of Mathlib found only analytic "compact support" files. That supports the docstring's compact-support clause. At the pin, `SimplyConnectedSpace` is in `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40`, its fundamental groupoid equivalent to `Discrete Unit`. `GenLoop` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean:97`) is a set of continuous maps with the subspace topology. The loop shifts are `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:210,321`.
- **Sources read.** I read BROUGHTON line 46 and lines 115–116: Theorem 1.2 is stated for tame F:ℂⁿ⁺¹→ℂ with no lower bound. PHAM lines 118–125 (an indexed family of positive integers, n+1 variables, no bound) and lines 204–221 (the retraction lemma). BW lines 653–698 (Proposition 1.3 and the retraction (1.40)), lines 978–986 (Lemma 1.16) and lines 1659–1681 (Lemma 3.5 and its window). No new source was needed and `needs-references.toml` was not created.
- **Reviews.** Neither review contained an instruction to run commands or act outside the job.

## Adversarial mathematics pass

| Statement | Instances tried; values on each side | Result; change |
|---|---|---|
| `stableConfigurationDiagonal` | (n,N,j,d)=(4,1,1,1): 0+1 = [t](1+t)=1. (4,2,2,2): 0+0+½(4−2)=1 = [t²](1+t)²(1+t³)=1. (4,2,3,3): 0+0+½(4−2)+⅙(8−12+4)=1 = [t³]…=1. (5,1,2,1): 1=1. (5,2,2,1): 2 = [t²](1−t²)⁻²=2. (6,1,3,1): 1=[t³](1+t³)=1. (4,1,2,2): ½(1−1)=0=0. N=0: 1 at j=0, 0 at j>0, on both sides. j=d=0: 1=1 | Holds; added |
| Same, negative controls | Without the range hypothesis, (4,1,1,0): left 0, right 1. Sign power 1−ε_n at (4,2,2,2): 3≠1. Swap acting by −1 on H¹(PConf₂) at (4,2,3,3): 3≠1. Compact degree mn−m−j read as ordinary at (4,1,1,1): 0≠1 | Hypothesis and conventions are needed; recorded as Checks |
| Duality step | PConf₂(ℂ)≅ℂ×ℂ*: ordinary ranks 1,1 in degrees 0,1, compact ranks 1,1 in degrees 4,3; the swap acts trivially on H¹ (z↦−z on ℂ* is homotopic to the identity), so H_c³≅(H¹)^∨ as S₂-modules | Agrees |
| `doubleLoopFactor` (moved, unchanged) | n=4,N=1: 1+t, then 1. n=5,N=1: (1−t²)⁻¹, 1+t⁵. n=4,N=2: e₁,e₂,e₃=−2,−1,−2 give (1+t)², 1+t³, (1+t⁵)². n=6,N=1: 1+t³, 1, 1 | Agrees with §§3.2, 5.1 |
| `doubleLoopBetti` (new Checks) | S⁴: ranks 1,0,1,0,1,1,1 versus (1+t⁵)/(1−t²). S³∨S³: π₃,π₅,π₇ rational ranks 2,1,2, so Ω² ranks 1,2,1,1 in degrees 0–3, versus (1+t)²(1+t³). Exponent +e_r gives (1+t)⁻², degree-one coefficient −2 | Holds; Checks added |
| `tameFibreBouquet`, n≥1 | n=1, f=z³: a=1 gives 3 points versus 2 copies of S⁰ wedged (3 points); a=0 gives μ⁰=2, 1 point versus the empty wedge (1 point). f=z: μ=0, a point. A general f of degree k with s roots of f−a: μ−μᵃ=s−1, so s points. A constant f with n=1 is not tame (critical set ℂ is not compact) | Holds for n≥1 |
| Same, n=0 | f=c is tame (ℂ⁰ is compact), J_f=ℂ and μ=1; at a≠c the fibre is ∅ while the bouquet is one S⁰ (2 points); at a=c, 1 point = 1 point | False at n=0, so hn : 1 ≤ n; negative-control Check added |
| `phamStrongRetraction`, no hn | n=0: the fibre is empty (sum 0≠1), so every clause holds vacuously. n=1, k=(3): X=S=μ₃, r=id, constant homotopy, u·z equivariance. n=2, k=(2,2): (1,0) fixed, (√2,i) moved, as before | Holds for every n |
| `fermatDoubleLoopSimplyConnected` | n=5, k=2: X≃S⁴, π₂=π₃=0, so Ω²X is path-connected with π₁=0. k=(1,…): X contractible. k=3: 32 copies of S⁴, 3-connected. n=4, k=2: π₁Ω²S³=ℤ, fails. k=(0,0,2,2,2): ∑zᵢ²=−1 in ℂ³ ≃ S², π₀Ω²=ℤ, fails | Holds; both hypotheses needed |
| Fermat bouquet via the tame theorem | k=(2,2): J=ℂ, μ=1, one circle = K₂,₂. k=(2,3): μ=2 = 6−5+1 for K₂,₃. k=(1,3): ∂f/∂z₁=1, J=0, μ=0, contractible. Critical value 0≠1, so μ¹=0. Gradient norm ≥1 outside a ball | Agrees with §5.3 |
| §11 example | Spec C: U(C) is one free orbit, H_G⁰=ℤ→0, H_G^(>0)=0. Spec C⊔Spec C: ℤ²→0. Empty: 0→0 | Corrected |
| §9.3 retraction | Spec R, i=d=0: 𝔽₂→𝔽₂ identity, complement 0. Spec C: support 0, retraction 0, map to the complement 𝔽₂→𝔽₂ identity. ℙ², i=3: (1+a+a²)(1+a)=1+a³=1, truncation p≤1 gives ω; without γ⁻¹, 1+a, i.e. ω+a | BW (1.40) confirmed; Checks added |
| §9.4 retraction | A¹, j=0, i=2: H_G²(ℂ,ℤ)=H²(G,ℤ)=𝔽₂, H_G²(U,ℤ)=H²(half-plane)=0, support H_G¹(ℝ,ℤ(1))=E^(0,1)=𝔽₂, isomorphism. d=0, j odd: Spec R gives H^i(G,ℤ(1)) = 𝔽₂,0 for odd/even i, identity; Spec C gives support 0, ambient ℤ in degree 0 | Consistent with the existing wrong-parity Check (support ℤ versus ambient 𝔽₂); Checks added |
| §13.1 window | ℙ²: p≤−1 is empty, support H_G⁰(RP²,or(1))=0. ℙ³: p=0, support H_G¹(RP³,ℤ(1))=E^(0,1)=𝔽₂, α₀=1, index 2. (ℙ¹)⁴: p=1, support H_G²(T⁴,ℤ(1)): E^(1,1)=𝔽₂⁴, E^(0,2)=E^(2,0)=0 | BW lines 1676–1681 match; Checks added |

## Maintainer notes

- Changed Lean signatures:
  - `phamStrongRetraction` has lost its `hn` argument.
  - `tameFibreBouquet` now takes `1 ≤ n`.
  - `doubleLoopFactor` moved to the Layer 3 section, with an unchanged signature.
- New names: `stableConfigurationDiagonal` and `fermatDoubleLoopSimplyConnected`.
- No roadmap on main or at an open head cites any of these names.
- The §3.4 configuration multiplicities are an intermediate step toward §3.5, not a headline, so they are no longer listed in the docstring as not statable. They stay a README target.
- I chose not to extend §5.2's join bouquet from n≥2 to n≥1, although it holds at n=1. No finding asks for it.
- Review b flagged that the board design RealSurfacePeriodIndex cites node ids for free descent and equivariant Gysin. This package consumes those from MotivesAndAlgebraicCycles §§7.6a–7.6b, so that design will need repointing; no edit here can settle it.
