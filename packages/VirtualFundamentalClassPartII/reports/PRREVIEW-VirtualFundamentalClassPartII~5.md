# Review of VirtualFundamentalClassPartII (pull request #2446 at c5f07fa)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement recomputed in this round holds, including the two sections new since the last review (1.0 on integral closed substacks and their images, and the zero-cycle degree of 5.4), and the earlier finding on Convention 4 is repaired. There are three small corrections (the description's list of open suppliers, a sentence on what AlgebraicGromovWittenTheory takes from this roadmap, and the account of what VirtualFundamentalClass §9.5 states) and one format note, none blocking. Three bookkeeping questions on ownership are left for the human reviewers.

## C01 — The description still lists VirtualFundamentalClass and StackPointsAndResidualGerbes as open pull requests

A reader of the description would wait for two merges that have already happened. The description says "VirtualFundamentalClass, StackPointsAndResidualGerbes and StableReductionPartII are open pull requests that merge first (listed below)"; both of the first two are on main (`TauCetiRoadmap/VirtualFundamentalClass/README.md`, `TauCetiRoadmap/StackPointsAndResidualGerbes/README.md`), and the generated dependency block below that sentence already ticks them.

Text that would be right: "StableReductionPartII is an open pull request that merges first (listed below); VirtualFundamentalClass, StackPointsAndResidualGerbes, SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are on main."

## C02 — The overview says AlgebraicGromovWittenTheory takes its obstruction theory and deformation invariance from this roadmap; at its head it does neither

A reader who opens AlgebraicGromovWittenTheory to see how Layer 9 is used finds no citation of this roadmap. The overview (line 52) says "AlgebraicGromovWittenTheory takes from this roadmap its stable-map obstruction theory and the deformation invariance of its invariants", and Downstream consumers (lines 2240–2244) adds that 8.4 "gives deformation invariance of its invariants" and 5.4 "computes its degrees on coarse spaces". At the head of its pull request (#1998), that roadmap's §§4.1–4.3 construct the obstruction theory, the global resolution and the virtual dimension citing only VirtualFundamentalClass §§3.3, 6.1, 7.3 and 9.2, and its README contains no statement of deformation invariance and no degree on a coarse space.

The smallest change is to say what these layers state rather than what the other roadmap takes: in the overview, "Layer 9 states, for every relative space of maps, the obstruction theory that AlgebraicGromovWittenTheory §4.1 states for stable maps, and 8.4 the deformation invariance available to its invariants"; in Downstream consumers, "8.4 would give" and "5.4 would compute". The comparison sentences in 9.3 and 9.5 are accurate as they stand.

## C03 — 8.3 and the scope paragraph say VirtualFundamentalClass §9.5 states both cases under the hypotheses of Behrend–Fantechi Proposition 7.5; its graph case also assumes the base smooth

The reader is told that 8.3 differs from §9.5 only in separatedness, and so misses the main new content of 8.3's second case. In 8.3 (lines 1852–1854): "This extends VirtualFundamentalClass §9.5, which states both cases under the hypotheses of behrend-fantechi1997 Proposition 7.5 for separated stacks with the resolution property, to stacks that need not be separated", and the scope paragraph (lines 2313–2314) repeats it. On main, §9.5 proves the graph case only "When `Y` is smooth over `k`, both `Z,Z′` are smooth over `Y`, and `Z′ → Y` is of finite type" (`TauCetiRoadmap/VirtualFundamentalClass/README.md`, lines 1424–1433), whereas behrend-fantechi1997 Proposition 7.5 (lines 1734–1736) is printed over a base of pure dimension. 8.3 states that case "over any `𝔜` of pure dimension", through 8.1's invariance along `T_{Y′/𝔐}`.

Would read correctly as: "This extends VirtualFundamentalClass §9.5, which states the smooth case over a base of pure dimension and the graph case over a base smooth over `k`, for separated stacks with the resolution property, to stacks that need not be separated and, in the graph case, to every base of pure dimension", with the same clause in the scope paragraph and in the supplier contract for §§9.2–9.6.

## N01 — One page for two line ranges in 8.1

In 8.1 (lines 1625–1626) "vistoli1989 Lemmas 3.16 and 4.6 (p. 641, lines 1172–1174 and 1451–1470)" gives p. 641 for both ranges; lines 1451–1470 are on p. 648, as the citation of Lemma 4.6 (ii) in 3.5 has it.

## Previous findings

- R01 of the review of `e264265` (Convention 4 said a statement is integral exactly when it is in Layers 2–3, against 8.1's integral groups and 5.4's integral identity) — repaired: "The integral groups and operations of this roadmap are those of Layers 2–3 (…) and those of 8.1, which forms no Chow group: the cycles and rational equivalences `Z_*`, `W_*` of algebraic stacks, the `P`-divisor operations and the canonical rational equivalence `β`" and "A statement of another layer may use them, as 5.4's API uses 3.2's pushforward" (lines 149–156).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.0 integral closed substacks, images (sample) | `[V(x)/μ₂]`, `[V(x²)/μ₂]`; coarse map; `𝔾_m → 𝔸¹` | same support, only first reduced; `p(Bμ₂) = V(y)`, degree `(1/2)·1`; image not closed, no substack | holds; vistoli1989 lines 245–250, 254–269 | none |
| 1.1 proper covers (sample) | `L`; `B_{𝔸¹}G`; `BG → pt` base change | `Q ×_L Q = Q ⊔ Q\|_{t≠0} = Q ×_{𝔸¹} G`, cover degree `2`; torsor degree `2` against `1` on a connected `X`; source `BG` no scheme | holds; rydh2015 lines 81–85, deligne-mumford1969 line 1012 | none |
| 1.2 function field, `e` (sample) | `BG`; `[𝔸¹/μ₂]`; `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]` | `k`, `\|G\|`; `k(x²)`, `1` (origin `2`); `ℝ`, `2` not `4`; global functions `k`, `trdeg k(t²) = 1` | holds; vistoli1989 lines 347–353, 422–425 | none |
| 1.3 degree | `Bμ₃/ℚ` inertia; `S₃`; `ℤ/p`-quotient | `1 + (3/3)·2 = 3`; `1 + 3 + 2 = 6`; `(1/p)·[k(y):k(y^p)] = 1 = p/p` | holds | none |
| 2.1 cycles (sample) | `[V(x²)/μ₂]`; `⊔_ℕ Spec k` | length `2`, cycle `2·[Bμ₂]`; pullback has infinitely many terms, outside the free group, in `ℤ^ℕ` | holds; vistoli1989 lines 891–894, 967–971 | none |
| 3.1 flat pullback | 2-isogeny `π : E′ → E` | sum of `π^{-1}P` minus `ker π` is `(2Q + T) − T = 2Q = π̂(P) = O`; `[P] − [O] ≠ 0` | holds | none |
| 3.2 representable pushforward (sample) | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `Spec k → BG → Spec k` | `f_*div(t) = \|G\|·[0×BG]`, `div(N t) = [0×BG]`, factor `\|G\|/1`; `\|G\|·c = 1` impossible | holds; vistoli1989 lines 980–1011, stacks-chow-spaces lines 347, 590, 726, 917 | none |
| 3.4 exterior products (sample) | `K/k` separable degree 2; `K = k(a^{1/p})`; `BG × BH` | two points of degree `2`, `4 = 2+2`; `K⊗K` local of length `p`, `p·p = p²`; coefficient `1` | holds; vistoli1989 lines 1706–1708 | none |
| 3.5 integral Gysin | `Spec k → BG`; `z ↦ z²`; non-flat base change | `[G]`, degree `\|G\|`; `2·[pt]`; `[pt]` against `0 ∈ A_{−1}` | holds | none |
| 4.2 Gysin on stacks (sample) | `π : Spec k → BG`; conjugation space over `ℝ` | `\|G\|^{-1}·\|G\|·[pt] = [pt]`; residue field `ℂ`, values of local functions real, not a scheme | holds; vistoli1989 lines 1603–1620, 1621–1657, 1671–1704 | none |
| 5.1 intersection ring (sample) | `g : BG → pt`; `L → 𝔸¹` | both sides `(1/\|G\|)·[pt]`, degree-weighted product gives `[pt]`; pullback of `id` is `L`, not separated | holds; vistoli1989 lines 506–507, 1705–1750 | none |
| 5.4 zero-cycle degree (sample) | `ℝ`-gerbe; `[ℙ¹/μ₂]`, `t²/(t²−1)`; `𝔸¹`; `Spec k(a^{1/p})`; Mathlib `degree` | `1/2 = 2/4`; `2·(1/2) − 1 = 0`; `deg div(t) = 1 ≠ 0`; `p`; weight `residueDegree = [κ(x):k]` | holds; vistoli1989 lines 372–376, 426–452 | none |
| 6.1 comparison bundle (sample) | `[0→0]`, `[O→O]`; `1 + ξ` on `ℙ¹` | rank `1 = 0+1 = 1+0`; `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`, `H⁰(O(−2)) = 0`, `P = O(3)²` | holds; behrend-fantechi1997 lines 1299–1320 | none |
| 6.2 virtual class (sample) | `ℙ¹`, `[O(1) → Ω]`; `[O(−4) → Ω]` via `P`; `L`, `𝓛_n` | `−1`; `c_1(O(3)²/O(2)) = 6 − 2 = 4 = deg O(4)`; `n·[0₂] = −n·[0₁]` | holds; behrend-fantechi1997 lines 1282–1298, 1261–1262 | none |
| 7.1 relative obstruction class (sample) | `k[x]/(x²)`, `x ↦ ε`; `pt → B𝔾_m` | `(ε + aε²)² = ε² ≠ 0` in `k[ε]/(ε³)`; torsor under `1 + J ≅ J`, `L_X` gives `0` | holds; behrend-fantechi1997 lines 1067–1078 | none |
| 7.2 characterisations (sample) | cone `C` of `φ`; char 2, `φ = (0, id)` | `H^i(C) = 0` for `i ≥ −1`, so `Ext¹(g^*C, J) = Hom = 0`; `(x + ax²)² = x² ≠ 0`, condition 3 fails | holds; behrend-fantechi1997 lines 1162–1201 | none |
| 8.1 `β`, relative invariance (sample) | plane; `(M, ·, a)` against `2a`; non-reduced `𝔸¹ × k[ε]` | `ω = t/s = η/ν`, `∂ω = [η=0] − [ν=0] = D·[E] − E·[D]`, `β = ν/η`; `1` against `1/2`; `2·[ν=0] − 2·[T=0]` | holds; kresch1999b lines 65–207, 242–304, 334–336 | N01 |
| 8.3 functoriality (sample) | conormal sequence of `Y′ ⊆ Y` smooth over `𝔐`; non-quasi-compact `Z′`; supplier §9.5 | `(f_i) : Y → 𝔸^c × 𝔐` smooth along `Y′`, `T_{Y/𝔅}\|_{Y′} = T_{Y′/𝔐}`; `[pt]` for every `Z′_0`; §9.5 graph case needs `Y` smooth | holds; behrend-fantechi1997 lines 1721–1739, 1389–1399 | C03 |
| Headline 1 (2.2–2.3) | `[𝔸¹/μ₂]`; `P = y^p − a`; `L` | `ord_0 g(x²)` even, `ℤ/2`; `k[x]/P(x²) = κ(P)[x]/(x² − ȳ)` reduced; `ℤ²/ℤ(1,1) ≅ ℤ` | holds | none |
| Headline 2 (4.1–4.3) | `BG → pt`; `L × B(ℤ/2) → L`; `O(−1)` on `ℙ¹` | `1/\|G\|`, composite `1`; `(1/2)·[0₁]`; `s^!s_*[ℙ¹] = −[pt]` | holds | none |
| Headline 3 (5.1) | as 5.1 above; `[ℙ¹/μ₂]` | `[𝒫]·[𝒫] ∈ A_{−1} = 0`, `[𝒫]·[ℳ] = [𝒫]` | holds | none |
| Headline 4 (5.2) | `ℤ/p`-quotient; `M′ = {0}`; proper `ℳ`, quasi-separated `M` | `1 ≠ 1/e = 1/p`; `2·(1/2)·[pt] = [pt]`; two extensions lift to one in `ℳ`, so `M` separated | holds; vistoli1989 lines 542–579, 1758–1776 | none |
| Headline 5 (5.3) | `ℙ(1,2)`; `Bμ_n` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ` | holds; edidin-graham1998 lines 1069–1076 | none |
| Headline 6 (5.4) | as 5.4 above; `f(𝒢_x) = 𝒢_y` | `(\|Aut ȳ\|/\|Aut x̄\|)[κ(x):κ(y)] · [κ(y):k]/\|Aut ȳ\| = [κ(x):k]/\|Aut x̄\|` | holds | none |
| Headline 7 (6.1–6.3) | `k[ε]/(ε²)`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `2·[pt]`; `rk Ob = 1`, class `p·[pt] ≠ c_1(Ob) ∩ [X] = 0`; `[pt]` against `0` | holds; behrend-fantechi1997 lines 1702–1711 | none |
| Headline 8 (7.1–7.2) | as 7.1, 7.2 above | as above | holds | none |
| Headline 9 (8.1) | as 8.1 above; `Spec k → BG` deformation | `M°_R S = (e × ℙ¹) ⊔ ((G∖e) × (ℙ¹∖0))`, fibre `BG` generically, `pt` over `0` | holds | none |
| Headline 10 (8.2–8.3) | node, `V(a+b)`; non-reduced base; embedded point `k[x,y]/(x², xy)`, `y − 1` | `−2·[pt × pt]` both sides; `2·[pt]` both sides; `v^![line] = [pt] = [𝔜′]` | holds | none |
| Headline 11 (8.4) | `x² − by²`; `B = L`; `xb = 1`; `y² = x^p − a` over `𝔽_p(a)` | `2, 2, 2`; `2` at `0₁` and `0₂`; `1` against `0`; maximal ideal `(y)`, Jacobian `(0, 2y) = 0`, count `1` | holds; li-tian1998 lines 1472–1474, 1501–1503 | none |
| Headline 12 (9.3–9.5) | `ℙ¹ → ℙ^r`; Frobenius, char `p`; `ℙ²`, `d = 1`; `ℙ¹ × 𝔸¹` | `χ = (r+1)(d+1) − 1`; `Aut F = ker Frob_{PGL₂}`, order `p³`; `−3 + 3 + 2 = 2`; `0 + 2 + 2 = 4` | holds; behrend1997 lines 139–161, 165–187 | none |
| Overview and Downstream consumers | AlgebraicGromovWittenTheory at its head | §§4.1–4.3 cite VirtualFundamentalClass only; no deformation invariance, no coarse-space degree stated | sentence not true of that head | C02 |
| Pull-request description | suppliers against main | VirtualFundamentalClass and StackPointsAndResidualGerbes on main; StableReductionPartII open; twelve headlines in the docstring | one sentence out of date | C01 |
| Declared gaps | both slugs against the head | README declares none: integral closed substacks are 1.0 here; VirtualFundamentalClass §1.5 on main states normal cones of local immersions with base change | nothing unowned | none |

- Source locators checked against the cached texts: 175 line locators (vistoli1989 80, behrend-fantechi1997 36, kresch1999b 25, stacks-chow-spaces 17, behrend1997 6, li-tian1998 4, rydh2015 3, edidin-graham1998 2, keel-mori1997 1, deligne-mumford1969 1); 167 read in full and 8 at the statement only (the proofs of vistoli1989 Lemmas 1.16 and 3.16, li-tian1998 Theorem 4.2 and behrend1997 Proposition 5, and stacks-chow-spaces Lemmas 25.1, 27.1–27.3); one page slip (N01), no wrong statement.
- Library declarations opened at the pins: Mathlib `AlgebraicGeometry/AlgebraicCycle/Basic.lean:69, 95`, `ResidueField.lean:147, 377`, `OrderOfVanishing.lean:52, 65`, `Normalization.lean:122, 169, 576, 598`; Tau Ceti `Chow/Basic.lean:86, 112, 168, 257, 295, 304, 369`, `Chow/ClosedImmersion.lean:211`, `Normalization/Finite.lean:120`, `Curves/Prestable.lean:45`. No algebraic stack, cotangent complex or Chow operation beyond closed-immersion pushforward at either pin.
- Cross-roadmap citations resolved: VirtualFundamentalClass on main (§§0.2–0.3, 1.5–1.6, 2.1–2.5, 3.2–3.5, 4.4–4.5, 5.5, 6.1, 6.3–6.5, 7.1–7.7, 8.1, 9.1–9.6); StackPointsAndResidualGerbes on main (§§0.5, 4.5, 5.3, 5.4 read, the other headings present); StableReductionPartII §5.15 at the #1841 head; SchemeAndStackFoundations (20 section headings), EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra on main; AlgebraicGromovWittenTheory §§4.1–4.3 at the #1998 head.
- Automatic checks rerun at `c5f07fa`: every check 0, `OK`. Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file has no declaration, so the `#check` binder comparison and the one-tactic padding probe are empty; no headline is statable at the pins.
- Ownership against open work: the objects owned here (integral Chow groups of Deligne–Mumford stacks, proper covers, `P`-divisor operations, relative obstruction class, deformation invariance, the obstruction theory of spaces of maps) were searched by object in main and in the open pull requests; no second owner, and no roadmap cites this one.

Overlap check: read VirtualFundamentalClass, StackPointsAndResidualGerbes, EquivariantIntersectionTheory (main), AlgebraicGromovWittenTheory (#1998), MotivicStructuresInModuliOfCurves (#2437), StableReductionPartII (#1841), SchemeAndStackFoundations (main; #2489 and #2531 touch other sections). Shared: the stable-map obstruction theory, stated for stable maps by AlgebraicGromovWittenTheory §4.1 and in general by 9.3 here, which names the difference in one clause (owner of the general statement: this roadmap); integral closed substacks, owned here in 1.0 (see the human reviewers' section). Nothing else shared.

Source independence: 25 passages compared with 6 sources, none shared (longest common run 6 words, the list of properties in rydh2015 Theorem B and the definition of a local embedding at vistoli1989 lines 499–500); largest share vistoli1989, 80 of 175 line locators; contents compared with vistoli1989 §§1–7: independent (its §§2 and 6 are merged into 5.2 after its §5, its §4 is no layer, its §3 is split by integrality across Layers 2–4; the order is forced by the *Needs:* lines of 2.2, 3.2, 4.1 and 5.2).

Research link: Layers 1–5 are the intersection theory of Vistoli 1989 and Gillet 1984 with the comparison of Edidin–Graham 1998; Layers 6–8 the virtual class of Behrend–Fantechi 1997 with Kresch 1999's rational equivalence and the deformation invariance of Li–Tian 1998; Layer 9 the obstruction theory of Behrend 1997. Rests on the README's sources, read at their locators.

## Not verifiable

- gillet1984 §4 (2.1, 2.2): settled as uncertified, cited by locator.
- fulton1998 Propositions 1.8, 8.1.1 and 10.2, §1.10, Chapter 3 and Corollary 6.3: settled as uncertified, cited by locator.

Automatic checks set aside as false positives: the tool that lists the Lean declarations of `Suggested.lean` read the docstring phrase "theorem with the carrier it lacks" as a declaration named `with`, so the computed change summary counts one declaration added and the signature listing failed; the file declares nothing.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, p. 26: the source says the rational equivalence is invariant under the whole ambient tangent bundle pulled back; it should be invariance under the tangent bundle of the regularly embedded smooth stack only; affects a stated result; corrected in print at kresch1999b Theorem 3.1 and p. 11.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, p. 10: the source says the tangent bundle of the arbitrary stack `Y′` acts; it should be the tangent bundle of the smooth, regularly embedded `X`, along which the proof translates; affects a stated result.
- **Error** in behrend1997 at Proposition 4, p. 5: the source, over an arbitrary field, calls the stack of stable maps a proper Deligne–Mumford stack; it should assume characteristic `0` or bound the class, since the Frobenius of `ℙ¹` has non-reduced automorphisms; affects a stated result.

## For the human reviewers

- StackPointsAndResidualGerbes on main (`README.md` lines 54–62 and 2171) names a roadmap VirtualFundamentalClasses, §1.2, as owner of integral closed substacks; no open pull request carries that roadmap, and 1.0 here now states them.
- AlgebraicGromovWittenTheory (#1998, another author) builds the stable-map obstruction theory in its §§4.1–4.3 from VirtualFundamentalClass alone; 9.3–9.5 here state the general case. Neither text settles which cites the other.
- The two supplier gaps declared at the design stage are no longer in the README: one became 1.0 here, the other is VirtualFundamentalClass §1.5 on main. The plan's gap list may need the same change.
