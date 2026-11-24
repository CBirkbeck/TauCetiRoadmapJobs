# Review of IntegralIwasawaTheory (pull request #3027 at 0b5086d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 50 changed lines since `aecb53a`. The change adds §10.5a (Schneider's identification of `Ш²(E_m,ℤ_p(i))` and of the dual of `Ш¹(E_m,ℚ_p/ℤ_p(1−i))` with the twisted coinvariants `X'_{S_p}(E_∞)(i−1)_{Γ_m}`, for every `i≠1`) and §12.3a (the special-value formula for characters of order prime to p over an abelian extension of degree prime to p), together with one sentence in the downstream paragraph and two references. Both statements, their routes and all four Checks hold: I recomputed them, including the S-dependence of §12.3a and the `p=7` Check. Schneider and Kolster–Movahhedi support §10.5a at the cited locators. The Kolster 2009 notes cited for §12.3a could not be read from a legal source. No findings; one small correction, one format note and one question for the author, none blocking. The licence of the Kolster 2009 copy is left for the human reviewers.

## C01 — The new downstream sentence matches §10.5a's degree-2 kernel with ArithmeticKTheory's cohomological wild kernel for every `i≠1`, but that roadmap's degrees start at 1, so the match holds only for `i≥2`

A reader who looks up ArithmeticKTheory's object for `i≤0` finds nothing. ArithmeticKTheory's Layer 6 works with degrees `i≥1` (§6.1), and its §6.9 `Sha²_(i,ℓ)` uses the coefficients `ℤ_ℓ(i+1)`. So its degree `i−1` is at least 1 exactly when `i≥2`, which is also the range in which §10.5a calls this kernel the étale wild kernel. In the downstream-consumers paragraph (line 1915), adding "for `i≥2`" after "The kernel of localization on `H²(O_K[1/p],ℤ_p(i))` of §10.5a" would make the identification exact.

## N01 — Mathlib at the pin has a carrier for the `Ш¹` of §10.5a

`ContinuousCohomology.tateShafarevich` (Mathlib, `RepresentationTheory/Homological/ContCohomology/Sha.lean`, line 72) is the common kernel of the restrictions from `G_K` to the absolute Galois groups of a family of extensions. Take p odd, `1−i≠0` and the family of all completions of K. Then §10.5a's `Ш¹(K,ℚ_p/ℤ_p(1−i))` is this group. Inflation from `G_{K,S}` is injective, with image the classes unramified outside S. At `v∉S` an unramified class is zero, because Frobenius acts on the divisible coefficients by `Nv^{1−i}≠1`. If you wish, a clause at line 1548 could link the notation to Mathlib's carrier.

## Questions for the author

- Does Kolster 2009, Theorem 3.3, state the formula of §12.3a for every `S⊇S_p∪S_∞` and for E without `μ_p`, or only for S containing the places ramified in `E(μ_p)` (the hypothesis BernoulliBoundsForClassGroupEigenspaces 12.1 keeps)? The statement as written is true for every such S. Adding a place `v∤p` changes both sides by `d_χ v_p(1−χ(v)Nv^{n−1})`, through the localization sequence, and changes neither side when χ is ramified at v. But if the source needs the larger S, one sentence saying how the smaller S follows would make the locator support the statement as written. I could not check because the notes are on a host that the source service does not classify as a legal source.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §10.5a, `Ш¹(E_m,ℚ_p/ℤ_p(1−i))^∨ ≅ X'(i−1)_{Γ_m}` | `j=1−i≠0`; open decomposition group `D_v⊂Γ_m` | `H¹(Γ_m,ℚ_p/ℤ_p(j))=0` and `H¹(D_v,ℚ_p/ℤ_p(j))=0` since `κ^j−1≠0` is onto; `f(γx)=κ^j f(x)` factors through `X'(i−1)` | holds; Schneider §6 Lemma 1 with `n=1−i` |
| §10.5a, `Ш²(E_m,ℤ_p(i)) ≅ X'(i−1)_{Γ_m}` | finite levels `ℤ/p^k` | `Ш²(ℤ_p(i))=lim Ш²(ℤ/p^k(i))=(colim Ш¹(ℤ/p^k(1−i)))^∨`; Schneider Satz 5 with `n=1−i` | holds for all `i≠1` |
| §10.5a, "for `i≥2` the first is `WK^ét_{2i−2}`" | `S=S_p∪S_∞`, p odd | `H²(ℝ,ℤ_p(i))=0`, so the sum over `v|p` equals the sum over S; KM p. 60 gives the isomorphism for `i≥2` | holds |
| §10.5a Check 1 | p regular, `E=ℚ(μ_p)` | one totally ramified prime; `Cl(E)(p)=0⇒X_∞=0` (§3.1) `⇒X'=0⇒Ш²=Ш¹=0` at `ℚ(μ_{p^{m+1}})` | true |
| §10.5a Check 2 | `i=1` | `H¹(Γ_m,ℚ_p/ℤ_p)=Hom(ℤ_p,ℚ_p/ℤ_p)=ℚ_p/ℤ_p≠0` | true |
| §12.3a formula | F=ℚ, p=3, n=2, χ=1, `E=ℚ(μ₃)`, S={3,∞} | LHS: `K₂(ℤ[1/3])⊗ℤ₃=0`, so 0; RHS: `v₃(1/6)=−1` plus `H⁰=ℤ/3` gives +1; total 0 | equal |
| §12.3a formula | F=E=ℚ, p=5, n=4, χ=1 | LHS 0 (`K₆(ℤ)=0`); RHS: `v₅(−124/120)=−1`, `H⁰(ℚ,ℚ₅/ℤ₅(4))=ℤ/5` gives +1 | equal |
| §12.3a formula | F=E=ℚ, p=691, n=12, χ=1 | `v₆₉₁(ζ_S(−11))=1`, H⁰ term 0 (690∤12); so `#H²=691`, the 691-part of `K₂₂(ℤ)` | equal |
| §12.3a S-range | add `v∤p`; χ unramified, then ramified at v | χ⁻¹-part of `⊕_{w|v}H¹(k_w,ℤ_p(n−1))` is `O/(Nv^{n−1}−χ⁻¹(v))`, or 0 if χ is ramified; Euler factor `1−χ(v)Nv^{n−1}`, or 1 | consistent for every `S⊇S_p∪S_∞` |
| §12.3a duality when `μ_p⊂E` | parity of χ | `ψ(c)=1`; multiplicity of χ⁻¹ in `H¹(O_{E,S},ℚ_p(n))` is `#{v: χ(c_v)=(−1)^{n−1}}=0`, so the boundary map is an isomorphism on the χ⁻¹-part | holds |
| §12.3a passage to `E(μ_p)` | `[E(μ_p):E]` divides `p−1` | restriction is an isomorphism onto the invariants; χ⁻¹-parts lie in the invariants since χ is trivial on `Gal(E(μ_p)/E)` | holds |
| §12.3a Check 1 | `E=F(μ_p)` | same ψ and H⁰ term; with the duality it gives §12.3's `v_p(#X_ψ(−n)_Γ)` | true |
| §12.3a Check 2 | `E=ℚ(μ₇)`, p=7, n=2, `χ=ω⁴`, add 2 | 2 has order 3 mod 7: two primes, `k_w=𝔽₈`, `H¹=ℤ/7`, Frob by 2, `Ind=ω⊕ω⁴`; `1−2χ(2)≡4`; `1−2·[4]≡−35 mod 49`, `v₇=1` | true |
| Downstream sentence (C01) | ArithmeticKTheory §6.9, `ℤ_ℓ(i'+1)` | `i'+1=i⇒i'=i−1`; real factors vanish for p odd; Layer 6 has `i'≥1`, i.e. `i≥2` | holds for `i≥2` |
| Headline theorems | `Suggested.lean`, unchanged by the diff | 13 declarations; elaboration gives exit 0 with six `sorry` warnings | unchanged |

- Seeded sample: none of the fifteen targets lies in the changed or affected text, so none was checked. The README flags no locator as unverified.
- Source locators checked against the text: 4 of the 7 in the changed passages (Schneider1979 lines 236–243 and 738–756; KolsterMovahhedi2000 lines 232–236 and 882–884). The other 3 (Kolster 2009) are listed below as not verifiable.
- Library declarations opened: Mathlib `ContinuousCohomology.tateShafarevich`, ContCohomology/Sha.lean:72. Grep of the pinned Mathlib and Tau Ceti finds no wild kernel, Iwasawa split module or Poitou–Tate.
- Cross-roadmap citations resolved on main: ArithmeticKTheory §6.9 (line 2427), LFunctions Layer 5 (line 844), ProfiniteCohomology Layers 5–12. Internal: §§0.1–0.4, 2.0, 2.3, 3.5, 10.4, 10.5, 12.1, 12.3, `twistedRamified_coinvariants`, `arithmeticCompactDuality`, `wilesMainConjecture`.
- Consumers at this head: BernoulliBoundsForClassGroupEigenspaces 10.1 and 12.1 cite §12.3a, and UniformWildKernelBounds 1.1 cites §10.5a with `e=i−1`, consistent with `i≠1`.
- The README at merge base `aecb53a` has 13 layers; all keep their ids and titles; no item was removed; the one changed line keeps its old sentence. The other open pull request that revises this README edits only Needs lines in Layers 3, 5 and 7, with no textual overlap.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: only `declaration uses sorry` warnings. Signatures were taken from the elaborated types; the file is unchanged and no binder was dropped.

Overlap check: read EulerSystemsCyclotomicMainConjecture, CyclotomicClassGroupsAndStickelberger, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems (main), IntegralIwasawaTheoryPartII, AutomorphicCongruences, PadicFamilies (open); none shares the objects of §§10.5a or 12.3a. The cohomological wild kernel is owned by ArithmeticKTheory §6.9, which is downstream and is named here, not consumed. BernoulliBoundsForClassGroupEigenspaces and UniformWildKernelBounds cite the new sections as corollaries.

Source independence: changed passages only; 5 passages compared with 2 sources (Schneider1979, KolsterMovahhedi2000). Nothing is shared beyond forced formulas and the standard one-line definition of the split module, with at most four consecutive words in common with KolsterMovahhedi2000 line 873. The largest share of the changed passages' locators is Kolster2009, 3 of 7; it was not compared because it cannot be read legally. Arrangement was not compared, since no layer was added, removed or reordered.

Research link: §10.5a is Schneider's (1979) description of étale wild kernels by twisted coinvariants of the split Iwasawa module, which Kolster and Movahhedi (2000, §3) use for capitulation and co-descent. §12.3a is the prime-to-p character form of the special-value consequence of the main conjecture (Kolster 2009, Theorem 3.3). This rests on the README and KolsterMovahhedi2000 §3.

## Not verifiable

- Kolster 2009, Corollary 2.2 (p. 10), Proposition 3.1 (p. 14), Propositions 3.1–3.2 and Theorem 3.3 (pp. 13–15), cited in §12.3a. The README's link is on a conference host that the source service puts in no licence class, and the published volume is paywalled. I tried the README's URL through the source service.

## Source issues

- none

## For the human reviewers

- Licence, and not tested: Kolster 2009 (README References), cited for §12.3a and carrying 3 of the 7 locators in the changed passages, is linked on the Maine–Québec conference site, not the author's page. The source service classifies that host in no licence class, so §12.3a was not compared with it.
