# Review of ArithmeticKTheory (pull request #1418 at 543ffc2)

**Verdict:** accepted

Incremental re-review of the 31 lines changed since 6c0c743 (17 insertions, 14 deletions, all in `TauCetiRoadmap/ArithmeticKTheory/README.md`; `Suggested.lean` is byte-identical to the head the previous review read). The change is exactly the repair of the previous review's one finding: the three backticked supplier names that no supplier declares are replaced by prose citations of the statements the cited sections make. No finding remains, new or carried, the gate passes, and the dependency check shows no UPWARD or CYCLE line. Acceptance is conditional on the two declared supplier gaps (`gap:connective-c2-homotopy-orbit-spectral-sequence`, `gap:number-ring-witt-signature`), which are contracts, not findings.

## Previous findings

- R01 — repaired: README 313 “§3.3 supplies the vanishing of the exponent-zero class component and character reflection”; 326–328 “the DVR boundary valuation and its flat-ramification law: after a local flat map of DVRs with ramification index e, the boundary of the extended class is e times the pulled-back boundary”; 334–335 “the transfer formula in rank–Picard coordinates, including virtual negative ranks”; 634 “Specialize KTheoryLowDegrees §5.5's transfer formula in rank–Picard coordinates”; 830 “Apply SchemeKTheoryOperations §3.6's flat-ramification law for the DVR boundary”. A fixed-string search of the folder for `dvrBoundary_flat_ramification`, `dedekindTransferCoordinates` and `classComponent_zero` returns nothing. The repair introduced no new problem: each prose citation names a statement its section makes (witnesses under Verified sound), and no mathematics changed.

## Verified sound

### The changed passages, resolved at the suppliers

Every supplier below is earlier than ArithmeticKTheory in the merge order (CyclotomicClassGroupsAndStickelberger line 30, SchemeKTheoryOperations line 34, KTheoryLowDegrees line 36, ArithmeticKTheory line 126) and was read at the head of its open pull request through the roadmap service, since none is on main.

| README passage (line) | Supplier statement found | Agreement |
| --- | --- | --- |
| 326–328, 830: SchemeKTheoryOperations §3.6's flat-ramification law for the DVR boundary | §3.6 “Unit loops, DVR boundaries and specialization”, interface bullet of the DVR boundary `∂_S`: for a local flat map `O → O'` of DVRs with `mO' = m'^e`, `∂_S'(x_{L'}) = e·(k → k')^*(∂_S x)`, pulling back the support category multiplies by the length e of `O'/mO'` | The README's sentence restates this bullet: extended class, ramification index e, pulled-back boundary. The §2.3 phrase “support-pullback comparison” (line 822) is the same bullet's “pulling back the support category” |
| 326, 831: §3.7 supplies the Dedekind localization assembly and finite-pushforward naturality | §3.7: limit over finite closed subsets giving `⊕_p K_n(R/p) → K_n(R) → K_n(F) → ⊕_p K_{n−1}(R/p)`; finite pushforward gives a map of coherent localization sequences, generic transfer commutes with the sum of residue-field transfers, residue degrees in degree zero and norms in degree one | Matches §2.3's “on K₀ of residues it multiplies by f(w/v); on K₁ it is the finite-field norm” |
| 334–335, 634: KTheoryLowDegrees §5.5's transfer formula in rank–Picard coordinates, including virtual negative ranks | §5.5 “Normalized norm and the transfer formula”: for finite injective `R → S` of Dedekind domains with `d = rank_R S`, `s = det_R S`, the transfer is `(r,L) ↦ (dr, N(L)·s^r)`, extended additively to virtual negative r, with `f_*f^*(n,L) = (dn, L^d s^n)` equal to multiplication by `[S]`, and its own Check “(−1,1) transfers to (−d, s⁻¹)” | §1.3's `tr₀(n,c′) = (dn, Norm(c′)·c_B^n)` with `c_B = det_O(B)` is this formula with `s = c_B`; §1.3's Check “(−1,1) transfers to (−d,c_B⁻¹)” is the supplier's Check |
| 313: CyclotomicClassGroupsAndStickelberger §3.3 supplies the vanishing of the exponent-zero class component and character reflection | §3.3 “Kummer reflection with the correct dual action”, specialization to `E = K_p, F = ℚ`: `A^(0) = A^(1) = 0` and `r_p(A^(k)) ≤ r_p(A^(1−k)) ≤ r_p(A^(k)) + 1` for even k, with the invariant component zero by the degree-prime-to-p norm comparison with ℚ | The README's two phrases name exactly these two statements |

The passages that cite the changed ones were re-read: §1.2 (lines 573–614) states the finite injective Dedekind extension with T the full inverse image of S, finite projective of rank [E:F], which is the extension the changed sentences at 634–635 and 830–831 specialize to; §1.3's `*Needs:*` line (650) and Layer 1 Dependencies (661–663) cite KTheoryLowDegrees §§5.1–5.5; §§7.2–7.3 cite CyclotomicClassGroupsAndStickelberger §§0.1–0.4, 3.1, 3.3, 4.5 and 5.1 (README 3480–3645), unchanged.

### Seeded sample where it falls in the changed passages

| Target | Opened and conclusion |
| --- | --- |
| 1.2 Enlarging primes and extending fields (cited by both changed paragraphs) | kbook line 24609–24624 (V.6.6.3–6.6.4, printed p. 410, PDF marker 418 at line 24583): the homotopy-commutative diagram of localization sequences for the integral closure R′ of R in a finite extension, with `N_{R′/R}`, `N_{F′/F}` and `N̄ = ⊕ N_{p′/p}` on the residue terms. The README's requirement that T be the full inverse image of S is the setting of 6.6.3 (R′ the integral closure). |
| 1.3 Low degrees and the Steinitz correction (changed at line 634) | kbook line 4387–4400 (Exercise II.2.2, printed p. 78, PDF marker 86 at line 4380): A finitely generated projective of rank n over R, (a) the projection formula `f_*(x·f^*y) = f_*(x)·y`, (b) both composites `f_*f^*` and `f^*f_*` are multiplication by `[A]`. The README's “tr₀res₀ is multiplication by [B] = (d,c_B); it need not be multiplication by d” and “the projection formula” are (b) and (a). kbook line 24609–24624 as above for the V.6.6.3–6.6.4 locator. |
| 2.3 Residue transfer and ramification-weighted restriction (changed at line 830) | kbook line 24609–24624 (V.6.6.3–6.6.4, p. 410) as above: the residue map is the sum of the residue-field norms `N_{p′/p}`, which is the transfer direction; the restriction direction with weight e(w/v) is the supplier's flat-ramification bullet, not a K-book statement, and the README cites it to SchemeKTheoryOperations §3.6 as it should. |

The other seeded targets (2.4, 3.1, 5.2, 5.3, 6.2, 6.3, 6.7, 6.9, 6.14, 7.1, 8.2, 8.6, 8.8) lie outside the 31 changed lines and were not re-opened this round; those among them the previous review sampled (2.4, 6.2, 6.7, 7.1) were found at their locators then and their text is unchanged.

### Gate, dependency check, elaboration

The worker's gate at this head:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

My own run of the prescribed dependency check against the merge order:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArithmeticKTheory'` is empty. `lake env lean` on `Suggested.lean` succeeds in 13 s with exactly the three `declaration uses 'sorry'` warnings (lines 50, 56, 69). `git diff 6c0c743..HEAD -- Suggested.lean` is empty, so the previous review's elaborated signatures, `#check @name` comparison and one-tactic probes (`simp`, `rfl`, `infer_instance`, `decide`, `exact?` close none of the three sorried theorems) stand unchanged; the worker's signature extraction at this head again reports 0 dropped binders for the 4 declarations. The resolver's one lead, `VanishingCycles.etaleTateTwists` at README 288, is declared by EtaleCohomologyFoundations on main (its README line 233, §F.0.3), as before.

### Headline coverage

Unchanged from the previous review: `integer_isLocalization_iff` and `integer_isLocalization_of_torsion_classGroup` (§1.1 on `Set.integer` with the real-bodied `sUnitSubmonoid`), `regularPrime_dividedBernoulli_num` (§7.2 on `bernoulli` and `NumberField.classNumber (CyclotomicField p ℚ)`); the higher-degree, Borel-rank, hermitian, wild-kernel and tame-kernel headlines named in the module docstring as not statable at the pins, with no stand-in. Nothing in the file is padding.

### Computed adversarial pass

Rows for the three changed statements are computed here; every other row is carried from the review at 6c0c743 (its “Computed adversarial pass” table), whose statements the diff leaves untouched. Notation: C_m is the cyclic group of order m; “retain” means the stated hypotheses exclude the negative control shown.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §1.3 transfer coordinates, specialized from KTheoryLowDegrees §5.5 (changed, line 634) | ℤ ⊂ ℤ[i] (d = 2, free, c_B = 1); d = 2 with Steinitz class c_B ≠ 1; virtual (−1,1); d = 1 | (1,1) ↦ (2·1, N(1)·1¹) = (2,1); (1,1) ↦ (2, c_B); (−1,1) ↦ (−2, c_B⁻¹); at d = 1, c_B = 1 and (n,c) ↦ (n,c). Composite: res₀(n,c) = (n, ext c), tr₀(n, ext c) = (dn, c^d·c_B^n); in the ring K₀(O) = ℤ ⊕ Pic with (a,L)(b,M) = (ab, L^b M^a), (d,c_B)(n,c) = (dn, c_B^n c^d): equal, so tr₀res₀ = ·[B], and ≠ ·d exactly when c_B^n ≠ 1 | Pass; supplier formula and §1.3 agree, the determinant factor is detected by the second control |
| §2.3 flat-ramification law from SchemeKTheoryOperations §3.6 (changed, line 830) | ℤ_(2) → ℤ_(2)[i] (e = 2, f = 1), x = λ(2); ℤ_(3) → ℤ_(3)[i] (e = 1, f = 2), x = λ(3) | Downstairs ∂λ(2) = v₂(2)·[𝔽₂] = 1; upstairs 2 = −i(1+i)², v_{1+i}(2) = 2 = e·1 (the supplier's own Check gives 2 and 1 for 2 and 1+i). Unramified control: ∂λ(3) = 1 downstairs and v_{(3)}(3) = 1 = e·1 upstairs although f = 2: the weight on restriction is e, not f | Pass; the README's “ramification index, rather than residue degree, occurs on restriction” is the correct quantity |
| Supplier contract: CyclotomicClassGroupsAndStickelberger §3.3's exponent-zero vanishing and reflection (changed, line 313) | p = 37, Δ = Gal(K₃₇/ℚ) ≅ C₃₆; k = 32 | #Δ = 36 is prime to 37, so A^(0) = A^Δ is the image of A_ℚ = 0 under norm-then-inflate: A^(0) = 0. Reflection at k = 32: 1 − 32 ≡ 5 mod 36, and p ∣ B₃₂ (num(B₃₂) = −37·208360028141), so A^(5) ≠ 0 by Herbrand–Ribet while A^(32) = 0 (32 is not an irregular index for 37): r(A^(32)) = 0 ≤ r(A^(5)) = 1 ≤ 0 + 1 | Pass; the bounds are consistent with the §7.3 witness, and an isomorphism of reflected components is not claimed |
| `sUnitSubmonoid` (headline carrier) | ℤ, S = ∅ and S = {(2)}; R a field | Units of `Set.integer`: {±1}; {±2^a}; R∖{0}. 2 admitted only in the second case, 3 in neither, 0 in none | Pass; carried from 6c0c743 |
| `integer_isLocalization_iff`, ⇐ | M ≤ sUnit, each v ∈ S meets M; x ∈ S.integer with poles at v₁,…,v_k ∈ S | m = ∏ m_i^{n_i} with m_i ∈ M ∩ v_i has v_w(m) = 0 off S, so xm ∈ R and x = (xm)/m; surjectivity, injectivity and the equalizer law of `IsLocalization` hold | Pass; carried |
| `integer_isLocalization_iff`, ⇒, non-torsion control | Dedekind R with [v] of infinite order, S = {v} | Some x ∈ S.integer has v_v(x) = −n < 0, so S.integer ≠ R; any M of S-units has (m) = v^j with [v]^j = 1, so j = 0 and M ≤ R^×, M⁻¹R = R; both sides false | Pass; carried |
| `integer_isLocalization_iff`, zero and field cases | 0 ∈ M; R a field | A localization at 0 is the zero ring ≠ S.integer, LHS false; field: Spec¹ = ∅, S.integer = F, any M ≤ F^× gives F = M⁻¹F | Pass; carried |
| `integer_isLocalization_of_torsion_classGroup` | ℤ[√−5], S = {p = (2,1+√−5)} | [p]² = 1, p² = (2), 2 ∈ p and 2 is an S-unit; requiring p principal would reject the instance | Pass; carried |
| `regularPrime_dividedBernoulli_num`, p−1 ∤ 2k branch | (p,k) = (5,5), (5,7), (5,63) | B₁₀/5 = 1/66; B₁₄/7 = 1/6, B₁₄/14 = 1/12 ≡ 3 mod 5; B₁₂₆/63 ≡ 6 ≡ 1 mod 5; numerators prime to 5 | Pass; carried |
| same, p−1 ∣ 2k branch | (p,k) = (3,1), (5,2) | B₂/1 = 1/6 has v₃ = −1; B₄/2 = −1/60 has v₅ = −1; reduced numerators 1, −1 | Pass; carried |
| same, junk and irregular controls | k = 0; (p,k) = (37,16) | bernoulli 0 / 0 = 0, numerator 0 divisible by p: excluded by 1 ≤ k. num(B₃₂) = −37·208360028141, so regularity cannot be dropped | Pass; carried |
| §3.4 bracket convention | rk = 4, q = 1; rk = 13, q = 3 | [4/4]′ = 0; 4·3 = 12 < 13; at rk = 12, 12 < 12 fails | Pass; carried |
| §3.4 product reduction | G = G₁ × G₂ | ρ_P − ν ≫ 0 for all ν iff for each factor; c(G) = min c(G_i); m(G(ℝ)) = min over real simple factors | Pass; carried |
| §3.4 anisotropic factor | rk_ℚ G_j = 0 | [0/4]′ undefined; README asserts no degree | Pass; carried |
| §3.4 Check 1 | Γ(3) ⊂ SL₂(ℤ) | Free of rank 3; H¹ = ℝ³, H² = 0; (𝔰𝔩₂(ℝ),SO(2)): ℝ, 0, ℝ | Pass; carried |
| §3.4 Check 2 | SL₂(ℤ[i]) | vcd = 2, H³ = 0; SU(2) has H³ = ℝ; degree 3 enters at m = 14 | Pass; carried |
| §3.4 Check 3 | SU(m)/SO(m), m = 4, 5, 6; SU(m) | m = 4 Euler class in degree 4; m = 5 Λ(e₅,e₉); m = 6 Λ(e₅,e₉)⊗Λ(e₆); 20 < m−1 ⇔ m ≥ 22 | Pass; carried |
| §3.4 Check 4 narrower range | F = ℚ(i), q = 3, N = 2 | m ≥ 26 versus m ≥ 14 | Pass; carried |
| §3.4 real points | Res SL_{mn}(D) at real and complex places | SL_{mnd}(ℝ), SL_{mnd/2}(ℍ), SL_{mnd}(ℂ) connected; ℚ-rank mn − 1 | Pass; carried |
| §3.4 ranks | ℚ, ℚ(i), degrees 3 and 5 | ranks (0,1) and (1,1); K₃(ℤ[i]) ⊗ ℚ = ℚ | Pass; carried |
| §3.2 function-field exclusion | SL₂(𝔽_q[t]), finite-index Γ | Γ meets the infinite exponent-p unipotent group: not torsion-free | Pass; carried |
| §3.2 finiteness criterion hypotheses | 𝔽_q[t] versus O_F | Pic finite in both; Steinberg-homology hypothesis proved only for O_F | Pass; carried |
| §1.2 tower | ∅ ⊆ {(2)} ⊆ {(2),(3)} | ℤ → ℤ[1/2] → ℤ[1/6]; (1/2)(1/3) = 1/6 | Pass; carried |
| §1.2 extra upper prime control | ℚ(i)/ℚ, invert 2+i upstairs only | N((2+i)⁻¹) = 1/5 ∉ ℤ: not finite over ℤ | Pass; carried |
| §2.4 degrees | n = 4, 𝔽₂; n = 3 | K₄(𝔽₂) = 0; K₃(𝔽₂) = C₃ | Pass; carried |
| §4.2 formula | ℓ = 3, F = ℚ: i = 1, 2, 6 | w = 1, 3, 9 | Pass; carried |
| §4.3 dyadic table | ℚ, ℚ(i), ℚ(√−2), weights 1, 2 | ℚ: 2, 8; ℚ(i): 4, 8; ℚ(√−2): 2, 8 | Pass; carried |
| §4.4 w_i(ℚ) | i = 2, …, 12 | 24, 240, 504, 480, 264, 65520 | Pass; carried |
| §7.1 denominators | B₂/4, B₄/8, B₆/12, B₁₀/20 | 1/24, −1/240, 1/504, 1/264 | Pass; carried |
| §7.3 Herbrand exponent | ℓ = 37, k = 16 | 1 − 32 ≡ 5 mod 36 | Pass; carried |
| §7.3 Teichmüller direction | p = 5, n = 2 | 165/5 = 33 ≡ 3 ≡ 1/12 mod 5; inverse weights give 154 | Pass; carried |
| §5.4 odd table | ℚ, n = 3, 5 | ℤ/48; w₃/2 = 1 with rank 1 | Pass; carried |
| §5.4 diagonal normal form | (24,1), (2,2); D₈ control | C₄₈; C₄ ⊕ C₂; abelian hypothesis retained | Pass; carried |
| §6.1 ranks | ℚ(i), ℓ = 2, S = {(1+i)} | t = 0, s = 1: rank 0 | Pass; carried |
| §6.2 defect | ℚ(√7) | j(O[1/2]) = 1; √7 gives j = 0 | Pass; carried |
| §6.4 two-rank function | (1,1,0,0); (2,1,0,1) | (1,0,0,0); (2,1,1,0) | Pass; carried |
| §6.5 ratio | ℚ, i = 2, 4 | 1/12 = |ζ(−1)|; 1/120 = |ζ(−3)| | Pass; carried |
| §6.7 raw kernel | ℚ, {−1,−1} | real and dyadic symbols −1 | Pass; carried |
| §6.7 local target order | i = 1, ℚ₂ | #D₁(ℚ₂) = 2, not 24 | Pass; carried |
| §6.15/§6.16 slots | j = 0, −1, 1 | totals 0, −2, positive at j = 1 | Pass; carried |
| §6.16 degree one | ℤ versus ℤ[1/3], coefficients 3 | K₁(ℤ;ℤ/3) = 0; K₁(ℤ[1/3];ℤ/3) ⊇ C₃ | Pass; carried |
| §7.5 K₄(ℤ) | odd and dyadic parts | odd part 0; dyadic 2-rank 0; rational rank 0 | Pass; carried |
| §7.5 even orders | n = 2, 6, 22 | 2, 1, 691 | Pass; carried |
| §8.5 Gaussian kernel | g = {i,i} | 3g = 0, 4g = 0 ⇒ g = 0 | Pass; carried |
| §8.5 Euclidean bounds | q = 5 | 1.707 < 2.236; C covers the residues | Pass; carried |
| §8.9 signs | g = {−1,−1}, h = {−1,ε} | (−1,−1), (1,−1); span {±1}²; bound 4 | Pass; carried |
| §8.10 | ℤ[i], ℤ | ℤ ⊕ ℤ/24; ℤ/48 | Pass; carried |
| §8.8 prime list | norms ≤ 33 in ℤ[ε] | 4, 5, 9, 11, 11, 19, 19, 29, 29, 31, 31; eleven steps | Pass; carried |
| §8.7 cutoff | d = 2√5/π | 16d² ≈ 32.42 < 33; (20d)^{2/3} ≈ 9.32; d³ ≈ 2.88; 2^{12/5}d^{12/5} ≈ 12.32 | Pass; carried |
| Conventions: K₂ boundary | ℤ_(5), π = 5, u = 2 | β{5,2} = 2, β{2,5} = 3 | Pass; carried |
| Conventions: K₀ inverse class | 0 → p → R → R/p → 0 | [R/p] = (0,[p]⁻¹) | Pass; carried |

### Declared gaps

Unchanged: both slugs occur in the README (lines 260 and 398) and in `packages/ArithmeticKTheory/design/plan.json`; the previous review's precision and minimality check stands.

### Ownership

The changed lines add no construction; they cite existing supplier statements. The previous review's ownership search (no roadmap on main, in the board packages or at the supplied open heads states Borel's stable invariant-form comparison; BorelRegulators declares `gap:stable-finite-range` to ArithmeticKTheory §3.4; K3BlochGroups consumes §§3.2–3.4, 4.1–4.4, 5.1–5.4, 8.10) is unaffected.

## Not verifiable

- `harris-segal`, `mitchell`, `quillen`, `bass-tate`, `serre` and `groenewegen-preprint` are settled waived sources; their locators were retained, not read.
- borel1977 line 460: the inequality symbol is lost in the OCR; the strictness of the range was certified from borel1974 0.1 and 9.5(3) in the previous review.
- The seeded targets outside the changed lines (2.4, 3.1, 5.2, 5.3, 6.2, 6.3, 6.7, 6.9, 6.14, 7.1, 8.2, 8.6, 8.8) were not re-opened this round, as the incremental brief directs; their text is unchanged since 6c0c743.
- Ownership was checked against the open pull requests whose files the brief supplies and the roadmap service's index of 462 open pull requests; pull requests outside that index were not searched.

## Source issues

- none
