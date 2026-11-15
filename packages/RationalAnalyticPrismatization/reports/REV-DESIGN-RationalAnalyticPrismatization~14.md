<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6901418457 -->
Review (claude) of b789811

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the product formula for unramified K in 11.1 is false and contradicts 11.7

   **Location.** `design/README.md` line 1737 (11.1): "Prove that for K/ℚ_p unramified X^{Div¹} ≅ GSpec(K) × Div¹ (ALRS Remark 6.1.5, p. 145, ALRS line 7873)."; the same sentence in the statement of 11.1 in `design/plan.json`.

   **Claim.** For X = GSpec(K), K/ℚ_p unramified, the twistor stack is the product of GSpec(K) with Div¹ over GSpec(ℚ_p).

   **Witness.** K = ℚ_{p²}. The product has Γ(O) = K ⊗ Γ(Div¹, O), of dimensions 2, 4, 0 (11.7, first Check: 1, 2, 0). The second and third Checks of 11.7 give 1, 3, 0 for Γ(X^{Div¹}, O). Equivalently: a projection X^{Div¹} → GSpec(K) is a ring map K → H⁰(X^{Div¹}, O) = ℚ_p.

   The source sentence is transcribed correctly (ALRS line 7873); the error is the source's (see Source issues). The Frobenius is lost: for unramified K with residue field k, K = W(k)[1/p] lies in the functions of every thickened disc 𝒳_T over a nilperfectoid with a K-structure, and φ^* restricts to the Frobenius σ of K there. ALRS footnote 48 (ALRS line 7776) writes the base change correctly, over GSpec(ℚ_p)/φ^ℤ.

   **Repair** (README and `plan.json`, statement of 11.1). Replace the sentence by:

   "Prove that for K/ℚ_p unramified, with Frobenius automorphism σ, there are isomorphisms X^Δ ≅ GSpec(K) × Q_p^Δ and X^{Div¹~} ≅ GSpec(K) × Div¹~ under which the Frobenius is GSpec(σ) × φ, so that X^{Div¹} ≅ (GSpec(K) × Div¹~)/(σ × φ)^ℤ = GSpec(K)/σ^ℤ ×_{GSpec(ℚ_p)/φ^ℤ} Div¹ (ALRS Remark 6.1.5, p. 145, ALRS line 7873, in the Frobenius-twisted form of ALRS footnote 48, p. 143, ALRS line 7776; the untwisted product stated there holds only for K = ℚ_p)."

   Add to the proof route: "For unramified K a map K → O(D) on a degree-one divisor D ⊂ 𝒳_T is the same as a map k → A^{u♭}, hence as a map K → A (K is étale, 8.3), and φ^* acts on W(k) ⊂ O(𝒳_T) by σ."

   Add a Check to 11.1: "For K = ℚ_{p²} the untwisted product GSpec(K) × Div¹ has Γ(O) = K ⊗ RΓ(Gal_{ℚ_p}, ℚ_p), of dimensions 2, 4, 0, whereas Γ(X^{Div¹}, O) = RΓ(Gal_K, ℚ_p) has dimensions 1, 3, 0 (11.7); with the twist, H⁰ = (K ⊗ H⁰(Div¹~, O))^{σ⊗φ} ⊂ K ⊗ H⁰(Div¹~, O)^{φ²} and the invariants are ℚ_p. For K = ℚ_p the twist is trivial and the formula reads X^{Div¹} = Div¹."

   Tested on the witness: with the twist, H⁰ = {x ∈ K ⊗ ℚ_p : σx = x} = ℚ_p, using H⁰(Div¹~, O)^{φ²=1} = (ℚ_{p²})^{Gal_{ℚ_p}} = ℚ_p; this agrees with the third Check of 11.7. For K = ℚ_p both forms give Div¹. The direction (GSpec(σ), not its inverse) comes from φ^*[a] = [a^p] on Teichmüller lifts, so that φ^* restricts to σ on W(k); the fix worker confirms it on that witness before writing it, and does not leave the direction open in the statement.

2. **F02** (P2) a Check of 5.4 follows ALRS Remark 3.1.6 sentence by sentence

   **Location.** `design/README.md` line 956 (5.4, third Check): "Vector bundles on A¹/G_m^† are vector bundles on A¹ with a T-connection, that is, after dividing by T, a connection with a logarithmic singularity at 0 …" through "… every entire series in T∂_T converges on it"; the same text in `design/plan.json`.

   **Claim.** The roadmap's prose is its own.

   **Witness.** ALRS line 2263–2271: the first four sentences of the Check follow the remark's four sentences in order, clause by clause with words exchanged; longest shared run 6 words, first sentence about 20 of 26 words in common.

   **Repair.** Replace the Check, up to "the two stacks have the same vector bundles", by:

   "A vector bundle on A¹/G_m^† is a vector bundle E on A¹ with an operator ∇ satisfying ∇(f·e) = T∂_T(f)·e + f·∇(e); T⁻¹∇ is then a connection on the punctured line with at most a simple pole at the origin (ALRS Remark 3.1.6, p. 43, ALRS line 2263). The same data, on arbitrary sheaves, describe D(A¹/Ĝ_m) for Ĝ_m the formal completion of G_m at 1, and D(A¹/G_m^†) is its full subcategory on which the polynomial action of ∇ extends to the entire functions of ∇. On a vector bundle this is automatic, ∇ being a bounded operator on a Banach module over each affinoid, so the two stacks have the same vector bundles"

   and keep the rest ("and a description that separates them by vector bundles is wrong. They differ on larger sheaves: …") as it is. Tested: the skyscraper ℚ_p[θ] of the kept part still separates the two categories (the partial sums of Σ p^{n²}θ^n applied to 1 have unbounded degree), and E = O with ∇ = T∂_T is in both.

3. **F03** (P3) "the adic filtration is constant" in the last Check of 5.1

   **Location.** `design/README.md` line 901 (5.1, fifth Check): "for the identity of X the adic filtration is constant with associated graded O_X in degree 0 and the cone is X × Â¹/G_m^alg"; the same in `design/plan.json`.

   **Claim.** The adic filtration of O_X → O_X is constant.

   **Witness.** The ideal is 0: Fil^n = O_X for n ≤ 0 and Fil^n = 0 for n ≥ 1, with graded O_X in degree 0. A constant filtration has graded 0 and Rees algebra O_X[t, t⁻¹], the cone X × G_m/G_m.

   **Repair.** Replace "the adic filtration is constant with associated graded O_X in degree 0" by "the ideal is 0, so the adic filtration is O_X in degrees ≤ 0 and 0 in degrees ≥ 1, with associated graded O_X in degree 0 and Rees algebra O_X[t]". Tested: Rees algebra O_X[t] gives X × A^{1,alg}/G_m^alg, restricting to X × Â¹/G_m^alg as the Check says, and X^{cone/X} = X^cone ×_{X^cone} (X × A¹/G_m) = X × A¹/G_m.

Three findings: one P1, one P2, one P3. All three round-13 findings are repaired. Fourteen of the fifteen sampled targets match their sources and are sound; the fifteenth (11.1) carries a sentence, taken faithfully from the source, that is false as written and is refuted by two Checks of 11.7 in this same roadmap. The design declares 21 supplier gaps, which are contracts and not findings; `gestalten-affine-proper` and `gestalten-transmutation` still have supplier `none`, settled as `not actionable in this package` in the round-4 repair report (no roadmap owns Gestalten). I checked the reason again (below); it holds, so it is not re-raised.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2034 lines, 12 layers, 88 subsections), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-13 ledger.** All three repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P2) Lazard's criterion owned twice | repaired (applied differently, soundly) | Scope, line 9: "Amice's theorem … is PadicFunctionalAnalysis §4.4, and its form in d variables for functions ℤ_p^d → K … is LocallyAnalyticDistributionsPartII §1.5; 10.4 keeps only Lazard's criterion in d variables with values in a ℚ_p-Banach space"; 10.4 *Needs:* now "NoncommutativeAndEquivariantIwasawa §0.6; … PadicFunctionalAnalysis §4.4; Mathlib `PadicInt.mahlerEquiv`"; new Check comparing M = K with §1.5. The route no longer uses the scalar form, so citing §1.5 as comparison partner only is right |
| F02 (P3) "Berkovich-étale" against the suppliers' use | repaired | Conventions, line 21: "They are not the étale and smooth morphisms of Berkovich's analytic geometry, which have no relative boundary, used in TropicalAndBerkovichArithmetic §0.30 and ClassicalAdicEtaleCohomology §3.1"; fourth Check of 4.2 extended |
| F03 (P3) `untilt_closed_divisor` | repaired | 8.1 route: "(FarguesFontaineDiamonds §F4, “The analytic untilt divisor on Y”; RelativeFarguesFontaine §3.2)"; heading found at the open head, line 858 of that README |

Citations of the repairs resolved now: PadicFunctionalAnalysis §4.4 on main (its README line 706: isometry `C₀(ℕ,E) ≃ LA_h(E)` for complete ultrametric modules with bounded ℤ_p-action; the criterion `liminf (−log_p‖a_n‖)/n > 0`); NoncommutativeAndEquivariantIwasawa §0.6 "Ordered coordinates of a uniform group" and §0.7 (open head, lines 304, 334); LocallyAnalyticDistributionsPartII §1.5 (open head, line 70: "§1.5 extends this to ℤ_p^d"); TropicalAndBerkovichArithmetic §0.30 (line 870, "not Berkovich étale"); ClassicalAdicEtaleCohomology §3.1 (line 1298). `PadicInt.mahlerEquiv` is at `Mathlib/NumberTheory/Padics/MahlerBasis.lean:353` at the pin, `C(ℤ_[p], E) ≃ₗᵢ[ℤ_[p]] C₀(ℕ, E)`, with `[NormedAddCommGroup E] [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E]` (line 243) and `[IsUltrametricDist E] [CompleteSpace E]` (line 278): the hypotheses the README states. Laz65 (1.3.9) at Laz65 line 2873 and the digit-sum bound (1.3.9.3) at Laz65 line 2878, (1.1.2.5) at Laz65 line 2570.

Repaired patterns in the rest of the design: every underscore identifier and every cross-roadmap citation was run through `roadmaps resolve` (one lead, below); a search for a second statement owned elsewhere found none beyond what Scope already defers.

**Sources, seeded sample.** The author flags no locator as unverified. A script checked all 401 locators of the form "p. N, id line M" against the page markers of the cached texts (13 sources): all agree, none out of range; all 491 line locators are in range.

| Target | Read | Result |
|---|---|---|
| 1.6 | ALRS line 589–598; ABLB line 1260–1275, 1324–1344, 1658–1663, 1712–1721 | match (conventions (1.2.3), Proposition 3.1.9, Lemma 3.1.14, Definition 3.1.15, Definition 3.2.8, Proposition 3.2.11) |
| 2.3 | ABLB line 2235–2259; ALRS line 809–875 | match (Lemma 4.2.11, Definition 4.2.12; ALRS Lemmas 2.1.8–2.1.10) |
| 3.1 | ALRS line 1017–1031; ABLB line 352–369, 2966–2969, 3155–3165, 3248–3254 | match (Definition 2.3.1, Remark 2.3.2; Propositions 4.6.5, 4.7.12, Theorem 4.7.15, K separable and qfd) |
| 3.2 | ABLB line 371–380, 2752–2762, 3384–3385, 4629–4639, 4799–4812 | match (Theorems 5.6.6, 5.6.1, 4.8.7; Proposition 4.5.7 is stated for the big de Rham stack: the qfd form follows by the same two lines with ALRS Remark 2.3.2, computed below) |
| 5.1 | ALRS line 1598–1707, 2062–2091 | match; one wrong word in a Check (R03) |
| 5.4 | ALRS line 2195–2283 | statements match (Definition 3.1.1, Proposition 3.1.3, Remark 3.1.4, Definition 3.1.5, (3.1.1)); wording of a Check: R02 |
| 6.1 | ALRS line 2295–2347 | match (§3.2, Remark 3.2.1, Lemma 3.2.2); the "−" before the radius formula at ALRS line 2317 is the extracted fraction bar |
| 6.4 | ALBM line 1580, 1654, 1753, 1930; ALRS line 8910; ABLB line 2414, 2531, 2641 | match (Theorems 4.4.4, 4.4.6, 4.5.1, Corollary 4.5.2; footnote 57) |
| 7.1 | ALRS line 2398–2444, 2666–2680 | match (Definition 3.3.1 with footnotes 20–22, Remark 3.3.2, Examples 3.3.4–3.3.5, Lemma 3.5.2) |
| 8.3 | ALRS line 3062–3130 | match (Lemma 4.2.1, Remark 4.2.2, Propositions 4.2.3–4.2.4, Lemma 4.2.5; the warning at line 3114) |
| 9.7 | ALRS line 4108–4159, 4202–4218 | match (Proposition 4.8.1(1)–(4), Example 4.8.4); the README has [p]_{q^{p^n}}, correcting the source's index |
| 9.9 | ALRS line 4348–4360, 4403–4411, 4454–4470, 4494–4507, 4599–4612, 4622–4644 | match (Lemma 4.10.2, Construction 4.10.3, Lemma 4.10.4, Construction 4.10.5, Theorem 4.10.6, Lemma 4.10.10, Theorem 4.10.13) |
| 10.7 | ALRS line 5831–5932, 4747–4754 | match (Lemma 5.4.1, Definition 5.4.2, Remarks 5.4.3–5.4.4, Lemma 5.4.5, Corollary 5.4.6, Lemma 5.4.7(1)–(6), Theorem 5.1.1(2)) |
| 10.12 | ALRS line 4738–4760 | match (Theorem 5.1.1(1)–(3)) |
| 11.1 | ALRS line 7756–7775, 7873–7874, 7881–7890 | Theorem 6.1.1 matches; Remark 6.1.5 is transcribed correctly and is false: R01 |

**Adversarial table** (repaired passages, sampled targets, headlines, findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 11.1 product formula | K = ℚ_p; K = ℚ_{p²} | Div¹ = Div¹; product: h⁰, h¹, h² = 2, 4, 0 against 1, 3, 0 from 11.7; K → H⁰ = ℚ_p impossible | false: R01 |
| 11.1 repaired form | K = ℚ_{p²}; K = ℚ_p | (K ⊗ B)^{σ⊗φ} ⊂ K ⊗ B^{φ²=1} = K ⊗ ℚ_p, invariants ℚ_p; trivial twist | holds |
| 11.1 Theorem 6.1.1 | K = ℚ_p; U = X^{Div¹} | α = h of 10.12 for ℤ_p^× on FF_{ℚ_p^cyc}; Perf(Div¹) ≃ Perf(FF_{Q_p^⋄}) | holds |
| 11.7 (headline) | K = ℚ_p; [K : ℚ_p] = n | 1, 2, 0, χ = −1; h¹ = n + 1, χ = −n | holds; refutes the product of 11.1 for n = 2 |
| 10.4 route, Legendre bounds | (p, h, n) = (2, 1, 5); (3, 0, 9); n < p^h | v = 1 ∈ [−2.08, 2.5]; v = 4 ∈ [0.40, 4.5]; v = 0, upper bound < 1, lower bound < 0 | holds |
| 10.4 route, union over h ⇔ ∃ r > 1 | r < ρ_h = p^{1/(p^h(p−1))}; ρ_h ≤ r | ‖c‖r^{\|α\|} ≤ p^{2d}(\|α\|+1)^d (r/ρ_h)^{\|α\|}·‖c‖/\|m_h(α)\| → 0; ‖c‖/\|m_h(α)\| ≤ ‖c‖ρ_h^{\|α\|} ≤ ‖c‖r^{\|α\|} | holds |
| 10.4 criterion | (1 + p)^a; p = 2, 3^a; d = 0 | c_n = p^n, (r/p)^n → 0 for r < p; c_n = 2^n, r < 2; only α = 0 | holds |
| 10.4 new Check | (1 + p)^{a+b}; Σ p^k binom(b, p^k) | (r/p)^{m+n} → 0; with α_1 in the exponent p^{−k} → 0 (wrongly accepted), with \|α\|: p^{−k}r^{p^k} → ∞ | holds |
| Convention Berkovich-étale | closed subdisc \|T\| ≤ \|p\| | Berkovich-étale (1.6 Check 2), image closed not open so not rigid étale (ALRS Definition 2.6.10), quasi-étale not étale in the suppliers | consistent |
| 1.6 | f = T, g = 1 on ℚ_p⟨T⟩; f = T, g = p; f = 1, g = p on ℚ_p | every map factors: A; ℚ_p⟨T⟩⟨U⟩_{≤1}/(pU − T) = colim_{r>1/p} ℚ_p⟨T/r⟩; empty locus, 1 = p·U with \|U\| ≤ 1 forces 0 | holds |
| 1.6 unit argument | Σ a_i f_i + b g = 1 | 1 = g(Σ a_i T_i + b) in the quotient | holds |
| 2.3 | GSpec(ℚ_p); ∅; ℚ_p⟨T⟩ | finite-dimensional complexes; 0; Banach, nuclear, connective, not dualizable (infinite dimension) | holds |
| 2.3 route | limit of symmetric monoidal categories | dualizable in lim D(A) iff dualizable in each D(A); then perfect by 1.7 | holds |
| 3.1 | A¹; GSpec(ℚ_p[ε]/ε²); ∅; idempotence | A^u-points, quotient by Nil†; Hom(ℚ_p[ε], A^u) = point (A^u reduced); empty on nonzero A; X((A^u)^u) = X(A^u) | holds |
| 3.2 qfd full faithfulness | A qfd perfectoid | (X^dR)^⋄(Marc A) = X^dR(GSpec A) = X(Marc(A^u)) = X(Marc A), A = A^u | holds |
| 3.2 | X ⊔ Y; BG | left exact and colimit-preserving: disjoint unions and quotients preserved; BG^sm | holds |
| 5.1 | Y = GSpec(ℚ_p); Y = ∅; Y = A¹; zero section; identity | A¹/G_m; Y(R/I) nonempty iff I → R is an isomorphism: G_m/G_m; special fibre A¹ × BG_a(−1) = G_a/G_a(−1) with zero map; graded ℚ_p[x̄]; I = 0, Rees O[t] | holds, wording R03 |
| 5.1 weight | t ↦ t^{−1} | T[1](−1) = T[1] ⊗ G_a(−1), the twist by the universal ideal (ALRS line 1657–1661) | holds |
| 5.4 | GSpec(ℚ_p); over G_m/G_m; over BG_m for A¹ | A¹/G_m; I = R: R/Nil†(R), X^dR; s = 0: R ⊕ (I ⊗ Nil†R)[1], A¹ × B(G_a^†(−1)) | holds |
| 5.4 Check 3 | E = O, ∇ = T∂_T; skyscraper ℚ_p[θ] | bounded operator, in both; Σ p^{n²}θ^n·1 has no limit in ℚ_p[θ] | holds, wording R02 |
| 6.1 radius | untilt C, ϖ = p♭; ϖ ↦ ϖ^m; \|p\| = 0; reciprocal convention | log p^{−1}/log p^{−1} = 1; κ multiplied by m; κ = 0; Frobenius would multiply by p^{−1} | holds |
| 6.1 localization | {\|p\|^s ≤ \|[ϖ]\|} | log\|[ϖ]\| ≥ s·log\|p\| ⇔ κ ≤ s (log\|p\| < 0) | holds |
| 6.4 | g étale; FF_{C♭}; FF_{Marc(ℚ_p)} | d = 0, ω = O; H⁰(ℚ_p(1)) one-dimensional against B^{φ=p}; 1, 2, 0 dual to 0, 2, 1 for ℚ_p(1)[2] | holds |
| 7.1 | S = Spa(C♭); two copies of the disc; S = ∅; adjunction | perfect, curve FF_{C♭}; ι^⋄ not an isomorphism; (∅, ∅); Hom((S, D^×), (S′, 𝒳′)) = Hom(S, S′) | holds |
| 8.3 | Y = GSpec(C_p); ℚ_p[ε]/ε² against ℚ_p | Y^HT = Y; same perfectoidization Marc(ℚ_p), same D^{×,dR}_{FF} | holds |
| 9.7, 9.9 | cyclotomic prism | zeros of log q/(q − 1): μ_{p^∞} minus 1 = zeros of [p]_{q^{p^n}}, n ≥ 0; φ(log q ⊗ e⟨1⟩) = p·log q ⊗ p^{−1}e⟨1⟩; φ(e) = p[p]_q^{−1}·p^{−1}e = [p]_q^{−1}e; untwisted φ(log q) = p·log q | holds |
| 10.7 | K = ℚ_p^cyc; G trivial; R = C(G, ℚ_p) | K^la = ℚ_p(μ_{p^∞}), completion K; R^la = R; C^la_G dense in R | holds |
| 10.12 (headline) | G trivial; X = D^×_{FF,ℚ_p^cyc}, G = ℤ_p^× | h the identity; X^la = (1 + D̃^{<1}) ∖ {1} (ALRS line 4210–4218) | holds |
| 11.2 (headline) | C_p(n) | n ≠ 0: K →^{n} K acyclic; n = 0: K, K, 0 | holds |

Headlines 11.4, 11.5, 11.6, 11.8–11.10 and 12.2–12.6 and the targets outside this table rest on the computed rows of rounds 12 and 13 (their texts are unchanged since: the diff of the last repair touches only Scope, Conventions, the supplier contracts, 4.2, 8.1, 10.4 and the Layer 10 dependencies, all read and computed above).

**Structure (scripted).** 88 subsections, each with at least three Checks and a *Needs:* line. All 1196 statement, API, Check and gap strings of `plan.json` occur verbatim in the README (0 missing). 21 gaps with the same slugs in plan and README; 35 supplier rows. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): nothing; "lemma" only in "Shapiro's lemma" and "Poincaré lemma". No backticked name of this roadmap's own.

**Manifest.** 24 entries, all `certified`; every source id cited in the README is recorded and every entry is cited.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2270 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` (index of 2026-11-15T21:03:43Z): no Lean name found nowhere; one cross-roadmap lead, "MotivesAndAlgebraicCyclesPartII Layer 0", which is a board package placed in the merge order before this roadmap (resolved in round 13; unchanged). Supplier rows other than those of the repairs rest on the round-13 resolution, whose citations are unchanged.

**Gaps.** Unchanged since round 13, where each cited AnalyticStacks item was opened. Checked now: AnalyticStacks still gives Gelfand rings, de Rham stacks and prismatization to this roadmap (its README line 22) and maps this roadmap's slugs to its sections (line 1305). `roadmaps grep -i gestalt` returns AnalyticStacks only, which excludes Gestalten: no owner exists, so the settled reason for the two `none` gaps holds.

**Duplication audit.** `roadmaps grep -i --readme-only` by object at the same index: Gelfand ring or stack, analytic prismatization, twistor stack, Hyodo–Kato stack, analytic de Rham stack: AnalyticStacks only, as deferrals to this roadmap. "Hodge–Tate stack": no roadmap. "decompletion": PhiGammaModulesAndIwasawaCohomology, LocalFieldsRamificationPartII, HodgeTateAndCanonicalSubgroups, CohomologyComparisons, PadicHodgeTheory and others, all classical (cyclotomic, Tate–Sen for fields and period rings); none states decompletion over Gelfand rings, and this roadmap cites PhiGammaModulesAndIwasawaCohomology §1.4 and PadicPeriodRings §§1.3–1.4 for the classical forms. Lazard's criterion: settled by the repair of F01. No folder of this name is on main: not a second copy. `scratch/overlaps.md`: no other pull request changes this roadmap, none drops an id it cites, none of its citations depends on an open revision's numbering.

Overlap check: read AnalyticStacks (scope and consumer note), PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology and CohomologyComparisons (open; searched for Gelfand, Hodge–Tate stack and this roadmap's name: no shared object), PerfectoidSpaces, EnhancedDerivedSheaves and DiamondsAndVStacks (main; suppliers only); shared: analytic stacks, six functors, nuclear modules, Fredholm criteria, Cartier duality, owner AnalyticStacks (consumed through gaps); integral prismatic objects, owner the PrismaticCohomology parts (Checks only); Amice's theorem, owner PadicFunctionalAnalysis §4.4, and its scalar d-variable form, owner LocallyAnalyticDistributionsPartII §1.5; Gelfand rings and stacks, the analytic prismatization and decompletion over Gelfand rings, owner this roadmap.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in either library); the package stage says so in the module docstring. The design has no `Suggested.lean`, so there is nothing to probe for padding.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no sorry'd data or `set_option` (no Lean file). Wording: R02.

**Copyright.** Wording: the fifteen sampled statements, seven proof routes (1.6, 2.3, 3.1, 5.4, 8.3, 9.7, 10.4) and the Checks of 5.1, 5.4, 6.4 and 9.7 were set beside ALRS, ABLB, ALBM and Laz65 at their locators. One passage follows its source (R02). Elsewhere the longest shared runs are formulas and forced statements ("is a BG_m^†-torsor", "a gerbe banded by G_m^†"). No table, figure or list of examples is taken over.

Arrangement against ALRS (contents at ALRS line 15–70), by number: Layers 1–3 ↔ ABLB §§3–5 with ALRS §§2.1–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM §4; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4 (8.7 and 9.3 split §4.7; 9.7–9.9 reorder §§4.8–4.10 after the Hodge–Tate material); Layer 10 ↔ §§5.2–5.8 then 5.1; Layers 11–12 ↔ §6. Twelve layers against six chapters and an appendix, a second source carrying Layers 1–3 and 6: not one to one. The runs that are parallel are forced: 7.2 needs 7.1, 7.3 needs 7.2, 7.4 needs 7.3; 8 needs 7, 9 needs 8, 11 needs 9 and 10, 12 needs 11 (Dependencies lines of those layers). Layer 10 needs only Layers 1–7 and its position is free; the README says so in "How to read the build".

Source independence: 26 passages compared with 4 sources, one shared (R02); largest share ALRS, 351 of 491 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` by object and by reading the roadmaps of the Overlap check; the other open roadmaps were not read one by one.
- The direction of the Frobenius on the factor GSpec(K) in the repair of R01 (σ rather than σ⁻¹) was derived from φ^*[a] = [a^p]; no source states it, so the fix worker confirms it before writing.
- The description of D(A¹/G_m^†) inside D(A¹/Ĝ_m) by entire functions of T∂_T rests on RC26a through ALRS Remark 3.1.6; read, not recomputed.

## Source issues

- **Error** in ALRS at Remark 6.1.5, printed page 145 (ALRS line 7873): the source says the twistor stack of an unramified K is the product of GSpec(K) with Div¹; it should be the Frobenius-twisted product, as in its footnote 48; affects a stated result.
- **Misprint** in ALRS at the proof of Proposition 4.8.1(3), printed page 80 (ALRS line 4147–4154): the source writes the q-analogue at q^n and an exponent p^{1/n}; they should be q^{p^n} and 1/p^n; affects nothing.
- **Misprint** in ALRS at the proof of Theorem 4.10.6, printed page 87 (ALRS line 4506): the source identifies the de Rham stack of G with ℤ_p(1)^sm times the disc; it should be times the de Rham stack of the disc, as in the theorem's square; affects nothing.
- **Misprint** in ALRS at Lemma 5.4.7(1), printed page 111 (ALRS line 5910): the source names the pieces of the cover with a prime and then without; it should use one name; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv, 2025), RCSolid, RC26a, Gest (notes); 426 of 491 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` in `design/plan.json`; no roadmap owns Gestalten (AnalyticStacks README line 22 excludes them). Who supplies them is the board's decision.
- **Source error.** R01 corrects a statement of ALRS (Remark 6.1.5) rather than a transcription slip; the corrected form is derived here and in ALRS footnote 48, not stated in a refereed source.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b7898112381418608ead14382d2fb2b44b6b0b80", "job": "REV-DESIGN-RationalAnalyticPrismatization~14", "model": "fable", "worker": "chris-x90"} -->
