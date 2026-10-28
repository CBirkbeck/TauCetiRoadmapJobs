<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6401780229 -->
Review (claude) of 959da23

Verdict: accepted
Conditional on the announced gaps: `huber-compact-support-nearby-cycles`, `analytic-comparison-automorphisms`

1. **F01** (P3) A repaired Check describes the altered scheme wrongly

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:637` (sliced nearby cycles, second Check): "Over V[π^(1/2)] the scheme splits into two copies of the base and the action is trivial for every n."

   **Claim.** After base change along Spec V[π^(1/2)] → Spec V, X = Spec V[t]/(t²−π) becomes two copies of the base.

   **Witness.** V′ = V[√π]: V′[t]/(t²−π) = V′[t]/((t−√π)(t+√π)); both factors reduce to t at the closed point, so the special fibre is Spec k[t]/(t²), one point, and the two branches meet there. Only the generic fibre splits (Spec K′ × Spec K′).

   **Computed.** Stalk at the closed point: (V′[t]/(t²−π))^sh ⊗ K̄′ = K̄′ × K̄′, so R⁰Ψ = (ℤ/n)² with trivial Galois action for every n: the Check's conclusion is right, its scheme description is not. Before base change: (σ−1)² = −2(σ−1) on (ℤ/n)², so (σ−1)^k = (−2)^(k−1)(σ−1), zero iff n is a power of 2 (recomputed; agrees with the Check).

   **Repair.** Replace the quoted clause by "Over V[π^(1/2)] the generic fibre splits into two K′-points (the two branches t = ±π^(1/2) meet over the closed point), so the stalk is (ℤ/n)² with trivial action for every n." Tested on the instance above: the repaired sentence is true and the trivial-action conclusion is unchanged.

2. **F02** (P3) The uniform-reduction Needs line omits the compactification it uses

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:696`: "descend the alteration to some finite stage … and extend it by a proper model. … *Needs:* … SchemeAndStackFoundations §§0.9, 0.23a, 4.11, 4.16, 4.19".

   **Claim.** The listed inputs supply the proper model extending the field alteration.

   **Witness.** ITO20 line 1937 and lines 1956–1958 obtain that proper model by Nagata compactification in both characteristics. SchemeAndStackFoundations §0.9 (main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`) supplies finite-presentation models over a dense open, and its line 141 says compactifications and Nagata existence are built downstream. The package itself cites EtaleCohomologyFoundations §G.2 `nagataCompactification` for exactly this step in the adapted-coefficient target (README:656) and in the Layer 3 Dependencies (README:748), but not in this Needs line.

   **Repair.** Append "EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model" to the Needs line at README:696. `nagataCompactification` exists on main at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:107` (qcqs base, separated finite type, no Noetherian hypothesis), which covers Spec O[T^(1/p^N)].

3. **F03** (P3) The ITO20 References entry predates the repair

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:931`: "Theorem 1.1 and §1.2, pp. 1–3; Proposition 4.1 and Lemma 4.3, pp. 19–20; … Theorem 1.4, Proposition 6.6, Theorem 6.10, Lemma 6.11 and Lemmas 7.1–7.7, pp. 3–4, 33–46. ITO20 line 76, …".

   **Claim.** The entry lists the ITO20 locators the roadmap uses.

   **Witness.** §3.4 now also cites §2.1, Definitions 2.1–2.2 and 2.5, Remark 2.3, Theorem 2.7, §3.1, Proposition 3.1, Theorem 3.3, Definition 3.4, Lemmas 3.5–3.16, Corollary 3.17, Theorem 5.3, Proposition 5.5, Definition 6.1, Theorems 6.2–6.3, Definition 6.5, Propositions 6.6–6.7 and Appendix A (Theorem A.6, Proposition A.8, Lemma A.11), with ITO20 lines 189, 238, 252, 317, 348, 359, 378, 388, 412, 429, 803, 1198, 1299, 1413, 1427, 1439, 1455, 1481, 1502, 1518, 1606, 1662, 2191, 2279, 2338, 2382 and 2391. `sources.toml` was updated to this list (its ITO20 `locator` now reads pp. 1–54); the README entry was not.

   **Repair.** Extend the ITO20 bullet at README:931 to the locator list recorded in `sources.toml` (pages 5–18, 26–37 and 46–54 added) and the line locators above.

Accepted conditional on the two declared supplier gaps `huber-compact-support-nearby-cycles` and `analytic-comparison-automorphisms` (both named with supplier ClassicalAdicEtaleCohomology in `design/plan.json` and in the README's supplier contracts). Three non-blocking findings follow; none touches a statement's truth or a headline.

## Verified sound

### Round-2 findings and their repairs

| Finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P1): uniform annular route had unowned inputs | Repaired | README:625–676 add four owned targets before the uniform annular target: sliced nearby cycles with a four-fact API (stalk formula via CAEC §5.4 `OrientedEtaleProduct.nearbyCycles_stalk`, Remark 2.3 equivalence, base-change stability, open-immersion restriction) and three Checks; the coefficient-uniform alteration (Cor. 3.17) with Theorem 2.7, Definition 2.5 and Orgogozo's Proposition 3.1 stated as owned targets and `PlurinodalAlteration.exists` imported; adapted coefficients (Def. 6.5, Props. 6.6, 6.7(1)–(2), 5.5); annular covers and tame trivialization (Def. 6.1, Thms. 6.2–6.3, Lemma A.11, Huber 2.7.11). README:678 gives the route of Theorem 6.10 (lines 1606–1667) and lists the four targets, the new gap and CAEC §§3.2, 10.5. Huber 5.7.8 is `gap:huber-compact-support-nearby-cycles` at README:85 and `design/plan.json` (the only plan.json change). Every ITO20 locator of the new text was opened (table below); every statement matches its source at the stated generality. The three repair tests of F01 are now Checks at README:636, 648 and 675–676 and recompute correctly (adversarial table). |
| F02 (P3): alteration cited §4.16 instead of §4.19 | Repaired | README:696 now names SchemeAndStackFoundations §4.19 `alteration_theorem` (main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6372`: integral separated finite type over a field, regular projective output), applied to the integral generic fibre over K in characteristic 0 and to the reduced generic fibre over the perfect field K(T^(1/p^∞)) in characteristic p, descended by §0.9 and extended by a proper model, as ITO20 lines 1935–1958 do. §4.16 is retained for the calculus (README:748). R02 is the one input still missing from that Needs line. |

Pattern search for the repaired patterns in the rest of the package: every other `*Needs:*` line that mentions alterations (README:642, 792, 920) cites §4.19 where existence is used; no other proof route in Layer 3 or 4 consumes a step that is neither a target, a supplier section, a pinned declaration nor a declared gap (each of the 36 Needs lines was reread against its paragraph).

### Principles, shape and policy

Read all 936 README lines, the 75-line `Suggested.lean`, `metadata.toml`, all seven `sources.toml` records and the plan's `gaps` list. The README has 30 numbered targets plus seven bold targets in §3.4, 36 Needs lines, 39 Checks blocks, five Dependencies paragraphs, and every definition keeps an API list with at least three Checks (the four new §3.4 definitions have 3, 3, 3 and 3). No route-specific shortcut, no re-planned roadmap, no computational algorithm, no sorry'd data, no `set_option`, no `lemma`, no LaTeX delimiter or TeX script outside code spans (scanned with the code spans stripped: 0 hits), no process word (so far / current / removed / checkpoint / handoff / round / pull-request number: 0 hits), no target-number blocks or field lists. The only backticked name of this roadmap's own in the README is `duality_splitting` (2 occurrences), declared in the Lean file. The Scope paragraph (README:15) now says which uniform-route inputs are owned here and why (no earlier roadmap states them); ownership was confirmed by object below.

### Sources: the seeded sample and every repaired locator

ITO20 is the arXiv v1 extraction (page markers checked: p. 5 = lines 182–235, p. 17 = 767–809, p. 27 = 1187–1236, p. 32 = 1422–1466, p. 36 = 1596–1640, p. 49 = 2170–2214, p. 53 = 2355–2399). SCH12 is the published text (p. 251 = lines 236–282, p. 307 = 2494–2535, p. 308 = 2536–2578, p. 309 = 2579–2609, p. 310 = 2610–2636, p. 311 = 2637–2654). DEL80 p. 175 = lines 1494–1530; DJ96 p. 66 = lines 594–630.

| Target | Locator read | Theorem number, page, hypotheses, support |
| --- | --- | --- |
| 0.1 local monodromy data | SCH12 lines 2508–2517 (p. 307), 2530, 2592–2600 (p. 309) | t_ℓ: I_k → ℤ_ℓ(1) by Kummer ratios of ϖ^(1/ℓⁿ); NΦ = qΦN for geometric Frobenius (line 2530); the marked datum is an authorial abstraction and the README says so. Numbers and pages correct. |
| 0.4 relative purity | SCH12 lines 2518–2546 (Prop. 9.1, Def./Prop. 9.2, Conj. 9.3, pp. 307–308) | Open I₁ ⊆ I_k with ρ(σ) = exp(N t_ℓ(σ)), N unique nilpotent; centered filtration with N^j: gr_j ≅ gr_−j; eigenvalues on gr_j Weil numbers of weight i+j for every geometric Frobenius and every complex absolute value. README weight w+j matches with w = i. |
| 0.5 detection on closed subgroups | SCH12 lines 2547 (p. 308), 2592–2597 (p. 309) | Source: finite extensions allowed; restriction to G_K for the p-power Kummer tower still sees Frobenii (totally ramified) and pro-ℓ inertia (pro-p extension). README's general admissible closed subgroup is an authorial extension restricted to local-field representations; the source supports both instances named. |
| 0.6 transport | SCH12 lines 2527–2529 (p. 307), 2598–2600 (p. 309) | Rescaling the identification ℚ_ℓ(1) ≅ ℚ_ℓ rescales N with no effect on weights; weights and N are compatible with the Galois isomorphism. Supports the constant-c statement. |
| 0.7 summands | SCH12 lines 2652–2654 (p. 311) | Poincaré duality makes H^i(Y) a direct summand; summand inherits WMC. Source uses only the summand direction; README's "not subrepresentations" is its own Check. |
| 0.9 finite extension | SCH12 line 2547 (p. 308) | "Allowed to replace k by a finite extension": one direction in the source; the converse is the README's own target with route through §0.5 and the constant e⁻¹. |
| 1.1 Deligne's curve theorem | SCH12 lines 2571–2573 (Thm. 9.4, p. 308); DEL80 lines 1524–1530 (1.8.3 and Théorème 1.8.4, p. 175) | Scholze: C over 𝔽_q, x ∈ C(𝔽_q), X proper smooth over C∖{x}. Deligne 1.8.4: a pointwise ι-pure lisse sheaf of weight β on a curve has Gr^M_i of the generic fibre at a finite-residue-field henselian trait ι-pure of weight β+i; closed points of any degree are covered, which justifies the README's Q = #κ(x). Page 175 correct (README cites pp. 175–176; the theorem's proof runs onto p. 176). |
| 1.2 all places of a function field | SCH12 lines 2571 and 2652–2654 | Derived statement (spreading out plus 1.1 at bad places, 0.10 at good places); the source states the curve theorem and the final deduction; the all-places form is the README's own target with a route. |
| 2.3 prime-to-p Tate coordinates | SCH12 lines 2597–2600 (p. 309) | K♭ is the completed perfection of 𝔽_q((t)), t = ϖ♭; the torsion comparison is an authorial consequence of multiplicativity of sharp (both groups have ℓⁿ elements, kernel elements have order dividing p^r and ℓⁿ). |
| 2.4 marked tilt comparison | SCH12 lines 2592–2600 (p. 309) | Totally ramified, pro-p, Galois groups isomorphic, weights and N compatible. The scalar e⁻¹ and the direction of the constant are authorial and recomputed below. |
| 3.2 Huber local constancy | ITO20 lines 99–102 (§1.2, pp. 2–3); Thm. 4.5 at line 964 assumes char 0 | R^j f^rig_* ℤ/n oc-quasi-constructible by HUB98 Thm. 2.1, hence locally constant of finite type on B(ε₁)∖{0}; ε depends on j, n. HUB98 original uncertified (manifest). |
| 3.4 neighbourhoods | ITO20 lines 964–981 (Thm. 4.5(2), p. 21), 987–990 (Rem. 4.7, p. 22), 1003–1009 (Thm. 4.9, p. 22) | 4.5(2): K char 0, X separated finite type over O, Z finite presentation, n invertible, F constructible locally constant, one ε₀ with T(Z,ε) → S(Z,ε) → S(Z,ε)° → d(Ẑ) isomorphisms for all ε ≤ ε₀ and all i. 4.9: either characteristic, constant ℤ/n, ε₀ independent of n and i. README's two statements match exactly; Remark 4.7 supports the n = p Check. |
| 3.4 new targets | ITO20 lines 189–235 (§2.1, Def. 2.1, p. 5), 238–251 (Def. 2.2, p. 6), 252–317 (Rem. 2.3 and (2.1), pp. 6–7), 348–354 (Def. 2.5), 359–365 (Thm. 2.7, p. 8), 378–395 (nodal curves, Prop. 3.1, p. 8), 412 (Thm. 3.3, p. 9), 429 (Def. 3.4), 803–806 (Cor. 3.17, p. 17), 1151–1201 (§5.2 setup and Thm. 5.3, pp. 26–27), 1299–1305 (Prop. 5.5, p. 29), 1404–1410 (Kummer coverings), 1413–1421 (Def. 6.1, p. 31), 1427–1445 (Thms. 6.2–6.3, p. 32), 1455–1478 (Def. 6.5, pp. 32–33), 1481–1500 (Prop. 6.6 and proof, p. 33), 1502–1553 (Prop. 6.7 and proof, pp. 33–35), 1586–1667 (Thm. 6.10 and proof, pp. 35–37), 2191–2194 (Thm. A.6, p. 49), 2279–2286 (Prop. A.8, p. 51), 2338–2346 (proof of 6.2, p. 52), 2382–2389 (Lemma A.11, p. 53), 2391–2399 (proof of 6.3, p. 53) | Every hypothesis restated in README:625–678 is in the source at the same generality: Galois action through Aut(U(η̄)/Spec O_{U,η}); base change for local morphisms of strictly local S-schemes with ξ̄ ↦ η̄; unipotence for every strictly local U and every η̄; S Noetherian excellent and f separated finite type in 3.17; Thm. 2.7 for proper f and constructible complexes locally unipotent along a stratification; Prop. 3.1 with S° normal, D étale over S in the smooth locus, X° = f⁻¹(S°)∖D, conclusion along {S°, S∖S°}; Def. 6.5's three conditions; Prop. 6.6 needs finite presentation and descends to a finitely generated ℤ_(p)-subalgebra; Prop. 6.7(1) tameness at points with a proper generalization and (2) overconvergence on d(π)⁻¹(V); Thm. 6.2's ε with cᵢ < dᵢ ≤ 1 and the char-0 Kummer refinement; Thm. 6.3's a/b < t² < 1 and m invertible in O; Kummer coverings need m invertible in K (line 1404). Theorem 1.4(2) at lines 132–139: h = g∘φ_m, Kummer first then finite Galois étale, g Kummer in char 0, h may depend on n — as README:678 states. |
| 3.4 F02 locator | ITO20 lines 1935–1947 (char 0) and 1950–1958 (char p), pp. 43–44 | de Jong's Theorem 4.1 applied over K, respectively over K(T^(1/p^∞)) with descent to K(T^(1/p^N)), then Nagata compactification. README:696 matches; R02 notes the missing Needs item. |
| 4.1 tilted approximation | SCH12 lines 2496–2506 (Cor. 8.8, p. 307), 2607–2609 (p. 309); DJ96 lines 597–606 (Thm. 4.1 and Rem. 4.2, p. 66) | Set-theoretic complete intersection of codim Y hypersurfaces; Z with Z^ad ⊆ π⁻¹(Ỹ), dim Z = dim Y, definable over a dense subfield, geometrically irreducible, then a projective smooth alteration. DJ96 Rem. 4.2: after a finite constant extension k₁ the altered variety is geometrically irreducible and smooth over k₁. All retained in README:754–756. |
| 4.6 Scholze's theorem | SCH12 lines 2589–2591 (Thm. 9.6, p. 309) and 239–241 (Thm. 1.15, p. 251) | Local field of characteristic 0, geometrically connected proper smooth Y, set-theoretic complete intersection in a projective smooth toric variety. README adds "split", which is Scholze's fan-defined toric variety; "exactly codim Y hypersurfaces" is Cor. 8.8's definition. |
| 4.7 projective spaces and products | SCH12 Thm. 1.15 (line 239, p. 251) and Thm. 9.6 | Instances of 4.6 with the fans of AnalyticToricGeometry Layer 0; the smooth-hypersurface case is the one Scholze sketches at lines 242–246. |

No locator in the sample or in the repaired text is wrong. The HUB96 manifest locator now adds Lemma 2.7.11 and Theorem 5.7.8 "as recalled in ITO20": that is the honest form for an uncertified text and matches ITO20 lines 1662 and 1198.

### Computed adversarial pass

T(q) is E² with N e₁ = e₀, N e₀ = 0, Φ = diag(1, q). Rows for the sampled targets were recomputed here; rows for the repaired §3.4 passages are the new evidence of this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions / 0.1 twist and datum | T(2), T(3); ℤ_ℓ ⋊ ℤ̂ with n·x = q^(−n)x | NΦe₁ = qe₀ = qΦNe₁; (0,1)(x,0)(0,1)⁻¹ = (q⁻¹x,0) so t(ΦσΦ⁻¹) = Q⁻¹t(σ) with Q = q; arithmetic coset gives q, not Q⁻¹ for any Q ≥ 2; Fr = I would force (1−Q⁻¹)t = 0 | Pass; both wrong models excluded | None |
| 0.1 topology | discrete ℤ[1/Q] ⋊ ℤ; open 9ℤ₃ in ℤ₃ | open {0} has t = 0 and exp(0·N) = 1 for all N; t(9ℤ₃) = 9ℤ₃ ≠ 0 | Profiniteness needed and stated | None |
| 0.4 purity | T(2); same Φ with N = 0; twist by χ(Φ) = 1/2 | gr_−1 eigenvalue 1 (weight 0 = w−1), gr_1 eigenvalue 2 (weight 2 = w+1): w = 1; N = 0 puts {1,2} in gr_0, weights 0 ≠ 2; twist eigenvalues 1/2, 1 give w = −1 = 1−2 | Pass | None |
| 0.5 detection | T(2) restricted to residue index 3 | Φ′ = Φ³τ, eigenvalues 1, 8 against Q′ = 8: weights 0, 2, centre 1; base 2 would assign 8 weight 6 | qᶠ essential, both directions | None |
| 0.6 transport | identity D → 2D | t′∘α = 2t gives N = 2N′; inverse returns N′; filtrations equal | Pass | None |
| 0.7 summands | T(2) ⊕ T(2); ker N = Ee₀ | sum has grade dimensions (2,2), centre 1; ker N has N = 0, eigenvalue 1, weight 0 ≠ 1; Ee₁ is Φ-stable but σe₁ = e₁ + t(σ)e₀ ∉ Ee₁, so no stable complement | Summand passes; subobject fails as the README says | None |
| 0.9 finite extension | ℙ¹, residue degree f | eigenvalues (1, q) ↦ (1, qᶠ) with Q′ = qᶠ: weights (0, 2) both ways | Pass | None |
| 1.1 curve theorem | Legendre at λ = 0, p odd; degree-a point | multiplicative reduction: rank N = 1, grades −1, 1 of weights 0, 2; Q = qᵃ moduli 1, qᵃ | Pass | None |
| 1.2 all places | ℙⁿ over F, place of degree f | H^(2r) eigenvalue q_v^r, weight 2r at every place | Pass | None |
| 2.3 torsion | μ₃ at p = 2; μ_(2ⁿ) mixed char; ε = (1, ζ_p, ζ_(p²), …) | both μ₃ have 3 elements; μ_(2ⁿ)(C♭) = 1 vs 2ⁿ; ε♯ = 1, ε ≠ 1, infinite order | Prime-to-p restriction essential | None |
| 2.4 marking | k″ = 𝔽_q((t)); k″ = 𝔽_q((t^(1/p))) | e = 1, scalar 1, eigenvalues (1, q) both sides; e = p, scalar p⁻¹, (1/p)(pN) = N | Direction of the constant passes | None |
| 3.2 direct images | identity disc; n = 1 | R⁰ = ℤ/n, Rʲ = 0; n = 1 everything 0 | Pass | None |
| 3.4 fixed sheaf and endpoint | f = T; char 2 with f = T², f′ = T, ε = |t|²; odd n over the completed closure of 𝔽₂((t)); n = p mixed char | b = 0, (ℤ/n, 0, …) on tube and origin; T(V(T), |t|²) = {|T| ≤ |t|²} = T(V(T²), |t|⁴) (exponent p^N = 2 on the radius); ε₀ = 1 for all odd n; H¹(B(1), ℤ/p) infinite vs 0 at the origin | Pass; n = p correctly excluded | None |
| Sliced nearby cycles: f = id, η = u, X = ∅, n = 1 | — | stalk RΓ(U(η̄), ℤ/n) = ℤ/n, trivial action; η = u gives RΨ = i^*; empty X and n = 1 give 0 | Both properties hold; matches CAEC §5.4's η = s Check | None |
| Sliced nearby cycles: t² = π, p ≠ 2 | n odd > 1; n = 2^r; after V[π^(1/2)] | strict henselization is V[√π] itself (residue field k); ⊗K̄ gives K̄ × K̄, (ℤ/n)² with swap; (σ−1)² = −2(σ−1), (σ−1)^k = (−2)^(k−1)(σ−1) = 0 iff n | 2^(k−1); after base change K̄′ × K̄′ with trivial action | Unipotence n-dependent, converse of stability false, as stated | R01 (wording of the base-changed scheme) |
| Base-change compatibility of t² = π over S | q: V′ → U local, ξ̄ ↦ η̄ | number of components of X_(x̄) ×_U U(η̄) is 2 if η̄ lies over η_S, 1 if over s_S; same for ξ̄ since ξ̄ ↦ η̄ | Compatible for every n; "S succeeds for 2-powers" correct | None |
| Open-immersion restriction bullet | f = g∘u, u open | (Rj_{P*}G)|_{X_U} = Rj_{X*}(G|_{X_U(η̄)}) for the open base change; then i^* restricts | RΨ_f(K|_X) = (RΨ_g K)|_{X_u} | None |
| Coefficient-uniform alteration Checks | f = id; t² = π; X = ∅; n = 1 | S′ = S for id; Spec V[π^(1/2)] of degree 2 works for all n prime to p; pushforward of ℤ/n along it on U = S restricted to Spec K is (ℤ/n)² with swap: filtration ker(σ−1)^k has trivial graded action iff n is a 2-power; 0 complexes for ∅ or n = 1 | "exactly when n is a power of 2" correct | None |
| Prop. 3.1 degenerate case | S° = S, D = ∅, f smooth proper | every lcc L is constant on a strictly local scheme (finite étale algebras split); R^i f_* L lcc, constant on strictly local U | Hypothesis and conclusion consistent | None |
| Adapted: Y = Spec O[T], f = π = id | all n | R⁰ d(f)_! ℤ/n = ℤ/n constant; tame; overconvergent | Pass | None |
| Adapted: T = S³, residue char ∉ {2,3}, n = 2 | π = id; π = f | U = strict localization at T = 0, η its generic point: T not a cube in κ(η), three roots permuted cyclically by μ₃ on (ℤ/2)³; (σ−1) not nilpotent on 𝔽₂[σ]/(σ³−1) = 𝔽₂ ⊕ 𝔽₄; π = f: X ×_Y Z = three branches S = ζS′, each ≅ Z, trivial action; direct image rank 3 off S′ = 0, rank 1 at S′ = 0 | Pass | None |
| Adapted: Artin–Schreier model, char 2, n = 3 | O[w,(1−w)⁻¹], T = w²/(1−w); u-model | 1/w² − 1/w = (1−w)/w² = T⁻¹; |u| ≤ 1 forces |T| ≥ 1 hence |T| = 1; Newton polygon of w² + Tw − T: both roots |w| = |T|^(1/2) < 1, |1−w| = 1, both in the w-model; d(f) finite étale of degree 2 over 0 < |T| < 1 | w-model needed, rank-two direct image as stated | None |
| Thm. 6.2 Check, char 2 | w = 1/u | |T| = |w|²; preimage of B(a,b), b < 1, is B(a^(1/2), b^(1/2)); dT/dw = 2w/(1−w) + w²/(1−w)² = w²/(1−w)² ≠ 0; degree 2 not invertible in K | Decomposition holds, Kummer refinement fails | None |
| Thm. 6.3 Check, odd m | g² − g = S^(−m) on an annulus | (g²)_j = g_(j/2)² for even j, else 0; j = −m: g_(−m) = 1; j = −2^j m: g_(−2^j m) = g_(−2^(j−1) m)² = 1; coefficient 1 at infinitely many negative indices diverges for inner radius < 1; the degree-2 étale algebra splits iff it has a root in O(annulus) | Pulled-back cover stays connected; tameness necessary | None |
| Unipotent ⇒ tame (Prop. 6.7(1)) | finite G acting unipotently on a finite ℤ/n-module | the group of filtration-preserving automorphisms trivial on graded pieces has successive quotients inside ⊕ Hom(gr_i, gr_(i−k)), ℤ/n-modules, so its order is a product of primes dividing n, invertible in O | Matches ITO20 lines 1542–1544 | None |
| Uniform annular Checks | identity; T ↦ T³, residue char 2, n = 3; AS cover; n = 1 | R⁰ = ℤ/n, δ = 1; rank 3 cyclic monodromy, own Kummer pullback constant, 3 = 0 in ℤ/3 never divided by; AS rank-two ℤ/3 local system constant after the degree-2 Galois cover only; n = 1 all 0 | Pass | None |
| Excellence of the descended base | residue characteristic p > 0; p = 0 | finitely generated ℤ_(p)-algebras are excellent; for p = 0, ℤ_(0) = ℚ (ITO20 line 1486 allows p ≥ 0) | Statement correct in either case | None |
| 4.1 approximation and positivity | c = 0, Y = ℙ¹; d = 0; y² = x³ − x over 𝔽₃(t) | identity data; Spec k₁; derivative 3x² − 1 = −1 ≠ 0 so the curve is smooth in char 3, x-map degree 2, deg g*O(1) = 2·1, H¹ dimensions 2 vs 0 | No cohomology isomorphism asserted; positivity holds | None |
| 4.6 endpoint | ℙ⁰, ℙ², split Tate cubic | eigenvalue 1; (1, q, q²) in degrees 0, 2, 4; Tate H¹ rank N = 1, grade weights 0, 2 | Rank-zero fan and bad reduction included | None |
| 4.7 Fermat and products | (p,e) with p ∤ e; e = p; empty product; ℙ¹ × ℙ¹ | partials e x_j^(e−1) have no common projective zero; e = p gives zero partials and a p-th power; point H⁰ = E; ranks 1, 2, 1 with eigenvalues 1, (q,q), q² | Smoothness controls pass | None |

No conclusion in the package uses natural-number subtraction, division by zero, an out-of-range index or the degree of a zero polynomial; the one field-independent Lean theorem carries `c ≠ 0` explicitly.

### Pinned libraries, headline signatures, elaboration and padding

The content checkout's manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `Suggested.lean` is unchanged apart from one docstring phrase; its single theorem `duality_splitting` was elaborated with the prescribed `lake env lean` from the content checkout: exit 0, the only output `declaration uses 'sorry'` at line 52:8 (3.7 s). A scratch copy with `#check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` elaborated; the printed type keeps all four `FiniteDimensional` instances, both `IsPerfPair` instances, `c ≠ 0`, the pairing law, the four `Representation`s, both intertwining hypotheses and the character law, and its conclusion is injectivity of `a` and `b`, `IsCompl a.range (q.flip ∘ₗ b).flip.ker` and stability of both subspaces: binder for binder the README §4.4 statement. Nothing changed. One-tactic probe on scratch copies: `first | simp | rfl | infer_instance` leaves the goal open (simp rewrites it to the five-part conjunction without closing it); `exact?` reports it could not close the goal. The theorem is not a restated definition, a mirrored Check, a small value or a boundary case: no padding. The module docstring names each headline not statable at the pins and what it lacks (§§0.5–0.10, 1.1–1.2, 2.1–2.5, 3.2–3.6, 4.1–4.3, 4.5–4.7); none of these carriers (relative local monodromy datum, normalized lisse geometric cohomology with its monodromy filtration, completed Kummer tower and tilt comparison, analytic étale sites and supports, toric models and the actual comparison) exists in Mathlib or Tau Ceti at the pins, as the round-2 table of native declarations (opened then at `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`, `Mathlib/RepresentationTheory/Basic.lean`, `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean`, `Mathlib/RingTheory/Perfection.lean`, `TauCeti/NumberTheory/LocalField/Tame/Character.lean` and the others) records; this round changed no Lean statement, so those rows stand. The Lean file has a single `import Mathlib`, no TauCeti import, no `set_option`, no `lemma`, no `instance`/`def`/`opaque`.

### Suppliers, ownership and the gap

Every citation the repair added was resolved at the copy the brief names:

| Citation | Resolved at | Found |
| --- | --- | --- |
| ClassicalAdicEtaleCohomology §5.4 `OrientedEtaleProduct.nearbyCycles_stalk`, `OrientedEtaleProduct.shred`, `PlurinodalAlteration.exists`, uniform amplitude bound, modification "allowed to depend on F" | open pull request head (#875, dfcb6b7), `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2711–2733` | All present with the stated meaning; the plurinodal corollary is de Jong's Theorem 5.9/Corollary 5.10, the same theorem as ITO20 Theorem 3.3. |
| ClassicalAdicEtaleCohomology §§3.2, 4.5, 10.3 (`annulusKummer`, O(A)^×/n ≅ H¹(A, μ_n), tame Galois covers of annuli standard), 10.5 (Huber 6.2.2 constructibility of R^q f_! for smooth separated qc f over a field base) | same head, lines 1205, 2069, 4899–4941, 5038–5062 | All present; §10.5 cites Ito Theorem 6.8, the step used at ITO20 line 1661. |
| ClassicalAdicEtaleCohomology §§1.1–1.5, 8.2–8.5, 9.6, 10.1–10.4, 11.1 (unchanged citations) | same head, headings at lines 92–608, 3549–4072, 4588, 4781–4978, 5100 | Present. |
| EtaleCohomologyFoundations §G.2 `nagataCompactification`; §§F.2, F.4.6 | main, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:105–111` | Present: qcqs base, separated finite type, no Noetherian hypothesis. |
| SchemeAndStackFoundations §4.19 `alteration_theorem`, §4.16, §0.9 | main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6372, 6038, 848` | Present; §4.19 is de Jong 4.1 with a regular projective output, generically étale over a perfect field. |
| ITO20 Theorem 5.3 as `gap:huber-compact-support-nearby-cycles` | ClassicalAdicEtaleCohomology §6.2 (lines 3176–3215) and §§8.3–8.4 at the head | Not provided: §6.2 states the scheme-level triangle RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F) → boundary and the ordinary tube comparison κ_X, κ_(X,L) for closed L ⊆ X_s; the analytic stalk (R^n d(f)_! F^a)_t̄ ≅ H^n_c(X̄_s, RΨ) is neither of these (the tube over X_s is open, not closed, in the tube of a compactification, so κ_(X,L) does not apply). A search of main and all open roadmap heads for "5.7.8" and for the analytic R d(f)_! stalk found no owner. |

The gap is precise (R strictly henselian microbial with fraction field L and a separable closure, f separated finite type, Λ torsion, stalk at the closed geometric point of Spa(L,R), Galois-equivariant, compatible with specialization maps: exactly ITO20 lines 1151–1201), minimal (not in Mathlib, Tau Ceti, this roadmap or any earlier roadmap), declared with the same slug in `design/plan.json` (the only change to that file, 6 added lines) and under the ClassicalAdicEtaleCohomology subsection of the README's supplier contracts, and its supplier is earlier in the merge order (line 62 against this roadmap's line 180). The pre-existing gap `analytic-comparison-automorphisms` is unchanged and remains a precise comparison contract.

Ownership by object: `roadmaps grep` over main and the 367 open roadmap pull requests (index of 2026-10-25) for "sliced nearby", "locally unipotent", "adapted to (f", "discriminant function", "tame at every", "Lütkebohmert", "Theorem 6.2/6.3" and "Uniform local constancy" found no roadmap stating the coefficient-uniform alteration, Orgogozo's propagation, adapted coefficients, the annular decomposition or the tame trivialization (the hits are unrelated theorems with the same numbers and the Gabber–Ramero almost-ring references). ClassicalAdicEtaleCohomologyPartII (#1549, later in the order) was included in that search and does not build them. The four readable board packages of the index were searched in round 2; the fifteen indexed heads that returned 404 then were not re-requested (see Not verifiable). This roadmap is the owner, as its Scope paragraph now says.

The prescribed dependency command completed with exit 0 and exactly this output:

~~~text
depcheck: 56 roadmaps, 645 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line. Every supplier named in the 36 Needs lines (SchemeAndStackFoundations, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, AdicSpacesPartII/III, AdicEtaleGeometry, PerfectoidSpaces, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LocalFieldsRamification, ArithmeticGaloisRepresentations, LefschetzPencilsAndVanishingCycles, DeligneWeightsAndPurity, AbelianSchemesAndArithmeticModuli, EtaleDualityAndPerverseSheaves, AnalyticToricGeometry and its Part II) is earlier in `merge-order/ORDER.txt` than line 180. `roadmaps resolve` for this README lists no cross-roadmap citation found nowhere; its four Lean-name leads (`nearbyCycles_stalk`, `adicFunctoriality`, `IsPureEnd`, `IsWeilNumber`) are planned supplier declarations, each present in the cited supplier's README as checked above and in round 2, not claims about the pins.

### Sources manifest

Seven records, unchanged keys. The ITO20 `locator` and the HUB96 `locator`/`cited_for` were extended by the repair, consistently with the body. No entry was added, removed or rewritten by this review; no source was fetched (the three uncertified texts are settled and were not requested).

## Not verifiable

- HUB98 Definition 1.4 and Theorems 2.1 and 3.6, LUT93 Theorem 2.2 and HUB96 Theorems 3.7.2, 3.8.1, Lemma 2.7.11 and Theorem 5.7.8 are settled as uncertified in the manifest; their formulations were checked as recalled in ITO20 (lines 99–106, 964–981, 1198–1201, 1662) and SCH12 Theorem 9.7 (line 2604), not in the originals.
- The fifteen board-package heads that returned HTTP 404 in round 2 (ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII, VectorBundlesAndIsocrystalsPartII) were not re-requested this round; none of their topics overlaps the uniform-neighbourhood objects owned here, so no ownership conflict is expected, but their files were not read.
- Orgogozo's Proposition 2.3.1 is cited through ITO20 line 398 ("see [23, Proposition 2.3.1]"); the original was not opened, and the manifest does not record it since the README cites it through ITO20.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, printed p. 307 (SCH12 line 2524): the source writes the tame character's argument as an unbound g inside the exponential; it should be the quantified inertia element σ; affects nothing.
- **Gap** in SCH12 at the proof of Theorem 9.6 and Lemma 9.9, printed pp. 309 and 311 (SCH12 lines 2607–2609, 2646–2651): the alteration's top cohomology is treated as one-dimensional without retaining geometric connectedness of the alteration over the global field; it should be chosen geometrically irreducible after a finite constant extension (DJ96 Remark 4.2); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "959da23", "job": "REV-PKG-DeligneWeightsAndPurityPartII~3", "model": "fable", "worker": "fable-rev123"} -->
