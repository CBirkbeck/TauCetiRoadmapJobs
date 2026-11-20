# Review of StableReduction (pull request #2669 at efe1819)

**Verdict:** accepted

**Summary.** A full second reading of this head finds no statement that is false or unsupported at its source, so the roadmap is accepted. There are four small corrections, none blocking: two statements (§2.2 and §5.2) leave to context a hypothesis that the neighbouring text has just relaxed, §11.7 asks for a criterion it does not state, the affine comparison of §2.5 is already at the pin, and two Checks of §2.2 need characteristic not 2. Two points are left for the human reviewers: the licence class of the Knudsen II copy, and the relative `Proj` statements that SchemeAndStackFoundations §0.3 on main still plans.

## C01 — Two statements leave a hypothesis to context just after the text has relaxed it: dimension at most one in §2.2, and `H⁰(C, 𝒪_C) = K` in §5.2

An implementer who transcribes the hypotheses as listed gets a false statement in each case.

In §2.2 (line 414) the equivalence is stated "for `f` proper, flat, with geometrically connected and geometrically reduced fibres". The list repeats "proper, flat" from the definition of a family of curves and drops relative dimension at most one. For a K3 surface over a field these hypotheses hold, `R¹f_*𝒪 = 0` is locally free of rank `0` and `dim H¹ = 0`, but `χ(𝒪) = 2 ≠ 1 − 0`. Writing "for a family of curves `f` with geometrically connected and geometrically reduced fibres" closes it.

In §5.2 (line 951) uniqueness and terminality of the minimal regular model are stated "for a generic fibre of positive genus". The cited Stacks Lemmas 55.10.1 and 55.10.2 assume a smooth projective curve with `H⁰(C, 𝒪_C) = K` (stacks-0CDN lines 3078, 3106), and §5.1 has just said that no connectedness hypothesis enters. For `C = E ⊔ ℙ¹_K` with `E` of genus one, `dim_K H¹(C, 𝒪_C) = 1 > 0`, and the two contractions of §5.4 on the `ℙ¹` summand give two minimal models not isomorphic as models. Adding "with `H⁰(C, 𝒪_C) = K`", as §6.1 and Layer 7 do, closes it; the first sentence of §5.2 (existence of a minimal model by contraction) needs no such hypothesis.

## C02 — §11.7 asks for "a sharp criterion" for preservation of stability under a general postcomposition and does not say what the criterion is

The target cannot be checked against anything: line 1723 reads "prove a sharp criterion for preservation of stability instead of asserting it unconditionally". The only criterion the surrounding text supports is the definition of §10.3 applied to the composite: for `g : V → W`, the map `g ∘ F` is stable exactly when every component of a geometric fibre that `g ∘ F` contracts and `F` does not has positive log-canonical degree. Stating that sentence (or whichever criterion is meant) in place of "a sharp criterion" makes the target definite; the Check (identity of `ℙ¹` followed by `ℙ¹ → Spec k`: the one component becomes contracted, with degree `−2`) already tests it.

## C03 — The comparison that §2.5 asks to prove, between the relative `Proj` over an affine base and Mathlib's `Proj`, is already the pinned chart square

An implementer would plan work the library has done. §2.5 (line 489) asks to prove "that over an affine `S` it is Mathlib's `Proj` of the graded ring `A(S)`", and Scope and ownership (line 1763) lists "the affine comparison with `Proj`" among the API "that the library lacks". Tau Ceti's `CategoryTheory.CommMon.isPullback_relativeProjCover` (`TauCeti/AlgebraicGeometry/RelativeProj/Basic.lean:266`) makes the chart `Proj (⨁ n, Γ(Aₙ, U)) → relativeProj A` the base change of the structure morphism along `U ↪ S` for every affine open `U`; at `U = S` the inclusion is an isomorphism, so the chart is an isomorphism over `S`.

The fix: in §2.5 cite `isPullback_relativeProjCover` at `U = S` for this clause, and drop "the affine comparison with `Proj`" from line 1763. Base change and Veronese invariance remain targets: neither is at the pin. The pull request's description lists the same comparison among the additions of §2.5 and would change with it. (This remark and the next stood in the previous review of this same head.)

## C04 — Two Checks of §2.2 call `y² = x²(x + 1)` a nodal cubic; in characteristic 2 it is cuspidal

At line 428 the limit `Y` of the twisted cubics is "the plane nodal cubic", and at line 421 the cubic `y²z = x³ + x²z` is "the nodal cubic". In characteristic 2, `y² + x² = (y + x)²`, so the equation is `(y + x)² = x³`, a cusp; the parametrization `t ↦ (t² − 1, t³ − t)` has the single preimage `t = 1` of the origin, with vanishing derivative. The numbers the Checks use do not change (`h⁰(𝒪_{X₀}) = 2`, `h¹(𝒪_{X₀}) = 1`, `χ = 1`; genus one on every fibre). Adding "over a field of characteristic not 2" to both Checks (the short Weierstrass family of line 421 also needs characteristic not 3), or writing "singular plane cubic", makes them true as written.

## Deferred findings

- D01 — stands

## Previous findings

The previous review read this same head and raised no finding. Its two small corrections are unchanged in the text:

- C01 (affine comparison already at the pin) — not repaired: "that over an affine `S` it is Mathlib's `Proj` of the graded ring `A(S)`" (line 489); C03 here.
- C02 (nodal cubic in characteristic 2) — not repaired: "the plane nodal cubic `Y` with an embedded point `P` at the node" (line 428); C04 here.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §1.2 étale local structure (sampled) | `xy = πⁿ`; `x² − y² = π`, 2 invertible; ramified `R[π^{1/2}]` | chart exponent `n`; `u = x − y`, `v = x + y`, `uv = π`; ramified gives `2n` | matches Stacks 55.14.2 (stacks-0CDN l. 3598–3612) |
| §2.4 component degrees (sampled) | two lines; nodal cubic; self-node counted once | `−2 + 1 = −1` each, total `−2 = 2·0 − 2`; `−2 + 2 = 0 = 2·1 − 2`; once gives `−1 ≠ 0` | true |
| §3.1 structure-sheaf characterization (sampled) | `ℙ¹_{K'}/K` quadratic; two disjoint `ℙ¹_k`; geometric point as `S'` | `f_*𝒪 = K' ≠ K`; `k × k`; `H⁰(X_s̄, 𝒪) = κ(s̄)` forces connected | true; Stacks Def. 109.20.1 (stacks-0E6N l. 922–932) |
| §3.6 external clutching (sampled) | two `(ℙ¹; 0, 1, ∞)` along one marking | genus `0 + 0`, `b₁ = 0`, four markings, three flags per component | true; Knudsen II Thm 3.4 (knudsen-ii l. 677–693) |
| §3.8 nef bundle (sampled) | component through forgotten point: `g = 0` three flags; `g = 1` one flag; self-node plus point | degree `1 → 0`; whole curve `(1, 0)`, excluded; genus one `n = 0`, excluded; others stay `≥ 1` | true; Knudsen II Def. 1.3 (l. 131–143) |
| §3.9 uniform positivity (sampled) | `R[x, y, z]`, `deg z = 2`, `d = 2` | `A^{(2)}` generated in degree one by `x², xy, y², z`; `𝒪'(n) ↔ 𝒪(2n)` | consistent with §2.5; Stacks 27.11.8 (constructions l. 1028–1033) |
| §3.10 contraction morphism (sampled) | Knudsen construction | `Proj ⊕ π_*(ω(Σsᵢ)^i)`, pieces locally free for `i ≥ 2`, uniqueness | Prop. 2.1, p. 174 (l. 434–448); Def. 1.3, p. 164 |
| §7.1 genus zero (sampled) | conic `T₁² + T₂² = πT₀²` over `ℝ((π))` | LHS valuation even, RHS odd; `(0 : 1 : i)` over `K(i)`: `1 + i² = 0`; degree 2 | true; Stacks 55.18.1(1) (l. 3955–3958) |
| §7.4 simultaneous form (sampled) | Stacks (2), (3) | "every maximal ideal of the integral closure" in both; bound `B_g` in (3) | matches (l. 3959–3967) |
| §8.5 stable reduction (sampled) | Stacks 109.24.3(1) vs DM 2.7 | DVR extension with separable `K'/K` vs finite algebraic `L`, integral closure | matches (stacks-0E6N l. 1446–1450; deligne-mumford l. 678) |
| §9.1 extending markings (sampled) | sections `0`, `π` of `ℙ¹_R` | meet at `x = 0` mod `π`; chart `x = πx'`: `x' = 0`, `x' = 1`, disjoint, on the exceptional line | true |
| §9.2 pointed stabilization (sampled) | one-marked tail; two-marked tail; `E` with leaves `T₁, T₂` | flags `2`, degree `0`, contracted; flags `3`, stays; `E`: `1 → −1` after leaves go | true |
| §9.5 nodal generic fibres (sampled) | Knudsen II Thm 2.7 | properness of the stack of stable `n`-pointed curves, p. 179 | matches (l. 596–598) |
| §11.3 contraction descent (sampled) | pin statement | `c` universally closed, surjective, `𝒪 ≅ c_*𝒪`, `h` constant on fibres ⇒ `∃! g`, `c ≫ g = h` | matches `Descent/Contraction.lean:116` |
| §11.7 functoriality (sampled) | `id_{ℙ¹}` then `ℙ¹ → Spec k` | before: no contracted component; after: one, degree `−2` | Check true; criterion unstated (C02) |
| `exists_regular_proper_model` (§5.1) | `C` empty; `C = ℙ¹ ⊔ ℙ¹`; `ℙ¹_K` | empty model; disjoint union of two `ℙ¹_R`; `ℙ¹_R` regular | true; Stacks 55.8.3, 55.8.6 (l. 2818, 2853) |
| `exists_hasNodalReduction` (§7.4) | genus 0, 1, ≥ 2; `P` prime over `𝔪_R` | `ℙ¹` at every place; 55.18.1(2); (3); each such `P` maximal, `FiniteDVRExtension` separable (`DVRExtension/Basic.lean:92`) | README = Lean = source |
| `exists_hasNodalReduction_of_two_le_genus` | `g = 2` | `768g = 1536`; primes in `(1536, 1549)`: `{1543}`, count 1; `B₂ = 2·(1549⁴)!`; `2g − 2 = 2`, no truncation | true; 53.17.2(2) bound `(2g − 2)(n^{2g})!` (stacks-0C58 l. 1580) |
| Headline: stable reduction, uniqueness (§§8.5–8.6) | good reduction; Stacks 109.24.2 | smooth model stable; unique isomorphism of models | matches (stacks-0E6N l. 1393–1396) |
| Headline: pointed stable reduction (§9.4) | `0, 1, ∞, π` on `ℙ¹_K`; `(1, 0)`, `(0, 2)` | two lines, `{0, π}` and `{1, ∞}`, three flags each; `2g − 2 + n = 0` excluded | true |
| Headline: stable maps (§§10.3–10.4) | Frobenius of `ℙ¹`; identity with `L²`; tail of degree `d` | `σ^p = t^p ⇒ σ = id`, `∂/∂t` killed; `−2 + 2 = 0`; `−1 + 3d > 0` | true; BM Def. 3.2(3), Prop. 3.9 (behrend-manin l. 551–560, 827–830) |
| §2.2 genus formulations | K3 surface; two disjoint lines; twisted cubics | `h¹ = 0`, `χ = 2 ≠ 1`; `χ = 2`, `1 − χ = −1`; `h¹`: `0 → 1` with `χ = 1` | true for curves; dimension left to context (C01) |
| §2.2 Checks | characteristic 2 | `(y + x)² = x³`, cusp; values `2, 1, 1` unchanged | "nodal" needs char ≠ 2 (C04) |
| §5.2 minimal models | `E ⊔ ℙ¹_K`; `T₁T₂ = πT₀²` | `dim H¹ = 1`, two minimal models; each line `(−1)`, two contractions | needs `H⁰ = K` stated (C01) |
| §2.5 affine comparison | chart square at `U = S` | `U ↪ S` iso, so chart iso over `S` | at the pin (C03) |
| §4.3, §5.3, §6.1 Checks | fibre `C + E + 2F` | rows `−2 + 0 + 2`, `0 − 2 + 2`, `1 + 1 − 2`, all `0`; `g(T) = 1 + 0 + 0 + 2(−1 + ½) = 0` | true |
| Layer 6 examples | `w = (2, 2)`, `A = [[−2, 2], [2, −2]]`; `m = 1, w = 2, g = 0, a = 0` | `g(T) = 3`, `Pic(T) ≅ ℤ`, raw cokernel `ℤ ⊕ ℤ/2`; `g(T) = −1` | true |
| §6.4 numerical chain | bound by `g_top` | `2g − g_top ≤ h + g_geom`, `g ≥ h ≥ g_top + g_geom` ⇒ equalities | matches stacks-0CDN l. 3921–3931; pin hypothesis `768g − 768 < ℓ` |
| §11.4 numerical criterion | `(d, g, n') = (0, 0, 3)`, `(0, 0, 2)`, `(1, 0, 0)`; non-contracted component | `1 > 0`; `0`; `1 > 0`; `−2 − 1 + flags + 3d ≥ 1` | true; BM Prop. 3.10, Lemmas 3.11–3.12 (l. 880–912) |

- Source locators checked against the text: 60 (stacks-0CDN 19, stacks-0E6N 12, stacks-0C58 9, stacks-resolve 2, stacks-duality 2, stacks-divisors 1, stacks-constructions 2, knudsen-ii 4, behrend-manin 6, fulton-pandharipande 1, deligne-mumford 2); every one agrees with the README.
- Library declarations opened at the pin: `TauCeti.FiniteDVRExtension` and `.of` (`Curves/StableReduction/DVRExtension/Basic.lean:85`, `:210`), `TauCeti.HasNodalReduction` and `.baseChange` (`NodalReduction.lean:58`, `:114`), `exists_finrank_le_two_of_genus_eq_zero` (`GenusZero.lean:99`), `Model.prestableFamily_toBase_iff` (`Model/Prestable.lean:69`), `existsUnique_comp_eq_of_universallyClosed` (`Descent/Contraction.lean:116`), `isPullback_relativeProjCover` (`RelativeProj/Basic.lean:266`), `finrank_torsion_le_topologicalGenus_of_lt` and `finrank_torsion_le_arithmeticGenus` (`Picard/Torsion/Genus/Basic.lean:57`, `:116`).
- Cross-roadmap citations resolved on main: JacobianChallenge §§A.1, A.3, B.1–B.4, C.1–C.2, D.1, D.5, E.2, E.7 and its consumer entry; NeronModelsAndSemistableAbelianVarieties §§2.8, 3.1, 3.8, 3.9, 6.14; SchemeAndStackFoundations §0.3; EllipticCurves `ReductionSymbol`; AlgebraicVectorBundles (line 157). All exist as cited.
- Automatic checks: all passed at this head when rerun. Dependency check output: `depcheck: 182 roadmaps, 2082 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside `TauCetiRoadmap/StableReduction/`.
- Elaboration: `lake env lean` on `Suggested.lean` gives the three `sorry` warnings and the output of the one `#check` pinning `IsProper.eq_valuativeCriterion`. The three elaborated types were compared with §§5.1 and 7.4; no binder is lost and nothing changed.
- Padding probe: each of the three theorems tried with `rfl`, `simp`, `infer_instance` and an anonymous constructor on a copy; none closes. No declaration is padding.
- Pull-request text: the description's counts (73 Checks in 47 blocks, two theorems and four imports added, the AlgebraicVectorBundles supplier dropped) agree with the head; its one stale item is the affine comparison of C03.
- Headline theorems: nodal reduction (both forms) and the regular proper model are stated; stable reduction, pointed stable reduction, the stable-map characterizations, the valuative interfaces and the numerical conclusion are named in the module docstring with the carrier each lacks, which I confirmed absent at the pin (no stability predicate on `PrestableFamily`, `PointedPrestableFamily` or `PrestableMap`).

Duplication and ownership. Ownership against open pull requests was checked through the open heads listed for this review and the roadmap search tool.

Overlap check: read SchemeAndStackFoundations (main, §0.3 and its supplier paragraph), JacobianChallenge (main, Layers A–F and its consumer entry), AnalyticStableMaps (main, scope: analytic, pseudoholomorphic; nothing shared), StableReductionPartII (open; it cites Layers 0–3 and 8 and builds clutching morphisms of stacks on §§3.6–3.7, nothing shared) and AlgebraicGromovWittenTheory (open; it cites Layers 9–11, nothing shared). One shared object: base change and Veronese invariance of `CategoryTheory.CommMon.relativeProj`, stated in §2.5 here and in SchemeAndStackFoundations §0.3 on main; the owner is §2.5, since that roadmap consumes Layers 0–4 here, and its text is outside this folder (human reviewers). The affine comparison is Tau Ceti's (C03).

Source independence: 31 passages compared with 9 sources (statements at the locators above, the docstrings of `Suggested.lean`, the Summary, Conventions 5–8 and the Scope paragraph on the Deligne–Mumford criterion), none shared beyond what the mathematics forces; the longest common run is 11 words (§7.2 against stacks-0CDN l. 3961–3963, the two shapes of a genus-one special fibre). Largest share stacks-0CDN (Stacks Chapter 55), 31 of about 96 locators; contents compared with stacks-0CDN (l. 8–27): independent. Layers 4–6 put models (55.8–55.10) before numerical types (55.3–55.7), which §6.1's dependence on §5.3 forces, and Layer 4 draws on Chapters 31 and 54; §§7.1–7.3 follow the genus split that the three cases of Theorem 55.18.1 force. SGA 1 and Liu were not opened this round.

Research link: Layers 7–9 state the stable reduction theorems of Artin–Winters (1971) and Deligne–Mumford (1969, Corollary 2.7), the inputs to properness of the moduli of stable curves and, with Knudsen (1983, Theorem 2.7), of pointed curves; Layers 10–11 are the stable-map foundations of Behrend–Manin (1996) and Fulton–Pandharipande (1997). Rests on the README and the sources read.

## Not verifiable

- Liu, *Algebraic Geometry and Arithmetic Curves*: a paywalled book, cited without a locator (Layer 4 introduction; the adjunction formula of §5.3, which I checked on `F ≅ ℙ¹_k` only).
- Artin–Winters, Topology 10 (1971): paywalled, cited without a locator; the argument was checked in Stacks Chapter 55 instead.
- SGA 1, Exposé VIII, Proposition 7.8 (§2.8): not opened this round; the previous review read it.
- Knudsen II: the publisher's page is on a host the sources service places in no licence class; the locators were checked against the OCR text already held in the sources cache.

## Source issues

- **Misprint** in stacks-0CDN at Sections 55.16 and 55.17, printed pp. 55 and 57 (lines 3821, 3907): the source writes that one chooses a finite separable extension "of such that", with a stray "of"; it should read "a finite separable extension K′/K such that"; affects nothing.
- **Misprint** in stacks-0CDN at Section 55.17, printed p. 57 (lines 3906, 3914): the prime is chosen with `ℓ > 768g` and two sentences later assumed with `ℓ ≥ 768g`; it should be `ℓ > 768g` both times (harmless, `768g` being composite); affects nothing.

## For the human reviewers

- Licence: Knudsen II (cited in §§3.6–3.10, 9.4, 9.5) was read from an OCR text of the PDF at journals.msp.org (Math. Scand. article 1622); the sources service classifies that host in no licence class.
- Ownership outside this folder: SchemeAndStackFoundations §0.3 on main (lines 820–836) still plans `relativeProj_baseChange`, `relativeProj_veronese` and `relativeProj_affine_iso`; this README (lines 1774–1778) assigns the first two to §2.5, and the third is at the pin.
