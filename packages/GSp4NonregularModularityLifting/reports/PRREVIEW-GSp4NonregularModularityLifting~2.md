# Review of GSp4NonregularModularityLifting (pull request #1817 at 11b3de3)

**Verdict:** accepted

Incremental re-review of the 20 lines changed since f9628b0 (one file, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md`, 11 insertions and 9 deletions; nothing outside the folder). Both findings of the previous review are repaired, the repairs introduce no new problem, the gate passes at this head, the dependency check shows no UPWARD or CYCLE line, and `Suggested.lean` elaborates cleanly. No finding remains.

## Previous findings

- R01 — repaired: §4.7 now states the exact criterion "Δ∨ equals nΔn′ for some elements n,n′ of SL₂(ℤ) normalizing Γ exactly when diag(1,p)∈N(H) diag(p,1) N(H) modulo N" and the level-H Check now concludes "Δ∨=nΔn⁻¹ … excluding one-sided compositions alone does not make Δ∨ a second correspondence either"; the two new Checks (Γ(3)∩Γ₁(5), and the nonsplit torus modulo 13) witness the two remaining cases. Every claim of the rewritten passage was recomputed (table below).
- R02 — repaired: the ShimuraData contract now reads "This roadmap's §0.2 specializes these dictionaries to the singular bundles used in this roadmap." The same qualification was applied, correctly, to five sibling references (§11.2, §2.3, §2.8, Layer 6, §3.2), each of which resolves to the section of this README with the cited content.

## Verified sound

**Gate, dependency check, build.** The worker's gate at 11b3de3: every scanner 0, build OK. Re-run of the full gate here: every scanner 0, `OK`. Dependency check: `depcheck: 234 roadmaps, 2161 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` from the worktree: no output, exit 0 (the file declares nothing, as the previous review found correct: no headline of this roadmap is statable at the pins). Outside-folder diff against `origin/main`: empty.

**The qualified references (R02 and its siblings).** Each "this roadmap's §…" was resolved in this README at this head: §0.2 "Weight and Frobenius dictionary" (line 230, specializing the ShimuraData dictionaries to the singular bundles); §2.3 "All-degree characteristic-zero interpolation" (line 475, the singular-weight coherent Galois representations whose expected de Rham behaviour ModularityAndLanglandsExtensions §0.4 records); §2.8 "Completed eigenspace isotypy" (line 570, where Frobenius-polynomial annihilation uses ArithmeticGaloisRepresentations §7.6, see its *Needs:* line); Layer 6 (line 966, the Klingen scalar v_Q and its inverse v_Q⁻¹∘tr); §11.2 "The dyadic and odd-prime automorphic seeds" (line 1553, seed alternatives A at p=2 and B at p>2, so the tidiness citation to alternative B and the strong-residual-oddness citation to alternative A are both right); §3.2 "Secondary Hasse geometry" (line 630, whose *Needs:* line cites FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1–R07.2 for the multiplicative-connected filtration and BT₁ crystal). The supplier section numbers in the same paragraphs are unchanged from f9628b0 and were resolved at the open heads in the previous review.

**The rewritten §4.7 passage.** Checked by hand and by exhaustive enumeration in SL₂(𝔽₅) (120 elements) and SL₂(𝔽₁₃) (2184 elements), with the normalizers computed from the definition.

- The criterion. For Γ ⊇ Γ(N), p ∤ N, H the image of Γ, elements of SL₂(ℤ) normalizing Γ are exactly the lifts of N(H) (Γ is the full preimage of H and SL₂(ℤ) → SL₂(ℤ/N) is onto). The (SL₂(ℤ)×SL₂(ℤ))-stabilizer of a determinant-p matrix M = gDh is g Γ₀(p) g⁻¹ (for M = D it is {c ≡ 0 mod p}), which maps onto SL₂(ℤ/N) since SL₂(ℤ/pN) = SL₂(ℤ/p) × SL₂(ℤ/N); so the number of Γ(N)×Γ(N)-orbits on determinant-p matrices is |SL₂(ℤ/N)|, the number of residues of determinant p, and residues classify the orbits. Hence ΓMΓ ↔ H M̄ H, and with n̄, n̄′ ∈ N(H), H n̄ D̄ n̄′ H = n̄ H D̄ H n̄′ contains D̄∨ for some n̄, n̄′ iff D̄∨ ∈ N(H) D̄ N(H). The passage's criterion and its justification are right; the four named special cases (n′ = n = 1; n′ = 1; n = 1; n′ = n⁻¹) are the stated ones.
- Principal level: n = [[0,1],[−1,0]] gives n diag(p,1) n⁻¹ = [[0,1],[−p,0]]·[[0,−1],[1,0]] = diag(1,p). Enumeration mod 5 with H trivial: D̄∨ ∈ N D̄ N, and four n̄ with D̄∨ = n̄ D̄ n̄⁻¹ ([[0,1],[4,0]], [[0,2],[2,0]], [[0,3],[3,0]], [[0,4],[1,0]]).
- Γ₁(N)-type level: n ≡ diag(p⁻¹,p) is diagonal, so it normalizes {[[1,b],[0,1]]}, and n̄ D̄ = diag(1,p) = D̄∨ with n′ = 1. Mod 5 with p = 7: diag(3,2)·diag(2,1) = diag(6,2) = diag(1,2) (computed).
- CG20 locators: Definition 8.19 at CG20 line 2773 and Lemma 8.20 at line 2793, both on the extraction's page 72 = printed 872; Lemma 8.20's proof replaces Q by g·Q with g ∈ SL₂(ℤ), i.e. full level, as the passage says.
- Ownership: the residue-classification lemma is a step inside the §4.7 target, not a restated construction. Mathlib at the pin has the generic double coset `DoubleCoset.doubleCoset` (`Mathlib/GroupTheory/DoubleCoset.lean` line 37, with its quotient at line 79) and nothing on determinant-p matrices or Hecke correspondences; `roadmaps grep` for "neighbor reciprocity", "F_Δ∨" and "double coset … determinant p" finds only this roadmap. Ownership against open pull requests was checked only for the heads this brief lists.

**Seeded sample.** Of this round's sample only "4.8 The two Hasse-projection injections" is touched by the diff, through its premise §4.7 (the scalar p-primitive/minimal-discriminant recurrence, line 889); the §4.7 locators were opened as above and §4.8 itself is unchanged. The other sampled targets fall outside the 20 changed lines and were not re-read, per the incremental brief; the previous full review opened CG20, P20, P12, PS16, M14, BCGP25, BCGP21, Tho17 and Yam14 at the locators of its own sample and of the headlines.

**Adversarial table.** New rows (this head) first, computed on both sides; then the rows carried forward from the previous report (r1) for the statements the diff leaves untouched, with r1's values.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.7 criterion Δ∨ = nΔn′ ⇔ D̄∨ ∈ N(H)D̄N(H) | H trivial, H₁ unipotent, H = ⟨A⟩, T nonsplit (mod 5, 5, 5, 13) | D̄∨ ∈ N(H)D̄N(H): true, true, true, false; |N(H)| = 120, 20, 12, 28; stabilizer of D is Γ₀(p), onto SL₂(ℤ/N) by CRT; orbit count |SL₂(ℤ/N)| = residue count | criterion right; the four cases are the four special cases listed | none |
| §4.7 principal-level transport | p = 7, N = 5 | [[0,1],[−1,0]] diag(7,1) [[0,−1],[1,0]] = diag(1,7); mod 5 four conjugators found | right | none |
| §4.7 Γ₁(N)-type transport | p = 7, N = 5 | diag(3,2) = diag(7⁻¹,7) mod 5 (7⁻¹ ≡ 3); diag(3,2)·diag(2,1) = diag(1,2) = D̄∨; diag(3,2) ∈ N(H₁) (Borel, order 20, all upper triangular) | one-sided composition right | none |
| §4.7 Check Γ(3)∩Γ₁(5) | n̄ = [[a,b],[0,a⁻¹]] ∈ B | n̄D̄n̄⁻¹ = [[2,−ab],[0,1]], (1,1) entry 2; H₁(n̄D̄n̄⁻¹)H₁ all have (1,1) entry 2 ≠ 1; enumeration: 0 of 20 elements of B conjugate D̄ into H₁D̄∨H₁; 5 of 20 give D̄∨ ∈ H₁ n̄D̄ H₁ (n̄ = [[3,b],[0,2]]) | conjugation excluded, one-sided composition present: Check right | none |
| §4.7 Check H = ⟨A⟩ | A = [[0,1],[4,1]], D̄ = diag(2,1), D̄∨ = diag(1,2) | A³ = −I, order 6; A⁻¹ = [[1,4],[1,0]]; n_j A n_j⁻¹ = [[0,4],[1,1]] (j = 0,3), [[3,2],[4,3]] (j = 1,4), [[4,1],[2,2]] (j = 2,5), none in {A, A⁻¹}, so D̄∨ ∉ N(H)D̄H; enumeration: D̄∨ ∉ HD̄N(H) too; n̄ = [[0,2],[2,0]]: det −4 ≡ 1, n̄An̄⁻¹ = [[1,4],[1,0]] = A⁻¹, n̄D̄n̄⁻¹ = diag(1,2); 6 of 12 elements of N(H) conjugate D̄ to D̄∨ | Check right, conclusion now matches the computation | none |
| §4.7 Check nonsplit torus mod 13 | T = {[[x,2y],[y,x]] : x²−2y² = 1}, p = 7 | squares mod 13 = {1,3,4,9,10,12}, 2 nonsquare; |T| = 14; N(T) = T ∪ {[[x,2y],[−y,−x]] : x²−2y² = −1}, 28 elements, all with diagonal (a,±a) (enumerated); D̄∨⁻¹ = diag(1,2); D̄∨⁻¹nD̄ = [[7a,b],[c,2d]]; 2d = ±7a and d = ±a give 5a = 0 or 9a = 0, a = 0; then det = ∓2y² = 1 needs y² ∈ {6,7}, nonsquares; enumeration: D̄∨ ∉ N(T)D̄N(T); with det ±1 (56 elements) also ∉ | Check right at SL₂ and GL₂ normalizers | none |
| §0.1 root condition (r1) | 𝔽₁₁: (2,3), (2,6), (1,3) | (4−1)(9−1)(2−3)(36−1) = −840 ≡ 7; (2,6): α²β² = 144 ≡ 1; (1,3): α²−1 = 0 | right | none |
| §0.3 multiplier parity (r1) | p = 7, a = 4, 5 | (−1)^{1−4} = −1; (−1)^{1−5} = 1 | a odd excluded by oddness | none |
| §0.3 nilpotent lift (r1) | 𝔽₇[η]/η², N = E₂₃ + η(E₁₂−E₃₄) | NᵀJ + JN = 0 entrywise; N² = η(E₁₃−E₂₄) ≠ 0 | orbit condition separates | none |
| §0.3 symplectic candidate (r1) | C = I + εE₁₄ | CᵀJC = J + ε(E₄₄−E₄₄) = J | right | none |
| §0.4 neatness witness (r1) | p = 11, a = 4, q = 5 | ε̄(Frob_q)⁻³ = 125 ≡ 4; 2·2 = 4; 1·4 = 5·3 ≡ 4; ratio 5 = q | right | none |
| §0.4 diamond group (r1) | p = 5, Q = {11} | order 10, p-part 5; −I excluded at level 3 | right | none |
| §0.5 labelling (r1) | 𝔽₁₃: (2,4,11,9), (2,11,4,9) | αδ = βγ ≡ 5; αβ = 8 = γδ (reject); relabelled 9 ≠ 10 (accept); 10 ∤ 25, 100 | right | none |
| §1.1 valuations (r1) | Ω(d,r), r = 2 | (d+4,0), (2,1), (0,3); sums ≥ 4, 3, 3 | right | none |
| §1.1 Q_{p,2} (r1) | weight (a,2) | ≡ Z₂ + p^{j−2}X₂ mod p: Z₂ + X₂ at j = 2 | right | none |
| §1.2 adic selector (r1) | ℤ₁₁, T = 16, Q = 6, roots (5,6) | 11^{n!} → 0, e = 1; ker(11ⁿ) = 0 | adic ≠ algebraic | none |
| §1.2 complement (r1) | k², T = diag(c,c+1), Q = diag(d+1,d) | joint selector 0; both differences det 0; wrong union formula gives 1 | right | none |
| §2.2 Steinberg eigenvalue (r1) | (2,2), (4,2), (3,3), x = 3 | 3⁻¹, 3⁰, 3⁰ | right | none |
| §2.3 polynomial (r1) | F = diag(1,2,3,6) | 1 − 12X + 47X² − 72X³ + 36X⁴ | right | none |
| §2.4 parameter parity (r1) | (1,0,0), (1,0,1) | 1 ≡ 1; 1 ≢ 2 | right | none |
| §2.5 multiplier (r1) | ℓ = 3 | ε⁻¹(Frob₃) = 3, det 9 | right | none |
| §2.6 monodromy (r1) | diag(1,q), N ∈ {0, E₁₂} | q⁻¹E₁₂; ranks 0, 1 | purity needed | none |
| §2.7 exponents (r1) | w = 0, 2 | (−1,−2), (−2,−3) | right | none |
| §2.8 dimensions (r1) | dim W = 1, 2; 3 | 4, 8; 3 ∤ 4 | right | none |
| Layer 2 example (r1) | weights {0,0,1,1}, ε⁻¹ | dual +3: {2,2,3,3}; ε⁻⁵ | right | none |
| §3.1 congruence (r1) | p = 2; ϖ² = 2 | 9 ≡ 1 mod 4; 2ϖ + ϖ² ≡ 0 mod ϖ² | right | none |
| §3.2 exponent (r1) | p = 5 | 24 ≠ 4 | right | none |
| §3.4 pairings (r1) | 𝔽₇, diag(1,2,3,4) | trace 3, det 3; (4,6), (3,1), (2,5) | no common multiplier | none |
| §3.4 weight shift (r1) | p = 7, t = 6, 2 | ε̄⁻¹² = 1; ε̄⁻⁴ ≠ 1 | right | none |
| §3.5 exponents (r1) | (4,3) | 0, −1, −3, −4; pair sum −4 | right | none |
| §4.1 X₂ (r1) | 𝔽₅ discs 1, 2, 0 | 1, −1, 0; d = −4p | right | none |
| §4.1 identities (r1) | U, Z, Z₂ | a(UX₂F;Q) = 0; Z₂ = UZ = ZU; X₂³ = X₂ | right | none |
| §4.2 weights and bounds (r1) | p = 7 | 8·15 ≡ 1; degrees −2, 0; 6 < 6 fails | right | none |
| §4.2 scalar exception (r1) | k = p−1, F = h | Θ(h) = 0, h ≠ 0; k(2k−1) ≡ 3 | CG20 8.10 false at k = p−1 | none |
| §4.2 contraction (r1) | e₂²f₁² ↦ −2 | −2 ≡ 5; ×2: 3; det of rank-one index 0 | right | none |
| §4.4 scalar kernel (r1) | 𝔽₁₁, c = 6, 1 | 6³−6 ≡ 1; 0 | right | none |
| §4.5 symbols (r1) | p = 7, diag(1,1), diag(1,2) | d ≡ 3, 6: −1, −1; det 1, 2: 1, 1 | conventions differ by (−1/7) | none |
| §4.6 scalar system (r1) | F = F_α + F₀ | ZF = βF + αF₀ | right | none |
| §4.7 Γ(5) example (r1, unchanged Check) | Q = 7x²+y², P = x²+7y², M = [[2,5],[35,91]] | det M = 7; M⁻¹·P = 1208x²−930xy+179y², disc −28; mod 5: 3x²+4y² ≠ 2x²+y² | Lemma 8.20 symmetry fails at Γ(5) | none |
| §5.1 isotropy (r1) | p−1 > a ≥ 2 | 1 ≤ a−1 < p−2 | right | none |
| §6.1 projector (r1) | 𝔽₁₁ (2,3,4,6); 𝔽₁₃ (2,4,11,9) | R(6) = 8 ≠ 0, others 0; αβ = γδ = 8 kills the block | right | none |
| §6.2 GL₂ inverse (r1) | q = 11, p = 5 | d⁻¹tr∘pr_α∘i acts by (qα−β)/((q+1)(α−β)); mod 5: 1 vs 3 | d_Q⁻¹tr not the inverse | none |
| §6.2 Klingen degree (r1) | x ≡ 1 mod p | 1+x+x²+x³ ≡ 4 | v_x ≡ 1 | none |
| §7.1 dual bundle (r1) | a = 4 | ω(1,−1); Hom(E/O,O) = 0 | right | none |
| §7.3 defects (r1) | S = O[C_p]; M = S, k, S⊕k | 1, −1, 0; Tor₁(k,O) = k | §7.4 obligation real | none |
| §7.3 bounds (r1) | (7,4), (7,5) | p−2 > a fails at (7,5), ν(c) = 1 | (7,5) never arises | none |
| §8.3 scalar witness (r1) | p = 11, a = 4, λ = 2 | q ≡ 5; 9⁻³ = 4; p = 7: 2 ∉ cubes | right | none |
| §8.4 six-point model (r1) | 𝔽₂⁶ | dim 4; 720 = 6!; fixed points 8, 4 | right | none |
| §8.5 weights (r1) | a = 4, 2 | 0,0,3,3; 0,0,1,1; N lowers slope by 1 | right | none |
| OAFML2 dyadic count (r1) | p = 2, n = 2, #T = 3, q = 5 | χ = −5; h³ = 1; h¹ = 5 = g | right | none |
| §9.3–9.4 lists (r1) | κ′ = (4,2), (2,2), (1,1); k′ = 2, 3 | (0,0,−3,−3), (0,0,−1,−1), (0,1,0,1); (0,0,−1,−1), (0,−1,−2,−3) | right | none |
| §10.1 neat prime (r1) | p = 2 | r ≢ 1 mod 4 | right | none |
| §10.3/10.7 example (r1) | p = 2, N = 1 | Δ ≅ C₂², ranks 4d, d | right | none |
| §11.1 R-regular (r1) | R = 3, 0 | 3 ≥ 3, 1+2 ≥ 3; −5, −3 fail | right | none |
| §11.3 residue field (r1) | ℚ₇, t²−3 | 3 nonsquare mod 7; [E′:E] = 2 | right | none |
| Conventions (r1) | diag(1,1), p = 7; Ω(0,2), Ω(2,2) | d ≡ 3 nonsquare, det 1 square; (−1,0;4), (−3,0;6) | right | none |

**Shape of the changed lines.** No LaTeX delimiters, no process words, no pull-request numbers, no absolute paths; the three new Checks each compute a value and say what the wrong model (conjugation only, one-sided composition only, any normalizing pair) would get; the §4.7 subsection keeps its locator and its *Needs:* line. Declared gaps are untouched since f9628b0.

## Not verifiable

- none in the changed lines. The two items of the previous report (the χ-inverse convention in BCGP25 Lemma 4.12.1 read through §2.7, and Yam14 Theorem 3.20 / BCGP21 §3.9.3) concern unchanged passages and stand as recorded there.

## Source issues

- none new in the changed lines. The seven issues of the previous report (CG20 Thm 7.3, Thm 8.10, Prop 8.9(2), Lemma 8.4/Def 8.5, Thm 7.11, Prop 8.25; BCGP25 §5.4) were recorded there and are not repeated.
