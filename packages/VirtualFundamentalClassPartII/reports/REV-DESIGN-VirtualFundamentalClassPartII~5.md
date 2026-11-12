<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6805607340 -->
Review (claude) of f8a2a22

Verdict: needs_changes

1. **F01** (P3) 8.4 applies the base Gysin map to a pushforward that is not over the base

   - **Location.** README 8.4: "pushing forward to `B` (4.1) gives `n·[B]` …, and compatibility of `η_b^!` with
     proper pushforward (4.2) gives `deg_{κ(b)}[X_b]^vir = n`".
   - **Claim.** 4.2's API covers this step.
   - **Witness.** `η_b : 𝔐 × {b} → 𝔐 × B`; 4.2 commutes `η_b^!` with proper morphisms of stacks over `𝔐 × B`.
     For `𝔐 = B𝔾_m` (`m = −1`, `r = 1`), `X → B` is not a morphism over `𝔐 × B`, and `X → 𝔐 × B` is not proper.
   - **Repair.** Add to the API of 3.5 and of 4.2: "for a flat morphism `𝒢_1 → 𝒢` and the base change
     `f_1 : ℱ ×_𝒢 𝒢_1 → 𝒢_1` of `f`, `f_1^! = f^!` on Chow groups of stacks over `𝒢_1`: the fibre products `U` and
     cones `C_{U/T}` are the same and `N_{ℱ_1/𝒢_1}` is the pullback of `N_{ℱ/𝒢}`
     (gap:normal-cones-of-local-immersions, flat case)". In 8.4 write: "`η_b^! = i_b^!` on stacks over `𝔐 × B`, for
     `i_b : {b} → B`, by 4.2 applied to the flat projection `𝔐 × B → B`; compatibility of `i_b^!` with proper
     pushforward along `X → B` gives …". Mirror the bullet in `plan.json` (4.2 `api`). Tested on the witness: `i_b^!`
     acts on `X → B` directly, with `U = T ×_B {b}` for both maps.

2. **F02** (P3) 3.5: the descent step needs the étale compatibility of the rational equivalence

   - **Location.** README 3.5, Route: "the passage from schemes to algebraic-space sources is étale descent of
     cycles and rational equivalences (2.1–2.2), the normal cones and the classes `(ℱ · T)` being étale local".
   - **Claim.** Vanishing in the Chow group of an étale atlas gives vanishing on the algebraic space.
   - **Witness.** Étale pullback is not injective on integral Chow groups: for an étale isogeny `π : E′ → E` of
     elliptic curves of degree `2` and `P ≠ O` in the kernel of the dual isogeny, `π^*([P] − [O]) = 0` in `A_0(E′)`
     while `[P] − [O] ≠ 0` in `A_0(E)`.
   - **Repair.** Replace the clause by: "… is étale descent of cycles and of the rational equivalence itself,
     which is canonical and commutes with étale base change (vistoli1989 Lemma 4.6 (ii), lines 1458–1462), so it
     is a section of the étale sheaf `W_*` (2.2); descent of classes alone does not suffice". Add Lemma 4.6 to
     3.5's locator in `plan.json`. On the witness the class is not claimed to descend; only elements of `W_*` are.

3. **F03** (P3) 9.1 drops the quasi-separatedness that Convention 7 and 6.2 ask of the base

   - **Location.** README 9.1: "Let `𝔅` be an algebraic stack of pure dimension `b`, locally of finite type over
     `k`"; 9.4: "`[M/𝔅, E]^vir` is defined (6.2)". Also the Layer 7 header and 8.1 ("an algebraic stack locally of
     finite type over `k`").
   - **Claim.** 9.1's base is a base of Convention 7.
   - **Witness.** Convention 7: "locally of finite type and quasi-separated over `k`". `Bℤ` (Convention 1's own
     non-example) with `M = Spec k → Bℤ` étale satisfies 9.1's hypotheses and is not quasi-separated;
     VirtualFundamentalClass's Conventions use quasi-separated algebraic stacks throughout.
   - **Repair.** Add to Convention 7: "Every algebraic stack of this roadmap is quasi-separated, as in
     VirtualFundamentalClass's Conventions", and write 9.1 as "an algebraic stack as in Convention 7, of pure
     dimension `b`"; add "quasi-separated" to the 9.1 hypothesis in `plan.json`. `Bℤ` is then excluded.

4. **F04** (P3) two more *Needs:* and Dependencies lines disagree

   - **Location.** README Layer 2 Dependencies: "Layer 1; gap:closed-substacks-of-stacks; Tau Ceti `Chow/Basic.lean`;
     Mathlib `AlgebraicGeometry.Scheme.ord`; SchemeAndStackFoundations §5.1; VirtualFundamentalClass §2.1"; README
     3.2 *Needs:* "1.2–1.3, Layer 2; SchemeAndStackFoundations §5.2; Mathlib `AlgebraicGeometry.AlgebraicCycle.map`".
   - **Claim.** Each layer's Dependencies are what its targets need, and each *Needs:* line lists what the
     statement uses.
   - **Witness.** 2.1 *Needs:* "VirtualFundamentalClass §0.2". 3.2's definition uses "the image
     (gap:closed-substacks-of-stacks)", and `plan.json` lists that gap in 3.2's prerequisites and in the gap's
     `neededBy`.
   - **Repair.** Add "VirtualFundamentalClass §0.2" to Layer 2 Dependencies and
     "gap:closed-substacks-of-stacks" to 3.2's *Needs:* line. The other eight layers were compared line by line
     and agree (table below).

5. **F05** (P3) the gap paragraph cites Vistoli for flat base change of cones, which the lines do not state

   - **Location.** README, "What VirtualFundamentalClass §1.5 must provide": "a closed embedding
     `C_{X′/Y′} ⊆ C_{X/Y} ×_X X′`, an isomorphism when `Y′ → Y` is flat (vistoli1989 lines 529–535)"; same in
     `plan.json` `gaps[1].detail`.
   - **Claim.** The lines support both the embedding and the flat isomorphism.
   - **Witness.** vistoli1989 lines 529–535 state only the closed embedding for a morphism `G′ → G` and its
     construction on atlases; flatness is not mentioned there.
   - **Repair.** "(vistoli1989 lines 529–535 for the embedding; the flat case from VirtualFundamentalClass §1.5's
     flat base change on the charts `U → V`)", in both files. The `needs` sentence is unchanged.

Changes are asked for five findings (R01–R05, all P3, none blocking); each has an exact repair below. The two
declared supplier gaps `gap:closed-substacks-of-stacks` and `gap:normal-cones-of-local-immersions` are
contracts and are not findings. All five findings of round 4 are repaired. No P1 or P2 finding was found in the repaired passages, in the 15 sampled targets or in the
supplier audit.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`, `packages/VirtualFundamentalClassPartII/sources.toml`.
This is a design: there is no `Suggested.lean`, this lane does not elaborate, and the one-tactic padding
probe and the headline-statability check do not apply. No source was fetched; the manifest is unchanged.

## Round-4 findings, one by one

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P2) | repaired | Contract: "§§1.4–1.6: … normal cones of representable closed immersions with flat base change"; new paragraph "What VirtualFundamentalClass §1.5 must provide (gap:normal-cones-of-local-immersions) … obtained by descent from charts `U → V` that are closed immersions of schemes"; the gap is in the *Needs:* lines of 3.5, 4.2, 8.1, 8.3, in the Dependencies of Layers 3, 4, 8 and in `plan.json` (`neededBy` 3.5, 4.2, 8.1, 8.3). |
| F02 (P3) | repaired | Layer 8: "Layers 2–6"; Layer 6: "Layer 4 for the Chow operations"; How to read the build: "Layer 8 combines Layers 2–6". Same pattern found twice more: R04. |
| F03 (P3) | repaired | 5.1: "holds when `g` is proper, with the pushforward of 4.1 (route: `x · g_*y = Δ^!((id × g)_*(x × y)) = g_*Δ^!(x × y)` …)"; 4.1 API: "for proper `f`, `g`, representable or not, `(f × g)_*(α × β) = f_*α × g_*β`"; new Check of 5.1. |
| F04 (P3) | repaired | 1.3 API: "`deg` of a separated étale morphism from an integral scheme `U` to `𝒱` is `e(𝒱) · [k(U) : k(𝒱)]` … separated whenever `U` is"; new Check on `𝔸¹ → L` and `L → 𝔸¹`. |
| F05 (P3) | repaired | 8.4: "whose proof, lines 1486–1552, reduces it by conservation of number to the identity `η^![M_{X_T/T}]^vir = [M_{X_t}]^vir` (lines 1501–1503), and lines 1565–1566". Read: the proof of Theorem 4.2 runs li-tian1998 lines 1486–1552. |

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 206 roadmaps, 1897 edges, 0 problem(s)

No UPWARD or CYCLE line.

## Maintainer notes

None of the six stands as a finding.

1. Words: holds as satisfied. Convention 2 uses "local immersion" for the class and "local embedding" for the
   chart pair and gives Vistoli's words once; VirtualFundamentalClass §§2.4, 3.4, 9.6 use the same words.
2. Cotangent complex: satisfied. Convention 6 ("No truncated cotangent complex is defined"); 9.3 builds `φ` into
   `L_{M/𝔅}` by the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted invariance and the plane counterexample. The sub-claim "the owner's
   text names no acting group" is refuted: VirtualFundamentalClass §2.5 reads "invariance under the restricted
   tangent action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3 defines `v^!` through the graph and a projection but uses no compatibility datum over the
   graph. Checked on the conic: row "8.3 second case" below.
6. Suppliers: satisfied. No citation of AlgebraicVectorBundles or EllipticCohomology (grep count `0`); the seven
   suppliers of `plan.json` are each cited by section.

## Adversarial table

Rows computed this round: the repaired passages, the 15 sampled targets and the targets the findings touch.
For the remaining targets I rely on the computed rows of rounds 3 and 4.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Gap: cone of a local immersion | `Δ : BG → BG × BG` with chart `U = V = G`; `Spec k → BG` | `X ×_Y V = G ×_k G`, `U → X ×_Y V` the diagonal of `G` (open, `G` étale), `U → V = id`, cone of rank `0`; a closed-immersion construction does not reach it for `\|G\| > 1` | holds | R05 (locator only) |
| 1.3 API, separated étale | `Spec k → BG`; `𝔸¹ → L`; `L → 𝔸¹`; `U` separated | `\|G\|·1`; `1·1`; excluded (diagonal `L → L ×_{𝔸¹} L` not closed); `U → U ×_𝒱 U → U × U` closed with separated second map, so first closed | holds | none |
| 1.3 base change | `BG → B(G/N)` along `Spec k → B(G/N)`; `Spec k → BG` along a `G`-torsor `Spec K` | fibre `BN`, `1/\|N\| = \|G/N\|/\|G\|`; fibre `Spec K` over `Spec k`, `[K : k] = \|G\|` | holds | none |
| 1.2 `e` as inertia degree sum | `BS₃`; `Bμ₃` over `ℚ`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3`; `e = 2`, `k = ℝ`; no `ℝ`-point: an automorphism of `ℂ × ℂ` over `ℝ` swapping factors has square `(τ₁τ₂, τ₂τ₁)`, never the swap | holds | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `div(y)`; `P(y) ≠ y` irreducible, also inseparable `P` | `ord_0(x²) = 2`; `k[x]/P(x²) = K[x]/(x² − ȳ)`, separable over `K = k[y]/P` as `char ≠ 2`, `ȳ ≠ 0`, so `div P = [W]`; group `ℤ/2` | holds | none |
| 2.3 scheme comparison | Tau Ceti `pointsOfDimension` | `height x = k` for `x ≤ y ↔ y ⤳ x`, the dimension of the closure; Mathlib `ord` uses `coheight = 1`, codimension one | grading agrees | none |
| 2.3 algebraic spaces | Situation 2.1 with `B = Spec k` | "good" = quasi-separated, locally of finite type; `δ = 0` at the point; locally finite sums finite on quasi-compact `X` | holds | none |
| 3.2 divisor formula | `𝔸¹ → [𝔸¹/μ₂]`, `φ = x`; `𝔸¹ × BH → 𝔸¹ × BG` | `f_*[0] = 2·[Bμ₂] = div(−y)`, factor `1`; `[G : H]·[0 × BG]`, `N(t) = t`, factor `\|G\|/\|H\|` | holds | R04 (*Needs:*) |
| 3.5 descent of rational equivalence | isogeny `E′ → E`, `[P] − [O]` | pullback `0`, class nonzero | route needs Lemma 4.6 (ii) | R02 |
| 4.1 exterior pushforward | `Spec K × Spec K → Spec k`, `K/k` purely inseparable of degree `p`; `BG × BH → pt` | `p·[Spec K]` pushes to `p·p`, and `p·[pt] × p·[pt] = p²`; `1/(\|G\|\|H\|)` both sides | holds | none |
| 4.2 covering formula | `π : Spec k → BG`; algebraic space `X → 𝔸¹_ℝ` | `\|G\|^{−1}·r_*[G] = [Spec k]`; functions near the point are in `ℝ(z)`, value at `0` real, residue field `ℂ`: not a scheme; étale gives codimension `0` on the chart `U → U ×_V U` | holds | R01 (API bullet) |
| 4.3 | `E′ → E` surjection; `L ⊕ L^∨`; `BG` | `s′^! q^* π^* = id = s^! π^*`; `c_1 = 0`, `c_2 = −c_1(L)²`; `A_{−i}(BG)_ℚ = 0` | holds | none |
| 5.1 projection formula | `g : BG → Spec k`, `x = [Spec k]`, `y = [BG]` | `g^*x·y = [BG]`, `g_* = 1/\|G\|`; right side `1/\|G\|`; weighted product gives `1` | holds | none |
| 5.2 | `BG`; `ℤ/p` quotient in characteristic `p`; base change `M′ → M` | `1/\|G\|`; `z = y^p − x^{p−1}y`, `(1/p)·[k(y) : k(y^p)] = 1 ≠ 1/e`; classes of `ℳ ×_M M′` over `Ω` are `M′(Ω)` | holds | none |
| 5.3 | `ℙ(1, 2)`; `μ_n` on a point | `c_2 = t·2t`, `ℤ[t]/(2t²)`, `{x = 0}` has stabiliser `μ₂`, `∫ t = 1/2`, `∫ 2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; gradings `A^G_{n−c} ↔ A_{n−g−c}` | holds | none |
| 5.4 properness of `M` | `ℳ` proper, `p` proper surjective | `Δ_M(M) = (p × p)(Δ_ℳ(ℳ))` closed, after any base change: `M` separated and universally closed | holds | none |
| 7.2 | triangle `E → L → C`; characteristic `2`, `k[x]/(x²)`, `φ = (0, id)` | `Hⁱ(C) = 0` for `i ≥ −1`, so `Hom(g^*C, J[i]) = 0` for `i ≤ 1`; `φ^*ω = 0`, `(x + ax²)² = x² ≠ 0` mod `x³` | holds | none |
| 8.1 sign of `∂β` | kresch1999b line 304 | `∂ω = [N × C_{X′/Y′}] − [C_{u^*C/C}]` in the README's letters; `β = −ω` | holds | none |
| 8.1 relative invariance | plane, `p = y` and `p = x`; `Y = 𝔸¹ × Spec k[ε]/(ε²)` | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `[C] = 2·[T-line]`, `∂β = 2·[ν = 0] − 2·[T = 0]` | holds | none |
| 8.3 second case | `Z = ℙ²`, `Z′` a conic, `X` a line, `E = Ω_X`, `F = L_{X′}` | flat pullback `[Z′ × X]`, graph of codimension `2` meets it in `Z′ ∩ X`: `2` points or one point of length `2`; `[X′, F]^vir = [X′]`; `rk F − rk E = −1 = 1 − 2` | holds | none |
| 8.4 | `x² − b y²`; `𝔐 = B𝔾_m` | counts `2, 2, 2`; `X → B` not over `𝔐 × B` | statement holds, route step unowned | R01 |
| 9.1 | `X = Spec k`; point with `id_{ℙ¹}`; `𝔅 = Bℤ` | unique extension: formally étale; `H⁰(T_{ℙ¹}) = k³ ≠ 0`; base not quasi-separated | definition holds; base hypothesis thin | R03 |
| 9.2 | smooth curve, degree `e`; `ω_C`; nodal component | `e + 1 − g`; `g − 1`; `2g(Ẽ) − 2 + #branches` equals `2p_a(E) − 2 + #(E ∩ rest)` | holds | none |
| 9.3 | `X = Spec k`; `ℙ¹ → ℙ^r`; elliptic `C = X` | `E = 0`: `Ω = 0` and `H^{−1}(L) = 0`, étale; `χ = (r + 1)(d + 1) − 1`; `Ob` trivial of rank `1`, class `0` | holds | none |
| 9.4 | `V = O`; `L = O`; embedded point | `π_*G = W ⊗ π_*L^{−N} = 0`, `0 → π_*V → R¹π_*H → R¹π_*G → R¹π_*V → 0`; `[0 → R¹π_*O]` misses `O_M`; `H⁰(O(−N) ⊕ k_p) = k` | holds | none |
| 9.5 | lines in `ℙ²`; prestable base; `Spec k ⊔ ℙ¹` | `3 + 2 − 3 = 2`; `3g − 3 + n + δ + dim X·(1 − g) = (1 − g)(dim X − 3) + n + δ`; `ℓ = 0`, rank `0 ≠ 1` | holds | none |
| Layer Dependencies against *Needs:* | all nine layers | Layers 1, 3–9 agree; Layer 2 lacks VirtualFundamentalClass §0.2; 3.2 *Needs:* lacks the gap | two lines disagree | R04 |

## Verified sound

- **Shape.** 9 layers, 33 targets, 125 tests in `plan.json` (none with fewer than three), every target with a
  locator and a *Needs:* line, every defined object with an API, every layer ending with Examples and
  Dependencies. Layer titles are mathematical; the README nowhere says it follows a source, and the order
  1 → 2 → 3 → 4 → 5 is forced by the *Needs:* lines, with Layer 7 placed after Layer 6 against the order of
  behrend-fantechi1997. No LaTeX delimiters, `lemma`, process words, pull-request numbers, anchors or machine
  paths (grep). `plan.json` parses as JSON and `sources.toml` as TOML.
- **Source locators read this round** (all 15 sampled targets; the author flagged none as unverified):
  vistoli1989 lines 299–328, 337–376, 379–452, 485–535, 542–584, 887–997, 1027–1123, 1172–1207, 1451–1470,
  1594–1623, 1658–1776; behrend-fantechi1997 lines 781–809, 823–846, 884–897, 1067–1078, 1162–1201, 1381–1424,
  1583–1614, 1617–1667; kresch1999b lines 182–207, 218–243, 250–304, 307–343, 390–405; behrend1997 lines
  139–141, 148–161, 165–187, 193–197; li-tian1998 lines 1472–1474, 1486–1503, 1552–1553, 1565–1566, 1585–1586;
  rydh2015 lines 81–87; deligne-mumford1969 lines 1012–1019; keel-mori1997 line 28; edidin-graham1998 lines
  758–759, 790–798; stacks-chow line 1356; stacks-chow-spaces lines 57–61, 126–133, 169, 516, 667, 797–820,
  1986–1990, 2224. Each carries the item number and hypotheses the README quotes, except R05.
- **Pinned declarations opened.** Mathlib `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`
  line 44), `AlgebraicCycle.map` (line 69, `[QuasiCompact f]`), `Scheme.ord`
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52: junk value `0` for `f = 0` or `coheight z ≠ 1`),
  the five morphism-property files under `Mathlib/AlgebraicGeometry/Morphisms/`. Tau Ceti
  `Chow.cyclesOfDimension` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 86), `RatEquiv` (257), `ChowGroup`
  (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique` (369), `ChowGroup.pushforward`
  (`Chow/ClosedImmersion.lean` line 211), `SchPseudofunctor` (`Stack/Basic.lean` line 37),
  `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean` line 195; no quasi-separatedness), `PrestableFamily`
  (`Curves/Prestable.lean` line 45; extends `IsProper` and `GeometricallyConnected`, no genus),
  `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean` line 82).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: every cited section
  §§0.2–9.6 exists; read §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.3–3.5, 4.4–4.5, 6.4–6.5, 7.3–7.7, 8.1, 9.1–9.6 and its
  Conventions; each matches the contract (§1.5 is closed immersions only, as the gap says).
  SchemeAndStackFoundations on main: the 22 cited section headings and 28 cited names resolve.
  StableReductionPartII §5.15 at its open head states the Edidin–Graham comparison with the contract's
  hypotheses. EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2; StableReduction Layers 2–3;
  EnhancedDerivedSheaves §0.3, E1.4, E1.8; DerivedModuleAlgebra §§0.7, 0.12, 0.25: all exist on main.
  AlgebraicGromovWittenTheory §§4.1–4.3 (consumer only) exist at its open head.
- **Supplier order.** Every supplier is on main, earlier in the merge order, or an open pull request that adds a
  new folder; no never-cite roadmap is cited.
- **Declared gaps.** Both have the same slug in `plan.json` and in the README contract, name
  VirtualFundamentalClass (§2.1, §1.5), and ask for one theory each that the supplier's text does not state.
  Precise, minimal, declared.
- **Duplication and ownership.** 6.2 against VirtualFundamentalClass §7.3, 6.3 against §§7.5 and 9.4, 8.2
  against §9.4, 8.3 against §9.5, 9.3–9.5 against AlgebraicGromovWittenTheory §§4.1–4.3: each removes a named
  hypothesis and none restates the owner at equal generality. Searches by object (Vistoli, Kresch, intrinsic
  normal cone, local immersion, Edidin–Graham, deformation invariance) over main and the open heads find no
  other owner of Chow theory of stacks. `scratch/overlaps.md`: no dropped id, no revision-only id, no
  conflicting head, no second copy.
- **Manifest.** 14 sources, one key each, every README key present, no local path; gillet1984 and fulton1998
  settled as uncertified.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map obstruction theory and class: AlgebraicGromovWittenTheory; nothing else shared.

## Not verifiable

- gillet1984 §4 and fulton1998 (§1.10, Propositions 1.8, 8.1.1, 10.2, Corollary 6.3): uncertified, cited by
  locator only.
- The gluing over charts in 8.1–8.3 and the agreement of 8.3's comparison on overlaps: checked on charts, by
  rank and on the conic, not globally.
- vistoli1989 is read from an OCR text; several displayed formulas and item labels are garbled and were
  matched by content.
- Elaboration: not available in this lane, and a design has no Lean file.
- The three board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod,
  LogicAndDefinabilityInNumberTheory) are in unrelated subjects and were not opened.
- behrend-fantechi1997 Proposition 5.3 (lines 1299–1320) and Proposition 7.3 were not reread this round;
  round 4 records them.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891, as used in Lemma 5.9, lines 1416–1417: the source says the rational equivalence is invariant under the whole pulled-back ambient tangent bundle; it should be invariance under the tangent bundle of the regularly embedded smooth stack only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, lines 331–336: the source says the acting bundle is the tangent bundle of the arbitrary locally immersed stack; it should be that of the smooth one, as its proof uses; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f8a2a22d63405011dc119e4bda7855eaeed3ddc8", "job": "REV-DESIGN-VirtualFundamentalClassPartII~5", "model": "fable", "worker": "chris-l"} -->
