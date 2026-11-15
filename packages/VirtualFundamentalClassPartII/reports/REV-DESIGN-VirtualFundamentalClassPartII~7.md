<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6896868742 -->
Review (claude) of cd81934

Verdict: needs_changes

1. **F01** (P3) 2.1 cites a closed-immersion lemma for étale invariance of lengths

   - **Location.** `design/README.md` line 615 (2.1): "(stacks-chow-spaces Lemma 4.3, line 169, and
     Lemma 10.3, line 516, for étale invariance of lengths)"; `sources.toml`, stacks-chow-spaces,
     `locator` ("Lemmas 4.3 (0EE3), …") and `cited_for` ("Lemmas 4.3, 10.3, 13.2, lines 169, 516, 667").
   - **Claim.** Lemma 4.3 at line 169 gives the independence of the length from the étale chart.
   - **Witness.** stacks-chow-spaces lines 169–173: Lemma 4.3 compares the length of a module on a
     closed subspace with that of its pushforward. The étale-chart statement is Lemma 4.1, lines
     151–158 (conditions (2) and (3)).
   - **Repair.** In 2.1 write "(stacks-chow-spaces Lemma 4.1, lines 151–158, and Lemma 10.3, line 516,
     for étale invariance of lengths)". In `sources.toml` change "Lemmas 4.3 (0EE3)" to "Lemmas 4.1
     (0EE1)" in `locator` and "Lemmas 4.3, 10.3, 13.2, lines 169, 516, 667" to "Lemmas 4.1, 10.3, 13.2,
     lines 151–158, 516, 667" in `cited_for`. `plan.json` does not repeat the locator. Tested on the
     instance: for `[V(x²)/μ₂]` with the chart `𝔸¹`, Lemma 4.1 (3) gives length `2` on every étale
     chart, the value of 2.1's second Check.

One finding (R01, P3): a locator repair in 2.1 and in `sources.toml`, which a fix round applies. It
is the only change asked for. The two declared supplier gaps `gap:closed-substacks-of-stacks`
(VirtualFundamentalClass §2.1) and `gap:normal-cones-of-local-immersions` (VirtualFundamentalClass
§1.5) are precise, minimal and declared in both files; they are contracts, not findings. No P1 or P2
finding was found in the passages the round-7 repair changed, in the 15 sampled targets, in the
supplier audit or in the overlap audit.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`, this lane does not elaborate, and the one-tactic padding probe and the
headline-statability check do not apply at this stage. No source was fetched; the manifest is
unchanged and no `needs-references.toml` was written.

## Round-6 findings, one by one

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | Convention 2: "an étale morphism `U → X` from an affine scheme of finite type over `k` with a closed immersion of `U` into a smooth affine scheme of finite type over `k` (VirtualFundamentalClass §§3.4, 5.1, 9.1). behrend-fantechi1997 Definition 3.7 (lines 906–917) asks only that `U → M` be a local immersion (its fourth condition, line 916)". Read: behrend-fantechi1997 lines 906–917; line 916 is the fourth condition. `sources.toml` carries "lines 906–917". |
| F02 (P3) | repaired | 6.2, fourth Check: "frames `e_1` on `U_1` and `e_2` on `U_2` glued by `e_1 = t^n·e_2` on the overlap. The section equal to `e_1` on `U_1` and to `t^n·e_2` on `U_2` has divisor `n·[0₂]` … the opposite gluing `e_2 = t^n·e_1` gives `n·[0₁] = −n·[0₂]`". Recomputed below. |
| F03 (P3) | repaired | 2.1: "for an étale surjection `U → ℳ` from a scheme `U` of finite type over `k` (one exists, `ℳ` being of finite type over `k`)"; new Check "Étale descent needs an atlas of finite type"; 3.1 API, fourth bullet: "from a scheme `U` of finite type over `k`"; 2.2: "the étale site of `ℳ` formed by schemes of finite type over `k` (vistoli1989 lines 887 and 953–959)". Read: vistoli1989 line 887 (finite type throughout its §3), lines 953–959 (the two sheaves and the boundary). |

The repaired patterns were looked for in the rest of the design. Definition 3.7 is cited nowhere
else. No other line bundle is glued on the doubled line. Every other use of an étale atlas (1.2,
1.3, 2.2 `ord`, 3.1, 3.5 route, 5.2) either is local at a generic point or takes its atlas from a
stack of Convention 1 or a quasi-separated algebraic space of finite type. `plan.json` mirrors the
three repairs (2.1 statement and the test `infiniteAtlas_excluded`, the 3.1 descent statement, the
6.2 test).

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2232 edges, 0 problem(s)

No UPWARD or CYCLE line. VirtualFundamentalClass and AlgebraicGromovWittenTheory are open roadmaps
that add new folders; the first is cited as a supplier (the maintainer's ownership note), the
second only as a consumer. StableReductionPartII (merge order, open) is cited for §5.15 only. No
never-cite roadmap is cited.

## Maintainer notes

None of the six stands as a finding.

1. Words: holds as written. Convention 2 uses "local immersion" for the class and "local
   embedding" for the chart pair and gives Vistoli's words once (vistoli1989 (1.19)–(1.20));
   VirtualFundamentalClass §§2.4, 3.4, 9.6 use the same words.
2. Cotangent complex: satisfied. Convention 6: "No truncated cotangent complex is defined"; 9.3
   builds `φ` into the full `L_{M/𝔅}` by the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the relative (restricted) invariance and the plane counterexample. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at
   its open head reads "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch,
   Theorem 3.1".
5. Functoriality: 8.3's second case uses the graph and a projection and says "No compatibility
   datum over the graph is used"; the conic instance is recomputed in the table.
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology are cited nowhere; the seven
   suppliers of `plan.json` are each cited by section.

## Adversarial table

Rows computed this round: the passages the round-7 repair changed, the 15 sampled targets and the
target R01 touches. For the remaining targets I rely on the computed rows of rounds 3–6 and on the
spot recomputations listed under "Verified sound".

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention 2, closed charts cover `X` | `X = BG`; `X` affine `k[x_1..x_n]/I` | `Spec k → BG` with `Spec k = 𝔸⁰`; `X` closed in `𝔸^n` | holds | none |
| 1.1 finite cover | rydh2015 Theorem B hypotheses against Convention 1 | quasi-compact, Deligne–Mumford, diagonal quasi-compact and separated: all in Convention 1; conclusion finite, finitely presented, surjective, étale over a dense open | holds | none |
| 1.1 `B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹ → L` | `Q ×_L Q = 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹ = Q ×_{𝔸¹} G`; `L → B_{𝔸¹}G` pulls back to `Q → 𝔸¹`, degree `2 = (2/1)·1` | holds | none |
| 1.1 no separated cover | torsor `P → X` for separated `X` | proper over `𝔸¹`, étale over `X`, hence finite étale; degree `2` over `t ≠ 0`, `1` over `0`, on one dominating component | contradiction, as stated | none |
| 1.1 base change not by schemes | `id_{Spec k}` along `BG → Spec k` | `id_{BG}`, source not a scheme for `|G| > 1` | holds | none |
| 2.1 multiplicity | `[V(x²)/μ₂]` | length of `k[x]/(x²)` is `2`; reduced support gives `1` | holds | R01 (locator only) |
| 2.1 descent with finite-type atlas | `Spec k ← ⊔_ℕ Spec k`; `BG ← Spec k`; `L ← 𝔸¹ ⊔ 𝔸¹` | infinite sum, excluded; `U ×_ℳ U = G`, `[BG] ↦ [Spec k]`; `U ×_L U` of finite type, four pieces | holds | none |
| 2.1 scheme grading | Tau Ceti `pointsOfDimension` | `height x = n`, with `x ≤ y ↔ y ⤳ x`: the dimension of the closure | agrees with `Z_i` | none |
| 2.2 `ord` | Mathlib `Scheme.ord` | junk `0` if `f = 0` or `coheight z ≠ 1`; 2.2 uses nonzero `φ` at coheight one | in range | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `div(y)`, `div(P(y))`, `P ≠ y` | `2·[Bμ₂]`; `[W]`; every `g(y)` has even coefficient at `Bμ₂`: quotient `ℤ/2`, rationally `0` | holds | none |
| 2.3 schemes | `L` doubled line; `Spec k` | `ℤ²/ℤ(1,1) ≅ ℤ`; `ℤ` | holds | none |
| 2.3 algebraic spaces | stacks-chow-spaces Situation 2.1 | "good" means quasi-separated and locally of finite type; `δ = 0` on `Spec k` gives `dim` | hypotheses match | none |
| 2.3 rationalisation | VirtualFundamentalClass §2.1 | cycles on integral closed substacks modulo principal divisors, `⊗ ℚ`; `[Bℤ/2]` of degree `1/2` in both | holds | none |
| 4.1 pushforward | `BG → Spec k`; `[𝔸¹/μ₂] → 𝔸¹`; `L × Bℤ/2 → L`; `𝔸¹ × BG → 𝔸¹`, `φ = t` | `1/|G|`, composite with `Spec k → BG` is `|G|·(1/|G|) = 1`; `p_*(2[Bμ₂]) = [0] = div(y)`; `(1/2)[0₁]`; both sides `(1/|G|)[0]` | holds | none |
| 4.1 route | vistoli1989 Lemma 3.8 (ii) | uses a scheme properly surjecting onto the source: 1.1 supplies it for every stack | holds | none |
| 5.4 degree of a point | `BG`; `Spec K`, `K = k(a^{1/p})`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `1/|G|`; `p`; `κ = ℝ`, `|Aut| = 2`, `1/2 = 2/4` | holds | none |
| 5.4 vanishing on rational equivalence | `[ℙ¹/μ₂]`, `t²/(t² − 1)` | orders `2` at `0`, `−1` at `±1`, `0` at `∞`; `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 5.4 `M` proper | `ℳ` proper, `p` proper surjective | `ℳ → M × M` proper and `p` surjective, so the diagonal of `M` is a universally closed monomorphism: closed immersion | holds | none |
| 6.1 rank and kernels | `[0 → 0]` and `[O → O]`; `H• = F• ⊕ [G → G]` | `1 = 0 + 1 = 1 + 0`; `rk F_1 + rk G + rk F_0` | holds | none |
| 6.1 non-split `P` | `E = [O(−4) → Ω]` on `ℙ¹` | `Ext¹(Ω, O(−4)) = H¹(O(−2)) = k`, homotopies `H⁰(O(−2)) = 0`, `φ ∘ ξ = 0`; `0 → O(2) → O(3)² → O(4) → 0` | holds | none |
| 6.2 two resolutions | the theory of 6.1 | `c_1(O(4))`, degree `4`; `c_1(O(3)²/O(2)) = 6 − 2 = 4` | equal | none |
| 6.2 `𝓛_n` on `L` (repair) | `n = 0, 1, −1`; both gluings | `0`; `[0₂]`; `−[0₂]`; opposite gluing `n[0₁] = −n[0₂]` by `div(t) = [0₁] + [0₂]`; rank `1 − 1 = 0`, `Ob = 𝓛_n` | holds | none |
| 6.3 first formula | `𝔜 = Spec k[ε]/(ε²)`, `X = 𝔜`, `E = 0`; `pt → B𝔾_m` | `[𝔜] = 2[pt]`; `[pt]`, dimension `−1 + 1 = 0` | holds | none |
| 6.3 second formula | node `× ℙ¹`, `E = [O(1) → Ω]`; `k[x]/(x^p)` with `E = L_X`; `pt ⊔ 𝔸¹` | `Ob = O(−1)`, `−[𝔜 × pt]`; `s = 1`, `dim X − d − r = 0`, class `p[pt] ≠ 0 = c_1(Ob) ∩ [X]`, so smoothness is needed; `[pt]`, single exponent would give `0` | holds | none |
| 6.3 exponent | behrend-fantechi1997 line 1710 | `r = rk h¹(E^∨)` | matches | none |
| 7.1 class and torsor | `X/𝔜` étale; `pt → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε` | `L = 0`; torsor under `1 + J ≅ J = Hom(O, J)`, `Ω_{pt/k} = 0` would give `0`; `(ε + aε²)² = ε² ≠ 0` mod `ε³` | holds | none |
| 7.2 (1) ⇒ (3) | cone `C` of `φ` | `Hⁱ(C) = 0` for `i ≥ −1`, so `Hom(g^*C, J) = Ext¹(g^*C, J) = 0` | holds | none |
| 7.2 surjectivity needed | characteristic 2, `φ = (0, id)` on `k[x]/(x²)` | `ω(g)` lies in `Hom(H^{−1}, J)`, killed by `φ`; `(x + ax²)² = x² ≠ 0` | condition 3 fails, as stated | none |
| 8.1 sign of `∂β` | kresch1999b line 304 against behrend-fantechi1997 line 1415 | `∂ω = [N × C_{X′/Y′}] − [C_{u^*C/C}]`, so `β = −ω` has the README's boundary | holds | none |
| 8.1 relative invariance | plane, `p = y` and `p = x` | `ν/η` fixed by `ξ ↦ ξ + a`; moved by `η ↦ η + b` | holds; hypothesis needed | none |
| 8.1 non-reduced ambient | `𝔸¹ × Spec k[ε]/(ε²)`, origin, `t = 0` | `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `[C] = 2[T-line]`, `∂β = 2[ν = 0] − 2[T = 0]` | holds | none |
| 8.1 fourth statement | `Y′ ⊆ Y` smooth over `𝔐` | conormal sequence split, `(f_1..f_c)` smooth along `Y′`, `T_{Y/𝔅}|_{Y′} = T_{Y′/𝔐}` | reduces to the third | none |
| 8.2 | `{0} → 𝔸¹`; node with `V(a + b)`; `𝔸¹ × Spec k[ε]/(ε²)` | `[Z]`; `k[a]/(a²)`, `−2[pt × pt]` both sides; `2[pt]` both sides | holds | none |
| 8.3 ranks | graph of `v` between stacks smooth over `𝔜` | section of a smooth morphism with unramified diagonal: regular local immersion of codimension `dim Z/𝔜`; `+dim Z′/𝔜 − dim Z/𝔜 = rk F − rk E` | holds | none |
| 8.3 second case | `Z = ℙ²`, `Z′` a conic, `X` a line, `E = Ω_X` | `Z′ × X` meets the graph in length `2`; `[X′, F]` of degree `2`, rank `0 = 1 + 1 − 2` | holds | none |
| 8.3 non-quasi-compact `Z′` | `pt ⊔ ⊔_ℕ pt → pt ⊔ pt` | `[pt]` for every finite `Z′_0` | independent of `Z′_0` | none |
| 8.4 | `x² − b y²`; `{xb = 1}`; `ℙ¹ × B` | counts `2, 2, 2` (degree-2 point for a non-square); `1` and `0` without properness; `m + r = 1`, no degree | holds | none |
| 8.4 route | `η_b^!` against `i_b^!` | same proper coverings, same cones (3.5 flat bullet); `i_b^!(n[B]) = n[b]`; `k`-degree `n[κ(b) : k]` | holds | none |
| 9.2 duality | `C` of genus `g`, `V = L` of degree `e`; `V = ω_C` | `χ = e + 1 − g`; `g − 1`; `(Rπ_*V)^∨` of amplitude `[−1, 0]` | holds | none |
| 9.3 | `X = Spec k`; `ℙ¹ → ℙ^r` of degree `d`; elliptic `C = X` | `E = 0`, étale; `(r + 1)(d + 1) − 1 = (r + 1)d + r`; `Ob = H¹(O) ⊗ O_M` trivial, class `0` | holds | none |
| 9.3 Ext identification | `T` affine | `Ext^i_{𝒞_T}(F_T^*Ω, π^*J) = H^i(T, Rπ_*(F_T^*T_X) ⊗ J) = Ext^i_T(g^*E, J)` | same degree, over `O_T` | none |
| 9.5 | lines in `ℙ²`; prestable base; `Spec k ⊔ ℙ¹` | `3 + 2 + 0 − 3 = 2`; `3g − 3 + n + δ + dim X(1 − g) = (1 − g)(dim X − 3) + n + δ`, li-tian1998 line 1586; `ℓ = 0`, rank `0`, not `1` | holds | none |
| 9.5 degree | Tau Ceti `vectorBundleDegree` | `χ(E) − r·χ(O)`, so `χ = δ + ℓ(1 − g)` | consistent | none |

## Verified sound

- **Shape.** 9 layers, 33 targets, 128 tests in `plan.json`; a script finds, for every target, at
  least three tests and as many README Checks as tests. Every target has a locator and a *Needs:*
  line, every defined object its API, every layer its Examples and Dependencies. Headings are the
  upstream ones. No LaTeX delimiters, `lemma`, process words, pull-request numbers, anchors or
  machine paths (grep, 0 hits). Proposed names are in italics; every backticked name is a library
  or supplier declaration. `plan.json` parses; its baseline revisions equal the manifest pins.
- **Source locators read this round** (the author flagged none as unverified): vistoli1989 lines
  296–330, 356–378, 419–430, 578–586, 883–895, 940–1012, 1025–1075, 1603–1616, 1756–1772,
  2062–2067, 2107–2113; behrend-fantechi1997 lines 876–898, 904–918, 1038–1045, 1064–1080,
  1258–1263, 1296–1322, 1351–1366, 1386–1424, 1454–1461, 1581–1616, 1643–1670, 1680–1740;
  kresch1999b lines 180–260, 296–316, 328–345, 386–406; behrend1997 lines 136–200; li-tian1998
  lines 1470–1476, 1498–1504, 1562–1567, 1583–1587; rydh2015 lines 79–88; deligne-mumford1969
  lines 1010–1020; edidin-graham1998 lines 756–760, 788–799; stacks-chow line 1356;
  stacks-chow-spaces lines 55–62, 124–134, 150–178, 514–518, 795–818, 1984–1991, 2222–2227. Each
  carries the item number, hypotheses and statement the README gives, except R01.
- **Pinned declarations opened.** Mathlib `AlgebraicCycle.map`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 69, `[QuasiCompact f]`), `Scheme.ord`
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52, junk value `0` quoted in the table),
  and the five files under `Mathlib/AlgebraicGeometry/Morphisms/`. Tau Ceti
  `Chow.pointsOfDimension` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 70),
  `cyclesOfDimension` (86), `RatEquiv` (257), `ChowGroup` (295), `cycleClass` (304),
  `ChowGroup.equivIntOfUnique` (369), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean` line
  211), `SchPseudofunctor` (`Stack/Basic.lean` line 37), `Spaces.IsAlgebraicSpace`
  (`AlgebraicSpace/Basic.lean`), `PrestableFamily` (`Curves/Prestable.lean` line 45, a class on
  morphisms of schemes), `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`
  (`VectorBundle/Degree.lean`). The pins have no algebraic-stack or Deligne–Mumford predicate and no
  cotangent complex of a stack (grep).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: every cited
  section §§0.2–9.6 exists; read its Conventions and §§0.2–0.3, 1.5–1.6, 2.1–2.5, 3.2–3.5, 4.4–4.5,
  5.5, 6.4–6.5, 7.3–7.7, 8.1, 9.1–9.6. Each matches the contract: §1.5 is closed immersions only,
  §2.1 has no theory of closed substacks (the two gaps), §3.2 defines a global resolution as a
  derived isomorphism, §7.3 and §9.2 assume separatedness and the resolution property, §9.4 is over
  smooth bases, §9.5 is under the hypotheses of Proposition 7.5. SchemeAndStackFoundations on main:
  the 22 cited section headings and the 28 cited names resolve. StableReductionPartII §5.15 at its
  open head states the Edidin–Graham comparison with the contract's hypotheses, Chern classes and
  proper pushforward, and no product. DerivedModuleAlgebra §§0.7, 0.12, 0.25,
  EnhancedDerivedSheaves §0.3, E1.4, E1.8, EquivariantIntersectionTheory §§2.1–2.2 and
  StableReduction Layers 2–3 exist on main. AlgebraicGromovWittenTheory §§4.1–4.3 (consumer) exist
  at its open head and are the special case the README describes.
- **Declared gaps.** Both have the same slug in `plan.json` and in the README contract, name
  VirtualFundamentalClass (§2.1, §1.5), and ask for one theory each with its hypotheses. Neither
  asks for what a supplier states: a search of the open heads and main for closed substacks of
  stacks and for normal cones of local immersions finds no owner.
- **Duplication and ownership.** By object, over main and the open heads (searches: Vistoli, Chow
  groups of spaces or stacks, finite cover by a scheme, proper cover, obstruction class,
  deformation invariance, intersection ring of a smooth stack, residual gerbe): no other roadmap
  owns integral or non-separated Chow theory of Deligne–Mumford stacks, finite covers by schemes,
  relative obstruction classes, or spaces of maps over a general base. 6.2 against
  VirtualFundamentalClass §§7.3–7.4, 9.2; 6.3 against §§7.5, 9.4; 7.1–7.2 against §§3.5, 6.1, 6.3;
  8.2 against §9.4; 8.3 against §9.5; 9.3–9.5 against AlgebraicGromovWittenTheory §§4.1–4.3: each
  names the hypothesis it removes, and none restates the owner at equal generality.
  `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no second copy;
  the roadmap is not on main.
- **Organisation.** Layer titles are mathematical; the README nowhere says it follows a source. The
  order 1 → 2 → 3 → 4 → 5 is forced (2.2 needs 1.2, Layer 3 needs Layer 2, 4.1 needs 1.1, 1.3 and
  Layer 3, Layer 5 needs 4.1–4.3). Layer 7 needs no Chow layer.
- **Manifest.** 14 sources, one key each; every key cited in the README is present and conversely;
  no local path; gillet1984 and fulton1998 settled as uncertified.
- **Copyright.** Wording compared at 32 passages: the sampled locators above, and Convention 1 with
  vistoli1989 (7.14), Convention 2 with behrend-fantechi1997 Definition 3.7 and kresch1999b lines
  232–237, 5.2 with vistoli1989 (6.1), 5.3 with edidin-graham1998 Proposition 11, 9.4 with
  behrend1997 Proposition 5. The longest shared runs are standard phrases of a statement (at most 7
  words, in 7.1 beside behrend-fantechi1997 lines 1076–1077). Arrangement: vistoli1989's sections
  (preliminaries, moduli spaces, intersection theory, the proof of its Lemma 3.16, bivariant theory,
  duality on moduli spaces, appendix) do not map onto the layers: its §3 is split over Layers 2, 3
  and 4 by integrality, its §§2 and 6 are one section of Layer 5, its §4 is no layer, and Layers
  6–9 come from other sources. No table, figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII shares only the phrase "proper cover"); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 32 passages compared with 10 sources, none shared beyond standard phrases of at most 7 words; largest share vistoli1989, 72 of 144 locators; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§1.10, Chapter 3, Propositions 1.8, 8.1.1, 10.2, Corollary 6.3):
  uncertified, cited by locator only.
- The gluing over charts in 8.1–8.3 and the agreement of 8.3's comparison on overlaps: checked on
  charts, by rank and on the instances of the table, not globally.
- vistoli1989 is read from an OCR text: displayed formulas and some item labels are garbled and
  were matched by content. Two apparent cross-reference slips in it (lines 1613 and 1768) cannot be
  told from recognition errors and are not reported as source issues.
- Locators of the 18 targets outside the sample were not reread this round, apart from those named
  under "Verified sound"; rounds 3–6 record them.
- Elaboration: not available in this lane, and a design has no Lean file.
- The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) are in
  unrelated subjects and were not opened.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891, as used in the proof of Lemma 5.9, lines 1416–1417: the source says the rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariant under the restricted tangent action only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.
- **Misprint** in behrend-fantechi1997 at Proposition 5.5, line 1354 (arXiv v1): the source says the first cohomology sheaf of the obstruction complex vanishes; it should be the cohomology sheaf in degree minus one, as in Proposition 7.3, line 1708; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cd8193474f69d49b02cd05acefd74fccd125f564", "job": "REV-DESIGN-VirtualFundamentalClassPartII~7", "model": "fable", "worker": "chris-x82"} -->
