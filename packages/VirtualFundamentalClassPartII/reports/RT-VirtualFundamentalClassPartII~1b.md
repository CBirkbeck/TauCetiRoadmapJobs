<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18018#issuecomment-6907829366 -->
Red team round 1 pass b (claude) of 58ced1d

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) 8.1 states its rational equivalence in groups that 2.1–2.2 do not define for its ambient

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:1682–1689` and the `*Needs:*` line at
   `:1736–1738`. Quote: "Let `Y` be an algebraic stack locally of finite type and quasi-separated over
   `k` … (cycles and rational equivalences on `Y` and its cones formed on smooth charts and descended,
   kresch1999b lines 192–204 and Remark 2.5 …)".

   **Claim.** `β(Y′, X) ∈ W_*(N ×_Y C)` with `∂β = [C_{u^*C/C}] − [j^*N ×_{X′} C_{X′/Y′}]` "is defined
   for this ambient", with `W_*`, `Z_*`, `∂` taken from 2.2 (the only item of the `*Needs:*` line that
   supplies them).

   **Witness.** 2.1–2.2 define `Z_i`, `W_i = ⊕ k(𝒱)^×` and `∂` only for stacks of Convention 1
   (Deligne–Mumford, of finite type); 2.1's last Check says an infinite sum "is no element of a free
   abelian group". Take `Y = ⊔_ℕ 𝔸²`, `X = ⊔_ℕ {0}`, `Y′ = ⊔_ℕ {y = 0}` (allowed by 8.1): `N ×_Y C =
   ⊔_ℕ 𝔸³` is not quasi-compact and `β = (c·ν/η)_{n ∈ ℕ}` has infinitely many nonzero components, so it
   is no element of 2.2's direct sum. For `Y = B𝔾_m × 𝔸¹` the cone lies over a stack that is not
   Deligne–Mumford, where 1.2 defines no function field. The parenthesis cites a source for the
   carrier; no target, supplier section or gap owns it (VirtualFundamentalClass §2.5 at its head names
   no carrier).

   **Repair.** Insert in 8.1, before "Prove:", and delete the parenthesis:

   > For an algebraic stack `𝒴` locally of finite type and quasi-separated over `k` (Convention 1's
   > algebraic stacks; Deligne–Mumford or not, quasi-compact or not), define *smoothCycles* `Z_*(𝒴)` and
   > *smoothRatEquivalences* `W_*(𝒴)`: the groups of families `(z_U)`, one for each scheme `U` of
   > finite type over `k` with a smooth morphism `U → 𝒴`, with `z_U ∈ Z_*(U)`, respectively `W_*(U)`
   > (2.1–2.2), compatible with pullback along smooth morphisms `U′ → U` over `𝒴` (3.1 on cycles; on
   > rational functions the pullback of vistoli1989 lines 934–938), and `∂ : W_*(𝒴) → Z_*(𝒴)` chart by
   > chart (vistoli1989 Lemma 3.3, lines 940–948; kresch1999b Proposition 2.1, lines 205–207, and
   > Remark 2.5, lines 250–256). Prove: `Z_*` and `W_*` are sheaves for the smooth topology on schemes
   > of finite type over `k` (a smooth surjection has sections étale locally, and 2.1's étale descent
   > applies); on a stack of Convention 1 these groups are `Z_*`, `W_*`, `∂` of 2.1–2.2; a closed
   > substack, and a closed subcone of a cone over `𝒴`, has a cycle in `Z_*`; and on a stack that is
   > not quasi-compact an element is a locally finite family, not a finite sum. `W_*(N ×_Y C)`, the
   > cycles and `∂` below are these.

   and change the `*Needs:*` line of 8.1 to begin "VirtualFundamentalClass §§1.5, 2.5;
   gap:normal-cones-of-local-immersions; 2.1, 2.2 and 3.1 (the groups `Z_*`, `W_*` on finite-type
   charts and their smooth pullback); SchemeAndStackFoundations §5.5; …". Add as a Check of 8.1:
   "`Y = ⊔_ℕ 𝔸²` with the plane example on every component: `β = (c·ν/η)_n` is a locally finite family
   with infinitely many nonzero terms, an element of *smoothRatEquivalences* and of no direct sum."
   Tested on the witness: the family is compatible under smooth pullback, its boundary
   `([ν = 0] − [η = 0])_n` is a locally finite cycle, and on each finite-type chart it is 2.2's
   element.

2. **F02** (P3) Convention 6: the witness computes the non-uniqueness group, not the obstruction to lifting

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:226–229`. Quote: "on an elliptic
   curve `C`, `Hom(O_C[1], O_C[2]) = H¹(C, O_C) ≅ k`; so a morphism into `τ^{≥−1}L` is not in general
   the truncation of a morphism into `L`."

   **Claim.** A morphism `E → τ^{≥−1}L` need not lift to `E → L`, witnessed by `H¹(C, O_C) ≠ 0`.

   **Witness.** From the triangle `τ^{≤−2}L → L → τ^{≥−1}L →`, lifting is obstructed in
   `Hom(E, τ^{≤−2}L[1])`; `Hom(E, τ^{≤−2}L)` measures the choice of lift. For `E = O_C[1]`,
   `τ^{≤−2}L = O_C[2]`: the first is `H²(C, O_C) = 0` (every morphism lifts), the second `H¹ ≅ k`.

   **Repair.** Replace the sentence from "Witness for this:" to "morphism into `L`." by:

   > Witness for this: a morphism into `τ^{≥−1}L` does not determine a morphism into `L`, and need
   > not come from one. Two morphisms `E → L` with the same truncation differ by an element of
   > `Hom(E, τ^{≤−2}L)`, and a morphism `E → τ^{≥−1}L` lifts exactly when its image in
   > `Hom(E, τ^{≤−2}L[1])` vanishes. For `E = O[1]` and a complex `O[2]` concentrated in degree `−2`,
   > the first group is `H¹(O)`, which is `k` on an elliptic curve, and the second is `H²(O)`, which
   > is `0` on every curve and `k` on an abelian surface.

   Tested: elliptic curve `H¹ = k`, `H² = 0`; abelian surface `H² = k`; the map
   `Hom(O[1], O[2]) → Hom(O[1], L)` is injective because `Hom(O[1], τ^{≥−1}L[−1]) = 0`.

3. **F03** (P3) Convention 2: the locator does not carry "of finite type"

   **Location.** `packages/VirtualFundamentalClassPartII/README.md:169–170`. Quote: "A *local
   immersion* is a representable, unramified morphism of finite type (kresch1999b lines 232–234)".

   **Claim.** The cited passage defines the class with the finite-type condition.

   **Witness.** kresch1999b lines 232–234 use the term for a representable unramified morphism of
   stacks locally of finite type (line 193), with no quasi-compactness; `⊔_ℕ Spec k → Spec k` is one
   there and not here. The finite-type condition is vistoli1989 lines 499–500.

   **Repair.** "A *local immersion* is a representable, unramified morphism of finite type (vistoli1989
   lines 499–500, there called a local embedding; kresch1999b lines 232–234 uses the word local
   immersion, for morphisms that are only locally of finite type)", and shorten the next sentence to
   "Vistoli's regular local embeddings (vistoli1989 (1.20), lines 503–505) are the regular local
   immersions."

One P2 finding (R01) and two P3 findings (R02, R03). No P1 finding: no statement was refuted, no
cited supplier section or pinned declaration is missing, and the dependency check is clean.

## Dependency check

    depcheck: 248 roadmaps, 2330 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` shows changes only under
`packages/VirtualFundamentalClassPartII/`.

## Verified sound

**Suggested.lean (71 lines, 0 declarations).** Read whole. One `import Mathlib`, no `TauCeti.*`
import, no `set_option`, no `sorry`, no `def`; one module docstring of the required form; empty
namespace `TauCetiRoadmap.VirtualFundamentalClassPartII`. The `#check @name` comparison was not run:
there is no declaration to elaborate, and I ran no Lean. Its three statements about the pins were
checked at the pinned sources: `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`
(`SchPseudofunctor`, `Cat`-valued; the folder has no other file),
`TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean` (`Spaces.IsAlgebraicSpace`),
`TauCeti/AlgebraicGeometry/Chow/` (only `Basic.lean` and `ClosedImmersion.lean`: no flat pullback,
proper pushforward, Chern classes or cones), no `IsAlgebraicStack`, `DeligneMumford` or cotangent
complex of a morphism of schemes in Tau Ceti (grep), higher direct images present under
`TauCeti/AlgebraicGeometry/Cohomology/`. The twelve headline entries match README 2.2–2.3, 4.1–4.3,
5.1, 5.2, 5.3, 5.4, 6.1–6.3, 7.1–7.2, 8.1, 8.2–8.3, 8.4, 9.3–9.5; each needs a stack, a Chow group
of a stack or space, or a derived-category cotangent complex or `Rπ_*`, none of which the pins
have, so none is statable and nothing is padding.

**Pinned declarations of the README (all found).** `AlgebraicGeometry.AlgebraicCycle`,
`AlgebraicCycle.map` (weights: `mapCoeff` returns `f.residueDegree x` when the weights agree, else
`0`), `AlgebraicGeometry.Scheme.ord` (junk value `0` for `f = 0` or coheight `≠ 1`, as the README
says), `Chow.cyclesOfDimension` (points of height `k` for the specialisation order, the dimension of
the closure), `Chow.RatEquiv` (locally finite families), `Chow.ChowGroup`, `Chow.cycleClass`,
`Chow.ChowGroup.equivIntOfUnique`, `Chow.ChowGroup.pushforward`, `PrestableFamily` (proper,
geometrically connected, at worst nodal; base-change stable, syntomic of relative dimension one; no
genus), `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`χ(E) − r·χ(O)`).

**Targets read: 33 (1.1–9.5), every line of the README.** Table of the adversarial pass (values
computed on each side):

| Statement | Instance | Values | Result |
|---|---|---|---|
| Conv. 1 class of stacks | `Bℤ`; `𝔸¹/ℤ`; `L`; `B(S₃)` | diagonal fibre `ℤ` not qc; not quasi-separated; scheme, diagonal immersion; `e = 6` | consistent |
| 1.1 finite cover exists | `B_{𝔸¹}G`, `L → B_{𝔸¹}G` | `Q×_L Q = Q ⊔ Q|_{t≠0} = Q×_{𝔸¹}G`; base change `Q → 𝔸¹` of rank 2; torsor degree 2 vs 1 on a connected separated `X` | no change |
| 1.1 Check, `L` | valuative criterion | two extensions with closed points `0₁`, `0₂` lift to one generic point of separated `Z` | no change |
| 1.2 `e`, `k(𝒱)` | `[𝔸¹/μ₂]`; `[Spec ℂ/(ℤ/4)]`; `B_{𝔸¹}G` | `e = 1`, `k(x²)`; stabiliser of a point of `Spec ℂ⊗ℂ` is `ℤ/2`, `e = 2`, `κ = ℝ`; `e = 2` | no change |
| 1.3 degree formula | `Spec k → BG`; `BG → Spec k`; `ℤ/p`-quotient; `L → B_{𝔸¹}G` | `(|G|/1)·1 = |G|`; `1/|G|`; `(1/p)·p = 1 = p/p`; `(2/1)·1 = 2` | no change |
| 1.3 base-change invariance | `B(ℤ/4) → B(ℤ/2)` along `Spec k` | `(2/4)·1 = 1/2`; fibre `B(ℤ/2)`, `1/2` | no change |
| 1.3 inertia sum | `S₃`; `Bμ₃/ℚ` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3` | no change |
| 2.2 `A_0([𝔸¹/μ₂])` | `P(y) ≠ y` irreducible, possibly inseparable | `k[x]/P(x²) = κ(P)[x]/(x² − ȳ)` reduced for `char ≠ 2`; `div(y) = 2[Bμ₂]`; group `ℤ/2` | no change |
| 2.3 `A_0(L)` | `div(t)` | `ℤ²/ℤ(1,1) ≅ ℤ` | no change |
| 3.1 étale pullback not injective | isogeny `π` of degree 2 | degree `0`, sum `2Q = π̂π(Q) = π̂(P) = O` | no change |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹×BG`, `φ = t`; `𝔸¹_x → [𝔸¹/μ₂]`, `φ = x` | `|G|[0×BG] = |G|·div(t)`; `2[Bμ₂] = div(−x²)` with factor `1` | no change |
| 3.2 dimension drop | Lemma 16.3 on `𝒲 → 𝒲′` | no integral subspace of dimension `dim 𝒲` in `𝒲′`, so the class `0` is the cycle `0` | no change |
| 3.3 push–pull, localisation | `π` against `π`; `Bμ₂ ⊂ [𝔸¹/μ₂]`; two points of `ℙ¹` | `|G|[pt]` both sides; `ℤ → ℤ/2 → 0`; kernel `ℤ(1,−1)` | no change |
| 3.4 exterior product | `K/k` separable, inseparable | `4 = 2 + 2`; `p² = p·p` | no change |
| 3.5 homotopy invariance | `X = 𝔸¹_ℂ/(z ∼ z̄)`, `N = X×𝔸¹` | `A_0(X) = 0` (`div(t) = [0_X]`); `A_1(N) = 0` (preimage of `V(g)` irreducible, order of `g` along `t = 0` is `0`) | no change |
| 3.5 Gysin | `Spec k → BG`, `Y = Spec k`; `z ↦ z²`; non-flat base change | `[G]`, pushforward `|G|[pt]`; `2[pt]`; `[pt]` vs `A_{−1} = 0` | no change |
| 4.1 | `L×B(ℤ/2) → L`; coarse map | `(1/2)[0₁]`; `2·(1/2)[0] = div(y)` | no change |
| 4.2 | `π : Spec k → BG` | `|G|^{−1}·|G|·[pt] = [pt]` | no change |
| 4.2 Check, `X` not a scheme | functions near the point | pull back to `ℝ[z]`-localisation, value at `0` real, residue field `ℂ` | no change |
| 4.3 | `O(−1)` on `ℙ¹`; `L ⊕ L^∨` | `−[pt]`; `c_1 = 0`, `c_2 = −c_1(L)²` | no change |
| 5.1 projection formula | `BG → Spec k` | both sides `(1/|G|)[pt]`; weighted product would give `[pt]` | no change |
| 5.2 | `[𝔸¹/μ₂]`, `M′ = {0}`; `ℤ/p`-quotient | `2·(1/2) = 1`; `p/p = 1 ≠ 1/e` | no change |
| 5.2 injectivity for `M` a space | relation `(N, φ)` | `p_*div(φ) = (1/e(𝒱))·div(φ^{[k(𝒱):k(N)]})`, a nonzero multiple | holds for spaces |
| 5.3 | `ℙ(1,2)` | `c_2 = t·2t`; `{x = 0}` reduced, `Bμ₂`, `∫t = 1/2`; `{y = 0}` trivial stabiliser, `∫2t = 1` | no change |
| 5.4 | `[Spec ℂ/(ℤ/4)]`; `[ℙ¹/μ₂]` | `1/2 = 2/4`; orders `2, −1, 0`, `∫ 2[𝒫] = 1 = ∫[𝒪]` | no change |
| 6.1 `P` | `[0→0]` vs `[O→O]`; `ℙ¹`, `E = [O(−4) → Ω]` | rank `1 = 0+1 = 1+0`; `Hom(E,E) = k²⊕H¹(O(−2))`, homotopies `H⁰(O(−2)) = 0`, `P = O(3)²` | no change |
| 6.2 | `ℙ¹` via `F_1` and via `P`; `𝓛_n` on `L` | `4 = c_1(O(3)²/O(2))`; `n[0₂] = −n[0₁]` | no change |
| 6.3 | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; node × `ℙ¹` | `p[pt]` vs `c_1(O)∩[X] = 0`; `[pt]`; `−[𝔜×pt]` | no change |
| 7.1 | `k[x]/(x²)`, `x ↦ ε` | `(ε + aε²)² = ε² ≠ 0` | no change |
| 7.2 Check 1 | `char 2`, `φ = (0, id)` | `φ^*ω = 0` on the `A[1]` summand; `(x + ax²)² = x²` | no change |
| 8.1 boundary and sign | plane; non-reduced `Y`; `Y′ = Y` | `[ν=0] − [η=0]`, fixed by `ξ ↦ ξ+a`, moved by `η ↦ η+b`; `2[ν=0] − 2[T=0]`; `0` | sign agrees with kresch1999b line 304 (`β = −ω`) |
| 8.2 | node, `V(a+b)`; non-reduced base | `−2[pt×pt]` both; `2[pt]` both | no change |
| 8.3 Check 2 | `X = Z = 𝔜 = pt` | `dim B T_{𝔸¹} = 0`, `dim 𝔸¹ = 1` | no change |
| 8.4 | `x² − by²`; `B = L`; `y² = x^p − a` | count `2`; `2` at `0₁`, `0₂`; `𝔪 = (y)`, Jacobian `(0, 2y)` | no change |
| 9.3 | `ℙ¹ → ℙ^r`; `(L, pr₂)` | `(r+1)(d+1) − 1`; torsors under `H⁰(T, g^*T_L⊗J)` on both sides | no change |
| 9.4 | triangle | `π_*G = π_*H = 0`, cone of `R¹π_*H[−1] → R¹π_*G[−1]` | no change |
| 9.5 | prestable stack; `ℙ²` lines; `ℙ¹×𝔸¹` | `3g−3+n + c + d(1−g) = (1−g)(d−3)+n+c`; `2`; `4` | no change |
| Conv. 6 witness | elliptic curve | `H¹ = k` (uniqueness), `H² = 0` (existence) | R02 |
| 8.1 carrier | `Y = ⊔_ℕ 𝔸²` | infinitely many nonzero components | R01 |

**Checks.** All 139 Check bullets read; the values in the table above were recomputed (about half of the bullets); the others were read against the statements of their sections and no contradiction was found. Every definition has at least three.

**Locators verified against the cached texts.** The README has 147 distinct line locators; the cited lines were opened for every one of them in the twelve readable sources, and each carries the statement cited (R03 apart): vistoli1989 (
(1.5)–(1.7), 1.10–1.17, (1.19)–(1.20) and lines 508–535, (2.1)–(2.5), 582–584, 887–1131,
1151–1207, 1451–1470, 1507–1545, 1594–1750, 1758–1776, 2064–2066, 2109–2112),
behrend-fantechi1997, stacks-chow-spaces, kresch1999b, behrend1997, li-tian1998, edidin-graham1998,
rydh2015, deligne-mumford1969, keel-mori1997, stacks-chow and kresch1999 (Theorem 6.2.1). vistoli1989 lines 963–966 confirm that its Theorems 3.11–3.13 are integral,
as 3.5 uses them.

**Sibling citations checked (every cited section opened).** VirtualFundamentalClass at the head of
its open pull request, read with `roadmaps show`: §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5,
5.1–5.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6, each with the content the README attributes to it
(§2.5: separated test stacks, restricted action `T_{Y′}|_{X′}`, plane example; §7.3: separated with
the resolution property; §9.4–9.5: smooth bases). StackPointsAndResidualGerbes at its head: §§0.1,
0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3, 5.4. SchemeAndStackFoundations on main: §§1.3, 1.9, 1.10,
1.18–1.23, 2.6, 2.10, 2.18–2.20, 3.3, 4.1, 4.14, 5.1–5.6 and 30 declaration names
(`IsRepresentableBySpaces` … `gysin_self_intersection`), including the Checks cited (`𝔸¹/ℤ`,
`z ↦ z²`, non-closed regular immersions). StableReductionPartII §5.15 at its head (the
Edidin–Graham comparison, same hypotheses). EquivariantIntersectionTheory Conventions 1, 4, 5 and
§§2.1–2.2; StableReduction Layers 2–3; EnhancedDerivedSheaves §0.3, E1.4, E1.8;
DerivedModuleAlgebra §§0.7, 0.12, 0.25 (the lifting statement in `Ext¹_B(L_{B/A}, J)` is there);
AlgebraicGromovWittenTheory §§4.1–4.3 at its head (rank and dimension formulas agree).

**Gaps.** `gap:closed-substacks-of-stacks` and `gap:normal-cones-of-local-immersions` are in
`design/plan.json` with supplier VirtualFundamentalClass (§2.1, §1.5) and in the README under
"What VirtualFundamentalClass must provide"; not raised.

**Ownership.** `roadmaps grep` over main and the open heads for integral Chow groups of stacks,
finite covers by schemes, bivariant Poincaré duality, the canonical rational equivalence,
deformation invariance of virtual classes and the degree of a residual gerbe found no second owner
besides the cited VirtualFundamentalClass §2.5. `Suggested.lean` declares no name.

**Policy.** No `lemma`, `set_option`, pull-request number or process word in the README or the Lean
file; every target has a locator.

**Copyright.** Twelve passages put beside their sources (2.1 with vistoli1989 lines 892–894; 1.1
with lines 887–890 and rydh2015 lines 81–85; 3.5 with vistoli1989 lines 1081–1100; 5.2 with lines
542–545 and 1766–1770; 7.1 and 7.2 with behrend-fantechi1997 lines 1067–1078 and 1162–1168; 6.2
with lines 1282–1298; 9.3 with lines 1583–1599; 9.4 with behrend1997 lines 165–187; 8.1 with
kresch1999b lines 334–336; 5.3 with edidin-graham1998 lines 1069–1076; 3.2 with stacks-chow-spaces
lines 726–730; 8.4 with li-tian1998 lines 1472–1474): what is shared is formulas, standard names
and lists of properties (at most seven consecutive words, "finite, finitely presented and
surjective morphism"). Arrangement: vistoli1989 is §1 preliminaries, §2 moduli spaces, §3 cycles
and operations, §4 proof of a lemma, §5 bivariant theory, §6 duality on moduli spaces; the README
puts its §2 and §6 in Layer 5, splits its §3 by integrality into Layers 2–4, has no layer for its
§4, and Layers 6–9 are from other sources: no one-to-one run. No table, figure or example list is
taken over.

Source independence: 12 passages compared with 8 sources, none shared; largest share vistoli1989,
77 of 174 locators; contents compared with vistoli1989: independent.

## Not verifiable

- fulton1998 (Proposition 1.8, §1.10, Chapter 3, Corollary 6.3, Proposition 8.1.1, Proposition
  10.2) and gillet1984 §4: settled as uncertified; the texts were not read.
- The remark in the References that the earlier preprint of edidin-graham1998 numbers the product
  comparison Proposition 11: that version is not in the cache.
- vistoli1989 displays at lines 370, 1000 and 1607–1609 (the general degree formula, the
  pushforward on `W_*`, the covering formula): illegible in the OCR text; the README's formulas were
  checked against the surrounding prose and the worked values, not against the displays.
- 8.1's third and fourth statements (invariance along `T_{Y/𝔅}`) and 8.3's second case are new
  generality with a route; I checked the route's steps and the plane, node and non-reduced
  instances, not a full proof.
- VirtualFundamentalClass and AlgebraicGromovWittenTheory are not among the checkouts listed for
  this job; both were read at their heads through `roadmaps show`.

## Source issues

- **Misprint** in kresch1999b at §3, the paragraph before Theorem 3.1 and Theorem 3.1, p. 10: the source says the acting bundle is the tangent bundle of `Y′`, the arbitrary stack; it should be that of `X`, the smooth regularly immersed stack, as its proof uses; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5, pp. 26–27: the source says the rational equivalence is invariant under the whole restricted tangent bundle of `Y`; it should be only the tangent bundle of the regularly immersed smooth stack; affects the proof; corrected in print at kresch1999b Theorem 3.1 and the sentence after it.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, p. 48: the source says the second Ext group is taken over the structure sheaf of the curve `C`; it should be over that of `T`; affects nothing.
- **Misprint** in behrend-fantechi1997 at Proposition 5.5, p. 40: the source says the cohomology sheaf of `E` in degree `1` vanishes; it should be the one in degree `−1`, as in its Proposition 7.3; affects nothing.

## For the human reviewers

- **Not tested.** vistoli1989, the source with the largest share, was read in an OCR extraction of the GDZ scan; three displays (lines 370, 1000, 1607–1609) are illegible, so wording there was compared from the prose only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "58ced1d4698afd3939233f45dc5ee22278da682f", "job": "RT-VirtualFundamentalClassPartII~1b", "model": "fable", "worker": "chris-x88"} -->
