<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6907553214 -->
Review (claude) of 58ced1d

Verdict: accepted
Conditional on the announced gaps: `closed-substacks-of-stacks`, `normal-cones-of-local-immersions`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both findings of the first round are repaired, the repaired passages hold up under the
adversarial pass, the repaired pattern was looked for in the rest of the text and is covered
everywhere, and nothing else needs a change. The acceptance is conditional on the two declared
supplier gaps, `gap:closed-substacks-of-stacks` and `gap:normal-cones-of-local-immersions`
(supplier VirtualFundamentalClass §2.1 and §1.5).

Files reviewed: `packages/VirtualFundamentalClassPartII/README.md` (2247 lines, read in full),
`packages/VirtualFundamentalClassPartII/Suggested.lean`, `metadata.toml`, `sources.toml`, and the
`gaps` list of `design/plan.json`. No file of the package was changed; no source was added to the
manifest; no text was missing, so no reference request was written.

## Repairs of the first round, finding by finding

**F01 (P2), 3.2 and 3.3 took proofs from a source whose "representable" is narrower: repaired.**
3.2 now reads "Vistoli's representable morphisms are representable by schemes (vistoli1989 (7.11),
lines 2064–2066) … Here `f` is representable by algebraic spaces (Convention 2), and `ℱ ×_𝒢 V` is a
quasi-separated algebraic space of finite type over `k`, proper over the scheme `V` and not always a
scheme", and names the four steps on such spaces: stacks-chow-spaces Definition 8.1, Lemma 11.1,
Lemma 14.1 and Lemma 16.3. 3.3 now reads "for `f` representable by algebraic spaces only … the
statement used in its place is the push–pull formula for a proper morphism of such spaces and a flat
morphism of relative dimension `d` (stacks-chow-spaces Lemma 11.1, lines 590–606)". Both `*Needs:*`
lines carry "2.3 (… its statement on algebraic spaces …)". The repair differs from the one the first
review wrote (it adds Lemma 14.1 for the equal-dimension case and uses Lemma 16.3 only where the
dimension drops), and it is the better one: 3.2 proves an equality of cycles, which a statement on
classes does not give, since étale pullback is not injective on integral Chow groups (3.1, last
Check). `sources.toml` records the four locators under `stacks-chow-spaces` and (7.11) under
`vistoli1989`.

**F02 (P3), two values of `δ` for one Situation 2.1: repaired.** 3.5 now reads "in its Situation
2.1 with `B = S = Spec k` and `δ = 0`, as in 2.3, so that the induced `δ_{U/B}` is the dimension of
the closure of a point". The phrase "Situation 2.1" occurs twice in the README (2.3 and 3.5), with
the same `δ`.

**The repaired pattern in the rest of the package.** The pattern is a proof taken from vistoli1989
for morphisms representable by schemes and used for morphisms representable by algebraic spaces.

- 1.3 (degree of a representable morphism): the repair added the sentence "For `f` representable by
  algebraic spaces only, `ℱ ×_𝒢 V` is an algebraic space … when it is generically finite over `V`,
  it is a scheme over a dense open `V° ⊆ V`". Checked: a point of the generic fibre of a generically
  finite `W → V` is the generic point of a component of `W`, so the nowhere dense complement of the
  dense open subscheme contains no such point and does not dominate `V`.
- 4.2, API, commutation with "pullback along flat representable morphisms" (vistoli1989 Lemma 5.3):
  the proof (vistoli1989 lines 1653–1657) forms `Y″ = Y ×_{𝒢′} 𝒢″`, a scheme for Vistoli and an
  algebraic space here. Every step it uses on `Y″` is a target of the README at that generality:
  3.5's `f^!` on algebraic-space sources with `f^! q^* = p^* f^!` for flat `q`, 4.1's push–pull, 4.2's
  commutation with proper pushforward and its bullet "for `𝒢′` an algebraic space, `f^!` is 3.5
  tensored with `ℚ`"; all are in 4.2's `*Needs:*` (3.5, 4.1). No change needed.
- 4.3 (Chern classes against flat representable pullback): same inputs through 4.2. 5.2: the README
  says "there with `M` a scheme" and its API bullet carries the base change to algebraic spaces.
  5.4 consumes 3.2 as repaired. 3.1, 3.4, 4.1: no atlas pullback that could fail to be a scheme
  (in 4.1 the proper cover `X → 𝒢` is representable by schemes because the diagonal of `𝒢` is).

## Verified sound

**Elaboration.** `lake env lean` on `packages/VirtualFundamentalClassPartII/Suggested.lean`, run from
the content checkout: exit 0, no output at all. The file declares nothing, so there is no `sorry`
warning, no declaration for the one-tactic padding probe and no elaborated type for the
`#check @name` binder comparison. It is `module`, `import Mathlib`, one module docstring, an empty
namespace `TauCetiRoadmap.VirtualFundamentalClassPartII`; no `TauCeti.*` import, no `set_option`, no
data, no `#` command.

**Dependency check.** Output of the gate:

    depcheck: 246 roadmaps, 2298 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. In the merge order StackPointsAndResidualGerbes is line 38,
StableReductionPartII line 339 and this roadmap line 340; SchemeAndStackFoundations,
EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves and DerivedModuleAlgebra are
on main; VirtualFundamentalClass is another author's open pull request adding a new roadmap folder.
AlgebraicGromovWittenTheory appears only as a downstream consumer and in comparisons, never in a
`*Needs:*` line. None of the suppliers' texts names this roadmap (grep of the four open heads).

**Headline theorems.** The README summary has twelve headlines; the module docstring names each
with the carrier it lacks. At the pins: no `IsAlgebraicStack`, `IsDeligneMumford`, flat pullback or
proper pushforward of Chow groups in either library (grep over both trees, no hit); the Tau Ceti Chow
directory holds `Chow/Basic.lean` and `Chow/ClosedImmersion.lean` only; the only cotangent files of
Tau Ceti are ring-level (`RingTheory/Ideal/Cotangent/Smooth.lean`, `RingTheory/Smooth/Jacobian.lean`);
higher direct images exist degree by degree (`Cohomology/HigherDirectImage/Basic.lean`). No headline
is statable, none is forced through a stand-in, and there is nothing to pad.

**Pinned declarations opened (file and line at the pin), 16 of 16 as cited.**
`AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`),
`AlgebraicCycle.map` (`:69`, `[QuasiCompact f]`, weights `wx`, `wy`); `Scheme.ord`
(`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52`); `IsClosedImmersion`
(`Morphisms/ClosedImmersion.lean:44`), `Flat` (`Flat.lean:42`), `Etale` (`Etale.lean:39`), `Smooth`
(`Smooth.lean:59`), `IsProper` (`Proper.lean:41`); Tau Ceti `cyclesOfDimension`
(`TauCeti/AlgebraicGeometry/Chow/Basic.lean:86`), `RatEquiv` (`:257`), `ChowGroup` (`:295`),
`cycleClass` (`:304`), `ChowGroup.equivIntOfUnique` (`:369`, `[Unique X]`, `ChowGroup X 0 ≃+ ℤ`),
the pushforward of `Chow/ClosedImmersion.lean`, `SchPseudofunctor` (`Stack/Basic.lean:37`),
`Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`: fields `isSheaf`,
`representableDiagonal`, `exists_etaleAtlas`; no quasi-separatedness, as the contract says),
`PrestableFamily` (`Curves/Prestable.lean:45`: extends `IsProper`, `GeometricallyConnected`, with
`AtWorstNodalOfRelativeDimensionOne`; no genus; its `syntomic` instance follows),
`FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean`).

**Cross-roadmap citations, resolved again this round.**
- VirtualFundamentalClass at its open head: §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5, 5.1–5.5,
  6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6 all exist under those numbers. Read against the README: §1.5
  extends normal cones "to representable closed immersions" only and §2.1 uses integral closed
  substacks without stating them (both gaps are real); §2.5 names the restricted action
  `T_{Y′}|_{X′}`, the plane negative check and the test stacks "whose pullbacks are separated"; the
  gate of §4.5 gives `[(F⁻¹)∨/(F⁰)∨]`; §7.3 assumes the resolution property; §7.6 gives the ordinary
  class of a local complete intersection; §9.2 asks for separated `X` with the resolution property;
  §9.4 is over smooth bases; §9.6 has `j^*L_{V/W} → L_{X/Y}`; the Checks quoted in 4.4 (`B(ℤ/2)` of
  degree `1/2`, the self-intersection of `O(1)` on `ℙ¹`) are in §2.1 and in the Layer 2 Examples.
- StackPointsAndResidualGerbes at its open head: §§0.1, 0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3, 5.4 exist
  with the cited subjects.
- StableReductionPartII at its open head: §5.15 is headed by the Chern class of the dualising
  pairing and states, in its second paragraph, the Edidin–Graham comparison with the hypotheses the
  README repeats (smooth affine `G`, proper action, quasi-projective `X` with a linearised ample
  sheaf, `[X/G]` Deligne–Mumford, compatibility with Chern classes and proper pushforward).
- SchemeAndStackFoundations on main: the 23 cited sections exist under their numbers, and the 30
  backticked names occur in it (`IsRepresentableBySpaces`, `RepresentableProperty`,
  `IsAlgebraicStack`, `IsDeligneMumford` in §1.19; `inertia`, `automorphismGroup` in §1.20;
  `actionQuotient` in §1.21; `IsCoarseModuliSpace`, `keel_mori` in §1.23; `deformationToNormalCone`
  in §5.5; the others by exact match).
- AlgebraicGromovWittenTheory at its open head: §§4.1–4.3 are the relative obstruction complex, the
  global resolution through the resolution property of VirtualFundamentalClass §7.3, and the
  virtual dimension, as the README describes.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Declared gaps.** Both slugs are in `design/plan.json` with supplier VirtualFundamentalClass
(§2.1, §1.5) and under `## Exact supplier contracts` in the form the intake reads. Each `needs`
sentence says what is missing with its hypotheses; the first asks only for what sits above
StackPointsAndResidualGerbes §§0.3 and 0.5, the second for the cone that VirtualFundamentalClass
§1.5 does not form (the README's witness: the diagonal of `BG`, with chart `U = V = G` and cone of
rank `0`).

**Sources: the seeded sample.** Every locator of the fifteen sampled targets and of the repaired
passages was opened in the cached texts; all are at the stated lines with the stated content
(77 locators). No author flag on a single locator exists; the one blanket flag is under
`## Not verifiable`.

- 1.2: vistoli1989 Lemma 1.13 (337–338), (1.14) (347–353), 422, 424–425.
- 2.2: vistoli1989 (3.1) (891–894), (3.2)–(3.4) (901–960), Lemma 3.3 (940–948), 887, 953–959, (3.5)
  (967–971); stacks-chow-spaces Lemma 13.2 (667), Lemma 10.3 (516), Lemma 4.1 (151–158).
- 3.2: vistoli1989 (3.6)(ii) (980–984), (3.7) and proof (989–1011), (7.11) (2064–2066);
  stacks-chow-spaces Definition 8.1 (347–353), Lemma 11.1 (590–606), Lemma 14.1 (726–730) and the
  norm step (784–787), Lemma 16.3 (917–919).
- 3.4: vistoli1989 1706–1708. 4.2: vistoli1989 1603–1620, 1665–1670, Lemma 5.3 and proof (1621–1657),
  Lemma 5.5 (1671–1684). 4.3: vistoli1989 96–99, 1570–1572, 1673–1684.
- 5.3: edidin-graham1998 1042–1045, Proposition 15 and proof (1069–1076).
- 6.1: behrend-fantechi1997 Proposition 5.3 and the reduction to morphisms of complexes
  (1299–1306). 6.2: Definition 5.2 (1282–1298), 1261–1262, 1664–1667.
- 7.1: behrend-fantechi1997 1067–1078. 7.2: Theorem 4.5 and proof (1162–1201), 1657–1663, 1605–1614.
- 8.1: kresch1999b Corollary 1.10 (182–190), 192–204, Proposition 2.1 (205–207), 232–237,
  Proposition 2.3 (242–243), Remark 2.5 (250–256), line 304, Remark 2.6 (307–315), Theorem 3.1
  (334–343), its setting (320–333) and proof (344–348, 390–405); behrend-fantechi1997 Propositions
  3.4–3.5 (884–897).
- 9.2: behrend-fantechi1997 1592–1597. 9.4: behrend1997 Proposition 5 (165–187). 9.5: behrend1997
  157–161, 193–197; li-tian1998 Theorem 4.3 (1) (1585–1586).
- Also opened: stacks-chow-spaces Situation 2.1 (57–65), Remark 7.2 (312–316), Definitions 3.1,
  10.1, 15.1, 18.1, 32.1, Lemmas 15.2, 20.1, 21.2, 25.1, 27.1, 27.3; rydh2015 Theorem B (81–87);
  li-tian1998 Theorem 4.2 (1472–1474); behrend-fantechi1997 1645–1651, Propositions 5.5–5.6
  (1353–1363) and 7.3 (1702–1711); behrend1997 148–153.

All 14 cited works are in `sources.toml` and in the README's References.

**Adversarial table** (repaired passages, the fifteen sampled targets, the headlines, and the
sections the first round's table left without a row).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 divisor formula, repaired route | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; Frobenius `t ↦ t^p`, `φ = t`; `f = id` | atlas pullback `𝔸¹ × G → 𝔸¹`, norm `t^{|G|}`, so `|G|·[0 × BG]` on both sides; `N(t) = t^p`, `div = [0] = f_*[0]`; ratio `1`, `N = id` | holds | none |
| 3.2, dimension drops (Lemma 16.3) | integral curve `C` in a proper non-schematic space `P`, `𝒲′ = Spec k` | no integral subspace of dimension `1` in `Spec k`, so `∂W_0(Spec k) = 0` and `p_* div(φ) = 0` as a cycle; agrees with degree `0` of a principal divisor | holds | none |
| 3.2, why classes do not descend | degree-2 étale isogeny `π : E′ → E`, `P` the point of `ker π̂` | sum of `π^{−1}(P)` minus sum of `ker π` is `2Q = π̂(P) = O`, degree `0`: `π^*([P] − [O]) = 0`, `[P] − [O] ≠ 0` | cycle-level formula needed, as the README says | none |
| 3.3 push–pull, space source | `P → Spec k` against `𝔸¹ → Spec k`; closed point `x`, surface `S ⊆ P` | `[κ(x):k]·[𝔸¹]` both ways; `0 = 0` (dimension `3 → 1`) | holds | none |
| 3.5 `δ` (repaired) | `B = Spec k`; `X = 𝔸¹` | `δ = 0` at the one point; `δ_{X/B}` is `1` at the generic point, `0` at closed points; `δ ≡ 1` would shift every grading by `1` | holds | none |
| 1.3 degree through a space (repaired) | `W → V` generically finite with a non-schematic locus; `P → Spec k`, `dim P ≥ 2` | points of the generic fibre are generic points of components of `W`, so the bad locus misses the generic fibre; not generically finite, degree `0` | holds | none |
| 1.2 function field and `e` | `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[𝔸¹/μ₂]`; `B_{𝔸¹}G` | invariants `ℝ`, kernel of order `2`, `e = 2` (not `4`); `k(x²)`, `e = 1`, `e(Bμ₂) = 2`; `e = 2` with trivial stabiliser at `0` | holds | none |
| 1.1 torsor of `B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹ → L` | `Q ×_L Q = 𝔸¹ ⊔ 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m = Q ×_{𝔸¹} G`; a finite étale torsor over a separated cover would have degree `2` and `1` on one irreducible component | holds | none |
| 1.3 dominant base change | `Spec k → BG` (`G = ℤ/2`) along `B(ℤ/4) → B(ℤ/2)`; `BH → Spec k` along `BG` | fibre product `B(ℤ/2)`, degree `4/2 = 2 = |G|`; `1/|H|` both sides | holds | none |
| 2.1 cycle of a substack | `[V(x²)/μ₂]`; `⊔_ℕ Spec k → Spec k` | length `2`, so `2·[Bμ₂]`; an infinite sum, excluded by finite type | holds | none |
| 2.2 `A_0([𝔸¹/μ₂]) ≅ ℤ/2` | `P(y) ≠ y` irreducible, inseparable allowed (`y³ − a` in characteristic `3`) | `k[x]/P(x²) = K[x]/(x² − θ)`, `θ ≠ 0`, `char ≠ 2`: separable over `K`, reduced, `div P(y) = [W]`; `ord_{Bμ₂}(g(y)) = 2·ord_0 g`, even | holds | none |
| 2.2 `W_{−1}(BG)` | `k = ℚ`, element `2` | boundary in `Z_{−1} = 0` | holds | none |
| 3.4 exterior product | `K/k` separable of degree `2`; purely inseparable of degree `p`; `BG × BH` | two points of degree `2`, `4 = 2 + 2`; local of length `p`, `p·p = p²`; `[B(G × H)]` with coefficient `1` | holds | none |
| 4.2 Gysin on a stack | `π : Spec k → BG`, covering `Y = Spec k`; flat base change `𝔐 × B → B` (8.4) | `f^![Y] = [G]`, `r_*[G] = |G|·[Spec k]`, `|G|^{−1}·|G| = 1`; same coverings, cones and `r` for `i_b` and `η_b` | holds | none |
| 4.2 flat representable pullback | `Y″ = Y ×_{𝒢′} 𝒢″` an algebraic space | each step of vistoli1989 1653–1657 is a README target on spaces (3.5 API, 4.1, 4.2) | covered | none |
| 4.2 last Check | `X = 𝔸¹_ℂ/(z ∼ z̄, z ≠ 0)` over `𝔸¹_ℝ` | residue field `ℂ` at the origin, every local function real there: not a scheme; étale, so codimension `0`, `f^![𝔸¹_ℝ] = [X]` | holds | none |
| 4.3 homotopy invariance, Chern classes | `𝔸¹ × BG`; `O(−1)` on `ℙ¹`; `L ⊕ L^∨`; `BG` | `s^![𝔸¹ × BG] = [BG]`; `s^!s_*[ℙ¹] = −[pt]`; `c_1 = 0`, `c_2 = −c_1(L)²`; `A_{−i}(BG)_ℚ = 0` | holds | none |
| 4.4 agreement | `B(ℤ/2)`; `O(1)` on `ℙ¹`; `Spec k` | `1/2` both theories; a point class both; `ℚ`, `[Spec k] ↦ 1` | holds | none |
| 5.1 projection formula | `g : BG → Spec k`, `x = [Spec k]`, `y = [BG]` | `(1/|G|)·[Spec k]` both sides; a product weighted by `|G|²/|G|` gives `[Spec k]` on the left | holds | none |
| 5.2 moduli comparison | `ℤ/p`-quotient of 1.3; `[𝔸¹/μ₂]`; `L × B(ℤ/2) → L` | invariants `k[x, y^p − x^{p−1}y]`, degree `(1/p)·p = 1 ≠ 1/e`; integrally `ℤ/2 → 0`; `ℚ ≅ ℚ` on a non-separated pair | holds, rationally only | none |
| 5.3 ring comparison | `ℙ(1, 2)`; `μ_n` on a point; trivial `G` | `c_2 = (t)(2t)`, `ℤ[t]/(2t²) ⊗ ℚ = ℚ[t]/(t²)`, `t ↦ [Bμ₂]` at `[0:1]`, `∫t = 1/2`, `∫2t = 1`; `ℤ[t]/(nt) ⊗ ℚ = ℚ`; identity | holds | none |
| 5.4 degree of a point | gerbe over `ℝ`; `[ℙ¹/μ₂]` | `1/2 = 2/4`, and no real point (neither `ℤ/4`-torsor over `ℝ` has an equivariant map to `Spec ℂ`); `2·(1/2) = 1 = ∫[𝒪]` | holds | none |
| 6.1 comparison bundle | `[0 → 0]` against `[O → O]`; `[O(−4) → Ω]` on `ℙ¹` with `1 + ξ`; ranks | rank `1 = 0 + 1 = 1 + 0`; `Hom(E, E) = k² ⊕ H¹(O(−2))`, homotopies in `H⁰(O(−2)) = 0`, `φ(1 + ξ) = φ`, `P = O(3)²`; `rk F_1 + rk H_0 = rk H_1 + rk F_0` from `rk E` | holds | none |
| 6.1 kernel of `P → F_1` | `H_0 → H_1` not injective | the fibre of the `H_0`-torsor `H_1 → 𝔈` over `0` is `H_0` itself | holds | none |
| 6.2 class and independence | theory of 6.1 through `F_1` and through `P`; `𝓛_n` on `L`; `d + r < 0` | `c_1(O(4)) = 4`; `c_1(O(3)²/O(2)) = 6 − 2 = 4`; `n·[0₂]`, opposite gluing `−n·[0₂]`; `0` | holds | none |
| 6.3 formulas | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; node base | `s = 1 ≠ 0`, class `p·[pt]`, not `c_1(Ob) ∩ [X] = 0`; `[pt]`, not `0`; `−[𝔜 × pt]` in `A_1` with `d + r = 1` | holds, hypotheses needed | none |
| 7.1 obstruction class | `Spec k → B𝔾_m`; `k[x]/(x²)`, `x ↦ ε`; étale `f` | torsor under `1 + J ≅ J = Hom(O, J)`, zero group with `L_X`; `(ε + aε²)² = ε² ≠ 0`; unique extension | holds | none |
| 7.2 equivalence | cone `C` of `φ`; characteristic `2`, `φ = (0, id)` on `k[x]/(x²)` | `H⁰(C) = H^{−1}(C) = 0`, so `Hom(g^*C, J[i]) = 0` for `i ≤ 1`: injective on `Ext¹`, bijective on `Hom`; `φ^*ω = 0` and `(x + ax²)² = x² ≠ 0` | holds, surjectivity needed | none |
| 8.1 boundary and sign | Kresch's `ω` (line 304); plane; non-reduced ambient | `∂(−ω) = [C_{u^*C/C}] − [j^*N × C_{X′/Y′}]`; `div(ν/η) = [ν=0] − [η=0]`, fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `gr = k[T, E]/(E²)`, `∂β = 2·[ν=0] − 2·[T=0]` | holds | none |
| 8.1 fourth statement against Kresch | Kresch's `X` smooth and regularly immersed, his `Y′` arbitrary | the README's `Y′` is Kresch's `X`; its acting bundle `T_{Y′/𝔐}|_{X′}` is the bundle Kresch's proof uses (`𝔸^m ⊆ 𝔸^n`) | consistent | none |
| 8.2 regular pullback | node with `V(a + b)`; non-reduced base | `−2·[pt × pt]` both ways; `2·[pt]` both ways, `[pt]` on `𝔜_red` | holds | none |
| 8.4 deformation invariance | `x² − b y²`; `B = L`; `y² = x^p − a` over `𝔽_p(a)` | `2` at every `b`; `2` at `0₁` and `0₂`; `𝔪 = (y)`, regular and not smooth at `b₀`, count `1`, `k`-degree `p`; `m + r = 0` gives `A_1(X)` and `n·[B]` | holds | none |
| 9.2 duality along prestable families | smooth curve, `V = L` of degree `e`, `V = ω`; non-Noetherian base `k[x_i]/(x_i)²`, `t ↦ x_1` | `e + 1 − g`, `g − 1`; `t·x_1 = 0`, not flat, free of ranks `1` and `g` on both sides | holds | none |
| 9.3 obstruction theory | `ℙ¹ → ℙ^r`; elliptic curve to itself; `(L, pr₂)` | `(r + 1)(d + 1) − 1`, `H¹ = 0`; rank `0`, `Ob` trivial, class `0`; `E = Ω_L`, class `[L]`, dimension `1` | holds | none |
| 9.4 global resolution | `V = O`; embedded point; `L = O` on genus `≥ 1` | `h¹(H) − h¹(G) = 1 − g`; `H⁰(O(−N) ⊕ k_p) = k`; `G = O`, `H = 0`, `π_*G ≠ 0` | holds, hypotheses needed | none |
| 9.5 virtual dimension | `ℙ²`, `d = 1`, `n = 0`; general; doubled `ℙ¹`; `ℙ¹ × 𝔸¹` | `−3 + 3 + 2 = 2`; `3g − 3 + n + δ + dim X·(1 − g) = (1 − g)(dim X − 3) + n + δ`, the value of li-tian1998 line 1586; `0 + 2 + 1 = 3 = h⁰(O(2))`; `4 = dim(PGL₂ × 𝔸¹)`, `A_0 = 0` | holds | none |
| Conventions 1 and 3 | `Bℤ`; `𝔸¹/ℤ`; `L`; `B_{𝔸¹}G` | diagonal with fibre `ℤ`, not quasi-compact; not quasi-separated; own proper cover; finite étale cover of degree `2` | holds | none |
| Conventions 5–7 | `Spec k → BG → Spec k`; `[O(1) → Ω]` on `ℙ¹`; `pt → B𝔾_m`; elliptic curve | `|G|·(1/|G|) = 1`; rank `0`, degree `−1`; `−1 + 1 = 0`; `Hom(O[1], O[2]) = H¹(O) ≅ k` | holds | none |

The targets outside this table (2.3, 3.1, 4.1, 8.3, 9.1) carry computed rows in the first round's
table; the texts of those sections are unchanged since (the diff of the repair touches 1.3, 3.2, 3.3
and 3.5 only), and their Checks were recomputed while reading (for instance `A_0(L) = ℤ²/ℤ·(1, 1)`,
`2·(1/2)·[0] = div(y)`, the relative dimension `−1` of a `B T_{𝔸¹}`-torsor, `H⁰(T_{ℙ¹}) = k³`).

**Shape.** Summary, scope, conventions, supplier contracts, build paragraph, nine layers each ending
with `### Examples` and `### Dependencies`, downstream consumers, references. 33 `**Checks.**`
blocks, each with at least three bullets (counts by section: 4, 5, 7; 4, 3, 3; 4, 4, 3, 3, 6; 3, 4, 4,
3; 6, 5, 4, 4; 3, 5, 5; 4, 4; 4, 4, 5, 6; 3, 4, 4, 3, 6). Every definition has an API; every theorem
its hypotheses and a locator; 35 `*Needs:*` lines, each inside its layer's `### Dependencies`. The
layers are named by their mathematics; the order 1 → 2 → 3 → 4 → 5, 4 → 6, 7 independent of the Chow
lane, 2–6 → 8, 6–7 → 9 is the one the dependency lines give.

**Policy scan.** No LaTeX delimiter, pull-request number, date, anchor, machine path or process
word in the README or the Lean file (grep, no hit). Every backticked identifier is a pinned
declaration, a supplier's name or mathematical notation; the README sets its own proposed names in
italics, so none claims a declaration of `Suggested.lean`.

**Maintainer notes** (six claims; none gives a finding).
1. Words: holds and is satisfied. Convention 2 uses "local immersion" for the class and "local
   embedding" for the chart pair, and says once that Vistoli calls the former local embeddings.
2. Cotangent complex: satisfied. Convention 6 says "No truncated cotangent complex is defined", and
   9.3 builds `φ` into the full `L_{M/𝔅}` by the projection formula and the trace.
3. Integral and rational groups: satisfied by the third statement of 2.3 and by 4.4.
4. Invariance: 8.1 states the restricted invariance and the plane counterexample. The note's last
   clause is refuted: VirtualFundamentalClass §2.5 at its head names the acting bundle
   `T_{Y′}|_{X′}`.
5. Functoriality: 8.3 does not use the graph reduction with an intermediate obstruction theory and
   says why (the obstruction to the lift lies in `Ext¹(g^*Ω_{Z′/𝔜}, u^*E)`); it uses the graph only
   to define `v^!`.
6. Suppliers: AlgebraicVectorBundles and EllipticCohomology are not cited (grep, no hit); the
   suppliers are the five expected roadmaps with VirtualFundamentalClass,
   StackPointsAndResidualGerbes and StableReductionPartII, each by section.

**Duplication and ownership.** By object, on main and at the open heads (`roadmaps grep` and the
four supplier texts read): integral Chow groups of stacks, Chow theory without separatedness, the
intersection ring with bivariant duality, the moduli-space comparison, the comparison bundle and
the relative obstruction class have no other owner. Against the maintainer's rule (nothing that
VirtualFundamentalClass states in the same or greater generality): 4.1–4.3 drop separatedness from
its §§2.2–2.3; 6.2 drops the resolution property and separatedness from its §§7.3, 9.2; 6.3 and 8.2
pass from smooth bases (its §9.4) to bases of pure dimension; 7.1–7.2 pass from `Spec k` (its §§3.5,
6.1, 6.3) to a base stack; 8.3 drops separatedness and the resolution property from its §9.5; 5.4
imports its degree and adds only the closed formula. 9.3 is the statement for every base, every
smooth target scheme and every field of what AlgebraicGromovWittenTheory §4.1 states for stable
maps to a projective target, and builds no moduli stack. `scratch/overlaps.md` lists no dropped id,
no id only a revision defines, no conflicting head and no second copy; main has no folder of this
name. Ownership against open pull requests was checked through the search tool over all open heads
and by reading the five closest roadmaps.

Overlap check: read VirtualFundamentalClass, StackPointsAndResidualGerbes, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction; rational Chow groups, Gysin maps, bivariant groups, the intrinsic normal cone and the virtual class of separated stacks with the resolution property: VirtualFundamentalClass; closed substacks, residual gerbes, residue fields: StackPointsAndResidualGerbes; the Edidin–Graham comparison of groups: StableReductionPartII; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme intersection theory: SchemeAndStackFoundations; nothing owned twice.

**Copyright and arrangement.** Wording was set beside the source at the 77 locators above and in
six further prose passages (Convention 3, the definition of 7.1, condition 3 of 7.2, the route of
9.4, the route of 8.1's third statement, the module docstring). The longest shared run is six words
(behrend-fantechi1997 line 1167, on the torsor of extensions), in a statement that can be written in
one way. No table, figure or list of examples comes from a source; the Checks are the roadmap's own.
The source cited most is vistoli1989, whose sections are 1 (preliminaries), 2 (moduli spaces),
3 (intersection theory), 4 (the rational equivalence), 5 (bivariant theory), 6 (duality on moduli
spaces), 7 (appendix). The README splits its §3 over Layers 2, 3 and 4 by integral against rational
coefficients, places its §§2 and 6 together in 5.2 after the operations, has no layer for its §4 or
§7, and draws Layers 6–9 from other sources: no run of layers maps one to one onto its sections.

Source independence: 83 passages compared with 8 sources, none shared beyond a six-word forced phrase; largest share vistoli1989, 76 of 160 citations of a source in the README; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (Proposition 1.8, §1.10, Chapter 3, Corollary 6.3, Proposition 8.1.1,
  Proposition 10.2): recorded as uncertified in the manifest and cited by locator; the texts were
  not read.
- vistoli1989: the manifest's `version_note` flags every line citation as resting on an OCR
  extraction of an image-only scan. The passages are at the cited lines of that extraction and the
  paragraph numbers agree; the page images were not compared, and several displayed formulas are
  garbled in the extraction (for instance lines 1607–1609 and 1633–1645), where the statement was
  checked from the surrounding prose.
- 6.2 on stacks that are not separated and 8.1–8.4 over bases that are neither smooth nor reduced
  go beyond what the cited sources state. They were checked by their routes and on the instances of
  the table; no refereed statement at that generality was read.
- The general proof of the comparison isomorphism in 8.3's API is a target; it was checked on its
  degenerate cases and on ranks and dimensions only.

## Source issues

- **Misprint** in behrend-fantechi1997 at Proposition 5.5, arXiv v1 p. 40: the source says the hypothesis is the vanishing of the degree-one cohomology of the obstruction complex; it should be the vanishing in degree minus one, as in Proposition 7.3 (1); affects nothing.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, arXiv v2 pp. 10–11: the source says the acting bundle is the tangent bundle of the arbitrary immersed stack; it should be that of the smooth regularly immersed one, which its proof translates along; affects a stated result.

## For the human reviewers

- **Scope.** 6.2 (stacks that are not separated) and 8.1–8.4 (bases of pure dimension, reduced or not) are stated more generally than behrend-fantechi1997 and kresch1999b state them (`packages/VirtualFundamentalClassPartII/README.md`, sections 6.2 and 8.1–8.4); no refereed source for that generality is cited.
- **Scope.** `merge-order/ORDER.txt` line 428 still lists VirtualFundamentalClasses and `packages/VirtualFundamentalClasses` still exists; the maintainer notes say that package was stopped.
- **Licence.** vistoli1989 was read as an OCR extraction of the GDZ scan (`sources.toml`, `version_note`); every line citation into it rests on that extraction.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "58ced1d4698afd3939233f45dc5ee22278da682f", "job": "REV-PKG-VirtualFundamentalClassPartII~2", "model": "fable", "worker": "chris-x88"} -->
