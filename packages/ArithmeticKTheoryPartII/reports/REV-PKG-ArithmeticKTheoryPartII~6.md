<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6899432380 -->
Review (claude) of cf35a29

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the d = 0 Check of §8.6 states the wrong characteristic number

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:1030`: "For d = 0 the empty partition has characteristic number 1 and contains no Bernoulli factor."

   **Claim.** For every smooth projective X/ℚ of dimension 0 the number `s=∫_(X(ℂ))∏_j ch_(n_j)(ω)` of the empty partition is 1.

   **Witness.** X = Spec ℚ(i) is smooth projective of dimension 0 over ℚ and X(ℂ) has two points; the empty product is the class 1 in H⁰, so s = 2. §8.6 (README:1022) does not assume X geometrically connected.

   **Exact repair.** Replace the sentence by: "For d = 0 the partition is empty and the characteristic number is the number of points of X(ℂ): 1 for X = Spec ℚ and 2 for X = Spec ℚ(i). It contains no Bernoulli factor." Keep the next sentence ("Its antecedent is false, so divisibility by every prime is not asserted.").

   **Repair test.** X = Spec ℚ(i): the repaired sentence gives 2 = #X(ℂ); X = Spec ℚ gives 1. In both the hypothesis "p divides the numerator of B_(n_i+1) for some i" is false, so the theorem asserts nothing, as the Check says.

2. **F02** (P3) three supplier contracts named in *Needs* lines are missing from the layers' Dependencies

   **Location.** README:269 (Layer 0 Dependencies), README:929 (Layer 7 Dependencies), README:1040 (Layer 8 Dependencies).

   **Claim.** Each Dependencies block lists what the layer's *Needs* lines list; Layer 0's block does so for "ArithmeticKTheory’s full-cyclotomic-cover descent contract" and Layer 3's for the Bernoulli nonvanishing contract.

   **Witness.** README:246 "SchemeKTheoryOperations §§6.1, 6.9–6.11 and its duality-transfer contract"; README:907 "KTheoryFiniteLocalFields §§1.1–1.2 and its sphere-unit contract"; README:997 "GeneralizedCohomology G5.4–G5.6 and its topological-symplectic-Hodge contract". The three blocks list the sections only.

   **Exact repair.** README:269: write "SchemeKTheoryOperations §§6.1, 6.9–6.11 and its duality-transfer contract". README:929: write "KTheoryFiniteLocalFields §§1.1–1.2 and its sphere-unit contract". README:1040: write "GeneralizedCohomology G5.4–G5.6 and its topological-symplectic-Hodge contract and TopologicalKTheory T4–T5, T7".

   **Repair test.** The *Needs* lines name five contracts: full-cyclotomic-cover (README:246), duality-transfer (246), Bernoulli nonvanishing (529), sphere-unit (907), topological-symplectic-Hodge (997). Before the repair two of five are in their blocks (README:269, 552); after it, five of five. The dependency check reads the *Needs* lines and is unaffected.

Two findings, both P3; none blocking. Both round-5 findings are repaired. The 15 sampled targets are supported by FGV at their locators, `Suggested.lean` elaborates with `sorry` as its only warning, every supplier citation resolves at the present heads, and the dependency check is clean. What remains is one Check whose stated value is wrong for a disconnected base, and three supplier contracts that the *Needs* lines name but the layers' Dependencies blocks omit.

## Earlier findings, checked first

| Round-5 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P3) two FGV page ranges one page short | Repaired | `packages/ArithmeticKTheoryPartII/README.md:753` now reads "(FGV, Lemma 7.7 and its proof, author copy pp. 39–41; FGV line 1805.)"; README:785 "(FGV, Theorem 7.1, Remark 7.2 and §7.3, author copy pp. 36–37, 41–42; FGV line 1668.)"; README:769 "author copy pp. 39–42". Page markers: p. 36 at FGV line 1622, p. 37 at 1671, p. 39 at 1764, p. 41 at 1866, p. 42 at 1914. Theorem 7.1 opens at 1668 (p. 36), §7.2 at 1778 (p. 39), Lemma 7.7 at 1805 (p. 39), §7.3 at 1874 (p. 41). |
| F02 (P3) three *Needs* edges absent from Dependencies, one from a contract header | Repaired | README:269 ends "`groupHomology`; ArithmeticGaloisDuality R02.2 (Hochschild–Serre and transgression)."; README:929 ends "EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6 (lisse integral coefficients and restriction)."; README:1040 has "§3.4; §4.3; §4.4"; README:139 "EtaleCohomologyFoundations §§F.0.2–F.0.3, F.4. Consume the finite étale Galois category and fundamental groupoid of Spec ℤ[1/p] (§F.0.2) …". §F.0.2 is a heading of EtaleCohomologyFoundations on main (its README line 200). |

Adversarial pass on the changed passages: the repair changed only locators and dependency lists (7 README lines; `Suggested.lean`, the manifest and the plan are unchanged), so no mathematical statement moved. The two repaired patterns were then searched for in the whole package:

- Page ranges. All 94 parenthesised FGV locators were checked against the page markers, start and end, including remarks and proofs that could spill over a page break (Remark 2.8 ends at FGV line 509, p. 11; Remark 3.11 ends at 1006, p. 22; Remark 7.15 ends on p. 47; Lemma 8.5's proof ends on p. 51; Theorem 6.6 opens at 1624, p. 36). No range is short.
- *Needs* against Dependencies. A script over all 45 *Needs* lines (229 items) finds every supplier section and cross-layer section in its layer's block. It also finds that three of the five supplier contracts the *Needs* lines name are missing from the blocks: R02.

## Verified sound

Read in full this round: the README (1051 lines, 9 layers, 42 target subsections), `Suggested.lean` (109 lines), `metadata.toml`, `sources.toml`, the plan's `gaps`, the round-5 review, its repair report and the repair's diff. Counts: 2 earlier findings checked (2 repaired); 15 seeded targets read at their FGV locators (15 supported); 94 FGV page locators checked against the page markers (0 slips); 3 Borel locators; 4 Lean declarations elaborated and compared; 2 theorems × 8 one-tactic probes (none closes); 25 supplier roadmaps opened at their present heads, over 100 cited sections or names resolved (all found); 17 pinned declarations opened; 14 gaps compared with the plan. No maintainer notes were left for this roadmap. The author flags no locator as unverified.

### Sources: the seeded sample

All against the cached 64-page FGV author copy.

| Target | Text read | Result |
| --- | --- | --- |
| 1.1 Betti and Hodge maps | FGV lines 789–865 | §3.1 (p. 18), Definition 3.2, §3.2.2, (3.1)–(3.2), Definition 3.3 (pp. 18–19). Groupoid of unimodular skew forms with orthogonal sum; plus construction at the commutator subgroup; c_B forgetful; c_H through Im h and U(g)⊂Sp₂g(ℝ). Supported. |
| 2.2 Trace polarization and CM realization | FGV lines 1127–1219 | §4.3, (4.7)–(4.13), Remarks 4.5–4.6 (pp. 25–27). Form −Tr b, Hermitian form −2i Σ_Φ, Rosati compatibility, equivalence onto the O-linear locus, Serre tensor for positive lines, (O,−1) gives the conjugate. Supported. |
| 2.3 Split primes with prescribed signs | FGV lines 1263–1293 | Lemma 4.8 (p. 28) and proof (pp. 28–29): narrow Hilbert class field of K_q⁺, (4.14)–(4.15), Chebotarev. README states the corrected embedding set (of the real subfield). Supported. |
| 2.4 CM types and ideal differences | FGV lines 1082–1126, 1151–1176, 1232–1274 | Definitions 4.3–4.4 (pp. 24–25), (4.10) (p. 26), Proposition 4.7 and proof (pp. 27–28). B′₁=O_q, B′₂=L⊗L̄⁻¹ with the imaginary generator δ⁻¹, then tensoring by (X,q) and its inverse. Supported. |
| 3.4 Betti–Hodge splitting | FGV lines 866–957 | Theorem 3.5 (pp. 19–20), Corollary 3.6 table 0, 0, K⊕ℤ_p, K (p. 20), §3.4 with (3.4)–(3.5) (pp. 20–21), proof with (1+ψ⁻¹,0) (p. 21). Supported. |
| 3.6 Periodic and K(1)-local comparison | FGV lines 964–1006 | §3.6, Corollary 3.10 for all i∈ℤ, Remark 3.11 with the two K(1)-local isomorphisms, all on p. 22. Supported. |
| 4.1 Polarized abelian Γ-groupoid | FGV lines 2729–2772 | A.4 (p. 59), (A.12) (p. 60): ring map ℤ^T→End(A) with Rosati-symmetric image, e=Σ_(t≠*)e_t, arrows on eA, functoriality by precomposition. Supported. |
| 5.3 Relative bar convention | FGV lines 1722–1746 | (7.5)–(7.8), p. 38; C₀(G,H;M)=0 at FGV line 1738. Supported. |
| 6.3 Finite-coefficient universal extension | FGV lines 1657–1693, 1874–1965 | Theorem 7.1 (pp. 36–37), Remark 7.2 (p. 37), §7.3 (pp. 41–42). Supported. |
| 7.1 Continuous universal extensions | FGV lines 1968–2008 | §7.4 (p. 43): topological Λ-modules, completed bar complex, (7.20). README's exactness of the reduction for finite-free M is the case the source's caveat at FGV line 2006 leaves open; the Tor computation is below. Supported. |
| 7.3 Local splitting and relative homology | FGV lines 2022–2035, 2067–2114 | Choice of the c-fixed prime (p. 44), Lemma 7.12 (p. 45), Lemma 7.13 and proof (pp. 45–46). Supported. |
| 7.4 Universal locally split extension | FGV lines 2044–2061, 2115–2121 | Theorem 7.10, Remark 7.11 (pp. 44–45), proof (p. 46). Supported. |
| 7.5 Bott-inverted universal extension | FGV lines 2122–2151 | (7.25)–(7.26), Theorem 7.14 (1)–(3), proof by periodicity in k, Remark 7.15 (pp. 46–47). Supported. |
| 8.4 Integral stable symplectic comparison | FGV lines 32–36, 2233–2255, 2295–2317 | Charney's range quoted twice (p. 1, p. 48), integral decomposables and (8.2) (pp. 48–49), Theorem 8.4 and proof (p. 50). README restricts the range to 2p−3 and to strict g>2i+5; both are inside what the source states. Supported. |
| 8.6 Bernoulli divisibility | FGV lines 2203–2259 | Theorem 8.1 and outline (pp. 48–49). README requires n_j<p strictly; supported in that range. The d=0 Check is R01. |

Also read: Definition 7.3, Lemmas 7.4 and 7.6 with proofs (FGV lines 1695–1777); Theorem 7.8 and Remark 7.9 (2009–2043); Proposition 6.1 (1533–1540); the statement of Theorem 6.6 and its lift convention (1613–1626); the atlas of A.4 and Proposition A.13 (2773–2797); borel1974 lines 1154, 1194, 1246–1253 (§10.6, Theorem 11.1, §11.4; the cached file has a cover page, so its page markers 32–34 are printed pp. 265–267).

### Computed adversarial record

"Retain" means the computed instance agrees with the statement. For text no repair touched and not recomputed here, the rows of rounds 2 to 5 carry values for every section and are relied on.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 object classification | rank 0, 1, 2; [[0,2],[−2,0]] | rank 0: empty form, g=0; rank 1: b(x,x)=0 forces b=0, det 0; h: det 1; second matrix: det 4 | Objects are hᵍ | Retain |
| §1.1 law c_B H=1+ψ⁻¹ | P=ℤ; −1∈GL₁(ℤ) | H(ℤ)=h of rank 2, so c_B H[ℤ]=2[ℤ]; diag(A,(Aᵀ)⁻¹)=diag(−1,−1), det 1 | Agrees with FGV line 953 | Retain |
| §1.1 splitting after inverting 2 | degree 0; degree 4k−2 | c_B lands in ψ⁻¹-invariants (form gives P≅P∨); c_B H=2 on K⁺ and 0 on K⁻; (1/2)·2=1; c_H H=0 in degree 4k−2 since ψ⁻¹=(−1)^(2k−1)=−1 on π_(4k−2)ku | H(K⁺)⊕ker c_B; H(K⁺)=ker c_H there | Retain |
| §1.1 polar Check | diag(2,1/2) | det P^(1−t)=2^(1−t)·2^(t−1)=1 | Agrees | Retain |
| §2.2 sign convention | ℚ(i), b=(i/2)x·ȳ, Φ={id} | h(x,y)=−2i·(i/2)xȳ=xȳ; h(1,1)=1; h(1,i)=−i; −Tr b(1,i)=−Tr(1/2)=−1; general: h(v,iv)=−i·h(v,v), so ω(v,J_Hv)=−h(v,v) | Im h=ω; native J is −J_H | Retain |
| §2.2 isogeny Check | multiplication by 2 on ℤ[i] | det 4; pulled-back form 4ω | Not an arrow | Retain |
| §2.3 Check | q=3 | (3+ζ₃)(3+ζ₃²)=9+3(−1)+1=7; x²+x+1 irreducible mod 2 | 7 splits, 2 inert | Retain |
| Lean `exists_split_prime_with_signs` | q=3, ε=±1; t=p-prime generator | t=±7: (7) prime in ℤ, 3∉(7), P=(3+ζ₃)≠P̄; the prime above p has P=P̄, excluded by P≠P̄ | True instance; ramified prime excluded | Retain |
| §2.4 `conjugateFractionalIdeal` | ℚ(i): (1), (0), (2+i), (1/2) | (1); (0); (2−i), product (5) against (2+i)²=(3+4i); (1/2) | Involution, multiplicative | Retain |
| §2.4 `IsSkewCMLine` | ℚ(i), B=ℤ[i]; δ=i/2, i, 0, −i/2; (2B, i/8) | (i/2)=𝔡⁻¹ since 𝔡=(2); (i)=𝓞 of index 4 in (1/2)𝓞; δ=0 excluded; −i/2 gives the conjugate type; (i/8)(2)(2)=(i/2) | Discriminates | Retain |
| Lean `exists_cm_lines_with_ideal_product` | general L; type Φ₀ and a flipped type | B₁=x, δ₁=δ′/t: (δ′/t)·x·x̄=(δ′/t)(t)=𝔡⁻¹; B₂=L·L̄⁻¹·x⁻¹, δ₂=δ′t: (δ′t)·L L̄⁻¹·L̄ L⁻¹·(t)⁻¹=𝔡⁻¹; Im τ(δ′/t) and Im τ(δ′t) have the sign of τ(t)·Im τ(δ′); B₁B₂=L·L̄⁻¹, a=1 | True with the source's construction | Retain |
| Lean hypothesis on Φ | q=5 | τ∈Φ ↔ τ̄∉Φ: one of each pair {1,4}, {2,3}: 4 types | Exactly the CM types | Retain |
| §3.4 p-adic table | i≡0, 1, 2, 3 mod 4 | twist 2k+1 at i=4k, 4k+1: ψ⁻¹=−1, plus part 0; twist 2k at 4k−2, 4k−1: +1; π_i(ku)⁻≠0 only at i≡2 | 0, 0, K⊕ℤ_p, K (FGV line 885) | Retain |
| §3.4 Checks | degree 0; p=3, degree 3 | p₊c_B on the plane class is 2, a unit mod odd q; K₃(ℤ)=ℤ/48, 3-part ℤ/3 | Agree | Retain |
| §3.6 | i=−2, −4, 1 | ψ⁻¹ on π_(2j)KU is (−1)ʲ: −1 at j=−1, +1 at j=−2; i=1: K₁(ℤ;ℤ/q)=0 and K₁^(β)(ℤ;ℤ/q)≅ℤ/q (class of p) of twist 1, plus part 0, so both KSp groups are 0 | Factor at −2 only; KSp comparison holds at i=1 although the K₁ one fails | Retain |
| §4.1 Γ maps | T={*,a,b}, grades (1,2) | fold a,b: 1+2=3; b↦*: grade 1; T={*}: e=0, eA=0 | Agree with (A.12) | Retain |
| §5.3 FGV differential | n=1, 2, 3 | d[g]⊗m=gm−m; d([g\|g′]⊗m)=[g]⊗g′m−[gg′]⊗m+[g′]⊗m; d∘d on degrees 2 and 3 expands to 0 (12 terms cancel in pairs) | Complex; degree-2 boundary is (7.5) | Retain |
| §5.3 comparison T_n with Mathlib | `inhomogeneousChains.d` at the pin; C₃ on 𝔽₇, g·m=2m | native d([x]⊗a)=ρ(x⁻¹)a−a; d_FGV([g]⊗1)=1, d_native([g]⊗1)=4−1=3, d_native([g⁻¹]⊗1)=1; degree 2: native d([g′⁻¹\|g⁻¹]⊗m)=[g⁻¹]⊗g′m−[g′⁻¹g⁻¹]⊗m+[g′⁻¹]⊗m=T₁(d_FGV); general n: face j of the native differential has sign (−1)^(j+1), FGV position n−j−1 has (−1)^(j+1) | T is a chain isomorphism | Retain |
| §5.3 Checks | C₂ sign ℤ/5; S₃ sign ℤ/5 | [c²]⊗m=[c]⊗(−m)+[c]⊗m=0, no relation: H₁=ℤ/5; a(sr,1)=1=1+0; a(s²,1)=0=−1+1 | Agree | Retain |
| §5.4 universal object | C₂, H=1, sign ℤ/5 | c(m,t)=(−m,t+m), c²(m,t)=(m,t+m−m); section m↦(m,2m): c(m,2m)=(−m,3m)=(−m,−2m) | Agree | Retain |
| §6.3 normalization | q=5 | c_B(3H(x))=6x=x; (1/2)H lands in ker c_H by the §1.1 row | Agree | Retain |
| §7.1 reduction law | M free; M=ℤ/p | Tor₁(M,ℤ/pⁿ)=0 for free M; =ℤ/p for M=ℤ/p | Exact for finite-free M only, as stated | Retain |
| §7.1 Checks | C₂ sign ℤ_p, H=1; Γ=ℤ_p trivial | H₁(C₂;M)=M^G/N=0, H₀=ℤ_p/2=0: relative H₁≅H₀(1;M)=ℤ_p; second: H₀(1)→H₀(Γ) is an isomorphism, relative H₁=H₁(Γ)=ℤ_p | Agree | Retain |
| §7.3 chain of isomorphisms | H=⟨c⟩ and D_q, M_q odd twist | c central in abelian D_q and −1 on M_q: H₀=H₁=0 for both; both relative H₁ equal H₁(G_q;M_q) | Second isomorphism holds | Retain |
| §7.3 Check | q=3 | class number of ℚ(ζ₃) is 1: G_q=D_q=C₂; H₁(C₂,C₂;M)=0 | Agree | Retain |
| §7.4 uniqueness | element of G_𝔭 with χ=−1 | acts by (−1)^(2k−1)=−1 on ℤ_p(2k−1) and by 1 on the kernel: Hom is 2-torsion in a ℤ_p-module, 0 | Unique section | Retain |
| §7.5 Check | q=5; k=0, 2 | 2k−1=−1≡3 mod 4; degrees −2 and 6 differ by 8=2·5⁰·4 | Twist preserved by the period | Retain |
| §8.4 bounds | i=0, 2; p=5, m=3, 4; p=3 | g>5: g≥6; g>9: g≥10; 2m=6≤7; 8>7; range 1≤i≤3 at p=3 | Agree | Retain |
| §8.6 range | n_j odd, n_j<p | n_j≤p−2, so 2n_j≤2p−4≤2p−3; n_j! is a p-unit; at p=3, 3!=6 has valuation 1 | Strict inequality suffices and is needed | Retain |
| §8.6 Check | p=691, n₁=11 | B₁₂=−691/2730; 11<691 | Agree | Retain |
| §8.6 Check d=0 | X=Spec ℚ, Spec ℚ(i) | #X(ℂ)=1, 2; README says 1 | False for the second | R01 |
| Probes | 2 theorems × 8 tactics | `rfl`, `simp`, `infer_instance`, `trivial`, `simp` with both definitions, `aesop`, `tauto`, tried as one `first` block on a scratch copy: both goals left unsolved | No padding | Retain |
| Repaired locators | §§6.1–6.3 | 1805–1871: pp. 39–41; 1668, 1684, 1874–1965: pp. 36, 37, 41–42; 1778–1965: pp. 39–42 | In range | Retain |
| All FGV page locators | 94 | start and end line inside the stated pages: 94 of 94 | No slip | Retain |
| Dependencies blocks | 9 layers, 229 *Needs* items | sections missing: 0; contracts missing: Layer 0: 1, Layer 7: 1, Layer 8: 1 | Incomplete | R02 |
| Gaps | README against plan | 14 = 14 slugs, same supplier, section and `needs` text | Declared | Retain |
| Merge order | positions | this roadmap 340; latest supplier GeneralAlgebraicKTheoryPartII 336; HermitianKTheoryOfPoincareCategories 63, ArithmeticKTheory 136, EtaleHomotopyTypes 239 | No upward edge | Retain |

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0; its only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used. The four elaborated types (`#check @` on a scratch copy, and the worker's signature file) keep every binder: p, n, primality, p≠2, 0<n, the field, number-field, cyclotomic and CM instances, ε, Φ with its one-per-conjugate-pair hypothesis, L≠0. Each equals the README statement in §§2.3–2.4; nothing changed. Form: one `import Mathlib`, one module docstring of the required shape, one namespace, a layer comment, a docstring on every declaration, two theorems, two definitions with real bodies; no `set_option`, `lemma`, sorry'd data, admitted `example`, `#eval`, `#synth` or `#print`.

Headline inventory from the Summary and the layers: the split-prime and CM ideal-product theorems (§§2.3–2.4) are stated. The module docstring names as not statable, each with its missing carrier: the Picard–Bott and Artin–transfer comparisons; Betti–Hodge splitting, the height-one comparison and CM generation; the coherent action and finite-genus detection; groupoid CM reciprocity; the universal relative extension; the finite, p-adic, locally split and all-twist universality theorems; degree 4k−1 triviality; the Vandiver criterion; the indecomposable product and Hurewicz theorems; the stable symplectic and rational Hodge comparisons; Bernoulli divisibility. Finite-rank stability (§8.4) is declared a supporting target in the docstring, as settled in round 1; its only source is cited by locator without the text. The library-matches file was read for all four declarations: no candidate states either theorem.

### Pinned declarations opened

`NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `ringOfIntegersComplexConj` (:237); `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`); `FractionalIdeal.spanSingleton` (`Mathlib/RingTheory/FractionalIdeal/Operations.lean:575`), `ringEquivOfRingEquiv` (:972); `FractionalIdeal.dual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:230`); `Module.Invertible` (`Mathlib/RingTheory/PicardGroup.lean:77`), `CommRing.Pic` (:429); `groupHomology.inhomogeneousChains.d` and `d_single` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, :132: first face with `A.ρ (g 0)⁻¹`, then `(-1)^(j+1)` on `Fin.contractNth j`), `Fin.contractNth` (`Mathlib/Data/Fin/Tuple/Basic.lean:1292`); `TauCeti.SymplecticForm.exists_compatible` (`TauCeti/Geometry/Symplectic/ExistsCompatible.lean`); `TauCeti.NumberFieldArithmetic.artinHomAway` (`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:45`); `gal_hilbertClassField_equiv_classGroup` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:293`). All 39 distinct backticked items of the README resolve: 4 are this roadmap's and are declared in `Suggested.lean`; `cyclotomicH2Descent` is ArithmeticKTheory §6.11's (its README line 3067); the three Hilbert-class-field names are ClassFieldTheory Layer 13's (its README lines 1960–1965).

### Cross-roadmap citations resolved

Main is `1a19c9f`; open heads are those of the index of 2026-11-15. Every cited section was found as a heading, or as the numbered item or stage the supplier itself uses, at: ArithmeticKTheory §§3.1, 3.5, 5.2, 6.11, 6.15, 6.16, 7.1, 7.5; GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c; SchemeKTheoryOperations §§6.1, 6.9–6.11; StableHomotopyKTheory §§3.20, 3.27, 3.34, 3.37, 4.16, 4.18, 4.21, 4.24–4.27, 5.1, 5.19, 7.1, 7.3, 7.4, 7.7, 7.9, 7.13, 7.17, 7.28; GeneralizedCohomology G2 (items 1–8), G3 (item 8), G5; TopologicalKTheory T4, T5, T7; SymplecticGeometry CotangentLagrangian C2.0, C2.1; BordismFormalGroups F6.3; GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20 (which states that the Bousfield classes of T(1) and K(1) agree at every prime); GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories §§0.5, 4.11, 6.6, 8.1, 8.3; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.1, 2.2; AbelianSchemesAndArithmeticModuli A5.4, A5.5, A5.8; PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; EtaleHomotopyTypes Layers 5–6, §§5.2, 5.3a, 6.6–6.9; ClassFieldTheory Layers 11–13; Chebotarev Layer 10; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2; ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4; AlgebraicTopology Stage 6 (§§6.0–6.6); BorelRegulators §2.1 (named in Scope as a non-supplier). `roadmaps resolve` on the README lists no citation and no Lean name found nowhere.

### Ownership, duplication and overlaps

The overlap file lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, and no second copy; the folder is not on main. Searches of main and of the open heads by object: symplectic K-theory of ℤ and its Galois action (cited as a reference in ArithmeticKTheory and EtaleHomotopyTypes, owned nowhere else; ArithmeticKTheory's scope, its README line 94, leaves "Arithmetic K-theory Part II" outside, and EtaleHomotopyTypes, its README line 16, assigns the arithmetic identification of the spectrum-level action to this roadmap and lists it as a consumer of its §§6.6–6.9); relative group homology (no match); the integral indecomposable quotient of an H-space (the one hit, in EllipticKTheory, is the indecomposable K₃ of a field, a different object); integral homology stability for Sp₂g(ℤ) (no owner; HomologicalStabilityOfGeneralLinearGroups treats general linear groups only). None of the four fully qualified names of `Suggested.lean` occurs on main or in an open roadmap pull request.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, StableHomotopyKTheoryPartII, ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheory, BordismFormalGroups, GeneralizedCohomology; nothing shared (periodic self-maps and telescopes: BordismFormalGroups F6.3 and GeneralAlgebraicKTheoryPartII §§4.1–4.3, cited; group completion and plus comparison: StableHomotopyKTheory §4.18, cited; finite-field K-groups: GeneralAlgebraicKTheory §13.8c, cited; arithmetic descent and tables: ArithmeticKTheory, cited).

### Gaps

All 14 slugs, suppliers, sections and `needs` sentences are identical in the README and in the plan's `gaps`; each stands under its supplier's contract subsection and each supplier is earlier in the merge order or on main. None was reopened; the round-5 checks of what the suppliers state (no relative group homology in ArithmeticGaloisDuality, no sphere-unit map in KTheoryFiniteLocalFields, descent for E=F(μ_m^(⊗i)) only in ArithmeticKTheory §6.11, no p-part class field in Tau Ceti) were not contradicted by the heads read this round.

### Supplier order

```text
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers and References are present. Layers are named by their mathematics. Definitions carry their laws and three to seven Checks; theorems carry hypotheses and a locator. No LaTeX delimiters, process words, pull-request numbers, dates, HTML anchors or machine paths in the README or the Lean file. The three cited works are in the manifest, one key each.

### Copyright and arrangement

Wording: for each of the 15 sampled locators the README text was set beside the source, and six further passages were compared: the Hermitian-form paragraph of Conventions (FGV lines 1137–1182), the definition of the extension category in §5.2 (FGV lines 1695–1703), the proof route of §7.3 (FGV lines 2029–2032), the description of the Čech nerve in §4.2 (FGV lines 2773–2785), the docstrings of `exists_split_prime_with_signs` (FGV lines 1263–1267) and of `IsSkewCMLine` (FGV lines 1101–1105), and the Sp row of §8.5 against borel1974 lines 1246–1250. No sentence is shared; the longest run of consecutive shared words found is a formula or a standard name. Nothing is taken over as it stands: no table, figure or list of examples (FGV Remark 8.2's examples and Borel's table are not reproduced).

Arrangement: FGV has 94 of the 97 locators. Its contents (FGV lines 13–22: §§1–8 and Appendix A) set beside the layers: Layer 0 ↔ parts of §2 (2.1.1, 2.4, 2.7, 2.8; §§2.2, 2.3, 2.5, 2.6 are supplier contracts); Layer 1 ↔ §§3.1–3.2, 3.6; Layer 2 ↔ §§4.2–4.4; Layer 3 ↔ §5 with Theorem 3.5 and Corollary 3.10; Layer 4 ↔ Appendix A.3–A.5 with §§6.1–6.2; Layer 5 ↔ §6.3 with §7.1; Layer 6 ↔ §§7.2–7.3; Layer 7 ↔ §§7.4–7.7; Layer 8 ↔ §8. The map is not one to one: §3 is split between Layers 1 and 3, §6 between 4 and 5, §7 among 5, 6 and 7, and the appendix is joined to §6. The order of Layers 3 to 8 is forced (§3.4 needs §§1.1, 3.2; §4.5 needs §3.5; §5.1 needs §§2.2, 4.4; §6.1 needs §§3.4, 3.5, 4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4), and Layer 2 needs §0.2. A roadmap of one article's main theorem cites that article most; no finding.

Source independence: 22 passages compared with 2 sources, none shared; largest share FGV, 94 of 97 locators; contents compared with FGV: independent (sections split and regrouped, order forced from Layer 2 on).

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled); not requested. FGV quotes the range as g≥2i+5 at FGV line 33 and as i<(g−5)/2 at FGV line 2236; the README's strict g>2i+5 is inside both.
- The FGV author copy was not collated against the journal's pagination; locators refer to the author copy, as the manifest says.
- GeneralizedCohomology G5.4–G5.6 and G2.1–G2.8 are numbered items inside sections G5 and G2, not headings; the sections and the item numbering were found, the individual items were not all read this round.

## Source issues

Only what was read this round is listed; the round-5 report lists five further misprints (Corollary 2.12, Remark 2.13, §5.1.2, §7.3, footnote 13) that were not read again.

- **Misprint** in FGV at §4.3, p. 26, FGV line 1193: the source describes the polarization-preserving units with a condition on a variable other than the one bound; it should bind one variable, the unit of norm one; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be those of the integers of the real subfield; affects nothing.
- **Misprint** in FGV at §6.3, p. 35, FGV line 1619: the source places the lift difference in the Galois group of H over a field K not introduced there; it should be over the CM field E; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source asks the section followed by the projection, composed in the wrong order, to be the identity of M; it should be projection after section; affects nothing.
- **Misprint** in FGV at Theorem 7.8, p. 43, FGV line 2014: the source calls the sequence one of G-modules with conjugation inside G; it should be the group Γ of the theorem; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole set of primes above p being a singleton; it should be the conjugation-fixed subset; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 59, FGV line 2747: the source says the Rosati involution is defined by the ring map φ; it should be defined by the polarization; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60, FGV line 2775: the source lists the abelian scheme twice in the rigidified tuple; it should be the scheme, its polarization and the action; affects nothing.
- **Misprint** in FGV at §1.1, p. 1, FGV line 33, against §8, p. 48, FGV line 2236: the source gives the stability range once as g≥2i+5 and once as i<(g−5)/2; it should be one range, to be settled from the primary source; affects nothing.
- **Gap** in FGV at Theorem 8.1, p. 48, FGV lines 2218 and 2223: the source allows p equal to the largest part and says the Chern character is then p-integral; it should require p larger than every part, since the factorial of p is not a p-unit; affects a stated result.
- **Gap** in FGV at the proof of Theorem 8.4, p. 50, FGV lines 2312–2316: the source splits the truncation through degree 2p−2, though the first reduced power links degrees 1 and 2p−2 of the loop space; it should justify the splitting only through degree 2p−3; affects a stated result.

## For the human reviewers

- **Licence.** `FGV` is read from an author page (`sources.toml`, `licence_class = "author-page"`); the published version is in *Inventiones Mathematicae* 230 (2022) and was not opened.
- **Not tested.** `charney1987`, the only source for §8.4's stability range, is paywalled and uncertified; its statement was read only as FGV quotes it (FGV lines 33 and 2236, which differ by the boundary case).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf35a29a6b82eef1b42b26d3a2e0703ed6ba4d6e", "job": "REV-PKG-ArithmeticKTheoryPartII~6", "model": "fable", "worker": "chris-x88"} -->
