# Review of VirtualFundamentalClass (pull request #1996 at f5c3e22)

**Verdict:** needs changes

## R01 (P2) — §1.5 builds normal cones of closed immersions only; §§1.6, 2.4, 2.5 and 9.6 use local immersions

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:406`: “Extend their formation to representable closed immersions of algebraic spaces and stacks by smooth descent.” Line 509 (§2.4): “Extend refined Gysin pullback to representable regular local immersions of Deligne–Mumford stacks using Layer 1”.
**Claim:** A local immersion (representable, unramified, of finite type) need not be a closed immersion, so the normal cone, the normal bundle and the deformation space that §§1.6, 2.4, 2.5, 5.1 and 9.6 use have no owner in Layer 1.
**Witness:** `Spec k → BC₂` and the diagonal `BC₂ → BC₂ × BC₂` are regular local immersions of codimension 0 and are finite of degree 2, not closed immersions. Vistoli1989 lines 499–527 (pp. 623–624) builds `C_{F/G}` for local embeddings by descent.
**Repair:** In §1.5, after the quoted sentence, add: “Define a local immersion as a representable unramified morphism of finite type. For a local immersion `X → Y` of algebraic stacks locally of finite type over `k`, choose atlases `U → X`, `V → Y` with a compatible closed immersion `U ↪ V` and descend `C_{U/V} ↪ N_{U/V}` to `C_{X/Y} ↪ N_{X/Y}` (Vistoli Lemma 1.19 and (1.20), pp. 623–624; Kresch Lemma 4.1, p. 13, for the charts). Prove the closed immersion `C_{X′/Y′} ↪ C_{X/Y} ×_X X′` under base change, an isomorphism for flat base change, and that `C_{X/Y}` is a vector bundle for a regular local immersion.” Add the Check: “For `Spec k → BC₂` the normal cone is the rank-zero bundle on `Spec k`, although the map is not a closed immersion.”

## R02 (P2) — §9.5 states functoriality by reference to a source, at a generality §2.5 does not supply

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1246`: “State and prove relative compatibility through a morphism of transitivity triangles and the corresponding functoriality theorem under the smoothness hypotheses of Prop. 7.5.”
**Claim:** The hypotheses are not written. Those of the source's Prop. 7.5 allow `Z′`, `Z` smooth over a base `Y` that is only pure-dimensional; then `Z′`, `Z` are not smooth, and §2.5 (lines 529–533) proves tangent invariance only for immersions of smooth stacks. §8.3, which §9.5 needs, also assumes smooth bases.
**Witness:** `Y = {xy = 0} ⊂ 𝔸²`, `Z = Y × 𝔸¹`, `Z′ = Y × {0}`: both smooth over `Y`, neither smooth over `k`. BehrendFantechi1997 lines 1721–1736 (p. 51) put no smoothness on `Y`; lines 1645–1646 allow pure-dimensional `Y`.
**Repair:** Replace the sentence with: “Let `E`, `F` be perfect obstruction theories for `X`, `X′` over `Y`, let `v : Z′ → Z` be a local complete intersection morphism of `Y`-stacks with finite unramified diagonal over `Y`, and let `X′ = X ×_Z Z′`, with both classes defined by §9.2. Call `E`, `F` compatible over `v` when there is a morphism of distinguished triangles from `u^*E → F → g^*L_{Z′/Z} →` to `u^*L_{X/Y} → L_{X′/Y} → L_{X′/X} →`. Prove `v^![X/Y, E]vir = [X′/Y, F]vir` when `v` is smooth, and when `Y` is smooth over `k` and `Z′`, `Z` are smooth over `Y` (Behrend–Fantechi Prop. 7.5, p. 51; the source also allows singular `Y` in the second case, which is outside this roadmap).” In end goal 5 (line 63) write “regular-immersion base change and functoriality over smooth bases”.

## R03 (P3) — §7.3's comparison maps go the wrong way for the smooth pullbacks it invokes

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1042`: “The resulting two-term complex maps to both presentations by chain quasi-isomorphisms. Use the induced smooth pullbacks and zero-section Gysin compatibility to prove equality”.
**Claim:** A chain quasi-isomorphism `K• → F•` dualizes to `F₁ → K₁`, which is smooth only when `F₀ → K₀` is surjective. The source's argument needs an epimorphism `K₁ → F₁`, that is, maps out of the given resolutions.
**Witness:** `X = Spec k`, `E = 0`, `F• = 0`, `K• = [k = k]`: `K• → F•` is a quasi-isomorphism and `F₁ → K₁` is the origin `0 ↪ 𝔸¹`, not smooth. BehrendFantechi1997 lines 1310–1317 use `F• → K•` and `α : K₁ → F₁` smooth.
**Repair:** Replace lines 1039–1043 by: “Represent the derived isomorphism between the dual complexes `[F₀ → F₁]` and `[H₀ → H₁]` by a roof. Resolve its apex by a complex of finite-rank vector bundles in degrees `≤ 1` and truncate to degrees `[0,1]`; the degree-zero cokernel is locally free by Tor amplitude. Add the contractible summands `[F₀ = F₀]` and `[H₀ = H₀]`. The resulting `[K₀ → K₁]` maps to both dual complexes by chain quasi-isomorphisms surjective in each degree, so `K₁ → F₁` and `K₁ → H₁` are smooth and pull `C(F•)`, `C(H•)` back to `C(K•)`. Conclude by `0_{K₁}^! α^* = 0_{F₁}^!`”. Add the witness as a Check.

## R04 (P3) — §8.4 assumes a compatibility datum over the graph that the source does not construct

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1146`: “For the graph factorization construct the intermediate theory and verify both comparison triangles before composing pullbacks.”
**Claim:** The datum over `Γ_v` needs a lift `g^*Ω_{Y′} → F` of `g^*Ω_{Y′} → g^*L_{Y′/Y}`. Its obstruction `g^*Ω_{Y′} → g^*L_{Y′/Y} → u^*E[1]` is known to vanish only after mapping to `u^*L_X[1]`. No target proves it vanishes.
**Witness:** BehrendFantechi1997 line 1497 asserts the compatibility with no argument. The kernel of `Ext¹(g^*Ω_{Y′}, u^*E) → Ext¹(g^*Ω_{Y′}, u^*L_X)` is the image of `H¹(X′, T_{Y′} ⊗ K)`, `K = fib(u^*E → u^*L_X)` in degrees `≤ −1`; it is zero on affine `X′` only.
**Repair:** Replace the sentence with a stated target: “Prove that the composite `g^*Ω_{Y′} → g^*L_{Y′/Y} → u^*E[1]` of the datum over `v` vanishes étale locally on `X′`, where the lift `g^*Ω_{Y′} → F` is then unique. Form the rational equivalence of §8.3 for the regular immersion `Γ_v` on such charts and glue it by §2.5's invariance and smooth base change; no global compatibility datum over `Γ_v` is used.”

## R05 (P3) — The pullback, product and coherence theorems of §§7.6, 8.2–8.5 and 9.4 are named but not stated

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1142`: “Factor a morphism between smooth bases through its graph and a projection to obtain the full Behrend–Fantechi functoriality statement”. Line 1155 (§8.5): “Prove compatibility with products, composition of compatible squares”. Line 1078 (§7.6): “Prove the product formula for external sums”.
**Claim:** Layer 8 never writes the identity it proves, and §8.5 does not say what composition asserts. §9.4 calls the bases “smooth over the common base”, which Prop. 7.2 does not have, and omits the hypotheses on `X′`.
**Witness:** `grep 'v^!'` on the README finds only line 1226 (§9.3). BehrendFantechi1997 lines 1428–1435 (pp. 42–43) state `v^![X,E] = [X′,F]` for `v` smooth, or `Y′` and `Y` smooth; lines 1668–1670 (p. 49) give Prop. 7.2's hypotheses.
**Repair:** Add these statements.
- §7.6: “For `(X,E)` and `(Y,F)` as in §7.3, `E ⊞ F → L_{X×Y}` is a perfect obstruction theory resolved by the external sum of the two resolutions, and `[X×Y, E⊞F]vir = [X,E]vir × [Y,F]vir` in `A_{rk E + rk F}(X×Y)_ℚ`.”
- §8.2–§8.4: “For a cartesian square `X′ → X` over a local complete intersection morphism `v : Y′ → Y`, `E` and `F` compatible over `v`, and both `(X,E)`, `(X′,F)` as in §7.3, prove `v^![X,E]vir = [X′,F]vir` for `v` smooth (§8.2), for `v` a regular local immersion of smooth stacks (§8.3), and for `Y′`, `Y` smooth (§8.4) (Behrend–Fantechi Def. 5.8 and Prop. 5.10, pp. 41–44).”
- §8.5: “For squares over `v : Y′ → Y` and `w : Y″ → Y′` with data over `v` and over `w`, each in a case of §8.4, `(v∘w)^![X,E]vir = [X″,G]vir`, from `(v∘w)^! = w^! v^!`; no datum over `v∘w` is asserted.”
- §9.4: “For `v : Y′ → Y` a representable regular local immersion of smooth algebraic stacks of constant dimension, and `X′` separated, of finite type, Deligne–Mumford, with the resolution property, prove `v^![X/Y,φ]vir = [X′/Y′,u^*φ]vir` (Behrend–Fantechi Prop. 7.2(2), p. 50).”

## R06 (P3) — Targets without a locator, and one locator into the wrong place

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:325`: “Prove that quasi-coherent modules agree under these comparisons and that the equivalences commute with pullback and atlas restriction.” Also §§2.3, 2.4, 4.2 (definitions), 5.2, 6.2 and 8.1; line 118 reads “as in Behrend–Fantechi §1”.
**Claim:** These sections state theorems or definitions with no source locator. The standing conventions are in the source's unnumbered “Notations and Conventions”, not in its §1.
**Witness:** BehrendFantechi1997 lines 165–170 (p. 5) precede the heading of §1 at line 178. Lemma 3.8 is at line 969 (p. 29), and the obstruction cone at lines 1143–1149 (p. 34). Stacks Project Tag 07B1 is the lisse-étale comparison.
**Repair:** Add:
- §1.1: “(Stacks Project, Tag 07B1)”.
- §2.4: “(Vistoli (3.10)–(3.13), pp. 638–639, and Lemma (3.20))”.
- §4.2: “(Behrend–Fantechi Defs. 1.9, 1.11 and 1.12 and Prop. 1.10, pp. 14–15)”.
- §5.2: “(Behrend–Fantechi Lemma 3.8, p. 29)”.
- §6.2: “(Behrend–Fantechi, Note after Def. 4.4, p. 34)”.
- §8.1: “(Behrend–Fantechi Def. 5.8, p. 41)”.
- Line 118: “as in Behrend–Fantechi, Notations and Conventions, p. 5”.
- §2.3: a locator for homotopy invariance and Chern classes on Deligne–Mumford stacks in a text that proves them; Vistoli1989 line 99 (p. 614) calls them routine and gives no proof.

## R07 (P3) — §3.3 cites Webb for every morphism; the cited passage treats representable morphisms

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:616`: “For the construction by smooth descent use Laumon–Moret-Bailly, *Champs algébriques*, §17, and the simplicial étale construction in Webb, … Appendix B, Example B.8 and the paragraph following it.”
**Claim:** The paragraph recalls the cotangent complex of a representable morphism of algebraic stacks. §3.3 needs `L_{Y/k}` for an Artin stack `Y` and `L_{X/Y}` for non-representable morphisms of relative Deligne–Mumford type.
**Witness:** Webb2022 (arXiv v2, where the example is B.3.1) line 1915 takes `f` to be a representable morphism of algebraic stacks. `B𝔾_m → Spec k` and `BC₂ → Spec k` are not representable.
**Repair:** Write: “For representable morphisms the simplicial étale construction is recalled in Webb, Appendix B, Example B.8 and the paragraph following it. For the remaining morphisms in scope, `L_{Y/k}` of an algebraic stack and `L_{X/Y}` of relative Deligne–Mumford type, use the chart formula above with Laumon–Moret-Bailly §17.” Give Webb an entry in References.

## Previous findings

- R01: repaired. Lines 529–533: “For a regular local immersion `Y′ ↪ Y` of smooth Deligne–Mumford stacks and `X′ = X ×_Y Y′`, prove invariance under `T_{Y′}|_{X′}`”; the computed Check is at line 546.
- R02: repaired. Lines 1222–1227: “let `v : Y′ → Y` be representable and flat of pure relative dimension. Assume that `Y′` is pure-dimensional and that `X′` is separated, finite type, Deligne–Mumford and has the resolution property”; negative Check at line 1233.
- R03: partly repaired. §6.6 (lines 972–976) states the characterization at `p ∈ X(k)` with Lemma 4.6 and Prop. 4.7; the locators of §§1.6, 4.5, 6.5 and 7.7 are at lines 427, 756, 954–955 and 1086–1087. The replacement citation in §3.3 covers representable morphisms only (R07).
- R04: repaired. §2.2 states its hypotheses (lines 480–485); the Checks are at lines 491–492, 505, 518, 545–546, 579, 813, 1064, 1093, 1125 and 1146–1149; §7.2 has API bullets (lines 1025–1026); lines 664, 834 and 1166 now compute values.
- R05: repaired. Lines 215–222 name the Tau Ceti declarations, and lines 232–235 read “Its L1A–L2B refer to the Tau Ceti declarations above.” The description reads “and Tau Ceti’s relative Spec and vector-bundle APIs”.
- R06: repaired. Line 890: “*Needs:* §§3.1–3.4, 4.4–4.5, 5.1.”; line 873: “Layers 0, 1, 3 and 4.”; lines 669–670 add §1.10 and §0.20.
- R07: repaired. Line 13: “a separated Deligne–Mumford stack of finite type over a field”; line 51: “separated and of finite type over `k`”.
- R08: repaired. `Suggested.lean` lines 10–21 name each end goal with its README section and source.
- R09: repaired. Lines 1322–1325 link the two consumers by folder and name §§2.1–2.3, 2.5 and Layer 9; line 242 links DerivedDeRhamCohomology by folder.
- R10: repaired. Lines 98–101: “Layer 2 owns the integral Edidin–Graham groups … The comparison with the rationalized Edidin–Graham groups is outside this roadmap’s scope.”

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §1.1 site comparison | Citations SchemeAndStackFoundations §§1.10, 1.22 on main | Headings at README:3085 and 3797 | Stacks Tag 07B1: `g^{-1}`, `g_!` inverse equivalences on quasi-coherent modules | True; no locator: R06 |
| §1.5 normal cones | `Spec k → BC₂`; diagonal of `BC₂` | Finite of degree 2, unramified, codimension 0 | §1.5 covers closed immersions only | Unowned for local immersions: R01 |
| §1.6 smooth ambient | Origin, `Y′ = 𝔸² → Y = 𝔸¹` | `T_{Y′/Y}|_0`, `C_{X/Y′}`, `C_{X/Y}` of dimensions 1, 2, 1 | `1 + 1 = 2`; BF Prop. 3.1, Lemma 3.2 at lines 762–780 (p. 23) | Holds; locator correct |
| §2.5 tangent invariance | Origin in `𝔸²`, `Y′ = {t=0}` | `∂β = [n=0] − [b=0]`, `β = c·n/b` | `a ↦ a+1` fixes it; `b ↦ b+1` gives `c·n/(b+1)` | Matches Kresch1999 lines 321–336 after renaming |
| §4.2 cone stacks | `[C/0]`; trivial action; `[F₁/F₀]` | `C`; `C × BE`; relative dimension `rk F₁ − rk F₀` | BF Prop. 1.13 at line 515 (p. 15); fibre products at line 477 | Correct; definitions lack locators: R06 |
| §5.3 intrinsic cone | `I = (x², xy) = x·(x,y)` | `gr_I = (A/I)[T₁,T₂]/(yT₁ − xT₂)`; fibre at origin `𝔸²`, on the line `𝔸¹` | Two components of dimension 2 = `dim 𝔸²`; `C = N` | Correct; BF Cor. 3.9, Def. 3.10 at lines 972–984 (p. 29) |
| §6.1 obstruction theory | `id`; `Ω ⊕ V[1] → Ω`; `k^{(∞)}[1] → 0` on a point | `h⁰` iso and `h⁻¹` onto in the first two; coherence fails in the third | BF Def. 4.4 line 1139 (p. 34), Thm. 4.5 line 1162 (p. 35) | Correct |
| §6.2 obstruction cone | `E = L_X ⊕ L[1]` on a smooth curve | `𝔈 = BT_X × L∨` | Cone `BT_X × 0`, pure of dimension 0 | Correct; no locator (BF lines 1143–1149): R06 |
| §6.5 global resolutions | Line bundle; `[K = K]` summand | `[0 → L]`; rank unchanged `r + k − k` | BF Def. 5.2 line 1282 (p. 38); Prop. 5.7 line 1366 (p. 41); Prop. 7.2 line 1682 (p. 50) | Correct |
| §7.1 resolved cone | Point; `𝔸¹` canonical; `Ω ⊕ V[1]` | `pt`; `F₁ = 0`, `C = 𝔸¹` of dimension `rk F₀ = 1`; `im(F₀ → F₁) = 0` | BF lines 1286–1296 (p. 38); line 1363 (p. 40) | Correct |
| §7.3 independence | `F• = 0`, `K• = [k = k]` on a point | Dual map `F₁ → K₁` is `0 ↪ 𝔸¹` | BF uses `K₁ → F₁` smooth (line 1317) | Statement true; route direction: R03 |
| §7.4 public class | Dual numbers in `𝔸¹` | `F• = [𝒪 → 𝒪]`, `C = N = F₁`, `0^![F₁] = [X] = 2[pt]` | Adding `[K = K]`: same class by §7.3 | Correct |
| §7.6 lci and product | `X ↪ M` regular; two zero loci | `C(F•) = N_{X/M} = F₁`, class `[X]`; ranks add | BF example line 1321 (p. 39); Prop. 5.7 (p. 41) | True; formula unstated: R05 |
| §8.4 graph factorization | Conic `C ⊂ ℙ²`; lift over `Γ_v` | Ranks `1`, `−1`, `−2` of `Ω_C`, `L_{C/ℙ²}`, `Ω_{ℙ²}|_C[1]`; `1 − 2 = −1` | Obstruction in `Ext¹(g^*Ω_{Y′}, u^*E)`, killed only in `Ext¹(g^*Ω_{Y′}, u^*L_X)` | Check correct; step unproved: R04 |
| §8.5 coherence | `i : pt ↪ 𝔸¹`, canonical theories | Triangle `k → F → k[1]` forces `F = 0`; class `[pt]` | `i^![𝔸¹] = [pt]` | Example correct; statement vague: R05 |
| §9.3 flat base change | `B𝔾_m → Spec k`, `X = Spec k`; field extension | `X′ = B𝔾_m`, not Deligne–Mumford; excluded by the hypotheses | BF Prop. 7.1 line 1676, Prop. 7.2(1) line 1688 (p. 50) | Correct |
| §9.4 regular base change | README against BF p. 49 | “bases smooth over the common base” | BF lines 1668–1670: `Y`, `Y′` smooth of constant dimension | Wording and `X′` hypotheses: R05 |
| §9.5 relative functoriality | `Y = {xy=0}`, `Z = Y×𝔸¹`, `Z′ = Y×0` | `Z`, `Z′` smooth over `Y`, singular over `k` | §2.5 invariance: smooth stacks only | Exceeds supplied input: R02 |
| End goal 1 | `k[x]/x² ⊂ 𝔸¹` | `dim C_{U/M} − rk T_M = 1 − 1` | `0`; BF Thm. 3.11 line 985 (p. 29) | Correct; not statable |
| End goal 2 | Zero theory of a point pulled back to `𝔸¹` | `H⁰`: `0 → 𝒪` | Not an isomorphism (§6.4 Check) | Correct; not statable |
| End goal 3 | `s = 0` in `𝒪(1)` on `ℙ¹` | `n = 1 − 1 = 0` | `c₁(𝒪(1)) ∩ [ℙ¹] = [pt]`; BF Prop. 5.6 | Correct; not statable |
| End goal 4 | `H⁻¹(E)=0`, `H⁰` free; char 2 dual numbers | README hypothesis excludes `E = [𝒪 →0 𝒪]` | BF prints `h¹(E•) = 0` at line 1354 | README correct; misprint below |
| End goal 5 | `pt → B𝔾_m`; identity of `{xy=0}` | `d + n = −1 + 1 = 0`, class `[pt]`; `d + n = 1 + 0`, class sum of the axes | BF lines 1664–1667 (p. 49) | Correct; functoriality scope: R02 |
| End goal 6 | §7.4 | Class from the existence of a resolution | No stack carrier at the pins | Not statable; docstring names it |
| §3.3 cotangent complex | `pt → B𝔾_m`; Webb's passage | Triangle `k[−1] → 0 → k → k` | Webb2022 line 1915: `f` representable | Check correct; citation scope: R07 |
| §2.2 operations | `q : BC₂ → pt`, `p : pt → BC₂` | `q_*[BC₂] = ½[pt]`; `p^*[BC₂] = [pt]` | `p_*[pt] = 2[BC₂]`, and `q_*p_* = id`; Vistoli (3.6) line 974 (p. 635) | Correct |
| §6.6 curvilinear | `k[x]/x² ⊂ 𝔸¹`, `p = 0` | `N_p = (I/mI)∨ = k`, `C_p = k` | BF Lemma 4.6 line 1227 (p. 36), Prop. 4.7 line 1243 (p. 37) | Correct |

- Source locators checked against the text: 31. BehrendFantechi1997 (arXiv v1): pp. 5, 14–15, 20–23, 26, 29–31, 34–44, 49–52. Kresch1999: pp. 7, 10–13. Vistoli1989 (GDZ scan, OCR): pp. 614, 620, 623–624, 632–635, 638–639, 650–651. Webb2022 (arXiv v2): Appendix B.3. Stacks Tag 07B1.
- Library declarations opened at the pins: 13. Tau Ceti `relativeSpec` (`RelativeSpec/Functor.lean:219`), `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`), `relativeSpecBaseChangeIso` (`RelativeSpec/BaseChange.lean:272`), `gradedRelativeSpecEquiv` (`RelativeSpec/Graded.lean:79`), `gradedSymmetricAlgebra` (`Modules/Quasicoherent/GradedAlgebra/SymmetricAlgebra/Basic.lean:110`), `SchPseudofunctor` (`Stack/Basic.lean:37`), `IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`), `ChowGroup` (`Chow/Basic.lean:295`), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean:211`), `toAlgebraicCycle` (`WeilDivisor/Scheme/Basic.lean:75`), `FiniteLocallyFreeSheaf`, `GeometricVectorBundle`, `IdealSheafData.blowup`.
- Cross-roadmap citations resolved on main: 18. SchemeAndStackFoundations Layers 1 and 5, §§1.10, 1.18, 1.22, 4.5, 5.1, 5.5; AlgebraicVectorBundles Layers 1–3 and L1A–L2B (README:346–369); DerivedModuleAlgebra §§0.1, 0.4, 0.17, 0.25; EnhancedDerivedSheaves §0.3, E1.8; DerivedDeRhamCohomology §§0.20, 5.8; EquivariantIntersectionTheory Layer 2.
- Gate: the worker's gate is `OK` with every check at 0, including `build=0`. Nothing changed outside the folder.
- Dependency check: `depcheck: 264 roadmaps, 2581 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file has 0 declarations, so the `#check @` comparison and the one-tactic probes have nothing to test. None of the six end goals is statable at the pins, and the docstring names each.
- Pull-request text: the title and the prose agree with the head; no sentence is contradicted.
- Overlap check: read VirtualFundamentalClassPartII, StableReductionPartII, MotivicStructuresInModuliOfCurves, StackPointsAndResidualGerbes, EquivariantIntersectionTheory, SchemeAndStackFoundations, SchemeKTheoryOperations; rational Chow groups of separated Deligne–Mumford stacks and the Behrend–Fantechi class: this roadmap, the others cite it; integral groups of `[U/G]`: EquivariantIntersectionTheory. The files of AlgebraicGromovWittenTheory were not given and were not checked.
- Source independence: 11 passages compared with 4 sources, none shared (longest common run 5 words, in a dimension count); largest share BehrendFantechi1997, 28 of 40 locators; contents compared with BehrendFantechi1997: independent (Layer 4 merges its §§1–2, Layers 7–8 split its §5, its §6 is absent, Layers 0–3 are not from it; the order of Layers 4–9 is forced by the *Needs:* lines of §§5.1, 6.1, 7.1 and 9.1).

## Not verifiable

- Fulton1998, *Intersection Theory*: paywalled; uncertified, and the README gives no locator beyond “Chapters 1–6”.
- Illusie, *Complexe cotangent et déformations I*, III Cor. 3.1.3 (§3.4): paywalled; matched only through BehrendFantechi1997 line 946.
- LaumonMoretBailly2000, *Champs algébriques*, §17 (§3.3): paywalled; the locator was not checked against the text.
- Webb's published numbering: Example B.8 was matched to arXiv v2 Example B.3.1 through the published article's list “Examples 3.1, B.3, B.4, and B.8”; the published appendix itself was not read.
- Olsson, *Sheaves on Artin stacks* (2007), the likely source for the non-representable case in R07: no legal copy found.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the intrinsic-cone sequence is short exact for every local complete intersection morphism; it should assert this for smooth morphisms only, since for `x+y+z` on the three axes the image misses `(1,1,1)`; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of the intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has `C = N`; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.5, p. 26: the source says Vistoli's rational equivalence is invariant under the whole restricted tangent bundle of the ambient; it should claim invariance along the immersed smooth stack only; affects the proof; corrected in print at Kresch, Theorem 3.1, p. 10.
- **Gap** in BehrendFantechi1997 at Proposition 5.3, p. 39: the source says both resolutions may be taken to map to `E•` by chain maps; it should replace the derived isomorphism by a roof of vector-bundle complexes, which needs the resolution property; affects the proof.
- **Gap** in BehrendFantechi1997 at Proposition 5.10, p. 44: the source says `F` is compatible with `Ω_{Y′} ⊞ E` over the graph; it should construct the lift `g^*Ω_{Y′} → F`, whose obstruction vanishes only after mapping to `u^*L_X[1]`; affects the proof.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says `h¹(E•) = 0`, automatic in amplitude `[−1,0]`; it should say `h⁻¹(E•) = 0`; affects a stated result.
- **Misprint** in BehrendFantechi1997 at Example 7.6, p. 52: the source says the zero section of `g*N_{Y/X}`; it should say `g*N_{Y/W}`; affects nothing.
- **Misprint** in Kresch1999 at Theorem 3.1, p. 10: the source says the group is `T_{Y′}|_{X′}` with `Y′` the arbitrary stack; it should say `T_X|_{X′}`, the tangent bundle of the immersed smooth stack; affects a stated result.

## For the human reviewers

- **Scope.** The board package VirtualFundamentalClasses (merge order line 433, before this roadmap at 442) plans the same rational Chow theory and Behrend–Fantechi class; its `review.json` of 2026-11-10 is `needs_changes`. One of the two must own these objects.
- **Scope.** The merge order lists the consumers StableReductionPartII (343) and VirtualFundamentalClassPartII (344) before this roadmap (442).
- **Licence.** Webb's article is read from arXiv 2109.03377v2; the README links the publisher DOI 10.1017/fms.2022.61, whose host the sources service could not classify.
- **Not tested.** VirtualFundamentalClassPartII (`README.md:379–402` at its head) declares two gaps on this roadmap's §§1.5 and 2.1; R01 covers the first, and the second (integral closed substacks without separatedness in §2.1) was not reviewed here.
