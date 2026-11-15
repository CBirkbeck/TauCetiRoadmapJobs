# Answer to the human review of LocallyAnalyticRepresentationsOfLocalGroups (gate, round 2)

One unanswered comment (CBirkbeck, 2026-11-15T14:37:55Z, on `819f47f`) carries twelve findings, F01–F12. The quoted copy given to this job stops inside F10. The full text of the comment was read from the pull request, read-only, so all twelve are answered here. F12 lists four items. The comment itself says that item 2 does not apply: the two lists agree at this head, and after H11 both gain the same §§9C and 10A. Items 1, 3 and 4 are H12–H14. H01–H11 are F01–F11 in order.

All repairs are in `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/README.md` and `Suggested.lean`, in commit `4bfb6db` on top of `819f47f`. Line numbers below are those of the new README.

## H01 (CBirkbeck) — applied

§2.3 gains a Mahler-stage target, applied in round 2's amended form (README lines 585–600). The stages Π^((h)) are not defined again: they are cited from PadicLocalLanglandsForGL2Qp §2.5, which this README now records as a supplier contract (line 86). The new items are: (iv) right flatness of D_(<s_h)(H, E) over E[[H]], the isomorphism D_(<s_h) ⊗_(E[[H]]) Π′ ≅ (Π^((h)))′, and exactness on admissible Banach representations (CD14 Prop. IV.2, IV.13 (i), Cor. IV.14; ST03 Lemma 4.8); and (v) Π^(G_n-an) ⊆ Π^((n+2)) ⊆ Π^(G_(n+1)-an) (PAN22, proof of Thm 2.2.3). The route names its inputs: PadicLocalLanglandsForGL2Qp §0.1, LocallyAnalyticDistributionsPartII §§1.4–1.5, ST03 Lemma 4.8 (proved here), and PadicFunctionalAnalysis §4.4 together with its completed tensor power. The existing claims of §2.3 are numbered (i)–(iii) so that §2.5 can cite (ii), (iv) and (v). The Checks include the review's ζ-character test (Π^((1)) = 0, Π^((2)) = E, Π^(G_0-an) = 0, Π^(G_1-an) = E) and the trivial line.

## H02 (CBirkbeck) — applied differently

The gap is real. DING25 line 1803 only says "it is easy to see", and the multiplicity inference at the old §9.3 route fails on the Kronecker-quiver example. The new route (line 1511) uses a single device in place of the review's two separate constructions (one for an internal block, one for a block boundary). For each w with T_w ⊆ F_P it uses Y_w = (Ind_(P⁻) ⊗̂_j PS_1(w_j(φ_(F_P,j)), h^j) ε⁻¹∘θ^P)^an. Y_w lies both in the induction (3.19) and in PS(w(φ), h), compatibly on π_alg, and contains every C(w, s_(i,σ)): through V_0 at a block boundary and through V_I inside a block. So the inverse image of each C ∈ S_(F_P) in π_(F_P) equals its inverse image in PS_1(w(φ), h). The maps glue because Hom(C, π_1) = 0. The statement now also says that PS_1(w(φ), h) ↪ π_1 factors through π_(F_P) for compatible w. This is DING25 lines 1855–1857, and §9.6 (4) uses it; §9.6's route now cites it (line 1561). §9.3's *Needs* gain 9.1, 8.4, 8.5, 0.9 and 5.1.

## H03 (CBirkbeck) — applied

§7.3 (line 1179): "the induced (g, P)-map" → "the induced U(g)-linear map", with the clause that evaluation is U(p)-linear but not P-equivariant (7.1). This matches EMJ2 lines 80–88 and Definition 0.8 (lines 101–105). The N_0-independence that §7.3 asks to prove now carries its locator, Definition 0.8 and Lemma 0.18 (EMJ2 lines 109–111). The review's other suggested sentence is not added: §7.1 already states the M_0N_0-equivariance and the failure of M-equivariance. The other "(g, P)" and "(g, Q)" maps in §§7.4–7.6 are equivariant maps out of C^sm_c(N, U) (EMJ2 lines 165–171) and are correct as written.

## H04 (CBirkbeck) — applied

§8.7 (line 1350): "the unique subrepresentation with socle π_alg(φ, h) and cosocle ⊕_(i,σ) C(w, s_(i,σ))" → the preimage of soc(PS/π_alg). Its socle is π_alg; its cosocle is ⊕_(i,σ) C(w, s_(i,σ)) for n ≥ 2 and π_alg itself for n = 1, which agrees with the n = 1 Check (PS_1 = π_alg). No other "socle … and cosocle" definition in the README fails at n = 1: π_(F_P), π_(1,σ) and PS_(1,σ) are defined by constituents or quotients that are empty at n = 1.

## H05 (CBirkbeck) — applied differently

§3.1 (line 649) now defines trace-class maps of Smith spaces, compact maps of Banach spaces (their duals trace class), and LS, Fréchet and LB spaces of compact type, following BCGP25 Definitions 2.2.10 and 2.2.12 (lines 958–973) and RJRC22 Definitions 3.33–3.34 (lines 1174–1180). (ii) adds that the LS spaces of compact type are exactly the LB spaces of compact type (RJRC22 Cor. 3.38 (2), line 1251; BCGP25 Prop. 2.2.13), and the API bullet is qualified "Fréchet … LS". The review's further claim that Fréchet compact type "agrees with nuclear Fréchet" is not added as a separate statement. RJRC22 line 1172 only adopts it as a naming convention, and the existing clause of (ii) on the classical nuclear-Fréchet/LB duality already covers what the roadmap uses. Two Checks are added (lines 663–664): ∏_ℕ E against ⊕_ℕ E, and the non-compact identity of c_0(ℕ, E). The latter is computed through RJRC22 Lemma 3.36 (1), because "compact" is defined via trace class, so the review's classical distance-1 argument would need an unproved comparison.

## H06 (CBirkbeck) — applied

The old §2.5 sentence "H^•_cont(G_n, B ⊗̂ M) = H^•_cont(G_n, B) ⊗̂ M" (PAN22 lines 590–598) concerns the wrong coefficient module. Strong LA-acyclicity needs B ⊗̂ M ⊗̂ C^an(G_n, ℚ_p), and B ⊗̂ C^an(G_n, ℚ_p) need not be admissible: for B = E, G_(n+1) acts trivially on the unit ball of C^an(G_n, ℚ_p) mod p (PAN22 Lemma 2.1.2, line 470), which is infinite-dimensional. The route (line 623) is replaced as the review proposes: Schikhof duality gives 0 → B → P → C → 0; the level-n sequences of 2.4 (1); the Mahler stages of 2.3 (iv)–(v); and, for M, the functor c_0(I, −) with M ≅ c_0(I, ℚ_p) (PadicFunctionalAnalysis §2.3). §2.4 (1) now states the level-n long exact sequences that this route uses. "with proofs" is dropped from the locator, since the route for M is not Pan's.

## H07 (CBirkbeck) — applied

The §2.4 route (line 609) no longer paraphrases PAN22 lines 563–569. It now goes through the orthonormal bases of C^an(G_n, ℚ_p) and of the continuous cochains (Mahler, PadicFunctionalAnalysis §§2.1, 3.2), the exactness of c_0(J, −) on strict sequences (open mapping), and the splitting of M^• into short exact sequences for (2) and (3). The §2.5 route is H06's. In §8.12 (line 1427), "every C(I, s_(i,σ)) is a C(w, s_(i,σ)) for some w, so varying w covers the target" (compare DING25 line 1688) → "each label I equals w⁻¹({1, …, i}) for some w (8.5), so the images of these maps for the different w together span the direct sum". The same echo in §10.5 (2), "covering by w", is reworded likewise (line 1657).

## H08 (CBirkbeck) — applied

The `Suggested.lean` docstring gains the Layer 4 bullet. It covers highest-weight descent and the simple objects and finite length of O^p_alg, restricted BGG duality, the low-length Verma multiplicities and Kostant homology, and lists what the pins lack. The pins have `TauCeti.VermaModule` and `TauCeti.irreducibleQuotient` only for Killing Lie algebras (`TauCeti/Algebra/Lie/HighestWeight/Verma.lean`), no category O or generalised Verma modules, and Lie algebra cochains only in low degree (`Mathlib/Algebra/Lie/Cochain.lean`, `TauCeti/Algebra/Lie/Cohomology/`). The docstring also gains the sentence that the general locally convex inputs of Layer 0, the weak-null criterion of §0.8 among them, are README targets and not headlines. No signature is added, as round 2 decided.

## H09 (CBirkbeck) — applied

Source corrections (line 1722): "Ding, (3.28) and Remark 3.17" → "Ding, (3.32) and Remark 3.17". DING25 line 1984 ((3.32)) and line 1989 (Remark 3.17) both print C(w(ϕ), s_(i,σ)), while (3.28) at lines 1861–1868 is the compatibility square, which §9.6 still cites correctly.

## H10 (CBirkbeck) — applied differently

(a) 0.3 (v) is deleted, together with its "later compatibility" sentence and the *Needs* entry LocallyAnalyticDistributionsPartII §1.1 (for (v)). §0.5 (line 258) now states that x ∈ g acts as x̃ (0.4 (iv); for F = L, its image under 0.4 (vi)), so that the module structure extends the action of 0.3.

(b) The σ-analytic notions now live in Layer 0, but not in §0.2 as the review proposed, because §0.2 precedes the Lie action and D(G, E) that they need:
- The definition (the g ⊗_(ℚ_p) E-action factors through g_σ; Ding §3.1.4, DING25 lines 1935–1938) is placed after 0.3 (iv) (line 214).
- D_σ(G, E), the strong dual of the locally σ-analytic functions (BR19 lines 395–398), is placed in 0.4 (line 236).
- The factorisation of the action through D_σ(G, E) is placed in 0.5 (line 262), with a one-line route via the Taylor series of ST02 p. 13. It was implicit in the old §10.1 definition and is needed by 1.8.

Keeping Ding's Lie-action definition also keeps the route of 10.1 (3) valid. §10.1 now refers back to these (line 1599), §5.1 (vi) cites "(0.3)", §1.8's *Needs* gain 0.4–0.5, and §10.1's gain 0.5.

## H11 (CBirkbeck) — applied differently

The lifting step in 4.2 (iii) had no supplier at this head either. It read "lifts uniquely to L_P", in place of the board text's Jantzen citation. The review's repair cites ReductiveGroups Layer 2 for "G-stable and Lie-stable subspaces agree". Layer 2 on main (`TauCetiRoadmap/ReductiveGroups/README.md` lines 1499–1536) does not state this, and §10B states only the rational classification. The route (line 836) instead uses ReductiveGroups §9C (Dist(G_A) = A ⊗ U_ℤ, so in characteristic zero Dist(L_P) = U(𝔩_P)) and the integration comparison of §10A (lines 5320–5333). That comparison turns a locally finite Dist-module, with a rational torus action satisfying the toral equations and root shifts, into a rational module. These are added to the 4.2 *Needs*, the Layer 4 Dependencies and the ReductiveGroups supplier contract. The review's test still holds: the standard sl_2 module has weights ±ϖ, outside X = 2ℤϖ for PGL_2, so it does not integrate; for SL_2 it does.

## H12 (CBirkbeck) — applied

`Module.Basis.pbwBasis` (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean`, line 96 at the pin, for `[CommRing R] [LieAlgebra R L] [LinearOrder ι] (b : Basis ι R L)`) is added under "From Tau Ceti" (line 65), in the *Needs* of 0.4 (for (iv) with F = L) and in the Layer 0 Dependencies.

## H13 (CBirkbeck) — applied

§7.3 Check 2 (line 1191): "the relevant lower Verma module is simple" → "the Verma module U(g) ⊗_(U(b)) U = M((0, 2)) is simple, since ⟨(0, 2) + ρ, α^∨⟩ = −1 is not a positive integer". With ρ = (1/2, −1/2), (0, 2) + ρ = (1/2, 3/2) gives −1, and (1, 1) + ρ = (3/2, 1/2) gives 1, which matches Check 3's non-simple M((1, 1)).

## H14 (CBirkbeck) — applied

§2.2 (ii) (line 562): "Emerton's memoir, Proposition 6.5.9" → "…, p. 134". EM17 line 6696 is after the page-134 marker at line 6685, and the same file puts Proposition 6.2.2 on p. 117, as the README already cites.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 (iv), dual base change | Π = C(H, E); H trivial | Π′ = E[[H]], so D_(<s_h) ⊗ E[[H]] = D_(<s_h) = dual of LA^((h))(H) (CD14 §IV.3, Prop. IV.5); for H = 1, D_(<s) = E, flat | holds | none |
| 2.3 (iv), right algebra | wrong model D_(s_h) (null coefficients) | dual of the null condition v(a_α) − r_h\|α\| → ∞ is the bounded condition; d_(pj) = p^(−j), r = p^(−1/p) gives \|d_(pj)\|r^(pj) = 1, in D_(<r) but not in D_r (LADPartII §1.5 Check 3) | D_(<s_h) is the right algebra | none |
| 2.3 (iv), radius | p odd, h = 1; p = 2, h = 1 | s_1 = p^(−1/(p−1)) ∈ (1/p, 1); for p = 2, κ = 2, r_1 = 1, s_1 = 2^(−1/2) ∈ (1/2, 1) | in range | none |
| 2.3 stages | trivial line; ζ-character, p = 3 and p = 2 | b^α v = 0 for α ≠ 0, so every stage is E; v_p(ζ − 1) = 1/(p − 1), so the excess is k(1/(p−1) − r_h): 0 for h = 1, k/p > 0 for h = 2 (p = 2: r_1 = 1, r_2 = 1/2) | Π^((1)) = 0, Π^((2)) = E | Checks added |
| 2.3 (v), shift n + 2 | d = 1, f = Σ c_k ⌊k/p^n⌋! binom(x, k) with v(c_k) ≈ √(log_p k), at k = p^n(p^j − 1) | v_p(⌊k/p^n⌋!) − r_(n+1)k = −j; so v(a_k) − r_(n+1)k ≈ √j − j → −∞, while v(a_k) − r_(n+2)k ≥ √j − j + k/(p^(n+1)) → ∞ | LA_n ⊄ LA^((n+1)) but LA_n ⊆ LA^((n+2)); v_p(⌊k/p^(n+1)⌋!) ≤ r_(n+2)k gives LA^((n+2)) ⊆ LA_(n+1) | the shift by 2 is needed; none |
| 2.3 (v), n = 0 | ζ-character on ℤ_p | Π^(G_0-an) = 0 (locally constant, not a power series on ℤ_p); Π^((2)) = E; Π^(G_1-an) = E | 0 ⊆ E ⊆ E | Check added |
| 2.4 (1), level n | M_0 = 0; diagonal x_n ↦ p^n x_n | isomorphism at every n; cokernel not Banach, excluded by strictness | holds | none |
| 2.5 route | B = E, M = c_0(ℕ, ℚ_p); B = C(G_0, E) | E ⊗̂ c_0(ℕ, ℚ_p) = c_0(ℕ, E); P = C(G_0, E), C = P/E; for B = P, C = 0 and the higher groups vanish | matches Checks 1 and 4 of 2.5 | none |
| 3.1 definitions | E; ∏_ℕ E and ⊕_ℕ E; c_0(ℕ, E) | id_E trace class (g(1) = id); finite-rank transitions E^(n+1) → E^n compact; in S = (∏O_E)[1/p], e_n → 0 coordinatewise but ‖e_n‖_∞ = 1, so no factorisation through S^B | Fréchet and LS compact type agree with the examples; c_0 identity not compact | Checks added |
| 4.2 (iii), lifting | sl_2 with SL_2 and with PGL_2; Lie(𝔾_m) with μ = 1, μ = 1/2 | weights ±ϖ ∈ ℤϖ = X(SL_2), ∉ 2ℤϖ = X(PGL_2); μ = 1 integrates to t ↦ t, μ = 1/2 ∉ X; binom(H, n) on weight λ is binom(⟨λ, y⟩, n) | integrates exactly when the weights lie in X | none |
| 7.3, U(g)-linear | GL_2, U = 1, P = B; P = G | diag(p, 1) moves the support of the big-cell cutoff 1_(ℤ_p) to pℤ_p; its Lie derivative is 0; for P = G evaluation is the identity | not P-equivariant, U(g)-linear | applied |
| 7.3 Check 2 | ρ = (1/2, −1/2) | ⟨(1/2, 3/2), α^∨⟩ = −1; ⟨(3/2, 1/2), α^∨⟩ = 1 | M((0, 2)) simple, M((1, 1)) not | applied |
| 8.7, PS_1 | n = 1, 2, 3 | n = 1: PS/π_alg = 0, preimage π_alg, cosocle π_alg; n = 2: PS_1 = PS, cosocle C(w, s), d_L summands; n = 3: length 1 + 2d_L | matches Checks | applied |
| 8.12 wording | n = 2, n = 3 | {1} = 1⁻¹({1}), {2} = s⁻¹({1}); all six labels for n = 3 arise as w⁻¹({1, …, i}) | spans | applied |
| 9.3 route | GL_3, blocks (2, 1), standard F_P; P = B; P = G; n = 1 | compatible w = 1, (1 2): labels {1}, {1, 2} and {2}, {1, 2}, together S_(F_P) = {{1}, {2}, {1, 2}}, length 1 + 3d_L; here Y_1 = PS(φ, h) since PS_1 = PS for GL_2; P = B: Y_w = PS(w(φ), h), π_(F_P) = PS_1; P = G: Y_w = PS_1(w(φ), h), π_(F_P) = π_1 = Σ_w PS_1; n = 1: identity of π_alg | consistent; the Kronecker-quiver counterexample is not used | applied |
| 0.3 / 0.4 / 0.5, σ-analytic | L = ℚ_p(√p), χ = σ(x)^k and x ↦ τ(x); L = ℚ_p | g_τ acts by kδ_(τσ), so χ is σ-analytic and its orbit map exp(kσ(a)) is a series in σ(a); τ(x) has g_τ acting by 1, so it is not σ-analytic; for L = ℚ_p every representation is σ-analytic and D_σ = D | holds | applied |
| 0.5, x acts as x̃ | ℤ_p, χ(a) = (1 + p)^a | x = 1 acts by log(1 + p) through both 0.3 and x̃ | holds (0.5 Check 4) | none |

## Elaboration check

`Suggested.lean` declares nothing; only its docstring changed. So there is no declaration for a `#check @name` file, and no binder can drop.

## Build

`lake build TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups.Suggested`: ✔ Built TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups.Suggested (2.7s). Build completed successfully (18239 jobs).

## Gate

`gate LocallyAnalyticRepresentationsOfLocalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency direction (`gate --depcheck … --pr 2294`): `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

`roadmaps resolve` on the new README finds no cross-roadmap citation and no Lean name missing. It did not check names outside TauCetiRoadmap; `Module.Basis.pbwBasis` was checked by hand at the pinned Tau Ceti.

## Suppliers and ownership

New supplier edges:
- PadicFunctionalAnalysis §§2.1, 2.3, 3.2, 4.4 (on main), with a new contract section.
- PadicLocalLanglandsForGL2Qp §2.5 (open, earlier in the merge order).
- ReductiveGroups §§9C, 10A (on main).
- LocallyAnalyticDistributionsPartII §1.5 for D_(<r) (open, earlier in the merge order; its §1.5 defines D_(<r), checked at its head).

The flatness, dual base change, exactness and G_n-comparison of the Mahler stages are owned here. `roadmaps grep` for these objects (Mahler stages, analytic-radius spaces, CD14 IV.13 and IV.14) over main and the open heads finds only PadicLocalLanglandsForGL2Qp §2.5. That section defines the spaces for its coherence criterion and states none of these results. No notion moved down from a later roadmap.

## Sources

Every locator above is in a work the manifest already records: CD14, ST03, PAN22, EMJ2, BR19, DING25, ST02, RJRC22, BCGP25, BH20 and EM17, all read from the cache. No new text was needed and nothing was added to `needs-references.toml`. The new locators (CD14 Prop. IV.2, Thm IV.6, Prop. IV.13; ST03 Lemma 4.8; RJRC22 Def. 3.33–3.34, Lemma 3.36, Cor. 3.38; BCGP25 Def. 2.2.10, 2.2.12, Prop. 2.2.13; EMJ2 Def. 0.8, Lemma 0.18; BR19 §2.1; DING25 §3.1.4) may be added to the manifest's `cited_for` entries by the worker; this job does not edit `sources.toml`.

The review text contained no instruction to run commands or change files outside the job.
