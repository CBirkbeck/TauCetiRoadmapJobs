<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6902520845 -->
Review (claude) of 68c3405

Verdict: accepted
Conditional on the announced gaps: `duality-transfer`, `topological-symplectic-hodge`, `cyclotomic-p-class-fields`, `ppav-embedding-atlases`, `cm-arbitrary-automorphism`, `relative-homology-edges`, `low-postnikov-finite-type`, `compact-relative-cocycles`, `bernoulli-weight-nonvanishing`, `sphere-unit-finite-field`, `pontryagin-bockstein-cap`, `graded-moore-realization`, `lisse-integral-extension`, `full-cyclotomic-h2-descent`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both round-7 findings are repaired, the repaired passages survive the adversarial pass, the 15 sampled targets are supported by FGV at their locators, `Suggested.lean` elaborates with `sorry` as its only warning, every supplier citation resolves at the present heads, and the dependency check is clean. The acceptance is conditional on the 14 declared supplier gaps (listed in `review.json`).

## Earlier findings, checked first

| Round-7 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P2) gap `pontryagin-bockstein-cap` asks for what the pinned Tau Ceti provides | Repaired | `packages/ArithmeticKTheoryPartII/README.md:165` now asks only for "the singular-homology coefficient Bockstein β_r:H_j(X;ℤ/p^r)→H_(j−1)(X;ℤ_p) … natural in X" and the Künneth Tor identification of β_d(x×y). README:45 names the pinned cross, Pontryagin and cap products, the Künneth sequence and the fundamental class. The plan's `gaps` entry carries the identical sentence (compared by script). The repair differs from the wording round 7 proposed: it drops "compatible with the Pontryagin product and with cap products" and adds the lift condition β_d(x)=p^(r−d)u. Both changes are correct (rows below). |
| F02 (P3) plain letters for number systems in five Checks | Repaired | README:214 "2ℤ and 3ℤ"; README:464 "in 𝔽₅"; README:612 "ℕ→ℤ"; README:632 "∐_ℕ Spec ℂ … the discrete ℕ grading"; README:761 "For σ in Aut(ℂ) fixing H_q pointwise". A search for a bare Z, Q, N, C or F used as a number system finds none. |

The repair also changed README:17 (Scope), README:163 (AlgebraicTopology contract), the route of §8.1, a new Check in §8.2, four *Needs* or Dependencies lines, and two bullets of the module docstring of `Suggested.lean`. Each was read and tested:

- **Gap sentence.** On Moore complexes e↦p^r f and e′↦p^s f′ with r≤s, β_r(e⊗e′) = f⊗e′ ± p^(s−r)e⊗f′. Its Künneth image in B⊗H is p^r f ⊗ p^(s−r)v, the element (u; p^r; p^(s−r)v), which generates Tor₁(ℤ/p^r,ℤ/p^s) ≅ ℤ/p^r. Changing x by a reduced integral class w changes β_d(x×y) by ±w×β_d(y), which lies in the tensor part, so the Tor image is well defined.
- **Lift condition.** For (r,s) = (2,1): d = 1 and im β₁ = ker p = p·ℤ/p², so β₁(x) = u is impossible and β₁(x) = pu exists. The condition is needed.
- **Dropped clause.** im β_r = ker p^r is torsion and Hom(torsion, ℤ_p) = 0, so the Hodge pairing of §8.4 kills Bockstein images without any further compatibility. Naturality of β_r in X gives "H-maps preserve D".
- **New §8.2 Check.** K(ℤ/p²,1)×K(ℤ/p,1): the degree-three Tor terms are (1,1): Tor₁(ℤ/p²,ℤ/p) = ℤ/p and (0,2), (2,0): 0. Taking d = max would give order p². Agrees with the theorem and the gap.
- **"From Tau Ceti" paragraph.** Every name was opened at the pin (list below). ℤ/p^r for r≥2: (p) ≅ ℤ/p^(r−1) is not free over a local ring, so not projective, as the paragraph says.
- **Docstring bullets.** `TopCat.pontryaginMul` takes `[MonObj G]`; no file under `TauCeti/AlgebraicTopology/Singular` or in Mathlib defines a homology Bockstein. The bullets are accurate.
- **Pattern elsewhere.** No other gap asks for a pinned declaration: the 13 other `needs` sentences were compared with the suppliers' heads and the pins (Gaps, below).

## Verified sound

Read in full this round: the README (1054 lines, 9 layers, 42 target subsections), `Suggested.lean` (112 lines), `metadata.toml`, `sources.toml`, the plan's `gaps`, the round-7 review, the round-8 repair report and the repair's diff. Counts: 2 earlier findings checked (2 repaired); 15 seeded targets read at their locators (15 supported); 4 Lean declarations elaborated and compared; 2 theorems probed with 9 tactics (none closes); 24 supplier roadmaps opened at their present heads and every cited section matched; 28 pinned declarations opened; 14 gaps compared with the plan. No maintainer notes were left for this roadmap. The author flags no locator as unverified.

### Sources: the seeded sample

All rows against the cached FGV author copy (64 pages). Page markers read: p. 10 at FGV line 422, p. 11 at 466, p. 15 at 639, p. 16 at 683, p. 17 at 732, p. 19 at 826, p. 20 at 873, p. 21 at 919, p. 22 at 962, p. 25 at 1102, p. 26 at 1147, p. 27 at 1197, p. 34 at 1524, p. 35 at 1573, p. 36 at 1622, p. 37 at 1671, p. 38 at 1720, p. 39 at 1764, p. 40 at 1809, p. 41 at 1866, p. 44 at 2016, p. 45 at 2062, p. 46 at 2111, p. 47 at 2152, p. 48 at 2195, p. 49 at 2243, p. 50 at 2289, p. 61 at 2809.

| Target | Text read | Result |
| --- | --- | --- |
| 0.2 Picard-to-K map | FGV lines 443–472 | §2.4, Definition 2.6, (2.3) on p. 10, ring map (2.4) on p. 11. The README takes arrows in Frac(R)×, correcting the source. Supported. |
| 0.4 Cyclotomic transfer descent | FGV lines 667–704 | Proposition 2.15, Remark 2.16 (p. 15), proof (p. 16): coinvariants, degree 4k−2 (+) and 4k (−), H² transfer for all twists t, principal different. Supported. |
| 0.5 Artin–Bott transfer square | FGV lines 705–760 | §2.8, (2.11)–(2.12), Proposition 2.17 with diagram (2.13) for all k∈ℤ, Hochschild–Serre (2.14), pp. 16–17. Supported. |
| 1.2 Bott-inverted symplectic K-theory | FGV lines 503–509, 964–996 | Remark 2.8 (p. 11): m = 2pⁿ⁻¹(p−1), telescope T. §3.6 (p. 22): (3.7), the p-adic limit, no period for the limit. The README allows positive multiples of m. Supported. |
| 2.2 Trace polarization and CM realization | FGV lines 1127–1196 | §4.3 (pp. 25–26): (4.7) −Tr b, (4.9) −2iΣ_Φ, (4.10), Rosati, norm-one units preserve the polarization. Supported. |
| 3.4 Betti–Hodge splitting theorem | FGV lines 866–957 | Theorem 3.5 (pp. 19–20), Corollary 3.6 table 0, 0, K⊕ℤ_p, K, §3.4 with (3.4)–(3.5), proof with (1+ψ⁻¹, 0) (p. 21). Supported. |
| 3.6 Periodic and K(1)-local comparison | FGV lines 989–1006 | Corollary 3.10 for all i∈ℤ, Remark 3.11 (p. 22). Supported. |
| 4.4 Galois action on the symplectic spectrum | FGV lines 1541–1560, 2811–2862 | Proposition 6.2 (p. 34); A.5 and Remark A.14 (p. 61): p > 3 direct, Moore smash first for small p, desuspend twice, limit over k. Supported. |
| 5.1 Groupoid CM reciprocity formula | FGV lines 1601–1656 | §6.3 (p. 35), Theorem 6.6 (i)–(ii), (6.3)–(6.4), (O_q,−1) for σ = c (p. 36). The README keeps only w_(cτ) = c∘w_τ (see Source issues). Supported. |
| 5.2 Split extension category | FGV lines 1695–1734 | Definition 7.3 (p. 37), (7.4)–(7.6) (pp. 37–38). The README writes π∘s = id. Supported. |
| 6.1 Finite arithmetic Galois action | FGV lines 1778–1871 | Points (a)–(c) (p. 39), Lemma 7.7 and proof (pp. 39–41): factoring through Gal(H_q/ℚ), weight χ^(2k−1), trivial kernel action, ⟨c⟩-splitting by ker c_B. Supported. |
| 7.3 Local splitting and relative homology | FGV lines 2022–2035, 2067–2114 | Choice of the c-fixed prime (p. 44), Lemma 7.12, Lemma 7.13 and proof (pp. 45–46). Supported. |
| 7.5 Bott-inverted universal extension theorem | FGV lines 2122–2151 | (7.25)–(7.26), Theorem 7.14 (1)–(3), proof, Remark 7.15 (pp. 46–47). Supported. |
| 8.3 Low-range integral Hurewicz theorem | FGV lines 2272–2317 | §8.1, (8.3), Example 8.3, Theorem 8.4 and proof (pp. 49–50). The source states degrees ≤ 2p−2; the README states 1 ≤ i ≤ 2p−3 and says so. Inside the source's range. Supported. |
| 8.6 Bernoulli divisibility for ppav families | FGV lines 2206–2259 | Theorem 8.1 and proof (pp. 48–49): cycle class, cap product, splitting of (8.1), (8.2), Bernoulli criterion. The README requires n_j < p (see Source issues). Supported. |

Two further locators outside the sample were read while checking the Lean headlines and a Check: Proposition 4.7 and Lemma 4.8 (FGV lines 1232–1293, pp. 27–29) and the example k = 6, p = 691 (FGV lines 80–85, p. 2). Both agree with §§2.3–2.4 and the §3.5 Check.

### Computed adversarial record

"Retain" means the computed instance agrees with the statement. For sections not listed, the rows of round 7 (which carry values) are relied on.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Gap: β_r, Tor identification | Moore complexes, r ≤ s | β_r(e⊗e′) = f⊗e′ ± p^(s−r)e⊗f′; Künneth image (u; p^r; p^(s−r)v), a generator of ℤ/p^r | Generator | Retain |
| Gap: lift condition | (r,s) = (2,1) | d = 1; im β₁ = p·ℤ/p²; β₁(x) = u has no solution, β₁(x) = pu has | Needed | Retain |
| Gap: choice of lift | x ↦ x + ρ(w) | change ±w×β_d(y), in the tensor part; Tor image 0 | Well defined | Retain |
| "From Tau Ceti": Künneth ring condition | ℤ/p², ℤ_p, ℤ/p | (p) ≅ ℤ/p not free over ℤ/p²; ℤ_p a PID; ℤ/p a field | As stated | Retain |
| §0.2 Check | R = ℤ | (3/2)·2ℤ = 3ℤ; 3/2 ∉ {±1} | Arrow needs Frac(R)× | Retain |
| §0.3 positive summand | k ≥ 1 | ψ⁻¹ is (−1)^(2k) = +1 on H²(μ^(⊗2k)) and (−1)^(2k−1) = −1 on H⁰(μ^(⊗(2k−1))); Br(O′_q) = 0 | H² = Pic/q ⊗ μ^(⊗(2k−1)) is the + part | Retain |
| §0.4 Check | q = 9, k = 2 | 4³ = 64 ≡ 1, 7³ = 343 ≡ 1 mod 9: kernel {1,4,7}, fixed field of degree 2; twist i+1 = 4 = 2k | K₃, as stated | Retain |
| §0.5 | odd twist | c central acts by −1: H_*(Gal(K_q/ℚ);M_q) = 0, H₀ = H₁ = 0 for ⟨c⟩ | H₁(G_q;M_q) ≅ H₁(G_q,⟨c⟩;M_q) | Retain |
| §1.1 | plane, rank one | ((x,ξ),(x,ξ)) = ξ(x)−ξ(x) = 0; −1 ↦ diag(−1,−1); c_B H([ℤ]) = 2[ℤ]; det diag(2,1/2)^(1−t) = 1 | Agree | Retain |
| §1.2 period | q = 5, 25 | 2·1·4 = 8; 2·5·4 = 40; m/2 a multiple of φ(q) | χ^(m/2) ≡ 1 mod q | Retain |
| §2.2 and Conventions sign | ℚ(i), b = (i/2)x·ȳ | b(1,i) = 1/2, ω(1,i) = −1; h(1,1) = 1, h(1,i) = −i; ω(v,iv) = Im(−i·h(v,v)) = −h(v,v) | Native J is −i | Retain |
| Lean `exists_split_prime_with_signs` | q = 3 | 7 = (3+ζ₃)(3+ζ̄₃) = 9−3+1; ±7 give both signs; 3 ∉ (7); 2 inert | True; split prime ≠ ramified prime, so P ≠ P̄ | Retain |
| Lean `exists_cm_lines_with_ideal_product` | general | B₁ = x, δ₁ = δ₀/t: (δ₀/t)x·x̄ = (δ₀) = 𝔡⁻¹; B₂ = L·L̄⁻¹·x⁻¹, δ₂ = δ₀t: B₂B̄₂ = (t)⁻¹; B₁B₂ = L·L̄⁻¹, a = 1; sign(t) = sign(1/t) | True | Retain |
| §2.4 Checks | ℚ(i) | 𝔡⁻¹ = (1/2) = (i/2); (i) of index 4; (i/8)(2)(2) = (i/2) | Agree | Retain |
| §3.2 | q = 5 | i = 1: {1,2} ↦ 3, {4,2} ↦ 6 ≡ 1; i = 2: 5 ≡ 0, 20 ≡ 0; switch changes the sum by −2aⁱ | Unit difference only for odd i | Retain |
| §3.3 unit term | k ≥ 1 | β^(2k−1) is in the (−) part; transfer commutes with ψ⁻¹; K_(4k−2)(ℤ;ℤ/q) = H² is all (+) since H⁰(ℤ′;μ^(⊗(2k−1))) = 0 | tr(β^(2k−1)) = 0 | Retain |
| §3.4 table | i ≡ 0, 1, 3 mod 4; i = 0 | weights 2k+1, 2k+1, 2k: signs −, −, +; π_(4k)(ku)^(−) = 0; degree 0 is ×2 on ℤ/q | 0, 0, K; isomorphism for odd q | Retain |
| §3.5 four-class value | ideal L | ([B₁]−1)+([B₂]−1) = ([L]−1)−([L̄]−1); conjugation is −1 on β^(2k−1) | 2·tr(β^(2k−1)([L]−1)) | Retain |
| §3.5 Checks | q = 5; p = 691 | 1.6211·0.09375·11.180 = 1.70 < 2; 2m = 22, m = 11; 346·2 = 692 ≡ 1 | Agree | Retain |
| §3.6 "agrees for i ≥ 0" | i = 0, 1 | K₀^β(ℤ;ℤ/q): H²(ℤ′;μ_q) = Pic/q ⊕ Br[q] = 0 (Br(ℤ′) = ℤ/2), H⁰ = ℤ/q. K₁^β = H¹(ℤ′;μ_q) = ℤ/q has ψ⁻¹ = −1, so its (+) part is 0 = K₁(ℤ;ℤ/q) | Plus parts agree in degree 1 although K₁ ≠ K₁^β | Retain |
| §3.6 Check | i = −2, −4 | ψ⁻¹ = (−1)^(−1) = −1; (−1)^(−2) = +1 | Factor ℤ/q, then 0 | Retain |
| §4.4 | g = 1, 2, ≥ 3 | H₁(Sp_(2g)(ℤ)) = ℤ/12, ℤ/2, 0 | Mod-p H₁ vanishes for p > 3; fails at p = 3, g = 1 | Retain |
| §4.5 | q = 5 | CM genus φ(5)/2 = 2; g = 4 = 2+2 | Agree | Retain |
| §5.1 Check | a of order 3, minus part | a·c·a⁻¹ = a·(c a⁻¹ c⁻¹)·c = a²c ≠ c | Lifts cannot all commute with c | Retain |
| §5.2 Check | H = G | terminal map f = π; initial map f = s, G-linear because H = G | M → M initial and terminal | Retain |
| §5.3 differential and T_n | n = 1, 2, 3 against `d_single` | native: ρ(g₀)⁻¹ on the first face, signs (−1)^(j+1). T_n turns the last-action face into the first; product face i ↦ index n−i−1 with (−1)^(n−i); last face (−1)^n | Term by term equal | Retain |
| §5.3 Checks | C₂ on ℤ/5; C₃ on 𝔽₇; S₃ | LES gives ℤ/5; g−1 = 1, g⁻¹−1 = 3; a(sr,1) = 1 = 1+0, a(1,1) = 0 = −1+1 | Agree | Retain |
| §5.4 Check | C₂, H = 1, ℤ/5 | c²(m,t) = (m, t+m−m); c(m,2m) = (−m,3m) = s(−m) | Agree | Retain |
| §6.3 Check | kernel ≠ 0 | a G-section gives endomorphisms id ≠ s∘π over M | Contradicts initiality | Retain |
| §7.1 Checks | C₂ sign on ℤ_p; ℤ_p trivial | H₁ = 0, H₀ = M/2M = 0, relative H₁ = M; H₀(1) → H₀(Γ) iso, relative H₁ = H₁(Γ) = ℤ_p | Agree | Retain |
| §7.3 second isomorphism | triple (G_q, D_q, ⟨c⟩) | H₁(D_q;M) = 0 and H₀(⟨c⟩;M) = 0 give H₁(D_q,⟨c⟩;M) = 0; H₀(D_q,⟨c⟩;M) = 0 | H₁(G_q,⟨c⟩) ≅ H₁(G_q,D_q) | Retain |
| §7.5 Check | q = 5, k = 0, 2 | twists −1, 3 differ by 4 = φ(5); degrees −2, 6 differ by 8 | Agree | Retain |
| §7.6 | (p,k,ℓ) = (3,1,2), (5,1,2), (3,1,19) | ℤ₃/(3) = ℤ/3; 3 a 5-adic unit; 360 = 9·40 gives ℤ/9 and 19 ≡ 1 mod 9 | Agree | Retain |
| §7.7 | torsor ℤ/3 | c = −1: one fixed point; c = +1: three | Fixed points = plus part | Retain |
| §8.1 Check | ℝP∞, p = 2 | r = 1: x_a·x_b = C(a+b,a)x_(a+b), β₁ injective on even degrees. r ≥ 2: even classes are 2^(r−1)γ, products carry 2^(2r−2) ≡ 0 mod 2^r | ℤ/2 exactly in degrees 2^a−1 | Retain |
| §8.3 range | E = ΣH(ℤ/3), p = 3 | degree 1: ℤ/3; degree 3: b² = 2γ₂(b) ≠ 0 and β₁(γ₂(b)) generates H₃, quotient 0 = π₃ | Holds on 1 ≤ i ≤ 3 | Retain |
| §8.4 | bounds | g > 2i+5: g ≥ 6 at i = 0, g ≥ 10 at i = 2; 2m ≤ 2p−3 gives m ≤ p−2; KSp_(4j)(ℤ)⊗ℤ_p = 0 | Agree with FGV line 2236 and the table | Retain |
| §8.5 Check | χ = 2 over ℚ₅ | class in H²(−;ℚ_p(1)): untwisted weight χ⁻¹ = 1/2, square 1/4 | Agree | Retain |
| §8.6 | p = 3, n = 3; p = 691; d = 0 | ch₃ = c₁³/6, v₃(6) = 1; n ≤ p−2 gives 2n ≤ 2p−4; B₁₂ = −691/2730; point counts 1 and 2 | Strict inequality needed; Checks agree | Retain |
| Probes | 2 theorems × 9 tactics | `rfl`, `simp`, `infer_instance`, `trivial`, `decide`, `tauto`, `simp` with both definitions, `exact?` in one `first` block: both goals remain | No padding | Retain |
| Other 13 gaps | suppliers' heads | ArithmeticKTheory §6.11 still takes E = F(μ_m^(⊗i)); no relative group homology in ArithmeticGaloisDuality; no sphere-unit map in KTheoryFiniteLocalFields; no range 2p−3 in StableHomotopyKTheory | Still needed | Retain |
| Merge order | positions | this roadmap 340; latest supplier GeneralAlgebraicKTheoryPartII 336; EtaleHomotopyTypes 239; ComplexMultiplicationAndExplicitReciprocity 167; ArithmeticKTheory 136 | No upward edge | Retain |

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0. Its only messages are "declaration uses `sorry`" at 55:8 and 98:8. No `TauCeti.*` import is used. `#check @` for the four declarations on a scratch copy shows every binder: p, n, primality, p ≠ 2, 0 < n, the field, number-field, cyclotomic and CM instances, ε, Φ with its one-per-conjugate-pair hypothesis, L ≠ 0. Each type equals the README statement in §§2.3–2.4 and the worker's signature file; nothing changed.

Form: one `import Mathlib`, one module docstring of the required shape, one namespace, a layer comment, a docstring on every declaration, two theorems, two definitions with real bodies. No `set_option`, `lemma`, sorry'd data, admitted `example`, `#eval`, `#synth` or `#print`.

Headline inventory from the Summary and the layers:

- Stated: the split-prime and CM ideal-product theorems (§§2.3–2.4).
- Named in the module docstring as not statable, each with its missing carrier: the Picard–Bott and Artin–transfer comparisons; Betti–Hodge splitting, the height-one comparison and CM generation; the coherent action and finite-genus detection; groupoid CM reciprocity; the universal relative extension; the finite, p-adic, locally split and all-twist universality theorems; degree 4k−1 triviality; the Vandiver criterion; the indecomposable product and Hurewicz theorems; the stable symplectic and rational Hodge comparisons; Bernoulli divisibility.
- The docstring also names integral homology stability of §8.4 as a supporting target that is not an acceptance headline. The Summary does not list it among the end theorems, and its only source is uncertified, so leaving it out is consistent with the rule that every stated theorem is one the roadmap is sure of.

The library-matches file was read for all four declarations: no candidate states either theorem.

### Pinned declarations opened

Mathlib: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `ringOfIntegersComplexConj` (:237), `IsCyclotomicExtension.Rat.isCMField` (:564, a theorem, so the instance argument in the Lean is needed); `NumberField.maximalRealSubfield` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:126`); `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`); `FractionalIdeal.spanSingleton` (`Mathlib/RingTheory/FractionalIdeal/Operations.lean:575`), `ringEquivOfRingEquiv` (:972); `FractionalIdeal.dual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:230`); `CommRing.Pic` (`Mathlib/RingTheory/PicardGroup.lean:429`); `groupHomology.inhomogeneousChains.d` and `d_single` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, :132); `CategoryTheory.Under` (`Mathlib/CategoryTheory/Comma/Over/Basic.lean:631`); `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:102`).

Tau Ceti: `TauCeti.SymplecticForm.exists_compatible` (`TauCeti/Geometry/Symplectic/ExistsCompatible.lean`); `TauCeti.NumberFieldArithmetic.artinHomAway` (`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean`); `gal_hilbertClassField_equiv_classGroup` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:293`); `TopCat.singularHomologyCross` (`TauCeti/AlgebraicTopology/Singular/CrossProduct.lean:100`, with `singularHomologyCross_naturality` :148 and `singularHomologyCross_coefficient_naturality` :179); `TopCat.pontryaginMul` (`TauCeti/AlgebraicTopology/Singular/Pontryagin/Basic.lean:298`, `[MonObj G]`, any commutative ring), `singularHomologyFunctor_map_pontryaginMul` (:340), `pontryaginMul_map_map` (:355); `TopCat.singularHomologyToTor` (`TauCeti/AlgebraicTopology/Singular/Kunneth/Sequence.lean:107`), `singularHomologyKunnethUnitShortComplex_shortExact` (:400, under `HasProjectiveDimensionLE V 1` for every module, :376); `TopCat.singularCap` (`TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean:101`); `TauCeti.HomologicalOrientation.fundamentalClass` (`TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204`); `TopCat.singularCohomologyBockstein` (`TauCeti/AlgebraicTopology/Cohomology/Bockstein.lean:127`).

What the pin does not include: `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean` proves exactness of chains in the coefficients and mentions Bocksteins in its header, but defines no homology Bockstein. The four backticked names of this roadmap's own are declared in `Suggested.lean`.

### Cross-roadmap citations resolved

Main is `c639cfa`; open heads are those of the index of 2026-11-15. `roadmaps resolve` on the README lists no citation and no Lean name found nowhere. Each cited section was then matched by script to a heading, or to the numbered item the supplier itself uses, in the supplier's README at its present head:

- ArithmeticKTheory §§3.1, 3.5, 5.2, 6.11 (with `cyclotomicH2Descent` and E = F(μ_m^(⊗i)) at its README lines 3063–3067), 6.15, 6.16, 7.1, 7.5.
- GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c. SchemeKTheoryOperations §§6.1, 6.9–6.11.
- StableHomotopyKTheory §§3.20, 3.27, 3.34–3.37, 4.16–4.18 (4.18 states the faithful-translation cofinal comparison), 4.21, 4.24–4.27, 5.1, 5.19, 7.1, 7.3, 7.4, 7.7, 7.9, 7.13, 7.17, 7.28.
- GeneralizedCohomology G2, G3, G5 (headings) and items G2.1–G2.8, G3.8, G5.4–G5.6 (numbered items inside those sections; G5.4 constructs ku and KU). TopologicalKTheory T4, T5, T7. SymplecticGeometry, CotangentLagrangian C2.0, C2.1. BordismFormalGroups F6.3.
- GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20 (states that the Bousfield classes of T(1) and K(1) agree at every prime).
- GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11. HermitianKTheoryOfPoincareCategories §§0.5, 8.1, 8.3 (headings), 4.11 and 6.6 (bold numbered items).
- ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.1, 2.2. AbelianSchemesAndArithmeticModuli A5.4 (item (1) is the elementary-divisor statement), A5.5, A5.8. PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9.
- EtaleHomotopyTypes Layers 5–6, §§5.2, 5.3a, 6.6–6.9. ClassFieldTheory Layers 11–13 (Layer 13 names `hilbertClassField` and `narrowHilbertClassField`). Chebotarev Layer 10 (a completed roadmap on main).
- ArithmeticGaloisDuality R02.1, R02.2, R02.4, R02.4.3. EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6. IntegralIwasawaTheory §§3.1, 7.4, 12.3. KTheoryFiniteLocalFields §§1.1, 1.2. ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4.
- AlgebraicTopology Stage 6: its README maps "Stage 6 items 0–5" to §§6.0–6.5 of its Layer 6, "cohomology, products, and manifold duality", so the citation stands. BorelRegulators §2.1 (named in Scope as a non-supplier).

### Ownership, duplication and overlaps

The overlap file lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, and no second copy; the folder is not on main. Searches of main and of the open heads by object:

- The Galois action on symplectic K-theory of ℤ: FGV is cited as a reference by ArithmeticKTheory and EtaleHomotopyTypes, and the action is owned nowhere else. ArithmeticKTheory's scope (its README line 94) leaves "Arithmetic K-theory Part II" outside.
- Relative group homology with its extension category: no owner (ArithmeticKTheory §3.2 and GeneralAlgebraicKTheoryPartII use relative homology of spaces and of matrix groups along a ring map, different objects).
- Integral indecomposables of an H-space: no owner. K3BlochGroups and EllipticKTheory use "indecomposable quotient" for K₃^ind, a different object.
- Homology coefficient Bockstein: DGFloer on main owns the integral/mod-2 chain sequence for its own Serre-sequence use (its README line 758). The gap here asks AlgebraicTopology for ℤ_p and ℤ/p^r coefficients with a Tor identification; this roadmap owns neither.
- None of the four fully qualified names of `Suggested.lean` occurs on main or in an open roadmap pull request.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, StableHomotopyKTheoryPartII, ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheory, BordismFormalGroups, TangentialBordism; nothing shared (periodic self-maps and telescopes: BordismFormalGroups F6.3 and GeneralAlgebraicKTheoryPartII §§4.1–4.3, cited; group completion and plus comparison: StableHomotopyKTheory §4.18, cited; finite-field K-groups: GeneralAlgebraicKTheory §13.8c, cited; arithmetic descent and tables: ArithmeticKTheory, cited).

### Gaps

All 14 slugs, suppliers, sections and `needs` sentences are identical in the README and in the plan's `gaps` (compared by script: each README line "What <Supplier> must provide (gap:<slug>): <needs>" is present verbatim). Each stands under its supplier's contract subsection, and each supplier is earlier in the merge order or on main. Each is still needed at the heads and pins read, and none asks for a pinned declaration.

### Supplier order

```text
depcheck: 239 roadmaps, 2269 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers and References are present. Layers are named by their mathematics. Every definition has its laws and at least three Checks (β_q: 4; Picard map: 4; c_B and c_H: 7; KSpᵝ: 4; coefficient-line groupoids: 4; ST: 4; `conjugateFractionalIdeal`: 3; `IsSkewCMLine`: 3; z classes: 4; A(T): 4; 𝒵(T): 5; the action: 4; C_Λ: 4; relative bar comparison: 7; continuous category: 4; Qᶦⁿᵗ: 4). Every theorem has its hypotheses and a locator. A scan of the README and the Lean file finds no LaTeX delimiters, process words, pull-request numbers, dates, HTML anchors or machine paths. The three cited works are in the manifest, one key each.

### Copyright and arrangement

Wording: for each of the 15 sampled locators the README text was set beside the source. Eight further passages were compared: the definition of H_q in Conventions (FGV lines 709–712), the unit-term argument of §3.3 (FGV lines 1433–1446), the genus bound of §4.5 (FGV lines 1533–1540), the Vandiver paragraph of §7.7 (FGV lines 2036–2043), the definition of D in §8.1 (FGV lines 2277–2282), the Tor argument of §8.2 (FGV lines 2326–2333), and the docstrings of `exists_split_prime_with_signs` (FGV lines 1263–1267) and `exists_cm_lines_with_ideal_product` (FGV lines 1232–1235). No sentence is shared; the longest runs of shared consecutive words are formulas and standard names. Nothing is taken over as it stands: the table of Corollary 3.6 is stated in a sentence, and no figure or list of examples is reproduced.

Arrangement: FGV is cited in 94 of the 95 locator parentheses (charney1987 and borel1974 each share one of them; one cites Mathlib only). Its contents (FGV lines 13–22: §§1–8 and Appendix A) beside the layers: Layer 0 ↔ parts of §2; Layer 1 ↔ §§3.1–3.2, 3.6; Layer 2 ↔ §§4.2–4.4; Layer 3 ↔ §5 with Theorem 3.5 and Corollary 3.10; Layer 4 ↔ Appendix A.3–A.5 with §§6.1–6.2; Layer 5 ↔ §6.3 with §7.1; Layer 6 ↔ §§7.2–7.3; Layer 7 ↔ §§7.4–7.7; Layer 8 ↔ §8. The map is not one to one: §3 is split between Layers 1 and 3, §6 between 4 and 5, §7 among 5, 6 and 7, and the appendix is joined to §6. The order from Layer 2 on is forced: §2.1 needs §0.2; §3.4 needs §§1.1, 3.2; §4.5 needs §§2.2, 3.5; §5.1 needs §§2.2, 4.4; §6.1 needs §§3.4, 3.5, 4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4. A roadmap of one article's main theorem cites that article most; no finding.

Source independence: 23 passages compared with 1 source, none shared; largest share FGV, 94 of 95 locators; contents compared with FGV: independent (sections split and regrouped, order forced from Layer 2 on). charney1987 could not be read (paywalled, uncertified); borel1974 is cited once, outside this round's sample.

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled); not requested. FGV quotes the range as i < (g−5)/2 at FGV line 2236; the README's g > 2i+5 is the same range.
- The FGV author copy was not collated against the journal's pagination; locators refer to the author copy, as the manifest says.
- GeneralizedCohomology G2.1–G2.8, G3.8 and G5.4–G5.6 are numbered items inside sections G2, G3 and G5, not headings. The sections and the numbering were found; of the items, G2.5, G2.8, G3.8, G5.4, G5.5 and G5.6 were opened.
- Whether FGV's Theorem 8.4 holds at its endpoint degree 2p−2 was not decided. The README states the range 1 ≤ i ≤ 2p−3 only, which is inside the source's.

## Source issues

Only passages read this round are listed.

- **Misprint** in FGV at §2.4, after Definition 2.6, p. 10, FGV line 455: the source takes the arrows between fractional ideals to be units of the ring; it should be nonzero elements of the fraction field carrying one ideal to the other; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be those of the integers of the real subfield; affects nothing.
- **Misprint** in FGV at the proof of Proposition 6.1, p. 34, FGV line 1536: the source reduces to genus φ(q) for the CM objects; it should be their genus φ(q)/2, the stated bound remaining sufficient; affects nothing.
- **Gap** in FGV at §6.3, before Theorem 6.6, p. 35, FGV line 1617: the source asks each lifted embedding to commute with conjugation on both sides, presupposing one conjugation of the class field; it should ask only that conjugate embeddings receive conjugate lifts; affects nothing.
- **Misprint** in FGV at §6.3 and Theorem 6.6, pp. 35–36, FGV lines 1619, 1629 and 1636: the source writes the Galois group of the class field over K; it should be over the CM field E; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source asks the section followed by the projection, composed in the wrong order, to be the identity of M; it should be projection after section; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole set of primes above p being a singleton; it should be the conjugation-fixed subset; affects nothing.
- **Gap** in FGV at Theorem 8.1, p. 48, FGV lines 2218 and 2223: the source allows p equal to the largest part and says the Chern character is then p-integral; it should require p larger than every part, since the factorial of p is not a p-unit; affects a stated result.

## For the human reviewers

- **Licence.** `FGV` is read from an author page (`sources.toml`, `licence_class = "author-page"`); the published version is in *Inventiones Mathematicae* 230 (2022) and was not opened.
- **Not tested.** `charney1987`, the only primary source for §8.4's stability range, is paywalled and uncertified; its statement was read only as FGV quotes it (FGV lines 33 and 2236, which differ by the boundary case).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68c3405f34521971d7cee5defc0724e26d581c72", "job": "REV-PKG-ArithmeticKTheoryPartII~8", "model": "fable", "worker": "chris-x88"} -->
