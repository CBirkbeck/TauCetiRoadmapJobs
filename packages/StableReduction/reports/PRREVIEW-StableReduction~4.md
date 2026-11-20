# Review of StableReduction (pull request #2669 at d56ae5b)

**Verdict:** needs changes

**Summary.** This head repairs every finding of the previous review, but four new findings need changes. §2.5 now plans base change, affine charts and Veronese invariance for Tau Ceti's `relativeProj`, which SchemeAndStackFoundations §0.3 on main already plans for the same declaration. §2.2 claims the genus is constant in every proper flat family; this fails without `H⁰(X_s, 𝒪) = κ(s)`. §5.3's criterion for a prestable model leaves out properness. The Summary's description of rational tails and bridges counts some stable curves as unstable. There are also three small corrections and one format note. Two points are left for the human reviewers: the licence of the Knudsen II copy, and the fact that no roadmap owns the curve–Jacobian criterion that the Néron roadmap takes from Layer 7.

## R01 (P2) — §2.5 plans base change, the affine-chart comparison and Veronese invariance for Tau Ceti's `CategoryTheory.CommMon.relativeProj`, and SchemeAndStackFoundations §0.3 on main already plans them for the same declaration

As things stand, one Tau Ceti declaration has two planned copies of its base-change and chart API, and an implementer cannot tell which statement is the target. §2.5 (lines 473–480) names `CategoryTheory.CommMon.relativeProj A` as the carrier and asks to "prove its base change along `S' → S`, its functoriality in `A`, … and connect the affine charts to Mathlib's `Proj`". §3.9 (line 748) proves that a Veronese subalgebra has the same relative `Proj`. SchemeAndStackFoundations on main states `relativeProj_affine_iso`, `relativeProj_baseChange` and `relativeProj_veronese` for that same `CategoryTheory.CommMon.relativeProj` (`TauCeti/AlgebraicGeometry/RelativeProj/Basic.lean:221`), in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 799–827. Its `relativeProj_eq_stableReduction` (line 834) compares that construction with "StableReduction's relative Proj", which after this revision is the same declaration. AlgebraicVectorBundles on main (README line 157) also says relative Proj belongs to both roadmaps. The pin has no base-change theorem for `relativeProj`; `RelativeProj/` holds only the chart squares, properness and twisting sheaves. So both plans are still open. This revision adds the base-change clause; the description lists it among the additions.

SchemeAndStackFoundations consumes Layers 0–4 here (its README lines 99–111), so this roadmap cannot cite its §0.3 without creating a cycle. The consistent repair is to keep these statements here. Under Scope and ownership (line 1723, "the remaining relative `Proj` API"), say that this roadmap owns base change, the affine-chart comparison and Veronese invariance of `CategoryTheory.CommMon.relativeProj`. Say also that SchemeAndStackFoundations §0.3 should cite §§2.5 and 3.9 for them; its comparison `relativeProj_eq_stableReduction` then holds by definition.

## R02 (P2) — §2.2 asserts that the genus is invariant and locally constant in every proper flat family; this needs the fibre hypothesis `H⁰(X_s, 𝒪) = κ(s)` that the next sentence assumes

An implementer cannot prove the target as written. §2.2 (lines 405–409) asks for the genus's "invariance in a proper flat family, and the locally-free-rank description: arithmetic genus is locally constant on the base", with no hypothesis on the fibres.

A counterexample: twisted cubics `(t² − 1, t³ − t, at)`, `a ≠ 0`, each a copy of `ℙ¹` with `h¹ = 0`. The flat limit at `a = 0` has ideal `(z², xz, yz, y² − x²(x + 1))`: the plane nodal cubic `Y` with an embedded point `P` at the node. The sequence `0 → κ(P) → 𝒪_{X₀} → 𝒪_Y → 0` gives `h⁰(𝒪_{X₀}) = 2` and `h¹(𝒪_{X₀}) = h¹(𝒪_Y) = 1`. So `dim H¹` jumps from `0` to `1` in a proper flat family of curves, and `R¹f_*𝒪` is not locally free of constant rank. The statement holds when `H⁰(X_s, 𝒪_{X_s}) = κ(s)` for every `s`. Then `R¹f_*𝒪_X` is finite locally free and commutes with base change (Stacks Lemma 109.9.3, stacks-0E6N lines 437–443).

The repair is to put the hypothesis of the following sentence (geometrically connected and geometrically reduced fibres, or `H⁰(X_s, 𝒪) = κ(s)` for all `s`) on the invariance and local-constancy clause, citing Stacks Lemmas 109.9.3–109.9.4 (tags 0E1J, 0E6K).

## R03 (P2) — §5.3's criterion for a prestable model omits properness, so as written it covers models that are not prestable

§5.3 (lines 951–953) asks to prove that "a model whose special fibre is geometrically reduced and connected, with geometrically smooth components and only ordinary nodes after algebraic closure, is a prestable model". By Convention 11, properness is "a separate predicate on models". The route the sentence names, `TauCeti.Model.prestableFamily_toBase_iff` (`Curves/StableReduction/Model/Prestable.lean:69`), has `M.IsProper` on its right-hand side. Remove one closed point of the special fibre from `ℙ¹_R`. The result is a model of `ℙ¹_K` (flat, finitely presented, quasi-compact) whose special fibre `𝔸¹_k` meets every listed condition. It is not prestable because it is not proper. The repair is to write "a proper model whose special fibre …".

## R04 (P2) — The Summary defines rational tails and bridges through the normalization of a component; that counts a rational component with a self-node as a tail and so rules out some stable curves

The overview is the first definition of stability a reader meets, and it disagrees with §1.5 and with the literature. Lines 10–11 say a stable curve is "free of rational tails and bridges (components with normalization `ℙ¹` meeting the rest of the curve in one point, or in two)".

Glue a rational curve with one self-node to a smooth genus-one curve at one point. The rational component has normalization `ℙ¹` and meets the rest in one point, so the Summary calls it a tail. Yet the curve is stable by §§1.5 and 3.2:
- the rational component carries three branches above nodes, so its log-canonical degree is `−2 + 3 = 1`;
- the elliptic component has degree `2 − 2 + 1 = 1`;
- the genus is `1 + 0 + b₁ = 2`, with `b₁ = 2 − 2 + 1 = 1`.

Stacks requires a rational tail or bridge to have genus zero (Algebraic Curves, Examples 53.23.1 and 53.24.1, stacks-0C58 lines 2633–2638 and 2754–2758), and the nodal rational component has genus one. The repair is to write "(smooth rational components meeting the rest of the curve in one point, or in two)".

## C01 — Eight of the fifteen sampled targets, and §2.8, carry no locator, although sources I read state most of them

Without a locator a reader cannot check the hypotheses at the source. These are the locators I verified:
- §2.2 (line 402): Stacks Lemmas 109.9.3–109.9.4 (tags 0E1J, 0E6K).
- §2.8 (line 531), the question of the previous review: SGA 1, Exposé VIII, Proposition 7.8 (sga1 line 6972). It gives effective fpqc descent for quasi-compact schemes with a relatively ample invertible sheaf, by descending the graded algebra and taking `Proj`, which is the route of §2.8.
- §3.5 (line 657): Stacks Lemmas 53.26.1–53.26.3 (tags 0E67–0E69) for the absence of vector fields; markings act as fixed points as in Lemma 53.26.1(3).
- §4.1 (line 787): Stacks Lemma 31.33.13 (tag 02NS).
- §8.4 (line 1232): Stacks Lemma 53.24.6 (tag 0E3Q) for the pluricanonical `Proj`, and Lemmas 109.23.4–109.23.5 (tags 0E8A, 0E8B) for uniqueness and base change.
- §9.5 (line 1368): Knudsen II, Theorem 2.7, p. 179. Properness of the stack of stable pointed curves covers nodal generic fibres.
- §11.2 (line 1562): Behrend–Manin, Definition 1.9, p. 6.
- §10.3 (line 1477) cites "Fulton–Pandharipande, the stability condition" without a section. It is their §1.1, over `ℂ`; Behrend–Manin, Definition 3.2(3), p. 14, states the condition over any field.

§§0.1 and 1.4, and the two citations of Liu (Layer 4 introduction, and the adjunction formula of §5.3 at line 948), have no locator, and I found none I could verify.

## C02 — §6.4 names the bound `dim Pic(T)[ℓ] ≤ g` as its combinatorial input, but the argument it cites needs the sharper bound by the topological genus, which the pin also has

With only the bound by `g`, an implementer cannot close the argument. The Stacks argument (stacks-0CDN lines 3918–3933) uses `dim Pic(T)[ℓ] ≤ g_top` for the minimal type `T` of the minimal model. Together with the embedding `(ℤ/ℓ)^{2g − g_top} ⊂ Pic((X_k)_red)[ℓ]`, the bound `dim_k H¹((X_k)_red) + g_geom(X_k/k)` and `g ≥ dim_k H¹ ≥ g_top + g_geom`, this forces equality, and hence `mᵢ = 1`. From `≤ g` one gets only `g ≤ dim_k H¹ + g_geom`, which forces nothing. The needed statement is Tau Ceti's `NumericalType.IsMinimal.finrank_torsion_le_topologicalGenus_of_lt` (`Curves/StableReduction/Picard/Torsion/Genus/Basic.lean:57`, for `ℓ > 768g − 768`). Naming it in the sentence at line 1057 and in the *Needs:* line would make the route complete.

## C03 — §8.5 attributes the finite separable extension to Deligne–Mumford, Corollary 2.7, which gives a finite algebraic extension

At line 1255, deligne-mumford line 679 has "a finite algebraic extension L of K", with the stable curve over the integral closure of `R` in `L`. The separable form at one place, which §8.5 states, is Stacks Theorem 109.24.3(1) (tag 0E98, stacks-0E6N lines 1446–1450). Layer 8's introduction already links it, and citing it here as well would support the statement as written.

## N01 — §3.2 links the sections 0E6X and 0E73, whereas the equivalences it states are Stacks Lemmas 109.21.1 and 109.21.3 (tags 0E6Y, 0E70) and Lemma 109.22.1 (tag 0E74).

## Earlier findings

The previous review raised three findings, four small corrections, three format notes and one question:
- R01 (one-place Lean headline): **repaired**. Both Lean theorems now quantify over every prime `P` of the integral closure lying over `𝔪_R`, through `TauCeti.FiniteDVRExtension.of` (`Suggested.lean` lines 85–94 and 115–124).
- R02 (§6.4 without a `K`-rational point): **repaired**. Line 1052 has "a `K`-rational point", with Lemma 55.11.7 for the smooth `k`-point of multiplicity one.
- R03 (blow-up Checks, Layer 0 example): **repaired**. "`k`-rational closed point" appears in §§4.1, 4.3 and 5.1; §§5.3 and 6.1 refer back to §4.3; Layer 0 has "for `n ≥ 1`".
- C01 (§6.2 Betti number): **repaired**. The bound now has the form of Stacks Lemma 53.18.6, with the nodal special case.
- C02 (locators): **repaired** for §§4.3, 4.5, 5.2, 5.3 (genus formula), 6.1, 8.6, 3.10 (Knudsen II Proposition 2.1, p. 174) and 9.4 (Theorem 2.7, p. 179). Liu's adjunction formula remains without a locator (C01 here).
- C03 (owner of the Deligne–Mumford criterion): **repaired**. Line 1805 says that this roadmap does not supply the criterion that Néron §6.14 uses.
- C04 (description): **repaired**. §6.4 and the Acknowledgements move are now in the description.
- N01–N03: **repaired**. §§1.1, 1.2 and 8.1 now link lemmas; the Lean file has the Layer 5 and Layer 7 section comments; the Summary and References no longer say the roadmap follows the Stacks Project's organization.
- The question on §2.8's source is answered by SGA 1, VIII, Proposition 7.8 (C01).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 normalization sequence | split node `xy = 0` | cokernel `(k[x] × k[y])/(k[x,y]/(xy)) ≅ k`, length one, not `k²` | true; no locator (C01) |
| §1.4 genus formula, Checks | two components one node; cycle of `r`; empty graph | `pₐ = g₁ + g₂`; `b₁ = r − r + 1 = 1`; `0 + 1 − 0 = 1`, excluded by `vertexNonempty` (`DualGraph/Basic.lean:109`) | true; no locator (C01) |
| §2.2 genus in families | twisted cubics to a nodal cubic with an embedded point; two disjoint lines | `h¹`: `0 → 1`, `h⁰`: `1 → 2`; `1 − χ = −1 ≠ 0` | invariance needs `H⁰ = κ(s)` (R02); χ-form true |
| §3.2 semistable and stable | cycle of `r` lines; elliptic–bridge–elliptic; genus 2 with tail | `deg ω = 0`; bridge `0`, ends `1`, `pₐ = 2`; tail `−1` | matches stacks-0E6N l. 982–985, 1061–1062, 1095–1099 |
| §3.5 automorphisms | `(ℙ¹; 0,1,∞)`, `(ℙ¹; 0,∞)`, `(E, O)` | trivial; `t ↦ λt`; orders 2, 4, 6 in characteristic not 2, 3 | true; locator (C01) |
| §4.1 blowups projective | `ℙ¹_R` at a `k`-rational point | `E² = −1`, `deg 𝒪(1)|_E = 1`, `deg 𝒪(E)|_E = −1` | true; Stacks 31.33.13 (stacks-divisors l. 3835–3839) |
| §4.3 and §5.3 Checks | `C + E + 2F` | rows `−2+0+2`, `0−2+2`, `1+1−2`; kernel `(1,1,2)`; `F² + deg ω = −2` | true |
| §4.5 contraction | `T₁T₂ − πT₀²` | `L·(L₁+L₂) = 0` gives `L² = −1`; chart `t₁t₂ = π` regular | matches stacks-0C2M l. 2047–2051, 2227–2232, 2327–2328 |
| §5.1 and `exists_regular_proper_model` | `C = ∅`; `ℙ¹_K`; `H⁰ = K` not needed | empty model; `ℙ¹_R`; Lemma 55.8.3 has no `H⁰` hypothesis | true, not padding (stacks-0CDN l. 2818–2819, 2853–2854) |
| §5.3 prestable model | `ℙ¹_R` minus a closed point of `X_k` | special fibre `𝔸¹_k` reduced, connected, smooth; not proper | needs "proper" (R03) |
| §5.4 Check | `T₁² + T₂² − πT₀²` over `ℝ[[π]]` | blow-up at node: `E² = −1`, `C'² = −4 ≠ −2` | true; Example 55.15.1 (stacks-0CDN l. 3806–3812) |
| §6.1 numerical type | `C+E+2F`; `T₁T₂ − πT₀²`; `ℙ¹_{K₂}` over `K` | `g(T) = 0`; `0` vs floor `1`; `−1` vs `dim H¹ = 0` | true with `H⁰ = K` (stacks-0CDN l. 3192–3209) |
| §6.2 torsion bound | 53.18.6 hypotheses | `ℓ` invertible in `k`, `X` proper of dimension at most one | matches stacks-0C58 l. 1725–1728 |
| §6.4 numerical conclusion | inequalities with `≤ g` vs `≤ g_top` | `g ≤ h¹ + g_geom` only; with `g_top` all three equal | true; route input (C02) |
| §7.3 bound | `g = 2` | `768g = 1536`; primes 1543, 1549; `B₂ = 2·(1549⁴)!` | matches stacks-0CDN l. 3943–3945, 3964–3967 |
| §7.4 every place | genus 0, 1, ≥ 2 | `ℙ¹` at each place; 55.18.1(2)–(3) every maximal ideal | true |
| `exists_hasNodalReduction` | vacuity of `∀ P`; one-tactic probe | a prime over `𝔪_R` exists (integral extension); no pinned lemma beyond genus 0 | true, not padding |
| `exists_hasNodalReduction_of_two_le_genus` | hypotheses vs eq. 55.18.0.1 | `hℓ'` fixes the second prime; `2g − 2 ≥ 2`, no ℕ-junk | true |
| §8.1 canonical contraction | genus-2 `C₀` with `E`, `T₁`, `T₂` | `E: −2+3 = 1`, `Tᵢ: −1`; then `E: −1` | matches stacks-0C58 l. 2720–2727, 2888–2894, 2955–2962 |
| §8.2 auxiliary sections | Behrend–Manin §3 | Case I adds tails étale locally; Case V uses Proposition 3.10 | matches behrend-manin l. 668–711, 858–883 |
| §8.4 tail-free families | genus 2 with tail `T` | `deg ω|_T = −1`, `ω^m` not globally generated | true; locator (C01) |
| §8.5 stable reduction | DM Corollary 2.7 vs Stacks 109.24.3 | DM: finite algebraic `L`; Stacks: separable `K'`, one place | true; locator (C03) |
| §9.5 nodal generic fibres | stable nodal fibre, normalized | each component stable with its branch flags; glued by clutching | true; locator (C01) |
| §10.4 Checks | Frobenius; exponent 2 | trivial `Aut`, `∂/∂t` killed; `−2 + 2 = 0` | true |
| §11.2 decorated graph | nodal rational, `d = 0`, 0 or 1 marking; `d ≥ 1` | `0` vs `−1`; `1` vs `0`; `−2 + 3 > 0` | matches behrend-manin l. 226–228 |
| §2.5 relative `Proj` | SchemeAndStackFoundations §0.3 on main | same `CommMon.relativeProj`; `relativeProj_baseChange`, `_affine_iso`, `_veronese` | two owners (R01) |
| Summary gloss of tails | elliptic curve with nodal rational component | gloss: tail; §1.5: three branches, degree `1`, `pₐ = 2`, stable | false gloss (R04) |
| Summary: stable maps | finite `Aut` and ampleness | contracted unstable component gives `𝔾_m`; degree `≤ 0` there | true |
| Layer 6 examples | `w = (2,2)`, `(1,2)`; one component `w = 2` | `ℤ` vs `ℤ ⊕ ℤ/2`; `(−2,1)` vs `(−2,2)`; `g = −1` | true |

- Source locators checked against the text: 57 (stacks-0CDN 19, stacks-0C58 7, stacks-0E6N 9, stacks-0C2M 4, stacks-0E9Z 2, stacks-0A26 1, stacks-divisors 1, knudsen-ii 4, behrend-manin 5, deligne-mumford 3, fulton-pandharipande 1, sga1 1).
- Library declarations opened at the pin: `TauCeti.HasNodalReduction` (`NodalReduction.lean:58`), `TauCeti.FiniteDVRExtension` (`DVRExtension/Basic.lean:85`), `TauCeti.Model.prestableFamily_toBase_iff` (`Model/Prestable.lean:69`), `NumericalType.finrank_torsion_le_arithmeticGenus` (`Picard/Torsion/Genus/Basic.lean:116`), `IsMinimal.finrank_torsion_le_topologicalGenus_of_lt` (`:57`), `DualGraph.firstBetti`, `arithmeticGenus` and `logCanonicalDegree` (`Curves/DualGraph/Basic.lean:312`, `:327`, `:359`), `RelativeProj/` (no base-change theorem).
- Cross-roadmap citations resolved on main: JacobianChallenge §§A.1, A.3, B.1–B.4, C.1–C.2, D.1, D.5, E.2, E.7; Néron §§2.8, 3.1, 3.8, 3.9; EllipticCurves `ReductionSymbol` (line 865); AlgebraicVectorBundles (line 157); SchemeAndStackFoundations §0.3 (lines 799–840). Open: StableReductionPartII and AlgebraicGromovWittenTheory cite Layers 0–3 and 8–11, all present.
- Automatic checks: all passed. Dependency check: `depcheck: 196 roadmaps, 2170 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside `TauCetiRoadmap/StableReduction/`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the three `sorry` warnings. The `#check @` output of the three theorems shows no lost binder and agrees with §§5.1, 7.3 and 7.4, so nothing changed. The one-tactic probe was decided by reading: no pinned declaration concludes `HasNodalReduction` beyond genus zero or gives a regular model.

Overlap check: read AlgebraicGromovWittenTheory (open), SchemeAndStackFoundations (main and its open revisions), JacobianChallenge (main), StableReductionPartII (open), AnalyticStableMaps (main) and GromovWittenTheory (main). Moduli stacks of stable maps and their properness belong to AlgebraicGromovWittenTheory, which consumes Layers 9–11. Stack-level clutching and `M̄_{g,n}` belong to StableReductionPartII, which consumes the scheme clutching of Layer 3. The Picard and cohomology foundations belong to JacobianChallenge (J-A1 to J-E). Pseudoholomorphic stable maps belong to AnalyticStableMaps, a different object. Relative `Proj` base change, affine charts and Veronese invariance have two owners, this roadmap and SchemeAndStackFoundations §0.3 (R01). No roadmap owns the curve–Jacobian criterion.

Source independence: 57 locator passages were compared with 12 sources, and the whole README with 8 of them by shared word runs. Nothing is shared beyond phrases the mathematics forces; the longest run is 13 words (§7.2 against stacks-0CDN lines 3962–3963, "either a smooth genus one curve or a cycle of rational curves"). The largest share of locators is stacks-0CDN (Stacks Chapter 55), about 31 of about 84. Contents compared with stacks-0CDN (lines 8–27): independent. Layers 4–6 reverse that chapter's order (§55.3–55.7 before §55.8), as §6.1's dependence on §5.3 forces; §§7.1–7.3 follow the genus split of §§55.15–55.17, which the three cases of Theorem 55.18.1 force.

Research link: Layers 7–9 state the stable reduction theorems of Artin–Winters (1971) and Deligne–Mumford (1969, Corollary 2.7). These are the inputs to properness of `M̄_g` (Deligne–Mumford 1969) and of `M̄_{g,n}` (Knudsen 1983, Theorem 2.7). Layers 10–11 are the stable-map foundations of Behrend–Manin (1996) and Fulton–Pandharipande (1997), which AlgebraicGromovWittenTheory consumes. This rests on the README and the sources I read.

## Not verifiable

- Liu, *Algebraic Geometry and Arithmetic Curves*: a paywalled book, cited without a locator (Layer 4 introduction, §5.3 adjunction formula).
- Artin–Winters, Topology 10 (1971): paywalled, cited without a locator.
- Mumford–Fogarty–Kirwan and Gieseker: background for a route the roadmap does not take; not fetched.

## Source issues

- **Misprint** in stacks-0CDN at Sections 55.16 and 55.17, printed pp. 55 and 57 (lines 3821, 3907): the source writes "a finite separable extension K′/K of such that", with a stray "of"; it should read "a finite separable extension K′/K such that"; affects nothing.
- **Misprint** in stacks-0CDN at Section 55.17, printed p. 57 (lines 3906, 3914): the prime is first chosen with `ℓ > 768g` and then assumed with `ℓ ≥ 768g`; it should be `ℓ > 768g` both times (harmless, since `768g` is composite); affects nothing.
- **Misprint** in stacks-0E6N at Lemmas 109.21.3(2)(c) and 109.21.4(2)(c), printed p. 24 (lines 1062, 1085): for a curve `X` over a field the source writes `ω^{⊗m}_{X_s}`; it should be `ω^{⊗m}_X`; affects nothing.

## For the human reviewers

- Licence: Knudsen II was read from the sources cache, an OCR text of the PDF at journals.msp.org (Math. Scand. article 1622). The sources service classifies that host in no licence class.
- Ownership: NeronModelsAndSemistableAbelianVarieties on main takes the curve–Jacobian criterion from StableReduction Layer 7 (README lines 99, 469, 4524, 4600). This README (line 1805) says it does not supply it. No roadmap on main or in the open pull requests owns it.
