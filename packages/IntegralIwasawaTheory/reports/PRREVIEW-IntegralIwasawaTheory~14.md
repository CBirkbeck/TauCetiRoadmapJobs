# Review of IntegralIwasawaTheory (pull request #3027 at 9ea672c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 50 changed lines since `74a09b7`. The folder is identical to the head the previous review read; that review had no findings, so there was nothing to repair. I recomputed the two added statements independently: §10.5a (the kernels of localization `Ш²(E_m,ℤ_p(i))` and the dual of `Ш¹(E_m,ℚ_p/ℤ_p(1−i))` as the twisted coinvariants `X'_{S_p}(E_∞)(i−1)_{Γ_m}`, for `i≠1`) and §12.3a (the special-value formula for characters of order prime to p), with their routes and four Checks, and read Schneider and Kolster–Movahhedi at the cited locators; all hold. No findings; one small correction and one format note (both carried over, neither blocking) and one question for the author. The Kolster 2009 notes behind §12.3a could not be read from a legal source, which is left to the human reviewers.

## C01 — The downstream sentence identifies §10.5a's degree-2 kernel with ArithmeticKTheory's cohomological wild kernel "in its degree `i−1`", but that roadmap's degrees start at 1, so the identification exists only for `i≥2`

§10.5a is stated for every integer `i≠1`, so a reader who looks up ArithmeticKTheory's object for `i≤0` finds none. ArithmeticKTheory §6.9 defines `Sha²_(i,ℓ)(F)` with coefficients `ℤ_ℓ(i+1)`, inside a layer whose degrees satisfy `i≥1` (§6.1, "For i≥1"); its degree `i−1` is at least 1 exactly when `i≥2`, the range in which §10.5a itself calls the kernel the étale wild kernel. In the paragraph on ArithmeticKTheory under the downstream consumers (line 1915), inserting "for `i≥2`" after "of §10.5a" makes the sentence exact.

## N01 — Mathlib at the pin has a carrier for the `Ш¹` of §10.5a

`ContinuousCohomology.tateShafarevich` (Mathlib, `RepresentationTheory/Homological/ContCohomology/Sha.lean`) is the common kernel of the restrictions to a family of extensions. For p odd and `1−i≠0`, with the family of all completions of K, it is §10.5a's `Ш¹(K,ℚ_p/ℤ_p(1−i))`: a class trivial at every place is unramified outside p, and conversely an unramified class at `v∤p` is zero because Frobenius acts on the divisible coefficients by `Nv^{1−i}≠1`. A clause at line 1548 could name it, if you wish.

## Questions for the author

- Does Kolster 2009, Theorem 3.3, state the formula of §12.3a for every `S⊇S_p∪S_∞` and for E not containing `μ_p`, or only for S containing the places ramified in `E(μ_p)`? The statement as written is true for every such S (adding `v∤p` changes both sides by `d_χ v_p(1−χ(v)Nv^{n−1})` when χ is unramified at v and by 0 when it is ramified), but if the source needs the larger S, a sentence saying how the smaller S follows would make the locator support the statement as written. I could not check: the notes are linked on a conference host, not an author's page or an open repository, and I did not read them.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §10.5a, `Ш¹(E_m,ℚ_p/ℤ_p(1−i))^∨ ≅ X'(i−1)_{Γ_m}` | `n=1−i≠0`; open `D_v⊂Γ_m` at `v\|p` | `H¹(D_v,ℚ_p/ℤ_p(n))=coinvariants=0` since `κ(g)^n−1≠0` is onto a divisible group; local triviality ⇔ hom kills decomposition groups; `𝔛_S/⟨D_w⟩=X/D_∞` | holds; Schneider §6 Lemma 1 |
| §10.5a, `Ш²(E_m,ℤ_p(i)) ≅ X'(i−1)_{Γ_m}` | finite coefficients `ℤ/p^k(i)`, dual `ℤ/p^k(1−i)` | `lim_k Ш²(ℤ/p^k(i)) = (colim_k Ш¹(ℤ/p^k(1−i)))^∨`; kernels commute with lim (left exact) and colim | holds; Schneider §2 Satz 5 i) with `n=1−i` |
| §10.5a, "Tate twists are Γ-modules" | p odd, `μ_p⊂E` | image of κ on `Gal(E(μ_{p^∞})/E)` lies in `1+pℤ_p`, torsion-free, so Δ=1 and κ factors through Γ | holds |
| §10.5a, `i≥2`: first kernel is `WK^ét_{2i−2}` | `S=S_p∪S_∞`, p odd | Kolster–Movahhedi define it as that kernel, independent of `S⊇S_p`; p. 60 gives `X'(i−1)_{Γ_n}≅WK^ét_{2i−2}(E_n)` for `i≥2` | holds |
| §10.5a Check 1 | p regular, `E=ℚ(μ_p)` | one prime, totally ramified; `Cl(E)(p)=0⇒X_∞=0` (§3.1) `⇒X'=0`; `E_m=ℚ(μ_{p^{m+1}})`; both kernels 0 | true |
| §10.5a Check 2 | `i=1` | `H¹(Γ_m,ℚ_p/ℤ_p)=Hom(ℤ_p,ℚ_p/ℤ_p)=ℚ_p/ℤ_p≠0` | true |
| §12.3a formula | F=E=ℚ, χ=1, p=691, n=12 | RHS: `v₆₉₁(ζ(−11))=v₆₉₁(691/32760)=1`, H⁰ term 0 (690∤12); LHS: 691-part of `K₂₂(ℤ)` has order 691 | equal |
| §12.3a formula | F=E=ℚ, χ=1, p=5, n=4 | RHS: `v₅(ζ(−3))=v₅(1/120)=−1`, `H⁰=ℤ/5` gives +1; LHS: `K₆(ℤ)=0` | equal (0=0) |
| §12.3a, χ versus χ⁻¹ | class-group analogue n=1 | η-part of A pairs with `L(0,η⁻¹)`; twisting by `ω^{n−1}` gives η-part of `H²(ℤ_p(n))` with `L(1−n,η⁻¹)`; η=χ⁻¹ gives `L(1−n,χ)` | convention consistent |
| §12.3a, every `S⊇S_p∪S_∞` | add `v∤p`, χ unramified / ramified at v | χ⁻¹-part of `⊕_{w\|v}H¹(k_w,ℤ_p(n−1))`: `O_χ/(1−χ(v)Nv^{n−1})` / 0 (inertia of prime-to-p order acts trivially); Euler factor `1−χ(v)Nv^{n−1}` / 1 | both sides change equally |
| §12.3a, `μ_p⊂E` clause | parity, type S | `ψ(c)=χ(c)ω(c)^n=(−1)^{2n}=1`; order prime to p so `E⁺∩F_∞=F`, §12.1 applies with μ | holds |
| §12.3a, passage to `E(μ_p)` | degree divides `p−1` | restriction is an isomorphism onto invariants (Hochschild–Serre, prime-to-p group); `E(μ_p)/E` unramified outside p | holds |
| §12.3a Check 2 | `E=ℚ(μ₇)`, p=7, n=2, `χ=ω⁴`, add 2 | 2 has order 3 mod 7: two primes, `k_w=𝔽₈`, `H¹=ℤ/7`; `Ind` has `ω^a`, `2^a≡2`: a=1,4; `1−2·ω⁴(2)≡1−4≡4`; `1−2·ω²(2)≡1−8≡0` | true |
| Downstream sentence (C01) | ArithmeticKTheory §6.9 | coefficients `ℤ_ℓ(i'+1)`, so `i'=i−1`; real factors `H²(ℝ,ℤ_p(i))=0` for p odd; layer has `i'≥1` | exact only for `i≥2` |
| Headline theorems | `Suggested.lean`, untouched by the diff | 13 declarations (7 definitions, 6 theorems); elaborates with six `sorry` warnings only | unchanged |

- Seeded sample: none of the fifteen targets lies in changed or affected text (§§2.0 and 2.3 are cited by §10.5a and were read as context; their statements are what §10.5a uses). The README flags no locator as unverified.
- Source locators checked against the text: 4 of 7 in the changed passages. Schneider1979 line 236 (§2 Satz 5, printed p. 186), line 738 and lines 749–756 (§6 Lemma 1 and proof, pp. 199–200); KolsterMovahhedi2000 lines 232–236 (§1, p. 41) and lines 872–884 (§3, p. 60). The 3 Kolster 2009 locators are under Not verifiable.
- Library declarations opened at the pin: Mathlib `ContinuousCohomology.tateShafarevich` (`RepresentationTheory/Homological/ContCohomology/Sha.lean`, line 23 of the module docstring).
- Cross-roadmap citations resolved at this head: ArithmeticKTheory §6.9 (README line 2429) and §6.1 (line 1897); LFunctions Layer 5; ProfiniteCohomology Layers 5–12. Internal: §§0.1–0.4, 2.0, 2.3, 3.1, 3.5, 10.4, 10.5, 12.1, 12.3 all exist and say what the new text uses.
- Consumers at this head: BernoulliBoundsForClassGroupEigenspaces 10.1 and 12.1 cite §12.3a; UniformWildKernelBounds 1.1 cites §10.5a for odd ℓ.
- Record: the README at the merge base has 13 layers; the head keeps every id and title, removes no item, and adds two sections with new ids (10.5a, 12.3a). The one changed line keeps its former sentences and adds one.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. Elaboration of `Suggested.lean`: exit 0, `declaration uses sorry` the only warning. No file of the pull request lies outside the roadmap folders it owns. Another open pull request edits this README's `*Needs:*` lines only; its conflicts with this pull request are in other folders.

Overlap check: read EulerSystemsCyclotomicMainConjecture, CyclotomicClassGroupsAndStickelberger, NoncommutativeAndEquivariantIwasawa (main), IntegralIwasawaTheoryPartII, EulerSystemsAndKolyvaginSystems, AutomorphicCongruences, PadicFamilies (open); nothing shared with §§10.5a or 12.3a. The cohomological wild kernel is owned by ArithmeticKTheory §6.9, a downstream roadmap that the new sentence names without consuming; no other roadmap states the coinvariant description or the prime-to-p special-value formula.

Source independence: changed passages only; 5 passages compared with 2 sources (Schneider1979, KolsterMovahhedi2000), none shared beyond forced formulas and the one-line standard description of the split module; largest share of the changed passages' locators Kolster2009, 3 of 7, not compared because its text could not be read legally; arrangement not compared (no layer added, removed or reordered).

Research link: §10.5a is Schneider's (1979) description of the kernels of localization by twisted coinvariants of the split Iwasawa module, used by Kolster–Movahhedi (2000) for co-descent and capitulation of étale wild kernels; §12.3a is the character form of the special-value consequence of the main conjecture (Kolster 2009). Rests on the README and both texts read.

## Not verifiable

- Kolster 2009, Corollary 2.2 (p. 10), Proposition 3.1 (p. 14), Propositions 3.1–3.2 and Theorem 3.3 (pp. 13–15), cited in §12.3a: the README's link is on a conference host that is neither an author's page nor an open repository; I tried that link only and did not look elsewhere.

## Source issues

- none

## For the human reviewers

- Licence, and not tested: Kolster 2009 (README References), cited for §12.3a with 3 of the 7 locators of the changed passages, is linked on the Maine–Québec conference site, not the author's page; §12.3a was not compared with its text.
