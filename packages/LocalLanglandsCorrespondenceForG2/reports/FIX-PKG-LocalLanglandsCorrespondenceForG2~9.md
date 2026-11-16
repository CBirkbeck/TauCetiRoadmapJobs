# FIX-PKG-LocalLanglandsCorrespondenceForG2~9: repair report

Review settled: `REV-PKG-LocalLanglandsCorrespondenceForG2~8` (three findings: F01 P2, F02 P2, F03 P3). Files changed: `packages/LocalLanglandsCorrespondenceForG2/README.md`, `packages/LocalLanglandsCorrespondenceForG2/design/plan.json` (top-level `gaps` only: one entry added, one `needs` rewritten), `packages/LocalLanglandsCorrespondenceForG2/sources.toml` (HKT and GS entries). `Suggested.lean` is unchanged: no finding touches either of its headlines (§0.0, §0.8), and §3.11 is not stated there. The review's section for the human reviewers lists no finding and changed nothing.

## F01 (P2) — applied differently

Old → new: §3.11(ii)(a) now asks that the cuspidal lift restrict to Sp₆ with a generic global Arthur parameter (MLE §§3.8, 3.17). The (ii)(a) Route goes through L-packets. The uniqueness Route gets genericity from the Steinberg place, via a new gap `symplectic-steinberg-generic-parameter` on ModularityAndLanglandsExtensions. Also added: an explanatory paragraph, a Notes bullet and an exponent-count Check.

The finding is right. GF line 241–245 identifies A(Π′)_v with Lif(Π_v) without any hypothesis. ModularityAndLanglandsExtensions §3.15(c) at its open head gives L-packets only for a trivial Arthur SL₂. §3.17 puts the components in Π̃_{ψ_v} for every ψ.

What I changed from the proposed repair, and why:

- **Repair step 3 is circular.** It says "Sym⁶ irreducible, so the transfer is a single cuspidal representation and the parameter is generic (as in §3.15)". But §3.15 first gets genericity from global genericity (MLE §5.1). Only then does it read the component at the Steinberg place from an L-packet. The Σ of the uniqueness argument is a lift from compact Aut(O), holomorphic at the real places, so it is not globally generic. Going from "St at v₁" to "generic parameter" needs packet information at v₁ that no supplier states. The proposed Check 5 relies on it implicitly: it compares exponents of members of an Arthur packet. The same unsupplied step already appeared in §1.7's Route ("The Steinberg component makes the global Sp₆-parameter generic"), copied from GS line 1557–1559 (proof of Lemma 12.4). It is therefore declared once, as `gap:symplectic-steinberg-generic-parameter` on ModularityAndLanglandsExtensions (§§3.8, 3.15, 3.17), stated for Sp₂ₙ. That supplier is earlier in the merge order, and the gap is in the README and in `design/plan.json`. The statement: a discrete automorphic representation of Sp₂ₙ(𝔸_k) with a Steinberg component at a finite place v has as global parameter a single unitary self-dual cuspidal μ on GL₂ₙ₊₁ with b = 1 and μ_v = St. So the parameter is generic and its component group is trivial. It is stated for Sp₂ₙ only: for even SO the principal SL₂ is S₂ₙ₋₁ ⊕ S₁, so the analogue would have two summands.
- **The exponent Check** is written for the case it really computes (μ_v of unramified parameter S_a). It corrects the parity point: for c = max(a, b) the exponents are integers only when c is odd, and only then does the segment contain 0. A blanket "segment through 0" was false for even c. The Check names the contract it illustrates.
- **The alternative repair is not taken.** It would be a contract asking for equal gamma factors within local Arthur packets "at every place, finite or real". At real places, members of one packet share the infinitesimal character but not necessarily the gamma factors. For example γ(s, sgn, ψ)/γ(s, 1, ψ) = i·cot(πs/2) is not constant, although sgn and 1 have the same infinitesimal character. Holomorphic discrete series do lie in Arthur packets with nontrivial Arthur SL₂ (ModularityAndLanglandsExtensions §3.22, Mœglin–Renard). So the unrestricted GF (ii)(a) is not established, and narrowing is the sound choice. Narrowing weakens only existence; the uniqueness Π satisfies the new hypothesis.

**Pattern repaired.** The step "Steinberg place ⇒ generic single-cuspidal parameter" had no supplier in five other places. Each now cites the contract, and its *Needs* line and its layer's Dependencies were updated:

- §1.7 Route;
- §3.1 Route, where the rank-seven transfer of the lift from compact G₂ is cuspidal;
- §6.4, second route; the first route now names MLE §5.1 for its genericity;
- §8.1 Route;
- §10.6 Route, for the trivial global component group.

The Scope paragraph lists the new contract. §3.15 needed no change: there genericity comes from MLE §5.1.

## F02 (P2) — applied differently

Old → new: in the contract `cubic-global-jacquet-langlands`, ramified components equal the local transfer only for infinite-dimensional Π′ (which have cuspidal transfer). For Π′ = χ ∘ Nrd the transfer is χ ∘ det, with the same cuspidal support as χ_v ⊗ St₃. For split D, JL(Π′) is the isobaric sum of a cuspidal datum (AutomorphicLFunctionsAndLocalFactorsPartII §10.0). Added a Π′ = 1 Check and a Notes bullet.

The finding is right on both counts:

- D_v×/F_v× is compact, so 1 is square-integrable at a ramified v, and §4.7a sends it to St₃. Yet JL(1) = 1_GL₃, with component 1_GL₃ ≠ St₃. The old contract could not be met for one-dimensional Π′.
- AL.3.6.2 says "Use unitary cuspidal representations". A constituent of the lift to PGL₃ need not be cuspidal.

The contract text in the README and its `needs` in `design/plan.json` were rewritten as proposed. The (ii)(b) Route now treats D division and D split separately. The real-place step for split D is justified explicitly: Ind(D_k ⊗ χ) has no K-fixed vector, so a spherical Π′_u forces spherical datum components, and then both share the parameter χ₁ ⊕ χ₂ ⊕ χ₃. The functional equation is taken summand by summand on unitary twists.

What I changed from the proposed repair: it cites AL.3.3.1 for "a Rankin–Selberg factor depends only on the cuspidal support". AL.3.3.1 only gives L-factors of irreducible generic normalized inductions; 1_GL₃ is neither generic nor such an induction. The right input is EndoscopicTransferAndUnitaryTraceComparison §10.29: the γ-factors of every irreducible representation are products over its Langlands data, and those of a segment are products over its supercuspidal support. The same mis-citation was in the Route of rule (i) ("multiplicativity … (AL.3.3.1)"). That was also corrected, AL.3.3.1 was removed from the §3.11 *Needs*, and §10.29 was added to the EndoscopicTransferAndUnitaryTraceComparison contract bullet, the Scope line and the Layer 3 Dependencies.

## F03 (P3) — applied

Old → new:
- §7.2 "HKT, main theorem" → "HKT, abstract, p. 1, with Theorem 3.3, p. 17, for surjectivity and §4, Proposition 4.3, Lemma 4.4 and Proposition 4.5 with the construction that follows it, pp. 18–22, for injectivity".
- HKT entry: locator and `cited_for` (+"7.2", "Notes on the sources").
- GS locator: seven statements added.
- References: HKT locators updated.

I read Proposition 4.3, as the review asked (HKT line 802–812). It proves injectivity only when θ₇(π) is not supercuspidal. The general case is Lemma 4.4 (line 813), Proposition 4.5 (line 829) and the construction completing it (line 916–934, p. 22). So "§4, p. 19" alone would understate the locator, and the full range is cited. Theorem 3.3 (line 716–718, p. 17) is surjectivity. The abstract (line 15–27) states the bijection onto G₂-irreducible W_K-parameters. Those are the discrete parameters trivial on SL₂: a G₂-completely reducible image lies in a proper parabolic only if it lies in a Levi of it.

The seven GS statements exist at GS line 341 (Theorem 2.1), 883 (Corollary 5.3), 1134 (Lemma 10.1), 1201 (Corollary 10.6), 1398 (Proposition 11.6), 1444 (Definition 12.1) and 1448 (Lemma 12.2).

**Pattern.** A script listed every numbered statement the README cites, per source key, and compared the lists with `sources.toml`. After the edit, every cited GS, GF, HKT, HD, CG, C, Shin, GS20, SV, Griess and SpV statement is in its entry. KS and ILM are cited by authors' names, and their statements (Theorem A, Proposition 13.1; Lemma A.2, Proposition A.5, Proposition 4.5) are in their entries.

## Checks run

- **Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, run from the content checkout: exit 0. The only diagnostics are `declaration uses 'sorry'` at 118:8 (`griess_conjugacy`) and 137:8 (`spin7_not_acceptable`).
- **Signatures.** I put `#check @` for all five declarations (`octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`) in one scratch copy and elaborated it once: exit 0. Each type matches the worker's signature list and the README statements of §§0.0 and 0.8. No binder was lost and nothing changed.
- **Dependency check.** Output, exactly:

```text
depcheck: 244 roadmaps, 2283 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- **Citation resolution.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Gap slugs.** The README's `gap:` slugs and the plan's `gaps` slugs are the same 19.
- **Gate failures.** None were listed in the brief.
- **Sources.** No new source was cited. No `needs-references.toml` was written.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.11(ii)(a), new hypothesis | the uniqueness Π (St at v₁); a lift whose parameter has a summand μ ⊠ ν_b with b ≥ 2; a compact real place | exponents of Sym⁶ are 3, …, −3 once each, so (a, b) = (7, 1); for b ≥ 2, A_u has parameter φ_{ψ_u} while Σ_u's L-parameter can differ; real: γ(sgn)/γ(1) = i·cot(πs/2) at equal infinitesimal character | hypothesis needed; unrestricted form not established at real places | hypothesis added; alternative contract not taken |
| (ii)(a) Route, A_u ≅ Lif(Π_u) | finite u with ψ generic; split real u with spherical Π_u; compact real u | L-packet of φ_{ψ_u} contains Σ_u, so param(Σ_u\|Sp₆) = φ_{ψ_u} = param(Lif(Π_u)); real contract gives 1 ⊕ ⨁χ_i^(±1), resp. sgn ⊕ ⨁Ind((z/z̄)^m) with m = 1, 2, 3 at λ = 0 | holds | rewritten |
| gap `symplectic-steinberg-generic-parameter` | n = 1 (SL₂); n = 2 with ψ = τ ⊠ ν₂ ⊞ 1, τ_v = St₂; n = 3; the trivial representation; even SO | n = 1: exponents {1, 0, −1}, (3, 1) gives a cuspidal GL₃ with St₃, (1, 3) the trivial representation; n = 2: {1, 0, 0, −1} ∪ {0} ≠ {2, …, −2}; n = 3: as above; trivial representation: component 1, not applicable; even SO: S₂ₙ₋₁ ⊕ S₁, two summands | holds for Sp₂ₙ; false analogue for SO₂ₙ excluded | added |
| exponent Check (§3.11) | (a, b) = (2, 2), (3, 1), (2, 1), (1, 7) | (2, 2): {1, 0, 0, −1}, 0 twice; (3, 1): {1, 0, −1}; (2, 1): {½, −½}, not integers; (1, 7): parameter 1 ⊠ ν₇, packet of the trivial representation | parity clause needed | Check written with c odd |
| gap `cubic-global-jacquet-langlands` | Π′ = 1; Π′ = χ ∘ Nrd with χ³ = 1, χ ≠ 1; infinite-dimensional Π′ with Π′_v = 1 at a ramified v | 1 ↦ 1_GL₃, support {\|·\|, 1, \|·\|⁻¹} = support of St₃; central character χ(z³) = 1 on PD×; cuspidal JL(Π′)_v = St₃ (generic), not 1_GL₃ (nongeneric) | holds | rewritten |
| §3.11 Check, Π′ = 1 | ramified u, T_u arbitrary | γ(1_GL₃ × T) = γ(s+1, T) γ(s, T) γ(s−1, T) = γ(St₃ × T) (segment formula, centred St₃ = St₃(ν⁻¹)); Lif(π_deg[1]) = Sym² ⊕ 1 ⊕ Sym²; both sides γ(T)·γ(St₃ × T)² | holds | added |
| (ii)(b) Route, split D | Π′ = χ ∘ det, χ³ = 1; a datum with a GL₂(ℝ) discrete series D_k | datum (χ\|·\|, χ, χ\|·\|⁻¹), L^S = ∏ L^S(s+a, χ × T) for a = 1, 0, −1; real χ_u = 1, so parameter \|·\| ⊕ 1 ⊕ \|·\|⁻¹ with product 1 = χ₁χ₂χ₃; (D_k)^O(2) = 0, so Ind(D_k ⊗ χ)^K = 0, no spherical subquotient | holds | rewritten |
| rule (i) Route citation | 1_GL₃ against St₃ | AL.3.3.1 needs irreducible generic inductions, and 1_GL₃ is nongeneric; ET §10.29 gives equal γ | old citation inapplicable | §10.29 cited |
| §7.2 HKT locator | Theorem 3.3; Proposition 4.3; Lemma 4.4; Proposition 4.5 | line 716 (p. 17) surjective; line 802 only for θ₇(π) not supercuspidal; line 813 (p. 19); line 829 (p. 20), completion line 916–934 (p. 22) | pp. 18–22 | locator fixed |
| §§1.7, 3.1, 6.4, 8.1, 10.6 (pattern) | Σ with St_PGSp₆ at v₁, not globally generic (§§1.7, 3.1, 6.4 second route, 8.1); Σ globally generic (§6.4 first route) | contract gives μ cuspidal on GL₇ with μ_{v₁} = St₇ and S_ψ = 1; MLE §5.1 gives distinct unitary self-dual cuspidal summands | inputs now named | citations and *Needs* added |

## For the maintainer

- **Consequences for suppliers:**
  - New supplier statement asked of ModularityAndLanglandsExtensions (§§3.8, 3.15, 3.17): `gap:symplectic-steinberg-generic-parameter`. GS (proof of Lemma 12.4, p. 37) uses it without proof. A search by object, on main and in the open roadmap pull requests ("Steinberg … generic/Arthur parameter", "infinitesimal character … Arthur packet"), found no other owner.
  - The contract `gap:cubic-global-jacquet-langlands` on EndoscopicTransferAndUnitaryTraceComparison is narrower and now correct for one-dimensional Π′.
  - New citations, resolved at the open heads: EndoscopicTransferAndUnitaryTraceComparison §10.29 and AutomorphicLFunctionsAndLocalFactorsPartII §10.0 (first statement).
- **Names.** No Lean name changed and no declaration was added or removed. No id this roadmap defines was renumbered.
- **Existence half of §3.11.** It now asserts the functional equation (ii)(a) only for lifts with a generic Sp₆ parameter. A consumer that wants it for every cuspidal lift needs gamma-factor equality within local Arthur packets, which is not established at real places.
- **Ownership against open pull requests.** Checked through `roadmaps grep` and the overlap list (no dropped id, no second copy, no other pull request changing this roadmap). Each open pull request was not read individually.
- **No suspicious instructions** were found in the review text.
