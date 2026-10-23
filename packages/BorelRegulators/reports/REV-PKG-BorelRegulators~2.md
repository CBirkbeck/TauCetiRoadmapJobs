<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6374847165 -->
Review (claude) of 627bb70

Verdict: accepted
Conditional on the announced gaps: `stable-finite-range`, `integral-chern-calibration`, `cyclic-local-degrees`, `inner-type-a-structure`, `adelic-rational-masses`, `classical-tamagawa-proof`, `order-finite-generation`, `universal-deligne`, `infinitesimal-classifying-comparison`, `graded-indecomposable-api`, `multiplicative-serre-comparison`, `splitting-degree-index`

1. **F01** (P3) §5.1's *Needs:* line omits the Mathlib inputs of its new native statement

   **Location.** `packages/BorelRegulators/README.md` line 595: "*Needs:* §4.3; §4.5; §4.2; ArithmeticKTheory §3.4; gap:stable-finite-range; §4.6." The repair added line 578 (`exists_pos_rat_dedekindZeta_of_isTotallyReal`) and line 44, which says the total-reality interface is "as used in §5.1".

   **Claim.** House style requires a *Needs:* line to list everything its statement and its route use. The rank-zero form uses `NumberField.IsTotallyReal`, the r₂=0 equivalence, `NumberField.dedekindZeta` and the discriminant. The general class c∈ℚˣ·√Δ_F·π^(−Nn)·ζ_F(n) also uses the last two. None of them is listed.

   **Witness.** `packages/BorelRegulators/Suggested.lean` lines 73–77 use `NumberField.IsTotallyReal F`, `NumberField.discr F` and `NumberField.dedekindZeta F n`. The *Needs:* line at README line 595 names no Mathlib declaration.

   **Repair.** Append "; Mathlib `NumberField.IsTotallyReal`; Mathlib `NumberField.nrComplexPlaces_eq_zero_iff`; Mathlib `NumberField.dedekindZeta`; Mathlib `NumberField.discr_ne_zero`" to line 595. Tested: all four names elaborate with `#check` at the pinned Mathlib (scratch file, exit 0).

2. **F02** (P3) §5.2's opening statement leaves out n≥2 (the pattern repaired in round-1 F03)

   **Location.** `packages/BorelRegulators/README.md` line 599: "Transport the free compact-dual homotopy lattice through the suspended character into Vₙ(F). Prove that its covolume … is (2π)^dₙ·ε(F,n)". Line 605 also says the index is 1 "for n≡1 mod4".

   **Claim.** §1.1 defines Vₙ and dₙ for every n≥1, and ε(F,n) is defined for every n. Only the Conventions sentence at line 19 limits the higher-weight theorems to n≥2. At n=1 the statement fails, and the interface bullet's "n≡1 mod4" includes n=1.

   **Witness.** Take F=ℚ, n=1. π₁(SU)=0. The fibration SO→SU→SU/SO gives π₁(SU)=0→π₁(SU/SO)→π₀(SO)=0, so π₁(SU/SO)=0. The transported lattice is therefore {0} inside V₁(ℚ), which has dimension d₁=1, so the covolume 2π cannot hold.

   **Repair.** Begin line 599 with "For n≥2, transport …". Tested: n=1 is now excluded. At n=2,3,5 the covolumes are 1, 4π and 2π, matching the section's Checks (index 2 at π₅ and quotient image 2ℤ at π₉, as in burgos2002 Lemma 9.18, line 3546–3576). Sections 2.2, 2.3, 5.3, 5.5 and 6.2 need no change: they are scoped by Boₙ, which §2.1 constructs only for n≥2.

All four round-1 findings are repaired. I raise two new findings, both P3; neither blocks. The acceptance depends on the twelve declared supplier gaps. `Suggested.lean` elaborates at the pins with `sorry` as the only warning. Its three statements are true, stated at the README's generality, and none of them is padding. Every statable headline is stated. All fifteen sampled locators check out against the text.

## Notes for the operator (outside the package)

- **Merge order.** In this job's board checkout, `merge-order/ORDER.txt` still has BorelRegulators at line 224, after ArithmeticKTheoryPartII. Board main, commit bde8cb0, has it at line 114, directly after ArithmeticKTheory at line 113. I ran the dependency check against both: each reports 0 problems.
  - At line 114 the round-1 operator concerns are resolved. ColemanIntegration (156), HeightsRationalPointsAndObstructions (158) and PeriodsAndSpecialValues (201) are consumers. EndoscopicTransferAndUnitaryTraceComparison (167) is later, so gap:classical-tamagawa-proof does not ask an earlier roadmap for its §6.2.
  - I reviewed against the main order.
- **Consumer drift (Polylogarithms, at its head).** Its README cites "BorelRegulators Layers 3–5" and "§7.1", at lines 100, 106, 112, 187, 294, 643 and 705. Neither label matches this package: Layer 3 here is division algebras, and there is no §7.
  - The intended targets are §§2.3 and 5.3–5.4 (lattice and covolume) and §5.1 together with `exists_pos_rat_dedekindZeta_of_isTotallyReal` (rank zero).
  - Its "Tamagawa input" is §3.4 here, which rests on gap:classical-tamagawa-proof.
  - HabiroRings, at its head, does not cite BorelRegulators. It depends on it only through Polylogarithms.

## Verified sound

### Round-1 findings: repair status (diff 92299a1→627bb70)

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) rank-zero headline | `Suggested.lean` lines 66–78 add `exists_pos_rat_dedekindZeta_of_isTotallyReal` with `[NumberField.IsTotallyReal F] (hn : 2 ≤ n) (hev : Even n)`, `∃ q : ℚ, 0 < q ∧ √\|disc F\|·ζ_F(n) = q·π^(n·[F:ℚ])`. Docstring line 22: "the primitive-period determinant in positive rank requires its actual cohomological comparison". Lines 33–34: "The rank-zero primitive-period theorem is stated on Mathlib's Dedekind zeta function." README line 578 names the statement. | repaired |
| F02 (P3) a≥1 | Lean line 56 `(ha : 1 ≤ a)`. README line 329 "natural a≥1". New Check at line 341 (D=F at a=1, with a=0 excluded). Docstring "Every positive degree occurs". | repaired |
| F03 (P3) §1.3 n≥2 | README line 208 "For every n≥2, using LFunctions Layer 3’s continued Dedekind function, define …" | repaired |
| F04 (P3) DG pages | README References line 791 and `sources.toml`, both `locator` and `version_note`: "Published §1.6, pp.7–9". deligne_goncharov2005 line 275 is the p.7 marker and §1.6 begins at line 282. | repaired |
| MERGE-ORDER (unrated) | Settled as not actionable in the package. The operator has since moved the line on main (bde8cb0). | settled, not re-raised |

Pattern search over the whole package:

- F01 pattern (an unstatable claim that is actually statable). Every headline in the table below was re-tested at the pins.
- F02 pattern (a hypothesis narrower than the source). Rechecked §§3.1, 4.3, 4.4, 5.1 and 6.3 against borel1977, burgos2002 and deligne_goncharov2005. §3.4 keeps a≥2 and excludes only the trivial group at a=1.
- F03 pattern. Found once more, in §5.2 (R02).
- F04 pattern (page ranges). Every borel1977, burgos2002, poonen2017, deligne_goncharov2005 and borel1974 line I cite was mapped to its printed page: printed page = extraction page + 611 (borel1977), − 6 (burgos2002), + 234 (borel1974). All agree.

### Lean form (packages/BorelRegulators/Suggested.lean)

- **Elaboration.** `lake env lean` on the file, run from the content checkout at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa), exits 0 in 4.1 s. Output is exactly three `declaration uses sorry` warnings, at 46:8, 55:8 and 72:8. Both imported Tau Ceti object files were present, so no module build was needed.
- **Binder audit.** I wrote `#check @` for all three declarations in one scratch file and elaborated it once.
  - `period_eq_index : ∀ F [Field F] [NumberField F] (A : CSA F), orderOf (mk A) = index F ↑A.toAlgCat`.
  - The existence theorem keeps `1 ≤ a`, centrality, finite dimension, `finrank = a^2`, and σ is used in both splitting conjuncts.
  - The rank-zero theorem keeps `[NumberField.IsTotallyReal F]`, `2 ≤ n` and `Even n`.
  - Every elaborated type matches README §§3.1, 3.2 and 5.1. There is no `def` or `instance`, so no binder can be lost.
- **Padding probe.** Each theorem was tried as an `example` on a scratch copy.
  - `simp`, `rfl`, `exact?`, `aesop`, `norm_num`, `infer_instance`, `positivity` and `decide` all fail on the two Layer 3 theorems and on the rank-zero theorem.
  - `simp` makes no progress on the rank-zero goal, and `exact?` finds nothing.
  - None of the three is padding.
- **Form.**
  - One module docstring in the required shape, naming each unstatable headline and its missing carrier.
  - `namespace TauCetiRoadmap.BorelRegulators`. Layer 3 and Layer 5 section headers match README headings.
  - `theorem` only. No `set_option`, no sorry'd data, no `#eval`.
  - Imports: `import Mathlib` plus `TauCeti.Algebra.BrauerGroup.Group` and `TauCeti.Algebra.CentralSimple.Index`. Both are used, and `IsSplittingField` arrives through `Index`.
  - The three Lean names are exactly the README's own backticked names.

### Headline theorems (README Summary and Layers)

| Headline | Status at the pins |
|---|---|
| §3.1 period equals index | stated (`period_eq_index`) |
| §3.2 division algebras of every positive degree split at infinity | stated |
| §5.1 rank-zero primitive period | stated (`exists_pos_rat_dedekindZeta_of_isTotallyReal`) |
| §1.3 order dₙ and leading coefficient at 1−n | not statable. `NumberField.dedekindZeta` (Mathlib DedekindZeta.lean:49) is the L-series. `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` (DedekindZeta.lean:158) continues only to Re s>1−1/N. No completed or continued Dedekind function exists in either pin (grep). Named in the docstring. |
| §§2.1–2.3 Borel class, regulator, real isomorphism | not statable: no higher K-theory or plus construction in either pin (grep). Named. |
| §3.6 arithmetic norm-one volume | not statable: no SL₁(D) group or gauge-form measure. Named. |
| §§4.3–4.6 compact and arithmetic primitive periods | not statable. Mathlib Lie cochains stop at low degree (`Mathlib/Algebra/Lie/Cochain.lean`), and there is no compact-dual cohomology comparison. Named. |
| §5.1 positive rank, §5.2 lattice conversion, §§5.3–5.5 lattice, covolume, transport | not statable (K-theory, stable SU/SO homotopy, suspended character). Named. |
| §§6.1–6.3 Deligne point, Bo=2Be, Adams weight | not statable (Deligne cohomology, universal regulator, Adams operations on higher K). Named. |

### Sources: the seeded sample, read at the locators

borel1977 was read from page images of the cached legal Numdam PDF (printed pp.616–619 and 631–633), because the extraction drops formulas. The other sources were read in their extractions. No flagged-unverified locators exist; the only unread texts are weil1961 (waived) and beilinson1985 (uncertified).

| Target | Read | Result |
|---|---|---|
| 1.1 | burgos2002 Proposition 9.22 and Corollary 9.23, p.85, line 3650–3709: suspended twisted Chern character, an isomorphism compatible with the integral structure (∏ℤ(p−1))^F and with the involution | verified |
| 1.3 | borel1977 §1.4, p.616, line 127–139 (d₀=r₁+r₂−1; d_m=r₁+r₂ for m even and nonzero, r₂ for m odd; m=n−1). §6.4 (3)–(4), p.633, line 600–615 (leading term ∼π^(−d(m+1)+d_m)√\|D\|ζ_k(m+1)) | verified |
| 2.2 | burgos2002 Definition 9.19, Proposition 9.21 and Corollary 9.23, pp.84–85, line 3577–3709: factorization through K(ℂ) and evaluation by s(ch_p) | verified |
| 3.1 | poonen2017 Theorem 1.5.36 (statement p.25; (iii)–(iv) and proof p.26), line 1396–1446: Grunwald–Wang cyclic L with local degree n (finite places) and 2 (real places); period ≤ index ≤ [L:k] | verified |
| 3.2 | borel1977 Lemma 2.2, pp.617–618, line 165–195: the page image reads n≥1. Proof: inv 1/n at n finite places, cyclic L with full local degrees, d·inv_v=0 forces d=n | verified |
| 3.3 | borel1977 §1.6 (1)–(2), p.617, line 153–163: ω∞=\|D\|^(−n/2)∏ω_v; the product with the finite ω_v is the Tamagawa measure for semisimple groups | verified |
| 3.5 | borel1977 Proposition 2.4 proof, p.619, line 229–236: m_v rational; m_v(SL_n(o_v))=Nv^(−(n²−1))·#SL_n(F_v); #SL_n(F_v)=Nv^((n²−n)/2)∏(Nv^(j+1)−1) | verified |
| 3.6 | borel1977 §2.3 and Proposition 2.4, pp.618–619, line 196–236: compactness, m∞(Γ)∼∏_{1≤j<n}ζ_k(j+1), torsion-free Γ′, strong approximation, τ(H)=m∞·m(U) | verified (misprint below) |
| 4.1 | borel1977 §1.3, p.616, line 122–126 (decomposables = span of products of lower degrees); §6.1, p.631, line 567–570 (Λ^{d_m} of the degree-2m+1 indecomposables) | verified |
| 5.3 | burgos2002 Definition 9.19, p.84, line 3577–3606 (R_Bo,p = covolume relative to L_{2p−1}); Corollary 9.8, p.78, line 3140–3150 (real isomorphism, m≥2) | verified |
| 5.4 | burgos2002 Theorem 9.12, p.80, line 3253–3259 (R′∼π^(−d_p)·leading term); Remark 9.20 (9.4)–(9.5), p.84, line 3607–3614; borel1977 §6.4, p.633 | verified |
| 5.5 | borel1977 §6.4, pp.632–633, line 595–615: regulator normalization only, as the README says. The S-integer and order transport is attributed to ArithmeticKTheory and gap:order-finite-generation. | verified as cited |
| 6.1 | burgos2002 projection π_p(x)=(x+(−1)^p x̄)/2 at line 3959–3960; Examples 10.4–10.5, p.91, line 3973–3988 (H¹_D(Spec ℂ,ℝ(p))=ℝ(p−1), p>0; the number-field point gives (∏ℝ(p−1))^F); Remark 10.6, p.92, line 3991–4001 (integral structure (∏ℤ(p−1))^F) | verified |
| 6.2 | burgos2002 Definitions 10.7–10.8, p.94, line 4087–4106; Theorem 10.9 Bo_p=2Be_p and proof, pp.95–97, line 4139–4242 | verified |
| 6.3 | deligne_goncharov2005 p.9, line 429–440: ψ^a acts on K_{2j−1}(k)⊗ℚ by a^j | verified |

Outside the sample, all checked by mapping lines to printed pages, and all agree:

- borel1977: §§3.3–3.5 (pp.620–622), Proposition 4.3 (pp.623–625), §5.2 (pp.626–627), §5.3 and Proposition 5.4 (pp.627–628), Theorem 5.5 (p.628, proof pp.629–630), Theorem 6.2 and proof (pp.631–632).
- burgos2002: Chapter 8, Propositions 8.9, 8.10, 8.14 and Theorems 8.12, 8.15 (pp.70–73); Definition 9.24 (p.86); Lemma 9.18 (p.84).
- borel1974: Theorem 7.5 (p.259, line 934), §11.4 (p.267, line 1246), Proposition 12.2 (p.271, line 1377).

### Adversarial pass (changed passages, sampled sections, and the R02 instance)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `exists_pos_rat_dedekindZeta_of_isTotallyReal` | ℚ, n=2, 4; ℚ(√5), n=2, 4; ℚ(√2), n=2 | q=1/6, 1/90. Numerically √5·ζ_F(2)/π⁴=0.0266667=2/75; √5·ζ_F(4)/π⁸=1/4218.75=4/16875; √8·ζ_F(2)/π⁴=0.0416667=1/24. All q>0 | holds | none |
| same, boundary and junk values | n=0, 1; ℚ(i), n=2; ℚ, n=3 | Mathlib `LSeries` is a `tsum`, which is 0 when the series is not summable. At n=0, 1 this forces √Δ·0=q·π^k, so q=0 and 0<q fails: `2 ≤ n` is essential. ℚ(i): d₂=r₂=1 (positive rank, excluded by `IsTotallyReal`). ℚ, n=3: d₃=1 (excluded by `Even`) | hypotheses cut out exactly dₙ=0 | none |
| §5.1 rank-zero sentence against §5.1 phase | totally real even n: E=r₂+(2n−1)dₙ−Nn=−nN | ℚ, n=2: E=−2, i^E=−1. ℚ(√5), n=2: E=−4, i^E=1. Empty comparison 1 gives √Δζπ^(−Nn)∈ℚˣ, positive | agrees with Lean | none |
| §5.1 ℚ(√5) Check | L(2,χ₅) numerically 0.706211 = 4π²/(25√5) | ζ_F(2)=1.161671; √5ζ_F(2)/π⁴=2/75; 1÷(2/75)=75/2 | holds | none |
| §3.2 and Lean, a≥1 | a=0, 1, 2, 3 over ℚ; ℚ(i), a=2 | a=0: finrank≥1>0, excluded. a=1: D=F, 1=1², ℝ⊗F≅M₁(ℝ). a=2: (−1,3) has symbols −1, −1, +1 at 2, 3, ∞ (product 1). a=3: invariants ⅓, −⅓, dimension 9. ℚ(i): ½ at (1+i) and (3), no real place | holds | none |
| §1.3 with n≥2 | ℚ, n=1–4; ℚ(i), n=2; ℚ(√5), n=3 | n=1: d₁=1, but ζ(0)=−½ has order 0. Ratios: −1/12÷1/6=−½; ζ′(−2)=−ζ(3)/(4π²) gives −¼; 1/120÷1/90=¾. ℚ(i): ζ*(−1)=ζ(−1)L′(−1,χ₋₄)=−G/(6π) against 2ζ_F(2)/π³=G/(3π), ratio −½. ℚ(√5): d₃=2, ζ*(−2)=ζ′(−2)L′(−2,χ₅)=(25/16)√5π^(−4)ζ_F(3) | holds for n≥2 | none |
| DG locator | deligne_goncharov2005 line 275, 282, 406, 429–440 | §1.6 starts on p.7; Adams on p.9 | holds | none |
| §1.1 Vₙ, Cₙ | ℚ, n=1, 2, 3; ℚ(i), n=2, 3; real quadratic, n=2, 3; representative change | dims 1, 0, 1; 1, 1; 0, 2. Divided pairs (t,−t), (t,t); sign (−1)^(n−1)=−1, +1. Weight-3 generator −4π² has coordinate 1 | holds | none |
| §2.2 r_Bo | ℚ, n=2 (K₃(ℤ)=ℤ/48); mx=0; ℚ(i), n=2, 3 | r=0 into V₂(ℚ)=0; m·r(x)=0 ⇒ r(x)=0; coordinates (t,−t) and (t,t), as in §1.1 | holds | none |
| §3.1 and `period_eq_index` | zero class; M₂(ℚ); Hamilton (−1,−1); ⅓ with −⅓; ⅓ alone | 1=1. mk=1 so order 1, index 1 (degree 2 ≠ index). 2=2 with the real invariant counted, dimension 4. 3=3, dimension 9. Sum ⅓≠0, so no class | holds | none |
| §3.3 gauge | ω→2ω over ℚ; ℚ(i), h=3; h=0; 2dxdy→dxdy | 2·½=1; 4^(−3/2)·2³=1; point mass 1, and with ω=2 the masses are 2 and ½; factor 2^(−hr₂)=⅛ for ℚ(i), h=3 | holds | none |
| §3.5 local masses | q=2, a=2, 3; ω=2ω_std at 2; exponent bookkeeping | 6/8=¾; 168/256=21/32=(¾)(⅞); (½)(¾)=⅜, correction ½. Exponent −(a²−1)+(a²−a)/2+(a²+a)/2−1=0, so m_v=∏_{k=2}^{a}(1−Nv^(−k)) | holds | none |
| §3.6 volume | index-3 U′; ℚ(√5), a=2; M₂(ℚ) | H(A_f)=H(F)U′ gives [Γ_U:Γ_U′]=3, and 3vol·m_f/3=1. Δ^(h/2)=5^(3/2). SL₂(ℤ)\SL₂(ℝ) is noncompact | holds | none |
| §4.1 Q(A) | Λ(x₃,x₅) in degree 8; Λ(x₃) in degrees 3, 6; k; k[u₂] in degree 4 | dim H⁸=1 but Q⁸=0; Q³ has dimension 1 and Q⁶=0; Q=0 with ∧⁰0=k generated by 1; Q⁴=0 though u₂²≠0 | holds | none |
| §5.3 lattice | ℚ, n=2; tℤ and 2tℤ; ℤ+√2ℤ; tℚ | {0} has covolume 1; \|t\| and 2\|t\|, index 2; ℤ+√2ℤ is not discrete (rank 2 against 1); t/m→0 | holds | none |
| §5.4 covolume | ℚ, n=2, 3; ℚ(i), n=2, 3; burgos2002 (9.1), (9.4), (9.5) | ratios −12 and 6; exponent −2; 2ζ_F(2)/π³ and 2ζ_F(3)/π⁵; ℚ, n=3: R=(2π)·2·R′ and R′∼π^(−1)ζ*(−2), so R∼ζ(3)/π² | holds | none |
| §5.5 S and orders | S=∅; S∋(2) with K_{2n−2}(𝔽_q)=0; K₁(ℤ)→K₁(ℤ[½]); indices 2, 3 | ratio 1; surjective in degree 2n−1≥3 so rank dₙ; unit ranks 0 and 1 (excluded); 3/2 | holds | none |
| §6.1 point quotient | n=0–3; z=1, i, 1+i; ℚ, n=2, 3 | P₁(1)=0, P₁(i)=i; P₂(1)=1, P₂(i)=0; 1+i−P₁=1∈ℝ(2), 1+i−P₂=i∈ℝ(3); junk P₀(1)=1; fixed quotient dims 0, 1 | holds | none |
| §6.2 Bo=2Be | ℚ, n=2, 3; ℚ(i), n=2; real quadratic, n=3; r_Be=0 | 2^d=1, 2, 2, 4; 2·0≠t | holds | none |
| §6.3 Adams | ℚ, n=3, a=2; real quadratic, n=3, a=2; ℚ, n=2; a=1 | 8; 8²=64; empty determinant 1; 1 | holds | none |
| §5.2 conversion, cross-check | Cartan map C(g)=ggᵗ on π_{2p−1}(SU), p=3, 5; n=1 | Transpose acts by (−1)^(p+1), so C has multiplier 2 at p=3, 5, consistent with indices 2 and 1 after the quotient. At n=1: π₁(SU)=π₁(SU/SO)=0, so the lattice is {0} in a 1-dimensional V₁(ℚ) | fails at n=1 | R02 |

The round-1 table carries computed rows for every other section. I relied on it for the sections that are neither sampled nor touched by the repair: 1.2, 2.1, 2.3, 3.4, 4.2–4.6 and 5.2 apart from the row above.

### Library declarations opened at the pins (file:line)

- **Mathlib.**
  - `card_add_two_mul_card_eq_rank` (NumberField/InfinitePlace/Basic.lean:474)
  - `discr`, `discr_ne_zero` (Discriminant/Defs.lean:36, 41)
  - `IsTotallyReal`, `nrComplexPlaces_eq_zero_iff` (InfinitePlace/TotallyRealComplex.lean:47, 52)
  - `Ideal.nonempty_primesOver` (GoingUp.lean:355)
  - `Submodule.mkQ`, `mkQ_surjective` (Quotient/Defs.lean:227, 236)
  - `CSA`, `BrauerGroup` (BrauerGroup/Defs.lean:40, 99)
  - `exteriorPower.map`, `map_id`, `map_comp` (ExteriorPower/Basic.lean:260, 293, 298) and `finrank_eq` (Basis.lean:173)
  - `ZLattice.covolume`, `covolume_pos`, `covolume_eq_det`, `covolume_div_covolume_eq_relIndex` (Covolume.lean:72, 98, 125, 148)
  - `IsZLattice` (ZLattice/Basic.lean:433)
  - `dedekindZeta` (DedekindZeta.lean:49), `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:77)
  - `Matrix.det_fin_zero` (Determinant/Basic.lean:798)
  - `riemannZeta_two`, `riemannZeta_four` (HurwitzZetaValues.lean:226, 232)
  - `LSeries` (LSeries/Basic.lean:164)
  - Every backticked library name in the README elaborates with `#check`.
- **Tau Ceti.**
  - `index` (CentralSimple/Index.lean:99), `index_eq_deg_of_algEquiv_matrix` (:112), `index_eq_deg_of_divisionRing` (:171), `index_pos` (:180), `exists_isSplittingField_finrank_eq_index` (:255)
  - `deg`, `deg_sq` (Degree.lean:163, 239)
  - `IsSplittingField` (Splitting.lean:120; matrix size existential)
  - `BrauerGroup.mk`, `mk_matrix`, `instCommGroup` (BrauerGroup/Group.lean:139, 159, 174)
  - `exists_eq_mk_centralDivisionRing` (Division.lean:69)
  - `brauerCohomologyEquiv` (CrossedProduct/Comparison.lean:267)
  - `exists_differentiableOn_eq_dedekindZeta_sub` (NumberField/DedekindZeta.lean:158)
  - `Hodge.tate` (Tate/Basic.lean:91)

### Duplication audit by object (pins, main, 330 open heads via `roadmaps grep`, board packages)

- **Period equals index over number fields.** No statement in either pin. Tau Ceti has only the quaternion case `TauCeti.Quaternion.orderOf_mk_eq_two` (BrauerGroup/Quaternion.lean:82) and `index_dvd_deg` (Index.lean:196). No roadmap Lean file states it.
- **Division algebras of every degree split at infinity.** No other owner.
- **Rank-zero rationality √Δζ_F(2k)π^(−2kN)∈ℚ.**
  - Absent from both pins.
  - `roadmaps grep --lean-only IsTotallyReal` and `dedekindZeta` find only Polylogarithms `zagierExistence_totallyRealEven`. That is a normalized-period statement over an empty family, which attributes the input to this roadmap.
  - IntegralIwasawaTheory §6.0 states values at 1−r (`totallyRealHeckeValue_rational`).
  - LFunctions Layer 3 has continuation, functional equation and the leading term at 0 only.
  - No duplicate, and the name does not collide.
- **Leading coefficient at 1−n.** LFunctions covers s=0 only.
- **Borel regulator.** No earlier roadmap plans it. PolylogarithmFunctions (main order line 45) excludes it explicitly; ColemanIntegration (156) and K3BlochGroups (116) come later.

### Supplier order and citations

The required command printed, against the brief's `merge-order/ORDER.txt`:

```text
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

Against board main's order (BorelRegulators at line 114) it printed the same line. There is no UPWARD, CYCLE or moved line.

`roadmaps resolve` reports no cross-roadmap citation or Lean name found nowhere. I resolved each cited section at the current head or on main:

- GeneralAlgebraicKTheory 2.5, 3.2, 3.12, 7.7, 7.8
- StableHomotopyKTheory 2.3–2.5, 3.37, 4.14
- ArithmeticKTheory 3.2–3.4
- ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4, ALS.0.9, ALS.5b.1
- AutomorphicFormsOnReductiveGroups 1.1–1.3
- AdelicAlgebraicGroups 1.2, 1.4, 2.2–2.5, 3.4, 4.2
- ArithmeticGaloisDuality R02.4.5b, R02.4.6
- IntegralIwasawaTheory 6.0
- CharacteristicClasses C5a.2–C5a.5; C6 item 3, which carries ch(u)=−v and the ordered suspension
- TopologicalKTheory T4; T7 item 1, which carries c(a)=2u² and c(b)=u⁴
- DifferentialGeometry Layers 5, 6, 8
- SchemeKTheoryOperations 6.8
- AlgebraicTopology Stage 5 item 5
- ClassFieldTheory Layers 5, 10
- SemisimpleAlgebras Layer 6
- LFunctions Layer 3
- Consumers: Polylogarithms 2.3, 3.7, 3.8, 4.4, 4.7; ColemanIntegration L3.Fc.1; HeightsRationalPointsAndObstructions 3.6; HabiroNahmSeries 1.5

### Gaps

All 12 slugs, suppliers and `needs` sentences agree mechanically between `design/plan.json` and the README contracts. None is unowned, vague or compound.

Minimality was checked against the pins and the earlier roadmaps:

- There is no index∣[L:K] for an arbitrary splitting field in Tau Ceti `Algebra/CentralSimple` or `Algebra/BrauerGroup` (only `index_dvd_deg`).
- The quaternion case of τ(SL₁(D))=1 appears as the first step of GeometryOfNumbersAndQuadraticArithmetic `quaternionAdjointTamagawa` (its README line 1546; main order line 82). FuchsianOrbifolds L7 also has it. Neither states degree a≥3, which §4.4 needs (degree j+1 for every j), so gap:classical-tamagawa-proof remains minimal.
- EndoscopicTransferAndUnitaryTraceComparison §6.2 is later in main's order.

## Not verifiable

- weil1961 (§3.3, Theorem 3.3.1): settled as waived; cited only through borel1977 line 227.
- beilinson1985 (§§1–2): settled as uncertified (paywalled); historical citation only.
- MotivicEtaleKTheory "universal-realization layer": a design-stage board target with `target.md` only, so it has no numbered section. Both uses are declared gap contracts.
- PeriodsAndSpecialValues PS.3.2a: a consumer citation. Its README is not in any local checkout. The board index lists the same head, 9f14c68, that round 1 read at README line 743, so I made no API call.
- Ownership against open roadmap pull requests was checked only through the `roadmaps` index of 2026-10-23T20:46Z, with no other copies. The brief gives no checkout paths for the sibling pull requests.

## Source issues

- **Misprint** in borel1977 at Proposition 2.4 proof, pp.618–619: the source writes the rational points and the adelic quotient with an undefined field F, as H(F) and H(A_k)/H(F); it should be the number field k, written H(k) as in §2.3; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "627bb70", "job": "REV-PKG-BorelRegulators~2", "model": "opus", "worker": "fable-rev34"} -->
