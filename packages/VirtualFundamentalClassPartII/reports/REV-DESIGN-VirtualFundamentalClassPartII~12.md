<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6900835416 -->
Review (claude) of 7d247b2

Verdict: needs_changes

1. **F01** (P3) 3.5 has one *Needs:* line for two statements with different needs

   - **Location.** `design/README.md` 3.5, lines 912–915: "*Needs:* 2.2; 2.3 (its statements on
     algebraic spaces, through which homotopy invariance is read …); 3.1–3.3; VirtualFundamentalClass
     §1.5; gap:normal-cones-of-local-immersions; SchemeAndStackFoundations §§5.2–5.5."
   - **Claim.** Everything proved in 3.5 needs the listed items.
   - **Witness.** 3.5 now proves two statements. Homotopy invariance (lines 877–893) is about a vector
     bundle `p : N → U`; for `U = Spec k`, `N = 𝔸¹` its statement and route use no immersion, no cone
     and no pushforward, yet the line puts it behind the gap and 3.2.
   - **Repair.** Replace the line by two:
     "*Needs*, for homotopy invariance on algebraic spaces: 2.2; 2.3 (its statements on algebraic
     spaces, through which the statement is read from stacks-chow-spaces Lemma 27.3, and on schemes,
     through which SchemeAndStackFoundations §§5.2–5.4 apply); 3.1; 3.3; SchemeAndStackFoundations
     §§5.2–5.4. *Needs*, for the Gysin maps: homotopy invariance above; 2.2; 2.3 (on schemes); 3.1–3.3;
     VirtualFundamentalClass §1.5; gap:normal-cones-of-local-immersions; SchemeAndStackFoundations
     §§5.2 and 5.5."
     The plan's 3.5 prerequisites are the union of the two lines and stay as they are. Tested on the
     witness: for `Spec k` and `𝔸¹` the first line lists only what the isomorphism
     `A_0(Spec k) → A_1(𝔸¹)` uses, and the gap stands only on the second.

One finding, P3 (R01), with a repair to apply; no P1 and no P2. Both round-11 findings are
repaired. The two declared supplier gaps
(`gap:closed-substacks-of-stacks`, VirtualFundamentalClass §2.1;
`gap:normal-cones-of-local-immersions`, VirtualFundamentalClass §1.5) are no finding: both are
precise, ask for
nothing a supplier already states (VirtualFundamentalClass §1.5 at its open head covers
"representable closed immersions" only, and its §2.1 is for separated stacks), and carry the same
slugs in `design/plan.json` and in the README.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (read in full, 2018 lines),
`packages/VirtualFundamentalClassPartII/design/plan.json` (33 targets, 2 gaps, 7 suppliers) and
`packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic padding probe were run; none applies at this stage.

## Round-11 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P2), global resolution in 6.3 and 8.2 | repaired | 6.3, lines 1398–1400: "Assume moreover that `E` has a global resolution and that `H⁰(E)` is locally free; in the first case below the resolution is automatic, since `H^{−1}(E) = 0` makes `E → H⁰(E)` an isomorphism". 8.2, lines 1623–1625: "Let `E` have a global resolution `F•`. Prove that `u^*E` is a perfect relative obstruction theory for `X′/𝔜′` with the global resolution `u^*F• = [u^*F^{−1} → u^*F^0]`". Layer 6 header, lines 1314–1315: "The class `[X/𝔜, E]^vir` of 6.2 is formed when `E` has a global resolution, and every statement about it assumes one." The plan's 6.3 and 8.2 carry the hypothesis in `hypotheses` and in `statement`; 8.2's prerequisites gain VirtualFundamentalClass §6.5, which at the open head reads "show it is stable under the pullbacks". |
| F02 (P2), `s^*` in 3.5 | repaired | 3.5, lines 877–879: "Prove homotopy invariance on algebraic spaces: for a vector bundle `p : N → U` of constant rank `c` over a quasi-separated algebraic space `U` of finite type over `k`, the flat pullback `p^* : A_j(U) → A_{j+c}(N)` of 3.1 is an isomorphism for every `j`"; first API bullet (lines 919–922); two Checks (lines 941–949); the plan's 3.5 has the `api` entry and two tests. Convention 4 (line 187) and the Layer 3 scope bullet (lines 46–47) list the statement. |

The repaired pattern (a hypothesis or an input present in one place and absent in another) was
looked for again in the rest of the text: every use of `[X/𝔜, E]^vir` (6.2, 6.3, 8.2, 8.3, 8.4, 9.4)
states or constructs a resolution; every Stacks Project lemma used (2.1, 2.2, 2.3, 3.3, 3.5, 5.4)
sits under "Prove". The gaps' `neededBy` lists (`1.1, 1.2, 2.1, 3.2, 3.3, 5.2, 5.4` and
`3.5, 4.2, 8.1, 8.3`) equal the sections whose *Needs:* lines carry the slugs.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 244 roadmaps, 2236 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers: VirtualFundamentalClass (open, adds a new folder),
StableReductionPartII (in the merge order; open, adds a new folder; §5.15 only),
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves
and DerivedModuleAlgebra (main). StableReductionPartII §5.15 needs VirtualFundamentalClass §§2.1–2.3
and nothing of this roadmap; neither VirtualFundamentalClass, StableReductionPartII nor
AlgebraicGromovWittenTheory names this roadmap. AlgebraicGromovWittenTheory is a consumer only. No
roadmap of the never-cite list is cited. The citation resolver lists nothing unresolved.

## Maintainer notes

None stands as a finding.

1. Words: holds in the text. Convention 2 uses "local immersion" for the class and "local
   embedding" for the chart pair, and gives Vistoli's words once (vistoli1989 (1.19)–(1.20)).
2. Cotangent complex: holds. Convention 6 says "No truncated cotangent complex is defined"; the
   word occurs nowhere else; 9.3 builds `φ` into `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: holds, by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at
   its open head reads "prove invariance under the restricted tangent action `T_{Y′}|_{X′}` of
   Kresch, Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and says that no compatibility datum over
   the graph is used; the conic instance is in the table below.
6. Suppliers: holds. AlgebraicVectorBundles and EllipticCohomology occur 0 times in the README and
   the plan; the seven suppliers are cited by section.

## Adversarial table

Rows: the 15 sampled targets, the passages the round-12 repair changed, the sections the round-11
table had no row for (1.1, 2.1, 4.3, 7.1, 8.3), the headline statements and the target of R01. Every
value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 finite cover | `B_{𝔸¹}G` and `Q = 𝔸¹ ⊔ 𝔸¹ → L` | `Q ×_L Q` has pieces `𝔸¹, 𝔸¹, 𝔾_m, 𝔾_m`, which is `Q ×_{𝔸¹} G` for `G = 𝔸¹ ⊔ 𝔾_m`; base change of `L → B_{𝔸¹}G` along the atlas is `Q → 𝔸¹`, finite étale of rank `2` | holds | none |
| 1.1 no separated cover | `X` separated, `P = X ×_{BG} 𝔸¹` | `P → 𝔸¹` proper and `X → 𝔸¹` separated give `P → X` proper, so finite étale; degree `2` over `t ≠ 0`, `1` over `0` on one connected component | Check holds | none |
| 1.1 integral case | finite `Z → ℳ`, `ℳ` irreducible | finitely many closed images cover `ℳ`, so one component surjects; finite gives generically finite | holds | none |
| 2.1 descent | `BG`, `G = ℤ/2`, atlas `Spec k`; `[V(x²)/μ₂]` | `Z_0(Spec k) = ℤ`, both pullbacks to `G` are `[G]`, equaliser `ℤ`; length of `k[x]/(x²)` is `2` | holds | none |
| 2.1 scheme grading | Tau Ceti `pointsOfDimension` | "height for the specialization order is `k`", the dimension of the closure; `ℤ`-valued, empty for `k < 0` | agrees | none |
| 2.3 three comparisons | `L`; `Spec k`; `[𝔸¹/μ₂]`; Situation 2.1 | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ`; `ℤ/2 ⊗ ℚ = 0`; `Spec k` is quasi-separated, Noetherian, universally catenary, `δ = 0` on its point | holds | none |
| 3.1 étale pullback not injective | isogeny of degree `2`, `P ∈ ker π̂` | divisor `[Q] + [Q + T] − [O′] − [T]`, degree `0`, sum `2Q = π̂(P) = O′` | holds | none |
| 3.3 push–pull, localisation | `Spec k → BG` twice; `Bμ₂ ⊆ [𝔸¹/μ₂]`; two points of `ℙ¹` | `\|G\|·[Spec k]` both ways; `ℤ → ℤ/2 → A_0(𝔾_m) = 0`; kernel `ℤ·(1, −1)` | holds | none |
| 3.4 exterior product | `K ⊗_k K`, separable degree `2`; purely inseparable degree `p`; `BG × BH` | two points, `4 = 2 + 2`; local of length `p`, `p² = p · p`; `[B(G × H)]` with coefficient `1` | holds | none |
| 3.5 homotopy invariance (repair) | `c = 0`; `U = ∅`; `U = Spec k`, `N = 𝔸¹` | identity; `0 → 0`; `ℤ → ℤ·[𝔸¹]` in degree `0 → 1`, `0 → 0` in degree `−1 → 0` | holds | none |
| 3.5 homotopy invariance (repair) | the space `X` of 4.2 over `ℝ`, `N = X × 𝔸¹` | `div(t) = [0_X]` (order of `z` at `0` on `𝔸¹_ℂ` is `1`), other points `div(m_P)`, so `A_0(X) = 0`; `[0_X × 𝔸¹] = div(t)`, other curves `div(g)` with `z ∤ g` in `ℂ[z, s]`, so `A_1(N) = 0`; `ℤ → ℤ` above | holds in both degrees | none |
| 3.5 hypotheses of Lemma 27.3 | stacks-chow-spaces lines 1986–1990, 57–61 | good `X/B`, finite locally free of rank `r`; with `B = Spec k`: quasi-separated, locally of finite type; `U = ℱ ×_𝒢 T` has `Δ_f` quasi-compact | met | none |
| 3.5 supplier side of the route | SchemeAndStackFoundations §§5.2–5.4 on main | `chow_affine_bundle`: "`p^* : CH_k(X) → CH_{k+r}(E)` is an isomorphism" for constant rank; §5.3 `Chow.c1`; §5.4 `chow_basis`; projective completion in the same convention | cited statements exist | none |
| 3.5 wrong `s^*` | restriction to the zero section, `O(−1)` on `ℙ¹` | `[ℙ¹]` against `c_1(O(−1)) ∩ [ℙ¹] = −[pt]` | excluded | none |
| 3.5 *Needs:* (R01) | `U = Spec k`, `N = 𝔸¹` | statement uses 2.2, 2.3, 3.1, 3.3 and the scheme theory; the line adds 3.2, §1.5 and the gap | one line, two needs | R01 |
| 3.5 Gysin definition | `Spec k → BG`; `{0} → 𝔸¹` along `t ↦ t²`; non-flat base change | `[G]`, pushing to `\|G\|·[Spec k]`; `2·[pt]`; `[pt]` against `A_{−1} = 0` | holds | none |
| 4.3 homotopy invariance on stacks | rank `0`; `BG × 𝔸¹`; `L ⊕ L^∨` | `π = id`, `s^! = id`; `A_1 = ℚ`, `s^![𝔸¹ × BG] = [BG]`; `c_1 = 0`, `c_2 = −c_1(L)²` | holds | none |
| 4.3 API | `q : E′ → E`; `C ×_ℳ E″` | `q^*π^* = π′^*` and `s′^!π′^* = id`; dimension `m + r″` against rank `r + r″`, degree `m − r` | holds | none |
| 4.4 agreement | `B(ℤ/2)`; `Spec k` | `1/2` in both theories; `ℚ` in both | holds | none |
| 5.1 projection formula (headline) | `BG → Spec k`, `x = [Spec k]`, `y = [BG]` | both sides `(1/\|G\|)·[Spec k]`; weighting by `e(BG × BG)/e(BG) = \|G\|` gives `[Spec k]` on the left | holds | none |
| 5.1 duality needs `T` separated | `L → 𝔸¹`; `𝔸¹ ⊔ 𝔸¹ → 𝔸¹` | pullback of `id` is `L`, not separated; `ℚ²` in dimension `1`, `0` in dimension `0` | holds | none |
| 5.2 moduli spaces (headline) | `[𝔸¹/μ₂] → 𝔸¹`; `ℤ/p` on `𝔸²` | `0 = 0` rationally, `ℤ/2 → 0` integrally; degree `(1/p)·p = 1` | holds | none |
| 5.3 product (headline) | `ℙ(1, 2)`; `Bμ_n`; hypotheses | Euler class `t · 2t`, `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; edidin-graham1998 Proposition 15 asks "locally separated", weaker than proper | holds | none |
| 5.4 degree of a point (headline) | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `2/4 = 1/2`; orders `2, −1, 0`, `2 · (1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.2 virtual class (headline) | `[O(1) → Ω]` on `ℙ¹`; through `P`; `𝓛_n` on `L` | zero section of `O(−1)`, degree `−1`; `O(2) ⊆ O(3)²`, `c_1(O(3)²/O(2)) = 4 = c_1(O(4))`; section `e_1`, `t^n·e_2` vanishes to order `0` at `0₁`, `n` at `0₂` | holds | none |
| 6.3 formulas (repair) | `H^{−1}(E) = 0`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; pure dimension | `[0 → H⁰(E)]` resolves `E`; `s = 1`, `dim X − d − r = 0`, class `p·[pt]`; `[pt]`; `s = n − r = dim X − d − r` for relative dimension `n` | holds with the hypothesis | none |
| 7.1 obstruction class (headline) | étale; smooth, `T` affine; `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | `L = 0`, unique; `H¹(T, g^*T ⊗ J) = 0`; torsor under `1 + J ≅ J`, against the zero group from `L_X`; `(ε + aε²)² = ε² ≠ 0` in `k[ε]/(ε³)` | holds | none |
| 7.2 characterisation (headline) | characteristic `2`, `φ = (0, id)` | `φ^*ω = 0` yet `(x + ax²)² = x² ≠ 0` | holds | none |
| 8.1 invariance (headline) | plane; `𝔸¹ × Spec k[ε]/(ε²)`; kresch1999b Theorem 3.1 | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `∂β = 2·[ν = 0] − 2·[T = 0]`; the proof (lines 390–405) translates along `𝔸^m ⊆ 𝔸^n`, the regularly embedded factor | holds | none |
| 8.2 pullback (repair) | `v = id`; node with `V(a + b)`; derived pullback | `u^*F• = F•`, equality trivial, no claim without a resolution; `−2·[pt × pt]` both ways; `Lu^*` of a two-term complex of locally free sheaves is termwise, rank `r` | holds | none |
| 8.3 functoriality | conic `Z′ ⊆ Z = 𝔸²`, `X = Z`, `E = Ω_Z`, `F = Ω_{Z′}` | flat pullback `[Z′ × Z]`, graph Gysin `[Z′]`; API: `C = Z`, `N` of rank `2`, left side `Z′ × B T_{Z′}`, right side `𝔉 = B T_{Z′}`; both boundary terms `N × B T_{Z′}`, of dimension `2`; rank `1 = 2 − 1` | holds; no datum over the graph used | none |
| 8.3 smooth case | `𝔸¹ × Z → Z`, `X = Z = 𝔜 = Spec k` | `B T_{𝔸¹}` of dimension `0` over `𝔸¹` of dimension `1`: relative dimension `−1`; `rk F − rk E = 1` | holds | none |
| 8.3 `Z′_0` | `Z′ = pt ⊔ ⊔_ℕ pt`, two choices | flat pullback gives the sum of the chosen points, the graph keeps the first: `[pt]` both times | independent | none |
| 8.4 deformation invariance (headline) | `x² − b y²`; `{xb = 1}`; `η_b^!` against `i_b^!` | counts `2, 2, 2`; `1` and `0`; 4.2's flat bullet with `𝒢 = B`, `𝒢_1 = 𝔐 × B`, `𝒢′ = X`, then `i_b^!(n·[B]) = n·[b]`, `k`-degree `n·[κ(b) : k]` | holds | none |
| 9.3 obstruction theory (headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)(d + 1) − 1`, `H¹ = 0`; `Ob = H¹(O) ⊗ O_M`, `c_1 = 0` | holds | none |
| 9.5 rank and dimension | lines in `ℙ²`; `Spec k ⊔ ℙ¹`; general | `−3 + 3 + 2 = 2`; `ℓ = 0`, rank `0`, not `1`; `3g − 3 + n + δ + ℓ(1 − g) = (1 − g)(ℓ − 3) + n + δ`, which is li-tian1998 line 1586 | holds | none |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, 33 plan targets; every section has a *Needs:* line and
  at least 3 Checks (script over the plan's `tests`: none below 3); every layer ends with Examples
  and Dependencies. A search found no LaTeX delimiters, `lemma` keyword, process words, pull-request
  numbers, anchors, machine paths or `set_option`. Proposed names are in italics; every backticked
  Lean name is a library or supplier declaration.
- **Headline statements** (Summary): the integral groups and their comparisons (2.2–2.3); rational
  pushforward, Gysin maps, homotopy invariance and Chern classes on all stacks (4.1–4.3); the
  intersection ring and duality, the moduli-space isomorphism, the ring structure of the
  Edidin–Graham comparison, the degree of a point (5.1–5.4); the virtual class without the
  resolution property or separatedness (6.2); the relative obstruction class and characterisation
  (7.1–7.2); relative invariance, pullback, functoriality, deformation invariance (8.1–8.4); the
  obstruction theory of spaces of maps, its resolutions and dimension (9.3–9.5). Each is a named
  target with a locator. None is statable at the pins: neither pinned library has `IsAlgebraicStack`
  or `IsDeligneMumford` (search of both trees, no hit).
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled
  sections carry the item number, the hypotheses and the statement the README gives:
  - vistoli1989 lines 299–328, 365–376, 420–430, 504–507, 582–584, 887–997, 1012–1030, 1045–1123,
    1172–1174, 1197–1207, 1451–1466, 1507–1512, 1594–1623, 1665–1672, 1705–1750;
  - behrend-fantechi1997 lines 781–809, 884–897, 1040–1044, 1067–1078, 1261–1262, 1299–1305,
    1389–1398, 1414–1421, 1456–1460, 1602–1612, 1634–1641, 1645–1670, 1682–1739;
  - kresch1999b lines 182–207, 218–243, 250–256, 302–315, 320–343, 390–405;
  - li-tian1998 lines 1472–1474, 1486–1503, 1565–1566, 1585–1586; behrend1997 lines 139–141,
    148–161, 165–187, 193–197; edidin-graham1998 lines 1042–1045, 1069–1076; rydh2015 lines 81–87;
    deligne-mumford1969 lines 1012–1019; keel-mori1997 line 28;
  - stacks-chow-spaces lines 57–61, 126–133, 151, 314–315, 484–494, 516, 667, 797–818, 1103–1114,
    1368–1378, 1477–1479, 1766–1801, 1907–1939, 1986–2007, 2224; stacks-chow line 1356. The tags in
    the manifest's locator (0EDT … 0ERW, 02RW) are those printed at these lines.
- **Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the revisions of
  `lake-manifest.json`):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `AlgebraicCycle` (line 44),
    `AlgebraicCycle.map` (line 69, `[QuasiCompact f]`, weights).
  - `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `Scheme.ord` (line 52; junk value `0` for
    `f = 0` or `coheight z ≠ 1`, line 48).
  - `Mathlib/AlgebraicGeometry/Morphisms/`: `Etale` (`Etale.lean` 39), `Flat` (`Flat.lean` 42),
    `Smooth` (`Smooth.lean` 59), `IsProper` (`Proper.lean` 41), `IsClosedImmersion`
    (`ClosedImmersion.lean` 44).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86), `RatEquiv` (257),
    `ChowGroup` (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369).
  - `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean`: `ChowGroup.pushforward` (211).
  - `SchPseudofunctor` (`Stack/Basic.lean` 37); `Spaces.IsAlgebraicSpace`
    (`AlgebraicSpace/Basic.lean` 195: fppf sheaf, representable diagonal, étale atlas; no
    quasi-separatedness); `PrestableFamily` (`Curves/Prestable.lean` 45: extends `IsProper` and
    `GeometricallyConnected`; `syntomic` at 55; no genus); `FixedRank.vectorBundleDegree`
    (`VectorBundle/Degree.lean`, namespace at 70).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: headings §§0.2–9.6 exist under the cited numbers.
    Read: Scope, Conventions, §§1.5–1.6, 2.1–2.5, 3.2, 6.4–6.5, 7.1–7.4, 9.1–9.6. §1.5 covers
    representable closed immersions; §2.1 is for separated stacks; §2.3 is rational; §7.3 and §9.2
    assume separatedness and the resolution property; §9.4 is over smooth bases.
  - SchemeAndStackFoundations on main: the 22 cited headings exist; the 25 cited names occur
    (script); `chow_affine_bundle` and `localization_exact` lie in §5.2, `excess_intersection` and
    `gysin_self_intersection` in §5.5, `Stacks.points` is defined in §1.20.
  - StableReductionPartII at its open head: §5.15 ("Chern class of the dualizing pairing") states
    the Edidin–Graham comparison with the hypotheses the contract quotes, compatible with Chern
    classes and proper pushforward, and no product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist, over a field of characteristic
    zero, for the stable-map stack only.
  - EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra
    are folders on main; the citation resolver lists none of their cited sections as missing.
- **Duplication and ownership.** Searched the open heads and main by object: Chow groups of
  algebraic spaces, homotopy invariance on algebraic spaces, Vistoli's theory, deformation
  invariance. No other roadmap states a target of this one; the one hit for Chow groups of algebraic
  spaces outside VirtualFundamentalClass's reference list is EquivariantIntersectionTheory line 39,
  which says it does not build them. Integral homotopy invariance on algebraic spaces therefore has
  no other owner, and 3.5 is where it is consumed. Against VirtualFundamentalClass, each layer
  removes a named hypothesis and none restates a section at equal generality. `scratch/overlaps.md`:
  no dropped id, no revision-only id, no conflicting head, no second copy; the roadmap is not on
  main.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 3.1–3.4; 5.1
  needs 4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 and 9 after 7.
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 30 passages with 9 sources, among them the new route of 3.5
  beside the proof of stacks-chow-spaces Lemma 27.3, 7.1 beside behrend-fantechi1997 lines
  1067–1078, 6.3 beside its Proposition 7.3, 9.4 beside behrend1997 Proposition 5 and 1.1 beside
  rydh2015 Theorem B. The longest shared run is 7 words in 1.1 (the list of properties of the finite
  cover, rydh2015 line 84), part of a statement that can be written one way. Arrangement:
  vistoli1989's section 3 is split over Layers 2, 3 and 4 by integrality, its sections 2, 5 and 6
  feed one layer (5) after them, and its section 4 is no layer. No table, figure, list of examples
  or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 30 passages compared with 9 sources, none shared beyond parts of statements of at most 7 words; largest share vistoli1989, 73 of 163 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each
  was read in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; displays and some labels are garbled (the label of
  (3.6)(iii) prints as "(ii)" at line 985) and were matched by content.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local embeddings,
  the comparison of 8.3's API on overlaps of charts, the extension of kresch1999b Proposition 2.3 to
  non-reduced ambients) was checked on charts, by rank and dimension and on the instances of the
  table, not as a proof.
- 3.5's claim that Vistoli's rational equivalence descends to algebraic-space sources was checked at
  Lemma 4.6 (ii) (lines 1458–1462) and at the opening of the proof of Lemma 3.16 (lines 1507–1512),
  not through the whole of that proof.
- Locators of the 18 sections outside the sample were reread only where listed above; their
  statements were read and their Checks recomputed where the table has a row.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since a derived isomorphism need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly embedded stack, as its proof uses; affects nothing.
- **Misprint** in vistoli1989 at the paragraph before Lemma 5.3, line 1613: the source says multiplicativity of the degree is Lemma 1.15; it should be Lemma 1.16 (line 379), unless the slip is the scan's; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d247b2e6184221cf214d89c1739c99c149e010d", "job": "REV-DESIGN-VirtualFundamentalClassPartII~12", "model": "fable", "worker": "chris-x88"} -->
