<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6901262511 -->
Review (claude) of f5dac77

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the gap `pontryagin-bockstein-cap` asks for what the pinned Tau Ceti provides

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:163` and the same `needs` in the `gaps` list of `packages/ArithmeticKTheoryPartII/design/plan.json`: "Provide finite-type integral ℤ_p and finite-coefficient Pontryagin/Künneth products, cap and fundamental classes with natural coefficient Bocksteins and mixed Tor representative β_d(xy)."

   **Claim.** Pontryagin and Künneth products with ℤ_p and finite coefficients, cap products and fundamental classes are missing from the supplier and from the pinned libraries; the "From Tau Ceti" contract (README:43) lists only the symplectic and Artin declarations.

   **Witness.** Pinned Tau Ceti: `TopCat.pontryaginMul`, `TauCeti/AlgebraicTopology/Singular/Pontryagin/Basic.lean:298` (any commutative ring); `singularHomologyKunnethShortComplex_shortExact`, `Singular/Kunneth/Sequence.lean:230`; `singularCap`, `Cohomology/Cap/Basic.lean:101`; `HomologicalOrientation.fundamentalClass`. No Bockstein under `Singular/`.

   **Exact repair.**

   1. Replace the gap sentence, in README:163 and in the plan's `gaps` entry (same slug, supplier and section), by: "What AlgebraicTopology must provide (gap:pontryagin-bockstein-cap): For spaces with finitely generated integral homology, provide the coefficient Bockstein β_r:H_j(−;ℤ/p^r)→H_(j−1)(−;ℤ_p) on singular homology, natural in the space and compatible with the Pontryagin product of an H-space and with cap products, and identify the Künneth Tor class of a p^r-torsion and a p^s-torsion class with β_d(xy), d=min(r,s)."
   2. Append to "From Tau Ceti" (README:43): "For singular homology use `TopCat.pontryaginMul` in `TauCeti/AlgebraicTopology/Singular/Pontryagin/Basic.lean`, the Pontryagin product of a monoid object of `TopCat` with coefficients in any commutative ring, natural in the monoid and in the coefficients; `TopCat.singularHomologyKunnethShortComplex_shortExact` with its Tor map `TopCat.singularHomologyToTor` in `TauCeti/AlgebraicTopology/Singular/Kunneth/Sequence.lean`, valid when every module over the coefficient ring has projective dimension at most one (ℤ, ℤ_p and ℤ/p, not ℤ/p^r for r≥2); `TopCat.singularCap` in `TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean`; and the integral `TauCeti.HomologicalOrientation.fundamentalClass` in `TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean`. They supply no coefficient Bockstein on singular homology and no product for a multiplication that is associative or unital only up to homotopy." The namespaces were read at the pin: `namespace TopCat` at Pontryagin/Basic.lean:289, Kunneth/Sequence.lean:93 and Cap/Basic.lean:59; `TauCeti.HomologicalOrientation` at FundamentalClass.lean:91, the definition at :204.
   3. In the AlgebraicTopology contract (README:161) replace "All finite and integral coefficient operations used in the indecomposable quotient and in the family argument use the extension below." by "The products themselves are Tau Ceti's; the homology Bocksteins and their product compatibilities are the extension below."
   4. Add the four pinned names to the *Needs* lines of §§8.1–8.2 (README:953, 967) and to Layer 8's Dependencies (README:1040).

   **Repair test.** X = Y = K(ℤ/p,1). The pinned Künneth sequence gives Tor₁(H₁,H₁) = ℤ/p in degree 1+1+1 = 3, and the pinned product gives xy ∈ H₄(X×Y;ℤ/p) for x, y of degree 2. What §8.2 still needs is the class β₁(xy) ∈ H₃(X×Y;ℤ_p) and its equality with the Tor generator: both are in the narrowed sentence, and neither is at the pin (no file under `TauCeti/AlgebraicTopology/Singular` mentions a Bockstein; `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean` proves only exactness of chains in the coefficients). Nothing in the narrowed sentence is provided by the four declarations.

2. **F02** (P3) plain letters for number systems in five Checks

   **Location.** README:212 "the fractional ideals 2Z and 3Z"; README:462 "Hodge scalars 3 and 1 in F₅"; README:610 "N→ℤ on genus components"; README:630 "∐_N Spec ℂ … the discrete N grading"; README:759 "For σ in Gal(C/H_q)".

   **Claim.** These name ℤ, 𝔽₅, ℕ and ℂ.

   **Witness.** The same objects are written 2ℤ→3ℤ (README:265), 𝔽₇ and 𝔽_ℓ (README:717, 53), ℕ→ℤ (README:63) and Aut(ℂ) (README:616). ℂ over H_q is not algebraic, so "Gal" is not the group meant.

   **Exact repair.** README:212 "2ℤ and 3ℤ"; README:462 "in 𝔽₅"; README:610 "ℕ→ℤ"; README:630 "∐_ℕ Spec ℂ … the discrete ℕ grading"; README:759 "For σ in Aut(ℂ) fixing H_q pointwise".

   **Repair test.** After the change a search of the README for a bare Z, C, N or F used as a number system finds none; the remaining capitals are the cyclic groups C₂, C₃, the chain groups C₀, C_*, the nerve N and the categories C_Λ.

Two findings: one P2 (a declared supplier gap asks for constructions the pinned Tau Ceti already has) and one P3 (five plain-letter slips for number systems). Both round-6 findings are repaired. The 15 sampled targets are supported by FGV and Borel at their locators, `Suggested.lean` elaborates with `sorry` as its only warning, every supplier citation resolves at the present heads, and the dependency check is clean.

## Earlier findings, checked first

| Round-6 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P3) the d = 0 Check of §8.6 states the wrong characteristic number | Repaired | `packages/ArithmeticKTheoryPartII/README.md:1030` now reads "For d = 0 the only partition is the empty one, and s is the degree of the zero-cycle X(ℂ), its number of points: 1 for X = Spec ℚ and 2 for X = Spec ℚ(i)." Recomputed: #Hom(ℚ,ℂ) = 1, #Hom(ℚ(i),ℂ) = 2. |
| F02 (P3) three supplier contracts missing from Dependencies | Repaired | README:269 "SchemeKTheoryOperations §§6.1, 6.9–6.11 and its duality-transfer contract"; README:929 "KTheoryFiniteLocalFields §§1.1–1.2 and its sphere-unit contract"; README:1040 "GeneralizedCohomology G5.4–G5.6 and its topological-symplectic-Hodge contract". Each matches its *Needs* line (README:246, 907, 997). |

Adversarial pass on the changed passages. The repair changed four README lines; `Suggested.lean`, the manifest and the plan are unchanged.

- The new Check adds the sentence "Both values are units at every odd p, so the Bernoulli hypothesis cannot be dropped." Instance: X = Spec ℚ with an elliptic curve over ℚ, d = 0, the empty partition; every n_j < p holds vacuously; s = 1; v_p(1) = 0, so s ∉ pℤ_(p). The conclusion fails without the antecedent, as the Check says.
- The theorem of §8.6 on a base that is not geometrically connected: the class of X(ℂ) is the sum of the classes of its components and is Galois-stable because X is defined over ℚ, so the route's equivariant map ℤ_p(d) → H_(2d) exists. The statement and the new Check agree.
- The repaired pattern in the rest of the package: no other Check evaluates a characteristic number; the five contracts the *Needs* lines name (README:246 twice, 529, 907, 997) are all in their layers' Dependencies blocks.

## Verified sound

Read in full this round: the README (1051 lines, 9 layers, 42 target subsections), `Suggested.lean` (109 lines), `metadata.toml`, `sources.toml`, the plan's `gaps`, the round-6 review, its repair report and the repair's diff. Counts: 2 earlier findings checked (2 repaired); 15 seeded targets read at their locators (15 supported); 4 Lean declarations elaborated and compared; 2 theorems × 8 one-tactic probes (none closes); 24 supplier roadmaps opened at their present heads and 140 cited sections matched to headings or numbered items; 19 pinned declarations opened; 14 gaps compared with the plan. No maintainer notes were left for this roadmap. The author flags no locator as unverified.

### Sources: the seeded sample

All FGV rows against the cached 64-page author copy; page markers were read (p. 8 at FGV line 328, p. 9 at 376, p. 10 at 422, p. 11 at 466, p. 15 at 639, p. 16 at 683, p. 19 at 826, p. 20 at 873, p. 21 at 919, p. 24 at 1055, p. 25 at 1102, p. 27 at 1197, p. 28 at 1243, p. 29 at 1285, p. 34 at 1524, p. 37 at 1671, p. 38 at 1720, p. 39 at 1764, p. 41 at 1866, p. 42 at 1914, p. 43 at 1966, p. 44 at 2016, p. 45 at 2062, p. 46 at 2111, p. 47 at 2152, p. 48 at 2195, p. 59 at 2712, p. 60 at 2754, p. 61 at 2809).

| Target | Text read | Result |
| --- | --- | --- |
| 0.1 Universal cyclic Bott class | FGV lines 350–392 | §2.1.1 (p. 8), diagram (2.1), Lemma 2.3 (p. 8) and proof (p. 9): unique class for odd q, split polynomial subalgebra for q > 4, the case q = 3 set apart, pairing 1 with c₁ of the tautological character. Supported. |
| 0.2 Picard-to-K map | FGV lines 443–470 | §2.4, Definition 2.6, (2.3) (p. 10), the ring map to K(R) (p. 11). README corrects the source's morphism set (see Source issues). Supported. |
| 0.4 Cyclotomic transfer descent | FGV lines 667–704 | Proposition 2.15 and Remark 2.16 (p. 15), proof (p. 16): coinvariants, degrees 4k−2 (+) and 4k (−), all twists t, principal different. Supported. |
| 2.4 CM types and ideal differences | FGV lines 1082–1126, 1173–1176, 1232–1293 | Definitions 4.3–4.4 (pp. 24–25), (4.10) (p. 26), Proposition 4.7 (p. 27) and proof (p. 28), Lemma 4.8 and proof (pp. 28–29). Supported. |
| 3.4 Betti–Hodge splitting theorem | FGV lines 866–957 | Theorem 3.5 (pp. 19–20), Corollary 3.6 table 0, 0, K⊕ℤ_p, K (p. 20), §3.4 with (3.4)–(3.5) (pp. 20–21), proof with (1+ψ⁻¹, 0) (p. 21). Supported. |
| 4.1 Polarized abelian Γ-groupoid | FGV lines 2729–2772 | A.4 (p. 59), (A.12) (p. 60): ring map from ℤ^T with Rosati-symmetric image, e the sum of the non-basepoint idempotents, arrows on eA, functoriality by precomposition. Supported. |
| 4.4 Galois action on the symplectic spectrum | FGV lines 1541–1560, 2811–2862 | Proposition 6.2 (p. 34); A.5 and Remark A.14 (p. 61), compatibility (pp. 61–62): p > 3 direct, Moore smash before completion for small p, desuspend twice, limit over the tower. Supported. |
| 5.2 Split extension category | FGV lines 1695–1734 | Definition 7.3 (p. 37), (7.4)–(7.6) (pp. 37–38). README writes π∘s = id (see Source issues). Supported. |
| 5.4 Universal relative extension | FGV lines 1747–1777 | Lemma 7.4 (p. 38), Lemma 7.6 (a), (b) and proof (pp. 38–39). Supported. |
| 6.2 CM reciprocity identifies the universal cocycle | FGV lines 1874–1965 | §7.3 (pp. 41–42), (7.13)–(7.19): the cocycle from the ker c_B section, the lift-difference product, cancellation modulo ⟨c⟩-chains, final formula σ⊗x. Supported. |
| 7.2 p-adic universal extension theorem | FGV lines 1968–2021 | §7.4 (p. 43), Theorem 7.8 (p. 43) and proof (p. 44). Supported. |
| 7.3 Local splitting and relative homology | FGV lines 2022–2035, 2067–2114 | Choice of the c-fixed prime (p. 44), Lemma 7.12 (p. 45), Lemma 7.13 and proof (pp. 45–46). Supported. |
| 7.5 Bott-inverted universal extension theorem | FGV lines 2122–2151 | (7.25)–(7.26), Theorem 7.14 (1)–(3), proof, Remark 7.15 (pp. 46–47). Supported. |
| 7.6 Trivial action in degree 4k−1 | FGV lines 2154–2194 | §7.7, Remark 7.16 and footnote 13 (p. 47). README uses exponent 2k in the footnote's invariants (see Source issues). Supported. |
| 8.5 Rational stable Hodge generators | FGV lines 32–59; borel1974 lines 1154, 1194, 1246–1253 | FGV §1.1 (pp. 1–2): polynomial algebra on x₂, x₆, x₁₀, weight 2k−1 in homology. Borel §10.6, Theorem 11.1, §11.4 (printed pp. 265–267; the cached file's markers 32–34): symplectic row, polynomial generators in degrees 4i−2 at a real place. Supported. |

### Computed adversarial record

"Retain" means the computed instance agrees with the statement. For sections not listed, the rows of round 6 (which carry values) are relied on.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 characterisation of β_q | odd q | π₂ˢ(Bℤ/q) = 0 (H₂ = 0; H₁⊗ℤ/2 = 0), π₁ˢ = ℤ/q, π₁(S), π₂(S) are 2-groups: the mod-q group is ℤ/q | Bockstein–Hurewicz is an isomorphism | Retain |
| §0.1 sign | ℂP¹, u = c₁(O(1)) | ch(1−[O(−1)]) = 1−e^(−u) = u; ch([O(−1)]−1) = −u | bott = −β_Top pairs to +1 | Retain |
| §0.1 Check | q = 5; a = 2, a = 0 | 2·bott; 0·bott = 0 | Agree | Retain |
| §0.2 Check | R = ℤ, 2ℤ → 3ℤ | (3/2)·2ℤ = 3ℤ; 3/2 ∉ ℤ× = {±1} | Arrow exists only over Frac(R)× | Retain (glyphs: R02) |
| §0.3 target | k ≥ 1 | Br(O′_q) = 0 (one finite place, complex infinite places); H² = Pic/q ⊗ μ^(⊗(2k−1)); sign (−1)^(2k) = +1 | Positive summand | Retain |
| §0.4 at k = 0, negative part | coinvariants of Pic(O_q)/q | H²(ℤ′,μ_q) = Pic(ℤ′)/q ⊕ Br(ℤ′)[q] = 0 ⊕ (ℤ/2)[q] = 0; Δ-coinvariants of the p-class group are that of a layer of the ℤ_p-extension of ℚ, 0 | Agree | Retain |
| §0.4 Check | q = 9, k = 2 | a ↦ a³ on (ℤ/9)×: 2³ = 8, 4³ = 1, kernel {1,4,7}, image of order 2; [K₉:ℚ] = 6 | Trivialising field is K₃ | Retain |
| §0.5 | odd twist | −1 central acts by −1: H_*(Gal(K_q/ℚ);M_q) = 0 and H_*(⟨c⟩;M_q) = 0 | H₁(G_q;M_q) is the coinvariants; equals the relative group | Retain |
| §1.2 period | q = 5, 25 | 2·5⁰·4 = 8; 2·5·4 = 40; m/2 a multiple of φ(q), so χ^(m/2) = 1 mod q; m ≡ 0 mod 4 | Twist and degree class preserved | Retain |
| §2.1 | ℚ(i); (O,−1) | units with u·ū = 1: {±1, ±i}; (L,b)⊗(O,−1) = (L,−b), type conjugated | Agree | Retain |
| §2.2 sign | ℚ(i), b = (i/2)x·ȳ | h = −2i·(i/2)x·ȳ = x·ȳ; Im h(1,i) = −1; −Tr b(1,i) = −Tr(1/2) = −1; in general Im(−2i z) = −2 Re z | Im h = −Tr b | Retain |
| Lean `exists_split_prime_with_signs` | q = 3; general | t = ±7, 7 = (3+ζ₃)(3+ζ̄₃), 3 ∉ (7); general: a sign pattern gives a class in ker(Cl⁺ → Cl), a prime in it is (t) with signs ε·sign(u), replace t by t/u | True | Retain |
| Lean hypothesis `hodd` | p = 2, n = 2 | K = ℚ(i): t = ±5 = ±(2+i)(2−i), 2 ∉ (5); lines B₁ = B₂ = ℤ[i], δ = ±i/2, a = l̄/l | Both statements also hold there; FGV states them for odd q only, so the hypothesis is the source's and stays | Retain |
| Lean instance argument | `[IsCMField K]` | `IsCyclotomicExtension.Rat.isCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:564`) is a theorem needing 2 < n, not an instance | The argument is needed to elaborate | Retain |
| §2.4 inverse different | q = pⁿ | δ = w^(q/p)·q/(ζ^(q/p)−1), w = 1+ζ, w̄ = ζ⁻¹w: δ̄ = −δ; norm of (q/(ζ_p−1)) is p^(pⁿ⁻¹(n(p−1)−1)), the discriminant | Purely imaginary generator | Retain |
| §2.4 Checks | ℚ(i) | (i/2) = 𝔡⁻¹; (i) has index 4 in (1/2)ℤ[i]; (i/8)(2)(2) = (i/2) | Agree | Retain |
| §3.1–3.2 | q = 5; i = 1, 2 | {1,2}: 3; {4,2}: 1; i = 2: 1+4 = 0, 16+4 = 0; switching a pair changes the sum by −2aⁱ for odd i | Unit difference only for odd i | Retain |
| §3.2 Check | q = 5 | 3·bott = −3β_Top = 2β_Top; Chern value 3; 3β_Top would give −3 = 2 | Agree | Retain |
| §3.4 degree 0 and 3 | q odd; p = 3 | KSp₀ = ℤ/q → K₀⁺ = ℤ/q by 2; π₀(ku)⁻ = 0; K₃(ℤ) = ℤ/48, 3-part ℤ/3 | Agree | Retain |
| §3.4 kernel in degree 4k−2 | H⁰(ℤ′;μ_q^(⊗(2k−1))) | −1 acts by −1, invariants 0 | K_(4k−2)(ℤ;ℤ/q) is its positive part | Retain |
| §3.5 four-class value | ideal L | ([B₁]−1)+([B₂]−1) ≡ ([L]−1)−([L̄]−1); conjugation is −1 on β^(2k−1) and the trace is Galois-invariant: 2·tr(β^(2k−1)([L]−1)) | Factor 2 | Retain |
| §3.5 Checks | q = 5; q = 691, k = 6 | (4/π)²·(24/256)·√125 = 1.70 < 2; 4k−2 = 22 = 2·11, B₁₂ = −691/2730; 346·2 = 692 ≡ 1 | Agree | Retain |
| §4.1 | T = {*,a,b}; T = {*} | f* for b ↦ *: e_* ↦ e_*+e_b, selected genus 1; T = {*}: e = 0, eA = 0 | Agree with (A.12) | Retain |
| §4.4 action law | σ then τ | Spec(σ⁻¹)∘Spec(τ⁻¹) = Spec(τ⁻¹σ⁻¹) = Spec((στ)⁻¹) | Left action | Retain |
| §5.1 Check | a of order 3 in the minus part | a·c·a⁻¹ = a·(c a⁻¹ c⁻¹)·c = a²c ≠ c | Agree | Retain |
| §5.2 Checks | H = G; G = 1, M = T = Λ | relative chains 0, initial object M → M, also terminal; πs = id, sπ ≠ id on (0,1) | Agree | Retain |
| §5.3 differential | n = 1, 2, 3 | gm − m; [g]⊗g′m − [gg′]⊗m + [g′]⊗m; [g\|h]⊗km + [gh\|k]⊗m − [g\|hk]⊗m − [h\|k]⊗m | Matches (7.5) and the degree-3 Check | Retain |
| §5.4 forgetful equivalences | Λ, H, M general | Λ⊗^L over Λ[H] equals ℤ⊗^L over ℤ[H]; Hom over Λ[H] is Hom_Λ(H₀,T); Ext¹ has E₂ terms Ext¹_Λ(H₀,T) and Hom_Λ(H₁,T) | Both vanish under the hypotheses, M not projective allowed | Retain |
| §5.4 Check | C₂, H = 1, sign ℤ/5 | H₁(C₂;M) = 0, H₀(C₂;M) = 0, relative H₁ = M; c(m,2m) = (−m,3m) = (−m,−2m) | Equivariant section exists, differs from (m,0) | Retain |
| §6.2 Check | σ = c; χ = 2, k = 2 | [c]⊗m is a ⟨c⟩-chain, 0; 2³ = 8 ≡ 3 mod 5 | Agree | Retain |
| §7.1 Checks | Γ = H = 1; C₂ sign; Γ = ℤ_p trivial | 0; H₁ = H₀ = 0 so relative H₁ = ℤ_p; H₀(1) → H₀(Γ) an isomorphism so relative H₁ = H₁(Γ) = ℤ_p | Agree | Retain |
| §7.4 split subcategory | G_𝔭 on ℤ_p(2k−1) | an element with χ = −1 acts by −1: coinvariants M/2M = 0 | Lemma 7.6(b) applies | Retain |
| §7.5 Check | q = 5, k = 0 and 2 | twists −1 and 3, 3−(−1) = 4 = φ(5); degrees −2 and 6 differ by 8 | Agree | Retain |
| §7.6 restriction | k ≥ 1 | rational H⁰ and H¹ vanish on both sides (ℓ^(2k) ≠ 1; K_(4k−1)(ℤ) finite), so both H¹ are invariants of ℚ_p/ℤ_p(2k) | Isomorphism when ℓ generates | Retain |
| §7.6 Checks | (3,1,2); (5,1,2); (3,1,19) | 2²−1 = 3: ℤ/3, and 2 has order 6 mod 9; 3 is a 5-adic unit and 2 has order 20 mod 25; 19²−1 = 360, 3-part 9, 19 ≡ 1 mod 3 | Agree | Retain |
| §7.7 | torsor of primes | c fixes a·𝔭₀ iff c a c⁻¹ = a; ℤ/3 with −1: one fixed point; with +1: three | Agree | Retain |
| §8.1 Check | ℝP∞, p = 2 | integral products vanish (odd·odd is even, H_even = 0); x_a·x_b = C(2j,a)·x_(2j), some binomial odd iff 2j is not a power of 2; β₁(x_(2j)) generates H_(2j−1) | Quotient ℤ/2 exactly in degrees 2^a − 1 | Retain |
| §8.2 Check | K(ℤ/p,1)² | Tor₁(ℤ/p,ℤ/p) in degree 3; β₁(xy), x, y of degree 2 | Agree (R01 concerns its supplier) | R01 |
| §8.3 range | E = ΣH(ℤ/3); E = Σku; p = 3 | Bℤ/3: y² = 2γ₂(y) is decomposable and β(γ₂) generates H₃, so the quotient is 0 in degree 3; γ₃ is indecomposable, quotient ℤ/3 ≠ π₅ = 0 in degree 5 = 2p−1. U: Hurewicz in degree 2n−1 is (n−1)!, a unit for n ≤ p | Holds through 2p−3; fails beyond for Bℤ/3 | Retain |
| §8.5 Check | χ = 2 over ℚ₅ | cohomology weights 2⁻¹, 2⁻²; homology 2, 4 | Agree with FGV line 44 | Retain |
| §8.6 Check d = 0 (changed) | Spec ℚ, Spec ℚ(i) | 1, 2; both p-units | Agree | Retain |
| §8.6 first Check | p = 691 | 11 < 691; 691 divides the numerator of B₁₂ | Agree | Retain |
| Probes | 2 theorems × 8 tactics | `rfl`, `simp`, `infer_instance`, `trivial`, `tauto`, `simp` with both definitions, `exact?`, `decide`, as one `first` block on a scratch copy: both goals remain | No padding | Retain |
| Gap `pontryagin-bockstein-cap` | pinned Tau Ceti | Pontryagin product, Künneth sequence with Tor, cap product, integral fundamental class: present; homology Bockstein, β_d(xy): absent | Not minimal | R01 |
| Other 13 gaps | suppliers' heads | ArithmeticKTheory §6.11 still uses E = F(μ_m^(⊗i)) (its README line 3064); no relative group homology in ArithmeticGaloisDuality; no sphere-unit map in KTheoryFiniteLocalFields §§1.1–1.2 | Still needed | Retain |
| Merge order | positions | this roadmap 340; latest supplier GeneralAlgebraicKTheoryPartII 336; EtaleHomotopyTypes 239; ComplexMultiplicationAndExplicitReciprocity 167; ArithmeticKTheory 136 | No upward edge | Retain |

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0; its only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used. `#check @` for the four declarations on a scratch copy shows every binder: p, n, primality, p ≠ 2, 0 < n, the field, number-field, cyclotomic and CM instances, ε, Φ with its one-per-conjugate-pair hypothesis, L ≠ 0. Each type equals the README statement in §§2.3–2.4 and the worker's signature file; nothing changed. Form: one `import Mathlib`, one module docstring of the required shape, one namespace, a layer comment, a docstring on every declaration, two theorems, two definitions with real bodies; no `set_option`, `lemma`, sorry'd data, admitted `example`, `#eval`, `#synth` or `#print`.

Headline inventory from the Summary and the layers: the split-prime and CM ideal-product theorems (§§2.3–2.4) are stated. The module docstring names as not statable, each with its missing carrier: the Picard–Bott and Artin–transfer comparisons; Betti–Hodge splitting, the height-one comparison and CM generation; the coherent action and finite-genus detection; groupoid CM reciprocity; the universal relative extension; the finite, p-adic, locally split and all-twist universality theorems; degree 4k−1 triviality; the Vandiver criterion; the indecomposable product and Hurewicz theorems; the stable symplectic and rational Hodge comparisons; Bernoulli divisibility. The integral indecomposable quotient of §8.1 stays not statable after R01: the pin has the product but no homology Bockstein. The library-matches file was read for all four declarations: no candidate states either theorem.

### Pinned declarations opened

`NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `IsCyclotomicExtension.Rat.isCMField` (:564); `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`); `FractionalIdeal.spanSingleton` (`Mathlib/RingTheory/FractionalIdeal/Operations.lean:575`), `ringEquivOfRingEquiv` (:972); `FractionalIdeal.dual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:230`); `Module.Invertible` (`Mathlib/RingTheory/PicardGroup.lean:77`, bijectivity of the contraction, as the README says), `CommRing.Pic` (:429); `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`); `groupHomology.inhomogeneousChains.d` and `d_single` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, :132); `CategoryTheory.Under` (`Mathlib/CategoryTheory/Comma/Over/Basic.lean:631`); `TauCeti.SymplecticForm.exists_compatible` (`TauCeti/Geometry/Symplectic/ExistsCompatible.lean`, positivity `0 < ω v (J v)` in `AlmostComplex.lean:37`); `TauCeti.NumberFieldArithmetic.artinHomAway` (`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:45`); `gal_hilbertClassField_equiv_classGroup` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:293`); and for R01 `TopCat.pontryaginMul`, the Künneth sequence, `singularCap` and the fundamental class, at the lines given there. The four backticked names of this roadmap's own are declared in `Suggested.lean`.

### Cross-roadmap citations resolved

Main is `d1f3b7d`; open heads are those of the index of 2026-11-15. Every cited section was found as a heading, or as the numbered item or stage the supplier itself uses, at: ArithmeticKTheory §§3.1, 3.5, 5.2, 6.11 (with `cyclotomicH2Descent`), 6.15, 6.16, 7.1, 7.5; GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c; SchemeKTheoryOperations §§6.1, 6.9–6.11; StableHomotopyKTheory §§3.20, 3.27, 3.34, 3.37, 4.16, 4.18, 4.21, 4.24–4.27, 5.1, 5.19, 7.1, 7.3, 7.4, 7.7, 7.9, 7.13, 7.17, 7.28; GeneralizedCohomology G2, G3, G5 (items G2.5, G2.8, G5.4, G5.5 by number); TopologicalKTheory T4, T5, T7 (β = [O(−1)]−1 at its README line 810); SymplecticGeometry, CotangentLagrangian C2.0, C2.1; BordismFormalGroups F6.3; GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20 (which states that the Bousfield classes of T(1) and K(1) agree at every prime); GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories §§0.5, 4.11, 6.6, 8.1, 8.3; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.1, 2.2; AbelianSchemesAndArithmeticModuli A5.4, A5.5, A5.8; PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; EtaleHomotopyTypes Layers 5–6, §§5.2, 5.3a, 6.6–6.9; ClassFieldTheory Layers 11–13; Chebotarev Layer 10; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2; ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4; AlgebraicTopology Stage 6 (its README maps "Stage 6 items 0–5" to §§6.0–6.5 of its Layer 6, so the citation stands); BorelRegulators §2.1 (named in Scope as a non-supplier). `roadmaps resolve` on the README lists no citation and no Lean name found nowhere.

### Ownership, duplication and overlaps

The overlap file lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, and no second copy; the folder is not on main. Searches of main and of the open heads by object: the Galois action on symplectic K-theory of ℤ (FGV is cited as a reference by ArithmeticKTheory, owned nowhere else; ArithmeticKTheory's scope, its README line 94, leaves "Arithmetic K-theory Part II" outside, and EtaleHomotopyTypes, its README line 16, assigns the arithmetic identification of the spectrum-level symplectic action to this roadmap and at line 1081 lists it as a consumer of its §§6.6–6.9); relative group homology (no match); integral indecomposables of an H-space (no match as an object); integral homology stability for Sp₂g(ℤ) (no owner). None of the four fully qualified names of `Suggested.lean` occurs on main or in an open roadmap pull request. GeneralizedCohomology writes KSp for the quaternionic topological theory Σ⁴KO (its README line 1673), a different object from the KSp(ℤ) defined in §1.1 here; neither is a Lean name of this package.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, ChromaticHomotopyTheory, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheory, BordismFormalGroups, GeneralizedCohomology; nothing shared (periodic self-maps and telescopes: BordismFormalGroups F6.3 and GeneralAlgebraicKTheoryPartII §§4.1–4.3, cited; group completion and plus comparison: StableHomotopyKTheory §4.18, cited; finite-field K-groups: GeneralAlgebraicKTheory §13.8c, cited; arithmetic descent and tables: ArithmeticKTheory, cited).

### Gaps

All 14 slugs, suppliers, sections and `needs` sentences are identical in the README and in the plan's `gaps`; each stands under its supplier's contract subsection and each supplier is earlier in the merge order or on main. Thirteen are precise and still needed at the heads read; the fourteenth is R01.

### Supplier order

```text
depcheck: 243 roadmaps, 2263 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers and References are present. Layers are named by their mathematics. Definitions carry their laws and three to seven Checks; theorems carry hypotheses and a locator. No LaTeX delimiters, process words, pull-request numbers, dates, HTML anchors or machine paths in the README or the Lean file. The three cited works are in the manifest, one key each.

### Copyright and arrangement

Wording: for each of the 15 sampled locators the README text was set beside the source, and six further passages were compared: the Hermitian-form paragraph of Conventions (FGV lines 1165–1182), the definition of integral decomposables in §8.1 (FGV lines 2241–2248), the Vandiver paragraph of §7.7 (FGV lines 2036–2043), the Čech nerve of §4.2 (FGV lines 2773–2785), the docstrings of `exists_split_prime_with_signs` (FGV lines 1263–1267) and `exists_cm_lines_with_ideal_product` (FGV lines 1232–1235). No sentence is shared; the longest runs of consecutive shared words are formulas and standard names. Nothing is taken over as it stands: no table, figure or list of examples (the table of Corollary 3.6 is stated in a sentence, Borel's table is not reproduced).

Arrangement: FGV has 94 of the 97 locators. Its contents (FGV lines 13–22: §§1–8 and Appendix A) beside the layers: Layer 0 ↔ parts of §2; Layer 1 ↔ §§3.1–3.2, 3.6; Layer 2 ↔ §§4.2–4.4; Layer 3 ↔ §5 with Theorem 3.5 and Corollary 3.10; Layer 4 ↔ Appendix A.3–A.5 with §§6.1–6.2; Layer 5 ↔ §6.3 with §7.1; Layer 6 ↔ §§7.2–7.3; Layer 7 ↔ §§7.4–7.7; Layer 8 ↔ §8. The map is not one to one: §3 is split between Layers 1 and 3, §6 between 4 and 5, §7 among 5, 6 and 7, and the appendix is joined to §6. The order of Layers 3 to 8 is forced (§3.4 needs §§1.1, 3.2; §4.5 needs §3.5; §5.1 needs §§2.2, 4.4; §6.1 needs §§3.4, 3.5, 4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4), and Layer 2 needs §0.2. A roadmap of one article's main theorem cites that article most; no finding.

Source independence: 21 passages compared with 2 sources, none shared; largest share FGV, 94 of 97 locators; contents compared with FGV: independent (sections split and regrouped, order forced from Layer 2 on).

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled); not requested. FGV quotes the range as g ≥ 2i+5 at FGV line 33 and as i < (g−5)/2 at FGV line 2236; the README's strict g > 2i+5 is inside both.
- The FGV author copy was not collated against the journal's pagination; locators refer to the author copy, as the manifest says.
- GeneralizedCohomology G5.4–G5.6, G2.1–G2.8 and G3.8 are numbered items inside sections G2, G3 and G5, not headings; the sections and the numbering were found, the individual items were not all read.

## Source issues

- **Misprint** in FGV at §2.4, after Definition 2.6, p. 10, FGV line 455: the source takes the arrows between fractional ideals to be units of the ring; it should be nonzero elements of the fraction field carrying one ideal to the other; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be those of the integers of the real subfield; affects nothing.
- **Misprint** in FGV at the proof of Proposition 6.1, p. 34, FGV line 1536: the source reduces to genus φ(q) for the CM objects; it should be their genus φ(q)/2, the stated bound remaining sufficient; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source asks the section followed by the projection, composed in the wrong order, to be the identity of M; it should be projection after section; affects nothing.
- **Misprint** in FGV at §7.3, p. 41, FGV lines 1896 and 1903: the source writes g for the Galois element and Bott exponent k−1; it should be σ and exponent 2k−1; affects nothing.
- **Misprint** in FGV at Theorem 7.8, p. 43, FGV line 2014: the source calls the sequence one of G-modules with conjugation inside G; it should be the group Γ of the theorem; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole set of primes above p being a singleton; it should be the conjugation-fixed subset; affects nothing.
- **Misprint** in FGV at §7.7, p. 47, FGV line 2171: the source cites a Theorem 3.3 for injectivity of the Betti map; it should be Theorem 3.5; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47, FGV line 2193: the source lets the unit group act through the cyclotomic character to the power 2k−1; it should be the power 2k of the twist; affects nothing.
- **Misprint** in FGV at Appendix A.4, pp. 59–60, FGV lines 2747 and 2775: the source says the Rosati involution is defined by the ring map and lists the abelian scheme twice in the rigidified tuple; it should be the polarization, and scheme, polarization, action; affects nothing.
- **Misprint** in FGV at §1.1, p. 1, FGV line 33, against §8, p. 48, FGV line 2236: the source gives the stability range once as g ≥ 2i+5 and once as i < (g−5)/2; it should be one range, to be settled from the primary source; affects nothing.
- **Gap** in FGV at Theorem 8.1, p. 48, FGV lines 2218 and 2223: the source allows p equal to the largest part and says the Chern character is then p-integral; it should require p larger than every part, since the factorial of p is not a p-unit; affects a stated result.

## For the human reviewers

- **Licence.** `FGV` is read from an author page (`sources.toml`, `licence_class = "author-page"`); the published version is in *Inventiones Mathematicae* 230 (2022) and was not opened.
- **Not tested.** `charney1987`, the only source for §8.4's stability range, is paywalled and uncertified; its statement was read only as FGV quotes it (FGV lines 33 and 2236, which differ by the boundary case).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f5dac772406652d6e437296a6eed6fff8b5cd99b", "job": "REV-PKG-ArithmeticKTheoryPartII~7", "model": "fable", "worker": "chris-x79"} -->
