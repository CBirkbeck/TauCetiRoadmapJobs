# Review of VirtualFundamentalClassPartII (pull request #2446 at e264265)

**Verdict:** needs changes

## R01 (P3) — Convention 4 says integral statements are exactly those of Layers 2–3

**Location:** `TauCetiRoadmap/VirtualFundamentalClassPartII/README.md:215–216`: "A statement is integral exactly when it is in Layers 2–3: cycles, rational equivalence, flat pullback, pushforward along proper representable morphisms".

**Claim:** 8.1's groups `Z_*(𝔛)`, `W_*(𝔛)`, the `P`-divisor operations and `β`, which 8.2 and 8.3 use, are integral and lie in Layer 8. The 5.4 API also states an integral identity. Read with Convention 4, 8.2's "element of `W_*`" would be rational.

**Witness:** README line 1776: "on a stack of Convention 1 these groups and `∂` are those of 2.1–2.2". Line 1961: `β = 2·(ν/T)` in `W_*`. Line 776: `Z_0(U) = ℤ^ℕ`. Line 1483: "it already holds on the integral groups of 3.2".

**Repair:** Replace the sentence's opening with: "The Chow groups and the operations on them are integral exactly in Layers 2–3: cycles, rational equivalence, …". After "Gysin maps with algebraic-space sources." add: "The groups `Z_*`, `W_*` of algebraic stacks, the `P`-divisor operations and the rational equivalence `β` of 8.1 are integral as well, and no Chow group is formed from them (8.1); their consequences in 8.2–8.4 are stated in `A_*(·)_ℚ`." Tested on the witness: `β = 2·(ν/T)` and `ℤ^ℕ` are then integral by the Convention, and 8.2's class identity stays rational.

## Previous findings

- R01 of the review of `fed9814` (9.1 called the stack of stable maps a stack of Convention 1 over every field) — repaired: "and, when `k` has characteristic `0`, the stack of stable maps of a given class, which is proper and Deligne–Mumford, is such an open substack" (lines 2253–2255), with the Frobenius Check at lines 2283–2289 ("the automorphism group scheme of `F` is the Frobenius kernel of `PGL₂`, of order `p³`").

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.2 function field, `e(𝒱)` | `BG`; `[𝔸¹/μ₂]`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `B_{𝔸¹}G` | `k`, `e=\|G\|`; `k(x²)`, `e=1`, origin `2`; `ℂ^{ℤ/4}=ℝ`, `e=\|ker\|=2`, not `4`; `e=2`, special stabiliser `1` | holds | none |
| 2.1 cycles, cycle of a substack | `[V(x²)/μ₂]`; atlas `⊔_ℕ Spec k`; a scheme | length `k[x]/(x²) = 2`, so `2·[Bμ₂]`; pullback an infinite sum, outside the free group; Tau Ceti `pointsOfDimension` is `height = n`, the closure dimension | holds | none |
| 3.1 flat pullback | `Spec k → BG`; coarse map of `[𝔸¹/μ₂]`; 2-isogeny `E′ → E` | `[Spec k]`, not `\|G\|`; fibre `k[x]/(x²)`, `2·[Bμ₂]`; sum `(2Q+T)−T = 2Q = π̂(P) = O`, so `π^*` kills `[P]−[O] ≠ 0` | holds | none |
| 3.3 push–pull, localisation | `π` against `π`; `Bμ₂ ⊂ [𝔸¹/μ₂]`; two points of `ℙ¹` | left `\|G\|·[Spec k]`, right `[G]` of degree `Σ[κ(z):k] = \|G\|`; `ℤ → ℤ/2 → 0 → 0` exact; kernel `ℤ·(1, −1)` | holds | none |
| 3.5 homotopy invariance, refined Gysin | `𝔸¹ → pt`; conjugation space `X` over `ℝ`; `z ↦ z²`; `Spec k → BG`; non-flat base change | `A_0(𝔸¹) = 0 = A_{−1}(pt)`; `A_0(X) = 0 = A_1(X × 𝔸¹)`, `div(t) = [0_X]`; `2·[pt]`; `[G]`, degree `\|G\|`; `[pt]` against `0 ∈ A_{−1}` | holds | none |
| 4.1 rational pushforward | `BG → pt`; coarse map, `φ = y`; `L × B(ℤ/2) → L` | `1/\|G\|`, composite `\|G\|·(1/\|G\|) = 1`; `p_*(2·[Bμ₂]) = [0]`, formula `(1/1)·div(y) = [0]`; `(1/2)·[0₁]` | holds | none |
| 4.3 homotopy invariance, Chern classes | `O(−1)` on `ℙ¹`; `L ⊕ L^∨`; `BG` | `s^!s_*[ℙ¹] = −[pt]`, restriction would give `[ℙ¹]`; `c_1 = 0`, `c_2 = −c_1(L)²`; `A_{−i}(BG)_ℚ = 0` | holds | none |
| 5.1 intersection ring, Poincaré duality | `BG → pt` projection formula; `T = L → 𝔸¹`; `T = 𝔸¹ ⊔ 𝔸¹` | left `(1/\|G\|)·[pt]`, right `(1/\|G\|)·[pt]`; degree-weighted product gives `[pt]`; pullback of `id` is `L`, not separated; `ℚ²` in dimension `1` | holds | none |
| 6.2 virtual class | `ℙ¹`, `[O(1) → Ω]`; `[O(−4) → Ω]` through `P`; `L`, `𝓛_n` | `F_1 = O(−1)`, degree `−1`; `P = O(3)²`, `c_1(O(3)²/O(2)) = 6 − 2 = 4 = deg O(4)`; `n·[0₂] = −n·[0₁]` | holds | none |
| 6.3 relative formulas | `k[ε]/(ε²)`; `k[x]/(x^p)`, char `p`; `pt ⊔ 𝔸¹`; node `× ℙ¹` | `2·[pt]`; `rk Ob = 1`, `dim X − d − r = 0`, class `p·[pt] ≠ 0`; `[pt]` against `0`; `−[𝔜 × pt]` | holds | none |
| 7.1 relative obstruction class | `k[x]/(x²)`, `x ↦ ε`; `Spec k → B𝔾_m`; étale | `(ε+aε²)² = ε² ≠ 0` in `k[ε]/(ε³)`; torsor under `1+J ≅ J = Hom(O, J)`, `L_X` gives `0`; `L = 0`, unique | holds | none |
| 9.1 relative spaces of maps | `X = pt`; `id_{ℙ¹}` over a point; Frobenius, char `p`; char `0` | formally étale; `h⁰(T_{ℙ¹}) = 3` against `0`; `Aut F = ker Frob_{PGL₂}`, order `p³`, Lie algebra `k³`; behrend1997 Proposition 4 applies | holds | none |
| 9.2 pushforward and duality | genus `g` curve; `R = k[x_i]/(x_i)²` base change; nodal fibre | `χ(L) = e + 1 − g`, `χ(ω) = g − 1`; ranks `1`, `g` on both sides; component degree `2g(Ẽ) − 2 + #branches` | holds | none |
| 9.4 global resolutions | general `V`; `L = O`; embedded point | `π_*G = π_*(V⊗L^N) ⊗ H⁰(L^{−N}) = 0`, so `0→π_*V→R¹H→R¹G→R¹V→0`; `G=O`, `H=0`, loses `H⁰`; `H⁰(L^{−N}) = k` | holds | none |
| 9.5 rank, virtual dimension | `ℙ²`, `d = 1`, `g = 0`, `n = 0`; general; doubled-point `ℙ¹`; `ℙ¹ × 𝔸¹` | `−3+3+2 = 2`; `3g−3+n+δ+dimX(1−g) = (1−g)(dimX−3)+n+δ`, li-tian1998 4.3 (1); `3 = h⁰(O(2))`; `4 = dim(PGL₂×𝔸¹)` | holds | none |
| Headline 1 (2.2–2.3) integral groups | `[𝔸¹/μ₂]`; `L`; closed point over `P(y) ≠ y` | `ord_0 g(x²)` even, so `ℤ/2`, rationally `0`; `ℤ²/ℤ·(1, 1) ≅ ℤ`; `P(x²)` squarefree (`P(0) ≠ 0`, `P` irreducible), `div(P) = [W]` | holds | none |
| Headline 4 (5.2) moduli spaces | `ℤ/p`-quotient, char `p`; `[𝔸¹/μ₂]`; `M′ = {0}` | `(1/p)·[k(y) : k(y^p)] = 1 ≠ 1/e`; integral `ℤ/2` against `0`, rational `0 = 0`; `2·(1/2)·[pt] = [pt]` | holds | none |
| Headline 5 (5.3) Edidin–Graham ring map | `ℙ(1, 2)`; `Bμ_n`; `𝔾_m` on `𝔸¹` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; stabiliser `𝔾_m`, excluded | holds | none |
| Headline 6 (5.4) degree of a point | `ℝ`-gerbe; `[ℙ¹/μ₂]`; `Spec k(a^{1/p})` | `1/2 = 2/4`, no real point (both `ℤ/4`-torsors have quotient two real points); `∫(2·[𝒫] − [𝒪]) = 1 − 1 = 0`; `p` | holds | none |
| Headline 7 (6.1) comparison bundle | `[0 → 0]` and `[O → O]`; `1 + ξ` on `ℙ¹` | rank `1 = 0+1 = 1+0`; `Hom(E,E) = k⊕k⊕H¹(O(−2))`, homotopies `H⁰(O(−2)) = 0`, `P = O(3)²`, not `O(4)⊕O(2)` | holds | none |
| Headline 8 (7.2) characterisation | char `2`, `k[x]/(x²)`, `φ = (0, id)` | `φ^*ω(id) = 0` while `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)`: condition 3 fails with `H^{−1}(φ) = 0` | holds | none |
| Headline 9 (8.1) `β`, relative invariance | plane example; non-reduced `𝔸¹ × k[ε]`; nodal cubic; `(M, ·, a)` against `2a` | `ω = t/s = η/ν`, `∂ω = [η=0]−[ν=0] = D·[E]−E·[D]`, `β = ν/η`, moved by `η↦η+b`; `2·[ν=0]−2·[T=0]`; `(node, 3·1)`; `1` against `1/2` | holds; matches kresch1999b lines 304, 334–336 | none |
| Headline 10 (8.2–8.3) pullback, functoriality | node, `V(a + b)`; non-reduced base; non-quasi-compact `Z′` | `−[𝔜′ × pt] = −2·[pt × pt]` on both sides; `2·[pt]` on both sides, `𝔜_red` gives `[pt]`; `[pt]` for every `Z′_0` | holds | none |
| Headline 11 (8.4) deformation invariance | `x² − by²`; `B = L`; `xb = 1`; `y² = x^p − a` over `𝔽_p(a)` | `2, 2, 2`; `2` at `0₁`, `0₂`; `1` against `0` without properness; maximal ideal `(y)`, Jacobian `(0, 2y) = 0`, count `1` | holds | none |
| Headline 12 (9.3) obstruction theory | `ℙ¹ → ℙ^r`; elliptic `C → C`; `(L, pr₂)` | `h¹ = 0`, `χ = (r+1)(d+1) − 1`; rank `0`, `c_1(H¹(O) ⊗ O_M) = 0`; `E = Ω_L`, class `[L]`, dimension `1` | holds | none |
| Convention 4, integrality | 8.1 groups; 5.4 API | Convention: integral only in Layers 2–3; 8.1: `Z_0(U) = ℤ^ℕ`, `β = 2·(ν/T)`, groups "those of 2.1–2.2" | contradicts | R01 |
| Declared gaps | both slugs | README lines 374, 389 state both; VirtualFundamentalClass §1.5 has cones of representable closed immersions only, §2.1 integral substacks of separated stacks only | precise, not already supplied | none |
| Pull-request text | description against the head | twelve headlines listed and twelve in the docstring; three open suppliers and five on main, as resolved; build silent | consistent | none |

- Source locators checked against the cached texts: vistoli1989 47, stacks-chow-spaces 21, kresch1999b 19, behrend-fantechi1997 15, behrend1997 7, li-tian1998 4, rydh2015 2, edidin-graham1998 2, keel-mori1997 1, deligne-mumford1969 1, kresch1999 1; none wrong.
- Library declarations opened at the pins: Mathlib `AlgebraicCycle/Basic.lean:44, 69`, `OrderOfVanishing.lean:52, 61, 65`, `Normalization.lean:122, 169, 576, 598` (the `IsIso` instance for smooth `g`), `Sites/Descent/IsStack.lean:49`; Tau Ceti `Chow/Basic.lean:86, 112, 168, 257, 295, 304, 369`, `Chow/ClosedImmersion.lean:211`, `Stack/Basic.lean:37`, `AlgebraicSpace/Basic.lean`, `Normalization/Finite.lean:120`, `Curves/Prestable.lean:45`, `VectorBundle/Degree.lean:82`. No algebraic stack, cotangent complex in a derived category or Chow operation beyond closed-immersion pushforward exists at either pin.
- Cross-roadmap citations resolved: VirtualFundamentalClass at the #1996 head (all cited sections of Layers 0–9, the §2.1 and Layer 2 Checks); StackPointsAndResidualGerbes at the #2429 head (§§0.1, 0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3, 5.4); StableReductionPartII §5.15 at the #1841 head; SchemeAndStackFoundations on main (23 sections, 30 declaration names, the §§1.9, 5.5 and 5.6 Checks); EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra on main; AlgebraicGromovWittenTheory §§4.1–4.3 at the #1998 head.
- Gate rerun at `e264265`: every check 0, `OK`. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file has no declaration, so the `#check` binder comparison and the one-tactic padding probe are empty; no headline is statable at the pins.
- Shape: every definition has an API list and at least three Checks; every layer ends with Examples and Dependencies.

Overlap check: read VirtualFundamentalClass (#1996), StackPointsAndResidualGerbes (#2429), AlgebraicGromovWittenTheory (#1998), SchemeAndStackFoundations (main), MotivicStructuresInModuliOfCurves (#2437), EquivariantIntersectionTheory, StableReduction. Shared objects: the stable-map obstruction theory, which AlgebraicGromovWittenTheory §4.1 states for stable maps in characteristic `0` and 9.3 here owns for every relative space of maps (the earlier roadmap; the README names the difference in one clause); integral closed substacks, owned by VirtualFundamentalClass §2.1 through the declared gap. Nothing else is shared.

Source independence: 16 passages compared with 6 sources, none shared (longest common run 6 words, the list of properties in rydh2015 Theorem B); largest share vistoli1989, 80 of 187 source mentions; contents compared with vistoli1989 §§1–6: independent (its §2 and §6 are merged into 5.2 after its §5, its §4 is no layer, its §3 is split by integrality across Layers 2–3; the order is forced by the *Needs:* lines of 2.2, 3.2, 4.1 and 5.2).

## Not verifiable

- gillet1984 §4 (2.1, 2.2): settled as uncertified, cited by locator.
- fulton1998 Propositions 1.8, 8.1.1 and 10.2, §1.10, Chapter 3 and Corollary 6.3: settled as uncertified, cited by locator.

## Source issues

- **Error** in behrend1997 at Proposition 4, p. 5: the source calls the stack of stable maps a proper Deligne–Mumford stack over an arbitrary field; it should assume characteristic `0` or bound the class against `p`, since the Frobenius of `ℙ¹` has non-reduced automorphisms; affects a stated result.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, p. 10: the source says the tangent bundle of the arbitrary stack `Y′` acts; it should be the tangent bundle of the smooth, regularly embedded `X`, along which the proof translates; affects a stated result.

## For the human reviewers

- StackPointsAndResidualGerbes at the #2429 head (`README.md` lines 54–62 and 2171) names VirtualFundamentalClasses §1.2, which the merge order lists after this roadmap, as the owner of integral closed substacks; `gap:closed-substacks-of-stacks` here assigns them to VirtualFundamentalClass §2.1.
