<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6900678148 -->
Review (claude) of 6314bb1

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The gap `elliptic-unit-euler-system` asks for what its supplier already states

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:73`: “the norm-compatible elliptic units of F built from the auxiliary ideal a … and their Kummer classes twisted by the inverse avatar to classes in lim_cor H¹(F,T′)”; also line 430 (route of §3.1), line 20 (Scope) and lines 446, 510.

   **Claim:** A declared gap must ask for nothing an earlier roadmap provides. At the head of its open pull request, NonordinaryCMSpecialValues §§2.1–2.3 and 2.9 state the elliptic units of every modulus and every auxiliary ideal, their norm compatibility along the p-tower, the integral smoothed classes and the twist of norm-compatible Kummer towers. The README cites none of these sections and takes all of it from the gap. What the supplier lacks is narrower: the norm relation at primes not dividing p and the congruence relation (RUB91 (1c)–(1d), p.28, RUB91 lines 171–173).

   **Witness:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md` at the head of #2290: §2.2 “Define the standard elliptic unit of modulus `f` and twist `a` … for `a` prime to `6f`”, with norm compatibility `K(p^{n+1}f)→K(p^n f)` only; §2.9 “`(lim_cor H¹(F_n, Z_p(1))) ⊗ T ≅ lim_cor H¹(F_n, T(1))`”.

   **Exact repair:**
   - In `### From TauCetiRoadmap.NonordinaryCMSpecialValues`, before the gap sentences, add: “Use §2.1 for Kato's CM theta function of an ideal a prime to 6, §2.2 for the standard elliptic units of every modulus g with O_K×→(O_K/g)× injective and every a prime to 6g, with their norm compatibility from K(p^(n+1)g) to K(p^n g), §2.3 for the integrality of the smoothed zeta elements (N(a)−σ_a)·z_(p^∞g) in the norm limit of H¹(−,ℤ_p(1)), a prime to 6pg, and §2.9 for the equivariant isomorphism (lim_cor H¹(F_n,ℤ_p(1)))⊗T_φ^∨≃lim_cor H¹(F_n,T_φ^∨(1)) on the tower K(g p^∞), compatible with localisation and corestriction.”
   - Replace the gap sentence of line 73 by: “What NonordinaryCMSpecialValues must provide (gap:elliptic-unit-euler-system): For every ideal a of O_K prime to 6pf, every modulus g divisible by f with injective units and every prime 𝔮 of K prime to 6pag, the relations of the standard elliptic units of §2.2 in the direction prime to p, which §2.2 states along the p-tower only: the norm from K(g𝔮p^n) to K(gp^n) acts on the unit of twist a by the Euler factor 1−Frob_𝔮⁻¹, and the congruence relation at the primes above 𝔮 holds (RUB91 (1c)–(1d), p.28); so that, for every finite abelian extension F of K containing H, the norms of these units to the fields of RUB91 §1, pp.28–29, and their Kummer classes twisted by §2.9, form an Euler system for T′ over K(g p^∞) in the sense of EulerSystemsAndKolyvaginSystems §2.2.”
   - Line 430: “Take the elliptic units and their norm compatibility along the p-tower from NonordinaryCMSpecialValues §2.2, the integral smoothed classes from §2.3, the twist of their Kummer classes from §2.9, and the norm and congruence relations at the primes not dividing p from the supplier contract (gap:elliptic-unit-euler-system).”
   - Add “NonordinaryCMSpecialValues §§2.2, 2.3, 2.9” to the *Needs:* line of §3.1 (line 446) and to the Layer 3 Dependencies (line 510). In line 20 replace “because that roadmap already owns the normalised elliptic-unit classes they extend” by “because that roadmap already owns the standard elliptic units of every modulus (§2.2) and their twisted Kummer classes (§2.9), whose relations at the primes not dividing p the first gap adds”.
   - The slug is unchanged, so `design/plan.json` still declares the gap; its `needs` sentence is the wider one and is mirrored only if the plan entry may be edited at this stage.

   Tested on the refuting instance: for K=ℚ(i), p=5, g=(3), 𝔮 above 7, the norm K(21·5ⁿ)→K(3·5ⁿ) is not a p-tower norm, so §2.2 does not give it and the narrowed sentence does; the units of modulus 21·5ⁿ themselves and the twist to T_φ^∨(1) are §§2.2 and 2.9 and are no longer requested.

2. **F02** (P3) §3.2 has no determinate statement

   **Location:** `README.md:450`: “The constructions of AHII05 §§2–4 for an elliptic curve over ℚ … hold for an inert CM datum over H with p∤h_K after passage to the φ-component with coefficients R.”

   **Claim:** The target is defined by reference to three sections of a source, and “constructions hold” has no hypotheses and no conclusion an implementer can state. Sections 3.3, 3.4, 3.5 and 4.3 list §3.2 in their *Needs:* lines, so they depend on a statement that is not there. The results of AHII05 are stated, each with its route, in §§3.3–3.5 and 4.1–4.5; what §3.2 itself contributes is the descent along a field of degree prime to p.

   **Witness:** Line 450 contains one checkable assertion only (“the averaging idempotents are integral and exact”). For K=ℚ(√−23), p=5 it is the integrality of (1+g+g²)/3 in ℤ₅[Gal(H/K)]; nothing in the paragraph says which modules over K_n and over HK_n are compared.

   **Exact repair:** Replace the first sentence of §3.2 by:

   “Let F be H or K₀=H(E[p]) and G=Gal(F/K); its order, h_K or h_K(p²−1), is prime to p, and F∩K∞=K. Over FK_n the module W is E[π^∞]⊗_O R, on which G acts through the extension of the Galois action to G_K by φ_p. For every n≥0, restriction is an isomorphism of H¹(K_n,W) onto the G-invariants of H¹(FK_n,W); it carries Sel_str(K_n,W) and Sel_rel(K_n,W) onto the G-invariants of the strict and relaxed Selmer groups of W over FK_n, defined with 0, respectively no condition, at every place above p and 0 at the other finite places; and corestriction identifies the G-coinvariants of the corresponding compact groups of T′ over FK_n with those over K_n. These identifications commute with restriction and corestriction in n, with localisation and with the pairings of §0.4, so a rank or characteristic-ideal statement proved for the G-invariant part over FK∞ is the same statement over Λ_R.”

   Keep the remaining sentences and the locator, which supports the transfer (BKO21 lines 876–878, 883–886). Tested: for K=ℚ(√−23), p=5, #G is 3 for F=H and 72 for F=K₀, the local degrees at the places above p are 1 and 24, corestriction after restriction is multiplication by #G, a unit of ℤ₅, and H¹(G,−) vanishes on 5-primary modules; with 5∣h_K the idempotent has denominator 5 and the isomorphism can fail, as the first Check of §3.2 already records.

3. **F03** (P3) The route of §4.5 leaves its own statement open

   **Location:** `README.md:591`: “Show that these distribution factors generate the unit ideal of Λ_R after the φ-projection, or retain the precise correction divisor they generate.”

   **Claim:** §4.5 asserts char(H^ε/loc(C))=(L_p) and §4.6 uses it. Under the second alternative of the route the statement is false, as the first Check of §4.5 computes: factors generating (π) give (πL_p). The route has to commit, and the supplier's text already contains the reason.

   **Witness:** NonordinaryCMSpecialValues at the head of #2290, §2.6 API: “the smoothing factor becomes `N(a) − ψ(a)σ_a` after the twist”; §2.7 Check: “`α = 2` modulo `p` with `ᾱ ≡ 2`: `α(ᾱ − 1) ≡ 2` is a unit”.

   **Exact repair:** Replace the sentence by: “These distribution factors generate the unit ideal of Λ_R. The factor of a is N(a)−φ(a)σ_a (NonordinaryCMSpecialValues §2.6), whose image in Λ_R is N(a)−φ(a)γ_a with γ_a the image of σ_a in Γ⁻, congruent to N(a)−φ(a) modulo the maximal ideal. For a=(α) with α≡1 modulo 6f and α≡2 modulo p, which exists because p∤6f, φ(a)=α and the residue is α(ᾱ−1)≡2, a unit.” Add “NonordinaryCMSpecialValues §2.6” to the *Needs:* line of §4.5 and to the Layer 4 Dependencies. Tested: at p=5 the residue is 2·(2−1)=2≢0; a is prime to 6pf because α is a unit modulo 6f and modulo p; with the unit ideal the first Check of §4.5 gives Λ_R/(L_p) and not Λ_R/(πL_p).

4. **F04** (P3) The rational Selmer groups of Layers 5–6 are never defined

   **Location:** `README.md:669` (“the χ-part of the rational signed Selmer group over K_n”), line 683 (“Sel_(−ε)(K_n,V_pE)^χ=Sel(K_n,V_pE)^χ”), and lines 713, 755, 769, 785–786.

   **Claim:** §1.4 defines the Selmer groups with coefficients W and §1.5 those with coefficients T′. The groups Sel_a(K_n,V_pE) for a strict, signed and ordinary occur in the statements of §§5.3, 5.4, 5.6, 6.2, 6.3 and of the headline §6.4, but no target says what their local conditions are. Two routes mention propagation for the strict and the ordinary condition (lines 717, 790); the signed rational condition is stated nowhere.

   **Witness:** `V_pE` occurs 14 times in the README, first at line 47, never in Layers 0–4; “rational” with “Selmer” occurs in lines 669, 763 and 777 only, none a definition.

   **Exact repair:** Add to §1.4, after the definition of Sel_a(K∞,W) (line 273): “For a∈{str,+,−,ord} and n≥0 let Sel_a(K_n,V_T) be the Selmer group of the rational Selmer datum whose condition at 𝔭 is 0, the image of A_n^s⊗_O L, or the image of F(Ψ_n)⊗_O L under the rational Kummer map into H¹((K_n)_𝔭,V_T), and whose condition at every finite v∤p is H¹((K_n)_v,V_T)=0 (§1.3). The conditions of Sel_a(K_n,W) are the images of these, so the R-corank of Sel_a(K_n,W) is the L-dimension of Sel_a(K_n,V_T), compatibly with Gal(K_n/K) (SelmerIwasawaCohomology §§2.5–2.6). When E is defined over K, V_pE=V_T with R=O, Sel_a(K_n,V_pE) denotes Sel_a(K_n,V_T), and its χ-part is the χ-eigenspace of Sel_a(K_n,V_T)⊗_L L_χ.” Add “SelmerIwasawaCohomology §§2.5–2.6” to the *Needs:* line of §1.4 and to the Layer 1 Dependencies. Tested at n=0: A_0⁺=0 gives Sel_+(K,V_T)=Sel_str(K,V_T) and A_0⁻=F(Φ) gives Sel_−(K,V_T)=Sel(K,V_T), matching the Layer 1 Examples; the relaxed condition is left out because the image of H¹(V_T) in H¹(W) is only the divisible part.

5. **F05** (P3) §1.2 changes a place that §0.2 says is unique

   **Location:** `README.md:241`: “They are unchanged under a change of the place above 𝔭 in K_n when the localisation map is conjugated together with its target condition”.

   **Claim:** K_n has one place above p (p is inert in K and totally ramified in K∞), so there is no other place to change to. What can change is the embedding that induces it.

   **Witness:** `README.md:146`: “The completion of K_n at the unique place above 𝔭 is identified with Ψ_n”; line 148: “the place 𝔭 is totally ramified and nonsplit in K̃∞”.

   **Exact repair:** Replace the clause by: “They are unchanged under a change of the embedding of K̄ into ℚ̄_p that induces the unique place of K_n above p, that is, under conjugation of the decomposition group by an element of G_(K_n), when the localisation map is conjugated together with its target condition”. Tested: at n=0 the place is p itself and two embeddings over K differ by an element of G_K, which transports L_0^s to L_0^s.

Five findings: one P2 and four P3. All five findings of round 6 are repaired. The P2 comes from reading the supplier NonordinaryCMSpecialValues at the current head of its open pull request: one declared gap asks it for objects it now states. The four P3 are internal: one target with no determinate statement, one route that leaves its own statement open, one family of objects used in theorem statements and never defined, and one clause that contradicts §0.2. None of the four authored files was modified.

## Verified sound

### Previous findings (round 6), finding by finding

| Finding | Status | Repaired passage | Verification |
|---|---|---|---|
| F01, second duality sequence | **repaired** | Line 521: “0 → S_str → S_s → H^s → X_rel → X_s → 0”; line 577: “the second sequence of §4.1 with s=ε and S_str=0”; line 585 lists §4.1 | Poitou–Tate for (strict ⊂ signed) on T′, recomputed below; agrees with AHII05 lines 266–268 |
| F02, `LT.k` identifiers | **repaired** | Line 113: “§2.4 supplies the Lubin–Tate character … §2.5 … §8.2 … §8.3 the fields Ψ_n with [Ψ_n:Φ]=pⁿ” | Headings at the head of #2284: lines 1130, 1162, 2369, 2399; that head now also carries a table of the `LT.k` identifiers (lines 483–543), so both forms resolve |
| F03, downstream consumers | **repaired** | Line 810: “cite this roadmap without consuming a target of it” | ModularIwasawaMainConjecturesPartII line 32 at #2281 and CMRankZeroConverse line 11 at #1744 say what the sentence reports |
| F04, dual statements | **repaired** | Line 669: “with the L_χ-linear dual of the χ-part … the same L_χ-dimension”; line 771 | Model M=L/R: specialisation M^∨, eigen-submodule M, dimension 1 each after inverting p |
| F05, page, dependency, manifest | **repaired** | Line 654 “p.618”; line 294 “pp.612–613”; line 319 lists `TauCeti.completedGroupAlgebra`; `cited_for` of AHII05, BKO21, RUB91 | AHII05 lines 318–338 lie on p.618; manifest read |

Nothing in the repair report was marked “not actionable”; nothing is re-raised. No maintainer note was given. The repaired patterns were searched in the rest of the package: the sequence used in §6.1 is the first one (line 741, correct); no further `LT.` identifier; no further identification of a module with its dual.

### Adversarial table (values computed this round)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.1 datum | K=ℚ(√−23), p=5 | −23≡2, squares mod 5 are 1, 4: inert; forms (1,1,6), (2,±1,3): h=3; Frobenius −5 twice: (X+5)², trace −10 | Holds |
| §0.2 towers | n=0, 1; conjugation | Φ=Φ; [Ψ₁:Φ]=5 against 24; #O_K× ∈ {2,4,6} prime to p≥5; cγc⁻¹γ=1 against γ² | Holds; “place above 𝔭”: R05 |
| §0.5 signed kernels | a=p; a=T; u=1+√π | a(χ⁻¹)=p≠0 at every χ; T vanishes at χ=1 only; δ(uv₊)=(1+√π)δ(v₊); δ₁=(6/5)δ at p=5 | Holds |
| §1.1 conditions | n=0, R=O | A₀⁺=0, A₀⁻=F(Φ); [π]Q⊗π⁻¹=Q⊗1=0 while Q⊗π⁻¹≠0 | Holds |
| §1.2 independence | automorphisms; p=5, β³=aπ | End_R(L/R)=R, so automorphisms are R×; a⁴ of order 6, cubes of μ₂₄ are μ₈, 6∤8; a cube root has order 18∤24; −2≡3 mod 5 nonsquare | Holds |
| §1.3 away from p | good v, q=4 | \|α\|=\|q/α\|=2≠1: H⁰=H²=0, Euler characteristic 0, H¹=0; integrally W(−1)^Frob≠0 iff α≡q | Holds, rationally only |
| §2.2 values | χ=1; χ ramified | 1−(−p)/p²=6/5 at p=5; BKO21 (3.6) deletes p, (3.7) does not | Holds |
| §2.3 sign | ε=+: c=2, 3; ε=−: c=0, 2 | (−1)^c ε = +1, −1; −1 (functional equation), −1 | Holds |
| §3.2 descent | K=ℚ(√−23), p=5 | #G=3 or 72; (1+g+g²)/3∈ℤ₅[G]; local degrees 1, 24 | Idempotent claim holds; statement: R02 |
| §4.1 second sequence | ranks; n=0, s=+ | s=ε: 0,1,1,1,1; s=−ε: 0,0,1,1,0 (alternating sums 0); L₀⁺=0, local term H¹(Φ,T′) of rank 2 | Holds |
| §4.1 model Check | H^ε=Λ_R, S_ε=S_rel=(T), S_str=0 | first: 0→Λ_R→X_ε→X_str→0; second: 0→Λ_R/(T)→X_rel→X_ε→0 | Holds |
| §4.2 opposite torsion | first sequence | rk X_s = rk S_s − 1 + 1 + 0; S_rel/S_ε torsion into free H/H^ε: 0 | Holds |
| §4.4 (headline) | model with C=(T²), char X_str=(T) | (2): (T)(T)=(T²); (1): Λ_R/(T) ↪ (X_rel)_tors | Holds |
| §4.5 lattice | α≡1 mod 6f, α≡2 mod p | residue of N(a)−φ(a) is α(ᾱ−1)≡2, a unit; factors in (π) would give (πL_p) | Statement holds; route: R03 |
| §4.6 (headline) | L_p=T, d=2; L_p=π | norm (T²); (π)=(ϖ_R)^e, μ=e, zero after inverting p | Holds |
| §5.2 local control | p=5, n=2; n=1, s=+; 𝔪=(ϖ_R,T) | coranks 20 and 5 on both sides; ω₁⁺=1 gives 0=0; Φ_(p^k)(γ⁻¹)=γ^(−φ(p^k))Φ_(p^k)(γ) (palindromic); 𝔪/T𝔪≅R⊕R/ϖ_R | Holds |
| §5.3 signed control | v∣f; n=0 | W^(I_v)=ϖ_R^(−k)R/R finite; s=+: 0=0; χ(ω)=0 ⟺ χ⁻¹(ω)=0 | Holds; rational group: R04 |
| §5.5 length | A/𝔪^k; κ²; f=T−(ζ₅−1) | (1,k); (2,2); ord_ζ f=1, ord_(ζ⁻¹) f=0 | Holds |
| §6.4 (headline) | χ=1 with ε=±; order 25 with ε=+ | ≤ord₁; ≤ord₁+1; ≤ord_χ+1; n≥r covers BKO21's n=c(χ) | Holds; Sel(K_n,V_pE): R04 |
| gap `elliptic-unit-euler-system` | K=ℚ(i), p=5, g=(3), 𝔮∣7 | units of modulus 21·5ⁿ: supplier §2.2; twist: §2.9; norm K(21·5ⁿ)→K(3·5ⁿ): not stated | Not minimal: R01 |

Standing hypotheses in scope: p≥5 (BKO21 line 334), p inert, p∤h_K (BKO21 line 804), R finite over O; “E defined over K” is displayed at §§5.2–5.4, 5.6, 6.2–6.4. In §5.2 it is not used by the route; this needs no change.

### Source sample (the 15 seeded targets)

| Target | Locator read | Result |
|---|---|---|
| 0.1 | BKO21 lines 366–387, 404–413, 802–822 | Gross Q-curve, good reduction above p, (3.1)–(3.2), period ΩO_K: supported |
| 0.2 | BKO21 lines 371–372 (p.950), 828–829 (p.961), 853–854 (pp.961–962) | H_𝔭=Φ, the two-variable identification, (K_n)_𝔭=Ψ_n: supported |
| 0.5 | BKO21 lines 295–309 (p.949), 831–844 (p.961) | Theorem 2.1, Corollary 2.2: supported; the extension to R is this roadmap's |
| 1.1 | BKO21 lines 860–864 (p.962); AHII05 lines 105–113 (p.613) | Kummer image of F^±(Ψ_n), same-parity kernel, orthogonal complements: supported |
| 1.2 | BKO21 lines 865–866 (p.962) | independence of the isomorphism: supported |
| 1.3 | AHI06 lines 236–243 (p.1006); BKO21 lines 870–872 | Lemma 1.1.4 and the sentence after it: supported |
| 2.2 | BKO21 lines 467–478 (p.953), 823–830 (p.961) | (3.6)–(3.7), Proposition 3.3, values of ξ: supported |
| 2.3 | BKO21 lines 831–833 (p.961); AHII05 lines 151–169 (p.614) | sign of ξ, Proposition 3.1, Remark 3.2: supported |
| 3.2 | BKO21 lines 876–878, 883–886 (p.962) | the arguments carry over under (6.1): supported as a transfer; see R02 |
| 4.2 | AHII05 lines 216–231 (p.616), 274–275 (p.617) | Theorem 3.6; S_ε=S_rel under the splitting: supported |
| 4.5 | AHII05 lines 283–298 (p.617); BKO21 lines 883–886 | Theorem 4.3 and the paragraph after it: supported |
| 4.6 | BKO21 lines 875–886 (p.962) | Theorem 6.1 under (6.1) only: supported |
| 5.2 | AHII05 lines 318–338 (p.618), 213 (p.615) | injectivity; finite cokernel under Conjecture 3.5: supported; vanishing of the cokernel is this roadmap's argument, checked above |
| 5.3 | AHII05 lines 343–391 (pp.619–620) | surjective, finite kernel, places above f: supported |
| 5.5 | BKO21 lines 894–905 (pp.962–963) | the “standard arguments” step: supported; the algebra is checked above |

Also read: RUB91 lines 162–206 (§1, pp.28–29: relations (1a)–(1d), the units) and 484–571 (§4, pp.36–37: the modules, sequence (5), Theorem 4.1(ii), Remark (2)); the two gap sentences restate them correctly. AHI06 page numbers were checked against the printed headers (Lemma 1.1.9 on pp.1009–1010, Lemma 1.2.1 on p.1010, Lemma 2.4.5 and Corollary 2.4.6 on pp.1028–1029, Propositions 2.4.15–2.4.16 on pp.1032–1033). No locator was flagged by the author as unverified. Every cited work has one manifest key; nothing was fetched and the manifest was not changed.

### Pins (opened this round, paths relative to the libraries)

Mathlib: `Module.length_le_of_surjective` (`Mathlib/RingTheory/Length.lean:202`), `Module.length_eq_finrank` (:293), `IsLocalRing.length_restrictScalars` (`Mathlib/RingTheory/LocalRing/Length.lean`), `Polynomial.cyclotomic` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`), `cyclotomic_prime_pow_mul_X_pow_sub_one` (:525), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Ideal.span_singleton_mul_left_unit` (`Mathlib/RingTheory/Ideal/Span.lean:100`), `IsGalois.normalBasis` (`Mathlib/FieldTheory/Galois/NormalBasis.lean:119`), `IsDedekindDomain.selmerGroup` (`Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161`), the `IsRegularLocalRing` instance (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:80`).

Tau Ceti: `completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`), `completedGroupAlgebraModule` (`Module.lean:322`), `charDivisor` (`TauCeti/RingTheory/Iwasawa/Char/Divisor.lean:87`), `charIdeal` (`Char/Ideal.lean:85`), `IsPseudoIsomorphism.charIdeal_eq` (:125), `charIdeal_eq_mul_of_exact` (:132), `LinearEquiv.charIdeal_eq_comap` (:152), `charIdeal_quotient_span_singleton` (:198), `isRegularLocalRing` and `ringKrullDim_of_isDiscreteValuationRing` (`TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`, 169), `uniqueFactorizationMonoid` (`UniqueFactorization.lean:59`), `SelmerStructure`, `localization`, `selmerGroup`, `mem_selmerGroup_iff` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`, 86, 97, 103), `H1` (`LowDegree.lean:829`), `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap`, `kummerSelmerMap_injective` (`TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:147`, 176, 223, 238), `fg_point_of_numberField` (`MordellWeil/FinitelyGenerated.lean:145`), `selmerGroup₂` (`MordellWeil/SelmerGroup.lean`), `selmerGroupA` (`MordellWeil/SelmerGroupA.lean:144`).

Every backticked name of the README resolves. `IsCanonicalGrossCharacter` and `canonicalGrossExistence` are the supplier's (ComplexMultiplicationAndExplicitReciprocity §4.3, lines 690, 701 at the head of #1254). The README gives no backticked name of its own.

### Suppliers at their current heads, and the dependency check

Resolved every cited section by heading: SelmerIwasawaCohomology (#869) §§2.1–2.6, 2.10, 2.13, 2.19, 3.0, 3.1, 3.3, 3.10–3.12, 3.16; ArithmeticGaloisDuality (#858) R02.2.2, R02.2.3, R02.4.2–R02.4.4, D7.7.1–D7.7.2; EulerSystemsAndKolyvaginSystems (#1272) §§2.2, 8.1, 8.11, 8.25; IntegralIwasawaTheory (#1306) §§2.2, 4.1e, 4.2, 4.3, 4.4 (§4.4 is for abelian extensions of ℚ, line 726); ComplexMultiplicationAndExplicitReciprocity (#1254) §§4.1, 4.3; AnticyclotomicLocalUnits (#1692) §§0.1, 0.5, 1.2–1.5, 2.4, 3.1, 3.2, 3.6, 4.2–4.4, 8.2, 8.4, 8.5, with the sign conventions the README attributes to them (A^ε kills Ξ^ε; Ann(D^ε)=V∞*,ε; δ(v_+) a unit); LubinTateFormalModulesAndQuasiCanonicalLifts (#2284) §§2.4, 2.5, 8.2, 8.3; main: PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5, 4.6 (base change along finite free O→O′, line 2818; restriction of scalars to ℤ_p only, line 2828), EllipticCurves Layers 1, 3, 4, 7, ClassFieldTheory Layers 6, 11–13. NonordinaryCMSpecialValues (#2290): the `NCM.k` identifiers are mapped by its table of the former numbering (lines 127–136), and the statements read at §§0.4, 1.4, 1.5, 2.7, 2.8, 2.10, 3.3–3.5, 6.4 agree with what the README takes from them; its §§2.1–2.3 and 2.9 are the subject of R01.

Declared gaps. All five have the same slug in `design/plan.json` and in the README and a named earlier supplier. Four are precise and minimal: `inert-two-variable-main-conjecture` (the supplier states no form of Rubin's theorem; RUB91 lines 547–551), `restriction-of-scalars-finite-extension` and `character-prime-multiplicity` (PadicMeasuresIwasawaAlgebras §4.6 restricts to ℤ_p and has no multiplicity statement), `leopoldt-abelian-over-imaginary-quadratic` (IntegralIwasawaTheory §4.4 is over ℚ). The fifth is R01.

Dependency check, complete output:

```text
depcheck: 245 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No forbidden supplier is cited. `roadmaps resolve` reports no citation and no roadmap Lean name found nowhere.

### Duplication and ownership

Searched by object at the pins, on main and at the open heads: signed anticyclotomic Selmer groups, Rubin's p-adic L-function, the elliptic-unit module, Rubin's Theorem 4.1(ii), the Ax–Brumer theorem. No second owner of a target of this roadmap was found. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined by a revision only, no second copy on main.

Overlap check: read ModularIwasawaMainConjecturesPartII (#2281), AnticyclotomicLocalUnits (#1692), NonordinaryCMSpecialValues (#2290), EulerSystemsAndKolyvaginSystems (#1272), EulerSystemsCyclotomicMainConjecture (#1311) and PadicMeasuresIwasawaAlgebras (main); nothing this roadmap owns is shared. Local signed units and points: AnticyclotomicLocalUnits, cited. Elliptic units of every modulus and the twist of Kummer towers: NonordinaryCMSpecialValues §§2.1–2.3, 2.9, not yet cited (R01). Euler-system formalism: EulerSystemsAndKolyvaginSystems, cited. Characteristic ideals: Tau Ceti and PadicMeasuresIwasawaAlgebras, cited. The elliptic-unit Euler system and Rubin's Theorem 4.1 are also stated by ModularIwasawaMainConjecturesPartII §§4.1, 4.7–4.8, a roadmap later in the merge order that this one may not cite; the question is passed to the human reviewers.

### Shape, headlines, Lean

All 36 targets read. Each definition (§§0.1, 0.4, 1.1, 1.4, 1.5, 2.1, 2.4, 3.1, 5.1) has an API list and at least three Checks; every theorem has a locator; every layer ends with Examples and Dependencies. No LaTeX delimiters, HTML anchors, pull-request numbers, dates, machine paths or process wording (searched). No layer is named after a source's chapter and the README does not say it follows a source.

Headline theorems of the Summary: §4.6 (BKO21 Theorem 6.1) and §6.4 (BKO21 Theorem 6.2); the module docstring names these and §§4.2, 4.4 with the carriers each lacks. None is statable from the pinned carriers with a few simple definitions: the signed local conditions need the Lubin–Tate formal module on the anticyclotomic tower and L_p needs the elliptic-unit class. None that is statable is absent and none is forced through a stand-in.

`lake env lean` on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace: no declaration, no `sorry`, no `set_option`. The one-tactic probe and the `#check @name` comparison therefore have zero cases. Nothing is padding. No Lean process was left running.

### Copyright and arrangement

Wording: beside the 15 sampled locators, compared eight further passages: the second sequence of §4.1 with AHII05 lines 266–268, the route of §4.2 with lines 222–231, the route of §5.2 with lines 322–338, the definition of §2.4 with BKO21 lines 833–839, the definition of §1.4 with BKO21 lines 866–872, the statement of §3.5 with RUB91 lines 545–551, the first gap sentence with RUB91 lines 162–206, and the module docstring. The routes of §§4.2 and 5.2 pass through the steps the argument forces; no run of more than four consecutive words is shared. No table, figure or list of a source is taken over.

Arrangement: BKO21 has 29 of the 80 locators, AHII05 28. BKO21 has §3 (Hecke L-values) and §6 with three parts; AHII05 has §2 Selmer groups, §3 ranks, §4 characteristic ideals, §5 control. The seven layers do not map one to one onto either: Layers 0, 2 and 6 have no section of AHII05, Layer 3 adds the descent and the local comparison to three propositions of its §3, and Layer 4 takes Theorem 3.6 from §3 together with §4. The order is forced by the *Needs:* lines: §3.1 needs §§1.5, 2.1, 2.3; §4.1 needs §§3.3, 3.4; §5.2 needs §3.3; §6.3 needs §§4.6, 5.3, 5.4.

Source independence: 23 passages compared with 4 sources (BKO21, AHII05, AHI06, RUB91), none shared; largest share BKO21, 29 of 80 locators; contents compared with BKO21 and AHII05: independent.

## Not verifiable

- BRU67 is waived in the manifest; its text was not read. The gap that cites it names its supplier and its exact statement.
- BIL86 is outside this round's sample and was not reread; the earlier rounds' checks of §4.3 are relied on.
- The extraction of BKO21 loses overbars (lines 825–827, 841); conjugates were checked through BKO21 (3.2), (3.4) and the covariance of §2.5.
- Supplier sections and gaps are contracts in open pull requests, not proved statements; the heads read are those of the index of 2026-11-15.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the product of the two control elements is γ to the power p^k minus one; it should be the power pⁿ for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is Lemma 2.1.2 of AHI06; it should be Lemma 1.2.1; affects nothing.

## For the human reviewers

- **Scope (ownership across the merge order).** The content of the two gaps asked of NonordinaryCMSpecialValues is stated by ModularIwasawaMainConjecturesPartII §§4.1, 4.7–4.8 at the head of #2281 (README lines 377, 476, 491), which is later in the merge order.
- **Licence.** The cached text of BKO21, fetched from the institutional record in `sources.toml`, carries on each page a JSTOR download stamp and terms-of-use line (BKO21 lines 242–244).
- **Licence.** The cached text of AHI06 names the journal's open archive as its origin (AHI06 line 2), while `sources.toml` records the author's page as `fetched_from`.
- **Not tested.** BRU67 is waived and was not read; it is cited only for the Ax–Brumer theorem requested as a gap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6314bb160eef8a8db7f982c445d5eebe70d594ea", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~7", "model": "fable", "worker": "chris-x79"} -->
