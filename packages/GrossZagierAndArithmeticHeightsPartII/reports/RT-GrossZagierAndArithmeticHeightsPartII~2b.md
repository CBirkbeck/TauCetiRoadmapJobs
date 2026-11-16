<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6913224748 -->
Red team round 2 pass b (claude) of 4b9f20f

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.6 in rank n ≥ 4 is a "prove" target with no route, and §8.7, §13.10 and the headline are worded as proved

   **Location.** `README.md:1160`: "State and prove the identity for the lattices that the reduction of §8.7 cannot reach." `README.md:1162`: "In rank n ≥ 4 no published argument proves the statement". `README.md:1175`: "Prove that for every full-rank lattice L …". `README.md:3`, `:154`, `:1901`, `:2026`; `Suggested.lean:17–24`.

   **Claim.** §8.6 is a target the roadmap proves, and §8.7 (every rank) and §13.10 (ramified places, n ≥ 4) are proved "through" it.

   **Witness.** §8.6 gives, for n ≥ 4, no route, no source and no supplier, and says so itself; its last sentence explains why the one parallel route (§§6.7–6.8) is unavailable. L = H₁ ⊥ H₁ (n = 4): every rank-three nondegenerate sublattice has val ≥ 4 = val(L) − 1 + 1, so no step reaches it.

   **Repair.** State the open step as a named hypothesis and the theorems that use it as conditional; keep rank three as a target.

   - `README.md:1160`, first sentence: "State the identity for the lattices that the reduction of §8.7 cannot reach, and prove it in rank three."
   - `README.md:1162`, first sentence: "Statement (H_n), for n ≥ 3: for every integral lattice L of rank n in the Krämer special Hom space, of either sign, whose fundamental invariants are all positive and whose largest invariant a_n(L) is odd, Int(L) = ∂Den(L). Prove (H₃). For n ≥ 4, (H_n) is not a target of this roadmap: it is the hypothesis under which §8.7 and §13.10 are stated."
   - `README.md:1175`, first sentence: "Prove that Int(L) = ∂Den(L) for every full-rank lattice L of rank n ≤ 3 in the Krämer special Hom space, of either sign, and, for n ≥ 4, for every such L of rank n under the hypothesis that (H_m) of §8.6 holds for 4 ≤ m ≤ n". Last sentence: "In rank three (H₃) is HSY23a Theorem 1.2; in rank n ≥ 4 the theorem is conditional on (H_m), 4 ≤ m ≤ n, for which no published proof exists."
   - `README.md:1901`: replace "so the coefficient identity there holds through §8.6" by "so the coefficient identity there is proved under (H_m), 4 ≤ m ≤ n, of §8.6".
   - `README.md:3`, `:154`, `:2026` and `Suggested.lean:19–21`, `:23–24`: replace "is proved through the step §8.6 …" by "is proved for n ≤ 3 and, for n ≥ 4, under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6, a statement on lattices of odd largest fundamental invariant for which no published proof exists".

   Tested on the instances: H₁ ⊥ H₁ lies in (H₄), a hypothesis, and is no longer said to be proved; ⟨π₀⟩ ⊥ H₃ lies in (H₃), proved by HSY23a Theorem 1.2; H₁ is rank two, §7.5a.

2. **F02** (P3) the rank-three case of §8.6 uses an object the roadmap never defines

   **Location.** `README.md:1162`: "decomposes the special difference cycle of L♭ in rank three into the type-two lines and hyperplane classes of exceptional divisors (HSY23a Theorem 1.4, p. 5) and compares the result with the primitive densities (HSY23a Theorem 1.3, p. 5)".

   **Claim.** The rank-three identity has a route inside the roadmap.

   **Witness.** "special difference cycle" occurs once in the README and is defined nowhere (HSY23a (1.11), line 165). The route's inputs, HSY23a Theorem 5.6(1) (line 1088), Theorem 1.4 (line 217) and Propositions 11.1–11.3 (lines 2201, 2285, 2346), are neither targets nor API bullets.

   **Repair.** Insert in §8.6, after the sentence that cites HSY23a Theorem 1.2, and add an API list with the three facts:

   > For an O_F-lattice L₁ ⊂ V of rank n₁ the special difference cycle is D(L₁) = ᴸZ(L₁) + Σ_(i=1)^(n₁) (−1)^i·q^(i(i−1)/2)·Σ_(L′) ᴸZ(L′) in K₀ of the Krämer space, the inner sum over the lattices L₁ ⊂ L′ ⊂ π⁻¹L₁ with dim_(𝔽_q) L′/L₁ = i; then ᴸZ(L₁) = Σ D(L′) over the integral L′ ⊃ L₁ in L₁ ⊗ F, a finite sum (HSY23a (1.11)–(1.12), p. 4; Lemma 2.16, p. 13). For L = L₁ ⊕ L₂ put Int(L)^(n₁) = χ(D(L₁)·ᴸZ(L₂)) and ∂Den(L)^(n₁) = ∂Den(L) − Σ_(i=1)^(n₁) (−1)^(i−1)·q^(i(i−1)/2)·Σ_(L₁′) ∂Den(L₁′ ⊕ L₂), over the same lattices L₁′ ⊃ L₁ (HSY23a (1.13)–(1.14), pp. 4–5). (i) If Int(L₁′ ⊕ L₂)^(n₁) = ∂Den(L₁′ ⊕ L₂)^(n₁) for every L₁ ⊂ L₁′ ⊂ L₁ ⊗ F, then Int(L) = ∂Den(L) (HSY23a Theorem 5.6(1), p. 23). (ii) For n = 3 and L♭ of rank two with h(L♭, L♭) ⊂ πO_F, D(L♭) = Σ_Λ (2·[O_(N_Λ)] + Σ_(Λ₀) H_(Λ₀)) in Gr²K₀, over the type-two vertex lattices Λ of §7.4 with L♭ ⊂ Λ and the type-zero vertex lattices Λ₀ ⊂ Λ^♯, H_(Λ₀) the hyperplane class of Exc_(Λ₀) ≅ ℙ² (HSY23a Theorem 1.4, p. 5, whose vertex lattices are the sharp duals of those of §7.4). (iii) Int(L)^(2) = ∂Den(L)^(2) for L = L♭ ⊥ ⟨x⟩ of rank three with Gram matrix diag(u₁, u₂(−π₀)^b, u₃(−π₀)^c), H_a ⊥ ⟨u₃(−π₀)^c⟩ or diag(u₁(−π₀)^a, u₂(−π₀)^b, u₃(−π₀)^c), a > 0 (HSY23a Propositions 11.1–11.3, pp. 45–48); with (i) these give (H₃).

   Add "gap:ramified-hermitian-densities" to the *Needs* of §8.6 (the primitive densities of (iii)). Tested on the instance ⟨π₀⟩ ⊥ H₃: it is H₃ ⊥ ⟨u₃(−π₀)⟩, the second Gram form of (iii).

Round 2. Two new findings (S01 P2, S02 P3). Both sit in §8.6, the section the round-1 repair rewrote. `packages/GrossZagierAndArithmeticHeightsPartII/README.md` was read in full (2074 lines) and `Suggested.lean` in full (67 lines, no declaration). No finding re-raises one that the repair report marked `not actionable in this package` (it marks none).

## Round-1 findings at this head

| Round-1 finding | Status | Witness at 4b9f20f |
|---|---|---|
| 1a/F01, 1b/F02 (§8.6 has no route; §8.7 and §13.10 rest on it) | partly repaired | `README.md:1162`: "In rank three the statement holds: HSY23a Theorem 1.2 (p. 4) proves Int(L) = ∂Den(L) for every lattice of rank three"; the dependence is now said in the Summary, §8.7, §13.10, "Acceptance file" and `Suggested.lean:17–21`. Residue: in rank n ≥ 4 §8.6 is still an imperative target with no route (S01). |
| 1a/F02, 1b/F03 (group AFL at p = n ≥ 5) | repaired | `README.md:1987`: "Conjecture 3.8(a) holds … when p ≥ n + 1, and for every odd p when n ≤ 3"; `README.md:1284`: "At q = n the converse is asserted only for n ≤ 3". Induction recomputed below; it closes. |
| 1a/F03, 1b/F01 (Krämer rank-two base unowned) | repaired | `README.md:1005–1027`, new §7.5a; formulas compared with HSY23b lines 146–166 and 188–199 and Shi22 lines 132–143 and 154–162: equal. §7.7 now has "r ≥ 2" and "with Int(I₂) = 0 of §7.5a". |
| 1a/F04, 1b/F04 (compound gap) | repaired | `README.md:142–146`: three one-sentence contracts; `design/plan.json` `gaps` has the same eight slugs as the README, each `needs` verbatim in the README; *Needs* of §§9.3, 9.5, 9.7, 9.8, 14.1, 14.4 match `neededBy`. |
| 1a/F05 (Hirzebruch–Riemann–Roch unowned) | repaired | `README.md:82`: "§§5.1, 5.3–5.4, 5.7 and 5.8"; `README.md:486`: "SchemeAndStackFoundations §5.8". Main has "### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch" (its README line 8498). |
| 1a/F06 (title) | repaired | `README.md:1`: "# Roadmap: Gross–Zagier formulas and arithmetic heights, part II — …". |
| 1b/F05 (exotic trace dual cited to §2.7) | repaired | `README.md:683`: "Define the trace dual … Λ^∨ = {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F}"; agrees with LL2 lines 518–531; `Module.equiv_directSum_of_isTorsion` is at Mathlib/Algebra/Module/PID.lean:230 at the pin. |
| 1b/F06 (Howard19 locators) | repaired | `README.md:724`: "Howard19 Theorem B, p. 2, which is his Theorem 5.1, with its K-theoretic form Corollary C, p. 2; Corollary D, p. 3". Howard19 lines 58, 78, 107. |
| 1b/F07 (missing headline) | repaired | `Suggested.lean:25–27` and `README.md:2026` name the Chow-valued modularity and why it is not statable. |

New errors introduced by the repair: none in the mathematics; S02 is an undefined term the repair brought in.

## The adversarial pass (values computed this round)

Declarations of `Suggested.lean`: none (table empty; one `import Mathlib`, namespace `TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII`, no `set_option`, no `lemma`). There is nothing to `#check`, and no Lean was run.

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §7.5a, diagonal, χ = 1 | (α, β) = (0, 1), (0, 2) | Int = 1, 2; ∂Den from §8.2: chain of overlattices, 1 + 0 and 1 + 1 + 0 | equal |
| §7.5a, H_b at b = 3 | H₃ = πH₁, q = 3 | Int = 4 − (q+1)² = 3 − 2q − q² = −12; ∂Den: full-type-two overlattices (q+2) + 1 + (q+1) at 1 − q each, type one (q+1)(q−1) at 1: 10·(−2) + 8 = −12 | equal |
| §7.5a, unit x, χ = 1 | I₂ = ⟨x⟩ ⊥ ⟨y⟩ | (Z^h(x) + Exc)·(Z^h(y) + Exc) = 0 + 1 + 1 − 2 = 0 | Int(I₂) = 0 |
| §7.5a, χ = −1 | x of valuation a | m_Λ(x) = a for the one maximal lattice; Shi22 line 140 has (a + 1)·Exc | equal |
| §7.5a, type-two multiplicity | unit x | π⁻¹x ∈ π⁻¹M would need x ∈ M, norms of M in π₀O_F₀: m = 0 | line absent, as K line 622 |
| §7.7 | L = I₁ ⊥ H₁, n = 3 | Int₃ = (1 − q) + (q + 1)·1 = 2; ∂Den = (1 − q) + (q + 1)·δ_odd(3) = 2 | equal |
| §8.2 ⇒ K Lemma 9.1 | L = I_ℓ ⊥ L₂ | overlattices are I_ℓ ⊥ L₂′; ∂Pden differs only at unimodular L₂′: n(I_r, L₂)(δ_odd(n) − δ_odd(r)) | cancellation follows from §8.2 |
| §8.6, parity | L₀ ⊥ H₃ | norm of l₁ + πl₂ = −π·π³ + π·(−π)³ = −2π⁴; coefficient (−π)³/(−2π⁴) = 1/(2π) | as stated |
| §8.6, rank three is not reached by the induction | L♭ = H_b, L′ = ⟨y′⟩ ⊥ H_(b′) with val(y′) + b′ + 1 = 2b | b′ = 2b − 1 − val(y′) ≥ val(y′) forces val(y′) ≤ b − 1, so b′ ≥ b | no decrease in val(L♭): HSY23a is needed |
| §8.6, rank four | H₁ ⊥ H₁ | rank-three sublattices: invariants ≥ (1, 1, 2), val ≥ 4 = 4 − 1 + 1 | unreachable (S01) |
| §8.7, rank-two Check | diag(u₁(−π₀), u₂(−π₀)), χ = ±1 | 3(1 − q) + (q − 1) = 2 − 2q; (1 + q) + (q + 1) = 2 + 2q | = §7.5a at (1, 1) |
| §8.1 against HSY23a (1.10) | n even, i = n/2 | H^(n/2) has χ = 1, so the top type n occurs only for χ(V) = 1 | t_max as stated |
| §9.5(b), n ≤ 3 | V₁, V₂ | determinant of odd valuation, −det not a norm: anisotropic, U compact | det(1 − g) integral |
| §9.5(b), n ≥ 4 | conjugate eigenspace of Lie(X × Ē) | rank n − 1 ≥ 2 when n ≥ 3: an invertible block matrix with nonunit corner is not excluded; n = 2: rank one, corner must be a unit | Z line 1313 not justified for isotropic V_(n−1) |
| §9.5(a) | q ≥ n + 1 | n eigenvalue residues and d̄⁻¹: n + 1 < q + 1 | ξ exists without integrality of det(1 − g) |
| §14.5 induction | n = 4, …, 8 | step n needs (a) for S_(n−1) at p′ ≥ n; (a) for S_(n−1) is stated for p′ ≥ n | closes; (b) at p = n uses (a) for S_(n−1) at p = n = (n−1)+1 |
| §14.3 at p = m + 1 | B ∋ p | coefficients with (ξ, B) = 1 use §9.5(c) and the group AFL for S_m at p ≥ m + 1 | available from the induction |
| §5.1 | plane h(e, f) = u⁻¹; line h(e, e) = 1 | Λ^∨ = Λ; Λ^∨ = u⁻¹Λ, invariant 1 | as stated, LL2 line 520 |
| §5.1, hyperbolic blocks | h(e, f) = u^c | c even: e + f has norm 2u^c and splits off; c odd: invariants (c+1, c+1) | even invariants in pairs, LL2 line 558 |
| §6.7 Check | (1, 1, 3) with x₀ | norm of u⁻¹e ± x₀ = −β + β = 0; block Gram/u has determinant β², invariants (2, 2) | as stated |
| §6.5 | Λ of type four | −q(1+q)q⁻² + (q²+1)q⁻¹ = q − 1 | eigenvalue −1 |
| §1.3 Check | val 2 | D(X) = (1 − X) + X², D(−q) = 1 + q + q² | as stated |
| §3.1 | k ↦ s | X = q^(−2s), d/ds = −log(q²)·D′(1) | factor log(q²) |
| §3.5 Check | L♭ = ⟨ϖ⟩, n = 2 | val(u) = 2, u^∨ of valuation −2 | as stated |
| §10.3 Check | split p, F₀ = ℚ | dimensions (n, 0) against (n − 1, 1) | empty fibre |
| gap list | 8 slugs | plan.json slugs = README slugs; each `needs` verbatim in the README | consistent |

## Dependency check

`depcheck: 258 roadmaps, 2468 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. This roadmap is line 350 of `merge-order/ORDER.txt`; EndoscopicTransferAndUnitaryTraceComparison 149, PELModuliPartII 188, GanGrossPrasadUnitaryGroups 239 (named only as the maker of two requests), QSeriesPartitionsAndMockModularForms 248, GrossZagierAndArithmeticHeights 340, LubinTateFormalModulesAndQuasiCanonicalLifts 344.

## Verified sound

- **Declarations read:** 0 (the file has none). No headline is statable at the pins: `TauCeti.FormalScheme.Spf` is the only formal-scheme carrier, and neither pin has hermitian densities, Shimura varieties or orbital integrals; the docstring names each missing carrier. No padding.
- **Targets read:** all 108 numbered targets (§§0.1–14.6 with 7.5a, 12.6a, 12.6b), with API lists, Checks and *Needs*.
- **Locators verified this round:** 48. HSY23b Theorems 1.1–1.2 (p. 4), 1.3 (p. 5), footnote 1 and the Jacobowitz remark (p. 3); Shi22 Theorem 1.1 (p. 3), Theorems 1.2–1.3 (p. 4); HSY23a (1.10), Conjecture 1.1, Theorem 1.2 (p. 4), Theorems 1.3–1.4 (p. 5), Proposition 2.6 and Corollary 2.7 (p. 10), Proposition 3.2 (p. 14), Corollary 3.6 (p. 16), Theorem 6.1 (p. 26); K Proposition 2.12 (p. 15), footnote 2 (p. 12), Lemmas 9.1 and 9.3 (p. 73), Lemma 9.6 (pp. 74–75), Theorem 9.7 and Corollary 9.8 (pp. 75–76); Z Lemma 4.4, Proposition 4.6, Lemma 4.11, Proposition 4.12 (p. 23); LL2 Definition 2.10 (p. 12), footnote 9 (p. 11), Definition 2.11 and Lemma 2.12, Proposition 2.33 and its proof (p. 26); Howard19 Theorem B, Corollary C (p. 2), Corollary D (p. 3); LL1 Definition 5.3 and Lemma 5.4 (p. 26), Definition 6.5 (p. 30), Notation 2.1 (p. 10); LZ Definition 9.1.4 and (9.1.4.2) (p. 63), Theorem 10.3.1 (p. 66), Conjecture 10.4.1 (p. 67), Theorem 10.5.1 (p. 70), Remark 10.5.4 (p. 72). The three unverified page locators of round 1 (LL1 Definitions 5.3 and 6.5, LZ Definition 9.1.4) are correct.
- **K version.** arXiv lists v1 and v2 only for 2208.07988; v2 is marked as the final version to appear, so the cached text is the latest, and its Lemma 9.6 is as the README describes.
- **Checks tested:** 26 recomputed (table above); none false. Every definition has at least three Checks.
- **Sibling citations checked this round:** SchemeAndStackFoundations §5.8 (main); GeometryOfNumbersAndQuadraticArithmetic §2.7.1–2.7.3 at its open head (a field with involution and a stable integral subring, a discrete valuation ring in 2.7.3: usable for the ramified Krämer setting; H(L, L) ⊆ R, so not for the exotic trace dual, as the README now says); GanGrossPrasadUnitaryGroups `gap:relative-fundamental-lemma` and `gap:relative-finite-transfer` (board package lines 153 and 157). `roadmaps resolve` lists four names found nowhere; all four are supplier target names, present in the suppliers.
- **Declared gaps:** eight, each with a named supplier and section, one sentence, in both `design/plan.json` and the README. `gap:relative-fundamental-lemma` and `gap:relative-finite-transfer` restate requests GanGrossPrasadUnitaryGroups makes of the same supplier; they are declared, so not raised.
- **Ownership.** `roadmaps grep` for Kudla–Rapoport, arithmetic fundamental lemma, Krämer model, Borcherds product, arithmetic Siegel–Weil and special difference cycles over main and the open heads: no earlier owner. FunctionFieldArithmetic (line 355, later) cites Li–Zhang for a function-field analogue; SiegelModularForms mentions Borcherds products in a list of neighbouring topics and in a reference, and states no target on them. No fully qualified name can clash: the Lean file declares none.
- **Policy.** `git diff --stat origin/main...HEAD`: 14 files, all in `packages/GrossZagierAndArithmeticHeightsPartII/`. No pull-request number, process word, `lemma` or `set_option` in the README or the Lean file; no machine path in the README, the Lean file or `sources.toml`; the 27 manifest entries have one key each (25 certified, Lusztig76 and McGraw03 uncertified).
- **Wording.** Ten passages set beside their sources: §7.5a against HSY23b lines 146–166 and 188–199 and Shi22 lines 132–143 and 154–162; §7.7 against K lines 606–641; §8.5 against K lines 3885–3897; §8.6 against K lines 3934–3975 and HSY23a lines 136–231; §9.5 against Z lines 1301–1329; §5.1 against LL2 lines 512–531; §5.3 against Howard19 lines 58–107. Longest shared run: six words in the definition of a multiplicity ("the largest … with π^(−m)x ∈ Λ"), and formulas. §5.1 lists integral, vertex, self-dual, invariants, type and valuation as LL2 Definition 2.10 does; it is a definition that can be written in one way.
- **Arrangement.** LZ has the largest share. Its contents are §§2–8 (cycles, densities, horizontal, vertical, geometric and analytic Fourier transform, proof), §§9–10 (almost self-dual), §§11–15 (global). Layer 0 joins LZ §2 with the strata of §5.3 and the rank-one case of §3; Layer 3 joins §§3, 7 and 8; Layers 10 and 13 split §§11–15 and mix them with LL1 and K. The order Layer 0 → 1 → 2 → 3 is forced by the *Needs* of §§1.1, 2.3 and 3.5.
- **Reuse.** No table, figure or list is taken over; the rank-two formulas of §7.5a are stated results with locators.

Source independence: 10 passages compared with 7 sources (HSY23b, Shi22, K, HSY23a, Z, LL2, Howard19), none shared; largest share LZ, 62 of 292 locators; contents compared with LZ: independent.

## Not verifiable

- Whether (H_n) of §8.6 holds for n ≥ 4, and whether Z's "otherwise both sides vanish" (Z line 1308) can be proved for n ≥ 4: no proof and no counterexample found; only the published arguments fail.
- The count behind the H₃ row of the table assumes that no type-one lattice outside the q + 1 unimodular lattices containing H₁ contains πH₁; the two sides agree under that count, and it was not proved exhaustively.
- K Theorem 8.2 (the negative-cone example of §8.4) and the round-1 tables for Layers 10–13 were not recomputed this round; they were read for consistency with the changed sections only.
- Lusztig76 and McGraw03: uncertified in the manifest, cited by locator.
- The published versions of K, HSY23a, HSY23b and Shi22 (paywalled): locators are those of the arXiv versions the README names.
- No Lean was run; the repair report's elaboration (exit 0, no declarations) was not repeated.

## Source issues

- **Error** in K at Lemma 9.6, p. 74: the source says every x outside L♭ ⊕ W admits a presentation with a rank n−1 lattice of smaller valuation; it should exclude lattices of odd largest invariant such as H₁ ⊥ H₁, where none exists; affects the proof.
- **Gap** in Z at Proposition 4.12(i), proof, p. 23: the source deduces that 1 − d is a unit from integrality of det(1 − g) after replacing g′ by ξg′; it should justify that integrality when U(V_(n−1)) is noncompact (n ≥ 4); affects the proof.

## For the human reviewers

- **Scope.** §8.6 (`README.md:1158–1171`) is, in rank n ≥ 4, a statement with no published proof; the README says K Lemma 9.6 (Invent. Math. 2023, arXiv v2 final) is false at H₁ ⊥ H₁. §8.7 and §13.10 depend on it (S01).
- **Scope.** §9.5(b) and §14.5 (`README.md:1284`, `:1987`) narrow Z Theorem 15.1 (Ann. of Math. 2021): the group AFL at p = n ≥ 5 is not asserted, on the ground that Z Proposition 4.12(i) is unproved there.
- **Licence.** LRZ (arXiv:2404.02214v2) is an unpublished preprint; §§4.2 and 4.5, a headline, rest on its Theorem 14.6.2.
- **Licence.** LL1, LL2 and Zha12 are read from author pages and YZZ09 from an institutional archive (`README.md:2050–2051`, `:2069–2070`); McGraw03 and Lusztig76 are cited without a legal copy.
- **Gaps.** `gap:relative-fundamental-lemma` and `gap:relative-finite-transfer` are declared both here and by GanGrossPrasadUnitaryGroups, with different `section` values for the same supplier (`design/plan.json`; board package GanGrossPrasadUnitaryGroups lines 153, 157).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4b9f20f911dc56f12bbdecdf6e0d407c0813400a", "job": "RT-GrossZagierAndArithmeticHeightsPartII~2b", "model": "fable", "worker": "chris-x52"} -->
