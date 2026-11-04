<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/383#issuecomment-6404589482 -->
Review (claude) of 2d253d2

Verdict: needs changes

1. **F01** (P2) 3.2 states BCGP25 Lemma 5.7.7 while its only route proves one less; 4.8 needs the full bound

   **Location.** `design/README.md` line 319 ("every irreducible component of Spec R_{S_χ} has dimension at least dim Λ") and lines 321–322 ("this count proves only dim ≥ dim Λ − 1 … the printed proof supplies none … this step belongs to the target"); line 491 (4.8: "by 4.7 and 3.2 every component of Spec R^{T,ord} dominates a component of Spec Λ"); line 703 (source issue).

   **Claim.** Every irreducible component of Spec R_{S_χ} has dimension ≥ dim Λ = 1 + nd, and 4.8's density step follows.

   **Witness.** CHT08 Corollary 2.3.5 (CHT08 lines 1433–1445) bounds the Krull dimension with an explicit −dim H⁰(G_{F⁺,S}, ad r̄(1)) term; Tho17 line 614 uses h¹ = h² − h³ − 1 + |T| + |Q| − dn(n−1)/2 with h³ = 1. BCGP25's proof (lines 6049–6055) takes s ≤ n²#T + dn(n−1)/2 "exactly as in CHT08 Cor. 2.2.12", which presupposes h³ = 0. Recomputed at n = 2, d = 2, #T = 3: dim R^loc = 19, h¹ − h² = −χ − h³ = −(1 − 3 + 2) − 1 = −1, dim R^T ≥ 18, dim R_𝒮 ≥ 18 − 14 = 4 = dim Λ − 1 (the README's own Check, line 326). No cached source supplies the missing relation: Tho17 §7 (lines 1357–1443) is the erratum to Tho12 under ζ_l ∉ F; Tho12 Theorem 8.6 and Corollary 8.7 (lines 2084, 2263) assume ζ_l ∉ F; KT17's count (lines 866, 915) carries the h⁰(ad⁰ρ(1)) term too. So the target as written asserts a statement with no complete route in the design or its sources, and the headline 4.8 (line 491) consumes it in full (its Check at line 496 says so).

   **Repair.** Split 3.2.
   - 3.2(a): the obstruction-count bound dim ≥ dim Λ − 1, with the full route (presentation of R^T_{S_χ} over R^loc_{S_χ,T} with h¹_{S_χ,T} generators and at most h²_{S_χ,T} relations, CHT08 Corollary 2.2.12 pattern; h¹ − h² = −χ − h³ from Tho17 Lemma 2.15 and Corollary 2.14; the −1 from h³ = 1 explicit).
   - 3.2(b): a new target "relation saving in the scalar direction", stated as what is needed: the obstruction map J/m_P J → (H²_{S_χ,T})^∨ ≅ H¹_{S_χ^⊥,T} … lands in the annihilator of the unavoidable scalar class ψ of 1.4, i.e. ⟨o, ψ⟩ = 0 for every obstruction class o. A route to test: the trace ad r̄ → k is G_{F⁺,S}-equivariant at p = 2 and adjoint to the scalar inclusion k → ad r̄(1), so ⟨o, ψ⟩ = ⟨tr_*o, ψ′⟩ computed in the n = 1 problem of det ∘ r (𝒢_1-valued with multiplier χ^n, through det : 𝒢_n → 𝒢_1, (g, a) ↦ (det g, a^n), which commutes with j), whose T-framed ring is the completed group ring of the pro-2 part of the characters η of G_{F,S} with ηη^c fixed (ℤ₂-rank d) tensored with the framing variables; the pairing with the class ψ′ of L⁺/F⁺ is then a computation in that ring. Then 3.2 = (a) + (b) is BCGP25 Lemma 5.7.7 with the source gap recorded.
   - If (b) cannot be routed, restate 3.2 as (a), say in 4.8 that its density step has no route in the sources, and leave the decision to a human; the repair report already asked for one.

   Tested on the refuting instance: with (b), the same numbers give 5 = dim Λ; 4.2's Check (line 413) and 4.3's dimension count (line 425), which use h³ = 1 through q = h¹_{𝒮^⊥,T} − 1, are unchanged.

2. **F02** (P2) PL.2's constituent Galois representations are cited at l = 2, but the supplier states them for l odd

   **Location.** `design/README.md` line 66 ("The group and the constituent Galois representations do not depend on l; the Hecke-theoretic sections of PL.2 are stated for l odd"); line 275 (2.3 route); lines 335 and 343 (3.3 route and `*Needs:*`: "PotentialAutomorphyInfrastructurePartII PL.2 (*Galois representations attached to constituents of algebraic modular forms*)").

   **Claim.** The section *Galois representations attached to constituents of algebraic modular forms* supplies r_2(π) for constituents of S_{λ,{χ_v}}(ℚ̄₂).

   **Witness.** PotentialAutomorphyInfrastructurePartII design (board origin/main, position 86 of the board merge order), `PL.2/unitary-constituent-galois-representation`: hypothesis 1 takes "the group G and the data l, S_l, R, {χ_v}, λ as in PL.2/unitary-algebraic-modular-forms", whose hypothesis 1 is "l odd, every place above l split in L" (its README lines 932, 1076–1079). The section does not make the l = 2 statement; the contract line 66 misreports it. 3.3 (Proposition 5.7.9 at p = 2) and 2.3 rest on it.

   **Repair.** Either (a) add to Layer 2 (in 2.3 or a new 2.4) the l = 2 statement, owned here: for an irreducible constituent π of S_{λ,{χ_v}}(ℚ̄₂), a continuous semisimple r_2(π) : G_F → GL_n(ℚ̄₂) with the split-place comparison (r_2(π)|G_{F_w})^{ss} ≅ (r_2(π_v ∘ ι_w^{−1})^∨(1 − n))^{ss}, the route being PL.2 (*Base change and descent*, whose hypotheses carry no parity) followed by the RACSDC Galois representation and the away-from-2 compatibility of AutomorphicGaloisRepresentationsPartII (AG2.5 is stated for every prime ℓ); or (b) declare `gap:unitary-constituent-galois-representations-at-two` with supplier PotentialAutomorphyInfrastructurePartII, section *Galois representations attached to constituents of algebraic modular forms*, `needs` "the statement for every prime l, including l = 2, with the same split-place comparison". Correct line 66 accordingly. Tested: after (a), 3.3's `*Needs:*` points to a Layer 2 target with no parity hypothesis, and 2.3's route no longer cites a section whose hypotheses exclude l = 2.

3. **F03** (P3) 2.2(1) overclaims faithfulness over Λ

   **Location.** `design/README.md` line 255: "T^{T,ord}_{{χ_v}}(U(l^∞), O) is a finite faithful Λ-algebra".

   **Claim.** Λ → T^{T,ord} is injective.

   **Witness.** Ger19 Corollary 2.5.4 (Ger19 lines 749–752) gives finite faithful Λ_{b₀}-algebras, Λ_{b₀} = O⟦T(l^{b₀})⟧ a domain; BCGP25 line 5993 claims only finiteness over Λ. At p = 2, Λ has zero divisors: for F⁺_v = ℚ₂, T(l) = (1 + 2ℤ₂)^n ∋ −1, so (1 − [−1])(1 + [−1]) = 0 in Λ; if every ordinary form at level U(l^∞) has trivial ⟨−1⟩-eigenvalue, 1 − [−1] acts as zero, and faithfulness over the domain Λ_{b₀} does not forbid this.

   **Repair.** "a finite Λ-algebra, faithful over O⟦T(l^{b₀})⟧ (Ger19 Corollary 2.5.4)". Consumers (4.5, 4.6) use finiteness only; tested on 4.5's "finite over Λ by 2.2(1)".

4. **F04** (P3) the Hilbert–Siegel gap bundles three theorems, and the B5 description overstates the supplier

   **Location.** `design/README.md` lines 127–128; `design/plan.json` gap `hilbert-siegel-ordinary-hida-module`.

   **Claim.** AutomorphicBundles Layer B5 treats "the Hilbert–Siegel varieties of Res_{F⁺/ℚ}GSp₄", and one `needs` sentence asks for (i) the finite free Hida module M¹ with its Hecke action, (ii) the Taylor–Wiles variants free over Λ[Δ_Q] with coinvariants M¹, and (iii) classicality.

   **Witness.** AutomorphicBundles (open head 055b77e) Layer B5 header lists four settings: determinant-weight and vector-coefficient PEL models, prime-to-p ramified Hilbert coefficients, and the characteristic-zero classical Siegel comparison; no Hilbert–Siegel variety of Res_{F⁺/ℚ}GSp₄ appears in B5. (i)–(iii) are three results of BCGP21 §7.9 (freeness, Proposition 7.9.8, classicality). AutomorphicBundlesPartII (board design, position 232 of the board merge order, ahead of this roadmap) plans the integral coherent cohomology and the BP26/P20 complexes "underlying the higher Hida comparison" for Siegel modular forms (its README line 184) and states no ordinary Hida module either, so nothing already provides the gap.

   **Repair.** Split into three slugs with their own `needs` (`hilbert-siegel-hida-module-free`, `hilbert-siegel-taylor-wiles-coinvariants`, `hilbert-siegel-ordinary-classicality`), name as supplier the roadmap that owns Hilbert–Siegel coherent cohomology (AutomorphicBundlesPartII if its totally real scope is confirmed, else AutomorphicBundles B5 as now), and restate line 127 as what B5 states (Hecke action on classical sections on the PEL, Hilbert and Siegel models it names). Tested: 5.6, 6.1 and 6.2 each consume one of the three clauses and can cite the slug they use.

5. **F05** (P3) 4.2's second Check names an instance the standing hypotheses exclude

   **Location.** `design/README.md` line 412: "For Λ = O[{±1}]⟦w⟧ (n = 1, F⁺_v = ℚ₂, one place)".

   **Claim.** A weight algebra of the roadmap with these parameters.

   **Witness.** One place with F⁺_v = ℚ₂ forces F⁺ = ℚ, excluded by F/F⁺ unramified at every finite place (line 140; the README says so itself at line 205), and n = 1, d = 1 violates nd ≡ 0 mod 4 (line 222).

   **Repair.** Use n = 2 and two places with F⁺_v = ℚ₂: Λ = O[{±1}⁴]⟦w₁, …, w₄⟧, finite free of rank 16 over Λ⁰ = O⟦w₁, …, w₄⟧, not a domain (the Example of Layer 2, line 287); or state the Check as a pure ring instance without the global gloss. Tested: the ring conclusion of the Check (rank 2 over O⟦w⟧, not a domain, Layer 8 inapplicable, the reduction to Λ⁰ applicable) holds verbatim for the new instance with rank 16.

6. **F06** (P3) 4.5's route gives one closed subset of the right dimension; "every component of Spec R_X" needs two more sentences

   **Location.** `design/README.md` line 447 ("every component of Spec R_X has dimension at least dim Λ") and line 449 ("cutting by the q + (n²+1)#T − 1 generators of a_∞ leaves support of dimension at least dim Λ inside Spec R_X").

   **Claim.** The patched module gives the bound for every component without 3.2.

   **Witness.** As written the cut produces one closed subset of dimension ≥ dim Λ inside Spec R_X. The conclusion for every component holds, by: Spec R_X ⊂ Supp H_1 ⊂ Spec R_{S_1} (part (a)) gives Spec R_X = Supp H_1 ∩ (preimage of Spec R^loc_X); Supp H_1 = Supp H_{1,∞} ∩ V(a_∞) (H_1 = H_{1,∞}/a_∞); Supp H_{1,∞} is a union of components of Spec R_{1,∞}, each of dimension dim S_∞ (4.3); Krull's theorem in each. Recomputed at n = 2, d = 2, #T = 3, q = 5: 24 − 19 = 5 = dim Λ.

   **Repair.** Add these two sentences to the route. Tested: BCGP25 line 6236 uses only dominance of Spec R_X → Spec Λ/Q, which the weaker reading already gives; the strengthened route is what justifies the "every component" wording the target keeps.

Reviewed at head 2d253d2 of the board pull request (confirmed equal to the pull request's current head before reading): `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` (736 lines, 30 targets in Layers 1–6), `design/plan.json` (30 nodes, 5 gaps, `requests` empty, 19 source issues) and `sources.toml` (13 certified entries). The round-1 review (13 findings) and its repair report were read first; every repair was checked at this head before the adversarial pass. Six findings: two P2, four P3. The two blocking ones are one mathematical obligation the repair itself uncovered and left open (R01) and one supplier citation whose section carries an "l odd" hypothesis that the design says it does not (R02).

## Round-1 repairs at head 2d253d2

| Round 1 | Status | Witness at this head |
| --- | --- | --- |
| F01 GAP-1 unowned | repaired | `GAP-1` and "not read" absent (grep 0); README line 37 (Ger19 cited in preprint numbering), line 222 (Ger19 §2 fixes an arbitrary prime, Ger19 line 144), line 335 (CHT08 lemmas of §2.7 replaced by Tho17 Lemmas 2.2 and 2.4); `sources.toml` Ger19 `version_note` maps preprint to published numbers |
| F02 AbelianSurfacesPotentialModularity | repaired differently, acceptable | name absent from README and plan (grep 0); gaps at README lines 110 and 128 with `plan.json` entries; 5.6 and 6.2 own the Galois representation and patching with WHI22 §7 locators (lines 605, 645) |
| F03 three requests as prerequisites | repaired | `plan.json` `requests: []`; gaps at README lines 90, 91, 119 with supplier, section and one `needs` each; line 91 states L_v^⊥ = H¹_ur(F_v, M_v^∨(1)) (WHI22 line 936); line 119 clause (i) forgets the monodromy, clause (ii) asks for one compact open per block |
| F04 h³ = 0 | repaired | line 167: h³_{𝒮,T} = h⁰(F(S)/F⁺, ad r̄(1)) = 1; Euler Check line 176 (recomputed below); source issue line 702 |
| F05 unipotence clause | repaired | line 391: lifts of ρ̄|G_{F_u} for the original field become unipotently ramified on G_{F′_w} (BCGP25 Lemma 5.6.2, line 5794); Check line 397 (ψ ⊕ 1^{n−1}); source issue line 717 |
| F06 dropped H⁰ hypothesis | repaired | line 555 assumes (a) and (b) of 5.2; route (i) line 557 proves WHI22 Lemma 3.16 here; Check line 562; source issue line 720 |
| F07 patching over Λ at p = 2 | repaired | new 4.2 (lines 403–415) over Λ finite free over Λ⁰ = O⟦w⟧; 1.2(4) over Λ (line 169); Layer 8 used only in 6.2 where Λ_{GSp₄,F⁺} is a power series ring (line 647); contracts lines 102, 104 |
| F08 re-plan of AFRG §§7.4–7.5 | repaired | line 226 imports S(U, M_{λ,{χ_v}}) and sufficient smallness from AutomorphicFormsOnReductiveGroups §§7.4–7.5; scope line 16; 2.3 route line 275 |
| F09 Checks | repaired | line 247 (j = n), line 246 (two ℚ₂-places, 16 components, dim 5), line 205 (√2 ∉ F⁺ ⇒ m = 3), line 313 (k^× = (k^×)² in characteristic 2), line 371 (unramified case), line 193 (Lemma 8.2.2, Remark 8.2.3), line 548 (Sp₄(𝔽₃) Check), line 41 (2^{−1} ≡ 4 mod 7) |
| F10 atlas labels | repaired differently, acceptable | section numbers throughout; resolver reports no citation found nowhere; §F.2.6 at lines 19, 87, 158, 531; PotentialAutomorphyInfrastructurePartII cited by section titles (lines 62–68), status recorded in the plan |
| F11 cite the libraries | repaired | line 185 (ad⁰ and spanning forms left to ArithmeticGaloisRepresentations §7.9), line 162 (µ_v and H¹_{𝒮^⊥,T} from PL.3), lines 35 and 60 (`TauCeti.completedGroupAlgebra`), line 55 (`LieAlgebra.Symplectic.sp`), lines 49 and 60 (pins 6b7abb3c / a91d3aaf), line 12 (GSp₄-reasonable owned here) |
| F12 wrong steps | repaired | line 170–172 (strong residual oddness for the surjectivity), lines 645–652 (#Q_N = q, t cyclic factors, t ≤ 2q), line 37 (one Geraghty numbering), line 661 (iii) (seed component C_π and the special-fibre component Z select R^{△,π}_v) |
| F13 shape and process words | repaired | `# Roadmap:` form, contracts, `*Needs:*` lines, `### Examples` and `### Dependencies` in every layer; no process vocabulary (grep for packet, planet, handoff, checkpoint, "so far", pull request, round labels: 0 hits; the two hits for "lemma" are the English word); `prototypeCoverage` names the five headlines as not statable with the missing carriers; 13 manifest entries, none with a local path |

The repair report flagged one item for a human ("Consequences", BCGP25 Lemma 5.7.7). It is R01 below; it is not a re-raise of a `not actionable` item.

## Verified sound

**Head.** The fable-rev157 board checkout is at 2d253d2, the current head of pull request 383 (`gh pr view`, read-only).

**Gate output (verbatim), against the brief's merge order:**

```
candidate: OrdinaryAutomorphicFormsAndModularityLiftingPartII is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 638 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The resolver (`roadmaps resolve`) reports no cross-roadmap citation and no Lean name found nowhere. Every supplier named in the contracts is earlier: SmoothRepresentationsOfLocalGroups (21), ArithmeticGaloisRepresentations (37), DeformationAndDerivedPatchingAlgebra (55), AutomorphicFormsOnReductiveGroups (58), LocalGaloisDeformationRings (67), GlobalGaloisDeformations (68), AutomorphicGaloisRepresentationsPartII (117), AutomorphicBundles (134), PotentialAutomorphyInfrastructure (141), ModularityAndLanglandsExtensions (145) in the brief's order; PotentialAutomorphyInfrastructurePartII is absent from that order and is a board design at position 86 of the board's origin/main order (74747034), where ModularityAndLanglandsExtensions is at 257 and the consumers GSp4NonregularModularityLifting and AbelianSurfacesModularity at 262–263. The gate ignores it; its placement ahead of this roadmap is consistent with the board order.

**Principles.** No route-specific shortcut (both end theorems are stated at BCGP25's generality; Layer 2 is the general l = 2 Hida theory, not a weight-2 special case); no re-plan of the parent (OrdinaryAutomorphicFormsAndModularityLifting, open head faca0d2, is GL₂ at odd primes; scope line 3); no cyclic supply; no copied passages (spot-checked the statements of 1.2, 1.4, 4.1, 5.2, 6.3 against the source lines: restated, not transcribed); no algorithm; no Suggested.lean at the design stage, so no sorry'd data and no `set_option`.

**Seeded sample (15 targets), each read at its locator.**
1. 1.1: BCGP25 §5.4 pp. 121–122 (lines 5457–5509) and Lemma 5.1.2, Remark 5.1.3 (5180–5193); Tho17 Lemmas 2.8, 2.10, 2.11 (274–299). Relative dimension (n² + 1)#T − 1, the centralizer λ ↦ (λ·1_n, λ²) and the conjugation (1, a)·(B, b)j·(1, a)^{−1} = (a^{−1}B, b)j recomputed. Sound.
2. 1.2: BCGP25 (5.4.1)–(5.4.3) and Remark 5.4.4 (5523–5600); Tho17 Lemmas 2.12, 2.13, 2.15, 2.17 and Corollary 2.14 (353–497); Proposition 5.5.6 (5694–5704). h³ = h⁰(ad r̄(1)) at Tho17 line 433; H^i = 0 for i ≥ 4 at line 390; ℓ¹_v = n² + 1 at v ∈ Q from Tho17 line 612. Sound.
3. 1.4: Lemma 5.5.3 and proof (5640–5687): m, L⁺, the Δ_v argument, n·tr, the Hilbert-symbol case. Sound.
4. 2.1: BCGP25 pp. 130–132 (5868–6001): Hypothesis 5.7.1, Definition 5.7.2, T^j_w, U^j_{λ,ϖ} with (w₀λ)(α^j)^{−1}, ⟨u⟩, (5.7.3), e, the twist ∏τ(u_i)^{1−i}; Ger19 Lemma 2.3.3 (493), 2.4.7 (632). Sound.
5. 2.2: Ger19 Proposition 2.5.3, Corollary 2.5.4 (716–752), Lemma 2.4.4 (600), Proposition 2.6.1 with c ≥ r and the twist (w₀λ)(u) (771–780), Lemma 2.6.4 (954), Corollary 3.1.4 (1460); BCGP25 (5.7.4) and density (5997–6001). Sound except R03.
6. 3.3: BCGP25 Proposition 5.7.9 and proof (6060–6075): Ger19 Prop. 2.29 = preprint 2.7.4 (1116), Cor. 3.4 = preprint 3.1.4, Tho17 Lemma 2.4 for CHT08 Lemma 2.1.12; Ger19 lines 1003, 1113, 1146 cite CHT08 Lemma 2.1.4, Propositions 3.4.2 and 3.4.4. Sound except R02 (supplier).
7. 3.4: Lemma 5.7.12 and proof (6080–6084). Sound; the two gap clauses are what the two-line proof uses.
8. 4.1: proof of Theorem 5.7.14, first two paragraphs (6113–6156), Remark 5.7.15 (6110), Lemma 5.6.2 (5794). Sound; the unipotence clause is the design's addition, correctly flagged as a source gap.
9. 4.4: list (1)–(5) (6201–6220); BCGNT25 Lemma 3.2.4 (1636–1650) with BLGHT11 Lemma 3.3 (786). Sound.
10. 4.5: lines 6221–6249. Sound except R06 (route wording).
11. 4.7: Theorem 5.7.14 statement (6088–6109), end of proof (6280–6292), BLGGT14 Lemma 1.2.3 (676). Sound.
12. 4.8: lines 6293–6300. Sound given 3.2 (R01).
13. 5.2: WHI22 Definition 3.15 (985–994), Definition 3.19 (1064–1068: conditions 1a and 2 of 3.15 plus the conditional H¹), Lemma 3.20 (1073–1077); BCGP25 Remark 6.4.5 (6838–6855: the class lives in H¹(G, ∧²ρ)). Sound.
14. 6.3: Theorem 6.3.4 and proof (6694–6746), Remark 6.3.2 (6647–6656), Lemma 6.2.6 (6596–6605). Sound.
15. 6.4: same statement, first assertion. Sound.

Also read: WHI22 (3.1), (3.3), (3.5) (900, 916, 936), Lemma 3.14 (939–980), Lemma 3.16 (1001–1005), Proposition 3.18 and proof (1013–1061), Propositions 7.5–7.6 (3104–3113), Theorems 7.7–7.8 (3155–3200), Lemma 7.10 (3299–3312), g = t − 4[F:ℚ] + #S − 1 and 𝒯 (3315–3330), Proposition 7.11 and proof (3360–3389); BCGP25 Lemma 5.2.3 proof (5296–5300), Lemma 5.3.1, Definitions 5.3.2–5.3.3, Remark 5.3.4 (5402–5437), Lemma 5.6.3, Proposition 5.6.4, Proposition 5.6.6 (5801–5846), §6.1 (6331–6412), §6.3 setup (6620–6691), Lemma 8.2.2, Remark 8.2.3 (8391–8406); CHT08 Corollary 2.2.12, Lemma 2.3.4, Corollary 2.3.5 (1038–1062, 1308–1332, 1415–1445); Tho17 Lemmas 2.2, 2.4 (199–226), §2.3.2 and Proposition 2.21 (500–638); Ger19 line 144 and Lemma 3.2.3 (1582–1587); Tay08 Lemma 2.3 (227), Sho18 Theorem 2.5 (50, 180), BCGP21 Propositions 7.4.7–7.4.8, Lemma 7.5.9, Hypothesis 7.8.1 (8961, 8965, 9448, 9943). The design's nineteen source corrections were each checked at the printed line (listed under Source issues).

**Library declarations opened at the pins** (file and line read at the commit):

| Declaration | File, line |
| --- | --- |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` 43 (Mathlib 6b7abb3c) |
| `Module.End.IsSemisimple` | `Mathlib/LinearAlgebra/Semisimple.lean` 55: `IsSemisimpleModule R[X] (AEval' f)`, no invertibility |
| `Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean` 101: a `Submonoid`, Sp not GSp |
| `LieAlgebra.Symplectic.sp` | `Mathlib/Algebra/Lie/Classical.lean` 157 |
| `groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` 184 |
| `Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` 46 |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` 145 (Tau Ceti a91d3aaf) |

Tau Ceti code search: "deformation ring" 0, "Hida" 0; the 33 "Hecke algebra" hits are the type-A Iwahori–Hecke algebras (`TauCeti/Algebra/TypeAHeckeAlgebra/…`), not automorphic Hecke algebras. So the five headlines (4.7, 4.8, 6.3, 6.4, 1.4) are not statable at the pins, as `prototypeCoverage` says, and no stand-in is written.

**Cross-roadmap citations resolved** (every cited section opened at the named copy):
- LocalGaloisDeformationRings (open head 11b2c65): §1.3 (1331), §1.9 (1441), §1.17 (1559), §1.22 (1665), §2.17 (2037: four distinct eigenvalues only, so the gap is real), §2.22 (2131), §2.23 (2147, including p = 2), §2.24 (2173: one finite extension makes all inertia actions unipotent, BCGP25 Lemma 5.6.2), §2.29 (2319: p = 2 unipotent and Ihara-avoidance rings, Proposition 5.6.4), §6.24 (3587: trivial residual, f > d(d−1)/2 + 1, so the gap is real), §6.27 (3623), §6.29 (3684), §6.31 (3781: dimension sixteen), §6.35 (3859: Lemma 6.2.6), §F.2.6 (768: n² − 1 variables for ĜL_n framing).
- GlobalGaloisDeformations (open head b0adf32): §3.3 (408), §4.2 (728: BLGGT Lemma 1.2.3(1)), §§8.1–8.4 (1956–2080; §8.1 takes p odd, so Layer 1 owns p = 2 rightly).
- DeformationAndDerivedPatchingAlgebra (open head a3b5dea): §1.12 (277), §4.1 (888), §4.2 (904), §4.6 (980), §§5.2–5.5 (1039–1113; §5.5's balanced theorem states p ≥ 3 and its first part is the regular-local depth comparison the design uses), §6.1 (1214), §6.3 (1249), §6.5 (1274), §6.7 (1293), Layer 8 §§8.1–8.5 (1557–1648; §8.2 fixes Λ = O⟦w₁, …, w_s⟧), §9.6 (1841).
- ArithmeticGaloisRepresentations (open head bef111d): §7.4 (4219), §7.5 (4396), §7.9 (4752: `ResidualImage.AdZeroTraceCondition`, `ResidualImage.IsWeaklyAdequate`), §7.11 (4897: enormous, weakly enormous, tidy, vast with ζ_p ∉ L alternative).
- AutomorphicFormsOnReductiveGroups (open head c00e220): §7.4 (1194: S(J, M), weighted [JgJ]), §7.5 (1217: Γ_i, `IsSufficientlySmall` as torsion-free projection to one finite place, base change, automorphic realization).
- AutomorphicGaloisRepresentationsPartII (open head fb0a94c): *GSp₄ construction and normalization* (489: over ℚ, so the gap is real), Layer AG2.5 *Caraiani's full away-prime compatibility* (1798: every prime ℓ, v ∤ ℓ, N included) and *Temperedness of regular unitary-type cuspidal forms* (1946).
- PotentialAutomorphyInfrastructure (open head 5b4ff38): §3.44 (1990), §3.47 (2055).
- PotentialAutomorphyInfrastructurePartII (board design 74747034): PL.0 *Principal-series characterisation of ι-ordinarity* (183, any prime), *Soluble base change and descent of automorphy* (440), *Soluble and cyclic CM extensions with prescribed local behaviour* (508, no parity); PL.1 *Generic local representations are smooth points* (684, any l ≠ p); PL.2 *The definite unitary group* (869, no parity), *Base change and descent* (1130, no parity), *Galois representations attached to constituents* (1063, inherits l odd: R02), *The big ordinary Hecke algebra over Λ* (1228, l odd), *Ordinary forms are finite free over Λ* (1341), *Hida classicality* (1378); PL.3 *Taylor–Wiles data with a residual eigenspace* (1461), *Taylor–Wiles data when F contains ζ_p, including p = 2* (1606: defines µ_v, H¹_{𝒮^⊥,T}, uses h³ = 1, consistent with 1.2), *The ordinary R = T theorem with Taylor's Ihara avoidance* (1680, l odd); PL.4 *Strong residual oddness at a real place (p = 2)* (1793), *Adequacy relaxed to the vanishing of H¹(H, ad)* (1877: H¹(H, k) = 0, H¹(H, ad) = 0 and the trace condition, so 1.3's identification with near adequacy is exact), *Finiteness of ordinary polarized deformation rings* (1984: l odd, ζ_l ∉ F, so 4.7 is not a re-plan).
- SmoothRepresentationsOfLocalGroups (open head 1383569): §SR.3.2 (2604; its line 39 has the finitely generated projective generator; no local Langlands and no uniform level, so the gap is real).
- ModularityAndLanglandsExtensions (open head 2d70821): §3.9 (2041). AutomorphicBundles (open head 055b77e): Layer B5 (4506; R04).
- Consumers: GSp4NonregularModularityLifting (board design) requests "BCGP25 Theorems 5.7.14 and 6.3.4" by theorem (its line 1330); AbelianSurfacesModularity cites nothing of this roadmap by node id.

**Duplication audit by object** (`roadmaps grep` over main and the 367 open heads, plus the board designs): "GSp₄-reasonable", "nearly adequate", "Thorne's complex", "strongly residually odd", "Lemma 5.5.3" (as BCGP25's), "5.7.14", "6.3.4" (as BCGP25's), "Hilbert–Siegel … Hida": no other owner. "sufficiently deep" hits are unrelated uses of the phrase. Ĝ_n hits are Langlands dual groups. The GSp₄-reasonable definition, the dyadic Ĝ_n-conjugacy problems over Λ, the l = 2 Hida theory and the two end theorems are owned here only. Ownership against the open pull requests the brief names was checked through the same grep; none overlaps.

**Gaps (5).** Each has a supplier and a section that exists at the supplier's head, the same slug in `plan.json` and the README, and a `needs` with hypotheses: `dyadic-flag-ring-dimension` (lower bound only; §6.24 gives trivial residual only), `gsp4-semisimple-taylor-wiles-places` (§2.17 gives distinct eigenvalues only; L_v^⊥ correct per WHI22 (3.5)), `inertial-types-and-block-levels` (SR.3.2 lacks both clauses; (i) correctly forgets N), `gsp4-galois-representations-totally-real` (the supplier section is over ℚ), `hilbert-siegel-ordinary-hida-module` (R04: precise but threefold). None asks for what Mathlib, Tau Ceti or an earlier roadmap provides; none is unowned.

**Shape and completeness.** Every definition (1.1, 1.3, 2.1, 3.1, 3.5, 4.2 data, 5.1, 5.2, 5.4, 5.5) has an API list and at least three Checks (3 to 5 each); every theorem carries hypotheses and a locator; every layer ends with `### Examples` and `### Dependencies`; mathematics in Unicode, no LaTeX delimiters, no field lists, no target tables. Elaboration: not available (this lane does not elaborate), and there is no `Suggested.lean` at the design stage; no padding probe applies.

**Adversarial table.** One row per statement; values are what I computed.

| # | Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 1.1 problems up to Ĝ_n | n = 4, #T = 3; T = ∅; (1, a) on (B, b)j; A = k[ε], a = 1 + ε | 17·3 − 1 = 50 vs 47; R^T = R; (a^{−1}B, b)j; (x + yε)² = x² so 1 + ε is no square; (µ1_n, 1) gives (µ²B, b)j, equal iff µ² = a^{−1} | OK | — |
| 2 | 1.2(1)–(3) | p = 2 scalars; n = 2, d = 2, #T = 3, q = 5 | j·1_n = ᵗ1_n = 1_n so h³ = 1; χ = 1 − 3 − 5 + 2 = −5; h¹ = 1 − 1 + 5 = 5 = g; h³ = 0 would give 6 | OK | — |
| 3 | 1.2(4) presentation over Λ | Tho17 Prop. 2.21 at p = 2 | g = q + #T − 1 − dn(n−1)/2 uses h³ = 1 (Tho17 line 614) | OK | — |
| 4 | 1.2(5) surjectivity | r̄(c_v) = (B, 1)j, B symmetric | (1 + c_v)ad = {(Y + ᵗY)B^{−1}}, contains 1_n iff B alternating; B = 1_2 no, B = Ψ_2 yes | OK | — |
| 5 | 1.3 weak adequacy | H = {1} ⊂ GL₂; GL₂(𝔽₂) ≅ S₃; A₅ | U = ad⁰ ⊗ k̄, dim 3; semisimple elements 1, A, A² span 𝔽₂[A] of dim 2 < 4 while S₃ is absolutely irreducible; H¹(A₅, ad/k) ≅ H²(A₅, k) = k | OK | — |
| 6 | 1.4 unavoidable class | √2 ∉ F⁺; F⁺ = ℚ(√2); F⁺ = ℚ(√5); n even; n odd | m = 3, L⁺ = F⁺(√2); m = 4, L⁺ = ℚ(ζ₁₆)⁺ of degree 4; in no K⁺_m; pairing n·⟨,⟩ = 0; Hilbert symbol trivial at v ∤ 2 (unramified) and v | 2 (F/F⁺ split) | OK | — |
| 7 | 2.1 Hecke algebra | n = 1; n = 2; λ = (1, 0), j = 1 vs j = n; two ℚ₂-places | twist 1; X² − T¹X + qT²; ϖ⁰ = 1 vs ϖ^{Σλ}; T(l) ≅ ({±1} × ℤ₂)⁴, 16 components, dim 5 | OK | — |
| 8 | 2.2 Hida theory | Λ vs Λ_{b₀}; λ = 0; λ_τ = (1, 0) | Ger19 Cor. 2.5.4 is over Λ_{b₀}; (1 − [−1])(1 + [−1]) = 0 in Λ; twist 1; twist τ(u₂) | faithfulness overclaimed | R03 |
| 9 | 2.3 constituents | n = 1; λ = 0 constants; non-ordinary π | all characters ordinary; residual sum of characters, Eisenstein; contributes to A_λ, not to S^{ord} | OK; supplier at l = 2 missing | R02 |
| 10 | 3.1 problem S_χ | n = 4; n = 3; k of characteristic 2 | ε^{−3}; ε^{−2}δ with value −1 at c_v; k^× = (k^×)² | OK | — |
| 11 | 3.2 dimension bound | n = 2, d = 2, #T = 3 | dim R^loc = 19; h¹ − h² = −χ − h³ = −1; dim R_𝒮 ≥ 4 = dim Λ − 1; printed [F:ℚ] gives 9 | route one short | R01 |
| 12 | 3.3 Hecke Galois representation | n = 2; twisted vs untwisted Λ | X² − T¹X + qT²; twist u ↦ ∏τ(u₂)^{−1} nontrivial | OK; supplier at l = 2 | R02 |
| 13 | 3.4 uniform fixed vectors | n = 1, q_w ≡ 1 mod 4; trivial vs Steinberg of GL₂ | order-4 tame characters ≡ 1 mod ϖ of conductor 1; same block [T, 1], N = 0 vs N ≠ 0 | OK | — |
| 14 | 3.5 sufficiently deep | U′ ⊂ U; all lifts unramified; n = 1 | π^U ⊂ π^{U′}; GL_n(O) deep; O^× not deep, 1 + ϖO deep | OK | — |
| 15 | 4.1 preparation | ψ ⊕ 1^{n−1} over F′; √−1 | (X − ψ(σ))(X − 1)^{n−1} ≠ (X − 1)^n, not a restriction from F; H¹(H, k) = 0 forbids index 2 | OK | — |
| 16 | 4.2 patching over Λ | q = j = 0; Λ = O[{±1}]⟦w⟧; dim R_∞ = dim S_∞ + 1 | H free over Λ; rank 2 over O⟦w⟧, not a domain; depth ≤ dim S_∞ < dim R_∞ | OK; instance gloss wrong | R05 |
| 17 | 4.3 two-type data | n = 2, d = 2, #T = 3, q = 5; q = 0 | g = 5; 1 + 12 + 6 + 5 = 24 = 5 + 5 + 15 − 1; S_∞ = Λ⟦14 variables⟧ | OK | — |
| 18 | 4.4 components | #R = 0; n = 2, v ∈ R | components of R^□_{v₁}; R^{χ_v} irreducible vs R^1_v with two components | OK | — |
| 19 | 4.5 Ihara support | same numbers | Supp H_1 = Supp H_{1,∞} ∩ V(a_∞); 24 − 19 = 5 | OK, route to complete | R06 |
| 20 | 4.6 removal of v₁ | T′ without S_2(L⁺); #R = 0 | ordinary condition lost; one C′_Y per choice above 2 | OK | — |
| 21 | 4.7 finiteness | tame non-unipotent lift over F′ | lands in R′_{L/F,T′} only as a restriction from F | OK | — |
| 22 | 4.8 reduced R = T | component of dimension dim Λ − 1 | could lie over a divisor missing every ℘_λ | needs 3.2 in full | R01 |
| 23 | 5.1 GSp₄ problems | #T = 1, 3; GL₄ framing | 10; 32 vs 47; dim ad = 11, ad⁰ = 10 | OK | — |
| 24 | 5.2 GSp₄-reasonable | torus image; Sp₄(𝔽₃); h regular in 𝔱; p = 2 | (a) fails, yet (b) holds for W = k·w; enormous and perfect; trace form 2(xx′ + yy′); vanishes at p = 2 | OK (Def. 3.19 = 1a + 2 + conditional H¹) | — |
| 25 | 5.3 Taylor–Wiles places | ρ̄(Frob_v) = 1; reasonable, ζ_p ∈ L, not enormous; torus image | N_v = 0; Lemma 3.16(2) applies; H⁰ ≠ 0 breaks Lemma 3.16 | OK | — |
| 26 | 5.4 seed datum | p = 3: 19, 7; q_{w₀} ≡ 1 | 19 ≡ 1 mod 9, 7 ≢ 1 mod 9; ratio 1 = q so (ad⁰ρ̄(1))^{Frob} ⊇ 𝔱 | OK | — |
| 27 | 5.5 selected problem | p-distinguished | Spec R^△_v[1/p] irreducible, R^{△,π}_v its flat reduced quotient | OK | — |
| 28 | 5.6 Hida–Hecke Galois representation | tuples (a, (a_π)) | k-coordinate determined by the others; factoring tested on O_{E′}-points | OK; carriers are gaps | R04 |
| 29 | 6.1 dominance | p > 2 split; p = 2 | Λ_{GSp₄,v} = O⟦x, y⟧ a domain, lying over; torsion at p = 2 | OK | — |
| 30 | 6.2 patched Hida modules | F⁺ = ℚ, #S = 3, t = 7 | g = 5; 5 + 30 + 4 = 39 = 7 + 33 − 1; t ≤ 2q, #Q_N = q | OK | — |
| 31 | 6.3 symplectic R = T | support only nonzero | another component above p possible; seed + Z select R^{△,π}_v | OK | — |
| 32 | 6.4 finiteness | nilpotent kernel onto a finite algebra | R/m_Λ of finite length, complete local, §4.1 | OK | — |
| 33 | Conventions | p = 7, q_v = 2; n = 4; n = 2, d = 2 | 2^{−1} ≡ 4 ≠ 2 mod 7; ε^{−3}; dim Λ = 5 | OK | — |

**Conventions recomputed in suppliers.** Geometric Artin: ν(ρ̄(Frob_{w₀})) = q^{−1} (5.4) matches WHI22's similitude convention (line 3319: inverse cyclotomic) and LocalGaloisDeformationRings §1.3's Λ_v. The twist (w₀ν)^{−1} of 2.1 matches BCGP25 line 5985 and Ger19 Proposition 2.6.1. dim Λ = 1 + nd matches (5.7.17).

## Not verifiable

- **Geraghty, published version** (Math. Ann. 373): paywalled; numbering matched by content to the author preprint through the manifest's `version_note`. The design cites the preprint consistently.
- **BCGP25 Table 6.4.4 columns**: not cited by this design any more; not read.
- **PL.2 at l = 2** (R02): whether PotentialAutomorphyInfrastructurePartII will state its constituent Galois representations for l = 2 is a question for that roadmap; the design must not assume it.
- **Elaboration**: not available (this lane does not elaborate); there is no `Suggested.lean` at the design stage.

## Source issues

- **Error** in BCGP25 at §5.4, p. 123: the source says that for T nonempty the cohomology of Thorne's complex vanishes outside degrees 1 and 2; it should give h³ = h⁰(F(S)/F⁺, ad r̄(1)) = 1 at p = 2 (Tho17 Lemma 2.15); affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, pp. 133–134: the source bounds the relations by n²#T + [F⁺:ℚ]n(n−1)/2 as in CHT08 Cor. 2.2.12; it should carry the −h⁰(ad r̄(1)) term of CHT08 Cor. 2.3.5, so the count gives dim Λ − 1 at p = 2; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, statement, p. 133: the source prints dim Λ = 1 + [F:ℚ]n; it should be 1 + [F⁺:ℚ]n, the ℤ₂-rank of T(l) plus one; affects nothing.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, p. 133: the source takes equidimensionality of the local ring from Proposition 5.6.6, stated for trivial residual representation and large local degree; it should cover the unprepared field where the lemma is applied on p. 139; affects the proof.
- **Misprint** in BCGP25 at Remark 5.4.4, display (5.4.5), p. 124: the source ends the inflation–restriction sequence in H² with trivial coefficients; it should be H²(F(S)/F⁺, ad r̄); affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, p. 124: the source deduces surjectivity of restriction from injectivity into H² with trivial coefficients at a real place; it should use adjoint coefficients, which needs r̄(c_v) with non-alternating B, i.e. strong residual oddness for n even; affects nothing.
- **Gap** in BCGP25 at proof of Lemma 5.5.3, p. 125: the source assumes without loss of generality K⁺_{m−1} ⊆ F⁺ ⊊ K⁺_m; it should choose the least m with K⁺_m ⊄ F⁺, since fields such as ℚ(√5) lie in no K⁺_m; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, p. 126: the source attributes the class of ψ to L/L⁺ and calls L⁺/L unramified outside 2; it should be L⁺/F⁺ in both places; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6 (i), p. 126: the source writes the sign condition on the residual multiplier µ, vacuous at p = 2 where −1 = 1 in k; it should be on the lift χ; affects nothing.
- **Misprint** in BCGP25 at (5.7.3), p. 131: the source ends the sequence defining T(l) in the product of the k(v)^×; it should be the product of the tori T(k(v)) = (k(v)^×)^n; affects nothing.
- **Misprint** in BCGP25 at §5.7, definition of M_λ, p. 130: the source takes the tensor product over the places S̃_2; it should be over the embeddings Ĩ_2 inducing them; affects nothing.
- **Misprint** in BCGP25 at §5.4, pp. 121–122, and §6.1, p. 141: the source writes the global representations with domain G_F; it should be G_{F⁺,S} in §5.4 and G_{F⁺,S} for the totally real field in §6.1; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, p. 137, last lines: the source says Spec R_X lies in the support of H′_{1,∞}, a module introduced only after the second base change; it should be the support of H_1; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, p. 138: the source replaces T by T′ = R′ ∪ {v′₁} over L; it should include the places of L⁺ above 2, keeping the ordinary condition; affects nothing.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, preparation list p. 135 and final step p. 139: the source does not ask the preparation to make lifts at T ∖ S_2 unipotently ramified, yet maps R′_{L/F,T′} → R^{T,ord} "by the choice of L"; it should add that every lift of the original local representation becomes unipotently ramified over the prepared field (Lemma 5.6.2); affects the proof.
- **Misprint** in BCGP25 at §6.3, paragraph before S_1, p. 147: the source specifies the unramified characters by α_p and β_p; it should be α_v and β_v, the stabilization at v; affects nothing.
- **Gap** in BCGP25 at Hypothesis 6.3.1 and the paragraph before it, p. 146: the source allows π of regular weight but takes ρ_{π,p} from Theorem 1.8.17, stated for ordinary weight 2; it should cite a regular-weight construction over F⁺; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, p. 22 (arXiv v3): the source assumes condition 2 of Definition 3.15 and the conditional H¹ vanishing; it should also assume condition 1a, H⁰(ρ̄(G_{F(ζ_{p^n})}), ĝ^{0,∨}) = 0, which its proof uses through Lemma 3.16; affects a stated result (Definition 3.19 already includes 1a, so the theorems that use it are unaffected).
- **Misprint** in Tho17 at §2.2, definition of C^i_{𝒮,T} for i ≥ 3, p. 8: the source sums the local terms over C^{i−1}(F(S)/F⁺, ad r̄); it should be C^{i−1}(F⁺_v, ad r̄), as BCGP25 p. 122 notes; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2d253d2", "job": "REV-DESIGN-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2", "model": "fable", "worker": "fable-rev157"} -->
