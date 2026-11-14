<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6871865037 -->
Review (claude) of 47296a1

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The spherical Hecke rings and their commutativity have no owner cited

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 646 (§3.8): "the integral spherical Hecke rings ℤ[G(ℤ_ℓ)\G(ℚ_ℓ)/G(ℤ_ℓ)], with basis the double cosets and the convolution product; it is commutative". Also line 1166 (§6.10, H^S "which is commutative") and line 53 (From Tau Ceti, "needs no additional Tau Ceti declaration").

   **Claim:** The Hecke rings, their product and their commutativity are stated as facts. Commutativity is then used: §4.7 ("a commutative finite Λ-algebra"), §7.1 ("coherent commutative O_Z-algebra"), the second Check of §3.8 and the third Check of §6.10. The `*Needs:*` lines of §3.8 (line 650) and §6.10 (line 1170) name no supplier for any of it, and line 53 says Tau Ceti has nothing to offer.

   **Witness:** Tau Ceti `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`) and `mul_comm_of_antiInvolution` (`Commutativity.lean:459`); Mathlib `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:189`); SmoothRepresentationsOfLocalGroups §§SR.1.2, SR.4.1 on main.

   What each provides. Mathlib has the module of finitely supported functions on double cosets (`HeckeCoset`, line 157, under `IsHeckeTriple`, line 75) and no product. Tau Ceti has the ring structure from Shimura's convolution product and commutativity when an anti-involution fixes every double coset, with an instance for GL_n and none for GSp₂g or a general unramified group. SmoothRepresentationsOfLocalGroups §SR.1.2 owns the level algebra `H(G,U;A)` with basis the double cosets and its identification with that ring; §SR.4.1 owns the Satake isomorphism for an unramified group with hyperspecial K over ℤ[q⁻¹]. A sibling roadmap, AutomorphicBundles, cites the pinned ring instance in its supplier contracts.

   **Exact repair:**

   1. From Mathlib (line 49), append: "For the Hecke rings of §3.8 and §6.10 use `HeckeRing` in Mathlib/NumberTheory/HeckeRing/Defs.lean:189, the finitely supported functions on the double cosets `HeckeCoset` (line 157) of a submonoid by a subgroup satisfying `IsHeckeTriple` (line 75). At this pin Mathlib gives the module and no product."
   2. From Tau Ceti (line 53), replace the paragraph by: "`HeckeCosetModule.instRingHeckeRing` in TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 is the ring structure on the double-coset Hecke ring given by Shimura's convolution product, over any coefficient ring. `HeckeCosetModule.mul_comm_of_antiInvolution` in TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459 proves that ring commutative over a commutative semiring when an anti-involution of the submonoid preserving the subgroup fixes every double coset. The local spherical Hecke rings of §3.8 and §6.10 are these rings for G(ℚ_ℓ) and its hyperspecial subgroup; Tau Ceti has no such anti-involution for GSp₂g or for a general unramified group, so their commutativity is taken from SmoothRepresentationsOfLocalGroups §SR.4.1. No other Tau Ceti declaration is used; solid derived tensors, Shimura geometry and supported automorphic cohomology are specified as targets or supplier contracts below."
   3. From SmoothRepresentationsOfLocalGroups (among the bullets at lines 280–285), add two bullets: "§SR.1.2: the level Hecke algebra H(G,U;A) of a compact open subgroup, with basis the double cosets, and its identification with the double-coset Hecke ring of the pinned libraries." and "§SR.4.1: the Satake isomorphism for an unramified group with hyperspecial K over ℤ[q⁻¹]. It makes the spherical Hecke algebra commutative over every ring in which q is a unit, and so over ℤ, because ℤ[K\G/K] is ℤ-free and embeds in its extension of scalars to ℤ[q⁻¹]."
   4. §3.8, line 646: replace "with basis the double cosets and the convolution product; it is commutative" by "each the double-coset Hecke ring of the pinned libraries (Mathlib `HeckeRing` with the Tau Ceti ring structure; SmoothRepresentationsOfLocalGroups §SR.1.2), commutative by SmoothRepresentationsOfLocalGroups §SR.4.1; T^S is the filtered colimit, over finite sets of primes ℓ∉S, of the tensor products over ℤ of these commutative rings, along the maps inserting the unit double cosets".
   5. §6.10, line 1166: replace "which is commutative" by "the restricted tensor product over ℓ∉S of the local spherical Hecke algebras over ℚ (SmoothRepresentationsOfLocalGroups §SR.1.2), each commutative by SmoothRepresentationsOfLocalGroups §SR.4.1, since K_ℓ is hyperspecial and ℓ is a unit in ℚ".
   6. Add to the `*Needs:*` lines of §3.8 and §6.10, and to the Dependencies of Layers 3 and 6: "Mathlib `HeckeRing`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`; SmoothRepresentationsOfLocalGroups §SR.1.2; SmoothRepresentationsOfLocalGroups §SR.4.1". Add to the Scope bullet on SmoothRepresentationsOfLocalGroups (line 21): "its §SR.1.2 owns the double-coset Hecke algebras and §SR.4.1 the Satake isomorphism, from which the commutativity of T^S and H^S is taken".

   **Repair test:** g=1, ℓ=3. The local ring is the pinned double-coset ring; its relation `[K diag(1,3) K]² = [K diag(1,9) K] + 4[K 3 K]` has degrees 16 = 12 + 4 (first Check of §3.8, unchanged). Satake over ℤ[1/3] gives a polynomial ring in two variables with one inverted, commutative; ℤ[K\G/K] is free on the double cosets and embeds in it, so it is commutative. The second Check of §3.8 (matrix units E₁₂, E₂₁ with products diag(1,0) ≠ diag(0,1)) is still excluded, now by a cited theorem. SmoothRepresentationsOfLocalGroups is line 26 of the merge order and already a supplier (§9.5), so no new roadmap edge and no upward citation arises.

2. **F02** (P3) §4.2 lists a supplier that neither its statement nor its route uses

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 697 (§4.2): "*Needs:* §4.1; §2.4; AutomorphicBundlesPartII §3.0a; AutomorphicBundlesPartII §3.3; CompletedCohomologyPartII §3.11; CompletedCohomologyPartII §3.12; …".

   **Claim:** Independence of the unipotent level at a fixed torus subgroup needs the admissible category and the admissible–perfect anti-equivalence.

   **Witness:** The statement (line 693) compares finite-level complexes, perfect over `ℤ_p[T(ℤ_p)/T_K]` by §4.1. The route (line 695) uses iterated correspondences and the invertible ordinary operator. BP-Hida line 2800–2841 (Proposition 5.2.5 and proof) uses Proposition 2.8.2 only; admissibility first enters at line 2845 (Proposition 5.2.7), which is §§4.3–4.4.

   **Exact repair:** delete "CompletedCohomologyPartII §3.11; CompletedCohomologyPartII §3.12;" from line 697. The Dependencies of Layer 4 keep both, for §§4.3–4.5.

   **Repair test:** with T_K = T_K′ and K_P = K′_P the comparison is the identity of a perfect `ℤ_p[T(ℤ_p)/T_K]`-complex; no continuous-function module occurs. §§4.3, 4.4 and 4.5 still list both sections in their own Needs lines, so the roadmap-level edges and the dependency check are unchanged.

Two findings: one P2 (the spherical Hecke rings, their product and their commutativity are stated and used with no owner cited, although the pinned libraries and a roadmap on main have them) and one P3 (a `*Needs:*` line with an unused supplier). All three round-11 findings are repaired. The fifteen sampled sections agree with the source texts at their locators. Every cross-roadmap citation resolves at the supplier's current text. The four reviewed files were not edited and no manifest entry was added.

## Previous findings (round 11)

| Prior finding | Repaired passage in `packages/HigherHidaAndColemanTheory/README.md` | Status |
|---|---|---|
| F01 (P2): §5.1 restated PerfectoidShimuraVarieties §§6.13a, 6.14, 6.15 | Line 843: "This section states no target. It fixes the notation that Layers 5–7 use for the finite-level Bruhat geometry, which is imported." Line 15 (Scope) names the owner section by section; line 827 reads "After the imported Bruhat geometry (§5.1)"; the proof route is gone | **Repaired** |
| F02 (P3): "light table" | Line 1409: "Define the two-coordinate weights κ_0=(3−ν2,3−ν1), …"; closing sentence "These two coordinates alone do not define a GSp₄ weight" | **Repaired** |
| F03 (P3): weaker bound called "stronger" | Line 1450: "The bounds proved in §5.5, before the comparison of Layer 8, give only k2 in the two middle entries for U2, so the test they support is the more restrictive v_p(U2_naive)<k2; §8.5 justifies k2+1." | **Repaired** |

None was marked not actionable. No maintainer notes were left for this roadmap.

The repaired §5.1 was read against PerfectoidShimuraVarieties at its head, sentence by sentence:

- §6.13a there constructs `π_HT,K_p` and `π^tor_HT,K_p` to the orbit set with the quotient topology and proves that the inverse image of each `K_p`-stable tube is an open analytic domain, with partial closures "used as subsets". The record says the same.
- §6.14 there has `K_p = K_{p,m′,b′}`, `0 ≤ m − n ≤ m′ − 1` and the condition that the cyclotomic character through μ factors through the reducing group. The record carries all three.
- §6.15 there has the double coset of `q_G(wtw⁻¹)` for `t ∈ T(ℚ_p)` and `M_HT = M_dR ×^{μ,ℤ_p^×} ℤ_p(1)`. The record matches.

Pattern sweep for the repaired patterns: no other section restates a PerfectoidShimuraVarieties target (§5.2, §6.1a and §6.10 cite §§6.4, 6.8–6.10, 6.13a, 6.14 and add their own statements); "table" as a named object no longer occurs outside the Layer 5 numbering table; "stronger" occurs only in source issue E6 and §4.9, both in the correct direction. The same ownership question asked of the other imported objects gave R01.

## Verified sound

### Coverage

Read all of `README.md` (1613 lines, nine layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the gap list of `design/plan.json`. The ten lines the last repair changed were reviewed in full and against the supplier. The fifteen sampled sections were read against the source texts. For sections outside the sample and untouched by the repair I relied on the round-11 rows with computed values; those in the table below were recomputed.

### Principles

- No route-specific shortcut: every genus, every prime including 2, quasi-split abelian type and singular weights are kept.
- No second copy of a roadmap on main, no upward supply, no algorithm, no sorried data, no `set_option`.
- Other roadmaps' texts and the sources were treated as data; none asked for an action.

### Seeded source sample (15 of 15 read; the author flagged no locator as unverified)

| Target | Text read | Outcome |
|---|---|---|
| §2.4 | BP-Hida line 954–969 (§2.5, Theorem 2.5.1, p. 19), 972–999 (Lemma 2.5.3, Proposition 2.5.4, pp. 19–20), 859 (Proposition 2.3.13, p. 17) | Supported: equivalence of the two orders, bounded finite over Artinian A, independence of the compactification. |
| §4.2 | BP-Hida line 1268 (Proposition 2.8.2, p. 25), 2797–2841 (§5.2.4, Proposition 5.2.5, pp. 54–55) | Supported: equal torus parts, traces and pullbacks. Needs line: R02. |
| §4.3 | BP-Hida line 2842–2846 (§5.2.6, Proposition 5.2.7, p. 55), 191–197 (Definition 1.4.1, p. 4) | Supported: `lim_m colim_n` of the reductions, in that order. |
| §4.4 | BP-Hida line 2845–2856 (Proposition 5.2.7 and proof), 2930–2940 (Lemma 5.4.2, p. 57) | Supported. |
| §4.7 | BP-Hida line 2954–2955 (p. 57); 184–190 (§1.4, p. 4) | Supported: image of the Hecke algebra in End(M_w), finite over Λ. Ownership of the Hecke ring: R01. |
| §4.8 | BP-Hida line 2957–2978 (Theorems 5.5.1–5.5.2, p. 57) | Supported: partner `w0M w w0`, weight `−w0Mκ−2ρ_nc`, character `w0χ⁻¹`, adjoint `w0t⁻¹`, target `[−d]`. |
| §4.9 | BP-Hida line 2983–3013 (Conjecture 5.6.1, Proposition 5.6.3 and proof, p. 58) | Supported, with the genus-one concentration and the two-affine cover. |
| §5.5 | BP-Coleman line 5667–5672 (Conjecture 5.9.2, p. 122), 5694–5699 (Theorem 5.9.6, p. 122), 5704–5711, 5769 (proof, pp. 123–124) | Supported: both proved bounds in each sign. |
| §5.6 | BP-Coleman line 5377–5378 (Theorem 5.6.1, p. 115), 5458–5465 (Theorem 5.7.1, p. 117), 5491–5494 (Theorem 5.7.2, p. 118), 5551–5552 (Theorem 5.7.3, p. 119), 1489 (Proposition 2.7.3, p. 32), 2450 (Theorem 4.1.7, p. 51) | Supported. |
| §6.10 | BP-Coleman line 7754–7760 (§6.9, p. 169), 3780 (§4.4.41, p. 80), 3926, 3939 (p. 84), 4102 (p. 87) | Supported; the ring-homomorphism statement is the roadmap's own target. Ownership of H^S: R01. |
| §7.2 | BP-Coleman line 7771–7794 (Theorem 6.9.3(1)–(2), pp. 169–170) | Supported: `w = w_M w^M`, support in the `w^M` part, converse under `+,sss_w(ν)` with dominant ν_alg. |
| §7.3 | BP-Coleman line 7826–7832 (definition and Proposition 6.9.5(1), p. 170), 7870–7871 (p. 171) | Supported. |
| §9.2 | BP-Coleman line 6536–6547 (§5.14.2, p. 141); BP-GL2 line 61–66, 80–84, 91–96, 102–106 (Theorems 1.1–1.4, pp. 2–3), 114 (§2.1, p. 4) | Supported: slopes ≥1 and ≥k, thresholds k−1 and 1−k, k≥3 for the degree-one family. One sign slip in the source (Source issues). |
| §9.7 | Pilloni-Singular line 4190–4427 (§§14.1–14.6, pp. 91–97), 4533 (Lemma 14.7.1, p. 99), 4554–4556 (Theorem 14.7.1, p. 99), 4568–4576 (Corollary 14.7.1, p. 100) | Supported: threshold k+2r−3, ε in [0,1), the two minima. |
| §9.8 | Pilloni-Singular line 82–91 (Theorem 1.1, pp. 2–3), 3283–3303 (Corollary 11.2.1, Theorem 11.3.1, p. 71), 4582–4676 (Theorem 14.8.1, Lemmas 14.8.2–14.8.4, pp. 100–102), 4680–4693 (Proposition 14.9.1, Corollary 14.9.1, pp. 102–103), 4702–4785 (Lemmas 14.9.1, 14.9.2, 14.9.2.1, pp. 103–105) | Supported, with the README's E16. |

### Adversarial table (sampled targets, headlines, targets touched by findings and by the repair)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.4 | point over 𝔽₂, T=id and T=0; ℙ¹ over 𝔽_p with p2=Frobenius, D−=V(t) | 𝔽₂[0] and 0. Frobenius: `(t^p)^a⊂(t)^b` iff pa≥b, so s=1/p; on `H¹(O(−k))` the class `t^(−i)` goes to `t^(−pi)`, zero once pi≥k: nilpotent, ordinary part 0 | Holds |
| §2.4 negative control | identity of 𝔸¹ in ℙ¹ | `(u^(ka))⊂(u^(kb))` fails for a<b; `H⁰=𝔽₂[t]` infinite | Excluded, as stated |
| §3.8 Hecke relation (R01) | ℓ=2, ℓ=3 | degrees `(ℓ+1)²=(ℓ²+ℓ)+(ℓ+1)`: 9=6+3, 16=12+4 | Holds; owner missing: **R01** |
| §3.8, §6.10 commutativity (R01) | E₁₂, E₂₁ on 𝔽₂² | products diag(1,0) and diag(0,1) differ; excluded only by commutativity of T^S | Used, not owned: **R01** |
| §4.2 (R02) | K_P=K′_P | identity map of a perfect `ℤ_p[T/T_K]`-complex; no `C⁰(T′,ℤ_p)` term | Holds; Needs: **R02** |
| §4.3 | finite regular representations | `lim_m colim_n ℤ/p^m[T′/p^n] = C⁰(T′,ℤ_p)`; z↦z is continuous and not locally constant | Holds |
| §4.4, §4.5 | R=C⁰(T′,ℤ_p)[0] | diagonal invariants give Λ′[0]; a term in degree i dualizes to degree −i and returns to i | Holds |
| §4.6 (headline) | ν(u)=u^k | `[u]↦u^(−k)`; at k=1, u=1+p the image is (1+p)⁻¹ | Holds |
| §4.7 | Λ=ℤ₃[[X]], M=Λ[0], degree character; M=Λ², 1+E₁₂ | image ℤ·id is not a Λ-module; Λ-span Λ·id of rank 1; Λ[N], N²=0, rank 2 | Holds |
| §4.8 (headline) | g=1; g=2, w=s1 | id↔long; κ=k pairs with 2−k, degree 0 with degree 1, into O[−1]. g=2: ℓ(w*)=2, [1,3] dual to [0,2] in [−3] | Holds |
| §4.9, §8.4 (headlines) | g=1, g=2, g=3 | d=1: M_id⁰ in [0,1], refined to degree 0; d=3: [ℓ(w),3] and [0,ℓ(w)]; d=6 rational only | Holds |
| §5.5 with §1.2 | GL₂, κ=(k;−k), cocharacter (−½;−½) | w=1: `a_w` pairs to 0, `a_w+2ρ_nc=(k−2;−k)` to 1, sharp `A_w` to 1. w≠1: `a_w=(−k;−k)` to k, `(2−k;−k)` to k−1, sharp k | Holds; proved and sharp tests agree for GL₂ |
| §5.6 | degrees | cuspidal ± in [0,ℓ±]; partner ∓ in [d−ℓ±,d]=[ℓ∓,d]; d=0: F×F→F | Holds |
| §5.8 (headline), §9.2 | k=2, k=1, k=0 | k=2: U_naive<2, U_std<1; k=1: both windows empty (k−1=1−k=0); k=0: degree-one threshold 1 | Holds |
| §5.1 record (repair) | GL₂, w=1, Iwahori; central μ | reducing group T(ℤ_p); central μ: flag a point, inverse image the whole space; `M_HT` is the μ-pushout of `M_dR` | Matches the supplier |
| §6.10 | T_ℓ at a non-CM point | x′=x would give an endomorphism of degree ℓ, not a square | Holds |
| §7.1, §7.5 (headlines) | acyclic family; H¹ only | empty Z and E; nonempty support | Holds |
| §7.2 | regular κ, w^M alone | W_M-part trivial gives ν=ν_w(κ), the weight of §7.5 | Holds |
| §7.3 | t:A→A over F⟨t⟩ | image (t), fibre (t)/t(t)=F; specialized map has image 0 | Holds |
| §7.6, §8.5, §9.3 (headlines) | κ=(5,3;−8), t2=(−½,−½;−½) | `A_w`: (0,2), (−2,2), (3,−3), (−5,−3) pair to 3,4,4,8 | Holds |
| §9.3 new Check (repair) | w=s1, s1s0, s1s0s1 | s1: `a_w=(−3,5)`→3, `+w⁻¹2ρ_nc=(0,2)`→3, `A_w`→4. s1s0: (5,−3)→3, (2,0)→3, `A_w`→4. Long: (−5,−3)→8, (−2,0)→5, `A_w`→8. General κ: `a_(s1)=(−k2,k1;−k1−k2)`→k2 | Holds: slope 3 passes only the sharp test |
| §9.1 (repair) | ν=(0,−2); ν=(1,1−k) | (5,3), (5,1), (2,−2), (0,−2); κ_0=κ_1=(k+2,2) | Holds |
| §9.7 | r=2,k=0; r=0,k=0; r=2,k=3 | thresholds 1, −3, 4; combined minima min(1,−2)=−2, min(1,1)=1; min(4,1)=1 | Holds |
| §9.8 (headline) | k≥1 valuations (0,0,k+1,k+1); p=3, (1,1,9,9); p=2 | ratios 0, ±(k+1), never 1; products 0,k+1,k+1,2k+2; eigenvalues 20; 2,10,10,18 of valuations 0; 0,0,0,2; torsion statement from k=4 at p=2 | Holds |

### Library declarations opened at the pin

- `Module.End`: `Mathlib/Algebra/Module/LinearMap/End.lean:33`.
- `zpow_sub₀`: `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402`, hypothesis `a ≠ 0`.
- `HasDerivedCategory`, `DerivedCategory`: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74` and `:87`.
- `CondensedMod` and its `Abelian` instance: `Mathlib/Condensed/Module.lean:41` and `:43`.
- `CondensedMod.IsSolid`: `Mathlib/Condensed/Solid.lean:83`, with the limiting docstring at lines 74–81.
- `HeckeRing`, `HeckeCoset`, `IsHeckeTriple`: `Mathlib/NumberTheory/HeckeRing/Defs.lean:189`, `:157`, `:75` (R01).
- `HeckeCosetModule.instRingHeckeRing`: `TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`; `HeckeCosetModule.mul_comm_of_antiInvolution`: `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459`; `HeckeRing.GLn.commSemiringHeckeRing`: `TauCeti/NumberTheory/HeckeRing/GLn/TransposeAntiInvolution.lean:112` (R01).

The first six entries are the only backticked identifiers in the README and are as it states; none is presented as this roadmap's own. A search of the pinned Mathlib and Tau Ceti for Shimura varieties, Igusa towers and coherent cohomology of Shimura varieties finds no carrier.

### Duplication, ownership and supplier drift

`roadmaps resolve` lists no citation and no Lean name found nowhere. In addition, 119 cited sections of 23 supplier roadmaps were matched by script against the headings of each supplier, on main or at its open head; all are present. Read for content this round:

- PerfectoidShimuraVarieties §§6.13, 6.13a, 6.14, 6.15: as the repaired §5.1 and the contract bullets say.
- CompletedCohomologyPartII §§3.11–3.12: admissible complexes, the anti-equivalence with amplitude [a,b]→[−b,−a], the diagonal model and the `w₀t⁻¹` twist recorded separately; as §§4.3–4.5 and 4.8 use them.
- IntegralHeckeAndGaloisDeterminants §2.1: finite Hom for bounded complexes with finite cohomology over a noetherian ring, and finiteness of the image of a commutative action; as §4.7 uses it.
- DeformationAndDerivedPatchingAlgebra §7.8: the completion comparison of derived Hom for bounded finite free complexes; as §3.8 uses it.
- SmoothRepresentationsOfLocalGroups §§SR.1.2, SR.4.1 and AutomorphicBundlesPartII §§3.13, 5.13: read for R01. §3.13 gives individual operators and says they "form an algebra action only after the integral convolution relations" are verified; §5.13 excludes arbitrary p-level. So §3.8 and §6.10 keep their targets, and only the abstract ring is R01.
- HodgeTateAndCanonicalSubgroups §5.1 and ShimuraCompactifications §§6.16–6.17: present; neither has the Klingen-level integral model or the height-one tower, so the three gaps that name them ask for nothing supplied.

`scratch/overlaps.md` lists no dropped id, no id defined only by an open revision, no second copy and no conflicting head. PadicFamiliesPartII (after this roadmap in the merge order) cites §§5.5 and 5.8 in the former numbering, which the table of Layer 5 maps. Its scope paragraph says that §9.6(4) here words the BGG intertwining with `p^(−k−1)U`; §9.6(4) (line 1513) now has `d1∘U=p^(k+1)U∘d1`, so that description is out of date in PadicFamiliesPartII and needs no change here.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting and PerfectoidShimuraVarieties; shared objects: the spherical Hecke rings and their commutativity — owner SmoothRepresentationsOfLocalGroups §§SR.1.2, SR.4.1 with the pinned ring, uncited here (R01); finite-level Bruhat domains, torsor reductions and their Hecke maps — owner PerfectoidShimuraVarieties §§6.13a–6.15, cited; analytic coefficient sheaves — owner OverconvergentAutomorphicForms §§8.6–8.7, cited; individual coherent Hecke operators — owner AutomorphicBundlesPartII §3.13, cited; the Klingen complex, its control and the Klingen BGG intertwining for F=ℚ — owner this roadmap §§9.4, 9.6, 9.8, consumed by PadicFamiliesPartII, whose §3.4 owns the away-from-p action on M_Kli; GSp4NonregularModularityLifting cites this roadmap only through PadicFamiliesPartII and shares no object.

### Supplier order

    depcheck: 242 roadmaps, 2212 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. This roadmap is line 255 of the merge order; its latest suppliers are AutomorphicBundlesPartII (254), OverconvergentAutomorphicForms (251) and AlgebraicModularFormsAndSerreWeightsPartII (249). No forbidden roadmap is cited.

### Declared gaps

All ten slugs are in the `gaps` list of `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section, and each occurs in at least four Needs or Dependencies lines. None has supplier `none`, and none asks for something read as supplied. The acceptance of a later round would be conditional on all ten.

### Shape, Lean form and padding

- Shape: summary, scope, conventions, contracts, build guide, nine layers each ending in Examples and Dependencies, consumers, references. All 66 numbered sections have a Needs line and a locator.
- Checks: each sampled section that defines an object has at least three (§4.3 three, §4.7 three, §6.10 five, §7.3 three; §2.4 three, §9.7 three, §9.8 four on theorems).
- Style: no LaTeX delimiters, pull-request numbers, machine paths, HTML anchors or process words (searched by pattern).
- Elaboration: `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout, exits 0 with no output and no warning.
- The Lean file is `import Mathlib`, one module docstring and an empty namespace. It declares nothing, so the one-tactic probe and the `#check @name` comparison have empty domains and there is no padding.
- Headline theorems (README line 293): §4.6, §4.8, §4.9, §8.4, §5.8, §7.1, §7.5, §7.6, §8.5, §9.8. Each is named in the module docstring with the carrier it lacks. The pinned Hecke ring of R01 makes none of them statable: each still needs the complex it acts on.
- Manifest: four sources, all recorded, all read. The sampled locators lie in the `locator` strings.

### Copyright, licences and scope

Wording: the fifteen sampled statements and five further passages were set beside the sources (§4.9 against BP-Hida line 2990–2992, the §4.2 route against BP-Hida line 2803–2841, the §9.8 route against Pilloni-Singular line 4669–4676, §6.10 against BP-Coleman line 7754–7760, the module docstring). The longest shared runs are five or six words ("is locally quasi-finite and partially proper"; "spherical Hecke algebra … away from S"), a forced statement and a standard name.

Arrangement: BP-Coleman has 70 of 156 source mentions. Against its contents (BP-Coleman line 17–76): Layer 5 draws on §§4.5–4.6, 5.4, 5.9, 5.6–5.7, 5.5 and 5.8, 5.12, in that order; Layer 6 on §§6.3, 4.4 and 6.6, 6.4, 6.1, 6.5, 6.2, 6.8, 6.6–6.7, 6.9. Neither is a run in the source's order. The order of Layers 5, 6, 7 is forced by the Needs lines of §6.2 (§§5.2–5.3) and §7.1 (§§6.3, 6.9, 6.10). Layers 2, 3, 4 and 8 draw on BP-Hida §§2, 4, 5 and 6; that order is forced by the Needs of §3.3 (§2.2), §4.1 (§§2.6, 3.5) and §8.2 (§§2.8, 3.5, 5.3). Reuse: the §9.3 values restate the first table of BP-Coleman §5.14.3 in a sentence and are recomputed at a chosen weight; no table, figure or data is taken over.

Source independence: 20 passages compared with 4 sources, none shared; largest share BP-Coleman, 70 of 156 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- The journal paginations of BP-Hida and Pilloni-Singular: the README cites the author editions only, and those were read.
- Overlined symbols in BP-Coleman §6.9 (interior cohomology) are lost in the text extraction; line 7826–7832 was read as the interior sheaf from the displayed image formula at line 7828.
- Sections outside the sample that no repair touched were not reread against the sources this round.

## Source issues

- **Misprint** in BP-Coleman at §5.14.2, printed p. 141: the source says the long-element slope bound k is minus the pairing of the cocharacter with the weight (−k;−k); it should be that pairing itself, as in the identity case; affects nothing.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, printed p. 102: the source says the two Hecke operators have only eigenvalues of positive valuation; it should be nonnegative valuation, which the corollary's valuations (0,0,k+1,k+1) attain; affects a stated result.

## For the human reviewers

- Licence: BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`licence_class = "author-page"` in `packages/HigherHidaAndColemanTheory/sources.toml`); the locator edition of BP-Coleman is an unpublished 180-page revision of arXiv:2110.10251.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "47296a10bd41da3367e96183624d51ed883643e7", "job": "REV-PKG-HigherHidaAndColemanTheory~12", "model": "fable", "worker": "chris-x29"} -->
