<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6906636868 -->
Review (claude) of 283aef1

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 3.2 and 3.3 take their proofs from a source whose "representable" is narrower than the README's

   **Location.** `packages/VirtualFundamentalClassPartII/README.md` 3.2, lines 850–867: "For `f : ℱ → 𝒢`
   proper and representable, define *properPushforward* … (vistoli1989 (3.7), lines 989–1011, where the
   pushforward of rational equivalences is formed on étale atlases", with `*Needs:*` "2.3 (its statement
   on schemes, through which SchemeAndStackFoundations §5.2 applies)". The same pattern in 3.3, lines
   898–905 (push–pull, vistoli1989 Lemma 3.9 (i)).

   **Claim.** By Convention 2 (README line 178) "representable" means representable by algebraic
   spaces, so 3.2 states the integral pushforward for every proper morphism representable by algebraic
   spaces, and the route and the `*Needs:*` line say it follows from the scheme pushforward on an atlas.

   **Witness.** vistoli1989 line 2064–2066 ((7.11)): representable means the fibre product with a scheme
   is a scheme; its proof (lines 998–1006) pushes forward along a morphism of schemes `U → V`. For a proper
   algebraic space `P` that is not a scheme and `f : P → Spec k`, the atlas pullback is `P` itself, not a
   scheme. README 5.4 (lines 1369–1370, 1385) uses exactly this case.

   **Repair.** The statement is true as written; the route and the needs are incomplete.

   1. In 3.2, after the citation of vistoli1989 (3.7), add: "Vistoli's representable morphisms are
      representable by schemes (vistoli1989 (7.11), lines 2064–2066), so there `ℱ ×_𝒢 V → V` is a proper
      morphism of schemes. When `f` is representable by algebraic spaces only, `ℱ ×_𝒢 V` is a
      quasi-separated algebraic space of finite type over `k`, proper over the scheme `V`, and the
      pushforward of cycles and its compatibility with rational equivalence on it are a step of this
      statement: stacks-chow-spaces Definition 8.1 (line 347) and Lemma 16.3 (lines 917–919), read through
      2.3."
   2. In the `*Needs:*` line of 3.2 replace "2.3 (its statement on schemes, through which
      SchemeAndStackFoundations §5.2 applies)" by "2.3 (its statement on schemes, through which
      SchemeAndStackFoundations §5.2 applies, and its statement on algebraic spaces, through which
      stacks-chow-spaces Lemma 16.3 is read)".
   3. In 3.3, after the citation of vistoli1989 Lemma 3.9 (i), add: "for `f` representable by algebraic
      spaces only, the compatibility of flat pullback and proper pushforward on the atlas is
      stacks-chow-spaces Lemma 11.1 (line 590) in place of the scheme statement", and add "2.3" to its
      `*Needs:*` line.
   4. In `sources.toml`, entry `stacks-chow-spaces`: add "Definition 8.1 (0EP1), Lemma 11.1 (0EPD),
      Lemma 16.3 (0EQC)" to `locator` and "3.2–3.3 proper pushforward of cycles and of rational
      equivalences on algebraic spaces, and push–pull (Definition 8.1, line 347; Lemma 11.1, line 590;
      Lemma 16.3, lines 917–919)" to `cited_for`.

   Tested on the witness: for `f : P → Spec k`, `V = Spec k` and `ℱ ×_𝒢 V = P`, Lemma 16.3 applies to the
   proper morphism of good algebraic spaces `P → Spec k` over `B = Spec k` and gives
   `f_* : A_i(P) → A_i(Spec k)`; with it the `∫` of 5.4 on proper algebraic spaces is stacks-chow-spaces
   Definition 32.1, as 5.4 says. The cases in which the roadmap itself applies 3.2 to a source that is
   not a scheme were checked: `r : ℱ ×_𝒢 Y → ℱ′` of 4.2 is a base change of `Y → 𝒢′`, representable by
   schemes because the diagonal of `𝒢′` is; `U → X` of 3.5 is a closed immersion; `ℙ(N ⊕ O_U) → U` is
   projective. Only the case of the witness needs the added input.

2. **F02** (P3) the same Situation 2.1 is instantiated with two different `δ`

   **Location.** README 2.3, line 774: "in its Situation 2.1 (lines 57–61) with `B = S = Spec k` and
   `δ = 0`"; README 3.5, line 960: "in its Situation 2.1 with `B = Spec k` and `δ = dim`".

   **Claim.** Both sentences fix the dimension function of stacks-chow-spaces Situation 2.1.

   **Witness.** stacks-chow-spaces lines 57–62: `δ` is a function `|B| → ℤ`, and `δ_{X/B}` is the function
   induced on `X`. On `B = Spec k`, `δ = 0` at the one point; "`δ = dim`" is `δ_{X/B}`, not `δ`.

   **Repair.** In 3.5 write "in its Situation 2.1 with `B = Spec k` and `δ = 0`, as in 2.3, so that
   `δ_{X/B}` is the dimension of the closure of a point". Tested on `X = 𝔸¹`: `δ_{X/B}` is `1` at the
   generic point and `0` at closed points, the grading of 2.1.

Two findings, one blocking (R01, P2) and one not (R02, P3). Both are local to Layer 3 and are
repaired by a few sentences and two `*Needs:*` items; no statement of the roadmap was found false.
Everything else that was checked is recorded under `## Verified sound`, with the computed values.

Files reviewed: `packages/VirtualFundamentalClassPartII/README.md` (2215 lines, read in full),
`packages/VirtualFundamentalClassPartII/Suggested.lean`, `metadata.toml`, `sources.toml`, and the
`gaps` list of `design/plan.json`. No file of the package was changed and no source was added to the
manifest.

## Verified sound

**Elaboration.** `lake env lean` on `packages/VirtualFundamentalClassPartII/Suggested.lean` from the
content checkout: exit 0, no output (no warning at all; the file has no declaration, so there is no
`sorry`). The file is `module`, `import Mathlib`, one module docstring, an empty namespace
`TauCetiRoadmap.VirtualFundamentalClassPartII`; no `set_option`, no `TauCeti.*` import, no data. The
one-tactic padding probe and the `#check @name` binder check are empty: there is no declaration.

**Dependency check.** Output of the gate: `depcheck: 242 roadmaps, 2263 edges, 0 problem(s)`. No
UPWARD, CYCLE or `moved:` line. The merge order has StackPointsAndResidualGerbes at line 38,
StableReductionPartII at line 339 and this roadmap at line 340; SchemeAndStackFoundations,
EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are on
main; VirtualFundamentalClass is another author's open pull request that adds a new roadmap folder.

**Headline theorems.** The twelve headlines of the README summary are each named in the module
docstring with the carrier it lacks. Checked at the pins: no `IsAlgebraicStack`, `IsDeligneMumford`,
quotient stack or residual gerbe in either library (grep over both trees, no hit); the Tau Ceti Chow
directory has only `Chow/Basic.lean` and `Chow/ClosedImmersion.lean` (no flat pullback, proper
pushforward, Chern class, normal cone, Gysin map or bivariant group: grep, no hit); the only
cotangent-complex files are Mathlib's presentation-level ones; `higherDirectImage` exists one degree
at a time. No headline is statable; none is forced through a stand-in; nothing is padding.

**Pinned declarations opened (file and line at the pin).**
`AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`) and
`AlgebraicCycle.map` (`:69`, weights through `mapCoeff`, the residue degree when the weights agree, as
3.2 says); `AlgebraicGeometry.Scheme.ord` (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52`, junk
value `0` for `f = 0` or coheight `≠ 1`, as the contract says); `Etale` (`Morphisms/Etale.lean:39`),
`Flat` (`Flat.lean:42`), `Smooth` (`Smooth.lean:59`), `IsProper` (`Proper.lean:41`),
`IsClosedImmersion` (`ClosedImmersion.lean:44`); Tau Ceti `cyclesOfDimension`
(`TauCeti/AlgebraicGeometry/Chow/Basic.lean:86`, by height in the specialisation order, the dimension
of the closure), `RatEquiv` (`:257`), `ChowGroup` (`:295`), `cycleClass` (`:304`),
`ChowGroup.equivIntOfUnique` (`:369`), `ChowGroup.pushforward`
(`Chow/ClosedImmersion.lean:211`), `SchPseudofunctor` (`Stack/Basic.lean:37`),
`Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`: fppf sheaf, diagonal representable by
schemes, étale atlas; no quasi-separatedness, as the contract says), `PrestableFamily`
(`Curves/Prestable.lean:45`: proper, geometrically connected, at worst nodal; no genus),
`FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`, `χ(E) − r·χ(O)`).
All 16 exist as cited.

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations on main: §§1.3, 1.9, 1.10, 1.18–1.23, 2.6, 2.10, 2.18–2.20, 3.3, 4.1, 4.14,
  5.1–5.6 exist with the cited content, and all 30 backticked names (`IsRepresentableBySpaces` …
  `gysin_self_intersection`) occur in the cited sections; `keel_mori` is stated with `π` proper and
  quasi-finite; the Checks `z ↦ z²` of §5.5 and `[0₁] · [L] = [0₁]` of §5.6 exist.
- VirtualFundamentalClass at its open head: §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5, 5.1–5.5,
  6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6 exist; §1.5 forms normal cones of representable closed immersions
  only and §2.1 uses integral closed substacks without stating them, so both declared gaps are real;
  §2.5 states the restricted invariance and the plane example; §4.5's gate has `[F_1/F_0]`; §7.6, §9.4
  and §9.5 are as the README describes; the three Checks quoted in 4.4 exist.
- StackPointsAndResidualGerbes at its open head: §§0.1, 0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3 (with the last
  API bullet on quasi-separated stacks), 5.4 as cited.
- StableReductionPartII at its open head: §5.15 states the Edidin–Graham comparison with the hypotheses
  the README repeats. EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2; StableReduction
  Layers 2 and 3; EnhancedDerivedSheaves §0.3, E1.4, E1.8; DerivedModuleAlgebra §§0.7, 0.12, 0.25:
  all exist. AlgebraicGromovWittenTheory §§4.1–4.3 are as the README describes (characteristic zero,
  projective target, the resolution property in its §4.2, the dimension formula of its §4.3).

**Declared gaps.** `gap:closed-substacks-of-stacks` and `gap:normal-cones-of-local-immersions` have the
same slug in `design/plan.json` and under `## Exact supplier contracts`, each with the supplier
VirtualFundamentalClass and a section; the `needs` sentences are precise. The first asks only for what
sits on top of StackPointsAndResidualGerbes §§0.3 and 0.5 (the notion, the bijection, the image under a
proper morphism). The acceptance of a later round is conditional on both.

**Sources: the seeded sample and more.** 34 locators opened in the cached texts, all at the stated
lines with the stated content: vistoli1989 Lemma 1.10 and (1.11) (299–328), (1.13)–(1.17) (337–376,
379–381, 419–436), 506–507, (2.1)–(2.5) (542–579), 582–584, 887–894, (3.6)–(3.7) (974–1011), Lemma 3.8
(1027–1048), Lemma 3.9 (1049–1074), Lemma 3.14 (1126–1131), Lemmas 3.19–3.20 (1197–1207), 1594–1620,
Lemma 5.3 (1621–1623), 1665–1704, 1705–1722, (6.1) (1758–1776), (7.11) and (7.14) (2064–2066,
2109–2112), 96–99; behrend-fantechi1997 Definition 3.7 (906–917), Proposition 3.4–3.5 (884–897),
Proposition 3.14 (1040–1044), 1067–1078, Theorem 4.5 and proof (1162–1201), 1261–1262, Definition 5.2
and Proposition 5.3 (1282–1306), Propositions 5.5–5.6 (1353–1363), 1389–1399, 1414–1421, 1456–1461,
1583–1614, 1617–1641, 1645–1670, Propositions 7.2–7.3 (1682–1712), 1721–1739; kresch1999b Corollary 1.10
(182–190), 192–207, Lemma 2.2 (218–237), Proposition 2.3 (242–243), Remark 2.5 (250–256), line 304,
Remark 2.6 (307–315), Theorem 3.1 and proof (334–405); behrend1997 129–161, 165–170, 193–197;
li-tian1998 1472–1474, 1501–1503, 1565–1566, 1585–1586; rydh2015 81–87; deligne-mumford1969 1012–1019;
edidin-graham1998 1042–1045, 1069–1076; keel-mori1997 line 28; kresch1999 1632–1636; stacks-chow-spaces
Situation 2.1, Definitions 3.1, 15.1, 32.1, Lemmas 4.1, 10.3, 13.2, 15.2, 27.3, Remark 7.2. No author
flag of an unverified locator was found in the README or the manifest. All 14 cited works are in
`sources.toml`.

**Adversarial table** (sampled targets, headlines, and the targets the findings touch).

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 finite cover; no separated cover of `B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹ → L` | `Q ×_L Q = 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹ = Q ×_{𝔸¹} G`; torsor degree `2` over `t ≠ 0`, `1` over `0` on a connected component: contradiction for separated `X` | holds | none |
| 1.2 `k(𝒱)`, `e(𝒱)` | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[𝔸¹/μ₂]` | invariants of `ℂ` under `ℤ/4 → ℤ/2`: `ℝ`; `e = 2` (kernel), not `4`; `k(x)^{μ₂} = k(x²)`, `e = 1` | holds | none |
| 1.3 `deg = (e(𝒢)/e(ℱ))·[k(ℱ):k(𝒢)]` | `Spec k → BG → Spec k`; `ℤ/p`-quotient; `L → B_{𝔸¹}G`; Frobenius | `|G|·(1/|G|) = 1`; `(1/p)·p = 1 = p/p`; `(2/1)·1 = 2` = rank of `Q → 𝔸¹`; `p` | holds | none |
| 1.3 inertia formula | `S₃`; `μ₃` over `ℚ` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` with two components | holds | none |
| 1.3 dominant base change | `ℱ = BH`, `𝒢 = Spec k`, `𝒢′ = BG` | `e(BG)/e(BH × BG) = 1/|H|` both sides | holds | none |
| 2.2 `A_0([𝔸¹/μ₂]) ≅ ℤ/2` | `P(y)` irreducible, `P ≠ y`, also inseparable `P` | `k[x]/P(x²) = K[x]/(x² − θ)`, `θ ≠ 0`, `char ≠ 2`: reduced, so `div P(y) = [W]`; `div(y) = 2[Bμ₂]` | holds, for every field | none |
| 2.3 `A_0(L)` | line with doubled origin | `ℤ²/ℤ(1,1) ≅ ℤ`; `A_0(𝔸¹) = 0` | holds | none |
| 3.1 étale pullback not injective | degree-2 isogeny `π : E′ → E` | sum of `π^*([P] − [O])` is `2Q = π̂(P) = O`, degree `0`: principal; `[P] − [O] ≠ 0` | holds | none |
| 3.2 pushforward and divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; coarse map of `[𝔸¹/μ₂]`, `φ = y`; Frobenius, `φ = t` | `|G|[0 × BG] = |G|·div(t)`; `2·(1/2)[0] = div(y)`; `[0] = div(t^p)` | holds | none |
| 3.2 at the README's generality | proper non-schematic algebraic space `P → Spec k` | atlas pullback is `P`, not a scheme; Vistoli's proof pushes along schemes | route incomplete | R01 |
| 3.3 localisation | `[𝔸¹/μ₂]`, `𝒵 = Bμ₂`; `ℙ¹`, two points | `ℤ → ℤ/2 → 0 → 0` exact; kernel `ℤ(1,−1)` on the left | holds | none |
| 3.4 exterior product | `K/k` separable and purely inseparable of degree `2`, `p` | `2 + 2 = 4`; length `p`, `p·p = p²` | holds | none |
| 3.5 homotopy invariance on a space | `X = 𝔸¹_ℂ/(z ∼ z̄, z ≠ 0)`, `N = X × 𝔸¹` | `div(t) = [0_X]` (order `1` on the chart), `A_0(X) = 0`; in `N`, `div(g)` has order `0` along `t = 0` when `t ∤ g`, `A_1(N) = 0` | holds | none |
| 3.5 Gysin, flat base change | `{0} → 𝔸¹` along `t ↦ t²`; non-flat `{0} → 𝔸¹` | `2[pt]` both ways; `[pt]` against a class in `A_{−1} = 0` | holds, flatness needed | none |
| 3.5 Situation 2.1 | `B = Spec k` | `δ = 0` on `B`; `δ_{X/B} = dim` | wording | R02 |
| 4.1 rational pushforward | `BG → Spec k`; `L × B(ℤ/2) → L` | `1/|G|`; `(1/2)[0₁]`, `ℚ ≅ ℚ` | holds | none |
| 4.2 Gysin on stacks | `π : Spec k → BG`, `Y = Spec k` | `|G|^{−1}·|G|·[Spec k] = [Spec k]` | holds | none |
| 4.2 base change `f_1^! = f^!` used in 8.4 | `f = i_b`, `𝒢 = B`, `𝒢_1 = 𝔐 × B` | `f_1 = η_b`; same coverings, same `r` | consistent with 8.4 | none |
| 4.3 Chern classes | `L ⊕ L^∨`; `O(−1)` on `ℙ¹`; `BG` | `c_2 = −c_1(L)²`; `s^!s_*[ℙ¹] = −[pt]`; `A_{−i}(BG)_ℚ = 0` | holds | none |
| 5.1 projection formula, non-representable | `g : BG → Spec k` | `g_*(g^*x · y) = (1/|G|)[Spec k] = x · g_*y`; diagonal degree `|G|²/|G| = |G|` would break it | holds | none |
| 5.1 Poincaré duality | `T = L → 𝔸¹`; `T = 𝔸¹ ⊔ 𝔸¹` | pullback of `id` is `L`, not separated: outside the supplier's groups; `ℚ²` in dimension 1 | holds, hypothesis needed | none |
| 5.2 `p_*` isomorphism, `deg(𝒱/p(𝒱))` | `ℤ/p`-quotient; `[𝔸¹/μ₂]` | `(1/p)·[k(y):k(y^p)] = 1 ≠ 1/e`; integrally `ℤ/2 → 0` | holds; rational only | none |
| 5.3 ring comparison | `ℙ(1,2)` | `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`; `t ↦ [Bμ₂]`, the point `x = 0` with stabiliser `μ₂` | holds | none |
| 5.4 `∫[𝒢_x] = [κ(x):k]/|Aut|` | gerbe over `ℝ`; `[ℙ¹/μ₂]` | `1/2 = 2/4`; `div(t²/(t²−1)) = 2[𝒫] − [𝒪]`, `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 comparison bundle | `[0→0]` and `[O→O]`; `[O(−4) → Ω]` on `ℙ¹` with `1 + ξ` | rank `1 = 0+1 = 1+0`; `Hom(E,E) = k² ⊕ H¹(O(−2))`, homotopies `H⁰(O(−2)) = 0`; `P = O(3)²` | holds | none |
| 6.2 class, independence | same theory through `F_1` and through `P` | `c_1(O(4)) = 4`; `c_1(O(3)²/O(2)) = 4` | agree | none |
| 6.2 non-separated | `𝓛_n` on `L` | `div = n[0₂]`, `A_0(L)_ℚ = ℚ`, opposite gluing `−n[0₂]` | holds | none |
| 6.3 formulas | node base; `k[x]/(x^p)`; `pt ⊔ 𝔸¹` | `−[𝔜 × pt]`; `s = 1 ≠ 0 = dim X − d − r`, class `p[pt]`; `[pt]`, not `0` | holds, hypotheses needed | none |
| 7.1 obstruction class | `k[x]/(x²)`, `x ↦ ε` to `k[ε]/(ε³)`; `Spec k → B𝔾_m` | `(ε + aε²)² = ε² ≠ 0`; torsor under `1 + J ≅ J`, `Ω_{pt/B𝔾_m} = O` | holds | none |
| 7.2 (1) ⇒ (3) and (1) needed | cone `C` of `φ` in degrees `≤ −2`; `char 2`, `φ = (0, id)` | `Ext^i(g^*C, J) = 0` for `i ≤ 1`; `Hom(L_X, J[1]) = Hom(A, J)`, `φ^*ω = 0`, no lift | holds | none |
| 8.1 boundary and sign | Kresch's `ω`; plane; non-reduced `Y` | `∂(−ω) = [C_{u^*C/C}] − [j^*N × C_{X′/Y′}]`; `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `∂β = 2[ν=0] − 2[T=0]` | holds | none |
| 8.1 third statement | `p_1, p_2 : Y ×_𝔅 Y → Y` | both pull `Y′` back to `(Y ×_𝔅 Y) ×_𝔅 𝔅′`; `α_1^*β = α_2^*β` is projection against action | holds | none |
| 8.2 regular pullback | node with `V(a+b)`; non-reduced base | `k[a,b]/(ab, a+b) = k[a]/(a²)`: `−2[pt × pt]` both ways; `2[pt]` both ways | holds | none |
| 8.3 functoriality | projection `𝔸¹ × Z → Z`; non-quasi-compact `Z′` | `rk F − rk E = dim Z′/𝔜 − dim Z/𝔜`; `dim B T_{𝔸¹} = 0` over `𝔸¹`; `[pt]` for every `Z′_0` | holds | none |
| 8.4 deformation invariance | `x² − b y²`; `B = L`; `𝔽_p(a)`, `y² = x^p − a` | `2` for every `b` (degree over `κ(b)`); `2` at `0₁`, `0₂`; `𝔪 = (y)`, Jacobian `(0, 2y)` zero only at `b₀`, count `1`, `k`-degree `p` | holds | none |
| 9.1 relative space of maps | `X = Spec k`; `id_{ℙ¹}` over a point | formally étale; `H⁰(T_{ℙ¹}) = k³ ≠ 0` | holds | none |
| 9.3 obstruction theory | `ℙ¹ → ℙ^r` degree `d`; elliptic curve | `χ = (r+1)(d+1) − 1`, `H¹ = 0`; virtual dimension `0`, `c_1(Ob) = 0` | holds | none |
| 9.4 resolution | `L = O` on genus `≥ 1` | `G = O`, `H = 0`, `π_*G ≠ 0`: construction fails | hypothesis needed | none |
| 9.5 virtual dimension | `ℙ²`, `d = 1`, `n = 0`; general | `−3 + 3 + 2 = 2`; `3g−3+n + δ + dim X(1−g) = (1−g)(dim X − 3) + n + δ` | holds | none |
| Conventions 5–7 | `BG`; `ℙ¹` with `[O(1) → Ω]`; `pt → B𝔾_m` | `1/|G|·|G| = 1`; degree `−1`; `−1 + 1 = 0` | holds | none |

For 8.3's second case the comparison isomorphism of the API was checked on its two degenerate cases
and on ranks and dimensions; its general proof is a target and was not re-derived here.

**Shape.** Summary, scope, conventions, supplier contracts, build paragraph, nine layers each ending
with `### Examples` and `### Dependencies`, downstream consumers, references. Every definition (24
italic names) has an API and at least three Checks; every theorem has hypotheses and a locator; every
`*Needs:*` line resolves into its layer's `### Dependencies`. No LaTeX delimiters, no process words,
no pull-request numbers, dates, anchors or machine paths (grep, no hit). Proposed names are in
italics, so no backticked name claims a declaration of `Suggested.lean`.

**Maintainer notes** (six claims; none gives a finding).
1. Words: satisfied. Convention 2 uses "local immersion" for the class, "local embedding" for the chart
   pair, and says once how Vistoli's words correspond (README lines 169–179); the five later uses agree.
2. Cotangent complex: satisfied. Convention 6: "No truncated cotangent complex is defined"; 9.3 builds
   `φ` into `L_{M/𝔅}` through the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3's third statement and 4.4.
4. Invariance: 8.1 states the restricted invariance and the plane counterexample. The note's last
   clause is refuted at the supplier's current head: VirtualFundamentalClass §2.5 names the acting bundle
   `T_{Y′}|_{X′}`.
5. Functoriality: 8.3 uses the graph only to define `v^!` on a quasi-compact open `Z′_0`; it uses no
   intermediate obstruction theory over the graph and says why (README lines 1808–1810). It does not
   cite VirtualFundamentalClass §8.4, where the conic check lives.
6. Suppliers: AlgebraicVectorBundles and EllipticCohomology are not cited (grep, no hit); the suppliers
   are the five expected ones with VirtualFundamentalClass, StackPointsAndResidualGerbes and
   StableReductionPartII, each by section.

**Duplication and ownership.** Searched main and the open roadmap heads by object: the moduli-space
comparison of Chow groups, integral Chow groups of stacks, the intersection ring of a smooth stack
with bivariant duality, and non-separated Chow theory have no other owner (no match). The obstruction
theory `(Rπ_* F^*T_X)^∨` occurs in AlgebraicGromovWittenTheory §4.1 for stable maps to a projective
target in characteristic zero; 9.3 is the statement for every base and every smooth target scheme and
says so. `scratch/overlaps.md` lists no dropped id, no id defined only by a revision, no conflicting
head and no second copy; confirmed that main has no folder of this name. Ownership against open pull
requests was checked for the roadmaps named above; the remaining open pull requests were searched by
the object patterns only.

Overlap check: read VirtualFundamentalClass, StackPointsAndResidualGerbes, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; rational Chow groups, Gysin maps, the intrinsic normal cone and the virtual class of separated stacks with the resolution property: VirtualFundamentalClass; closed substacks, residual gerbes, residue fields: StackPointsAndResidualGerbes; the Edidin–Graham comparison of groups: StableReductionPartII; the stable-map stack and its class: AlgebraicGromovWittenTheory; nothing owned twice.

**Copyright and arrangement.** Wording compared at the 34 locators above and in seven further prose
passages (Convention 3, the route of 3.5, the route of 6.1, 7.1's definition, 8.1's third route, 9.2's
route, the module docstring). The longest run shared with a source is six words ("the extensions form
a torsor under", behrend-fantechi1997 line 1167), which the mathematics forces. No table, figure or
list of examples is taken from a source. The source cited most is vistoli1989. Its sections are
1 (preliminaries), 2 (moduli spaces), 3 (intersection theory), 4 (the rational equivalence), 5
(bivariant theory), 6 (duality on moduli spaces), 7 (appendix). The README splits its §3 over Layers
2, 3 and 4 by integral against rational coefficients, puts its §2 and §6 together in 5.2 after the
operations, and has no layer for its §4 or §7; Layers 6–9 draw on other sources. The order of Layers
1 → 2 → 3 → 4 → 5 is forced by their `### Dependencies` lines. No layer is named after a source's
section and the README does not say it follows a source.

Source independence: 41 passages compared with 11 sources, none shared beyond a six-word forced phrase; largest share vistoli1989, 74 of about 155 locators; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (Proposition 1.8, §1.10, Chapter 3, Corollary 6.3, Proposition 8.1.1,
  Proposition 10.2): the manifest records both as uncertified; cited by locator, texts not read.
- The line numbers into vistoli1989 are those of an OCR extraction of an image-only scan; the passages
  were found at the cited lines, the page images themselves were not compared.
- The statements of 8.1–8.4 over bases that are not smooth or not reduced, and of 6.2 on stacks that
  are not separated, go beyond the generality the cited sources state (behrend-fantechi1997 lines
  1668–1670 assume smooth bases for Proposition 7.2). They were checked on the instances of the table
  and by their routes; no refereed statement at that generality was read.

## Source issues

- **Misprint** in behrend-fantechi1997 at Proposition 5.5, arXiv v1 p. 40: the source says the hypothesis is the vanishing of the degree-one cohomology of the obstruction complex; it should be the vanishing in degree minus one, as in Proposition 7.3 (1); affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, arXiv v2 pp. 10–11: the source says the acting bundle is the tangent bundle of the arbitrary immersed stack; it should be that of the smooth regularly immersed one, as its proof uses; affects a stated result.

## For the human reviewers

- **Scope.** The targets 6.2 (non-separated stacks) and 8.1–8.4 (bases of pure dimension, reduced or not) are stated more generally than behrend-fantechi1997 and kresch1999b state them (`README.md` lines 1464–1476, 1729–1751); no refereed source for that generality is cited.
- **Scope.** The merge order still lists VirtualFundamentalClasses (line 428) and `packages/VirtualFundamentalClasses` still exists with a `needs_changes` review; the maintainer notes say that package was stopped.
- **Licence.** vistoli1989 was read as an OCR extraction of the GDZ scan (`sources.toml`, `version_note`); line citations into it rest on that extraction.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "283aef1ca4cbba220832e56ebe019695c4752eff", "job": "REV-PKG-VirtualFundamentalClassPartII", "model": "fable", "worker": "chris-x29"} -->
