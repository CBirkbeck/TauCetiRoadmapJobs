# Review of RefinedTraceMethodsPartII (pull request #2410 at 4e9063f)

**Verdict:** accepted

Incremental re-review of the 11 lines changed since `004cc58` (README §8.1, §8.5, §8.6). No finding.

## Previous findings

- R01 — repaired: "Let k be a perfect 𝔽_p-algebra and `P = W(k)[x_1, …, x_n]`, filtered by monomial weight … Give `R = P̂/(f_1, …, f_c)` the quotient filtration and suppose it is complete." Longest run shared with akn24 lines 357–359: 4 words.
- R02 — repaired: "pre-prismatic when A′ → R kills an invertible ideal I ⊆ A′ and Spec A′ is covered by opens D(g) such that every d ∈ I generating `IA′_g` has δ(d) invertible in `(R_g)^∧_p`"; the factorization is now four separately listed conditions in another order.

## Verified sound

| Target | Instances | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| §8.1 pre-prismatic pair (reworded) | (ℤ_p, 𝔽_p), I = (p), g = 1; (ℤ_p, ℤ/p²); two generators d, ud | δ(pu) ≡ u^p·δ(p) ≡ u^p mod p: unit. δ(p^m u) ∈ pℤ_p for m ≥ 2: not a unit. δ(ud) ↦ φ(u)δ(d), so "every" = "some" generator | holds |
| §8.1 relatively qrsp (reworded) | (ℤ_p, 𝔽_p), A′ = ℤ_p; (ℤ_p, ℤ/p²) | four conditions: identity perfect, onto, `(p)/(p²)[1]` in [1,1], pre-prismatic: all hold. Second pair: three hold, pre-prismatic fails; agrees with the §8.1 Check | holds |
| §8.5 filtered δ-ring, filtered prism (reworded) | `W(k)⟦z⟧`, z-adic, I = (E(z)); trivial filtration | δ(z) = 0, φ(z^m) = z^{pm} ∈ F^{pm}; `gr^u = W(k)z^u` p-torsion free and p-complete, `I ⊗ gr^0 = (p)`; same content as akn-delta lines 2107–2118 | holds |
| §8.6 degeneration (reworded) | ℤ/4 versus 𝔽₂[z]/z² | definition is akn24 line 326's Rees condition; same graded ring, K_3 = ℤ/8 versus 𝔽₂² (Check unchanged) | holds |
| §8.6 completeness (R01) | `W(k)⟦z⟧/(E(z), z^n)`; `ℤ_p⟨z⟩`; a weight-0 variable | n = 1 variable, w = 1, weights of (E, z^n) = (0, n): applies. `ℤ_p⟨z⟩` is not of the form P̂/(f) with complete filtration: excluded. Weight 0: filtration trivial, complete | holds |
| §8.6 completeness, base W(k) | k = 𝔽_p; k perfect | `L_{W(k)/ℤ_p}` vanishes p-completely, so `L_{R/ℤ_p}` is a cofibre of finite filtered projectives as akn24 Lemma 2.12's proof needs (line 383); k = 𝔽_p gives ℤ_p | holds; not narrower than the source |
| §8.6 comparison of completions, part (1) | A = `W(k)⟦z_0,…,z_s⟧`, R = `O_K/ϖ^n` | dim A = s + 2 and R artinian, so the s + 2 elements are regular; `L_{R/A}` free of rank s + 2 in degree 1, weights 1,…,1,0,n; F^⋆R finite, complete | holds |
| §8.6 comparison of completions, part (2) | same; literal reading over `gr^0A` | `gr^0R = k`, `gr^0A/(p) = W(k)/p = k`: smooth. Over `gr^0A = W(k)`: p = 0 in a flat W(k)-algebra forces 0, so k is not smooth; akn24 lines 479–486 work over the reduction | holds; corrects the source (Source issues) |
| §8.6 new Check against akn24 Warning 4.27 | s ≥ 0, n ≥ 1 | source line 1455 asserts the two completions agree for exactly these pairs by Theorem 2.20: consistent with the corrected (2), inconsistent with the literal one | holds |

The rows of the previous review, of `004cc58`, stand for every untouched statement.

- Source locators checked against the text in the changed passages: 16 in 2 sources (akn-delta 9: Definitions 2.1, 2.2, Remark 2.3, line 121, Definitions 9.1–9.2, line 1851, Definitions 10.2–10.10, 10.6 with Remark 10.9, 10.8; akn24 7: Proposition 2.6, Proposition 2.11, Lemma 2.12, Theorem 2.20 and its proof, Warning 4.27, lines 501–507). Sampled targets in the change: §8.1, §8.5; §8.2 and §8.3 cite the §8.1 definitions and remain consistent (README lines 731, 739).
- Dependent text re-read: README lines 693–694, 704, 731, 739, 781, 783, 799. All agree with the reworded definitions ("the other three conditions" at line 704 matches the four listed).
- Cross-roadmap citations in the changed passages: PrismaticCohomologyPartII §4.22, unchanged. No Lean statement changed; no library declaration is touched.
- Gate re-run at this head: every check passes. `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 63, 71, 79) and nothing else; the file is unchanged since `004cc58`.
- Pull request text: title, summary block and prose agree with this head (a new roadmap, six declarations, the same suppliers); the change is wording, a stated base for Theorem 2.20 and one Check, none of which the text describes.
- Declared gaps: unchanged, both slugs as in the previous review.

Overlap check: read RefinedTraceMethods, PrismaticCohomologyPartII, PrismaticCohomologyPartIII (open) and CrystallineCohomology, DerivedDeRhamCohomology, PerfectoidQuotients (main); the third list is empty; the change adds no object, and ownership stands as in the previous review (pointed-monoid THH genuine model: KTheoryFiniteLocalFields §5.16; syntomic complexes over ℤ_p: PrismaticCohomologyPartIII §6.8; de Rham–Witt: CrystallineCohomology CR.4).

Source independence: changed passages only; 8 passages compared with 2 sources (akn-delta, akn24), none shared (longest runs: 6 words, "a strict filtered commutative ring F^⋆A", and the forced "p-complete Tor-amplitude in [1,1]"); largest share akn24, 52 of 235 source-id occurrences; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- larsen-mixed and bach-hypersurfaces (§2.6): settled as uncertified; untouched by this change.

## Source issues

- **Error** in akn24 at Theorem 2.20 (2), printed page 10 (line 460): the source says the hypothesis is that gr^0R is smooth over gr^0A; it should be smooth over the reduction of gr^0A modulo the prism ideal, as its proof uses; affects a stated result.
- **Error** in speirs-axes at Theorems 1 and 2, p = 2 and q = 2r + 1, printed page 1 (line 64): the source says the product runs over 0 ≤ v ≤ t_ev with a copy of `k^{cyc_d(s′)}` for each v; it should be one copy for each odd m′ ≤ 2r + 1 and none otherwise; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, printed page 43 (line 1770): the source says the truncated formula holds when (p−1)j ≥ i; it should be (p−1)j > pi, the hypothesis of Lemma 8.5 that its proof uses (𝔽₂, i = j = 1 fails); affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed page 8 (line 395): the source says the quotient has length ½(2r+1)(a−1)(b−1) over W(k) for every commutative ring k; it should be for a field k (k = 𝔽_p × 𝔽_p gives twice that); affects a stated result.
- **Misprint** in akn24 at Remark 5.3, printed page 46 (line 2077): the source says j = ⌈n/e⌉ is the exponent of the additive group of O_K/ϖ^n; it should be p^j, j being the least integer with p^j = 0; affects nothing.

## For the human reviewers

- **Scope.** Layers 8 and 9 rest on two arXiv texts cited in preprint form, akn24 (arXiv:2405.04329v1) and akn-delta (arXiv:2310.12770v2, dated 7 May 2026): 102 of the 235 source-id occurrences in the README. bouis-motivic is arXiv:2608.05220v1 (2026).
- **Scope.** README §8.6 states akn24 Theorem 2.20 (2) with smoothness over `gr^0A/(I ⊗_A gr^0A)`, not over `gr^0A` as printed (akn24 line 460); the Check at README line 800 gives the reason.
