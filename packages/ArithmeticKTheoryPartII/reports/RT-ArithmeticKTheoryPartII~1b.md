<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6903668055 -->
Red team round 1 pass b (claude) of 68c3405

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.5 re-plans the Borel comparison that ArithmeticKTheory §3.4 owns

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:1013`: "Prove the stable rational symplectic comparison with the compact dual and identify its polynomial primitive generators in degrees 4k−2." Also line 1011 ("The stable polynomial calculation is a symplectic target here"), the *Needs* line 1021 and the scope sentence at line 15.

   **Claim.** The comparison of the real cohomology of Sp_(2g)(ℤ) with invariant forms is a new target of this roadmap, proved from §4.4, §3.4, §8.4, GeneralizedCohomology and TopologicalKTheory.

   **Witness.** ArithmeticKTheory §3.4 (head of its open pull request, README lines 1405–1424) states `borelInvariantFormComparison` for every connected semisimple ℚ-group with G(ℝ) connected and every arithmetic Γ: j_Γ^q is bijective for 4q<rk_ℚ(G_j) (Borel 1974, Theorem 7.5). Sp_(2g) qualifies with ℚ-rank g. None of the five listed needs supplies Borel's square-integrability argument; the "§3.4" in line 1021 is this roadmap's Betti–Hodge theorem.

   **Repair.**

   - Line 1013, replace the first sentence by: "Apply ArithmeticKTheory §3.4's `borelInvariantFormComparison` to G=Sp_(2g) and Γ=Sp_(2g)(ℤ), of ℚ-rank g with Sp_(2g)(ℝ) connected: H^q(Sp_(2g)(ℤ);ℝ) is the space of invariant q-forms on Sp_(2g)(ℝ)/U(g) for 4q<g, compatibly with block stabilization. Compute those invariant forms as the cohomology of the compact dual Sp(g)/U(g), which in degrees below g is polynomial on primitive classes in degrees 4k−2."
   - Line 1011, replace "The stable polynomial calculation is a symplectic target here" by "The arithmetic-to-invariant-form comparison is ArithmeticKTheory §3.4; the symplectic invariant-form calculation is a target here".
   - Line 1021 and the Layer 8 Dependencies: add "ArithmeticKTheory §3.4 (`borelInvariantFormComparison`)".
   - Line 15, after "supplies no symplectic stability theorem." add "ArithmeticKTheory §3.4 owns Borel's invariant-form comparison for every semisimple ℚ-group, consumed in §8.5 at Sp_(2g)."
   - Line 49: add §3.4's comparison to the consumed list.

   Tested on the refuting instance: at g=9, q=2 the range 4·2<9 holds and the supplier gives H²(Sp₁₈(ℤ);ℝ)=ℝ·x₂, the value §8.5 asserts.

2. **F02** (P2) §8.4 integral stability is a "prove" target with no proof route and no owner for its inputs

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:988`: "For every i≥0 and g>2i+5, prove that block stabilization H_i(Sp_(2g)(ℤ);ℤ)→H_i(Sp_(2g+2)(ℤ);ℤ) is an isomorphism". Line 159: "not the block-stabilization theorem, which is proved in §8.4."

   **Claim.** §8.4 proves Charney's stability theorem.

   **Witness.** The only route text (line 990) and the *Needs* line 992 (ArithmeticLocallySymmetricSpaces sections and §1.1) cover finite generation at each finite genus. Nothing supplies the connectivity theorem or the stabilizer spectral sequence. ArithmeticKTheory §3.2 says its bounds "are not homological stability bounds"; the open HomologicalStabilityOfGeneralLinearGroups roadmap treats GL only (no symplectic section in its headings).

   **Repair.** Insert after line 990:

   "One proof route for stability is as follows. Let Sp_(2g)(ℤ) act on the simplicial complex whose k-simplices are ordered (k+1)-tuples of mutually orthogonal hyperbolic pairs in hᵍ. By §1.1 the orthogonal complement of such a tuple is unimodular alternating of rank 2(g−k−1), hence isometric to h^(g−k−1); so the action is transitive on k-simplices with stabilizers Sp_(2(g−k−1))(ℤ). Two targets of this subsection carry the proof: (a) this complex is highly connected, with connectivity growing linearly in g; (b) the spectral sequence of the action, with E¹ built from the homology of the stabilizers, gives the stated range by induction on i. (Charney, the connectivity theorem and the spectral-sequence argument preceding Corollary 4.5, cited by locator.)"

   and extend line 992 to "*Needs:* ArithmeticLocallySymmetricSpaces §§ALS.0.8, ALS.1.5–ALS.1.6, ALS.2.3–ALS.2.4; §1.1 for the integral symplectic model and the transitivity statement; `groupHomology`." Record the two Charney locators under the existing `charney1987` key (uncertified).

   Tested: at g=1, k=0 the complement is rank 0 and the stabilizer is trivial, as the route says. If the roadmap prefers not to prove stability, the alternative is to delete the stability sentence of line 988 and the clause of line 159: no later target uses finite-genus stability (§8.4's Hurewicz quotient and §8.6 use only the stable colimit and KSp finite type from ArithmeticKTheory §3.5).

3. **F03** (P2) the Vandiver criterion is statable at the pins; the docstring says it is not

   **Location.** `packages/ArithmeticKTheoryPartII/Suggested.lean:24`: "The Vandiver criterion for conjugation-fixed primes lacks the compatible p-Hilbert class-field prime torsors at all cyclotomic levels."

   **Claim.** The headline of README §7.7 has no carrier at the pins.

   **Witness.** Pinned Tau Ceti, `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean`: `TauCeti.ClassFieldTheory.hilbertClassField` (line 241), `hilbertClassArtinEquiv : ClassGroup (𝓞 K) ≃* Gal(hilbertClassField K/K)` (line 262), `numberField_rayClassField` (line 139); no `sorry` in the file. H_q is a fixed field in it, and the plus part is `classNumber (maximalRealSubfield K)`.

   **Repair.** Delete the Vandiver bullet from the module docstring, add `import TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField`, and state the finite-level criterion under `/-! ## Layer 7 -/` with one definition. Intended shape (not elaborated in this pass; the repair worker elaborates and adjusts instances):

   ```lean
   /-- The p-Hilbert class field: the subfield of the Hilbert class field fixed by
   the elements of order prime to p. -/
   noncomputable def pHilbertClassField (p : ℕ) (K : Type) [Field K] [NumberField K] :
       IntermediateField K (TauCeti.ClassFieldTheory.hilbertClassField K) :=
     IntermediateField.fixedField (Subgroup.closure
       {σ : Gal(TauCeti.ClassFieldTheory.hilbertClassField K/K) | (orderOf σ).Coprime p})

   /-- For an involution σ of the p-Hilbert class field of ℚ(ζ_(p^n)) extending complex
   conjugation, exactly one prime above p is σ-stable if and only if p does not divide
   the class number of the maximal real subfield. FGV, Remark 7.9. -/
   theorem existsUnique_conj_fixed_prime_iff
       (p n : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (hn : 0 < n)
       (K : Type) [Field K] [NumberField K]
       [IsCyclotomicExtension ({p ^ n} : Set ℕ) ℚ K] [IsCMField K]
       (σ : pHilbertClassField p K ≃+* pHilbertClassField p K)
       (hσ : ∀ x, σ (σ x) = x)
       (hK : ∀ x : K, σ (algebraMap K _ x) = algebraMap K _ (IsCMField.complexConj K x)) :
       (∃! P : Ideal (𝓞 (pHilbertClassField p K)), P.IsPrime ∧ (p : 𝓞 _) ∈ P ∧
           ∀ x ∈ P, ∃ y ∈ P, (y : pHilbertClassField p K) = σ x) ↔
         ¬ p ∣ classNumber (maximalRealSubfield K) := by
     sorry
   ```

   README §7.7 gains the sentence naming `pHilbertClassField` and `existsUnique_conj_fixed_prime_iff`, with three Checks for the definition. Tested: at p=3, n=1 the class group is trivial, the field is K, σ is conjugation, the one prime (√−3) is fixed and 3∤h(ℚ)=1: both sides true. At p=37, n=1 (h⁻=37, h⁺=1) there are 37 primes, one fixed, and 37∤1: both sides true, while "the prime set is a singleton" is false. All involutions lifting c are conjugate (the minus part of an odd abelian group is its (1−c)-image), so the count does not depend on σ.

4. **F04** (P2) two gap sentences say "used here" instead of what is missing

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:135`: "…the finite and compact relative homological Hochschild–Serre edges for the arithmetic pairs used here." Line 113: "…coherent product/selfadjoint-factor refinements used by the graded Čech model." Same sentences in `design/plan.json` (`gaps`, slugs `relative-homology-edges`, `ppav-embedding-atlases`).

   **Claim.** Each sentence states exactly what the supplier must provide, with hypotheses.

   **Witness.** Neither names the pairs, subgroups, coefficients or atlas pieces. The pairs occur only in §§0.5, 7.2–7.3: (G_q,⟨c⟩), (G_q,D_q), (Γ,⟨c⟩), (G,G_𝔭); the supplier's README cannot be checked against "used here".

   **Repair.** Replace both, identically in the README and in `plan.json`:

   - `gap:relative-homology-edges`: "For a profinite group G, a closed subgroup H and a coefficient module M that is finite of odd prime-power order or finite free over ℤ_p with continuous action, provide the relative chain quotient C_*(G,H;M)=C_*(G;M)/C_*(H;M), its long exact sequence and naturality for maps of pairs; for a closed normal subgroup N provide the map H₁(G,H;M)→H₁(G/N,HN/N;M_N) and its Hochschild–Serre coinvariant edge from H₁(N,N∩H;M), in the cases (G_q,⟨c⟩) and (G_q,D_q) with N=Gal(H_q/K_q), (Γ,⟨c⟩), and (G,G_𝔭) with N=ker(G→G_q), for M=μ_q^(⊗j) or ℤ_p(j) with j odd."
   - `gap:ppav-embedding-atlases`: "For each g≥0 provide the quasi-projective ℚ-schemes, indexed by Hilbert polynomial, parametrizing genus-g principally polarized abelian schemes with a projective embedding by the third power of the symmetric ample bundle of the polarization; smoothness and joint surjectivity of these pieces over 𝔄_g⊗ℚ; and maps of these atlases covering the product 𝔄_g×𝔄_h→𝔄_(g+h) and the splitting of a ppav by a Rosati-fixed idempotent, associative and unital up to specified isomorphisms."

   Tested: the first sentence now contains the pair (G_q,D_q) of §7.3 and the pair (G_q,⟨c⟩) of §0.5; the second contains the r=0 piece U(T) of §4.2.

5. **F05** (P3) pinned Tau Ceti class-field declarations are attributed to a roadmap layer

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:123`: "Layer 13 supplies `hilbertClassField`, `narrowHilbertClassField`, `gal_hilbertClassField_equiv_classGroup` and the splitting criteria".

   **Claim.** These names are targets of ClassFieldTheory Layer 13.

   **Witness.** They are proved at the pin: `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean` lines 241, 246, 293, namespace `TauCeti.ClassFieldTheory`; ClassFieldTheory's own README lists them under "From Tau Ceti". The README's "From Tau Ceti" section (lines 41–45) omits them.

   **Repair.** Add to "From Tau Ceti": "Use `TauCeti.ClassFieldTheory.hilbertClassField`, `narrowHilbertClassField`, `hilbertClassArtinEquiv` and `gal_hilbertClassField_equiv_classGroup` in `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean`: the ray class fields of the trivial and the narrow modulus inside a separable closure, with the Artin isomorphism from the class group. They carry no embedding into ℂ and no tower compatibility." In line 123 replace "Layer 13 supplies `hilbertClassField`, … and the splitting criteria" by "Layer 13 supplies the splitting criteria for these pinned fields". In `gap:cyclotomic-p-class-fields` drop the first clause ("Construct H_q as the fixed field of the prime-to-p subgroup in the supplied cyclotomic Hilbert field"): with R03 that construction is this roadmap's `pHilbertClassField`; the gap keeps tower compatibility and the local-p-split comparison.

Five findings: four P2 and one P3. The two Lean headlines are true as typed and agree with the README; every cross-roadmap section and every pinned declaration the README names exists where it is cited; the dependency check is clean. The findings are a re-planned supplier theorem (R01), a target with no proof route (R02), a headline the docstring calls not statable although its carriers are pinned (R03), two gap sentences that do not say what is missing (R04), and pinned declarations attributed to a roadmap (R05).

## Adversarial pass: record

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_split_prime_with_signs` (Lean, §2.3) | p=3,n=1, ε=±1; general q | K⁺=ℚ, t=±7, (3+ζ₃)(3+ζ̄₃)=9−3+1=7, 2 inert; general: K ramified at p, narrow Hilbert field unramified at finite places, so Chebotarev gives narrow class and split | true; `t≠0` excludes ⊥, `p∉(t)` excludes the ramified prime | none |
| `conjugateFractionalIdeal` (def) | ℚ(i): (2+i), (1/2), 0 | (2−i); (1/2); 0; product (5) | determines object; identity map excluded by (2+i)²≠(5) | none |
| `IsSkewCMLine` (def) | ℚ(i): δ=i/2, i, −i/2, 0; B→2B | (i/2)=𝔡⁻¹ ✓; (i)=𝓞 index 4 ✗; type reversed; δ=0 fails; δ→i/8 gives (i/8)(4)=(i/2) | zero form, rescaling by non-norm unit and wrong type all excluded | none |
| `exists_cm_lines_with_ideal_product` (Lean, §2.4) | general q; L=𝓞 | 𝔡=𝔭^e, e=p^(n−1)(pn−n−1) odd; δ₀=(ζ^(1/2)−ζ^(−1/2))^(−e) purely imaginary; B₁=x, B₂=x⁻¹L/L̄ with (t)=xx̄: product L/L̄, a=1 | true; hΦ makes Φ a CM type | none |
| Conventions: Gaussian line | b(1,1)=i/2 | ω(1,i)=−Tr((i/2)(−i))=−1; h(1,1)=−2i·i/2=1; h(1,i)=−i; Im h=−Tr b | consistent with FGV (4.7), (4.9), (4.10) | none |
| Frobenius convention | ℓ=2 on μ₅, twist 3 | 2³=3; geometric 2⁻³=3³=2 mod 5 | consistent | none |
| §0.1 Bott class | q odd; q=5,a=2 | π₂ˢ(Bℤ/q₊;ℤ/q): π₂ˢ/q=0, π₁ˢ[q]=ℤ/q; a·β | characterised; sign as FGV (pairing +1 with c₁) | none |
| §0.3 Picard classes | weights | ψ⁻¹=+1 on H²(μ^(⊗2k)), −1 on H⁰(μ^(⊗(2k−1))); K_*(𝔽_p;ℤ/q)=0 so O_q vs O′_q agree | consistent | none |
| §0.4 Check q=9,k=2 | χ³ on (ℤ/9)× | kernel order 3, image order 2: field K₃, degree 2 vs 6 | Check true | none |
| §0.5 H₁(G_q;M_q) | central c | H_*((ℤ/q)×;M)=0, so H₁=(A⊗M)_Q; H₀,H₁ of ⟨c⟩ vanish | consistent | none |
| §1.1 c_B H | rank one | 1+ψ⁻¹=2; (1/2)·2=1; q=5: 3·2=1 | consistent | none |
| §1.2 periods | q=5, 25 | 2·1·4=8; 2·5·4=40 | consistent | none |
| §3.2 type sums | q=5: {1,2},{4,2}; i=1,2 | 3, 1; 0, 0; difference ±2aⁱ unit for odd i | consistent | none |
| §3.4 p-adic table | i mod 4 | ψ⁻¹=(−1)^w on H^j(ℤ_p(w)): + parts K_(4k−2), K_(4k−1), zero in 4k, 4k+1; ku⁻ in 4k−2; K₃(ℤ)⊗ℤ₃=ℤ/3 | consistent | none |
| §3.5 Checks | q=5; p=691 | Minkowski (4/π)²·(24/256)·√125=1.70<2; K₂₂ order 691, 346·2=692≡1 | consistent | none |
| §3.6 degree one | i=1 | K₁^β(ℤ;ℤ/q) has weight 1, ψ⁻¹=−1, + part 0 = KSp₁ | consistent with degree-one exception | none |
| §4.4 action | σ,τ | Spec(σ⁻¹)∘Spec(τ⁻¹)=Spec((στ)⁻¹) | left action | none |
| §4.5 stabilisation | A₀×− | composite adds ε(x)[A₀]; ε(β)∈π₂ˢ(S;ℤ/q)=0, so CM classes unchanged | surjective for g≥φ(q)/2, hence for g≥φ(q) | none |
| §5.2–5.4 cocycle and universal object | C₂ on ℤ/5 sign; H=G | α(gg′,m)=α(g,g′m)+α(g′,m); c²(m,t)=(m,t+m−m); section (m,2m): c(m,2m)=(−m,3m)=(−m,−2m); H=G gives zero object | consistent | none |
| §5.3 differential and T_n | n=1,2,3; C₃ on 𝔽₇; S₃ | d₁=gm−m; n=3 signs +,−,+,−; T matches native face n−j, sign (−1)^(n−j); FGV 2−1=1, native 4−1=3 | chain isomorphism | none |
| §7.1 Checks | Γ=C₂, ℤ_p | H₁(C₂;sign)=M/2M=0, relative H₁=ℤ_p; Γ=ℤ_p: ℤ_p | consistent | none |
| §7.6 restriction | (p,k,ℓ)=(3,1,2),(5,1,2),(3,1,19) | 2²−1=3: ℤ/3; 3 unit: 0; 19²−1=360: ℤ/9 vs ℤ/3 | consistent; exponent 2k | none |
| §7.7 fixed primes | torsor ℤ/3, ± | minus: one fixed of three; plus: three fixed | consistent; see R03 | R03 |
| §8.1 Q^int | RP∞, p=2; S¹×S¹; point | ℤ/2 in degrees 2^a−1; ℤ_p² in degree 1; 0 | consistent | none |
| §8.2 Tor generator | K(ℤ/p²,1)×K(ℤ/p,1) | d=1, β₁(x)=pu, Tor=ℤ/p in degree 3 | consistent with the gap sentence | none |
| §8.3 range | ΣHℤ/p; Σ²Hℤ | Q_(2p−1)(K(ℤ/p,1))=ℤ/p≠0; Q_(2p)(ℂP^∞)=ℤ/p≠0; both outside 1≤i≤2p−3; Q_i depends on H_(≤i+1) of τ_(≤2p−3) | true in the stated range | none |
| §8.4 bounds | i=0,2; p=5,m=3 | g≥6, g≥10; 6≤6 | consistent | R02 |
| §8.5 weights | χ=2 over ℚ₅ | 1/2, 1/4 in cohomology; 2, 4 in homology | consistent | R01 |
| §8.6 | p=3; n=11,p=691; d=0 | p=3 forces n_j=1, B₂=1/6: vacuous; n_i+1≤p−1 so p∤denominator issues absent; d=0 no Bernoulli factor | true as stated | none |
| gap:bernoulli-weight-nonvanishing | 2k=p−1; 2k≤p−3 | ω^(2−p)=ω eigenspace zero and B_(p−1) has p in the denominator; otherwise Herbrand–Ribet | sentence true | none |
| gap:sphere-unit-finite-field | orders | v_p(ℓ^(2k)−1)=1+v_p(k) if (p−1)∣2k, else 0: order of the p-part of im J | sentence true | none |

## Dependency check

```
depcheck: 237 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The roadmap is at position 340 of the merge order; its latest suppliers are GeneralAlgebraicKTheoryPartII (336), BorelRegulators (303, named only to exclude it) and EtaleHomotopyTypes (239).

## Verified sound

- Declarations read: 4 of 4 (2 theorems, 2 definitions), against the elaborated signatures in the scratch file; no lost binder; README generality equals the Lean in both theorems. No padding: both definitions are needed by the second theorem. Single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data.
- README targets read: every subsection of Layers 0–8 (45 *Needs* lines), the conventions and the 24 supplier contracts.
- Pinned declarations checked at the pins (17): `Module.Invertible`, `NumberField.exists_ideal_in_class_of_norm_le`, `FractionalIdeal.ringEquivOfRingEquiv`, `FractionalIdeal.spanSingleton`, `FractionalIdeal.dual`, `NumberField.IsCMField`, `complexConj`, `ringOfIntegersComplexConj`, `maximalRealSubfield`, `TauCeti.SymplecticForm.exists_compatible`, `artinHomAway`, `TopCat.singularHomologyCross`, `TopCat.pontryaginMul` (monoid objects of `TopCat` only), `singularHomologyKunnethUnitShortComplex_shortExact` (hereditary coefficient ring), `singularHomologyToTor`, `TopCat.singularCap`, `fundamentalClass`; no homology Bockstein exists in pinned Tau Ceti.
- Sibling citations checked: every section id cited from the 24 supplier roadmaps resolves to a heading or numbered item at main or at the supplier's open head. Content read for StableHomotopyKTheory §4.18, AbelianSchemesAndArithmeticModuli §A5.4, ArithmeticKTheory §§3.4, 3.5, 6.11, 6.16, HermitianKTheoryOfPoincareCategories §§8.1, 8.3, GeneralAlgebraicKTheory §13.8c, GeneralAlgebraicKTheoryPartII §§4.3, 4.20, IntegralIwasawaTheory §7.4, KTheoryFiniteLocalFields §1.2, ClassFieldTheory Layer 13, TopologicalKTheory (β=[O(−1)]−1). "AlgebraicTopology Stage 6" resolves through that roadmap's own former-numbering map (Stage 6 items are §§6.0–6.5).
- Gaps: 14 slugs, each with identical supplier and sentence in the README and in `plan.json` (compared by script). Two sentences are vague (R04), one has a clause this roadmap can supply (R05).
- Locators verified against the cached texts: 22 FGV (lines 32, 43, 80–85, 350, 375, 1127, 1232, 1245–1274, 1263, 1378, 1428, 1533, 2190–2194, 2217, 2236, 2241–2255, 2272, 2295, 2318 among them) and 3 borel1974 (lines 1154, 1194, 1246).
- Checks: all 153 Check bullets read; every one with a numerical or two-term value was recomputed (the rows of the table above carry the values); none is false, vacuous or a restatement.
- Ownership: no other roadmap on main or open declares the four Lean names; none owns symplectic K-theory, its Galois action, relative group homology with the universal extension, or integral indecomposables.

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified; its range and its internal theorem numbers were not read. FGV quotes g≥2i+5 (line 33) and i<(g−5)/2 (line 2236); the README's g>2i+5 is inside both.
- The Lean shape in R03 was not elaborated: this pass runs no Lean.
- Supplier section contents beyond those listed above were checked by heading only.

Source independence: 15 passages compared with 2 sources (FGV, borel1974), none shared beyond formulas and statements of a dozen words; largest share FGV, 93 of 98 locators; contents compared with FGV: independent — Layers 0, 2 and 8 have the scope of FGV §§2, 4 and 8, but Theorem 3.5 is moved from §3 into Layer 3, Appendix A and §6.1 form Layer 4, and §§6.2–7.7 are cut into Layers 5–7 at other points; the order 0→2→3→4→5→6→7→8 is forced by the *Needs* lines (§2.1 needs §0.2; §3.1 needs §§0.1, 1.1, 2.1–2.2; §4.5 needs §3.5; §5.1 needs §4.4; §6.1 needs §§3.5, 4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4).

## Source issues

- **Misprint** in FGV at §7.7, footnote 13, p. 47, FGV line 2193: the source says the invariants of the weight-2k torsion module are taken for the action through the (2k−1)st power of the cyclotomic character; it should be the 2k-th power; affects nothing.
- **Misprint** in FGV at Theorem 8.4's proof, p. 50, FGV line 2304: the source gives the model algebra for a cyclic Eilenberg–Mac Lane space the differential sending y to x; it should send y to p^k·x; affects the proof.
- **Gap** in FGV at Theorem 8.4's proof, p. 50, FGV lines 2312–2316: the source says the truncation through degree 2p−2 splits as a loop space because the first k-invariant of the delooping is the reduced power from degree 2 to degree 2p; that k-invariant lies inside the truncated range, so the splitting is justified only through degree 2p−3; affects the proof.
- **Error** in FGV at Theorem 8.1, p. 48, FGV lines 2218 and 2223: the source allows p equal to the largest part and says the Chern character of that degree is then p-integral; it should require p strictly larger than every part; affects a stated result.
- **Misprint** in FGV at Proposition 6.1, p. 34, FGV lines 1535–1536: the source takes the CM classes in genus φ(q); the CM abelian varieties of the cyclotomic field have dimension φ(q)/2, so the proof starts in that genus; affects nothing.

## For the human reviewers

- **Licence.** `sources.toml` records FGV from the first author's Berkeley page (`licence_class = "author-page"`); the published version is Inventiones 230 (2022), paywalled. Page and line locators follow the author copy.
- **Not tested.** `charney1987` (Corollary 4.5) is paywalled and uncertified; the stability range in README §8.4 rests on FGV's two quotations of it, which differ at the endpoint.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68c3405f34521971d7cee5defc0724e26d581c72", "job": "RT-ArithmeticKTheoryPartII~1b", "model": "fable", "worker": "chris-x79"} -->
