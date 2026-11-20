# Review of AdoIwasawa (pull request #2633 at b536bae)
Folder: `TauCetiRoadmap/RepresentationTheory/AdoIwasawa/`
**Verdict:** needs changes

**Summary.** This needs changes for two findings. The §5.6 target (an `ad`-nilpotent element has an `ad`-nilpotent Levi component) is already the pinned Tau Ceti theorem `LieIdeal.isNilpotent_ad_right_of_isCompl`, yet the README still lists it among this roadmap's own targets; and a sentence in §3.6 says the refinement's range containment fails for semisimple `S`, when it fails only for some ideals and the refinement then holds with no work at all. There are also three small corrections and three format notes, none of them blocking. One question is left to the human reviewers: the family status page already lists this roadmap as complete, so should it stay active for its six remaining supporting targets?

## R01 (P2) — The §5.6 target "`ad x` nilpotent forces `ad_S s` nilpotent" is already a pinned Tau Ceti theorem, but the README plans it as one of this roadmap's own targets

As written, an implementer would prove a pinned result a second time. The README also contradicts itself. The "In the Tau Ceti library" paragraph of Scope and ownership counts "every step of Hochschild's argument (§§5.1, 5.3–5.8)" as library work (line 1165). The sentence just after it lists "the nilpotence of the semisimple component (§5.6)" among the roadmap's targets (line 1170). §5.6 itself still opens with "Prove that `ad x` nilpotent forces `ad_S s` nilpotent" (line 780).

`LieIdeal.isNilpotent_ad_right_of_isCompl` (TauCeti/Algebra/Lie/SemiDirect/AdNilpotent.lean:80) states the following. Let `J` be a Lie ideal and `S` a Lie subalgebra with `IsCompl J S`, and take `i ∈ J`, `s ∈ S`. If `ad (i + s)` is nilpotent on `L`, then `ad_S s` is nilpotent. It holds over any commutative ring, with no characteristic, finiteness or semisimplicity hypothesis. Taking `J` to be the radical and `S` a Levi complement gives exactly §5.6. I checked this at the pins: the §5.6 statement in the README's own form elaborates with that lemma as its entire proof. The pinned Hochschild argument uses the lemma at TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:151.

The fix:
- In §5.6, state the step as `LieIdeal.isNilpotent_ad_right_of_isCompl` and cite it, instead of "Prove that …".
- Add the lemma to the §5.6 *Needs:* line and to the Tau Ceti supplier contracts.
- Remove §5.6 from the list of targets on line 1170.
- Make the same change to the description's list of what remains a target.

## R02 (P2) — The §3.6 sentence explaining the solvability hypothesis says the range containment fails for semisimple `S`; it fails only for some `I`, and for semisimple `S` the refinement holds anyway

Read as written, the sentence tells a reader that the derivation-stable refinement breaks down for semisimple `S`. In fact only the route needs solvability. The sentence (lines 564–566) reads: "for a semisimple `S` and `D = ad x ≠ 0`, `nil S = 0` while `D S ≠ 0`, so the range containment `Dᵁ (U(S)) ≤ B` fails".

Here is the computation. Take `S` semisimple in characteristic zero, so `nil S = 0` and `B = I`.
- For `I = U⁺(S)` (two-sided, codimension one), `ε([ι x, u]) = ε(ι x) ε(u) − ε(u) ε(ι x) = 0`, so `Dᵁ (U(S)) ≤ B` holds.
- For the kernel of the two-dimensional representation of `sl₂`, the containment does fail: the image of `Dᵁ` there is `[σ x, M₂(K)] ≠ 0`.
- Every derivation of a semisimple `S` is inner, and §3.2's Check shows that the lift of `ad x` is the commutator with `ι x`. That commutator preserves every two-sided ideal, so `J = I` already meets all four conclusions of `Ideal.exists_cofinite_refinement_stableDerivations_of_isSolvable`.

A wording that would be true: "so the route's range containment `Dᵁ (U(S)) ≤ B` is no longer available (it fails for the kernel of the standard representation of `sl₂`). The statement is made for solvable `S`, the case Layer 4 uses; for semisimple `S` it is immediate, the lifts of inner derivations being commutators."

## C01 — The degree-0 remark in §1.5 says monicity excludes degree-0 relations; it does not

Line 324 says "A relation of degree `0` would read `1 = 0` and is excluded by monicity." But the monic polynomial of degree 0 is `1`, and monicity allows it. Its relation `1 = 0` holds exactly when `A = 0`, and then the conclusion is trivial. What monicity rules out is the zero polynomial. Either of these would be correct: "a monic relation of degree `0` reads `1 = 0` and forces `A = 0`", or the same sentence without "by monicity".

## C02 — The invariance clause of §4.5 holds by inspection, so it asks the implementer for nothing

Once the conclusions of §4.5 are stated in internal form, they mention no equivalence `L ≃ S ⋊ H`. Kernels and nilpotence are also unchanged when `σ` is conjugated by a linear isomorphism. So "these conclusions are unchanged when the equivalence … is replaced … and when `σ` is replaced by an equivalent representation" (lines 655–658) adds nothing to the target. If what is meant is that the representations built from two equivalences have the same kernel on `S`, that comparison should be stated. Otherwise the clause would read better as a remark.

## C03 — Half of the §7.4 route is a pinned lemma that its *Needs:* line does not name

The route's second step says that `R₀ ⧸ (c₁, …, c_d)^n` is spanned by the monomials of total degree `< n` in the `cᵢ`. That is `TauCeti.span_range_prod_quotient_span_pow_eq_top` (TauCeti/RingTheory/Ideal/Quotient/Finite.lean:81). `TauCeti.finite_quotient_pow_of_algebraMap_mem`, cited in the first paragraph of §7.4, is built on it. The *Needs:* line (lines 1005–1006) names neither lemma, so an implementer cannot tell that this step is already available. Adding the first lemma to the line would fix that.

## N01 — `Suggested.lean` pins fourteen declarations beyond the headline theorems and the two characteristic tracks (lines 73–86), which makes the acceptance test read as a catalogue; the README already names all of them. The file would keep only the `#check`s of lines 61–72 and the imports that host them.

## N02 — The import `TauCeti.RepresentationTheory.Lie.Ado.CharP` (line 14 of `Suggested.lean`) hosts none of the declarations the file pins; `TauCeti.adoCharP` lives in `PositiveCharacteristic.lean`. The import can go.

## N03 — Several locators would be more useful with theorem and page numbers, and one reference is incomplete.
- "(Hochschild 1966)" in §§5.4 and 9.1 and the introductions of Layers 6–8 could name: Theorem 1, p. 531 for Hochschild's theorem; Theorem 2, p. 532 for `⋂ₙ (UC)^n = 0`; pp. 531–532 for the characteristic-zero argument.
- The Zariski–Samuel reference lacks its volume and year: Vol. I, Van Nostrand 1958, as Hochschild cites it.

## Questions for the author

- The introduction to Layer 6 (line 845) cites Jacobson pp. 202–203 for the positive-characteristic layer. Hochschild 1966 (Hochschild1966 line 27) cites those pages for the characteristic-zero nilrepresentation theorem. For `p`-polynomials and finiteness over them it cites Jacobson Ch. VI Lemma 5 and Ch. V Lemma 4 (Hochschild1966 lines 70, 73). Are pp. 202–203 meant here, or those lemmas? I could not read Jacobson's text, so I could not check this myself.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 faithfulness dictionary | Heisenberg `ad`; `sl₂` `ad` | Heisenberg: `ad ≠ 0`, `ad z = 0`, not injective; `sl₂`: centre 0, faithful; `isFaithful_iff` generated by `@[mk_iff]` | true; not at pin |
| §1.4 domain, Noetherian | `L = Kx`; affine line | `U(Kx) = K[x]`; `instIsDomain` needs domain `R` and free `L`; `instIsNoetherianRing` Noetherian `R` and finite `L` | matches README |
| §1.5 finite spanning | `n = 0` (`L = 0`); monic `p = 1` | `n = 0`: span `{1} = A`; `p = 1` gives `1 = 0`, so `A = 0` | true; remark C01 |
| §3.1 noncommutative derivations | `A = M₂(K)`, `D = ad a`; commutative `A` | `ad a` is a derivation but not a Mathlib `Derivation`; the equivalence needs `CommRing A` | matches |
| §3.2 lifted derivations | `D = ad x` on `ι y ι z` | `Dᵁ(ι y ι z) = ι[x,y] ι z + ι y ι[x,z] = [ι x, ι y ι z]`; multiplicative model gives `ι[x,y] ι[x,z]` | Check true |
| §3.6 semisimple remark | `sl₂`: `I = U⁺`; `I` = kernel of standard representation | `U⁺`: `ε[ι x, u] = 0`, containment holds; standard: `[σx, M₂(K)] ≠ 0`, fails | R02 |
| §4.5 transport | `H = 0`; Heisenberg, `S = Ky ⊕ Kz`, `H = Kx` | `H = 0`: `ρ = σ`; Heisenberg: nilpotent bullet applies, `z` stays detected | true; C02 |
| §5.4 Ado in characteristic zero | `sl₂`; Heisenberg | `sl₂`: `Z = 0`, `ad` faithful; Heisenberg: `ker ad = Kz`, `ρ₀` faithful on `Kz`, sum injective | true |
| §5.6 semisimple component | `sl₂ ⋉ K²`, `x = e + v`; `x = h` | `ad x` block-triangular nilpotent, `ad_S e` nilpotent; `h`: neither nilpotent; pinned lemma closes it | R01 |
| §5.6 Check | `sl₂`, `s = e`, `s = h` | `[e, h/2] = −e`, `[e, −h/2] = e`, `ker ad e = Ke`; `range ad h = ⟨e, f⟩ ∌ h` | true |
| §6.1 Frobenius identity | `a = diag(1,0)`, `p = 2` | `ad(a²) E₂₁ = −E₂₁`; `(ad a)² E₂₁ = +E₂₁`; equal over `𝔽₂` | Check true |
| §6.2 affine-line Check | characteristics 2 and 3 | `[x², y] = 2xy − y = y`; `[x² − x, y] = 0`; `[y², x] = −2y² = 0` | true |
| §6.5 extended ideal | `L = Kx`; Hochschild1966 lines 64–79 | `J = xK[x]`, `Jⁿ U = (xⁿ) = (UC)ⁿ`; source has `(UC)ⁿ = (JU)ⁿ = Jⁿ U` | matches source |
| §7.1 Krull | `R = A = K × K`, `r = (1,0)` | `Jⁿ = J ∋ r`, `r·r = r`; Mathlib hypotheses as stated; Zariski–Samuel p. 253 as cited, line 78 | true |
| §7.3 finite stage | `L = Kx`, characteristic `p` | `(UC)¹ = (x) ⊇ L`; `(UC)² = (x²)` meets `L` in 0; Hochschild1966 line 81 | matches |
| §7.4 spanning set | `L = Kx`; affine line, characteristic `p` | `Kx`: `1, …, x^(n−1)`, a basis, `n = dim K[x]/(xⁿ)`; second step of route pinned | true; C03 |
| §8.2 Check | `sl₂` on `𝔽_p^p` | `[h,e]vᵢ = 2v_(i+1)`; `[h,f]vᵢ = 2i(i−1)v_(i−1) = −2f vᵢ`; `[e,f]vᵢ = 2i vᵢ`; `e^p = 1` | true, all `p ≥ 3` |
| §9.1 dispatch, Hochschild | `ℚ`, `𝔽₂`; Hochschild1966 lines 16–19 | `ringChar ℚ = 0 ⇒ CharZero`; `ringChar 𝔽₂ = 2`; Theorem 1: arbitrary field, `ad`-nilpotent ⇒ nilpotent | matches |
| §9.2 Ado–Iwasawa | `L = 0`; universes | `L = 0`: `V = 0` injective; pinned `V : Type (max u v)` for `K : Type u`, `L : Type v` | matches Convention 1 |
| §9.3 matrix form | affine line; Heisenberg | `[diag(1,0), E₁₂] = E₁₂`; `[E₁₂, E₂₃] = E₁₃`, `E₁₃` central | true |
| Birkhoff headline (§§2.3–2.4) | Heisenberg, weights `(1,1,2)` | `N = 3`: `1, x, y, z, x², xy, y²` (7); `N = 2`: `1, x, y`, `ι z` in ideal | Check true |
| Levi headline (§5.3) | affine line; `sl₂ ⋉ K²`; route identity | `R = L`, `S = 0`; `R = K²`, `S = sl₂`; `[ad r, φ] = ad(−λ r) ∈ A` | true (characteristic 0) |
| Convention 3 nilradical | affine line | ideals `0, Ky, L`; `ad x = id` on `Ky`, so `maxNilpotentIdeal = ⊥`, `nil = Ky` | true |

- Source locators checked against the text: 11. These are Hochschild 1966 Theorem 1 (p. 531), the characteristic-zero argument (pp. 531–532), Theorem 2 and its proof (p. 532), p. 533, and the Jacobson and Zariski–Samuel pages as Hochschild cites them; plus Asgarli Lemma 1, Proposition 2 and Theorem 3.
- Library declarations: all 243 dotted names in the README resolve with `#check @name` at the pins. Opened at file and line: `LieIdeal.isNilpotent_ad_right_of_isCompl` (AdNilpotent.lean:80), `LieModule.IsFaithful` (OfAssociative.lean:223), `maxNilpotentIdeal` (Nilpotent.lean:955), `baseChange_nilradical_le` and `radical_baseChange` (Radical.lean:168, 221), `LieDerivation.baseChange` (Derivation/BaseChange.lean:79), and the quotient lemmas (Ideal/Quotient/Finite.lean:81, 161).
- `Suggested.lean` declares nothing. All 26 of its `#check`s elaborate with no warning. I compared each elaborated type with the README (universes, characteristic and finiteness hypotheses) and found no mismatch.
- Cross-roadmap citations resolved: LieHighestWeight §3.1, on main and at the head of its open revision #2578; LieGroups Layer 4 on main.
- Automatic checks: every gate check passed, and nothing changed outside the folder. Dependency check output: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`.
- Probe: the §5.6 statement in README form, proved by `LieIdeal.isNilpotent_ad_right_of_isCompl`, elaborates.
- Ownership against open pull requests: I searched all open heads and main for nilradical, Levi, Ado, weighted PBW and Hochschild. No second owner.

Overlap check: read LieHighestWeight (main and its open revision), LieHighestWeightPartII, NilpotentOrbits and LieGroups (main). Shared objects and their owners:
- The PBW development: owned by the Tau Ceti library; this roadmap and LieHighestWeight §3.1 both consume it.
- Complete reducibility: LieHighestWeight owns the general theory; this roadmap consumes Tau Ceti `LieSubmodule.exists_isCompl_of_le_ker`.
- The real matrix embedding: owned by this roadmap (§9.4); LieGroups Layer 4 consumes it.
- Nothing is owned twice.

Source independence: 15 passages compared with 2 sources (Hochschild1966, Asgarli). The longest shared run is 8 words, a bibliographic title and a bracket formula; no prose is shared. The largest share of locators is a tie between Fulton–Harris and Hochschild 1966, 7 of 21 each. Contents compared with Hochschild 1966, a three-page note without sections: independent. Fulton–Harris contents not read.

Research link: The headline is Iwasawa's 1948 theorem with Hochschild's 1966 strengthening (Theorem 1). Hochschild notes that L. Ross used its characteristic-zero case to prove Ado's theorem for graded Lie algebras (1964), and LieGroups Layer 4 consumes the real matrix form for Lie's third theorem. Rests on the README and Hochschild1966 lines 16–24.

## Not verifiable

- Fulton–Harris, Appendix E, §E.2, pp. 499–503 and Proposition E.5 (Convention 4, Layers 3–5): Springer GTM 129 is paywalled, and the sources service found no legal copy.
- Jacobson, *Lie Algebras* (1962), Ch. V–VI and pp. 202–203 (Layers 1 and 6): no legal copy found. I checked pp. 202–203 only as Hochschild cites them.
- Iwasawa 1948 (§9.2): not found by DOI or citation search. I checked the arbitrary-field statement against Hochschild 1966 Theorem 1 instead.
- Zariski–Samuel p. 253 (§7.1): not fetched. I checked it only as Hochschild cites it, together with the elaborated Mathlib statement.

Automatic checks set aside as false positives: the citation resolver's report that `LieModule.isFaithful_iff` (README line 136) occurs nowhere. Mathlib generates it with `@[mk_iff]` on `LieModule.IsFaithful` (Mathlib/Algebra/Lie/OfAssociative.lean:223), and it elaborates at the pin.

## Source issues

- **Gap** in Asgarli at Theorem 3 (proof), p. 5: the source says each flag term above the nilradical of `L` has nilradical equal to it, citing only maximality of that ideal; it should be shown that the term's nilradical is an ideal of `L` (derivation invariance in characteristic zero, the term being an ideal of `L`); affects the proof.
- **Error** in Asgarli at Lemma 1, part (i), p. 2: the source says the monomials with all exponents positive form a basis of `U/J` and that this set is finite; it should be that the images of ordered monomials with exponents below the degrees of the monic relations span `U/J`; affects the proof.
- **Misprint** in Asgarli at Proposition 2, Step 1, p. 3: the source writes the nilradical of `J` where that of `S` is meant, and calls `U(S)` the enveloping algebra of `L`; it should be the nilradical of `S` and the enveloping algebra of `S`; affects nothing.

## For the human reviewers

- Status: TauCetiRoadmap/RepresentationTheory/STATUS.md line 45 lists AdoIwasawa as complete. After R01, this revision keeps six "Prove" targets (§§0.1, 3.3, 4.5, 5.2, 6.2, 7.4), and its `Suggested.lean` states nothing new. Should it stay active or be marked complete?
- Not tested: Fulton–Harris, Appendix E (7 of 21 locators, tied for the largest share) is paywalled and was not read. Its wording, and the README's arrangement against its contents, were not checked.
- Licence: Asgarli, *Ado's Theorem* (cited in Layers 3–5) is an unpublished expository note served from a UBC staff page, which I classified as an author page. The roadmap reuses no material from it.
