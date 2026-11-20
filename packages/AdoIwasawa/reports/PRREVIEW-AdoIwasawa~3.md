# Review of AdoIwasawa (pull request #2633 at 66e340d)
Folder: `TauCetiRoadmap/RepresentationTheory/AdoIwasawa/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding: three sentences about `sl₂` are stated without a restriction on the characteristic and are false in characteristic 2, where `sl₂` has centre `K h` and is nilpotent; two of them are Checks of the characteristic-free Layer 0, the third is the §3.6 remark the previous review already pointed at (the head has not changed since). Adding "in characteristic ≠ 2" in three places repairs it. Everything else was recomputed and stands: all 221 library names the README cites elaborate at the pins, the twelve pinned headlines match the README, and the Hochschild locators match the text. No small corrections and no format notes; three questions are left to the human reviewers.

## R01 (P2) — Three statements about `sl₂` fail in characteristic 2, two of them Checks of the characteristic-free Layer 0

The roadmap insists, rightly, that every item of Layers 0–2 holds over `𝔽₂`, so a reader takes a Check of Layer 0 to hold over every field, and an implementer who turns one into a test over a general field finds it false. Over a field of characteristic 2, `⁅h, e⁆ = 2e = 0` and `⁅h, f⁆ = −2f = 0`, while `⁅e, f⁆ = h`: so `Z(sl₂) = K h ≠ 0`, `⁅L, L⁆ = K h` is central, and `sl₂` is the Heisenberg algebra, nilpotent, with `nil L = L`. Against this:

- the Check of §0.1 (line 144) says "For `L = sl₂` the adjoint action is faithful, the centre being `0`": in characteristic 2, `ad h = 0`, and by `LieAlgebra.isFaithful_self_iff`, which the same Check cites, the adjoint module is not faithful;
- the Check of §0.5 (line 227) says "For `sl₂` the nilradical is `0`": in characteristic 2 it is all of `sl₂`, the case the same line assigns to "a Heisenberg algebra";
- the remark of §3.6 (lines 566–568) says the range containment fails for `S = sl₂`, `D = ad x` "with `x ≠ 0`": in characteristic 2, `σ h` is the identity matrix, so `[σ h, M₂(K)] = 0` and the containment holds for `x = h` (and `sl₂` is not semisimple there, so it is not an instance of the sentence it illustrates).

The other mentions of `sl₂` are safe: §§3.4, 5.4, 5.6 and the Layer 5 example stand under a characteristic-zero hypothesis, and the Check of §8.2 says "for `p ≥ 3`". The smallest repair is the same qualifier in the three places: "For `L = sl₂` in characteristic ≠ 2" in §0.1 and §0.5, and "for `S = sl₂` in characteristic ≠ 2" in §3.6. The characteristic-2 case would also make a good negative control in §0.1: over `𝔽₂`, `sl₂` has a nonzero adjoint representation that kills `h`.

## Previous findings

- C01 of the previous review (the `sl₂` counterexample of §3.6 needs characteristic ≠ 2) — not repaired: the head is the one that review read, and lines 566–568 still read "fails for `S = sl₂`, `D = ad x` with `x ≠ 0`". It is now part of R01, with the two Checks that share its cause.
- Every repair that review recorded (its R01, R02, C01–C03, N01–N03 of the round before) still stands at this head: §5.6 cites `LieIdeal.isNilpotent_ad_right_of_isCompl`, §1.5 says a degree-`0` relation forces `A = 0`, §4.5 states the invariance as a remark, §7.4 cites `TauCeti.span_range_prod_quotient_span_pow_eq_top`, `Suggested.lean` pins twelve declarations through five imports.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 Check, `sl₂` adjoint faithful | characteristic 0, 3, 2 | characteristic ≠ 2: centre `0`; characteristic 2: `[h,e] = 2e = 0`, `[h,f] = 0`, centre `K h`, `ad h = 0` | false in characteristic 2: R01 |
| §0.5 Check, `nil sl₂ = 0` | characteristic 2 | `[L,L] = K h`, `[L, K h] = 0`: nilpotent, `nil = L` | false in characteristic 2: R01 |
| §3.6 remark, `sl₂` | `x = h`, `x = e`, characteristic 2 and ≠ 2 | `ef = E₁₁`, `fe = E₂₂`: `σ(U) = M₂`; `[σh, E₁₂] = 2E₁₂`; characteristic 2: `σh = 1`, commutator `0`; `[σe, E₂₁] = h ≠ 0` | false for `x = h` in characteristic 2: R01 |
| Convention 3, affine-line algebra | ideal `K(ax+by)` | `[x, ax+by] = by`, `[y, ax+by] = −ay`: forces `a = 0`; `[L, Ky] = Ky`; `maxNilpotentIdeal = ⊥`, `nil = Ky` | true, any field |
| §0.3 finite-target reduction | elaborated types; affine line, Heisenberg | `K`, `L`, `A` in one universe, no finiteness on `L` in the iff; `Z(aff) = 0`; `ad z = 0` in Heisenberg | matches |
| §0.4 products | elaborated types | `ker (ρ ⊕ σ) = ker ρ ⊓ ker σ`; injective iff `Disjoint`; family: `⨅ ker = ⊥`; point-separating needs `FiniteDimensional K L` | matches |
| §1.2 Check | affine line, `x < y` | `xy − yx = y`, so `yx = xy − y`; multiplicative iff `U` commutative iff `L` abelian | true |
| §1.3 functoriality | elaborated types | filtration map for every `f`; surjective and `mkQ`: image equals `F_k`; injective over a field: `F_n ⊓ range`; `U(L × M) ≃ₐ U(L) ⊗ U(M)` | matches |
| §2.2 Check, Heisenberg | weights `(1,1,2)` grading | `z = xy − yx ∈ U⁺²`; `U⁺³ ⊆` weight `≥ 3`, `z` has weight 2 | true |
| §2.3 weighted truncation | Heisenberg `N = 3`, `N = 2`; `w(z) = 1`; abelian `N = 2` | monomials of weight `< 3`: `1,x,y,z,x²,xy,y²` = 7 (pinned `finrank = 7`); `N = 2`: `1,x,y`, `z` killed; `w z = 1 < 2` violates; `K ⊕ L` | true; `[Finite ι]`, weights positive, as stated |
| §2.4 nilpotent action | elaborated types | injective if all `w i < N`; `ρ x ^ N = 0` if all `0 < w i`; example: `x^a y^b z^c ∈ U⁺^(a+b+2c)` | matches |
| §3.1 derivations | `D(a₁⋯aₙ)`, range in `I` | each term `a₁⋯D(aᵢ)⋯aₙ ∈ Iⁿ`; commutative case `Derivation R A A ≃ₗ⁅R⁆` | matches |
| §3.2 Check | `ι x · ι y` | derivation: `ι(Dx)ιy + ιx ι(Dy)`; multiplicative lift: `ι(Dx)ι(Dy)` | true |
| §3.3 pinned statements and target | elaborated types; affine line over `ℚ` | radical: `CharZero`, f.d., `A` a PID domain; nilradical `≤` for every `A`; descent: faithfully flat; both sides `ℚ̄ y`, radical is everything | matches; target true in characteristic 0 |
| §3.4 and its Checks | affine-line derivations; `sl₂` in characteristic 0 | `Dy = a₁y + b₂y` forces `a₂ = a₁ = 0`; `ad x`, `ad y` span the 2-dimensional derivation space; `ad h ≠ 0`, `nil = 0` | true; all four pinned with `CharZero`, f.d. |
| §3.6 refinement | elaborated types; `u^e ∈ I` | `u^(em) ∈ B^m`; pinned: `J = (I ⊔ N·U)^n ≤ I`, finite, stable for `D L ≤ N`, same nilpotents; solvable form: `CharZero` | matches |
| §4.1 split extensions | elaborated types | `IsCompl ↑S H.toSubmodule → Nonempty (L ≃ₗ⁅R⁆ S ⋊⁅S.ad.comp H.incl⁆ H)`, any commutative ring | matches |
| §4.4–4.5 extension | elaborated types; `nil L ≤ nil S` | char 0: `nil S = nil L ⊓ S`, so `≤` is `=`; nilpotent form has no characteristic hypothesis | matches |
| §5.1 centre | `K × Z(L)`, `Z = 0` | `ρx ρy = 0`, injective, `finrank + 1`; `Z = 0`: representation on `K` | matches |
| §5.2 flag (target) | affine line; abelian `L` | `0 < Ky < L`, `a = 1`; abelian: `Z = N = R`, `a = b = 0`; above `N`: `[L, T] ≤ N ≤ T` | true |
| §5.6 and Check | `sl₂`, `s = e`, `s = h`, characteristic 0 | `[e, −h/2] = e`; `ker ad e = Ke`; `range ad h = ⟨e, f⟩ ∌ h`; pinned eigenvalue lemma has `CharZero`, `c ≠ 0` | true |
| §5.8 | `x = s + r` | `[x, s] = [r, s] ∈ N`; `r = x − s` in the span of `x` and `Ks + N` | true |
| §6.1 Frobenius identity | `a = diag(1,0)`, `ℚ` and `𝔽₂`; `p = 1` | `[a, E₂₁] = −E₂₁`; `(ad a)²` has `+1`; equal iff `−1 = 1`; pinned with `[ExpChar A p]`, iff needs `p ≠ 1` | true |
| §6.2 central `p`-polynomials | affine line, `p = 2, 3`; abelian `Kx ↪` affine line | `(ad x)² = ad x`, `(ad y)² = 0`; `[x², y] = 2xy − y = y`; `[y², x] = −2y² = 0`; `ι x` not central | true; target (field extension) true |
| §6.5 extended ideal | `L = Kx`; elaborated types | `C = xK[x]`, `(UC)ⁿ = (xⁿ)`; `I^n • ⊤ = (map I)^n` for any commutative semiring `R` acting by an algebra structure | matches |
| §7.1 Krull and Check | `K × K`, `r = (1,0)` | `Jⁿ = J`, `⋂ = J ≠ 0`, `(1 − r) r = 0`; Mathlib: `x ∈ ⨅ i, I^i • ⊤ ↔ ∃ r : I, r • x = x` | true; matches Mathlib/RingTheory/Filtration.lean:393 |
| §7.4 target and Check | `L = Kx`, `n = 2` | `e = 0`, `m < 1`: spanning set `1, x`; `c^β` with `|β| ≥ n` lies in `(UC)ⁿ` | true |
| §8.2 Check, `sl₂` on `𝔽_p^p` | general `i`, `p ≥ 3` | `[h,e]vᵢ = 2v_(i+1)`; `[h,f]vᵢ = 2i(i−1)v_(i−1) = −2fvᵢ`; `[e,f]vᵢ = (−i(i−1) + (i+1)i)vᵢ = 2i vᵢ`; `e^p = 1` | true |
| Headlines, 12 pinned declarations | elaborated types | Ado–Iwasawa, Hochschild: `[Field K]`, f.d. only, `Type (max u v)`; tracks: `[CharZero K]` or `[Fact p.Prime] [CharP K p]`; Birkhoff: `ρ x ^ N = 0`; Levi: `CharZero` | match README |
| Hochschild locators | Hochschild1966 lines 16–19, 25–57, 61–80, 81–91, 93–95 | Thm 1 p. 531; characteristic-zero argument pp. 531–532 (Lie's theorem at lines 44–46); Thm 2 p. 532; Jacobson V Thm 6, VI Lemma 5, V Lemma 4, pp. 202–203; Z–S p. 253 | all match |

- Source locators checked against the text: 9 passages of Hochschild1966 (lines 16–19, 25–33, 34–57, 61–63, 64–74, 75–80, 81–91, 93, 94–95); the other sampled sections carry library declarations, checked at the pins, or Fulton–Harris locators (below).
- Library declarations: all 221 dotted names in code font in the README were elaborated with `#check` in one scratch file against the pinned Mathlib and Tau Ceti, none unknown; 70 elaborated types were read against the prose. Opened at the pin, among others: TauCeti/RepresentationTheory/Lie/FiniteTarget.lean:57 and :70, TauCeti/Algebra/Lie/Prod.lean:283, TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Ordered.lean:139, TauCeti/RepresentationTheory/Lie/NilpotentFaithful.lean:88, TauCeti/Algebra/Lie/Derivation/Basic.lean:118, TauCeti/Algebra/Lie/BaseChange/Radical.lean:221, TauCeti/Algebra/Lie/SemiDirect/Basic.lean:233, TauCeti/RepresentationTheory/Lie/Abelian.lean:124, TauCeti/Algebra/Lie/AdjointAction/Frobenius.lean:76, TauCeti/Algebra/Lie/UniversalEnveloping/PCenter.lean:234, TauCeti/RingTheory/Ideal/Extended.lean:148 and :171, TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:78, Mathlib/RingTheory/Filtration.lean:393, Mathlib/Algebra/Lie/OfAssociative.lean:224.
- Elaboration: `lake env lean` on `Suggested.lean` prints the twelve `#check`s with no warning and no error. The file declares nothing, so there is no declaration to probe with one tactic and no binder to lose; no `set_option`, no `sorry`, one `import Mathlib` and five `TauCeti.*` imports, each hosting a pinned declaration.
- Headline theorems (README overview): Ado–Iwasawa with its matrix form, Hochschild's strengthening with the nilpotent case, Birkhoff's theorem, Levi's theorem. Each is proved at the Tau Ceti pin and is pinned, not restated; none is absent and none goes through a stand-in.
- Cross-roadmap citations resolved on main: LieHighestWeight §3.1 (its README lines 1179–1212, which names this roadmap as the arbitrary-field consumer of PBW and cites `TauCeti.adoIwasawa`), LieGroups Layer 4 (its README line 502, Lie's third theorem through the real matrix form).
- Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks pass at this head and the pull request changes nothing outside the folder.
- The pull request's description against the head: 23 Checks in 17 blocks (counted), twelve pinned declarations, the six "Prove" targets (§§0.1, 3.3, 4.5, 5.2, 6.2, 7.4), §5.6 citing the pinned lemma, a revision of the roadmap on main with the old `Suggested.lean` statements removed: all stated, nothing to correct.
- Duplication: no target restates a pinned declaration; the six targets were searched for by object in the pinned Tau Ceti (the equality of nilradicals under base change, the internal extension form, the flag, the field-extension naturality, the explicit spanning set) and only the cited one-sided or external forms exist.

Overlap check: read LieHighestWeight, LieHighestWeightPartII, LieGroups and NilpotentOrbits (main and open heads); nothing shared. PBW is the Tau Ceti development that LieHighestWeight §3.1 also consumes, complete reducibility is LieHighestWeight's, Lie's third theorem is LieGroups'; none of the four states Ado's theorem, the Levi decomposition, the largest nilpotent ideal, the weighted truncation or central `p`-polynomials.

Source independence: 10 passages compared with 1 source (Hochschild1966, against §§5.6, 5.7, 5.8, 6.4, 6.5, 7.2, 8.1, 9.1, the Layer 6 introduction and the docstring of `Suggested.lean`), none shared beyond standard four-word terms; largest share Fulton–Harris, 7 of 19 locators in the layers (Hochschild1966 has 5); contents compared with Hochschild1966, which has no sections: Layers 6–8 are in the order their *Needs:* lines force (§7.1 needs §§6.4–6.5, §8.1 needs §§7.3–7.4) and split one proof into reusable statements; Fulton–Harris Appendix E could not be read, so neither its wording nor its contents were compared.

Research link: The headline is Iwasawa's theorem (1948) in Hochschild's strengthened form (1966, Theorem 1); Hochschild records that L. Ross used its characteristic-zero case for Ado's theorem for graded Lie algebras (thesis, 1964), and LieGroups Layer 4 uses the real matrix form for Lie's third theorem. Rests on the README and Hochschild1966 lines 16–24.

## Not verifiable

- Fulton–Harris, Appendix E, §E.2, pp. 499–503 and Proposition E.5 (Convention 4, §§3.4, 4.1, 4.4, 5.3 and the introductions of Layers 3–5): paywalled, settled as cited by locator; not read.
- Jacobson, *Lie Algebras*, Chapter V Theorem 6 and Lemma 4, Chapter VI Lemma 5, pp. 202–203: no legal copy; checked only as Hochschild1966 lines 27 and 64–74 cite them.
- Zariski–Samuel, Vol. I, p. 253 (§7.1): not read; checked only as Hochschild1966 lines 78 and 94–95 cite it. The statement used is Mathlib's, read at the pin.
- Asgarli, *Ado's Theorem* (Layers 3–5, cited without a page) and Iwasawa 1948 (§9.2): not read.

Automatic checks set aside as false positives: the citation resolver lists `LieModule.isFaithful_iff` (README line 136) as found nowhere; it is generated by `@[mk_iff]` on `LieModule.IsFaithful` (Mathlib/Algebra/Lie/OfAssociative.lean:224) and elaborates at the pin.

## Source issues

- **Misprint** in Hochschild1966 at the reference list, item 1, p. 533: the source says Jacobson's *Lie Algebras* appeared with Interscience in 1961; it should be 1962, as the README's reference list has it; affects nothing.

## For the human reviewers

- Status: `TauCetiRoadmap/RepresentationTheory/STATUS.md` line 45 lists AdoIwasawa as complete, while this revision keeps six "Prove" targets (§§0.1, 3.3, 4.5, 5.2, 6.2, 7.4) and its `Suggested.lean` states nothing new.
- Not tested: Fulton–Harris, Appendix E, has the largest share of the locators (7 of 19) and is paywalled; its wording and its contents were not compared with Layers 3–5.
- Licence: Asgarli, *Ado's Theorem* (README references, Layers 3–5) is an unpublished expository note on a university staff page; the roadmap cites it for a proof route and reuses no material from it.
