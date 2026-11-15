<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6901418664 -->
Review (claude) of e3ccaae

Verdict: needs_changes

1. **F01** (P3) the target of Layer 9 is assumed quasi-projective, and nothing uses it

   - **Location.** `design/README.md` 9.1, lines 1819–1820: "Let `X` be a smooth quasi-projective
     `k`-scheme"; repeated in the Summary (line 29), the Scope (lines 68 and 115) and 9.3 (line 1911);
     `design/plan.json` 9.1, `hypotheses` ("X smooth quasi-projective") and `statement`.
   - **Claim.** 9.1–9.3 and 9.5 hold for smooth quasi-projective targets.
   - **Witness.** `𝔅 = Spec k`, `𝒞 = ℙ¹`, `X = M = L` (the line with a doubled origin: smooth, not
     separated, so not quasi-projective), `F = pr₂ : ℙ¹ × L → L`. Extensions of `g` and of `g ∘ pr` are
     both torsors under `H⁰(T, g^*T_L ⊗ J)`; `E = (Rπ_*F^*T_L)^∨ = Ω_L → L_M` is the identity, `Ob = 0`.
   - **Why it holds without the hypothesis.** 9.1 uses only that `X` is a scheme (2-isomorphic maps to
     it are equal); 9.3 uses smoothness (`L_X = Ω_X[0]`, local lifts on affine charts); 9.5 uses the
     rank of `F^*T_X`. The ample sheaf of 9.4 is its own hypothesis on `𝒞_M`. Quasi-projectivity serves
     only the existence of `Mor_𝔅(𝒞, X)`, which 9.1 does not assert.
   - **Repair.** In 9.1 write "Let `X` be a scheme smooth over `k`" and add one clause: "for `X`
     quasi-projective and `𝒞 → 𝔅` projective the stack of morphisms exists and supplies such `(M, F)`".
     In the Summary, the two Scope bullets and 9.3's last sentence replace "smooth quasi-projective
     variety" / "target" by "smooth `k`-scheme". Change the plan's 9.1 `hypotheses` entry and
     `statement` the same way. Add the witness as a Check of 9.3. Tested on the witness: the repaired
     9.1 admits `(L, pr₂)`, and 9.3 gives `φ = id_{Ω_L}`, virtual dimension `0 + 0 + 1·(1 − 0) = 1 = dim L`
     (9.5 with `b = 0`, `δ = 0`, `ℓ = 1`, `g = 0`).

2. **F02** (P3) Layer 1's order line puts 1.3 behind 1.1, which it does not use

   - **Location.** `design/README.md` Layer 1, Dependencies, lines 609–610: "Within the layer, 1.1 and
     1.2 precede 1.3."
   - **Claim.** 1.3 needs 1.1.
   - **Witness.** 1.3's own line (line 551) reads "*Needs:* 1.2; SchemeAndStackFoundations §1.20", and
     the plan's 1.3 has `target:1.2` only. `deg(Spec k/BG) = (e(BG)/e(Spec k)) · [k : k] = |G|` is
     computed from 1.2 alone; no proper cover enters.
   - **Repair.** Replace the sentence by "Within the layer, 1.2 precedes 1.3; 1.1 needs neither." Tested
     on the witness: 1.1's *Needs:* line names no target of the layer, and 1.2's names none either. This
     is the pattern round 12 repaired in the *Needs:* lines, found once more in a Dependencies line; the
     other eight "Within the layer" lines were compared with the *Needs:* lines and agree.

Two findings, both P3 (R01, R02); no P1 and no P2. Each carries a repair, so the verdict asks for
changes. The design declares two supplier gaps, `gap:closed-substacks-of-stacks` (VirtualFundamentalClass §2.1) and
`gap:normal-cones-of-local-immersions` (VirtualFundamentalClass §1.5). Both are precise, minimal and
declared with the same slugs in `design/plan.json` and in the README; neither is a finding.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (2036 lines, read in full),
`packages/VirtualFundamentalClassPartII/design/plan.json` (9 layers, 33 targets, 2 gaps, 7 suppliers)
and `packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic probe were run; none applies at this stage.

## Round-12 finding

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3), one *Needs:* line for two statements in 3.5 | repaired | 3.5, lines 896–901: "*Needs:* for homotopy invariance, 2.2; 2.3 (its statements on algebraic spaces … and on schemes …); 3.1; 3.2 (the pushforward along closed immersions in the first Chern class …); 3.3; SchemeAndStackFoundations §§5.2–5.4." Lines 920–925: "*Needs:* for the Gysin maps, homotopy invariance above; 2.1 and 2.2 …; 3.1–3.3; VirtualFundamentalClass §1.5; gap:normal-cones-of-local-immersions; SchemeAndStackFoundations §§5.2, 5.3 … and 5.5". |

The repair kept 3.2 on the first line and added §5.3 and 2.1 to the second, against the wording the
review proposed. Both departures are right: stacks-chow-spaces line 1910 has `π_*` in the statement
of Lemma 27.1 and line 2002 writes `π^*α = i_*β`; vistoli1989 line 1155 invokes the projection
formula for divisors inside the proof of Lemma 3.15. The plan's 3.5 prerequisites (12 items) equal
the union of the two lines. The eight further sections the repair re-split (1.1, 2.3, 5.1, 5.2, 5.4,
8.1, 8.3, 9.4) were each compared with the plan: every union is unchanged, and the gaps' `neededBy`
lists (`1.1, 1.2, 2.1, 3.2, 3.3, 5.2, 5.4` and `3.5, 4.2, 8.1, 8.3`) still equal the sections whose
lines carry the slugs.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 241 roadmaps, 2244 edges, 0 problem(s)

No UPWARD and no CYCLE line. Suppliers: VirtualFundamentalClass and StableReductionPartII (open pull
requests that add new folders; StableReductionPartII is in the merge order), and
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and
DerivedModuleAlgebra (folders on main). AlgebraicGromovWittenTheory is a consumer only. No roadmap of
the never-cite list is cited. The citation resolver lists nothing unresolved.

## Maintainer notes

None stands as a finding.

1. Words: holds in the text. Convention 2 uses "local immersion" for the class and "local embedding"
   for the chart pair, and gives Vistoli's words once (vistoli1989 lines 499–505).
2. Cotangent complex: holds. Convention 6: "No truncated cotangent complex is defined"; 9.3 builds `φ`
   into `L_{M/𝔅}` from the projection formula and the trace. The one other truncation, `τ^{≥−1}L_{T/T̄} = J[1]`
   in 7.1, is the target of the obstruction class, not of an obstruction theory.
3. Integral and rational groups: holds, by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and the relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at its
   open head reads "prove invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch,
   Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and states that no compatibility datum
   over the graph is used; the conic instance is in the table.
6. Suppliers: holds. AlgebraicVectorBundles and EllipticCohomology occur 0 times in the README and in
   the plan; the seven suppliers are cited by section.

## Adversarial table

Rows: the 15 sampled targets, the passages the round-12 repair changed, the headline statements and
the targets of R01 and R02. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 finite cover of a non-separated stack | `G = 𝔸¹ ⊔ 𝔾_m` over `𝔸¹`, `Q = 𝔸¹ ⊔ 𝔸¹ → L` | fibres of `Q/L`: 1 point over `0₁`, `0₂`, 2 over `t ≠ 0`, as for `G_L`; `Q ×_L Q = Q ⊔ Q|_{t≠0}`; base change of `L → B_{𝔸¹}G` to the atlas is `Q → 𝔸¹`, rank 2 | holds | none |
| 1.1 no separated cover of `L` | `Z` separated, `Z → L` proper surjective | a universally closed surjection from a separated source forces `L` separated; `L` is not | Check holds | none |
| 1.3 degree (sampled) | `Spec k → BG`; `BG → Spec k`; `𝔸¹ → Spec k`; `ℤ/p` on `𝔸²`; `L → B_{𝔸¹}G` | `(\|G\|/1)·1 = \|G\|`; `1/\|G\|`; `[k(t) : k] := 0`; `(1/p)·[k(y) : k(y^p)] = 1`; `(2/1)·1 = 2 = rk(Q/𝔸¹)` | holds | none |
| 1.3 order within Layer 1 (R02) | `deg(Spec k/BG)` | uses `e(BG) = \|G\|`, `k(BG) = k` from 1.2; no cover | 1.1 not needed | R02 |
| 1.3 inertia formula | `S₃`; `μ₃` over `ℚ`; `[𝔸¹/μ₂]` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` on 2 components; non-identity component lies over the origin, sum `1` | holds | none |
| 2.1 descent of cycles | components `W₁`, `W₂` of `𝒱 ×_ℳ U` | a point of `U ×_ℳ U` over both generic points gives a component with coefficient `n_{W₁}` under one pullback and `n_{W₂}` under the other | equaliser is the span of the `[𝒱 ×_ℳ U]` | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `g(y)`, `y = x²` | coefficient at `Bμ₂` is `2·ord_0 g`; at `W` over `P(y) ≠ y` it is `ord_P g`; cokernel `ℤ/2` | holds | none |
| 2.3 comparisons (sampled) | `L`; `Spec k`; Situation 2.1 with `B = Spec k` | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ`; `δ_{X/B}(x) = 0 + trdeg κ(x)`, the dimension of the closure | holds | none |
| 3.1 étale pullback not injective | 2-isogeny `π : E′ → E`, `P ∈ ker π̂` | divisor `[Q] + [Q + T] − [O′] − [T]`: degree `0`, sum `2Q = π̂(P) = O′` | principal; Check holds | none |
| 3.4 exterior product (sampled) | separable and purely inseparable `K/k`; `BG × BH`; `∅` | `2 + 2 = 4`; local of length `p`, `p·p = p²`; coefficient `1`; `0` | holds | none |
| 3.5 homotopy invariance (repair) | `U = Spec k`, `N = 𝔸¹`; `c = 0` | `A_0 → A_1`: `ℤ → ℤ·[𝔸¹]`; `A_{−1} → A_0`: `0 → 0` (`[1] = div(x − 1)`); identity | holds; uses `π_*`, `i_*` of 3.2 | none |
| 3.5 Gysin (repair) | `{0} → 𝔸¹` along `z ↦ z²`; `Spec k → BG`; non-flat base change | `2·[pt]`; `[G]`, pushing to `\|G\|·[Spec k]`; `[pt]` against `A_{−1}(pt) = 0` | holds | none |
| 4.1 pushforward (sampled, headline) | `Spec k → BG → Spec k`; `[𝔸¹/μ₂] → 𝔸¹`; `L × B(ℤ/2) → L` | `\|G\|·(1/\|G\|) = 1`; `p_*(2·[Bμ₂]) = [0] = div(y)`; `[0₁ × B(ℤ/2)] ↦ (1/2)·[0₁]` | holds | none |
| 4.1 well-definedness | `ξ ∼ 0` on `ℱ`, proper cover `g : X → ℱ` | `ξ = g_*x`, `x ∼ 0` (vistoli1989 lines 1027–1030); `f_*ξ = (fg)_*x` with `fg` representable | holds for every stack, by 1.1 | none |
| 4.2 covering formula | `π : Spec k → BG`, `Y = Spec k` | `\|G\|^{−1}·r_*[G] = \|G\|^{−1}·\|G\|·[Spec k]` | `[Spec k]` | none |
| 4.3 homotopy invariance, Chern classes (sampled, headline) | rank `0`; `BG × 𝔸¹`; `O(−1)` on `ℙ¹`; `L ⊕ L^∨` | identity; `s^![𝔸¹ × BG] = [BG]`; `s^!s_*[ℙ¹] = −[pt]`, not `[ℙ¹]`; `c_1 = 0`, `c_2 = −c_1(L)²` | holds | none |
| 5.1 projection formula (headline) | `g : BG → Spec k`, `x = [Spec k]`, `y = [BG]` | both sides `(1/\|G\|)·[Spec k]`; a product weighted by `\|G\|` gives `[Spec k]` on the left | holds | none |
| 5.2 moduli spaces (headline) | `[𝔸¹/μ₂] → 𝔸¹`; `ℤ/p` on `𝔸²` | `ℤ/2 → 0` integrally, `0 = 0` rationally; `(1/p)·p = 1`, not `1/e = 1/p` | holds | none |
| 5.3 products on quotients (sampled, headline) | `ℙ(1, 2)`; `Bμ_n`; `G = 1` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; identity. edidin-graham1998 line 1069 asks "locally separated", weaker than a proper action | holds | none |
| 5.4 degree of a point (sampled, headline) | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `Spec K`; `[ℙ¹/μ₂]` | `[ℝ : ℝ]/2 = 1/2 = 2/4`; `[K : k]`; orders `2, −1, 0` of `t²/(t² − 1)`, `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 comparison bundle (sampled) | `[0 → 0]` and `[O → O]`; `E = O(−4)[1] ⊕ O(−2)` on `ℙ¹`; a contractible summand | rank `1 = 0 + 1 = 1 + 0`; `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`, `φ ∘ ξ = 0`, `P = O(3)²` of rank `2`; `rk F_1 + rk F_0 + rk G` | holds | none |
| 6.2 virtual class (sampled, headline) | `[O(1) → Ω]` on `ℙ¹`; through `P`; `𝓛_n` on `L`; `d + r < 0` | `c_1(O(−1)) = −1`; `c_1(O(3)²/O(2)) = 6 − 2 = 4 = c_1(O(4))`; divisor `n·[0₂]` of the section `e_1 = t^n·e_2`; `0` | holds | none |
| 6.3 relative formulas (sampled) | `Spec k[ε]/(ε²)`; node × `ℙ¹`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; `pt → B𝔾_m` | `2·[pt]`; `s = 1`, `−[𝔜 × pt]`; `s = 1` against `dim X − d − r = 0`, class `p·[pt]`, not `0`; `[pt]`; `−1 + 1 = 0` | holds with its hypotheses | none |
| 7.1 obstruction class (headline) | `X/𝔜` étale; `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | `L = 0`, unique extension; torsor under `1 + J ≅ J = Hom(O, J)`, zero group from `L_X`; `(ε + aε²)² = ε² ≠ 0` | holds | none |
| 7.2 characterisation (sampled, headline) | characteristic `2`, `A = k[x]/(x²)`, `φ = (0, id)` | `d(x²) = 2x dx = 0`; `Ext¹(A[1] ⊕ A, J) = J`, `φ^*ω = 0` since `φ` kills `A[1]`; `(x + ax²)² = x² ≠ 0` | condition 3 fails, as it should | none |
| 8.1 relative invariance (sampled, headline) | plane, `p = y` and `p = x`; `𝔸¹ × Spec k[ε]/(ε²)` | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `[C] = 2·[T-line]`, `∂β = 2·[ν = 0] − 2·[T = 0]`, `β = 2·(ν/T)` | holds | none |
| 8.1 fourth statement from the third | `Y′ ⊆ Y` smooth over `𝔐`, ideal `(f_1, …, f_c)` | `df_i` independent in `Ω_{Y/𝔐}` along `Y′`; `Y′ = (f)^{−1}({0} × 𝔐)`; `T_{Y/𝔸^c×𝔐}|_{Y′} = T_{Y′/𝔐}`; kresch1999b lines 400–403 translate along `𝔸^m`, the regularly embedded factor | consistent | none |
| 8.2 regular pullback (sampled) | node with `V(a + b)`; non-reduced base | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both ways; `v^!(2·[𝔸¹]) = 2·[pt] = [𝔜′]` | holds | none |
| 8.3 functoriality | conic `Z′ ⊆ 𝔸²`, `X = Z`, `E = Ω_Z`, `F = Ω_{Z′}`; `Z′ = pt ⊔ ⊔_ℕ pt` | `[Z′ × Z]`, then the graph (codimension `2`) gives `[Z′]`; `[pt]` for two choices of `Z′_0` | holds | none |
| 8.4 deformation invariance (sampled, headline) | `x² − by²` on `ℙ¹ × 𝔸¹`; `{xb = 1}`; `b` of degree `> 1` | counts `2, 2, 2`; `1` and `0` without properness; `i_b^!(n·[B]) = n·[b]`, `k`-degree `n·[κ(b) : k]`, `κ(b)`-degree `n` | holds | none |
| 9.1 relative space of maps | `X = Spec k`; `M = pt`, `F = id_{ℙ¹}` | unique extensions, so `M → 𝔅` formally étale; `H⁰(T_{ℙ¹}) = k³` against `0` | holds | none |
| 9.3 obstruction theory (sampled, headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)d + r = (r + 1)(d + 1) − 1`, `H¹ = 0`; `χ = 0`, `Ob = H¹(O) ⊗ O_M`, `c_1 = 0` | holds | none |
| 9.3 target hypothesis (R01) | `X = M = L`, `𝒞 = ℙ¹`, `F = pr₂` | both extension sets torsors under `H⁰(T, g^*T_L ⊗ J)`; `Rπ_*pr₂^*T_L = T_L`, `φ = id_{Ω_L}`, `Ob = 0` | holds for a target that is not quasi-projective | R01 |
| 9.4 resolution | `V = O`, genus `g`; `L = O` | `[H¹(H) → H¹(G)]`, `χ = 1 − g`; `G = O`, `H = 0`, the complex misses `H⁰ = O_M` | holds; ampleness needed | none |
| 9.5 rank and dimension (headline) | lines in `ℙ²`; `Spec k ⊔ ℙ¹`; general | `−3 + 3 + 2 = 2`; `ℓ = 0`, rank `0`, not `1`; `3g − 3 + n + δ + ℓ(1 − g) = (1 − g)(ℓ − 3) + n + δ`, li-tian1998 line 1586 | holds | none |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, 33 plan targets. Every section has a *Needs:* line and at
  least 3 Checks (plan `tests`: minimum 3); every layer ends with Examples and Dependencies. A search
  found no LaTeX delimiters, no `lemma` keyword, no process words, no pull-request numbers, no anchors,
  no machine paths and no `set_option`. Proposed names are in italics; every backticked Lean name is a
  library or supplier declaration. No executable procedure is stated.
- **Headline statements** (Summary): integral groups and comparisons (2.2–2.3); rational pushforward,
  Gysin maps, homotopy invariance and Chern classes on all stacks (4.1–4.3); intersection ring and
  duality, the moduli-space isomorphism, the ring structure of the Edidin–Graham comparison, the
  degree of a point (5.1–5.4); the virtual class without the resolution property or separatedness
  (6.2); the relative obstruction class and characterisation (7.1–7.2); relative invariance, pullback,
  functoriality, deformation invariance (8.1–8.4); the obstruction theory of spaces of maps, its
  resolutions and dimension (9.3–9.5). Each is a named target with a locator. None is statable at the
  pins: a search of both pinned trees for `IsAlgebraicStack` and `IsDeligneMumford` has no hit.
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled
  sections carry the item number, the hypotheses and the statement the README gives:
  - vistoli1989 lines 96–99, 299–303, 347–376, 379–452, 485–507, 542–584, 887–1074, 1081–1207,
    1451–1470, 1570–1623, 1665–1718, 1758–1776, 2064–2066, 2109–2112;
  - behrend-fantechi1997 lines 781–809, 884–897, 1162–1201, 1261–1320, 1353–1363, 1389–1424, 1583–1614,
    1617–1739;
  - kresch1999b lines 182–207, 218–304, 307–343, 390–405;
  - li-tian1998 lines 1472–1474, 1486–1503, 1565–1566, 1585–1586; behrend1997 lines 139–141, 148–161,
    165–187, 193–197; edidin-graham1998 lines 1042–1045, 1069–1076; rydh2015 lines 81–87;
    deligne-mumford1969 lines 1012–1019; keel-mori1997 line 28;
  - stacks-chow-spaces lines 57–61, 126–133, 312–315, 797–810, 1907–1911, 1986–2007, 2224; stacks-chow
    line 1356.
- **Pinned declarations opened** (the revisions `design/plan.json` records as its baseline):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `AlgebraicCycle.map` (line 69,
    `[QuasiCompact f]`, weights); `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `Scheme.ord`
    (line 52).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86, supported on
    `pointsOfDimension`, empty for `k < 0` at line 80), `RatEquiv` (257), `ChowGroup` (295),
    `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369).
  - `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean`: pushforward along closed immersions (module
    docstring, lines 15–18).
  - `SchPseudofunctor` (`Stack/Basic.lean` 37); `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`,
    docstring line 34: fppf sheaf with representable diagonal; no quasi-separatedness);
    `PrestableFamily` (`Curves/Prestable.lean` 45: extends `IsProper` and `GeometricallyConnected`,
    "Its genus is separate data"; `syntomic` at 55); `FixedRank.vectorBundleDegree`
    (`VectorBundle/Degree.lean` 82, `χ(X, E) − r · χ(X, O_X)`).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: the headings §§0.1–9.6 exist under the cited numbers.
    Read: Scope, Conventions, §§0.2–0.3, 1.5–1.6, 2.1–2.5, 3.2–3.5, 4.4–4.5, 5.5, 6.4–6.5, 7.3–7.7,
    8.1, 9.1–9.6. §1.5 covers "representable closed immersions"; §2.1 is "for separated
    Deligne–Mumford stacks" and has no statement on closed substacks; §2.3 is rational; §7.3 and §9.2
    ask for separatedness and the resolution property; §9.4 is over smooth bases; the two Checks that
    4.4 quotes are in §2.1 and in Layer 2's Examples.
  - SchemeAndStackFoundations on main: the 22 cited headings exist (§1.3 … §5.6); the 29 cited names
    each occur (script); `chow_affine_bundle` and `localization_exact` are in §5.2, the regular
    immersions that need not be closed and the exterior product in §5.5, the product "no
    separatedness is assumed" in §5.6, `keel_mori` in §1.23 with `π` proper and quasi-finite.
  - StableReductionPartII at its open head: §5.15 states the Edidin–Graham comparison with the
    hypotheses the contract quotes, "compatible with Chern classes of G-equivariant vector bundles and
    with proper pushforward", and no product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist, for the stable-map stack only.
  - EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are
    folders on main; the resolver lists none of their cited sections as missing.
- **Gaps.** `closed-substacks-of-stacks`: no roadmap on main or at an open head states closed, reduced
  and integral closed substacks of a Deligne–Mumford stack (search by object; the hits are particular
  substacks of other roadmaps and VirtualFundamentalClass line 443, which uses them without stating
  them). `normal-cones-of-local-immersions`: a search for normal cones of local immersions has no hit
  anywhere. Both `needs` sentences name one construction with its properties and hypotheses.
- **Duplication and ownership.** Searched main and the open heads by object: Chow groups of algebraic
  spaces, integral Chow groups of stacks, deformation invariance, closed substacks, normal cones of
  local immersions. No other roadmap states a target of this one. Against VirtualFundamentalClass, each
  layer removes a named hypothesis (rational → integral, separated → not, resolution property → one
  resolution, smooth base → pure dimension, absolute → relative) and none restates a section at equal
  generality. `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no second
  copy; the roadmap is not on main.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source. The
  order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 3.1–3.4; 5.1 needs
  4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 (8.2 needs 6.2) and 9 after 7 (9.1 needs 7.1).
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at 40 passages with 10 sources (the 15 sampled sections at every
  locator, and in addition Convention 2, 1.1, 2.1, 3.5, 4.2, 5.2, 8.3, 9.4 and 9.5). The longest
  shared runs are 7 words, in two theorem statements that can be written one way (7.2's condition 2
  beside behrend-fantechi1997 line 1164; 1.1's finite cover beside rydh2015 line 84). Arrangement:
  vistoli1989's section 3 is split over Layers 2, 3 and 4 by integrality, its sections 1, 2, 5 and 6
  feed Layers 1 and 5 in another order, and its section 4 is no layer. No table, figure, list of
  examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 40 passages compared with 10 sources, none shared beyond parts of statements of at most 7 words; largest share vistoli1989, 74 of 163 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each was
  read in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; displays and some labels are garbled (the label of (3.6)(iii)
  prints as "(ii)" at line 985, the display of (1.15) at line 370) and were matched by content.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local embeddings,
  agreement of 8.3's comparison on overlaps of charts, the use of kresch1999b Corollary 1.10
  component by component on non-reduced ambients) was checked on charts, by rank and dimension and on
  the instances of the table, not as a proof.
- 3.5's claim that Vistoli's rational equivalence is a section of the étale sheaf `W_*` was checked at
  Lemma 4.6 (ii) (lines 1461–1462), not through the whole proof of Lemma 3.16.
- Locators of the 18 sections outside the sample were reread only where listed above.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since an isomorphism in the derived category need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth regularly embedded stack, as its proof uses; affects nothing.
- **Misprint** in vistoli1989 at the paragraph before Lemma 5.3, line 1613: the source says multiplicativity of the degree is Lemma 1.15; it should be Lemma 1.16 (line 379), unless the slip is the scan's; affects nothing.
- **Misprint** in vistoli1989 at the proof of Proposition 6.1, line 1768: the source says integrality of the reduced fibre product follows from Lemma 2.5; it should be Lemma 2.3 (there is only a Corollary 2.5, on degrees), unless the slip is the scan's; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e3ccaae61fe2376360472c51ea419924641fcc5d", "job": "REV-DESIGN-VirtualFundamentalClassPartII~13", "model": "fable", "worker": "chris-x79"} -->
