<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6849289506 -->
Red team round 2 pass a (claude) of 232be19

Verdict: needs_changes

1. **F01** (P2) "compactoid in the sense of LocallyAnalyticDistributions §0.0" cites a notion that section does not define

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:495` ("countable inductive limits of `B_m`-Banach models with injective compactoid transition maps in the sense of LocallyAnalyticDistributions §0.0"); `:720` ("injective compact transition maps, in the compactoid sense of LocallyAnalyticDistributions §0.0"); also `:722`, `:741`, `:743`.

   Claim: LocallyAnalyticDistributions §0.0 supplies compactoid transition maps, and its compact-type definition specializes to `C`.

   Witness: LocallyAnalyticDistributions README line 911–918 and 1136 has only "injective compact transitions over finite K/ℚ_p"; the word compactoid is absent from §§0.0–0.3. Over `C` a relatively compact image of a unit ball is `0` (a nonzero `O_C`-module contains a closed copy of the non-compact `O_C`). The owner is CompactOperators §0.5 on main (`IsCompactoidSet`, `HasCompactoidImage`, its README line 292–303).

   Repair:

   - README:495, replace "with injective compactoid transition maps in the sense of LocallyAnalyticDistributions §0.0" by "with injective transition maps of compactoid image (`HasCompactoidImage`, CompactOperators §0.5), the locally convex inductive limit being that of LocallyAnalyticDistributions §0.0".
   - README:720, replace "with injective compact transition maps, in the compactoid sense of LocallyAnalyticDistributions §0.0" by "with injective transition maps of compactoid image (CompactOperators §0.5); over `C`, which is not locally compact, a map sending the unit ball into a compact set is zero, so the compact maps of LocallyAnalyticDistributions §0.0, stated for finite `K/ℚ_p`, are not the notion used".
   - README:722 and :743, after "LocallyAnalyticDistributions §§0.0–0.2" add "and the compactoid maps of CompactOperators §0.5"; add "CompactOperators §0.5" to the `*Needs:*` of §§2.5, 4.1, 4.2 and to the Dependencies of Layers 2 and 4.
   - Add under `## Exact supplier contracts`: "### From TauCetiRoadmap.CompactOperators — Section 0.5 supplies compactoid subsets of a Banach space over a complete nontrivially normed ultrametric field and maps of compactoid image. Completeness and regularity of the compact-type limit over `C` are proved in §2.5; LocallyAnalyticDistributions states them for finite `K/ℚ_p` only." Add the matching Scope bullet.
   - §4.1 Checks, add the control: "The identity of `C` has compactoid image (rank one) but does not send the unit ball `O_C` into a compact set, since `O_C` is not compact."

   Tested on the witness: with the repaired definition `colim_n C^n` (README:816) is compact type (finite-rank maps have compactoid image), and an infinite-dimensional Banach space is still not (README:737). CompactOperators is on main, so the edge is downward.

2. **F02** (P3) the surjectivity step of §3.7 takes the logarithm of the wrong compatible system

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:683` ("a logarithmic lift in `B₂` of the compatible `X`-roots gives `λ_v = v`").

   Claim: the logarithm of the Teichmüller lift of compatible `p`-power roots of `X` lifts `vX` and has `H_C`-difference `vψ_1`.

   Witness: CN25 line 1102–1103 (p. 23) prints `X_1^♭ = (X_1, X_(1/p), …)`, a slip for `E_1^♭ = (E_1, E_(1/p), …)`. Roots of `X` would lift `log X`; `θ(log[E_1^♭]) = log E_1 = X`, and `(σ−1)log[E_1^♭] = log[ε^(ψ_1(σ))] = ψ_1(σ)t`.

   Repair: replace the sentence by "For the period extension take `ℓ = v̂·log[E_1^♭] ∈ B₂(C̃{X})`, where `E_1^♭ = (E_(1/p^k))_(k ≥ 0)` is the compatible system of roots of `E_1` of §3.1 and `v̂ ∈ B₂` lifts `v`. Then `θ(ℓ) = v·log E_1 = vX`, and `(σ − 1)ℓ = v̂·log[χ_1(σ)^♭] = vψ_1(σ)t` by the definition of `ψ_1`, which is `vψ_1(σ)` under `c ↦ tc`; so `λ_v = v`, which proves surjectivity (CN25 writes `X_(1/p^k)` for `E_(1/p^k)` at this point)." At `p = 2` the same formula holds with `E_1` the fourth root of `exp(4X)`: `log E_1 = X`.

3. **F03** (P3) the sign misprint of Fontaine03 Théorème 6.1 is not noted where it is cited

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:348` ("Fontaine03, Théorème 6.1 and §§6.2–6.5, pp. 355–368; FF18, Preface, Proposition 2.28, p. 23, read with alternating signs"); `:1192` ("the misprint is noted where it occurs").

   Claim: only FF18 needs the correction; Fontaine03 Théorème 6.1 states the alternating Euler characteristic.

   Witness: Fontaine03 line 2882–2887 (p. 355, checked on the cached PDF page) prints the plain sum of the three dimensions equal to `−[K:ℚ_p]h(X)h(Y)`. For `X = Y = ℚ_p` the plain sum is `[K:ℚ_p] + 2`, the README's own Check at :54.

   Repair: at :348 write "(CN25, Theorem 2.6, p. 10; Fontaine03, Théorème 6.1, p. 355, and §§6.2–6.5, pp. 355–368; FF18, Preface, Proposition 2.28, p. 23; the last two print the plain sum and are read with alternating signs, as CN25 Theorem 2.6(ii) states it)".

4. **F04** (P3) §4.14 places the lifts in a value of the functor that does not exist

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:928` ("the space of lifts, which is closed in the Fréchet space `𝐖(C{X})`, and the open mapping theorem makes it a homeomorphism").

   Claim: the rank-zero additive lifts form a closed subspace of `𝐖(C{X})`.

   Witness: a TVS is defined on sympathetic algebras only (README:460) and `C{X}` is not one; README:660 puts lifts in `E(C̃{X})`. CN25 line 1487–1488 (p. 29) uses the middle term of the extension evaluated at the sympathetic closure.

   Repair: replace "which is closed in the Fréchet space `𝐖(C{X})`" by "which is closed in `E(C̃{X})`, the value of the extension `E` at the sympathetic closure, a Fréchet space because it is an extension of the Fréchet spaces `𝐖₂(C̃{X})` by `𝐖₁(C̃{X})` (LocallyAnalyticDistributions §0.2, *Extensions of Fréchet spaces*)". Tested on `W₁ = W₂ = C`, `E = V₁ ⊕ V₁`: `E(C̃{X}) = C̃{X}²`, the rank-zero additive elements are `{(cX, vX) : c, v ∈ C}`, a closed plane, and `ℓ ↦ ℓ(1) = (c, v)` is a bijection onto `C²` between Banach spaces, hence a homeomorphism.

5. **F05** (P3) §6.3 routes an elementary projectivity statement through the v-sheaf comparison

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:1114` ("Prove … `Ext¹_VS(ℚ_p, B_m) = 0` … deduce `lim¹ Hom = 0` and `Ext¹_VS(ℚ_p, B_dR⁺) = 0`. This is a VS statement, obtained from the comparison of §6.2"); `:1116` (`*Needs:* §6.2; LocallyAnalyticDistributions §0.2`); `:1140` ("keeping its Milnor term until the tower proves it zero").

   Claim: the vanishing for the source `ℚ_p` needs the comparison of §6.2 and a Milnor sequence.

   Witness: `C` is initial among sympathetic algebras, so `Hom_VS(ℚ_p, F) = F(C)` for every VS `F`, an exact functor of `F`; the constant `ℚ_p` is projective and `Ext^i_VS(ℚ_p, F) = 0` for `i ≥ 1`. README:888 uses exactly this in TVS (§4.11).

   Repair:

   - §6.3, replace the statement after its first sentence by: "For every VS `F`, evaluation at `1 ∈ ℚ_p` over `C` identifies `Hom_VS(ℚ_p, F)` with `F(C)`, because `C` is initial among sympathetic algebras; this functor of `F` is exact for the pointwise exact structure, so the constant `ℚ_p` is projective in VS and `Ext^i_VS(ℚ_p, F) = 0` for all `i ≥ 1`. In particular `Hom_VS(ℚ_p, B_m) = B_m`, and `Ext¹_VS(ℚ_p, −)` vanishes on `B_m`, `V₁`, `B_dR⁺`, `t^(−k)B_dR⁺` and `B_dR`; no inverse-limit argument is needed (CN25, Lemma 3.26 and proof, pp. 19–20, which derives the `B_dR⁺` case from the tower)."
   - `*Needs:*` of §6.3: "VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*." Delete "§6.2; LocallyAnalyticDistributions §0.2" there and "LocallyAnalyticDistributions §0.2" from the Layer 6 Dependencies.
   - §6.3 Checks, replace the third by: "The same argument fails for the source `V₁`: `Hom_VS(V₁, F)` is not evaluation at an initial object, and `Ext¹_VS(V₁, B_dR⁺) = C ≠ 0` (§6.5)."
   - §6.5 route: replace "For `ℚ_p` and `B_m` use §6.3, keeping its Milnor term until the tower proves it zero" by "For the source `ℚ_p` use §6.3".

   Tested: `F = V₁` gives `Hom = C`, `Ext¹ = 0` (README:1148); `F = B₂ → B₁` surjective on `C`-points, so `Hom(ℚ_p, −)` stays surjective, as exactness requires.

6. **F06** (P3) Layer 0 depends on Layer 1 and Layer 1 on Layer 0

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:278` ("Layer 1, §1.8, for §0.5 (§1.8 needs only §§0.1–0.3 and the parent)"); `:430` ("Layer 0; `CategoryTheory.Abelian.Ext.mapExactFunctor`; …"); `:205` (`*Needs:* §0.4; §0.3; §1.8; …`).

   Claim: the layers are ordered by supply.

   Witness: the two Dependencies paragraphs give the edges Layer 0 → Layer 1 and Layer 1 → Layer 0. The target graph is acyclic (§1.8 → §§0.1–0.3 → none of §0.5), but the theorem that Layer 0 consumes is filed in the later layer.

   Repair (no cited id moves: `roadmaps grep` finds no roadmap citing §1.x of this one; CstConjectureForDaggerVarieties cites §§0.8–0.9, 2.x, 4.2–4.3, 5.x, 6.6–6.7):

   - Move the whole block of §1.8 (statement, route, `*Needs:*`, Checks, unchanged) to the end of Layer 0 as "### 0.10 The fundamental theorem for an extension of a C-line", and leave at its old place the heading "### 1.8 The fundamental theorem (now §0.10)" with the one sentence "The fundamental theorem for an extension of a `C`-line is §0.10; it is used by §0.5 and §1.9."
   - Replace "§1.8" by "§0.10" in README:203, :205 and :409. In :127 move "the fundamental theorem" from the list of what Layer 1 builds to the list of Layer 0, and replace the sentence on §1.8 by "The fundamental theorem §0.10 depends only on §§0.1–0.3 and the parent and is proved before §0.5, which uses it."
   - Layer 0 Dependencies: delete "Layer 1, §1.8, for §0.5 (…)" and add the parent headings *Banach–Colmez morphism calculus* and *Height of torsion period subobjects*. Layer 1 Dependencies: delete those two headings if no other Layer 1 target uses them.
   - `Suggested.lean`: move `fundamental_extension_surjective` under `/-! ## Layer 0 … -/`, delete the then empty Layer 1 header, and write "README §0.10" in its docstring and in the module docstring, whose "two headlines of Layers 0–1" becomes "two headlines of Layer 0".

   After the move the layer edges are Layer 1 → Layer 0 only.

7. **F07** (P3) "The same holds" in §1.1 drops what Théorème D(ii) asserts

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:284` ("The same holds for extensions of finite-length `B_dR⁺`-representations (Fontaine03, Théorème D, pp. 291–292 …)").

   Claim: Théorème D for `B_dR⁺`-representations is the previous sentence with the same conclusion.

   Witness: Fontaine03 line 290–291 (p. 292): for `B_dR⁺`-representation ends, the middle term is a `B_dR⁺`-representation exactly when the sequence is almost split. Read literally, "the same" (an almost `C` middle term) is already a case of part (i), by §0.6.

   Repair: replace the sentence by "For an extension in `B(G_K)` of two finite-length `B_dR⁺`-representations, the middle term is a `B_dR⁺`-representation, for a `B_dR⁺`-module structure making both maps linear and unique by §0.2, if and only if the extension is almost split (Fontaine03, Théorème D(ii), p. 292)." Add the Check: "For `0 → C(1) → B₂ → C → 0` the middle term is the `B_dR⁺`-representation `B₂` and the sequence is almost split with `Z = ℚ_p t`; for `0 → ℚ_p → C → C/ℚ_p → 0` the ends are not both `B_dR⁺`-representations and part (ii) does not apply."

One P2 (S01) and six P3 (S02–S07). No stated theorem, Check or Lean statement was refuted. All twelve round-1 findings are repaired at this head; one repair (b/F03) left a layer-level cycle, raised as S06. No finding re-raises a settled one: the repair report marks none `not actionable in this package`.

## Round 1 findings at this head

| Id | Status | Witness at 232be19 |
| --- | --- | --- |
| a/F01 | repaired | `packages/VectorBundlesAndIsocrystalsPartII/README.md:241` "Colmez12, Théorème 3.1(iii), p. 117"; `sources.toml` Colmez12 locator "Lemme 1.3, pp. 111–112; Théorème 3.1(iii), p. 117". Colmez12 line 290–297 is p. 117. |
| a/F02 | repaired | README:624 defines `Ô = (lim_m O⁺/p^m)[1/p]` (Scholze13 line 982, p. 21); README:695 uses `Ô`; README:706 is the negative control for `O` (Scholze13 line 917, Corollary 3.17(i), p. 20). |
| a/F03 | repaired | README:757, `c₀(I, C)` with `I` uncountable: support of a countably generated subspace is a countable `S`, `e_j`, `j ∉ S`, at distance 1. Recomputed. |
| a/F04, b/F07 | repaired | README:329 (`C(1)`: `(0, Kt′)`, complex `0 → Kt′ → Kt′` with `d₁ = 0`, cohomology `0, K, K`); README:816 (`ℤ_p` on `colim C^n`); README:1176 (`2 = −1 + 3`). 220 Check bullets remain, at least 3 in each of the 62 sections. |
| a/F05 | repaired | README:495 and :507 no longer use "reasonable"; the compact-type class is stated in §2.5 and reused in §2.6. No `*Needs:*` of Layer 2 names Layer 4. The supplier cited for "compactoid" there is wrong: S01. |
| b/F01 | repaired | README:741 (graded pieces `W[t^i]/W[t^(i−1)]`), :759 (`Ĉ` excluded), :858 (§4.9 is the `m = d = 1` case with a route). The dévissage of §4.10 preserves the class: `(W/W[t])[t^i]/(W/W[t])[t^(i−1)] = W[t^(i+1)]/W[t^i]`. |
| b/F02 | repaired | README:241 constructs `ι` as the unique `K`-algebra lift (Colmez12 line 103–109, Lemme 1.3, pp. 111–112, applied with `F = K`); README:250–251 Checks; README:103, :107, :15 cite PadicHodgeTheory §0.3 for finite `K` (its README line 181). |
| b/F03 | repaired, with a new defect | README:203, :205, :278, :127 name §1.8. Layer 0 now lists "Layer 1, §1.8" and Layer 1 lists "Layer 0": S06. |
| b/F04 | repaired | README:286 and :300 "Proposition 5.5, p. 344, and Théorème 5.6, p. 346" (Fontaine03 line 2470, line 2526). |
| b/F05 | repaired | `AlgebraicVectorBundles` does not occur in the README. |
| b/F06 | repaired | README:23 "(Fontaine03, §1.2, p. 289)" (Fontaine03 line 165–168). No `line N` locator remains in the README. |

## Verified sound

Counts: 3 `Suggested.lean` declarations read (whole file, 106 lines); 62 numbered targets and the Conventions read (whole README, 1204 lines); 67 locators opened against the cached texts in this pass (Colmez12 2, Scholze13 2, CN25 52, Fontaine03 11), 66 support the statement as cited (S03 is the exception; S02 is a slip inside a cited proof); 220 Check bullets read, those carrying a value recomputed (table below), none false; 49 sibling citations resolved at the suppliers' current versions; 21 pinned declarations opened at their file and line (19 Mathlib at `1b1ccf4`, 2 Tau Ceti at `2fd255d`), all present.

Dependency check on the package README:

```
depcheck: 206 roadmaps, 1904 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` touches only the package folder (README.md, Suggested.lean, sources.toml and three repair reports).

`Suggested.lean`. No Lean was run (read-only pass); the three elaborated types of the worker's `signatures.md` were compared with the file and the README, and no binder is lost (there is no `variable` line).

| Declaration | Context | Instances and values | Result |
| --- | --- | --- | --- |
| `SemilinearRep` (line 46) | `p` prime, `K` an intermediate field of `PadicAlgCl p / ℚ_[p]`, `W` an additive group, `ℂ_[p]`-module and topological space; real body, three fields | `σ = 1`: `c•w = c•w`. Trivial action on `ℂ_p`, `p` odd, `χ(σ) = a ≢ 1`: `ζ_p` versus `ζ_p^a`; `p = 2`: `i` versus `−i`. `W = 0`: all laws `0 = 0`. `PadicComplex` is an `abbrev` of the completion (Mathlib/NumberTheory/Padics/Complex.lean:137), so `Completion.map σ c` types as `ℂ_[p]`; `σ` is an isometry (`spectralNorm_eq_of_equiv`), so the map is not the junk value of a non-uniformly-continuous function | determines the intended object; the trivial action is excluded |
| `semilinearRep_equivariant_map_smul` (line 62) | `[FiniteDimensional ℚ_[p] K]`, both `Wᵢ` finite-dimensional with `IsModuleTopology`, `f` additive and continuous | `W₁ = 0`: `0 = 0`. `C → C`: equivariant maps are `K`. `C → C(1)`: `H⁰ = 0`. Equals Fontaine03 line 213–217 (Théorème A, p. 290) | true as typed, at the README's generality (§0.2, first half) |
| `fundamental_extension_surjective` (line 85) | `E` complete normed over `ℚ_[p]`, `ρ` jointly continuous, `V` finite-dimensional, `finrank W = 1`, `q` continuous additive surjective with `ker q = V`, `η` continuous linear equivariant, `range η ≠ η(V)` | `V = 0`: `q` is a continuous bijection of Banach spaces, `E ≅ W`, `η` is `C`-linear and nonzero, kernel `0 = dim V`. `E = V ⊕ C`, `η = (g, 1)`: kernel the graph of `−g`, dimension `h`. `η = (g, 0)`: `range η = η(V)`, excluded. `V = E` impossible (`W ≠ 0`). Equals Fontaine03 line 1816–1820 (Théorème 4.1, p. 329) | true as typed |

Headlines (README:3): Fontaine's full faithfulness (stated for `C`; the `B_dR⁺` half named in the docstring), duality (docstring), the fundamental theorem (stated), the disc isomorphism, qBC full faithfulness and the height–rank formula (docstring, each with the missing carrier). No padding: one structure and two theorems, neither a one-tactic consequence of the library. The three names occur in no other roadmap (`roadmaps grep --lean-only`).

Adversarial pass (statement; instances; values; result):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, `χ⁽¹⁾` | `p = 3`, lifts `u`, `−u`; `p = 2` | `exp(log u) = exp(log(−u))`; `log(−1) = 0`, values in `1 + 4ℤ_2`, `−1 ∉ 1 + 4ℤ_2` | consistent |
| Conventions, Euler sign | `X = Y = ℚ_p`; `X = C/ℚ_p`, `Y = ℚ_p` | `1 − (n+1) + 0 = −n`; `0 − 1 + (n+1) = n = −n·(−1)·1` | alternating sum; S03 for the source |
| §0.1 | `T(x)_n = p^n x_n` on `c₀` | image dense, `(p^n)` has no preimage, cokernel not Hausdorff, so not an object | not a conflation |
| §0.4, §0.5 | `ℚ_p`, `C`, `C/ℚ_p`, `C ⊕ ℚ_p` (two presentations); `C(1) → B₂ → C` | `(0,1)`, `(1,0)`, `(1,−1)`, `1 = 2 − 1`; `2 = 1+1`, `0 = 0+0` | additive |
| §0.8 lift `ι` | `K = ℚ_p`, `√p`; `p = 2`; a ring lift moving one transcendental by `t` | two simple roots in a domain; `X² − 2` separable; the modified map is defined on `ℚ(T)` (nonzero elements have nonzero `θ`-image), extends by Hensel, differs at `x` by `t` | unique only as a `K`-algebra map; Colmez12 Lemme 1.3 with `F = K` gives it for every perfect residue field (Colmez12 line 137–138) |
| §0.9 | `(N,k) = (1,1)`; `j < k`; `k < ℓ` | `K`; `κt^k = 0` forces `κ = 0`; identity survives at `k = ℓ` | agrees with CN25 line 496–528 |
| §1.1 | `B₂`, `Z = ℚ_p t` | `U₁ ∩ t²B_dR⁺ = 0`, `U₁ ∩ tB₂ = ℚ_p t`, `U₁/ℚ_p t ≅ C` splits | holds; S07 for the second sentence |
| §1.3, §1.4 | `C`, `B₂`, `C(1)`; wrong sign | `(K,0)`, `(K,Kt′)`, `(0,Kt′)`; cohomology `K,K,0`; `0,0,0`; `0,K,K`; composite `(1 − χ⁽¹⁾(γ)²)t′γz ≠ 0` | signs as in CN25 line 445–449 |
| §1.6 | `(k,j) = (1,0), (1,1), (2,1)`; ranges | `(1,1,0)`, `(0,1,1)`, `(0,0,0)`; `W_(0) ≠ 0` iff `1 ≤ j ≤ k`, `W_(1) ≠ 0` iff `0 ≤ j ≤ k−1` | README's corrected range holds |
| §1.7 | `N = 1`, `i = 1`, `j = 2`; general twist `r ≤ i−1 ≤ j−2` | both generalized-invariant lines nonzero, `t′` an isomorphism, acyclic | holds |
| §1.8 route | `η(E)` finite-dimensional | `W → C ⊗ (η(E)/η(V))` is `C`-linear with image in `1 ⊗ F`, which contains no `C`-line | image `0`, so `η(E) = η(V)` |
| §2.1, §2.6 | bicartesian square; `c₀(I, −)` on Fréchet | `F₀ = (E₀ ⊕ F₁)/E₁` gives `F₀/F₁ ≅ E₀/E₁`; null sequences lift along open maps of metrizable spaces | holds |
| §3.1 | `a = 1`, odd `p`; `p = 2` | `χ_(1/p^k)(σ) = ζ_(p^(k+1))^c`, `ε^ψ` has `k`-th term `ζ_(p^k)^ψ`, so `ψ_1 = c/p`; `c/4` at `p = 2` | `κ = pψ_1`, `κ = 4ψ_1` in §3.4 |
| §3.2 | `p = 3`, `n = 0`; `n ≥ 1`; `p = 2` | valuations `k−1−v_p(k!) ≥ 1` for `k ≥ 2`; `1 − 1/p^n + 1/p^(n+1) ≥ 1/p`; `Y_n² + 2^(1−1/2^n)Y_n = Y_(n−1)`, exponent `≥ 1/2` | holds |
| §3.4 | valuations; degrees; `(1+cX)^(1/p)` | `0,1,2,2,4,5`; `0,2,3,5,5`; `6,3,18` and `2,2,4`; coefficient valuation `s_p(k)/(p−1)` at `v(c) = p/(p−1)` | holds |
| §3.5 | `f = c`; `f = YZ`; `k = p^r m` | `u = −c`; `u = X²/2`; one carry, `v_p(binom(k, p^(r−1))) = 1`; `H²` of the additive group in characteristic 0 vanishes, so no symmetry hypothesis is missing | holds |
| §3.7 | `B₂`, lift `v̂ log[E_1^♭]` | `θ = vX`, difference `vψ_1(σ)t` | class 1; S02 for the wording |
| §3.8 | `a = p`; `a = 2` at `p = 2` | `χ_p^♭ = (χ_1^♭)^p`, `ψ_p = pψ_1`; `ψ_2 = 2ψ_1` | coboundary is 0 for these `a` |
| §4.2, §4.9, §4.10 | `c₀(I, C)`, `Ĉ`, `B₃` with `d = 2` | in the class; out (dual 0: a nonzero functional would make the one-dimensional quotient `C` spherically complete); lengths `2, 2` | class separates as intended |
| §4.4, §4.15 | `m = 1`, `d = 2`, `w = 1` | `(B₃ ⊕ C)/{(t²c, −c)} ≅ B₃`, killed by `t³` not `t²` | holds |
| §4.5 | `U_n = Σ_(i ≤ n) p^(i−n)B_i` | increasing (`p^(i−n−1)B_i ⊃ p^(i−n)B_i`), covers `W` (`p^(−k)B_j ⊂ U_(j+k)`), preimages are subgroups by the cocycle law | route holds |
| §4.11 | `ℚ_p` source | `Hom(ℚ_p, F) = F(C)`, exact | projective; the same in VS, S05 |
| §4.13 | `d = 1`, `W = C` | `C → C` identity, `Ext¹(U_1, C) = 0`; Hom is an extension of `t^dW` by `W[t^d]` | CN25 line 1414–1415 |
| §5.2 | `C/ℚ_p`; `U_1/ℚ_p t_x`; `B₂/ℚ_p^h` | restriction is inclusion of `t`-torsion; unit `t_x`; a unit `v` kills only 0 | agrees with CN25 line 1421–1431 and the parent's *Canonical curvature filtration* |
| §5.5 | `LA → C⁰` | `Mes → D` injective, `Ext¹(C⁰, ℚ_p) = 0` by Hahn–Banach over `ℚ_p` | agrees with CN25 line 1044–1052 |
| §6.4, §6.5 | `V₁`, `C/ℚ_p` | `lim Hom(V₁, B_m) = 0` (zero transitions), `lim B_m/t = C`; `0 → 0 → B_dR → Ext¹ → 0`, rank 1 | holds |
| §6.7 | `ℚ_p`, `C`, `C/ℚ_p`, `ℚ_p² ⊕ (C/ℚ_p)³`; general presentation | `1 = 1+0`, `0 = 0+0`, `0 = −1+1`, `2 = −1+3`; `rk h(W) − dim F₁ + dim F₂ − rk Ext¹ = 0` | holds |
| gap:G-HOM | `W = ℚ_p`; torsion sources | trivial (`1 ↦ b`); parent's *VS Hom vanishing from torsion period modules* treats torsion sources only and names the missing bounded-image step | precise, minimal, same slug in `design/plan.json` and README:99 |

Sibling citations resolved at current heads: all 18 Layer 5 headings of VectorBundlesAndIsocrystals, with the Artinian statement, the curvature dictionary and the fundamental sequences this README uses; PadicPeriodRings §§1.1, 1.2, 1.5, 2, 4.1, 4.3 (general-base `H⁰`, the embedding `K → B_dR⁺`); PadicHodgeTheory §0.3 (its line 181) and §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; ArithmeticGaloisRepresentations §1.1; ArithmeticGaloisDuality §§R02.1.3, R02.2.1, D7.4; LocallyAnalyticDistributions §0.0 and the four named targets of §0.2, with the finite-`K` restriction of its compact-type extension theorem as README:111 says; PerfectoidTowers §P9.6 and its three named targets, with the hypotheses README:123 repeats; PerfectoidSpaces P1, P3, P6 on main; CohomologyComparisons §§4.8–4.11 and CstConjectureForDaggerVarieties, both later in the merge order and named as consumers only. All suppliers are on main or earlier in the merge order.

Ownership: almost `C`-representations, TVS, period Pairs, qBC and the height functor occur in no roadmap on main and in no open roadmap except as citations of this one (`roadmaps grep`). The embedding `K̄ → B_dR⁺` has PadicHodgeTheory §0.3 as owner for finite `K` and this roadmap for the general base.

Policy: no pull-request number or process word in the README or docstrings; no `lemma`, `set_option`, `#eval`; every target has a locator; `sources.toml` has no local path.

## Not verifiable

- FF18, Fontaine04, Colmez02, Schneiders99, LeBras18, TVS25 and AnschutzLeBras25 were not reopened in this pass; their locators were verified in round 1 and the cited sentences are unchanged at this head.
- §3.4: the uniform bound on normalized traces, the Mittag–Leffler step and the almost-purity bookkeeping of the three-step route. The numbers and the use of PerfectoidTowers §P9.6 were checked, not the estimates.
- §2.6 for compact-type models (exactness of `c₀(I, −)` on strict sequences of compact type) and §4.8 (vanishing of `lim¹` for non-nuclear separable Fréchet spaces): stated as this roadmap's targets; no source proves them and no counterexample was found.
- §§6.2 and 6.4: the passage from the sheaf-side results to VS is this roadmap's own target.
- Lean elaboration was not run in this pass.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show`; of the suppliers only CstConjectureForDaggerVarieties and PadicPeriodRings have checkouts on this worker.

## Source issues

- **Misprint** in Fontaine03 at Théorème 6.1, printed p. 355: the source says the plain sum of the dimensions of the three extension groups equals minus the degree times the two heights; it should be the alternating sum; affects a stated result.
- **Misprint** in Fontaine03 at Théorème 6.1, printed p. 355: the source says each extension space "equals zero is finite-dimensional"; it should say only that it is finite-dimensional and vanishes from degree three on; affects nothing.
- **Misprint** in CN25 at proof of Proposition 4.10, printed p. 23: the source says the logarithmic lift uses a compatible system written with the letter of the disc coordinate; it should be the compatible roots of the exponential series `E_1`; affects nothing.
- **Misprint** in CN25 at Remark 4.15(ii), printed p. 25: the source says the group cohomology equals pro-étale cohomology of the structure sheaf; it should be the completed structure sheaf, the uncompleted one having zero first cohomology on an affinoid; affects a stated result.
- **Gap** in CN25 at Remark A.2, printed p. 58: the source says the dual of the spherical completion vanishes as a consequence of a non-splitting it only conjectures; it should argue directly, a nonzero functional making the base field a quotient of a spherically complete space; affects nothing.
- **Gap** in CN25 at Lemma 4.9, printed p. 23: the source says the root tower of the exponential of `pX` is integral and perfectoid for every prime; it should use the exponential of `4X` at `p = 2`, where the stated series does not converge on the closed disc; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.19, printed p. 26: the source says the closed subgroup is a sum of rescalings of the same ball; it should rescale the ball of the `i`-th step in the `i`-th summand; affects nothing.
- **Misprint** in CN25 at Lemma 4.24(i), printed p. 28: the source says the first extension group from the fundamental space into a reasonable Module is the model; it should be zero, as its proof concludes; affects a stated result.
- **Gap** in CN25 at Proposition 4.22, printed p. 27: the source says the comparison holds for every reasonable module with no separability, while the base case it invokes assumes separable spaces; it should restrict the graded pieces or supply the nonseparable base case; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "232be19fe30c267386db377269b8688a7e384dc3", "job": "RT-VectorBundlesAndIsocrystalsPartII~2a", "model": "fable", "worker": "chris-x17"} -->
