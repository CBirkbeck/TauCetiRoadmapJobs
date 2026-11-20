# Review of AdoIwasawa (pull request #2633 at 66e340d)
Folder: `TauCetiRoadmap/RepresentationTheory/AdoIwasawa/`
**Verdict:** accepted

**Summary.** Accepted, with one small correction that does not block. Every point of the previous review is repaired. §5.6 now cites the pinned `LieIdeal.isNilpotent_ad_right_of_isCompl` and is no longer listed as a target. The §3.6 remark on semisimple `S` is now correct, with one exception: its `sl₂` counterexample needs characteristic ≠ 2 (C01). One question is left to the human reviewers: the family status page lists this roadmap as complete, while six "Prove" targets remain.

## C01 — The new `sl₂` counterexample in §3.6 needs characteristic ≠ 2

The remark gives `sl₂` as a semisimple `S` for which the range containment "fails … with `x ≠ 0`" (lines 564–568). That is right in characteristic ≠ 2. In characteristic 2, though, `sl₂` is nilpotent rather than semisimple, `h` is the identity matrix, and `[σ h, M₂(K)] = 0`, so the stated failure does not occur for `x = h`. No stated result depends on this. Writing "for `S = sl₂` in characteristic ≠ 2" would make the sentence true as written.

## Previous findings

- R01 — repaired: §5.6 reads "If `ad x` is nilpotent, then `ad_S s` is nilpotent … (`LieIdeal.isNilpotent_ad_right_of_isCompl`, …)"; its *Needs:* line, the Tau Ceti contracts and the Scope target list match.
- R02 — repaired: §3.6 says the containment "depends on `I`: it holds for `I = U⁺(S)` … and fails for `S = sl₂` …", and that in characteristic zero the conclusion holds with `J = I`. New slip: C01.
- C01 — repaired: "A monic relation of degree `0` reads `1 = 0` and forces `A = 0`."
- C02 — repaired: §4.5 now says "These statements mention no equivalence `L ≃ S ⋊ H` … so clients consume them and not a chosen equivalence". This is a remark, no longer part of the target.
- C03 — repaired: the §7.4 route and its *Needs:* line both cite `TauCeti.span_range_prod_quotient_span_pow_eq_top`.
- N01 — repaired: `Suggested.lean` now pins only twelve declarations: the headline theorems and the two characteristic tracks.
- N02 — repaired: five imports remain, and each hosts at least one pinned declaration.
- N03 — repaired: the locators now read "Hochschild 1966, pp. 531–532", "proof of Theorem 2, p. 532", "Theorem 2, p. 532", "pp. 532–533" and "Theorem 1, p. 531"; Zariski–Samuel now reads "Vol. I, Van Nostrand (1958)".
- Question (Jacobson pp. 202–203 in Layer 6) — answered: Layer 6 now cites "Chapter V, Theorem 6 and Lemma 4, and Chapter VI, Lemma 5, as Hochschild cites them", which matches Hochschild1966 lines 64–74.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.5 degree-0 remark | monic `p = 1`; `A = 0`, `A = K` | `p(q(ι e)) = 1`; `1 = 0` holds iff `A = 0`; over `A = K` no degree-0 monic relation holds | true |
| §3.6, `I = U⁺(S)` | `sl₂`, `D = ad x` | `ε(ι y) = 0` for every `y`, so `ι(D y) ∈ U⁺`; Derivation/Basic.lean:281 gives `Dᵁ(U(S)) ≤ U⁺` | true |
| §3.6, standard kernel | `sl₂`, `σ` standard, `x = h`; characteristic 0 and 2 | `ef = E₁₁`, `fe = E₂₂`, so `σ(U) = M₂(K)`; `[diag(1,−1), E₁₂] = 2E₁₂ ≠ 0`; in characteristic 2, `σh = 1`, commutator `0` | true for characteristic ≠ 2; C01 |
| §3.6, `J = I` for semisimple `S` | characteristic 0; conclusion at CofiniteRefinement.lean:101 | `nil S = ⊥`, `envelopingIdeal ⊥ = ⊥`, `n = 1`: `I ≤ I`, finite, `⁅ι x, I⁆ ⊆ I` (two-sided), same nilpotents | true |
| §4.5 invariance remark | `σ' = φσφ⁻¹`; `H = 0` | `ker σ' = ker σ`; `σ'(s)^k = φ σ(s)^k φ⁻¹`; `H = 0`: `ρ = σ` | true |
| §5.6 pinned step | `sl₂ ⋉ K²`, `x = e + v`; affine line, `S = 0` | `ad x` nilpotent, `(ad_S e)³ = 0`; converse fails: `ad_S 0 = 0`, but `ad x_aff y = y` | true, one direction as stated |
| §5.6 generality | AdNilpotent.lean:80 | `[CommRing R]`, `IsCompl J S`, `i : J`, `s : S`; README: "any Lie ideal and complementary Lie subalgebra over a commutative ring" | matches |
| §7.4 route | `L = Kx`, `n = 2`, `s = {x}`, `A = K` | `R₀ = K[x]`; Finite.lean:81 gives products of `< 2` generators: `1, x` span `K[x]/(x²)` | matches |
| Locators §5.4, Layers 6–8, §§7.1, 9.1 | Hochschild1966 lines 16–19, 25–57, 61–80, 81–91, 94–95 | Thm 1 p. 531; characteristic-zero argument pp. 531–532; Thm 2 p. 532; Jacobson V.6, VI L5, V L4; end p. 533; Z–S Vol. 1, 1958 | all match |
| §9.1 Hochschild's theorem (sample) | `ℚ`, `𝔽₂`; elaborated type | `[Field K]`, `FiniteDimensional K L`, `ρ` injective, `ad`-nilpotent implies `ρ x` nilpotent; Hochschild lines 16–19: arbitrary field | matches |
| `Suggested.lean` headlines (12 `#check`) | elaborated types | Ado–Iwasawa, Hochschild: no characteristic; tracks `[CharZero K]` or `[Fact p.Prime] [CharP K p]`; Levi `[CharZero K]`; Birkhoff `[LieRing.IsNilpotent L]`, `ρ x ^ N = 0` | match README |

The rows for untouched statements stand as in the previous review, of `b536bae`.

- Source locators checked against the text: 9 passages of Hochschild1966 (lines 16–19, 25–57, 61–63, 64–65, 69–70, 73–74, 78, 81–91, 94–95).
- Library declarations opened at the pins: `LieIdeal.isNilpotent_ad_right_of_isCompl` (TauCeti/Algebra/Lie/SemiDirect/AdNilpotent.lean:80), `TauCeti.span_range_prod_quotient_span_pow_eq_top` (TauCeti/RingTheory/Ideal/Quotient/Finite.lean:81), `Ideal.exists_cofinite_refinement_stableDerivations_of_isSolvable` (TauCeti/Algebra/Lie/UniversalEnveloping/CofiniteRefinement.lean:101), `envelopingDerivation_range_le_iff` and `envelopingDerivation_inner` (TauCeti/Algebra/Lie/UniversalEnveloping/Derivation/Basic.lean:281, 359), `LieModule.IsFaithful` with `@[mk_iff]` (Mathlib/Algebra/Lie/OfAssociative.lean:223). I also located the host module of each of the twelve pinned declarations.
- Elaboration: `lake env lean` on `Suggested.lean` elaborates all 12 `#check`s with no warning or error. The file declares nothing of its own. I compared the elaborated types with the README headlines: universes, characteristic, nilpotence and finiteness hypotheses all match.
- Cross-roadmap citations resolved on main: LieHighestWeight §3.1 (its README line 1179) and LieGroups' use of the matrix form (its README line 502).
- Automatic checks: the gate passes at this head with every check at zero, and nothing changed outside the folder. The dependency check printed `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`.
- The pull request's description matches this head: 23 Checks in 17 blocks, twelve pinned declarations, the six "Prove" targets, and §5.6 citing the pinned lemma.

Overlap check: read LieHighestWeight, LieHighestWeightPartII, NilpotentOrbits and LieGroups. The change adds no owned object, and the owners stand as in the previous review: PBW is Tau Ceti's, complete reducibility is LieHighestWeight's, and the real matrix embedding is this roadmap's (§9.4), consumed by LieGroups. Nothing is owned twice.

Source independence: changed passages only. I compared 8 passages (§§1.5, 3.6, 4.5, 5.4, 5.6, the introductions of Layers 6–8, 7.1, 7.4 and the docstring of `Suggested.lean`) with 1 source, Hochschild1966. The longest shared run is 4 words ("adjoint representation of S", a standard term). The largest share of locators is still a tie, Fulton–Harris and Hochschild 1966 at 7 each. No layer was added, removed or reordered, so the contents were not compared again.

Research link: The headline is Iwasawa's 1948 theorem with Hochschild's 1966 strengthening (Theorem 1). Hochschild notes that L. Ross used its characteristic-zero case to prove Ado's theorem for graded Lie algebras (1964), and LieGroups Layer 4 consumes the real matrix form for Lie's third theorem. Rests on the README and Hochschild1966 lines 16–24.

## Not verifiable

- Fulton–Harris, Appendix E (Convention 4, Layers 3–5): paywalled, and no legal copy was found. This change touches none of its locators.
- Jacobson, *Lie Algebras*, Ch. V Theorem 6 and Lemma 4, Ch. VI Lemma 5 (Layer 6 introduction): no legal copy. I checked them only as Hochschild1966 lines 64–74 cite them.
- Zariski–Samuel, Vol. I, p. 253 (§7.1): not fetched. I checked it only as Hochschild1966 lines 78 and 94–95 cite it.

Automatic checks set aside as false positives: the citation resolver reports `LieModule.isFaithful_iff` (README line 136) as occurring nowhere. Mathlib generates it with `@[mk_iff]` on `LieModule.IsFaithful` (Mathlib/Algebra/Lie/OfAssociative.lean:223).

## Source issues

- none

## For the human reviewers

- Status: TauCetiRoadmap/RepresentationTheory/STATUS.md line 45 lists AdoIwasawa as complete. This revision keeps six "Prove" targets (§§0.1, 3.3, 4.5, 5.2, 6.2, 7.4), and its `Suggested.lean` states nothing new. Should the roadmap stay active, or be marked complete?
- Not tested: Fulton–Harris, Appendix E (7 locators, tied for the largest share) is paywalled and was not read. Its wording, and the README's arrangement against its contents, were not checked.
- Licence: Asgarli, *Ado's Theorem* (cited in Layers 3–5), is an unpublished expository note on a UBC staff page, classified as an author page. The roadmap reuses no material from it.
