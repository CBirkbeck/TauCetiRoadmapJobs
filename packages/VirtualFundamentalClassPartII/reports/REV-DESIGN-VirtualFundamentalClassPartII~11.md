<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6900025807 -->
Review (claude) of 75f103b

Verdict: needs_changes

1. **F01** (P2) 6.3 and 8.2 drop the global-resolution hypothesis

   - **Location.** `design/README.md` 6.3, line 1358: "Assume moreover that `H⁰(E)` is locally free.
     Prove: …"; 8.2, lines 1581–1583: "Prove that `u^*E` is a perfect relative obstruction theory for
     `X′/𝔜′` with a global resolution … and that `v^![X/𝔜, E]^vir = [X′/𝔜′, u^*E]^vir`".
     `design/plan.json`, targets 6.3 and 8.2, `hypotheses`.
   - **Claim.** The class `[X/𝔜, E]^vir` exists for the theories of these statements, and (8.2)
     `u^*E` has a global resolution.
   - **Witness.** 6.2 defines the class only "for a global resolution `F•`". Convention 7 and the
     Layer 6 header assume perfectness and constant rank only. The plan's hypothesis lists for 6.3
     and 8.2 have no resolution. behrend-fantechi1997 line 1704 assumes one; 8.3 and 8.4 here state
     it. With `v = id`, 8.2 as written asserts a resolution for every perfect `E`.
   - **Repair.**
     - 6.3: write "Assume moreover that `E` has a global resolution and that `H⁰(E)` is locally
       free." Add one clause: in the first case `[0 → H⁰(E)]` is one, so the hypothesis is automatic
       there.
     - 8.2: write "Let `E` have a global resolution `F•`. Prove that `u^*E` is a perfect relative
       obstruction theory for `X′/𝔜′` with the global resolution `u^*F•` (VirtualFundamentalClass
       §6.4) and that …".
     - `plan.json`: add "E has a global resolution" to the hypotheses of 6.3 and 8.2, and "with a
       global resolution" to their statements.
     - Tested on the witness: for `v = id` the repaired 8.2 says only that `u^*F• = F•` resolves
       `E`, and the equality is `[X/𝔜, E]^vir = [X/𝔜, E]^vir`. The Checks of 6.3 and 8.2 all carry
       explicit two-term complexes and are unchanged.

2. **F02** (P2) 3.5 defines `s^*` on a theorem that is cited, not planned

   - **Location.** `design/README.md` 3.5, lines 869–871: "`s^*` is the inverse of the flat pullback
     `A_{i−c}(U) → A_i(N)`, an isomorphism on algebraic spaces (stacks-chow-spaces Lemma 27.3, lines
     1986–1990)"; *Needs:*, lines 888–890; `design/plan.json`, target 3.5, `api`.
   - **Claim.** Integral homotopy invariance for a vector bundle over a quasi-separated algebraic
     space of finite type is available to define `f^!`.
   - **Witness.** No "Prove" sentence, API bullet or plan `api` entry of 3.5 states it (the six
     entries are pushforward, pullback, commutation, normal cone, flat base change, schemes).
     SchemeAndStackFoundations §5.2 `chow_affine_bundle` is for schemes. 4.3 is rational and needs
     3.5. A source lemma is not a supplier.
   - **Why P2 and not P1.** The sentence does state the fact with its hypotheses in the section that
     uses it, so the owner is clear; what is missing is the obligation to prove it.
   - **Repair.**
     - 3.5, after the definition: "Prove that for a vector bundle `p : N → U` of rank `c` over a
       quasi-separated algebraic space `U` of finite type over `k`, `p^* : A_j(U) → A_{j+c}(N)` is an
       isomorphism for every `j` (stacks-chow-spaces Lemma 27.3, lines 1986–1990, read through 2.3);
       `s^*` is its inverse. On schemes it is SchemeAndStackFoundations §5.2's `chow_affine_bundle`."
     - Add the same as the first API bullet, and a matching `api` entry to target 3.5 in
       `plan.json`.
     - Tested on the instance of the round-11 repair table: for the non-scheme space `U` of 4.2's
       last Check and `N = U × 𝔸^r`, the new statement is exactly the isomorphism
       `A_k(U) → A_{k+r}(N)` that `s^*` inverts, and it is now a target.
     - Same pattern elsewhere: none. The other Stacks Project lemmas (2.1 lengths, 2.2 orders, 3.3
       localisation, 5.4 degrees) sit under "Prove".

Two findings, both P2 (R01, R02); no P1 and no P3. The three round-10 findings are repaired. The
two declared supplier gaps (`gap:closed-substacks-of-stacks`, VirtualFundamentalClass §2.1;
`gap:normal-cones-of-local-immersions`, VirtualFundamentalClass §1.5) are precise, minimal and
declared under the same slugs in `design/plan.json` and in the README; they are contracts, not
findings.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (read in full, 1973 lines),
`packages/VirtualFundamentalClassPartII/design/plan.json` (33 targets, 2 gaps, 7 suppliers) and
`packages/VirtualFundamentalClassPartII/sources.toml` (14 entries). This is a design: there is no
`Suggested.lean`. This lane does not elaborate, so no elaboration, no `#check` comparison and no
one-tactic padding probe were run; none applies at this stage.

## Round-10 findings

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 4.1, line 952: "*Needs:* 1.1, 1.3, 3.1–3.4." 8.1, line 1554: "gap:normal-cones-of-local-immersions; 2.2; SchemeAndStackFoundations §5.5." 3.1, lines 734–735: "*Needs:* 2.2; 2.3 (its statement on schemes, through which SchemeAndStackFoundations §5.2 applies)"; likewise 3.2 (lines 783–784) and 3.5 (lines 888–889). The plan has `target:2.3` under 3.1, 3.2, 3.5 and `target:3.1`–`target:3.4` under 4.1. The fix worker's reason for keeping 2.3 holds: the "on schemes" bullets compare with Tau Ceti's `ChowGroup`, which only 2.3 identifies. |
| F02 (P3) | repaired | 9.2, lines 1810–1811: "*Needs:* 9.1 (its setting: the family `𝒞 → 𝔅`, prestable étale locally on the base, and the base change `π : 𝒞_M → M`)"; the plan's 9.2 has `target:9.1`. |
| F03 (P3) | repaired | 9.1, lines 1761–1764: "the map `ḡ ↦ F ∘ 𝒞_ḡ` is a bijection from the extensions of `g` to `T̄` (7.1) onto the extensions of `F ∘ 𝒞_g : 𝒞_T → X` to `𝒞_{T̄}`. Here `𝒞_ḡ : 𝒞_{T̄} → 𝒞_M` is the base change of `ḡ`"; the plan's 9.1 statement matches. |

A script compared the local targets and gap slugs of all 33 *Needs:* lines with the plan's
prerequisites: they agree, and the gaps' `neededBy` lists equal the sections that carry the slugs.
R01 came from looking for the repaired pattern (a hypothesis present in one file or section and
absent in another) in the text no repair touched.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers: VirtualFundamentalClass (open, adds a new folder),
StableReductionPartII (in the merge order; open, adds a new folder; §5.15 only),
SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves
and DerivedModuleAlgebra (main). StableReductionPartII §5.15 needs VirtualFundamentalClass
§§2.1–2.3 and nothing of this roadmap. AlgebraicGromovWittenTheory is a consumer only. No roadmap
of the never-cite list is cited.

## Maintainer notes

None stands as a finding.

1. Words: satisfied. Convention 2 uses "local immersion" for the class and "local embedding" for
   the chart pair, and gives Vistoli's words once.
2. Cotangent complex: satisfied. Convention 6 defines no truncated complex; 9.3 builds `φ` into
   the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted and relative invariance with the plane example. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at
   its open head reads "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch,
   Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and states that no compatibility datum
   over the graph is used; the conic instance is in the table.
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology occur 0 times; the seven
   suppliers are cited by section.

## Adversarial table

Rows: the 15 sampled targets, the passages the round-11 repair changed, the headline statements
and the targets the findings touch. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 function field, `e` | `BG`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `B_{𝔸¹}G`; `[𝔸¹/μ₂]` | `k`, `e = \|G\|`; equaliser on `ℤ/4 × Spec ℂ` is `ℝ`, kernel of order `2`; fibres of `G` are `ℤ/2` off `0`, so `e = 2`; `k(x²)`, `e = 1` | holds | none |
| 1.2 `k(𝒱) → k(U)` finite separable | `U = Spec K → BG`, `K/k` finite separable | `k → K`; generic gerbe is étale over its space, so `U` is étale over a space with field `k(𝒱)` | holds | none |
| 1.3 `deg > 0` iff equal dimension | `𝔸¹ → Spec k`; Frobenius | `[k(t) : k] = ∞`, degree `0`; `[k(t) : k(t^p)] = p` | holds | none |
| 1.3 degree formula | `Spec k → BG → Spec k`; `ℤ/p` on `𝔸²`, `V(x)` | `\|G\| · (1/\|G\|) = 1`; norm of `y` is `y^p − x^{p−1}y`, degree `(1/p) · p = 1` | holds | none |
| 1.3 dominant base change | `t ↦ t²` against `s ↦ s³`; `Spec k → Spec k` against `BG → Spec k` | fibre product `t² = s³` integral, degree `2 = 2`; `BG → BG`, `1 = 1`; an integral fibre product contains the nonempty generic fibre, so it dominates | holds | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `P(y) ≠ y` irreducible, also inseparable `y^p − a`, `p` odd | `k[x]/P(x²) = K[x]/(x² − θ)`, `θ ≠ 0`, reduced, so `div(P) = [W]`; `div(y) = 2·[Bμ₂]`; quotient `ℤ/2` | holds | none |
| 2.3 three comparisons | `L`; `Spec k`; `[𝔸¹/μ₂]`; Situation 2.1 with `B = Spec k` | `ℤ²/ℤ·(1, 1) ≅ ℤ`; `ℤ` (`equivIntOfUnique`); `ℤ/2 ⊗ ℚ = 0`; `Spec k` quasi-separated, Noetherian, universally catenary | holds | none |
| 3.1 étale pullback not injective | isogeny of degree `2`, `P ∈ ker π̂` | divisor of degree `0`, sum `(2Q + T) − T = 2Q = π̂(P) = O`: principal | holds | none |
| 3.2 divisor formula | atlas `𝔸¹_x → [𝔸¹/μ₂]`, `φ = x` and `φ = x − 1`; `𝔸¹ → 𝔸¹ × BG`, `φ = t` | `f_*[0] = 2·[Bμ₂]`, `N(x) = −y`, `div(−y) = 2·[Bμ₂]`, factor `1`; `f_*[1] = [W]`, `div(1 − y) = [W]`; `\|G\|·[0 × BG]` against `div(t) = [0 × BG]`, factor `\|G\|` | holds | none |
| 3.3 push–pull, localisation | `Spec k → BG` against itself; `Bμ₂ ⊆ [𝔸¹/μ₂]`; two points of `ℙ¹` | `\|G\|·[Spec k]` both ways; `ℤ → ℤ/2 → A_0(𝔾_m) = 0`; kernel `ℤ·(1, −1)` | holds | none |
| 3.4 exterior product | `K ⊗_k K` separable of degree `2`, purely inseparable of degree `p`; `[𝒱] × div(φ)` | two points, `4 = 2 + 2`; length `p`, `p² = p · p`; equals `∂` of the flat pullback of `(𝒲, φ)` to `𝒱 × 𝒲`, pushed along a closed immersion | holds integrally | none |
| 3.5 definition | `Spec k → BG`, `Y = Spec k`; `{0} → 𝔸¹` along `t ↦ t²`; base change along `{0} → 𝔸¹` | `[G]`, pushforward `\|G\|·[Spec k]`; `2·[pt]`; `[pt]` against `c_1(O) ∩ [pt] ∈ A_{−1} = 0` | holds | none |
| 3.5 `s^*` (R02) | `U` the non-scheme space of 4.2, `N = U × 𝔸^r` | Lemma 27.3 (line 1986) applies: `U` is good, the bundle has rank `r`; no target of this roadmap or supplier section states it | used, not planned | R02 |
| 3.5 `U = ℱ ×_𝒢 T` quasi-separated | diagonal of `f` | `Δ_ℱ` quasi-compact and the pullback of `Δ_𝒢` quasi-separated, so `Δ_f` is quasi-compact | `U` is good | none |
| 4.1 (repair) route | Lemma 3.8, lines 1045–1048; `Bμ₂ × 𝔸¹ → 𝔸¹`, `φ = t` | uses a proper cover and representable `f_*`, no cone; `(1/2)·[0]` both sides | 3.5 unused | none |
| 4.2 definition | `π : Spec k → BG`; `𝔸¹_ℂ` glued along conjugation | `\|G\|^{−1} · r_*[G] = [Spec k]`; relation `𝔸¹_ℂ ⊔ 𝔾_{m,ℂ}` quasi-compact, residue field `ℂ` over the origin | holds | none |
| 4.4 agreement | `B(ℤ/2)`; `Spec k` | `1/2` in both theories; `ℚ` in both | holds | none |
| 5.1 projection formula (headline) | `BG → Spec k`, `x = [Spec k]`, `y = [BG]` | both sides `(1/\|G\|)·[Spec k]`; weighting by `deg(BG/BG × BG) = \|G\|` gives `[Spec k]` on the left | holds | none |
| 5.2 moduli spaces (headline) | `L × B(ℤ/2) → L`; `[𝔸¹/μ₂] → 𝔸¹`; `ℤ/p` on `𝔸²` | `(1/2)·[0₁]`, `ℚ ≅ ℚ`; `0 = 0` rationally, `ℤ/2 → 0` integrally; degree `1`, not `1/p` | holds | none |
| 5.3 product (headline) | `ℙ(1, 2)`; `Bμ_n` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ` | holds | none |
| 5.4 degree of a point (headline) | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]`, `t²/(t² − 1)` | `2/4 = 1/2`; orders `2, −1, 0`, `2 · (1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 comparison bundle | `[0 → 0]` and `[O → O]`; `[O(−4) → Ω]` on `ℙ¹` | rank `1 = 0 + 1 = 1 + 0`; `Hom(E, E) = k ⊕ k ⊕ H¹(O(−2))`, `φ ∘ ξ = 0`, homotopies in `H⁰(O(−2)) = 0`; nonsplit extension of `O(4)` by `O(2)` is `O(3)²` | holds | none |
| 6.2 virtual class (headline) | `[O(1) → Ω]` on `ℙ¹`; through `P`; `𝓛_n` on `L` | `dim C(F•) − rk F_1 = d + r`; `−1`; `c_1(O(3)²/O(2)) = 4 = c_1(O(4))`; section `e_1`, `t^n·e_2` has divisor `n·[0₂]` | holds | none |
| 6.3 formulas | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; node `× ℙ¹` | `s = 1`, `dim X − d − r = 0`, class `p·[pt]`; `[pt]`, single exponent gives `0`; `−[𝔜 × pt] ↦ −([ℓ_a] + [ℓ_b])` | formulas hold | none |
| 6.3, 8.2 hypotheses (R01) | `v = id`, `E` perfect without a stated resolution | 6.2 needs `F•` to form `C(F•)`; in case one `[0 → H⁰(E)]` exists; in case two the class in `Ext²(H⁰(E), H^{−1}(E))` is not assumed zero | hypothesis missing | R01 |
| 7.2 characterisation (headline) | cone `C` of `φ`; characteristic `2`, `φ = (0, id)` | `Hom(g^*C, J[i]) = 0` for `i ≤ 1`, so `φ^*` injective on `Ext¹`; `φ^*ω = 0` yet `(x + ax²)² = x² ≠ 0` | holds | none |
| 8.1 invariance (headline) | plane; `𝔸¹ × Spec k[ε]/(ε²)` | `div(ν/η) = [ν = 0] − [η = 0]`, fixed by `ξ ↦ ξ + a`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `∂β = 2·[ν = 0] − 2·[T = 0]` | holds | none |
| 8.2 pullback | node with `V(a + b)`; `X′` | `k[a, b]/(ab, a + b) = k[a]/(a²)`, `−2·[pt × pt]` both ways; `Δ_{X′}` is an open immersion followed by a base change of `Δ_X` | equality holds | R01 (hypothesis) |
| 8.4 deformation invariance (headline) | `x² − b y²`; `{xb = 1}`; `η_b^!` against `i_b^!` | counts `2, 2, 2`; `1` and `0`; 4.2's flat bullet with `𝒢 = B`, `𝒢_1 = 𝔐 × B`, then `i_b^!(n·[B]) = n·[b]` | holds | none |
| 9.1 (repair) bijection | `X = Spec k`; `M = pt`, `F = id_{ℙ¹}` | target one element, so unique lifting; one extension against a torsor under `k³` | discriminates | none |
| 9.2 (repair) *Needs:* 9.1 | `C × M → M` | `RΓ(C, V) ⊗ O_M`; the statement is about `π` of 9.1 | holds | none |
| 9.3 obstruction theory (headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)(d + 1) − 1`, `H¹ = 0`; `Ob = H¹(O) ⊗ O_M`, `c_1 = 0` | holds | none |
| 9.4 resolutions | `0 → H → G → V → 0` | `π_*G = π_*(V ⊗ L^N) ⊗ π_*L^{−N} = 0`, so `Rπ_*V = [R¹π_*H → R¹π_*G]`; `L = O` gives `[0 → R¹π_*O]`, missing `H⁰` | holds | none |
| 9.5 rank and dimension | lines in `ℙ²`; `Spec k ⊔ ℙ¹`; general | `3 + 2 − 3 = 2`; `ℓ = 0`, rank `0`, not `1`; `3g − 3 + n + δ + d(1 − g) = (1 − g)(d − 3) + n + δ`, li-tian1998 line 1586 | holds | none |

## Verified sound

- **Shape.** 9 layers, 33 numbered sections, 33 plan targets; every section has a *Needs:* line
  and at least 3 Checks (script: minimum 3, maximum 7 in the plan); every layer ends with Examples
  and Dependencies. A search found no LaTeX delimiters, `lemma` keyword, process words,
  pull-request numbers, anchors, machine paths or `set_option`. Proposed names are in italics;
  every backticked Lean name is a library or supplier declaration.
- **Headline statements** (Summary): the integral groups and their comparisons (2.2–2.3); rational
  pushforward, Gysin maps, homotopy invariance and Chern classes on all stacks (4.1–4.3); the
  intersection ring and duality, the moduli-space isomorphism, the ring structure of the
  Edidin–Graham comparison, the degree of a point (5.1–5.4); the virtual class without the
  resolution property or separatedness (6.2); the relative obstruction class and characterisation
  (7.1–7.2); relative invariance, pullback, functoriality, deformation invariance (8.1–8.4); the
  obstruction theory of spaces of maps, its resolutions and dimension (9.3–9.5). Each is a named
  target with a locator. None is statable at the pins: a search of both pinned libraries finds no
  `IsAlgebraicStack` or `IsDeligneMumford`.
- **Sampled locators, read at the text** (the author flagged none as unverified). All 15 sampled
  sections carry the item number, hypotheses and statement the README gives:
  - vistoli1989 lines 337–376, 419–452, 899–1012, 1045–1125, 1170–1208, 1451–1464, 1600–1626,
    1663–1676, 1703–1720;
  - behrend-fantechi1997 lines 884–897, 1255–1264, 1280–1322, 1351–1366, 1602–1612, 1615–1672,
    1700–1712;
  - kresch1999b lines 330–344; li-tian1998 lines 1468–1506, 1548–1568, 1582–1588; behrend1997
    lines 137–198;
  - stacks-chow-spaces lines 55–62, 124–134, 664–669, 795–819, 1984–1992.
- **Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`):
  - `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`: `AlgebraicCycle.map` (line 69,
    `[QuasiCompact f]`, weights).
  - `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`: `AlgebraicGeometry.Scheme.ord` (line 52;
    junk value `0` for `f = 0` or `coheight z ≠ 1`, in its docstring).
  - `TauCeti/AlgebraicGeometry/Chow/Basic.lean`: `cyclesOfDimension` (86, points of dimension
    `k`), `RatEquiv` (257), `ChowGroup` (295), `cycleClass` (304), `equivIntOfUnique` (369).
  - `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean` (pushforward along closed immersions);
    `SchPseudofunctor` (`Stack/Basic.lean` line 37).
  - `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean` line 195: fppf sheaf, representable
    diagonal, étale atlas; no quasi-separatedness).
  - `PrestableFamily` (`Curves/Prestable.lean` line 45: extends `IsProper` and
    `GeometricallyConnected`; `syntomic` at line 55; no genus).
  - `FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`).
- **Cross-roadmap citations resolved.**
  - VirtualFundamentalClass at its open head: headings §§0.2–9.6 exist under the cited numbers.
    Read: Scope, Conventions, §§1.5–1.6, 2.1–2.5, 3.2, 4.4–4.5, 6.5, 7.1–7.7, 8.1, 9.1–9.6. §1.5
    covers representable closed immersions only; §2.1 is for separated stacks; §7.3 and §9.2
    assume separatedness and the resolution property; §9.4 is over smooth bases.
  - SchemeAndStackFoundations on main: the 22 cited headings exist and the 28 cited names occur
    (script); `chow_affine_bundle` lies in §5.2, `excess_intersection` and
    `gysin_self_intersection` in §5.5; §5.6 reads "no separatedness is assumed".
  - StableReductionPartII at its open head: §5.15 states the Edidin–Graham comparison of groups
    with Chern classes and proper pushforward, and no product statement.
  - AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 exist, over a field of characteristic
    zero.
  - EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra
    are folders on main; their cited sections were resolved by the citation tool (nothing
    unresolved).
- **Duplication and ownership.** Searched the open heads and main by object: Chow groups of
  algebraic spaces, Rydh's finite cover, Vistoli, deformation invariance, Chow groups of coarse
  spaces, Kodaira–Spencer, generic stabiliser. No other roadmap states a target of this one.
  Against VirtualFundamentalClass, each layer removes a named hypothesis (separatedness, rational
  coefficients, the resolution property, smooth bases) and none restates a section at equal
  generality. `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no
  second copy; the roadmap is not on main.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 → 6 is forced (2.2 needs 1.2; 3.1 needs 2.2; 4.1 needs 3.1–3.4; 5.1
  needs 4.1–4.3; 6.2 needs 4.3–4.4), as are 8 after 6 and 9 after 7.
- **Manifest.** 14 sources, one key each, every key cited in the README; 12 certified from open
  repositories, 2 settled as uncertified; no local path. No source was fetched this round and no
  `needs-references.toml` was written.
- **Copyright.** Wording compared at the 26 passages listed above, with 6 sources. The longest
  shared runs are parts of statements that can be written one way (4 words in 6.2 beside
  behrend-fantechi1997 line 1293). Arrangement: vistoli1989's section 3 is split over Layers 2, 3
  and 4 by integrality, its sections 2, 5 and 6 feed one layer (5), and its section 4 is no layer.
  No table, figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 26 passages compared with 6 sources, none shared beyond parts of statements of at most 4 words; largest share vistoli1989, 72 of 146 occurrences of source keys in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The journal numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each
  was read in the arXiv version the manifest names.
- vistoli1989 is read from an OCR text; displays and some labels are garbled (the label of
  (3.6)(iii) prints as "(ii)" at line 985) and were matched by content. Line 1613 refers to the
  multiplicativity of the degree as "Lemma 1.15", while the lemma is (1.16) at line 379; the text
  does not show whether this is the source's slip or the recognition's.
- The global gluing in 8.1–8.3 (descent of the rational equivalence over relative local
  embeddings, the comparison of 8.3's API on overlaps, the extension of kresch1999b Proposition
  2.3 to non-reduced ambients) was checked on charts, by rank and dimension and on the instances
  of the table, not as a proof.
- 3.5's claim that Vistoli's rational equivalence descends to algebraic-space sources was checked
  only at Lemma 4.6 (ii) (lines 1458–1462, étale compatibility), not through the proof of Lemma
  3.16.
- Locators of the 18 sections outside the sample were not reread this round, except those listed
  above; their statements were read and their Checks recomputed. The round-10 report records the
  lines read for them.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891: the source says the rational equivalence is invariant under the whole tangent bundle of the ambient; it should be invariant under the tangent bundle of the regularly embedded stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Gap** in behrend-fantechi1997 at the proof of Proposition 5.3, lines 1303–1305: the source says both resolutions may be taken to map to the theory by morphisms of complexes; it should justify this, since a derived isomorphism need not be one; affects the proof.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "75f103b780467b8c48ac13f8f2e1def6a2d8296f", "job": "REV-DESIGN-VirtualFundamentalClassPartII~11", "model": "fable", "worker": "chris-x80"} -->
