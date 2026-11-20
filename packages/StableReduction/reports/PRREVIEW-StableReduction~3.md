# Review of StableReduction (pull request #2669 at 9fab8f1)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings. First, the Summary's first headline (Artin–Winters nodal reduction for `g ≥ 2`, with the degree bound, at every place above `R`) is statable at the pin, but `Suggested.lean` states only a one-place weakening. Second, §6.4 drops the `K`-rational point that the cited Stacks proof uses. Third, the blow-up Checks of §§4.1 and 4.3 (reused in §§5.1, 5.3 and 6.1), and Layer 0's example, give values that hold only for a `k`-rational point, respectively for `n ≥ 1`. There are also four small corrections and three format notes. Nothing is left for a human to decide except the licence class of the Knudsen II copy.

## R01 (P2) — The acceptance test states nodal reduction in genus at least two at one chosen place, while the headline claims every place above `R`, and the stronger form is statable at the pin

A finished roadmap that proves the theorem only at one chosen place would pass `Suggested.lean` without delivering the Summary's headline. That headline is Stacks Theorem 55.18.1(3) (stacks-0CDN lines 3964–3967). The one-place statement is strictly weaker: it lets a different `K'` serve each place, and a single extension cannot then be recovered within the bound `B_g`. The Summary (README lines 16–20) says that there is a separable `K'/K` of degree at most `(2g − 2)(ℓ^{2g})!` "such that at every place of `K'` above `R` the curve `C_{K'}` has a proper model whose special fibre is at worst nodal". `exists_hasNodalReduction_of_two_le_genus` (`Suggested.lean` line 90) concludes `∃ E : TauCeti.FiniteDVRExtension R K` with the bound and `HasNodalReduction` over `E.localRing` only.

The every-place form is statable with Tau Ceti's `TauCeti.FiniteDVRExtension.of` (`DVRExtension/Basic.lean:210`). With the theorem's own hypotheses, the following conclusion elaborates at the pin; the only warning is `sorry`:

```lean
∃ E : TauCeti.FiniteDVRExtension R K,
  finrank K E.extensionField ≤ (2 * g - 2) * (ℓ ^ (2 * g)).factorial ∧
  ∀ (P : Ideal (integralClosure R E.extensionField)) [P.IsPrime]
      [P.LiesOver (IsLocalRing.maximalIdeal R)],
    letI E' := TauCeti.FiniteDVRExtension.of R K E.extensionField P
    TauCeti.HasNodalReduction E'.localRing E'.extensionField
      (TauCeti.genericFiber K E'.extensionField (C ↘ Spec (.of K))).left
      (TauCeti.genericFiber K E'.extensionField (C ↘ Spec (.of K))).hom
```

The smallest repair is to state this conclusion in `exists_hasNodalReduction_of_two_le_genus`, or to add it beside the one-place theorem, and to adjust its docstring. The `exists_hasNodalReduction` theorem could take the same quantifier, since Theorem 55.18.1(1)–(2) are also every-place statements.

## R02 (P2) — §6.4 states the numerical conclusion without the `K`-rational point that the cited proof needs

Over a discrete valuation ring with imperfect residue field, the statement as written is not what the source proves, and §7.3 rests on it. §6.4 (lines 1035–1039) assumes "a smooth projective curve `C` of genus `g` with `H⁰(C, 𝒪_C) = K` and `Pic(C)[ℓ] ≅ (ℤ/ℓℤ)^{2g}`". Stacks §55.17 also assumes that `C` has a `K`-rational point (stacks-0CDN lines 3912–3915) and uses it throughout (line 3916, "the conclusions of Lemma 11.7").

Lemma 55.11.7 (lines 3238–3241) turns the point into a smooth `k`-point of `X_k` on a component of multiplicity one. That component is what lets Lemma 55.11.8 (which requires `gcd(mᵢ) = 1` and `H⁰((X_k)_red, 𝒪) = k`, lines 3254–3255) and Lemma 55.11.9 apply. The proof's conclusion that every `mᵢ = 1` (lines 3930–3931) comes from Lemma 55.11.8. Without the point, the multiplicity-one conclusion is known only by another route over perfect residue fields; Stacks Remark 55.18.2 calls the general case "presumably" true (lines 3976–3981).

The repair is to add "with a `K`-rational point" to the hypotheses of §6.4. §6.3 already produces the point together with the torsion, so §7.3 is unaffected.

## R03 (P2) — The blow-up Checks give self-intersections that hold only when the blown-up point is `k`-rational, and Layer 0's example needs `n ≥ 1`

Two Checks blow up "a closed point" of the special fibre of `ℙ¹_R`: §4.1 (lines 804–806) and §4.3 (lines 845–848). The Checks of §5.1 (lines 919–921), §5.3 (lines 953–955) and §6.1 (lines 1005–1007) reuse them. These Checks assert `E² = −1`, respectively `C² = E² = −2`, `F² = −1` and `C·F = E·F = 1`, with intersection numbers in `k`-degrees, the convention of §4.5 (`E · E = −[κ : k]`).

For a closed point of degree `d = [κ(p) : k]`, the exceptional curve is `ℙ¹_{κ(p)}` with `E² = −d`. After the second blow-up I computed `C² = E² = −2d`, `F² = −d` and `C·F = E·F = d`. The multiplicity vector `(1, 1, 2)` still spans the kernel, but the numerical type of §6.1 then has `w = (1, d, d)`. Over a finite residue field such points exist for every `d`. In the same way, Layer 0's example (lines 208–210) says that the special fibre of `xy − πⁿ` is "two crossing lines". For `n = 0` it is `xy = 1`, a smooth conic.

The repair is to write "a `k`-rational closed point" in the Checks of §§4.1 and 4.3, and "`n ≥ 1`" in Layer 0's example.

## C01 — §6.2 bounds the torsion by the Betti number of a dual graph that is not defined for the curve in question

The bound in §6.2 (lines 1017–1019) applies to "the reduced geometric special fibre", but the text writes it with "the first Betti number of its dual graph". At that point of the argument the fibre is not known to be nodal, and §1.4 defines the dual graph only for nodal curves. Stacks Algebraic Curves, Lemma 53.18.6 (stacks-0C58 lines 1725–1728) states the bound as `dim_k H¹(X, 𝒪_X) + g_geom(X/k)`. For a nodal curve this equals the README's form, by the genus formula of §1.4. Either state the bound in the Stacks form, or define the graph of components and singular points that the general case needs.

## C02 — Several targets cite a source without a locator, or with the wrong one, although the legal source states them

Liu is cited with no locator in §4.3 (line 836), §4.5 (line 873), §5.2 (line 928) and §5.3 (line 943), and §§6.1 and 8.6 cite nothing. I read the following in the Stacks text:

- the semidefinite intersection form and its kernel: Lemma 55.9.7, tag 0C66 (stacks-0CDN lines 2982–2989);
- the contraction to a minimal model and its uniqueness in positive genus: Lemmas 55.8.5 and 55.10.1, tags 0CD9 and 0C6B (lines 2838–2842 and 3078–3079);
- the genus formula: Lemma 55.11.2, tag 0CA3 (lines 3146–3153);
- the numerical type of a regular model: Lemma 55.11.3 and Definition 55.11.4, tags 0CA4 and 0CA5 (lines 3192–3209);
- uniqueness of stable models: Moduli of Curves, Lemma 109.24.2, tag 0E97 (stacks-0E6N lines 1393–1396).

Knudsen II is cited as "§1" for the contraction morphism of §3.10 (line 760). §1 supplies only the inputs (Definition 1.3, Main Lemma 1.6, Theorem 1.8, Corollaries 1.9–1.11). The `Proj` construction with its uniqueness is Proposition 2.1, p. 174 (knudsen-ii lines 434–448). Knudsen II is cited without a locator for §9.4 (line 1333); the properness of the stack of stable pointed curves, which carries pointed stable reduction, is Theorem 2.7, p. 179 (lines 596–598). Adding these locators would let a reader check each statement at its source.

## C03 — The scope paragraph on the Deligne–Mumford criterion names no owner, while the Néron roadmap on main still takes the criterion from Layer 7

The paragraph (lines 1767–1778) rightly declines the criterion: owning it would make this roadmap consume NeronModelsAndSemistableAbelianVarieties §§3.1, 3.8–3.9, and that roadmap consumes Layers 0–7 here. Its last sentence, "the criterion is stated downstream of both roadmaps", names no place, and the earlier pointer to a Part II has been removed. NeronModelsAndSemistableAbelianVarieties on main still cites "the curve–Jacobian criterion of StableReduction Layer 7" as an input of its §6.14 (main README line 4524). It also lists the criterion among this roadmap's supplies (lines 94–99 and 466–469, and the consumer entry at line 4600). The open StableReductionPartII does not state the criterion either.

A sentence here saying that the criterion has no home in this roadmap, and that Néron §6.14's citation of Layer 7 needs a new owner, would make the gap visible to both authors. Who should own it is for the two roadmaps to settle.

## C04 — The description says no other statement changed, but §6.4 was rewritten

"No other statement changed" leaves out §6.4. Its hypothesis changed from "a minimal regular model carrying full `ℓ`-torsion" (main line 616–619) to the explicit hypotheses of the head, which is where the `K`-point of R02 went missing. The list of moved sections also omits that the Acknowledgements section is now the opening paragraph of the References. Adding §6.4 to "Statements whose content changed", and the Acknowledgements move to "What changes in form", would make the description complete.

## N01 — Three Stacks links point at a section rather than at the result: §8.1's "§§53.23–53.25" links tag 0E7N, which is §53.25 alone (line 1160, raised before), and §§1.1–1.2 link sections 0C58 and 0CDB where the statements are Lemma 53.20.1 (0C59) and Lemma 55.14.2 (0CDD).

## N02 — `Suggested.lean` states targets of Layers 5 and 7 without the `/-! ## Layer k: … -/` section comments.

## N03 — The Summary (lines 6–7) and the References (lines 2062–2063) say the roadmap follows the Stacks Project's organization, although its arrangement is its own (see below); "the Stacks Project, Chapters 53, 55 and 109, is the main reference" would say what is meant.

## Questions for the author

- §2.8 (effective étale descent of polarized schemes) cites no source. Which statement do you rely on, for example SGA 1, Exposé VIII? I found none in the Stacks Descent chapter, which I read, and I did not open SGA 1.

## Earlier findings

The previous review (of the earlier revision) raised four remarks:

- R01 (genus, Euler degree and canonical bundle not cited): **repaired**. §2.2 (line 404) reads "The genus of a scheme over a field is Tau Ceti's `AlgebraicGeometry.Scheme.genus` … defined once". J-A2 (line 2024) cites `InvertibleSheaf.eulerDegree`, and §2.3 and J-B / SR-2 (lines 435–437, 2043) cite `InvertibleSheaf.canonicalBundle`. All three are at the pin (`Cohomology/Genus.lean:63`, `LineBundle/Degree.lean:74`, `LineBundle/SerreDuality.lean:65`).
- R02 (a wrong fully qualified name and the 0E7N label): **partly repaired**. The predicate's wrong name is gone; the README now names only the lemmas, which resolve. The §8.1 label is unchanged (N01).
- R03 (no scope section, scattered deferrals, "does not yet claim"): **repaired** in form, with `## Scope and ownership` at lines 1689–1791 and no process wording. The criterion's home is now unnamed (C03).
- R04 (stronger Layer 4–5 statement, optional): not adopted. It is not a headline, so no remark.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §1.1 pointwise criterion (Stacks 53.20.1) | cusp `y²=x³`; `xy=t` over `k[t]` | cusp: `Sing = k[x]/(x²)`, not unramified; `xy=t`: `Sing = k[t]/(t)`, unramified | matches stacks-0C58 l. 2165–2170 |
| §1.2 étale local form (Stacks 55.14.2) | `xy−πⁿ`; `x²−y²−π`, 2 a unit | own chart, exponent `n`; `u=x−y`, `v=x+y` give `uv=π` | matches stacks-0CDN l. 3598–3612 (also `uv`, `n≥0`) |
| §2.8 polarized descent | Tau Ceti inputs | `homDescentEquiv` (effective epi), `DescentDatum.descended` (affine), `isPullback_proj_map_descendedGradedVal` (flat `R→S`) | consistent; no source cited (question) |
| §3.1 prestable via `f_*𝒪` | `ℙ¹_{K'}`/`K` with `[K':K]=2`; `ℙ¹⊔ℙ¹` | `f_*𝒪 = K' ≠ K`; `k×k` | matches Stacks Def 109.20.1 and footnote 1 (l. 922–951) |
| §3.8 nef bundle `B` | `(ℙ¹;0,1,∞)` forgetting `∞`; two lines with `p₁…p₄` forgetting `p₄` | `2g−2+n=0`, excluded; tail degree `−2+2=0`, one zero component | matches Knudsen Def 1.3, Fig. 1 |
| §3.10 contraction morphism | Knudsen construction | `Proj ⊕π_*(ω(Σs))^i`, pieces locally free for `i≥2` (Cor 1.11) | true; locator is Prop 2.1 (C02) |
| §4.2 node `xy=πⁿ` | `n=2,3,4` | `π³→uv=π` regular; `π⁴→uv=π²`; chain of `n−1` curves; `⌊n/2⌋` steps | matches Stacks Ex. 55.14.1 l. 3574–3595 |
| §4.3 intersection Check | `k`-rational `p`; degree-`d` `p` | rows `−2+0+2`, `0−2+2`, `1+1−2` vanish; for `d≥2`: `C²=−2d`, `F²=−d` | false for `d≥2` (R03) |
| §5.2 minimal models | genus `0`, `>0` | `T₁T₂=πT₀²` gives two `ℙ¹_R`; `g>0` unique | Stacks 55.8.5, 55.10.1; locator (C02) |
| §5.3 relations and adjunction | `C+E+2F` | relations `0,0,0`; `F: −1+(−1)=−2=−2χ`; all `mᵢ=1` gives `1≠0` | true for rational `p` |
| §6.4 numerical conclusion | hypotheses vs Stacks §55.17 | README: `H⁰=K`, full `ℓ`-torsion; Stacks adds a `K`-point, used through 11.7–11.9 | hypothesis missing (R02) |
| §7.3 bound, `g=2` | `ℓ` = 1543, 1549, 1553 | `768g=1536`; primes in `(1536,ℓ)`: 0, {1543}, 2; `B₂=2·(1549⁴)!` | Lean pins `ℓ=1549`; matches eq. 55.18.0.1 |
| headline nodal reduction, `g≥2` (Lean l. 90) | every place vs one place | Summary: all places; Lean: one `E`; every-place form elaborates | weaker (R01) |
| `exists_hasNodalReduction` (Lean l. 73) | genus 0; `C=∅` | pin gives `[K':K]≤2`; `GeometricallyIntegral` excludes `∅` | true, not padding |
| `exists_regular_proper_model` (Lean l. 59) | `C=∅`; `ℙ¹_K` | empty model; `ℙ¹_R`; one-tactic probe fails | true, not padding |
| §8.2 auxiliary sections | BM §3 | Case I adds tails étale locally; Case V removes them by Prop 3.10 | matches behrend-manin l. 668–711, 880 |
| §8.1 Check (iterated tail) | `E` with `C₀`, `T₁`, `T₂` | `E: −2+3=1`; `Tᵢ: −1`; after deletion `E: −1` | true |
| §9.4 pointed stable reduction | `(1,0)`, `(0,2)`; collision `{0,π}`, `{1,∞}` | `2g−2+n=0`; three special points on each line | true; locator Knudsen Thm 2.7 (C02) |
| §9.6 forgetting a marking | Tau Ceti `reindex` | along `Fin m ↪ Fin n`; `Fin.castSuccEmb` forgets the last; pullback is `rfl` | consistent |
| §11.2 decorated graph | nodal rational curve, `d=0`, 0 or 1 marking | `0` vs wrong `−1`; `1` vs wrong `0` | matches `DegreeDecoration.IsStable` |
| §6.2 torsion bound | nodal vs non-nodal reduced fibre | nodal: `h¹=Σg+b₁`, so `2Σg+b₁`; non-nodal: graph undefined | C01 |
| §6.1 and Layer 6 types | `(1,1,2)`; odd diagonal; `w=(2,2)`, `(1,2)`; one component `w=2` | `g(T)=0`; `0` vs floor `1`; `Pic=ℤ` vs `ℤ⊕ℤ/2`; `(−2,1)`; `g=−1` | true |
| §10.4 Checks | Frobenius; exponent 2 | `Aut` trivial, `∂/∂t` killed by `F^#`; `−2+2=0` | true |
| §2.3 / §2.4 Checks | plane `d`-ic; nodal cubic; two lines | `d(d−3)=2pₐ−2`; `−2+2=0`; `−1−1=−2` | true |
| Layer 0 example | `n=0` | special fibre `xy=1` is smooth, not two lines | needs `n≥1` (R03) |

- Source locators checked against the text: 36 (stacks-0C58 5, stacks-0CDN 14, stacks-0E6N 8, stacks-0A26 1, knudsen-ii 6, behrend-manin 4, fulton-pandharipande 2, deligne-mumford 1).
- Library names: all 257 backticked names in the README resolve at the pinned Tau Ceti or Mathlib, by a scripted search plus a manual check of 42 parser misses. Opened in full: `FiniteDVRExtension` (separable, `Basic.lean:85`), `.of` (`:210`), `HasNodalReduction` (`NodalReduction.lean:58`), `genericFiber` (`Fibers.lean:43`), `PrestableFamily` (`Prestable.lean:45`), `isRegularRing_pow_iff` (`RegularLocalRing/Node/Basic.lean:242`), `finrank_torsion_le_arithmeticGenus` (`Picard/Torsion/Genus/Basic.lean:116`), `DegreeDecoration.IsStable` (`StableMaps/DualGraph/Basic.lean:105`).
- Cross-roadmap citations resolved: JacobianChallenge §§A.1, A.3, B.1–B.4, C.1–C.2, D.1, D.5, E.2 and E.7 on main and at its open head; Néron §§2.8, 3.1, 3.8 and 3.9 on main; EllipticCurves `ReductionSymbol` (main line 865); AlgebraicVectorBundles on relative `Proj` (main line 157).
- Automatic checks: every check passed. Dependency check: `depcheck: 200 roadmaps, 2210 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, with the three `sorry` warnings as its only warnings. The `#check @name` output for all three declarations shows no lost binder and equals the README statements (nothing changed). The one-tactic probe fails on `exists_regular_proper_model` and `exists_hasNodalReduction`, and the third declaration has no library counterpart.
- Pull-request scope: no change outside `TauCetiRoadmap/StableReduction/`.
- Overlap check: I read AlgebraicGromovWittenTheory (open), SchemeAndStackFoundations (main and its open revisions), JacobianChallenge (main and its open revision), StableReductionPartII (open) and AnalyticStableMaps (main). The shared objects and their owners:
  - moduli of stable maps and their valuative theorem: AlgebraicGromovWittenTheory, which consumes Layers 9–11 here;
  - scheme-level clutching: owned here, and StableReductionPartII consumes Layer 3;
  - relative `Proj`, the dualizing sheaf of a Gorenstein curve, blow-ups and polarized descent: owned here, and SchemeAndStackFoundations leaves them to Layers 0–4;
  - the Picard and cohomology foundations: JacobianChallenge, through contracts J-A1 to J-E;
  - pseudoholomorphic stable maps: AnalyticStableMaps, a different object.

  The curve–Jacobian criterion has no owner (C03).
- Source independence: 41 passages compared with 7 sources, with nothing shared beyond phrases the mathematics forces; the longest run is 11 words (§7.2 against stacks-0CDN line 3962). The largest share of locators is stacks-0CDN (Stacks Chapter 55), 17 of about 56. Contents compared with stacks-0CDN (lines 8–27): independent. Layers 4–6 reverse Chapter 55's order (numerical types come after models, as §6.1's dependence on §5.3 forces). §§7.1–7.3 follow the genus split of §§55.15–55.17, which the three cases of Theorem 55.18.1 force. Layers 0–3 and 8–11 draw on Chapters 53 and 109, Knudsen, Behrend–Manin and Fulton–Pandharipande.
- Research link: Layers 7–9 are the stable reduction theorems of Artin–Winters (1971) and Deligne–Mumford (1969, Cor. 2.7), the input to the properness of the moduli of stable curves (Deligne–Mumford 1969) and of pointed stable curves (Knudsen 1983, Thm 2.7). Layers 10–11 are the stable-map foundations of Behrend–Manin (1996) and Fulton–Pandharipande (1997), which AlgebraicGromovWittenTheory consumes. This rests on the README and the sources I read.

## Not verifiable

- Liu, *Algebraic Geometry and Arithmetic Curves*: a paywalled book, cited without a locator in §§4.3, 4.5, 5.2 and 5.3. I checked the Stacks statements instead (C02); the adjunction formula of §5.3 is not in the Stacks sections I read.
- Artin–Winters, Topology 10 (1971): paywalled, and cited without a locator.
- Mumford–Fogarty–Kirwan and Gieseker: background for a route the roadmap does not take; not fetched.
- §2.8: no source is cited. The Stacks Descent chapter (stacks-descent) has affine descent (Lemma 35.37.1) but no polarized-descent lemma in what I read.

## Source issues

- **Misprint** in stacks-0CDN at Sections 55.16 and 55.17, printed pp. 55 and 57 (lines 3821, 3907): the source says "a finite separable extension K′/K of such that", with a stray "of"; it should be "a finite separable extension K′/K such that"; affects nothing.

## For the human reviewers

- Licence: Knudsen II was read from the Math. Scand. archive at journals.msp.org (article 1622). The sources service does not classify this host, so I fetched the copy as publisher-open, on the basis that the journal's back issues are open access. Please confirm.
