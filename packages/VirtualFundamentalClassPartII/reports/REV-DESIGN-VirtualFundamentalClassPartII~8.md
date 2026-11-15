<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6897914060 -->
Review (claude) of 5430233

Verdict: needs_changes

1. **F01** (P3) 5.3 cites Edidin–Graham in the numbering of a superseded preprint

   - **Location.** `design/README.md` lines 1189–1190 (5.3): "(edidin-graham1998 Proposition 11, lines
     790–798, under its assumption of a quasi-projective moduli scheme, which is not made here)";
     References, lines 1943–1944 (Invent. Math. 131 with `arXiv:alg-geom/9603008`); `design/plan.json`
     line 1059; `sources.toml`, edidin-graham1998 (`arxiv`, `locator`, `cited_for`, `version_note`).
   - **Claim.** Proposition 11 of the article in Invent. Math. 131 compares the three products.
   - **Witness.** The text read is arXiv:alg-geom/9603008v3 (11 Mar 1996). In arXiv:alg-geom/9609018v3
     (16 May 1997, the published numbering) the comparison is Proposition 15, lines 1069–1076, with no
     moduli-space hypothesis; its Proposition 11, line 870, is about pushforward along quotient maps.
   - **Repair.** In 5.3 write "(edidin-graham1998 Proposition 15 in the published numbering, for a
     locally separated Deligne–Mumford `[X/G]`; in the March 1996 preprint read here it is Proposition
     11, lines 790–798, there with a quasi-projective moduli scheme)". In References add
     "published numbering as in arXiv:alg-geom/9609018; line numbers from the earlier preprint
     arXiv:alg-geom/9603008v3". In `sources.toml` keep the one key and record both: `locator` =
     "Proposition 15 (published; Proposition 11 of arXiv:alg-geom/9603008v3); the remarks before
     Proposition 14 (before Proposition 10 of the preprint)", and a `version_note` saying that the text
     read is the March 1996 preprint and that the published numbering is that of
     arXiv:alg-geom/9609018v3; the same in `plan.json` line 1059. Tested on the instance: for
     `ℙ(1, 2) = [(𝔸² ∖ 0)/𝔾_m]` (5.3, third Check) the published Proposition 15 applies as stated,
     with no moduli scheme named, which is the generality 5.3 claims.

2. **F02** (P3) Downstream consumers gives AlgebraicGromovWittenTheory a hypothesis it does not have

   - **Location.** `design/README.md` lines 1922–1923: "a smooth projective target over an
     algebraically closed field of characteristic zero".
   - **Claim.** AlgebraicGromovWittenTheory §§4.1–4.3 work over an algebraically closed field.
   - **Witness.** AlgebraicGromovWittenTheory `README.md` at its open head, Summary and "The end
     goals": "Fix an field `k` of characteristic zero and a smooth projective `k`-variety"; the phrase
     "algebraically closed" occurs nowhere in that README (search, 0 hits).
   - **Repair.** Write "a smooth projective target over a field of characteristic zero". Tested: 9.3–9.5
     hold over every field, so the case named is still a case of them; `plan.json` does not repeat the
     phrase (search, 0 hits).

Two findings, both P3 (a locator in a superseded numbering, and one clause describing a consumer);
neither is blocking, but each is a repair, so the verdict asks for changes. Nothing else stands in
the way of acceptance; the two declared supplier gaps `gap:closed-substacks-of-stacks`
(VirtualFundamentalClass §2.1) and `gap:normal-cones-of-local-immersions`
(VirtualFundamentalClass §1.5) are precise, minimal and declared in both files, and are not findings.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md` (read in full, 1957 lines),
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`, this lane does not elaborate, and the one-tactic padding probe and the
headline-statability check do not apply at this stage.

## Round-7 finding

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 2.1, line 615: "(stacks-chow-spaces Lemma 4.1, lines 151–158, and Lemma 10.3, line 516, for étale invariance of lengths)". `sources.toml`: `locator` "… Lemmas 4.1 (0EE1), 10.3 (0EPY), …", `cited_for` "Lemmas 4.1, 10.3, 13.2, lines 151–158, 516, 667". Read: stacks-chow-spaces lines 151–158 (Lemma 4.1: the length at a point equals the length on some, and on every, étale chart from a scheme), 516–518 (Lemma 10.3), 667–671 (Lemma 13.2). |

The repaired pattern in the rest of the design: "Lemma 4.3", "0EE3" and "line 169" occur nowhere in
the three files (search). The same kind of slip, an item number that is right in one version of a
text and wrong in the one named, was looked for in every preprint the manifest records: it occurs
once more, R01.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2234 edges, 0 problem(s)

No UPWARD or CYCLE line. Suppliers (`plan.json` and the contracts): VirtualFundamentalClass (open,
adds a new folder), SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction,
EnhancedDerivedSheaves, DerivedModuleAlgebra (main), StableReductionPartII (merge order; open, adds
a new folder; cited for §5.15 only). AlgebraicGromovWittenTheory is cited as a consumer only. No
never-cite roadmap is cited.

## Maintainer notes

None stands as a finding.

1. Words: satisfied. Convention 2 uses "local immersion" for the class and "local embedding" for the
   chart pair and gives Vistoli's words once; VirtualFundamentalClass §§2.4, 9.6 ("local
   immersions") and §§3.4, 5.1–5.2 ("local embedding `U ↪ M`") use the same words.
2. Cotangent complex: satisfied. Convention 6: "No truncated cotangent complex is defined"; the only
   truncation in the text is `τ^{≥−1}L_{T/T̄} = J[1]` of a square-zero extension in 7.1; 9.3 builds
   `φ` into the full `L_{M/𝔅}` from the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the relative invariance and the plane counterexample. The sub-claim "the
   owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at its open head
   reads "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1".
5. Functoriality: 8.3's second case goes through the graph and a projection and states that no
   compatibility datum over the graph is used; the conic instance is recomputed in the table.
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology occur nowhere in the README
   (search, 0 hits); the seven suppliers are each cited by section.

## Adversarial table

Rows: the passage the round-8 repair changed, the 15 sampled targets, the headline statements of
the Summary, and the two targets the findings touch. All values below were computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 multiplicity independent of chart (repair) | `[V(x²)/μ₂]`, charts `𝔸¹` and `μ₂ × 𝔸¹`; `BG ← Spec k` | length of `k[x]_(x)/(x²)` is `2` on each sheet; `[BG] ↦ 1·[Spec k]` | holds | none |
| 1.1 finite cover | rydh2015 Theorem B against Convention 1 | hypotheses: quasi-compact, Deligne–Mumford, diagonal quasi-compact and separated, all in Convention 1; conclusion finite, finitely presented, surjective, étale over a dense open | holds | none |
| 1.1 `L → B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹` | `Q ×_L Q = 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹ = Q ×_{𝔸¹} G`; degree `2 = (2/1)·1` | holds | none |
| 1.1 no separated cover of `B_{𝔸¹}G` | separated `X`, torsor `P → X` | `P → 𝔸¹` proper and `X → 𝔸¹` separated give `P → X` proper, so finite étale; degrees `2` over `t ≠ 0`, `1` over `0` on one component | contradiction, as stated | none |
| 1.1 Chow's lemma bullet | deligne-mumford1969 Theorem 4.12 | `g` proper, surjective, generically finite; source open in a projective scheme, so quasi-projective | holds | none |
| 2.3 schemes | `L` doubled line; `Spec k`; Tau Ceti `pointsOfDimension` | `ℤ²/ℤ·(1,1) ≅ ℤ`; `ℤ`; `height x = n` is the dimension of the closure, sums finite on a quasi-compact scheme | holds | none |
| 2.3 algebraic spaces | stacks-chow-spaces Situation 2.1, `B = Spec k`, `δ = 0` | "good" = quasi-separated and locally of finite type, as in the statement; cycles locally finite, finite on quasi-compact `X` | hypotheses match | none |
| 2.3 rationalisation | `[𝔸¹/μ₂]`; VirtualFundamentalClass §2.1 | `A_0 = ℤ/2` (every `div(g(y))` has even coefficient at `Bμ₂`, `k[x]/P(x²) = K[x]/(x² − θ)` reduced for `θ ≠ 0`, `char ≠ 2`), so `A_0 ⊗ ℚ = 0`; owner: integral closed substacks modulo principal divisors, rational | holds | none |
| 3.1 flat pullback | `Spec k → BG`; coarse map of `[𝔸¹/μ₂]`; isogeny `π : E′ → E` of degree 2 | `[BG] ↦ [Spec k]`; `[0] ↦ 2·[Bμ₂]`; `π^*([P] − [O])` has degree `0` and sum `2Q + T − T = π̂(P) = O`, so it is principal while `[P] ≠ [O]` | holds | none |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `𝔸¹_x → [𝔸¹/μ₂]`, `φ = x` | `|G|·[0 × BG]` both sides; `f_*[0] = 2·[Bμ₂]` and `N(x) = −x² = −y`, `div(−y) = 2·[Bμ₂]`, factor `1/1` | holds | none |
| 3.2 no functorial `c` on `BG → Spec k` | `|G| > 1`; `G` trivial | `|G|·c([BG]) = 1` has no integer solution; `1·1 = 1` | holds | none |
| 3.3 push–pull | `Spec k → BG` against itself | both sides `|G|·[Spec k]`, with `Σ_z [κ(z) : k] = |G|` | holds | none |
| 3.3 localisation | `[𝔸¹/μ₂] ⊇ Bμ₂`; `ℙ¹` with two points | `ℤ → ℤ/2 → A_0(𝔾_m) = 0 → 0` exact, first map not injective; kernel `ℤ·(1, −1)` | holds | none |
| 4.4 agreement | `B(ℤ/2)`; `O(1)` on `ℙ¹`; `Spec k` | `1/2` both; point class both; `ℚ` both | holds | none |
| 4.1 (used by 4.4, 5.4) | `[𝔸¹/μ₂] → 𝔸¹`, `φ = y`; `𝔸¹ × BG → 𝔸¹`, `φ = t` | `p_*(2[Bμ₂]) = [0] = div(y)`, factor `1`; `(1/|G|)[0]` both sides | holds | none |
| 5.3 ring isomorphism | `ℙ(1, 2)`; `Bμ_n`; `𝔾_m` on `𝔸¹` | origin class `t · 2t`, `ℤ[t]/(2t²)`, rationally `ℚ[t]/(t²)`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; stabiliser `𝔾_m`, excluded | holds | R01 (locator only) |
| 5.3 supplier | StableReductionPartII §5.15 | proper action of a smooth affine `G`, linearised ample sheaf, `[X/G]` Deligne–Mumford, `A_{i−d}([X/G])_ℚ → A^G_i(X) ⊗ ℚ`, Chern classes and proper pushforward, no product | contract matches | none |
| 5.4 degree of a point | `BG`; `Spec k(a^{1/p})`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `1/|G|`; `p`; `e = 2`, `κ = ℝ`, `1/2 = 2/4` | holds | none |
| 5.4 on rational equivalences | `[ℙ¹/μ₂]`, `t²/(t² − 1)` | orders `2` at `0`, `−1` at `±1`, `−2 + 2 = 0` at `∞`; `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 (used by 6.2) | `E = [O(−4) → Ω]` on `ℙ¹` | `Hom(E, E) = k ⊕ k ⊕ H¹(O(−2))`, `φ ∘ ξ = 0`; `P`: `0 → O(2) → O(3)² → O(4) → 0`, rank `2 = 1 + 1` | holds | none |
| 6.2 class and independence | `[O(1) → Ω]` on `ℙ¹`; the theory of 6.1 by `F_1` and by `P`; `𝓛_n` on `L` | `−1`; `c_1(O(4)) = 4` and `c_1(O(3)²/O(2)) = 6 − 2 = 4`; `n·[0₂]`, opposite gluing `n·[0₁] = −n·[0₂]` | holds | none |
| 6.2 dimension | `C(F•)` | `d + rk F_0`, class in `A_{d + rk F_0 − rk F_1} = A_{d+r}` | holds | none |
| 6.3 first formula | `Spec k[ε]/(ε²)` over itself; `pt → B𝔾_m` | `2·[pt]`; `[pt]`, dimension `−1 + 1 = 0` | holds | none |
| 6.3 second formula | `Ob` locally free; node `× ℙ¹`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | image of `E^{−1}` is the kernel of `E⁰ → Ω`, a subbundle, so `Ob = H^{−1}(E)^∨`, rank `dim X − d − r`; `−[𝔜 × pt]`; `p·[pt] ≠ 0 = c_1(Ob) ∩ [X]`; `[pt]`, single exponent gives `0` | holds; smoothness needed | none |
| 7.2 (1) ⇒ (3) | cone `C` of `φ` | `H^{−1}(C) = H⁰(C) = 0`, so `Hom(g^*C, J) = Ext¹(g^*C, J) = 0`: `φ^*` injective on `Ext¹`, bijective on `Hom` | holds | none |
| 7.2 surjectivity needed | char 2, `k[x]/(x²)`, `φ = (0, id)` | `ω(g) ∈ Hom(A, J)`, killed by `φ`; `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)` | condition 3 fails, as stated | none |
| 7.2 (3) affine ⇒ (1) | behrend-fantechi1997 lines 1175–1201 | both steps use `Spec(A ⊕ M)` and a closed subscheme of an affine `W` only | holds | none |
| 8.4 | `x² − b y²`; `{xb = 1}`; `ℙ¹ × B` | counts `2, 2, 2`; `1` and `0` without properness; `m + r = 1`, no degree | holds | none |
| 8.4 route | `i_b^!` and proper pushforward | `i_b^!(n[B]) = n[b]`, `κ(b)`-degree `n`, `k`-degree `n[κ(b) : k]`; bases of dimensions `m + 1`, `m` as 8.2 asks | holds | none |
| 8.3 second case (note 5) | `ℙ²`, conic, line, `E = Ω_X` | intersection of length `2`; rank `1 + 1 − 2 = 0`; degree `2` both sides | holds | none |
| 9.1 definition | `X = Spec k`; `ℙ¹ → ℙ^r`; `M = pt`, `F = id_{ℙ¹}` | formally étale, hence étale; open in `ℙ^{(r+1)(d+1)−1}`; `H⁰(T_{ℙ¹}) = k³ ≠ 0` | discriminates | none |
| 9.4 resolution | `V = O` on a curve; embedded point; `L = O` | `H⁰(G) = H⁰(H) = 0`, `χ = 1 − g`; `H⁰(L^{−N}) = k`, fails; `[0 → R¹π_*O]` misses `H⁰` | holds; hypotheses needed | none |
| 9.5 rank and dimension | lines in `ℙ²`; prestable base; `Spec k ⊔ ℙ¹` | `3 + 2 − 3 = 2`; `3g − 3 + n + δ + dim X(1 − g) = (1 − g)(dim X − 3) + n + δ`, li-tian1998 line 1586; `ℓ = 0`, rank `0`, not `1` | holds | none |
| 9.3 (headline) | `ℙ¹ → ℙ^r`; elliptic `C = X` | `χ = (r + 1)(d + 1) − 1`, `Ob = 0`; `Ob = H¹(O) ⊗ O_M`, class `0` | holds | none |
| 5.1 projection formula (headline) | `BG → Spec k` | `g_*(g^*x · y) = (1/|G|)[Spec k] = x · g_*y`; a product weighted by `|G|` gives `[Spec k]` | holds | none |
| 5.2 (headline) | `[𝔸¹/μ₂]`; `ℤ/p` on `𝔸²` in char `p` | `0 = 0` rationally, `ℤ/2 ≠ 0` integrally; invariants `k[x, y^p − x^{p−1}y]`, degree `(1/p)·p = 1` | holds | none |
| 8.1 (headline) | plane; `𝔸¹ × Spec k[ε]/(ε²)` | `div(ν/η) = [ν = 0] − [η = 0]`, fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `∂β = 2[ν = 0] − 2[T = 0]` | holds | none |
| Downstream consumers | AlgebraicGromovWittenTheory §§4.1–4.3 | rank `d(1 − g) + c_1(T_X)·β`; dimension `(1 − g)(d − 3) + n + c_1(T_X)·β`; base field "of characteristic zero", not algebraically closed | case of 9.3–9.5 | R02 |

## Verified sound

- **Shape.** 9 layers, 33 targets, 128 tests in `plan.json` (script); every target has at least
  three tests; every numbered section of the README has at least three Checks and a *Needs:* line
  (script, 0 exceptions); every layer ends with Examples and Dependencies. No LaTeX delimiters,
  `lemma` as a keyword, process words, pull-request numbers, anchors, machine paths or `set_option`
  (search, 0 hits). `plan.json` parses; its baseline revisions equal the pins of
  `lake-manifest.json`. Proposed names are in italics; backticked names are library or supplier
  declarations.
- **Headline statements** (Summary): the integral groups and their three comparisons (2.2–2.3);
  rational pushforward and Gysin maps on all stacks (4.1–4.3); the intersection ring, Poincaré
  duality, the moduli-space isomorphism, the Edidin–Graham ring comparison and the degree of a
  point (5.1–5.4); the virtual class without the resolution property (6.2); the relative
  obstruction class and characterisation (7.1–7.2); relative invariance, pullback, functoriality and
  deformation invariance (8.1–8.4); the obstruction theory of spaces of maps and its dimension
  (9.3–9.5). Each is a named target with hypotheses and a locator. None is statable at the pins: the
  pins have no algebraic-stack predicate, no Chow groups of stacks and no cotangent complex of a
  stack, as the contract says.
- **Source locators read this round** (the author flagged none as unverified): vistoli1989 lines
  296–330, 362–378, 419–455, 540–547, 578–586, 883–896, 972–1026, 1045–1076, 1195–1203, 1603–1616,
  1756–1772; behrend-fantechi1997 lines 884–898, 1160–1202, 1256–1264, 1280–1299, 1351–1366,
  1602–1615, 1643–1670, 1700–1712; kresch1999b lines 305–316, 332–344; behrend1997 lines 136–200;
  li-tian1998 lines 1470–1476, 1498–1504, 1562–1567, 1583–1587; rydh2015 lines 77–90;
  deligne-mumford1969 lines 1008–1021; edidin-graham1998 lines 754–762, 786–800; keel-mori1997 lines
  24–30; stacks-chow lines 1354–1360; stacks-chow-spaces lines 55–62, 124–134, 149–160, 514–519,
  665–672, 795–819, 1984–1991, 2222–2227. Each carries the item number, hypotheses and statement the
  README gives, except the numbering of R01.
- **Pinned declarations opened.** Mathlib `AlgebraicGeometry.AlgebraicCycle`
  (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44) and `AlgebraicCycle.map` (line
  69, `[QuasiCompact f]`); `Scheme.ord` (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52,
  junk value `0` for `f = 0` or `coheight z ≠ 1`, line 48); `IsClosedImmersion`
  (`Morphisms/ClosedImmersion.lean` line 44), `Flat` (`Morphisms/Flat.lean` line 42), `Etale`
  (`Morphisms/Etale.lean` line 39), `Smooth` (`Morphisms/Smooth.lean` line 59), `IsProper`
  (`Morphisms/Proper.lean` line 41). Tau Ceti `Chow.pointsOfDimension`
  (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 70), `cyclesOfDimension` (86), `RatEquiv`
  (257, `[IsLocallyNoetherian X]`, locally finite families), `ChowGroup` (295), `cycleClass` (304),
  `ChowGroup.equivIntOfUnique` (369), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean` line
  211), `SchPseudofunctor` (`Stack/Basic.lean` line 37), `Spaces.IsAlgebraicSpace`
  (`AlgebraicSpace/Basic.lean`), `PrestableFamily` (`Curves/Prestable.lean` line 45, a class on
  morphisms of schemes extending `IsProper` and `GeometricallyConnected`),
  `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: every cited
  section §§0.2–9.6 exists; read its Conventions and §§1.5–1.6, 2.1–2.5, 3.2, 7.3–7.7, 8.1, 9.1–9.6.
  §1.5 covers representable closed immersions only and §2.1 states no theory of closed substacks
  (the two gaps); §3.2 defines a global resolution as a derived isomorphism; §§7.3, 9.2 assume
  separatedness and the resolution property; §9.4 is over smooth bases; §9.5 is under the
  hypotheses of Proposition 7.5. SchemeAndStackFoundations on main: the 21 cited section headings
  exist under the cited numbers and the 28 cited names occur; `chow_affine_bundle` and
  `localization_exact` are in §5.2, `excess_intersection` and `gysin_self_intersection` in §5.5,
  `keel_mori` in §1.23, as cited. StableReductionPartII §5.15 at its open head states the
  Edidin–Graham comparison with the contract's hypotheses. EquivariantIntersectionTheory §§2.1–2.2
  and Conventions, StableReduction Layers 2–3, DerivedModuleAlgebra §§0.7, 0.12, 0.25 and
  EnhancedDerivedSheaves §0.3, E1.4, E1.8 exist on main. AlgebraicGromovWittenTheory §§4.1–4.3
  (consumer) exist at its open head.
- **Declared gaps.** Both have the same slug in `plan.json` and in the README contract, name
  VirtualFundamentalClass (§2.1, §1.5), and each asks for one theory with its hypotheses. Neither
  asks for what a supplier states: VirtualFundamentalClass §1.5 reads "representable closed
  immersions", and its §2.1 uses integral closed substacks without stating their theory.
- **Duplication and ownership.** Against VirtualFundamentalClass at its head, target by target:
  2.1–4.3 remove separatedness or rational coefficients from §§2.1–2.4; 6.2 removes the resolution
  property and separatedness from §§7.3–7.4, 9.2; 6.3 and 8.2 replace the smooth bases of §9.4; 7.1–7.2
  make §§3.5, 6.1, 6.3 relative; 8.3 removes separatedness from §9.5; 9.3–9.5 state
  AlgebraicGromovWittenTheory §§4.1–4.3 for every base and field. None restates the owner at equal
  generality. `scratch/overlaps.md`: no dropped id, no revision-only id, no conflicting head, no
  second copy; the roadmap is not on main, and the two board packages on other branches
  (AnalyticNumberTheory, LawrenceVenkateshMethod) are in other subjects.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 is forced by the *Needs:* lines (2.2 needs 1.2; Layer 3 needs Layer 2;
  4.1 needs 1.1, 1.3 and Layer 3; Layer 5 needs 4.1–4.3); Layer 7 needs no Chow layer.
- **Manifest.** 14 sources, one key each; every key cited in the README is recorded and conversely;
  no local path. To check R01 the published version was fetched through the sources service under
  the existing key edidin-graham1998; the service appended a second, bare `cited_for` item to that
  entry, which I removed again so that the entry is as the author recorded it. The manifest is
  byte-identical to the one I received; no `needs-references.toml` was written.
- **Copyright.** Wording compared at 21 passages with 10 sources: the sampled locators above, and
  Convention 3 with vistoli1989 lines 887–890, Convention 7 with behrend-fantechi1997 lines
  1645–1651, 5.2 with vistoli1989 (2.1) and (6.1), 9.3 with behrend1997 lines 148–153, 8.1 with
  kresch1999b lines 334–343. The longest shared runs are parts of statements that can be written in
  one way: 7 words in 1.1 beside rydh2015 lines 83–84, 4 words in 7.2 beside behrend-fantechi1997
  line 1167. Arrangement: vistoli1989 has sections 1 (facts about stacks), 2 (moduli spaces), 3
  (intersection theory), 4 (proof of the basic lemma), 5 (bivariant theory), 6 (duality on moduli
  spaces); its section 3 is split over Layers 2, 3 and 4 by integrality, its sections 2 and 6 are
  one section of Layer 5, its section 4 is no layer, and Layers 6–9 come from other sources. No
  table, figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII is close in vocabulary only); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 21 passages compared with 10 sources, none shared beyond parts of statements of at most 7 words; largest share vistoli1989, 72 of 144 locators; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§§1.8, 1.10, Chapter 3, Corollary 6.3, Propositions 8.1.1, 10.2):
  uncertified, cited by locator only.
- The published numbering of kresch1999b, behrend1997, li-tian1998, keel-mori1997 and rydh2015: each
  was read in the arXiv version the manifest names, and the journal texts were not opened. Only for
  edidin-graham1998 was a second version read (R01).
- The gluing over charts in 8.1–8.3: checked on charts, by rank and on the instances of the table,
  not globally.
- vistoli1989 is read from an OCR text: displayed formulas and some item labels are garbled (for
  instance the labels of (3.6) and (3.9)) and were matched by content.
- Locators of the 18 targets outside the sample were not reread at their lines this round, apart
  from those listed above; their statements and Checks were read and the Checks recomputed.
- Elaboration: not available in this lane, and a design has no Lean file.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5, lines 889–891: the source says the rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariant under the restricted tangent action only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Misprint** in behrend-fantechi1997 at Proposition 5.5, line 1354 (arXiv v1): the source says the first cohomology sheaf of the obstruction complex vanishes; it should be the cohomology sheaf in degree minus one, as in Proposition 7.3, line 1708; affects nothing.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "54302333cf4671b8aa9d43f222fd5a9c3578a36d", "job": "REV-DESIGN-VirtualFundamentalClassPartII~8", "model": "fable", "worker": "chris-x52"} -->
