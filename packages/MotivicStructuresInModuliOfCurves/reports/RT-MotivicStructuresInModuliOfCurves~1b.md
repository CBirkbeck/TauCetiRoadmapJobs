<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6905320919 -->
Red team round 1 pass b (claude) of 64d2ae0

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §9.7 removes the semisimplification and reads off Hodge types through p-adic inputs for a stack that no supplier provides

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1392` (§9.7): "as rational Hodge structures and as `ℚ_ℓ[G_ℚ]`-modules, without semisimplification … the Hodge statement follows through the Betti–étale comparison and the `p`-adic comparison"; Needs line 1394; contract line 94.

   **Claim.** WeilConjectures WC.5 with "stack comparison, purity and duality inputs" gives `H^{2j}(M̄_{4,n}) ≅ L^{j ⊕ a}` unsemisimplified, and a p-adic comparison gives the Hodge statement.

   **Witness.** WeilConjectures §5.25 (head of its open pull request): the Deligne–Mumford version holds "only with the stack extension of the comparison and local p-adic inputs", and its Needs name PadicHodgeTheory §§5.3 and 8.1. The README names no p-adic Hodge supplier, target or gap anywhere; line 94 lists only trace, comparison, purity and duality.

   **Repair.** Route the two clauses through targets the roadmap already owns; no p-adic input is then used.

   - In §9.7 replace the Route by: "Route: for `n ≤ 3` every pair `(g′, n′) ≼ (4, n)` lies in the ranges of §5.4 (`g′ = 4`, `n′ ≤ 3`; `g′ = 3`, `n′ ≤ 5`; `g′ = 2`, `n′ ≤ 7`; `g′ = 1`, `n′ ≤ 9`; genus zero), so `W_kH^k(M_{g′,n′}) = RH^k(M_{g′,n′})` there, and induction on the stable-pair order with §0.4 gives `H^*(M̄_{4,n}) = RH^*(M̄_{4,n})`. Hence odd cohomology vanishes and `H^{2j}` is spanned by cycle classes of codimension `j` of cycles defined over `ℚ`: it is a sum of copies of `L^j` as a Hodge structure and as a `ℚ_ℓ[G_ℚ]`-module, with no semisimplification, a representation spanned by vectors on which `G_ℚ` acts through one character being semisimple. The multiplicity is `a_{n,j}` by §9.5 and the trace formula. The all-`Spec ℤ` theorem of WeilConjectures, WC.5 is not used here: for a Deligne–Mumford stack it needs potential semistability at `ℓ` of the stack's `ℓ`-adic cohomology, which no supplier states."
   - Replace the Needs line by: "*Needs:* §§0.4, 5.3, 5.4, 9.5; MotivesAndAlgebraicCycles, gap:dm-stack-cycle-class; WeilConjectures, WC.1 (stack trace and Artin comparison) and WC.6; MixedHodgeModulesAndIrregularHodgeTheory, gap:dm-stack-mixed-hodge."
   - In "How to read the build" (line 154) replace "they are independent of Layers 4–7" by "they are independent of Layers 4–7, except that §9.7 uses §5.4"; add "Layer 5 (§§5.3–5.4)" to the Dependencies of Layer 9 (line 1464).
   - Replace the last sentence of the statement paragraph of §9.7 (line 1392, "A single characteristic polynomial … is used.") by: "A characteristic polynomial of Frobenius would not split a global extension; the splitting comes from the cycle classes."

   Tested: the ranges are `2g′ + n′ ≤ 11`, giving `n′ ≤ 5, 7, 9` in genera three, two, one, inside `c = 11, 10, 10`; §5.4 needs only §§5.2, 5.3, 0.1, 0.6, so no cycle arises. The alternative repair is a new gap on PadicHodgeTheory §§5.3 and 8.1 (de Rham property and Hodge–Tate comparison for smooth proper Deligne–Mumford stacks over `ℤ`).

2. **F02** (P2) the supplier is cited for a cohomology comparison it does not state

   **Location.** `README.md:146` (contract): "acting properly discontinuously with finite stabilizers, so `H^*(M_{g,n}, ℚ) ≅ H^*(Mod_{g,n}, ℚ)`"; `README.md:386` (§2.1 route); `README.md:544` (§3.4 route: "by §2.3 of MappingClassGroupsAndCanonicalRepresentations").

   **Claim.** MappingClassGroupsAndCanonicalRepresentations §2.3 gives the identification of the rational Betti cohomology of the stack with group cohomology.

   **Witness.** That §2.3 (head of its open pull request) proves contractibility of `T(g, n)`, the proper action, `M_{g,n}^an = [T(g, n)/PMod(g, n)]` and the orbifold fundamental group. It states no cohomology isomorphism; a search of that README for `H^*(PMod`, "rational cohomology of" finds none.

   **Repair.** Own the step in §2.1.

   - In §2.1, before "Route:", insert: "Prove first the comparison: for a discrete group `Γ` acting properly discontinuously with finite stabilizers on a contractible complex manifold `T`, the rational Betti cohomology of the analytic stack `[T/Γ]` is `H^*(Γ, ℚ)`. Both are the rational cohomology of the Borel construction `T ×_Γ EΓ`: its projection to `BΓ` has contractible fibre `T`, and its projection to the coarse quotient `T/Γ` has fibres the classifying spaces of the finite stabilizers, whose rational cohomology is trivial. With MappingClassGroupsAndCanonicalRepresentations §2.3 this gives `H^*(M_{g,n}, ℚ) ≅ H^*(Mod_{g,n}, ℚ)`."
   - In the contract (line 146) replace "so `H^*(M_{g,n}, ℚ) ≅ H^*(Mod_{g,n}, ℚ)` with `Mod_{g,n}` the pure mapping class group (written `PMod(g, n)` there)" by "with `Mod_{g,n}` the pure mapping class group (written `PMod(g, n)` there). Assumed: no statement on cohomology; the comparison `H^*(M_{g,n}, ℚ) ≅ H^*(Mod_{g,n}, ℚ)` is §2.1".
   - In §3.4 replace "by §2.3 of MappingClassGroupsAndCanonicalRepresentations, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`" by "by the comparison of §2.1, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`"; the Needs of §§2.2 and 3.4 already list §2.1.
   - Add to §2.1 the Check: "For `M_{1,1}`, `T` is the upper half-plane and `Γ = SL₂(ℤ)`: `H^*(SL₂(ℤ), ℚ) = ℚ` in degree zero, the rational cohomology of the coarse space `𝔸¹`."

   Tested on `M_{1,1}`: both sides are `ℚ` in degree zero.

3. **F03** (P2) §3.2 route: the lowest-weight part of `H¹(M_{1,1}, V^{⊗(k−1)})` is not `S_{k+1}`

   **Location.** `README.md:520` (§3.2): "the Leray decomposition and Künneth leave the summand `H¹(M_{1,1}, V^{⊗(k−1)})`, whose pure part is `S_{k+1}` by Eichler–Shimura (§0.5)".

   **Claim.** `W_kH¹(M_{1,1}, V^{⊗(k−1)}) = S_{k+1}`.

   **Witness.** `k = 13`: by §3.6, `V^{⊗12} ⊃ (Sym^{10}V ⊗ L)^{⊕μ(12,10)}` with `μ(12, 10) = 12 − 1 = 11`, and `W₁₁H¹(M_{1,1}, Sym^{10}V) = S₁₂`; so `W₁₃H¹(M_{1,1}, V^{⊗12}) ⊇ (L S₁₂)^{⊕11} ≠ 0 = S₁₄`. The step is taken from the source's proof (clp lines 216–217 and 257–258).

   **Repair.** Replace the quoted clause by: "the Leray decomposition and Künneth write `W_kH^k(E^{n−1})` as a sum of groups `W_kH^p(M_{1,1}, R^{i_2}π_*ℚ ⊗ ⋯ ⊗ R^{i_n}π_*ℚ)`. Summands with some `i_s = 2` are pushed forward from the loci where a point meets the origin and die on `M_{1,n}`; `H²` of the affine curve `M_{1,1}` vanishes rationally; this leaves the groups `W_kH^p(M_{1,1}, V^{⊗q})`, `p ≤ 1`, `p + q = k`, one for each choice of `q` of the `n − 1` factors. By the decomposition of §3.6, `V^{⊗q} ≅ ⊕_j (Sym^jV ⊗ L^{(q−j)/2})^{⊕μ(q,j)}`; the summands with `j < q` are the images of the insertions of the symplectic class, which is the class of a diagonal modulo Künneth components with an index `0` or `2`, so they die on `M_{1,n}` as in §4.2. The remaining summand `Sym^qV` has `H⁰ = 0` for `q > 0` and `W_kH¹(M_{1,1}, Sym^{k−1}V) = S_{k+1}` by Eichler–Shimura (§0.5)". Add the Check: "The lowest-weight part of `H¹(M_{1,1}, V^{⊗(k−1)})` is larger than `S_{k+1}`: for `k = 13` it contains `(L S₁₂)^{⊕11}`, from the eleven copies of `Sym^{10}V ⊗ L` in `V^{⊗12}`, while `S₁₄ = 0`; these classes come from diagonals and vanish on `M_{1,13}`, in agreement with `W₁₃H¹³(M_{1,13}) = 0`."

   Tested at `k = 13`: after removing the insertion summands only `Sym^{12}V` remains, with `S₁₄ = 0`, as the statement requires; in `e_c(M_{1,13})` the term `+715 L S₁₂` of `c₁₃ · (−S₁₂ − 1)` has the sign of an even compactly supported degree, consistent with `Gr^W_{13}H_c^{13}(M_{1,13}) = 0`.

4. **F04** (P3) §2.2 states `g ≥ 1` on a source whose hypothesis is `g ≥ 2`

   **Location.** `README.md:397` (§2.2): "`H^{4g−3}(M_{g,1}, ℚ) = 0` for `g ≥ 1` (CFP, Theorem 1, which treats the closed surface and the surface with one marked point".

   **Claim.** The cited theorem covers `g = 1`.

   **Witness.** cfp line 24: the theorem is stated "For any g ≥ 2"; bfp lines 221–231 assume `g ≥ 1` and cite only that theorem and MSS. The first Check of §2.2 asserts the `g = 1` value without a route.

   **Repair.** After "for `g ≥ 1`" insert "(for `g ≥ 2` by CFP, Theorem 1, …" keeping the present citation, and add before "No analogous statement": "For `g = 1` the statement is `H¹(Mod_{1,1}, ℚ) = Hom(SL₂(ℤ), ℚ) = 0`: `SL₂(ℤ)` is generated by elements of orders four and six, so every homomorphism to `ℚ` is zero." Tested: `SL₂(ℤ)^{ab} = ℤ/12`.

5. **F05** (P3) §10.6: the Needs line omits the inputs for genus at most one and for lower degrees

   **Location.** `README.md:1529–1531` (§10.6): "§4.2 and §10.3 reduce all pairs to the stated finite range through §4.5 … *Needs:* §§4.2, 4.5, 10.3, 10.4."

   **Claim.** §§4.2 and 10.3 dispose of every triple outside `g ≤ 9`, `n ≤ 6`.

   **Witness.** For `(g, n) = (2, 7)`, §4.5 requires the triple `(1, 7, 6)` (`(1, 7) ≺ (2, 7)`, `2d′ − 6 = 8 ≤ 14`): it is outside the hypothesis (`n ≤ 6`), §4.2 needs `g ≥ 2` and §10.3 needs `g ≥ 10`. Triples with `k′ = 4` need §10.2.

   **Repair.** Replace the sentence by "§4.2 (genus at least two, `n ≥ 6`), §3.2 (genus one, where `W₆H⁶(M_{1,n}) = 0`), §2.6 (genus zero) and §10.3 reduce the degree-six triples to the stated finite range, and §§10.1–10.2 dispose of the triples of degree at most four, through §4.5", and the Needs line by "*Needs:* §§2.6, 3.2, 4.2, 4.5, 10.1, 10.2, 10.3, 10.4." Tested: `(1, 7, 6)` is now covered by §3.2 and `(0, 8, 6)` by §2.6.

6. **F06** (P3) the Summary's list of end theorems omits one that `Suggested.lean` lists as a headline

   **Location.** `README.md:3` (Summary, "Its end theorems are: …") and `README.md:7` ("every end theorem listed in the summary"); `packages/MotivicStructuresInModuliOfCurves/Suggested.lean:31–32`.

   **Claim.** The headline theorems of the README and of the module docstring agree.

   **Witness.** `Suggested.lean:31` lists "the cohomology of `M̄_{3,n}` for `n ≤ 11` is a polynomial in `L` and `S₁₂` (README §12.10; … Theorem 1.9)"; the Summary lists eight results and not this one, so the ownership sentence of line 7 does not cover §12.10.

   **Repair.** Append to the Summary, before the final full stop: "; and every `H^k(M̄_{3,n})^ss`, `n ≤ 11`, is a polynomial in `L` and `S₁₂` (CLP, Theorem 1.9)".

Six findings: one P1, two P2, three P3. Both files were read in full (`README.md`, 1918 lines; `Suggested.lean`, 46 lines).

## The adversarial pass: computed instances

`Suggested.lean` declares nothing, so there is no Lean declaration row; the elaborated-signature lead `and` in the worker's scratch file is a word of the module docstring, not a declaration. No Lean was run.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, duality | `U = 𝔸¹`, `d = 1` | `W₀H⁰ = ℚ`, `Gr^W_0H_c^0 = 0`, `Gr^W_2H_c^2 = ℚ(−1)`; weight of `(W_{2d−k}H^{2d−k})^∨(−d)` is `−(2d−k) + 2d = k` | holds | none |
| §0.2 `κ₀` | `(0,3)`, `(1,1)`, `(7,0)` | `1`, `1`, `12` | holds | none |
| §0.3 order | `(0,4)` vs `(1,2)`; `(g−1, n+2)` vs `(g, n)` | `2g+n`: `4 = 4`, genus `0 < 1`; `2(g−1)+n+2 = 2g+n` | holds; agrees with bfp line 335 | none |
| §0.4 second sequence | weight of `H_k^{BM}(M) = H^{2d−k}(d)` | weights `≥ −k`, lowest `−k` | holds | none |
| §1.1 Check | `ℙ¹`, types `(2)`, `(1,1)` | `2·(q²−q)/2 = q² − q`; `(q+1)q` | holds | none |
| §1.4 `Δ` | `p₁²`, `p₂`; `V(0,3) = ℚ` | `h`, `h`; `MV(0,4)` of dimension `3` | holds | none |
| §1.5 Check | two-edge point stratum of `M̄_{1,2}`; `Spec 𝔽_{q³}` with `C₃` | edge swap `−1` on `det`; class function `(0,0,3)` | holds | none |
| §2.1–2.3 | `n = 0`, `n = 1`, `n ≥ 2`; `(4,1)` | `2d − (4g−5) − 1 = 2g − 1`; with §2.2 `k < 2g`; `2d − (4g−4+n) = 2g−2+n`; `(4,1)`: `20 − 13 = 7` | holds | none |
| §2.2 | `g = 1` | `Hom(SL₂(ℤ), ℚ) = 0`; cited theorem has `g ≥ 2` | locator gap | R04 |
| §2.5 base regions | `k = 5, 7, 9` | `k=5`: `(1,≤5),(2,≤3)`; `k=7`: `(1,≤7),(2,≤5),(3,≤3)`; `k=9`: adds `(1,8),(1,9),(2,6),(2,7),(3,4),(3,5),(4,≤3)` | all inside §1.6 ranges or genus four | none |
| §2.6 | `M̄_{0,5}` | `b₂ = 5`, ten boundary divisors | holds | none |
| §3.1 Check | `g = 1`, `n = 2` | traces `+3`, `−3` on `Sym²V` | holds | none |
| §3.2 route | `k = 13` | `W₁₃H¹(M_{1,1}, V^{⊗12}) ⊇ (LS₁₂)^{⊕11}`, `S₁₄ = 0` | route step false | R03 |
| §3.2 statement | `n = k = 11`; `n = 12, k = 11`; even `k` | ranks `2`, `22`; `0` | holds | none |
| §3.5 | `g = 10`, `g = 9` | `(2g−2)/3 = 6`, `16/3` | holds | none |
| §3.6 genus one | `n = 11, …, 15`, `S₁₂`; `n = 15`, `S₁₆` (script, exact) | `1`; `11 + 11L`; `66 + 429L + 66L²`; `286 + 6006L + 6006L² + 286L³`; `1001 + 53053L + 186263L² + 53053L³ + 1001L⁴`; `1` | all as stated, each symmetric about `d = n` | none |
| §3.6 `c_m` | `m = 12, 13` | `11L − 55`; `66L² − 715L + 1925` | holds | none |
| §3.6 genus two | `(a,b) = (0,0)` | `(L² + L²)/2 = L²`; `L³ + L² − L² = L³` | holds | none |
| §4.2 | `n = k`; `n = 1` | quotient `W_kH⁰(M_g, V_λ) = 0`; `i_s = 2` forces `i_{s′} = 0` when `n ≥ k` | holds; agrees with clp lines 375–379 | none |
| §4.5 | `S = RH`, `(1,12,11)`; boundary factor triples | printed hypothesis satisfied, `RH¹¹ = 0 ≠ 22`; `2d₁ − a = 2d − k − (2d₂ − b) ≤ 2d − k` | corrected criterion consistent | none |
| §4.6 Check | `(n, k) = (13, 15)`, four graphs | contractions `(1,15)`, `(1,13)`, `(2,12)`, `(1,14)`; `T^k_n ≠ 0` needs `k ≥ 24`, `n ≥ 21` | holds | none |
| §4.9 | `k′ = 4`; `k′ = 13`; `(1,11,11)` | `g′ ≤ 6`; genus one `n′ = 13`, genus two `9 ≤ n′ ≤ 13`; in region | holds; agrees with clp line 74 | none |
| §4.10 | `k = 13` | genus one `n ≤ 13`, genus two `n ≤ 11` | holds | none |
| §5.4 | table `c(g)` | `∞, 10, 10, 11, 11, 7, 5` (and `3`) | agrees with clp line 534 | none |
| §6.1 | `ρ(7,1,5)`, `ρ(7,1,4)` | `1`, `−1` | holds | none |
| §7.1, §7.5, §7.6 | dimensions and ranks | `45 − 35 = 10`; `9·7 = 63`, `63 − 45 = 18 = dim M₇`; `21 − 16 = 5` | holds | none |
| §8.1 | general `g`; `g = 4`, `q = 5` | `(q−1)(q^{2g+2} − q^{2g})/((q²−1)(q²−q)) = q^{2g−1}`; `37500000 = 480 · 78125` | holds | none |
| §8.3 | `n = 2`, `n = 3` | `(q+2)q^{2g} − 1`; `a²`-coefficient `3q`, `(q²+3q−1)q^{2g} − 3q` | holds | none |
| §8.4 | orders | `q⁴(q−1)²(q+1)`; `2q²(q⁴−1)`; `2(q³−q)²`; `72` at `q = 2` | holds | none |
| §8.8 | `s₂, s₃` of both quadrics | `0`, `q⁴ + q²`; `2(q³+q²+q)`, `−q⁴ − 2q³ − q²` | holds | none |
| §8.9 | `n = 0`, `n = 1` | `q¹²(q−1)²(q+1)/#Aut = q⁸`; `q¹¹(q−1)²(q+1)(q²+q−1)/#Aut = q⁹ + q⁸ − q⁷` | holds; terms agree with bfp lines 774, 795–798 | none |
| §8.10 | `n = 0` | `q¹⁵ − q¹² − q¹¹ + q⁸ + q⁷ + q⁶ + q⁵ + q⁴`; quotient `½(q⁹ − q⁶) + ½(q + 1) + O(q⁻¹)` | holds | none |
| §§8.3, 8.9–8.11 summed | `n = 1, 2, 3` | `q¹⁰ + 2q⁹ + 2q⁸ − q⁷ − q⁶`; `q¹¹ + 3q¹⁰ + 4q⁹ − 2q⁸ − 4q⁷ + 0·q⁶`; `q¹² + 4q¹¹ + 7q¹⁰ − 4q⁹ − 13q⁸ + 4q⁷` | equal the §9.6 rows at the stated precisions | none |
| §8.14 | `m_λ`; `λ = (2)` total | `q⁴ − q`, `q⁴ + q²`, `q⁴ + q² − 2q`; `q⁶ + q³ − q² − q`, `q⁶ − q²`, `q⁶ + 2q³ − q² − 2q`; `q¹¹ + q¹⁰ + 2q⁹ − 2q⁸ + q⁵ − 1` | holds | none |
| §9.1 | power sums to Schur | `(2, −6, 0)`; identity automorphism `h = 4`; genus-two involution `h = 0` | holds; agrees with gorsky lines 217–220, 243–244 | none |
| §§9.4–9.6 | closed minus boundary, all four rows; `q = 1` | rows of §9.6 exactly; `2`, `−10`; leading boundary coefficients `3, 4, 8, 17` = numbers of boundary divisors | holds; agrees with bfp lines 111–117, 133–136, 1299–1305 | none |
| §9.7 | route inputs | WeilConjectures §5.25 needs p-adic inputs for stacks; README supplies none | unowned | R01 |
| §9.9 | dimension specialisation; `q = 1` | `1, 21, 207, 1168, 3977, 8296, 10605`; `1, 11, 76, 319, 838, 1362`; open `(2, −6, 0)` | holds; agrees with bfp lines 1388–1395 | none |
| §9.10 | `n = 1`, `n = 2` through local systems | `q¹⁰ + 2q⁹ + 2q⁸ − q⁷ − q⁶ − q²`; `q¹¹ + 3q¹⁰ + 4q⁹ − 2q⁸ − 4q⁷ − 2q³ − 2q²` | equal §9.6 | none |
| Examples, Layer 9 | `#M̄₄(𝔽₂)` | `7965` | holds | none |
| §10.4 | region for `k ≤ 14`, `g ≥ 3`; genus two | `(3,≤10), (4,≤8), (5,≤6), (6,≤4), (7,≤2)` inside `c`; `2d − k ≤ n + 4 ≤ 16 ≤ 20` | holds | none |
| §10.6 | `(2,7)` with triple `(1,7,6)` | not covered by §§4.2, 10.3 | Needs incomplete | R05 |
| §10.7 Check | `(0,4)`, `k = 0` | `ker α = 0`, `C¹/im α = ℚ²` | holds | none |
| §§10.8–10.9 | base regions; loop graph `Γ_B` | `(2,≤9), (3,≤7), (4,≤5), (5,≤3)` inside `c`; swap acts `(−1)(−1) = +1` | holds | none |
| §11.4–11.9 counts | sums | `286+11+132 = 429`; `1001+4004+11+132+858 = 6006`; `66+132+66 = 264`; `891 − 66 = 825`; `825 + 11 = 836`; `12!/(10!2!) = 66` | holds; agree with clp lines 1051, 1069–1092 | none |
| §§12.1–12.2 | base regions and exceptions | degree 13: `(1,11),(1,12),(1,13),(2,11)`; degree 15: `(1,11..15)`, `(2,11..13)`; hard Lefschetz `H¹³ → H¹⁵` at `d = 14`, `H¹⁵ → H¹⁷` at `d = 16` | holds | none |
| §12.7 | `(8,0)`, `(8,1)`; `(7,≤3)` | `16 > 15`; inside `c(7) = 3` | holds | none |
| §12.8 | Künneth `(15,0)` parts | `H^{11,0} ⊗ H^{4,0} = 0`, `H^{13,0} = 0` | holds | none |

## Dependency check

    depcheck: 239 roadmaps, 2260 edges, 0 problem(s)

No UPWARD or CYCLE line. VirtualFundamentalClass and CanonicalModelsAndGonality are other authors' open pull requests that add new roadmap folders; every other supplier is on main or earlier in the merge order.

## Verified sound

- Declarations read: 0 (`Suggested.lean` has a module docstring and an empty namespace; a single `import Mathlib`; no `set_option`, `lemma`, `sorry`'d data or stand-in). Its eight headline theorems are all statements about `M̄_{g,n}`, `M_{g,n}`, their cohomology, point counts or Chow rings; none is statable at the pins, which have no algebraic stacks or stable curves. No padding.
- Targets read: 111 numbered sections, each with a Needs line; every definition has at least three Checks.
- Locators verified against the cached texts: about 70, in clp, bfp, clp-h11, kresch, arsie-vistoli, gorsky, kannan, getzler-semiclassical, cfp, mss, wahl, madsen-weiss, looijenga-stable, arbarello-cornalba, petersen-genus-one, petersen-genus-two, petersen-abelian-surfaces, petersen-tavakol-yin, bergstrom-hyperelliptic, bergstrom-genus-three, canning-larson, canning-larson-genus-seven and keel (page numbers of clp and bfp checked against the page markers).
- Checks recomputed: about 120, with the values in the table above.
- Sibling citations checked: 19 supplier roadmaps, about 80 section or layer ids (headings), each at main or at the head of its open pull request; contents read for StableReductionPartII §§4.14 and 5.15, SchemeAndStackFoundations §5.7 (`chow_blowup_formula`), EquivariantIntersectionTheory §§2.3 and 3.3, HabiroNahmSeries §5.1, PELModuli §M5.2, WeilConjectures WC.1 item names and §§5.22–5.27, 6.8, MappingClassGroupsAndCanonicalRepresentations §2.3, VirtualFundamentalClass §§2.1–2.4 headings.
- Pinned declarations: the five Mathlib names and files of the contract, `quadraticChar`, `quadraticChar_sum_zero`, `Mathlib/Algebra/IsPrimePow.lean`, `TauCeti.spinPlus`, `spinPlusAction`, `spinPlusSubrep`, `finrank_spinPlus`, `repRing`, `repRingCharacter`, the period-polynomial dimension theorem and the `TauCeti/Geometry/Hodge` directory all exist at the pins in the files named.
- Gaps: the eight slugs of the README are the eight of `design/plan.json`, with the same suppliers and sections.
- Policy: the pull request changes only the package folder; no pull-request numbers or process words in the README or the docstring.
- The corrections to the sources at README lines 1865, 1867, 1877, 1878, 1883, 1884 (the genus formula only) and 1885 were confirmed against the texts; the others were not re-derived.

## Not verifiable

- The Graber–Pandharipande class of §4.3, second Check: the README follows clp line 114, which places it in degree 22 on `M̄_{2,20}`; the pushforward of a diagonal of dimension 11 has cohomological degree 24. The primary source is not in the cache. The Check's conclusion survives either way, since a tautological ample class identifies `H²²` with `H²⁴` at `d = 23`.
- Harer's theorem (§2.1) and Mukai's theorem (§7.3): recorded as uncertified; cited by locator only.
- The 891-row matrix of §11.7 and the family sizes of CLP Figure 2: the figure is not legible in the extraction; only the sums were checked.
- The sieve terms with markings of §§8.9–8.11 and 8.14 were checked through their sums and against the final counts, not term by term.
- The stability ranges for punctured surfaces in §3.4 were checked for the closed and bounded cases against wahl lines 44–53 only.
- Ownership against the board's other packages was checked only for the names in the supplier contracts; a second roadmap named VirtualFundamentalClasses sits later in the merge order and was not compared with VirtualFundamentalClass.

## Source issues

- **Gap** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source requires only smaller triples of degree at most two less; it should also require the same-degree triples with fewer markings, which its proof uses; affects a stated result.
- **Error** in clp at the proof of Proposition 2.2, pp. 5–6: the source says the lowest-weight part of the first cohomology of the full tensor power is the cusp realization; it should be that of the symmetric power, the other summands dying on diagonals; affects the proof.
- **Gap** in clp at Lemma 3.2, p. 10: the source says the generated extension contains every boundary pushforward; it should exclude pushforwards of two odd genus-one classes, unproved in even degrees from 24; affects a stated result.
- **Misprint** in clp-h11 at Corollary 2.5, p. 7: the source says the restriction to divisors with ten markings is injective for every number of markings; it should require at least twelve markings; affects nothing.
- **Misprint** in bfp at §10.1, p. 1355: the source says the coefficient minus eleven of the open three-pointed count multiplies the fourth power; it should multiply the cube, as in its Theorem 1.5; affects nothing.
- **Misprint** in bfp at Remark 2.2, p. 1328: the source says Proposition 2; it should be Proposition 2.1; affects nothing.
- **Misprint** in getzler-semiclassical at the final table, row fourteen, p. 491: the source says the weight-twelve cusp coefficient has three terms; it should have four, symmetric, with linear coefficient 6006 and constant 286; affects nothing.
- **Misprint** in gorsky at Theorem 3.8, p. 6: the source says the quotient genus is half of one minus the sum of exponents; it should be one minus half the sum, as its equation (3) gives; affects a stated result.
- **Misprint** in kannan at Remark 3.8, pp. 11–12: the source says the corrected sum of exponents stops one index early; it should include the last, negative exponent; affects nothing.

## Copyright, licences and scope

Wording: the statements and routes of §§0.6, 2.3, 3.2, 4.2, 4.3, 4.4, 5.2, 5.3, 8.9 and 10.6 were set beside kresch lines 213–229, bfp lines 221–231 and 779–790, and clp lines 57–59, 220–224, 309–314, 375–379, 408–430, 465–472, 492–516 and 963–967. The longest shared run is four words ("and hence the vertex", bfp line 783); the lists of §5.2 and §4.2 state the same mathematical facts in the roadmap's own sentences. Arrangement: CLP has the largest share. Its sections 2–8 and Layers 4–7 and 10–12 run in the same order, but not one to one: Layer 4 joins CLP §§2–3 with CLP-H11 §2; Layers 6–7 split CLP §5; Layer 10 joins CLP §6 with CLP-H11 §4; Layer 12 takes the proofs of Theorems 1.6–1.7 from CLP §7 together with §8; Layers 1–2 and 8–9 are BFP's and Layer 3 is assembled from four sources. The order is forced by the Needs lines: §10.4 needs §7.7, §12.1 needs §11.10, §12.9 needs §§10.5 and 12.3. Reuse: the polynomials of §§9.4–9.6, 9.9 and 9.10 are the statements of BFP's theorems, written in the roadmap's own tabular form; the quotient tables of §§8.9–8.11 and 8.14 are sums the roadmap computes from BFP's individual terms.

Source independence: 12 passages compared with 3 sources (clp, bfp, kresch), none shared; largest share clp, 96 of 303 source mentions; contents compared with clp: independent.

## For the human reviewers

- **Licence.** `sources.toml` records clp and bfp as `author-page` copies of published articles (Forum of Mathematics, Pi; Annals of Mathematics); the hosts were not re-examined in this pass.
- **Licence.** The polynomials of README §§9.4–9.6, 9.9 and 9.10 restate numerical results of bfp (Theorems 1.4, 1.5, 11.1, 11.5 and Proposition 9.6) as target statements, with locators.
- **Scope.** The kannan source (arXiv:2602.09117, 2026) is an unpublished preprint; it is cited only in README §9.1 and line 1885, for a remark on a misprint in gorsky.
- **Not tested.** harer-vcd and mukai are uncertified: README §§2.1 and 7.3 cite them by locator, and their texts were not compared with the roadmap's wording.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "64d2ae003ed97112f7932dcc8370a048d704df6c", "job": "RT-MotivicStructuresInModuliOfCurves~1b", "model": "fable", "worker": "chris-x80"} -->
