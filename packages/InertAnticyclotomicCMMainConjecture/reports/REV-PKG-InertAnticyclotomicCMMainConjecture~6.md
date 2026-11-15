<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6897014058 -->
Review (claude) of b19474a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.4 attributes to §4.1 a duality sequence that §4.1 does not state

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:575`: “§4.1 with s=ε and S_str=0 gives 0→S_ε→H^ε→X_rel→X_ε→0”; and line 583, the *Needs:* line of §4.4.

   **Claim:** §4.1 states one sequence only, `0 → S_s → S_rel → H/H^s → X_s → X_str → 0` (line 520), the comparison of the strict and signed conditions. The sequence used for identity 1 compares the signed and relaxed conditions; it is a second application of Poitou–Tate and is no instance of the displayed one. It is true, but it is not a target, so the route of identity 1 uses an input that no target states. The *Needs:* line of §4.4 also omits §4.1, which the routes of both identities use.

   **Witness:** §4.1 at s=ε reads `0→S_ε→S_rel→H/H^ε→X_ε→X_str→0`: its third term is H/H^ε and X_rel does not occur. AHII05 lines 266–268 obtains its (4.3) by a separate appeal to global duality, not from its (3.3).

   **Exact repair:** In §4.1, after the displayed sequence, add the second one as part of the target: “and an exact sequence `0 → S_str → S_s → H^s → X_rel → X_s → 0`, whose middle map is localisation at 𝔭 and whose last map is dual to the inclusion Sel_s(K∞,W)⊂Sel_rel(K∞,W); it is Poitou–Tate for the pair of Selmer structures (signed, relaxed), H^s being the dual of H¹(Ψ∞,W)/L_∞^s (AHII05 (4.3), p.617).” In §4.4 replace “§4.1 with s=ε and S_str=0 gives” by “the second sequence of §4.1 with s=ε and S_str=0 gives”, and add §4.1 to the *Needs:* line. Tested on the refuting instance: at s=ε the new sequence has terms of ranks 0, 1, 1, 1, 1 (alternating sum 0) and, with S_str=0, is exactly the sequence line 575 uses; in the model H^ε=Λ_R, S_ε=(T) of the §4.4 Check it gives `0→Λ_R/(T)→(X_rel)_tors→(X_ε)_tors→0`.

2. **F02** (P3) The identifiers LT.0–LT.2 and LT.8 are not in the supplier's text

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:23` (“LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2 and LT.8”), line 113 (“LT.2 supplies … and LT.8 the fields Ψ_n with [Ψ_n:Φ]=pⁿ, their conductor filtration and the action of conjugation”), and the *Needs:* and Dependencies lines 156, 212, 251, 319.

   **Claim:** The supplier's README at the head of its open pull request has no identifier `LT.k` and no table mapping a former numbering (NonordinaryCMSpecialValues has one, lines 127–136 at its head, so the `NCM.k` citations stay valid). Its sections are numbered §k.n. It states no conductor filtration in Layer 8; the conductor exponents are AnticyclotomicLocalUnits §0.1, which this README already cites.

   **Witness:** `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` at the head of #2284: 0 matches of `LT.` followed by a digit; headings `### 2.4 The Lubin–Tate character` (line 982), `### 2.5 Comparison with local reciprocity` (1013), `### 8.2` (2125), `### 8.3 The fixed fields Θ_n and Ψ_n` (2155); “conductor” occurs only in §6.4.

   **Exact repair:** Cite the sections as they are at that head.
   - Line 23: “LT.0–LT.2 and LT.8” → “Layers 0–2 and 8”.
   - Line 113: “LubinTateFormalModulesAndQuasiCanonicalLifts §2.4 supplies the Lubin–Tate character, §2.5 the local Artin comparison κ(Art_Φ(u))=u⁻¹ on O× and the norm groups π^ℤ·U(Φ,m) of the division fields, §8.2 the action of conjugation on the cyclotomic and anticyclotomic directions, and §8.3 the fields Ψ_n with [Ψ_n:Φ]=pⁿ.” Delete “their conductor filtration” (it is AnticyclotomicLocalUnits §0.1, cited in §0.2 and §0.3).
   - Lines 156, 212: “LT.2, LT.8” → “§§2.4–2.5, 8.2–8.3”. Lines 251, 319: “LT.2” → “§2.4”.
   Tested: each replacement resolves to a heading quoted in the witness; §2.5 states `χ_π(σ)=u⁻¹` for a lift of `Art_K(π^r u)` and §8.3 states `[Ψ_n : Φ] = p^n`.

3. **F03** (P3) The named downstream consumer imports nothing from this roadmap

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:808`: “ModularIwasawaMainConjecturesPartII imports Layers 0–6: the inert CM datum and tower dictionary, the signed Kummer conditions and Selmer modules, …”.

   **Claim:** At the head of its open pull request that roadmap names this one as the owner of the inert anticyclotomic main conjecture and consumes nothing from it. No roadmap on main or open imports a target of this roadmap.

   **Witness:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:32` at the head of #2281: “… is InertAnticyclotomicCMMainConjecture. Nothing here is consumed from it, and nothing of it is restated here.” The other mentions (#1692 line 1150, #2290 line 909, #1744 line 11) describe what this roadmap consumes or owns.

   **Exact repair:** Replace the first sentence of `## Downstream consumers` by: “ModularIwasawaMainConjecturesPartII and CMRankZeroConverse name this roadmap as the owner of the inert anticyclotomic main conjecture and of the rank bounds of BKO21 Theorems 6.1–6.2, and restate none of it.” Keep the second sentence (what a consumer of §4.6 and of §6.4 uses). Tested against line 32 quoted above.

4. **F04** (P3) Two dual statements written as identifications with the module itself

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:667` (§5.3): “it identifies the χ⁻¹-specialisation of X_s with the χ-part of the rational signed Selmer group over K_n”; line 769 (§6.3): “identifies Sel_(−ε)(K_n,V_pE)^χ with the χ⁻¹-specialisation of X_(−ε)”.

   **Claim:** This is the pattern the last round repaired in §1.5 and §3.3, left in two places. By the Conventions (line 45) and the API of §1.5 (line 301) the χ⁻¹-specialisation of the dual is the dual of the χ-eigen-submodule, not that submodule. Only the equality of dimensions is used in §6.3, and it holds.

   **Witness:** Line 301: “identifies X_a/(γ−χ(γ)⁻¹)X_a with the dual of the χ-eigen-submodule”. In the model of line 307 (M=L/R, γ=ζ₅) the χ-eigen-submodule is M, π-power torsion, and the χ⁻¹-specialisation is M^∨, the inverse different, torsion-free: dual to each other, not equal.

   **Exact repair:** Line 667: “it identifies the χ⁻¹-specialisation of X_s⊗L_χ with the L_χ-linear dual of the χ-part of the rational signed Selmer group over K_n, through the coefficient trace of §0.4; in particular the two have the same dimension.” Line 769: “Signed control for the sign −ε at χ (§5.3) gives dim Sel_(−ε)(K_n,V_pE)^χ = dim of the χ⁻¹-specialisation of X_(−ε), which is at most …”. Tested on the model: both sides have L_χ-dimension 1 after inverting p, and the statement no longer equates M with M^∨.

5. **F05** (P3) A page range, a layer dependency and a manifest entry

   **Location and witness, one line each:**
   - `README.md:652` (§5.2): “AHII05 Lemma 5.1 and its proof, pp.618–619”. The lemma and its proof end on p.618 (AHII05 lines 318–338; p.619 begins at line 341 with Theorem 5.2); §5.6, line 713, cites the same passage as p.618.
   - `README.md:294` (§1.5): “AHII05 §2, p.612–613”: a range written with “p.”.
   - `README.md:319` (Layer 1 Dependencies): the list omits `TauCeti.completedGroupAlgebra`, which the *Needs:* line of §1.5 (line 311) names.
   - `packages/InertAnticyclotomicCMMainConjecture/sources.toml`, entry AHII05: `cited_for = ["Layers 0–5"]`, while §6.3 (line 767) and the Worked examples (line 812) cite AHII05.

   **Exact repair:** line 652 → “p.618”; line 294 → “pp.612–613”; add `TauCeti.completedGroupAlgebra` to line 319; set `cited_for = ["Layers 0–6", "Worked examples"]` for AHII05. Tested against the lines named.

Five findings, all P3; no P1 or P2. Both findings of the previous round are repaired. The mathematics of the headline theorems, the seeded source sample, the pins and the supplier order pass the checks recorded below. Three findings come from reading the open pull requests at their current heads (two suppliers and the named consumer have moved since the last round); two are internal (a route that cites a sequence its target does not state, and small locator, dependency and manifest slips). None of the four authored files was modified.

## Verified sound

### Previous findings (round 5), finding by finding

| Finding | Status | Repaired passage | Verification |
|---|---|---|---|
| F01 (P3), scalar on the value of a functional | **repaired** | Line 307: “(γf)(x)=f(γ⁻¹x)=f(χ(γ)⁻¹x)=(χ(γ)⁻¹·f)(x)”; line 301: “identifies X_a/(γ−χ(γ)⁻¹)X_a with the dual of the χ-eigen-submodule”; line 45: “a coefficient scalar acts on a functional through its argument” | Recomputed below: f(x)=0, f(γ⁻¹x)=2/5; dual of γ−c is γ⁻¹−c=−cγ⁻¹(γ−c⁻¹); wrong action gives 𝔽₂₅. |
| F02 (P3), third Check of §1.5 | **repaired** | Line 309: “identifies D_k^∨ with O/π^kO, which has 25 and 625 elements for k=1,2 at p=5 … W^∨≃lim O/π^kO=O” | Recomputed: #O/π=25, #O/π²=625; reduction sends [π] to 0; lim is torsion-free, the colimit along ·π is Φ/O. |

The repair also rewrote the second Check of §3.3 (line 471). Verified: H is free over the domain Λ_R, so (γ−c)h=0 forces h=0; for χ of order 5, ζ≠ζ⁻¹ and the primes (γ−ζ), (γ−ζ⁻¹) have different zeros ζ−1≠ζ⁴−1. The repaired pattern was searched in the rest of the package; R04 records the two places where it remains. No finding of the repair report was marked “not actionable”; nothing is re-raised. No maintainer notes were given.

### Adversarial table (values computed this round)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §1.5 dual action (repaired) | p=5, L=Φ(ζ₅), [L:ℚ₅]=8, M=L/R, f=Tr mod ℤ₅, x=(ζ₅−ζ₅²)/25 | Tr(1)=8, Tr(ζ₅)=Tr(ζ₅²)=−2; f(x)=0; f(ζ₅⁻¹x)=Tr((1−ζ₅)/25)=10/25=2/5; scalar-on-value side 0 | Holds; old form excluded |
| §1.5 dual of γ−c | expansion; c=1 | f∘(γ−c)=γ⁻¹f−cf; −cγ⁻¹(γ−c⁻¹)=−c+γ⁻¹; at c=1 invariants ↔ coinvariants | Holds |
| §1.5 wrong action | same model | γ acts on 𝔇⁻¹ by ζ₅; quotient by ζ₅−ζ₅⁻¹=ζ₅⁻¹(ζ₅−1)(ζ₅+1), ζ₅+1 a unit (Φ₅(−1)=1): R/(ζ₅−1)=𝔽₂₅, not all of M^∨ | Excluded |
| §1.5 limit direction (repaired) | R=O, k=1,2 | 25, 625; [1]↦[1], [π]↦0; lim O/π^k=O torsion-free; colim along ·π = Φ/O torsion | Holds |
| §0.1 datum | K=ℚ(√−23), p=5 | forms (1,1,6),(2,±1,3): h=3; −23≡2, squares mod 5 are 1,4: inert; Frobenius −5 on rank 2: (X+5)², trace −10≠0 | Holds |
| §0.3 dictionary | orders 1, 5, 25 | c=0,2,3; signs +,+,−; AHII05 (3.1) (−1)^(n+1) at order pⁿ equals (−1)^c; AH minus set = {1}∪{odd k} = Ξ⁺ | Holds; labels of point spaces agree (AH E^± kills AH-Ξ^∓ = Ξ^±; BKO F^± kills Ξ^±) |
| §0.5 signed kernels | x=a₊v₊+a₋v₋; a=p; a=T | δ_χ(x)=a_(−s)(χ⁻¹)δ_χ(v_(−s)) at χ∈Ξ^(−s); a=p never vanishes; a=T vanishes at χ=1 only | Holds; infinitely many zeros needed |
| §0.4 dual lattice | R=O; R=O[√π] | different (1); (2√π)=(√π), quotient 𝔽₂₅ of 25 elements; Tr_(O/ℤ_p)(1)=2 | Holds |
| §1.1 conditions | n=0; n=1 | only χ=1 at n=0: A_0⁺=0, A_0⁻=F(Φ); at n=1 all p characters lie in Ξ⁺: A_1⁺=0, rank A_1⁻=p=deg ω_1⁻ | Holds |
| §1.2 conjugate embedding | p=5, β³=aπ, a of order 24 | c(a)/a=a⁴ of order 6; cubes of μ₂₄ are μ₈, μ₆∩μ₈=μ₂; a cube root has order 18∤24 | Holds |
| §1.3 away from p | good v, q=4; α≡q | \|α\|=\|q/α\|=2≠1: H⁰=H²=0, so H¹=0 rationally; integrally H¹=W(−1)^(Frob), nonzero iff α≡q mod ϖ_R | Holds; rational only |
| §2.2 special values | χ=1; χ ramified | 1−(−p)/p²=1+p⁻¹=6/5 at p=5; ramified factor 1; BKO21 (3.6)–(3.7) omit p only for δ_χ | Holds |
| §2.3 sign | ε=+, order 25; ε=−, χ=1 | (−1)³·1=−1: zero; L(φ̄,1)=0 by the functional equation | Holds |
| §2.5 interpolation | a=γ, χ(γ)=ζ₅ | δ_(χ⁻¹)(γv)=ζ₅δ_(χ⁻¹)(v), not ζ₅⁴; ξ=πv₋: δ(ξ)=0, L_p(1)=π≠0 | Holds |
| §3.5 Rubin's hypotheses | K=ℚ(√−23), p=5 | [K₀:K]=3·24=72, prime to 5; μ_p⊄H since p is unramified in H; tame character of order 24 nontrivial on decomposition | Holds |
| §4.1 sequence | s=ε; s=−ε | ranks 1,1,1,1,0; and 0,1,1,0,0 | Holds |
| §4.2 opposite torsion | torsion S_rel/S_ε into free H/H^ε | image 0, so S_ε=S_rel; S_+∩S_−⊂S_str of rank 0 | Holds |
| §4.3 symmetry | K=ℚ(i), p=7, f=(2+2i), α=−1+2i | α−1=i(2+2i); ᾱ−1=−(2+2i); αᾱ=5; W^τ has value ᾱ=5/α≠α; no unit ≡1 mod f but 1 (N(i−1)=2, N(−2)=4 < 8) | Holds |
| §4.4 identities (headline) | H^ε=Λ, S=(T), C=(T²), char X_str=(T); C=πS | (2): (T)(T)=(T²)=char Λ/(T²); (1): char(H^ε/S)=(T)=char(X_rel)_tors gives (X_ε)_tors trivial; vertical multiplicity e | Holds; route of (1): R01 |
| §4.5 lattice | factors generating (1) or (π) | char=(L_p) or (πL_p); f=T, d=2 over Λ_O: (T²) | Holds |
| §4.6 main conjecture (headline) | L_p=T, d=2; L_p=π, e=2 | char_R=(T), norm (T²); (π)=(ϖ_R)², μ=2, zero after inverting p | Holds |
| §5.1 control elements | p=5, n=0,1,2 | (1,T); (1,γ⁵−1); (Φ₂₅,(γ−1)Φ₅), degrees 20+5=25; zeros of ω⁺ have c odd | Holds |
| §5.2 local control | p=5, n=2; 𝔪=(ϖ,T) | coranks 20 and 5 on both sides; injective map of cofree modules of equal corank is onto; 𝔪/T𝔪≅R⊕R/ϖ | Holds |
| §5.3 signed control | v∣f; v∤pf; n=0 | W^(I_v) killed by a−1≠0: finite; at good v the kernel W′/(γ−1)W′ of a divisible module is 0; ω_0⁺=1 gives 0=0 | Holds; wording: R04 |
| §5.5 length | A/𝔪², κ²; f=T−(ζ₅−1) | (dim,length)=(1,2),(2,2); ord_ζ f=1, ord_(ζ⁻¹) f=0 | Holds |
| §6.1 containment | (fg)⊆(f), f=T, g=T² | orders 1≤3; reverse fails | Holds |
| §6.3 matching bound | χ∈Ξ^ε, sign −ε | χ(ω_n^(−ε))=0 iff χ∈Ξ^ε; dim=dim of specialisation ≤ ord_(χ⁻¹)L_p=ord_χ L_p for R=O | Holds |
| §6.4 rank bounds (headline) | χ=1, ε=±; order 25, ε=+ | ≤ord₁; ≤ord₁+1; +1 at order 25; BKO21 Theorem 6.2 indexes by conductor pⁿ, covered by n≥r | Holds |

Standing hypotheses in scope for each: p≥5 (BKO21 line 334), p inert, p∤h_K (BKO21 (6.1)), R finite over O; the “E over K” hypothesis is displayed at §§5.2–5.4, 5.6, 6.2–6.4 and not at Layers 0–4.

### Source sample (15 seeded targets)

| Target | Locator read | Result |
|---|---|---|
| 0.1 | BKO21 lines 366–387 (pp.950–951), 404–413 (p.951), 802–822 (pp.960–961) | Gross Q-curve over H, good reduction above p, (3.1)–(3.2), T restricted to G_H, period ΩO_K: supported |
| 0.3 | AHII05 lines 102–109, 157, 163–169; BKO21 lines 249–252, 295–296, 810–812, 878–879 | conductor shift, AH sets, (3.1) not at n=0, conventions opposite on character sets: supported |
| 0.5 | BKO21 lines 297–309 (p.949), 831–844 (p.961) | Theorem 2.1, Corollary 2.2: supported; R-extension is this roadmap's |
| 1.1 | BKO21 lines 860–865 (p.962); AHII05 lines 105–119 | Kummer image of F^±(Ψ_n)⊗R⊗ℚ_p/ℤ_p, same-parity kernel, orthogonal complements: supported |
| 1.3 | AHI06 lines 236–243 (p.1006); BKO21 lines 870–872 | Lemma 1.1.4 with both invariants zero; H¹_f=0: supported |
| 1.5 | AHII05 lines 95–97, 123–126, 172–178 | limits, X_∗, action through ι: supported |
| 2.2 | BKO21 lines 467–478 (p.953), 823–830 (p.961) | (3.6)–(3.7), Proposition 3.3(1)–(2), values of ξ: supported |
| 4.4 | AHII05 lines 247–280 (pp.616–617) | (4.1), (4.2) under the splitting, (4.3)–(4.4): supported; see R01 |
| 4.5 | AHII05 lines 283–298 (p.617); BKO21 lines 883–886 | Theorem 4.3 with δ_χ, generator of char(H¹_ε/C): supported |
| 4.6 | BKO21 lines 875–886 (p.962) | Theorem 6.1 under (6.1) only: supported |
| 5.2 | AHII05 lines 318–338 (p.618) | injective, finite cokernel under Conjecture 3.5: supported; page: R05 |
| 5.3 | AHII05 lines 343–391 (pp.619–620) | surjective, finite kernel under the conjecture, places above f: supported |
| 6.1 | BKO21 lines 894–905 (pp.962–963) | containment and strict control: supported |
| 6.3 | BKO21 lines 906–908 (p.963); AHII05 lines 343–346, 392–394 | control at χ∈Ξ^ε and Proposition 5.3: supported |
| 6.4 | BKO21 lines 888–908 | E over K, two branches: supported |

No locator was flagged by the author as unverified. All six cited works have one manifest key each; nothing was fetched and the manifest was not changed.

### Pins (opened this round, paths relative to the libraries)

Mathlib: `Module.length_le_of_surjective` (`Mathlib/RingTheory/Length.lean:202`, `include hg`), `Module.length_eq_finrank` (:293, `[Module.Finite K M]`), `IsLocalRing.length_restrictScalars` (`Mathlib/RingTheory/LocalRing/Length.lean:54`, `[IsLocalHom (algebraMap A B)]`, `[IsScalarTower A B M]`), `Polynomial.cyclotomic` and `cyclotomic_prime_pow_mul_X_pow_sub_one` (`…/Cyclotomic/Basic.lean:227`, 525, `[Fact p.Prime]`), `Module.Basis` (`Basis/Defs.lean:89`), `Ideal.span_singleton_mul_left_unit` (`Ideal/Span.lean:100`), `IsGalois.normalBasis` (`NormalBasis.lean:121`), `IsDedekindDomain.selmerGroup` (`SelmerGroup.lean:161`), the `IsRegularLocalRing` instance (`RegularLocalRing/Defs.lean:80`).
Tau Ceti: `TauCeti.Iwasawa.charDivisor` (`Char/Divisor.lean:87`), `charIdeal` (`Char/Ideal.lean:85`), `IsPseudoIsomorphism.charIdeal_eq` (:125), `charIdeal_eq_mul_of_exact` (:132, noetherian, N finite and torsion), `LinearEquiv.charIdeal_eq_comap` (:152, no noetherian hypothesis), `charIdeal_quotient_span_singleton` (:198, domain, noetherian, factorial, f≠0); `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing` (`PowerSeries.lean:157`, 169); `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`UniqueFactorization.lean:59`); `TauCeti.completedGroupAlgebra` (`CompletedGroupAlgebra/Basic.lean:145`); `TauCeti.IsCompactModule.completedGroupAlgebraModule` (`Module.lean:322`); `TauCeti.ContCohomology.SelmerStructure`, `.localization`, `.selmerGroup`, `.mem_selmerGroup_iff` (`SelmerStructure.lean:69`, 86, 97, 103; `G` a topological monoid, no discreteness of `M`); `TauCeti.ContCohomology.H1` (`LowDegree.lean:829`); `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap` (`Selmer/Basic.lean:147`, 176, 223) and `kummerSelmerMap_injective`; `WeierstrassCurve.Affine.fg_point_of_numberField` (`FinitelyGenerated.lean:145`); `selmerGroup₂` (`SelmerGroup.lean:104`), `selmerGroupA` (`SelmerGroupA.lean:144`). All 36 backticked names of the README resolve; the two that are not library names, `IsCanonicalGrossCharacter` and `canonicalGrossExistence`, are declared in the supplier's `Suggested.lean` (lines 50, 70 at the head of #1254). The README gives no backticked name of its own.

### Suppliers at their current heads, and the dependency check

Resolved every cited section by heading: SelmerIwasawaCohomology (#869) §§2.1–2.6, 2.10, 2.13, 2.19, 3.0, 3.1, 3.3, 3.10–3.12, 3.16 (lines 345–1760); ArithmeticGaloisDuality (#858) R02.2.2, R02.2.3, R02.4.2–R02.4.4, D7.7.1–D7.7.2 (lines 1306–6371); EulerSystemsAndKolyvaginSystems (#1272) §§2.2, 8.1, 8.11, 8.25; IntegralIwasawaTheory (#1306) §§2.2, 4.2–4.4; ComplexMultiplicationAndExplicitReciprocity (#1254) §§4.1, 4.3; AnticyclotomicLocalUnits (#1692) §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5, with the statements this README attributes to each (δ_χ(gx)=χ(g)⁻¹δ_χ(x), δ_1=(1+p⁻¹)δ, λ_χ(gy)=χ(g)λ_χ(y), A^ε kills Ξ^ε, Ann(D^ε)=V∞*,ε, §4.2 for an l-power ν, §8.4 with δ(v_+) a unit); main: PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6 (restriction of scalars there is to ℤ_p only, line 2828), EllipticCurves Layers 1, 3, 4, 7, ClassFieldTheory Layers 6, 11–13. NonordinaryCMSpecialValues (#2290): the `NCM.k` identifiers are mapped by its table of the former numbering (lines 127–136: NCM.0 → §§0.4–0.6, 1.1, 2.4; NCM.1 → §§2.7–2.10; NCM.2 → §§3.1–3.6; NCM.3 → §§1.2–1.5; NCM.5 → §§6.1–6.4, 5.6, 5.7), and each of the eleven cited targets lies in its mapped range. LubinTateFormalModulesAndQuasiCanonicalLifts (#2284): R02.

The five declared gaps have the same slugs in `design/plan.json` and in the README, a named earlier supplier each, and one precise `needs` sentence. None asks for what Mathlib, Tau Ceti, a roadmap on main or an earlier roadmap provides: NoncommutativeAndEquivariantIwasawa §4.3 (#1307, line 2114) states Rubin's theorem for a split prime only and says the inert case is not stated; PadicMeasuresIwasawaAlgebras §4.6 restricts to ℤ_p; IntegralIwasawaTheory §4.4 is over ℚ.

Dependency check, complete output:

```text
depcheck: 245 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No forbidden supplier is cited. `roadmaps resolve` reports no citation and no roadmap Lean name found nowhere.

### Duplication and ownership

Objects searched at the pins and in all open roadmaps and main: signed Selmer groups, Rubin's p-adic L-function, elliptic-unit Euler systems, Rubin's two-variable theorem, the Ax–Brumer theorem. The signed Selmer groups of ModularIwasawaMainConjectures (#1499) and PadicHodgeRegulators (#1498) are cyclotomic (Kobayashi and Pollack type), a different object. No second owner of a target of this roadmap was found. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined by a revision only, no second copy on main.

Overlap check: read ModularIwasawaMainConjecturesPartII (#2281), AnticyclotomicLocalUnits (#1692), NonordinaryCMSpecialValues (#2290), EulerSystemsAndKolyvaginSystems (#1272), EulerSystemsCyclotomicMainConjecture (#1311) and PadicMeasuresIwasawaAlgebras (main); nothing this roadmap owns is shared. The local signed units and points are owned by AnticyclotomicLocalUnits and cited; the generic Euler-system formalism by EulerSystemsAndKolyvaginSystems and cited; characteristic ideals by Tau Ceti and PadicMeasuresIwasawaAlgebras and cited. The content of the two gaps requested from NonordinaryCMSpecialValues (elliptic units of every modulus with their Euler system, and Rubin's Theorem 4.1(ii)) is also stated by #2281 §§2.2, 2.4, 4.1, 4.7–4.8, a roadmap later in the merge order: the owner by this roadmap's contract is NonordinaryCMSpecialValues, and the question is passed to the human reviewers below.

### Shape, headlines, Lean

Read all 36 targets: each definition (§§0.1, 0.4, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has an API list and at least three Checks; every theorem has its hypotheses and a locator; every layer ends with Examples and Dependencies (one omission in R05). No LaTeX delimiters, HTML anchors, pull-request numbers, dates, machine paths or process wording. No layer is named after a source's chapter and the README does not say it follows a source.

Headline theorems of the Summary: §4.6 (BKO21 Theorem 6.1) and §6.4 (BKO21 Theorem 6.2); the module docstring of `Suggested.lean` names these and §§4.2, 4.4, with the carriers each lacks (signed Kummer conditions on the anticyclotomic tower, Gross Q-curves with their avatars, the primitive elliptic-unit class, the limit Selmer group with V_pE coefficients). None is statable from the pinned carriers with a few simple definitions; none is absent that is statable, and none is forced through a stand-in.

`lake env lean` on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and the namespace, with no declaration, no `sorry`, no `set_option`. The one-tactic probe therefore has no theorem to try and the `#check @name` comparison no signature to compare: both are complete, with zero cases. Nothing is padding. No Lean process was left running.

### Copyright and arrangement

Wording: beside the 15 locators above, compared eight further passages with their sources: the route of §4.2 with AHII05 lines 222–231, the route of §5.3 with lines 365–373, the route of §5.2 with lines 322–338, the routes of §4.4 with lines 265–280, the definition of §2.4 with BKO21 lines 833–839, the definition of §1.4 with BKO21 lines 866–872, §1.3 with AHI06 lines 236–243, and the module docstring. The routes of §§4.2 and 4.4 run through the same steps as the sources' proofs, which the argument forces; no run of more than four consecutive words is shared and each is shorter and worded afresh. Nothing is taken over as it stands (no table, figure or list of a source).

Arrangement: BKO21 has 30 of the 86 locators, AHII05 29. BKO21 §6 has three parts (6.0.1 the L-function, 6.0.2 the main conjecture, 6.0.3 the rank bound); AHII05 has §2 Selmer groups, §3 ranks, §4 characteristic ideals, §5 control. The seven layers do not map one to one onto either: Layer 3 takes Propositions 3.1, 3.3, 3.4 of AHII05 §3 with new descent and local-comparison targets, Layer 4 takes Theorem 3.6 of §3 with §4, Layer 2 lies between them and comes from BKO21 §§3 and 6.0.1. The order is forced by the *Needs:* lines: §3.1 needs §§1.5, 2.1, 2.3; §4.1 needs §§3.3, 3.4; §5.2 needs §3.3; §5.6 needs §3.4; §6.3 needs §§4.6, 5.3, 5.4.

Source independence: 23 passages compared with 3 sources (BKO21, AHII05, AHI06), none shared; largest share BKO21, 30 of 86 locators; contents compared with BKO21 and AHII05: independent.

## Not verifiable

- BRU67 is waived in the manifest; its text was not read. The gap that cites it names its supplier and its exact statement.
- The extraction of BKO21 loses overbars (for instance at lines 825–827 and 841); the conjugates were checked through BKO21 (3.2), (3.4) and the covariance computation of §2.5, not by the printed glyphs.
- BIL86 and RUB91 are outside this round's sample; only the theorem numbers (BIL86 lines 56, 659–665) and the two-variable theorem as restated in the gap were looked at. The earlier rounds' rows for §§3.5 and 4.3 are relied on.
- The gaps and supplier sections are contracts in open pull requests, not proved statements.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the two control elements is γ to the power p^k minus one; it should be the power pⁿ for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is Lemma 2.1.2 of AHI06; it should be Lemma 1.2.1; affects nothing.

## For the human reviewers

- **Scope (ownership across the merge order).** The two gaps this roadmap asks of NonordinaryCMSpecialValues are stated by ModularIwasawaMainConjecturesPartII §§2.2, 2.4, 4.1, 4.7–4.8 at the head of #2281 (README lines 294, 321, 377, 476, 491), which is later in the merge order.
- **Licence.** The cached text of BKO21, fetched from the institutional record in `sources.toml`, carries on each page a JSTOR download stamp and terms-of-use line (BKO21 lines 242–244).
- **Not tested.** BRU67 is waived and was not read; it is cited only for the Ax–Brumer theorem requested as a gap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b19474a5d02e7712bd6b4409bba3ac12bbe5d586", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~6", "model": "fable", "worker": "chris-x79"} -->
