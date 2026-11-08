# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at bf2abc9)
**Verdict:** needs changes

**Previous findings (round 6 at 552e037), checked passage by passage.** Both are repaired.

- **R01 (unused Frobenius import; README did not name the Frobenius predicate): repaired.**
  - `Suggested.lean:3–8` now imports only Mathlib, `HeckeRing.Associativity`, `Newform`, `RayClass.Modulus`, `CharacterTwist` and `SymmetricPower`. Each is used: the Hecke-ring product in `gl2_hecke_*`, the newform statements, `Modulus`, and the twist and symmetric power in `algWeight_equiv_symPowerRep`.
  - `README.md:156–165` reads "`IsArithFrobAt` (`Mathlib.RingTheory.Frobenius`), `Algebra.IsUnramifiedAt` … express the arithmetic-Frobenius traces and q-coefficients".
  - `:221–226` adds the Tau Ceti existence lemma only as a remark that the hypotheses can be satisfied.
- **R02 (two declaration names attributed to PadicLocalLanglandsForGL2Qp §6.9): repaired.**
  - `:352–354` reads "§6.9 supplies the division-algebra Jacquet–Langlands transfer from D× to GL_d(F), defined there as the inverse of its general local correspondence restricted to m=1".
  - `:1428` reads "§6.9's division-algebra transfer from D× to GL_d(F) at d=2".
  - `grep 'localJacquetLanglands\|DivisionAlgebraTypes'` on the folder returns 0 hits.

## R01 (P2) — R17.3.8a–R17.3.8d and QuaternionicModularForms own the same coefficient modules, level forms and Hecke relations

**Location:** `README.md:79–84`: "R17.3.8a–R17.3.8d own the classical quaternionic coefficient modules with their determinant normalizations and integral monoid actions, the quaternionic level forms over every number field … and the Hecke operators with their good-place relation". These are built at `:1777–2166` and stated in `Suggested.lean:198–411`.

**Claim:** This roadmap is the only owner of these objects.

**Witness:** QuaternionicModularForms (#934, head b22ec37), README:34–38, claims the algebraic coefficient modules and the level and classical forms for every quaternion algebra. Its :1033 proves `T_v²=T_{v²}+(q_v+1)S_v`. AutomorphicFormsOnReductiveGroups (#1037), README:11, assigns this specialization to it.

**Further evidence:**
- The definition of R17.3.8a at `:1779–1781` restates QuaternionicModularForms §1.3 (its :502–504) almost word for word, with `L_{n,v}` renamed `L_{n,s}`.
- QuaternionicModularForms' Downstream consumers (its :1424) lists this roadmap as a consumer of its §§1.3, 2.1–2.2 and 3.1.
- HilbertModularVarietiesAndShimuraCurves (#1005), README:9 and :133, cites R17.3.8a–R17.3.8d as the owner.
- So three open roadmaps name two different owners for the same objects.

**Repair.** Ownership stays here. QuaternionicModularForms cannot be a supplier to this roadmap, and HilbertModularVarietiesAndShimuraCurves already cites R17.3.8a–R17.3.8d. In this folder:
1. At `:87`, replace "Overconvergent quaternionic forms and their p-adic families are outside this roadmap." with "QuaternionicModularForms owns the integral, Banach and overconvergent quaternionic forms and their p-adic families; it takes the algebraic coefficient modules, level forms, classical forms and Hecke operators from R17.3.8a–R17.3.8d."
2. Under `## Downstream consumers`, add two bullets:
   - "HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.3 and R18.5.16a–R18.5.17a use R17.3.8a–R17.3.8d: the coefficient modules, the level forms with class-set finiteness at every open level, the classical forms and the Hecke operators."
   - "QuaternionicModularForms Layers 1–3 use the same sections in place of their own algebraic coefficient modules, level forms, trivial-stabilizer dimension and good-place relations."
3. In the pull request description's merge-order paragraph, state that QuaternionicModularForms must follow this roadmap.

The rest of the settlement is outside this folder:
- the sentence at AutomorphicFormsOnReductiveGroups README:11 must name R17.3.8a–R17.3.8d;
- QuaternionicModularForms must replace §1.3's algebraic part, §2.1's level forms, §2.3's dimension and §3.1's relations by citations;
- QuaternionArithmetic's citation of QuaternionicModularForms §3.1 then becomes R17.3.8d.

**Tested:**
- After steps 1–2, HilbertModularVarietiesAndShimuraCurves' citations at its README:133 all resolve to statements here: `L_{n,s}` and the `Σ₀/Σ₁` nebentypus (`:1779–1846`), finiteness at open levels (`:1908–1917`) and the inversion `[Uη_v⁻¹U]=S_v⁻¹T_v` (`:2115`).
- `grep QuaternionicModularForms` on this README returns 0 hits today, so supply still runs in one direction.

## R02 (P2) — The averaging-projector bound in R17.3.8c needs an ultrametric norm

**Location:** `README.md:2025–2028`: "On R17.3.8b's normed model with U acting isometrically, `‖e_i‖≤‖|H_i|⁻¹‖`, which exceeds one when the residue characteristic divides `|H_i|`, and `⊕_ie_i` is a projection … of norm at most `max_i‖|H_i|⁻¹‖`."

**Claim:** The bound holds on R17.3.8b's normed model. That model (`:1933–1934`) is any normed R-module with `‖ra‖≤‖r‖‖a‖`.

**Witness:** Take R=ℚ₅ and A=ℚ₅² with the norm `‖(x,y)‖=|x|+|y|`. Let H=C₂ swap the two coordinates, which is isometric. Then e(1,0)=(1/2,1/2) has norm 2, while ‖|H|⁻¹‖=|1/2|₅=1.

**Repair:** Replace "On R17.3.8b's normed model with U acting isometrically" with "On R17.3.8b's normed model with A ultrametric (Mathlib `IsUltrametricDist`) and U acting isometrically". `:1939–1940` already requires this for the trace bound.

**Tested:**
- With the sup norm on ℚ₅², ‖e(1,0)‖=1≤1 (script).
- At p=2 the bound |1/2|₂=2 is attained: e(1,0)=(1/2,1/2) has sup norm 2.

## R03 (P3) — Two declarations in `Suggested.lean` are needed by no headline statement

**Location:**
- `Suggested.lean:357`: "noncomputable def gl2IntegralMonoid : Submonoid (GL (Fin 2) L)".
- `:248–249`: "theorem finrank_algWeight [Nontrivial K] (n : ι → ℕ) : Module.finrank K (restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i}) = ∏ i, (n i + 1)".

**Claim:** Both are needed to state the roadmap's headline theorems.

**Witness:**
- No statement uses `gl2IntegralMonoid`. Its other occurrences are docstrings, at :34 and :369.
- `finrank_algWeight` mentions only Mathlib's `restrictSupport` and no object of this roadmap. One `simp` reduces it to `{m | ∀ i, m i ≤ n i}.ncard = ∏ i, (n i + 1)`.

**Repair:**
- Delete both declarations from `Suggested.lean`.
- Module docstring: write "five definitions" at :28 and "(`gl2Integral`)" at :34, and change "the action law, the rank and the symmetric-power comparison" to "the action law and the symmetric-power comparison".
- At :369, drop "`gl2IntegralMonoid L` or".
- In `README.md`, drop `gl2IntegralMonoid` from the parenthesis at :2105, and drop "(`finrank_algWeight`)" at :1799. The rank statement stays in that bullet as prose.

**Tested:** A scratch copy without the two declarations elaborates with 19 `declaration uses sorry` warnings and no error.

## R04 (P3) — The three [gross99] citations have no locator, and the work is paywalled

**Location:** `README.md:1889`, `:1966` and `:2065`. For example, `:1966` reads "*Source:* [gross99], the decomposition of algebraic modular forms at a level into a finite sum of invariants of the arithmetic stabilizers".

**Claim:** These targets carry exact locators.

**Witness:** None of the three gives a section, statement or page. `sources fetch` for Gross 1999 returns "uncertified: the citation resolves only to a paywalled page" (DOI prefix 10.1007). So each citation has to stand on its locator alone.

**Repair:**
- At `:1966`, cite [loeffler11], Definition 3.3.2 and Proposition 3.3.3(1), pp.17–18. These give module-valued forms and the map `f↦(f(μ_i))_i` onto `⊕_iW^{Γ_i}`. For indefinite D, cite AutomorphicFormsOnReductiveGroups §7.4's evaluation equivalence.
- At `:1889` and `:2065`, either give the section and printed page of Gross 1999 for the statement used and record gross99 in the manifest as uncertified, or drop [gross99] where [nt26] §1.2, p.8 and [loeffler11] already support the text.

**Tested:**
- loeffler11 lines 787–815 give exactly this decomposition at compact open levels, under its Assumption 3.1.3 (line 691, G compact modulo centre at infinity). That is the definite case of R17.3.8b.
- loeffler11 is already in the sources cache.

## R05 (P3) — R17.3.8d restates the `GL₂(𝒪_v)` coset count that AutomorphicLFunctionsAndLocalFactors AL.2.2.1 owns

**Location:** `README.md:2093–2094`: "Right cosets: at `GL₂(𝒪_v)`, `T_v`, `T_{v²}` and `S_v` have `q_v+1`, `q_v²+q_v` and 1 right cosets."

**Claim:** The `T_v` count is a target of this roadmap.

**Witness:** AutomorphicLFunctionsAndLocalFactors (#924), AL.2.2.1 (its README:1647), proves `U t_v U=⊔_r ι_v(r)U` with the q+1 representatives `[[ϖ_v,u],[0,1]]` and `diag(1,ϖ_v)`, for every product level `U=GL₂(O_v)×U^v`. R16.1.3 here already uses AL.2.2.1 for these cosets.

**Repair:**
- Replace the quoted sentence with: "`T_v` has the `q_v+1` cosets of AutomorphicLFunctionsAndLocalFactors AL.2.2.1, transported through `j_v`; transposition preserves `GL₂(𝒪_v)diag(ϖ_v,1)GL₂(𝒪_v)` and turns its cosets `rU` into right cosets `Urᵀ`. `T_{v²}` and `S_v` have `q_v²+q_v` and 1 right cosets."
- Add AL.2.2.1 to the *Needs* line at `:2159–2162`.
- Keep the depth-t decomposition with `x_α` as a target here: AL.2.2.1 has the Iwahori count only as a Check.

**Tested:** At q=2, AL's three representatives transpose to three distinct right cosets. This matches the Check at `:617`: "at residue size two there are three".

## Verified sound

**Scope, gate and build.**
- I read both files in full at bf2abc9: `README.md` has 3478 lines and `Suggested.lean` 512. `metadata.toml` is `topic = "math.NT"`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- I re-ran the gate. Every check is 0, including set_option, sorry-data, latex, imports, readme-ids-missing, statement-hygiene, depcheck, stray-files and outside-folder.
- `lake env lean Suggested.lean` gives exactly 20 `declaration uses sorry` warnings, 0 errors, in about 10 s.
- There is no `lemma`, `set_option`, `#eval`, `#print` or `True` placeholder. A grep for process words returns 0 hits.

**Dependency check (run this round):**

```text
depcheck: 244 roadmaps, 2480 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new suppliers sit before this roadmap (94) in the merge order: AdelicAlgebraicGroups (35) and AutomorphicFormsOnReductiveGroups (69). RestrictedPowerSeries is on main.

**Signatures.**
- I elaborated the 26-entry `#check @name` file once and compared every type with its README statement.
- The two flagged definitions, `gl2Integral` and `gl2IntegralMonoid`, drop `[TopologicalSpace L] [IsNonarchimedeanLocalField L]`. This is harmless: GL₂ of the valuation ring is defined over any valued field, and the three theorems that use these definitions carry all four binders.
- `algWeight_equiv_symPowerRep` takes `K : Type` because `TauCeti.symPowerRep` takes `k : Type`.
- `quaternionLevelForms_finite` and `classicalForms_finrank` keep `[Algebra.IsCentral F D]`, `[IsSimpleRing D]`, `finrank F D = 4`, the module topology and `IsOpen U`.
- No type needed a change.

**One-tactic probe.**
- I replaced every `sorry` with `first | rfl | simp | infer_instance | trivial | norm_num | decide`. All 20 fail with unsolved goals.
- Targeted probes also fail: `simp [algWeightSlash]` / `exact?` on `algWeightSlash_one`, `simp [finrank_eq_nat_card_basis (basisRestrictSupport …)]` on `finrank_algWeight`, and `IsHeckeTriple.of_diagonal` / `exact?` on `gl2Integral_isHeckeTriple`.
- R03 rests on headline need, not on the probe.

**Headline inventory.**
- Stated in `Suggested.lean`:
  - Chevalley congruence, full-local prescription and supercuspidal projectivity;
  - quaternion ramification realization and the local-global criterion;
  - from R17.3.8: the slash action law, the symmetric-power comparison, finiteness at open levels, the trivial-stabilizer dimension, and the good-place relation and inversion formulas;
  - finite projective lifting, odd solvable Artin weight one over ℚ and Fong–Swan;
  - the characteristic-two dihedral classification and characteristic-two solvable weight one.
- Not statable at the pins, and named in the docstring (`:42–65`):
  - R16.0 and R16.2–R16.3 (WD and admissible classifications);
  - R16.4–R16.6, R17.1–R17.3 apart from R17.3.8a–d, R17.4 and R17.5 over arbitrary fields;
  - R17.6's exact-level and Katz results.
- No stand-in was found.

**Adversarial pass.** Values marked (script) were computed this round by a Python script; the rest are hand computations recorded here.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `algWeightSlash`, `_mem`, `_mul`, `_one` | README Check: γ=(1 1;0 1), δ=(1 0;1 1), n=1, s=0; 183 random integer cases, n≤4, \|s\|≤2 (script) | 1\|γ=1; (1\|γ)\|δ=z+1=1\|(γδ) with γδ=(2 1;1 1); 1\|(δγ)=z+2. `P\|(γδ)=(P\|γ)\|δ` and degree ≤n held in all 183 cases | True |
| `algWeight_equiv_symPowerRep` | 94 random g∈GL₂(ℚ), n≤3, \|s\|≤2 (script); g=diag(2,1), n=1, s=0 | The matrix of `(·)\|g⁻¹` equals `det(g)^{−n−s}Sym^n(w)Sym^n(g)Sym^n(w)⁻¹` in all 94 cases. For diag(2,1): 1↦1, z↦z/2, matching eigenvalues 1, 1/2 of std⊗det⁻¹ | True |
| R17.3.8a scalars | −1 on `L_{1,0}`, `L_{2,−1}` (script) | z↦−z; z↦z, as `u^{n+2s}` predicts | True |
| R17.3.8a global units | ℚ(√3), u=2+√3, (n,s)=((1,1),(0,1)) and ((2,0),(0,1)) | N(u)=1; σ₁σ₂³=σ₂²=7−4√3≈0.0718, not a root of unity; N(u)²=1 | True |
| R17.3.8a normalized vs algebraic | n=0, s=±1, diag(ϖ,1); scalar unit u | s=1: σ(ϖ) against 1. s=−1: σ(ϖ)⁻¹∉𝒪_K against 1. Scalar u: σ(u)² in both | True |
| R17.3.8a nebentypus and analytic monoid | ℚ₃, γ=(1 0;1 1), δ=(1 1;0 1); product of two monoid elements | Lower-right entries 1, 1, but γδ=(1 1;1 2) has 2, and ε(2)=−1. For the monoid: c″=ca′+dc′ has \|·\|<1 and d″=cb′+dd′ has \|·\|=1 | True |
| `quaternionLevelForms` | u=1; γ=1; composition | u=1 gives left Dˣ-invariance; γ=1 gives covariance; ρ(op ε)ρ(op δ)=ρ(op(δε)), a right action | True |
| `quaternionLevelForms_finite` | D=M₂(ℚ), U=GL₂(ℤ̂); open noncompact U | One class, with Γ=GL₂(ℤ) infinite and `A^{GL₂(ℤ)}` finite. U contains U∩Ô_D^×, which is compact open, and its class set maps onto Cl(U) (AdelicAlgebraicGroups §5.3) | True |
| `classicalForms_finrank` | ι=∅; Hurwitz level (2ℓ,−ℓ), where htriv fails; M₂(ℚ) with (10,−5) | ι=∅ gives #Cl(U). Hurwitz averages (χ(1)+3χ(π)+8χ(2π/3))/12 = 1, 0, 0, 1 (script), against dim S_k(Γ₀(2)) = 0, 0, 1 at k=4, 6, 8. M₂(ℚ): SL₂(ℤ) acts nontrivially, so htriv excludes it | True |
| `gl2_hecke_T_sq` | q=2, 3, 4, 5 (script) | (q+1)² = 9, 16, 25, 36 = (q²+q)+(q+1) = 6+3, 12+4, 20+5, 30+6. The Check's "all of valuation two" operator gives coefficient q, not q+1 | True |
| `gl2_hecke_inv` | z′=diag(ϖ⁻¹,ϖ⁻¹) | z′ is a single central coset; z′t=diag(1,ϖ⁻¹) is Weyl-conjugate to diag(ϖ⁻¹,1); z′z=1 | True |
| `gl2Integral_isHeckeTriple` | the fields of `IsHeckeTriple` at the pin | left_le, right_le, commensurable, le_commensurator_right; the conjugates of GL₂(𝒪) are compact open, hence commensurable | True |
| R17.3.8d K₀(𝔭^t) cosets | p=3, t=2, (α,α′)=(0,1), (1,4), (2,2), (0,3) (script) | 3(α−α′)∈9ℤ₃: F, T, T, T. So two representatives give the same coset iff α≡α′ mod 3, giving q cosets | True |
| R17.3.8d, S_v on a central form | trivial coefficients | (S_vφ)(g)=φ(gϖ⁻¹)=ψ(ϖ)⁻¹φ(g) | True |
| R17.3.8b norms and trace | change of representative; trace term | ‖φ(x_i)\|u‖≤C_U‖φ(x_i)‖ and back. A trace term is φ(y_j)\|(u′u⁻¹) with a single element of U, so its norm is ≤C_U | True |
| R17.3.8c splittings | ι′=hιh⁻¹ | ι(x)h⁻¹=h⁻¹ι′(x), so φ′=φ\|h⁻¹ satisfies φ′(γgu)=φ′(g)\|ι′(u) | True |
| R17.3.8c averaging bound | ℚ₅², ℓ¹ norm against sup norm (script) | ℓ¹: 2 against the bound 1. Sup: 1≤1 | R02 |
| R17.3.9 Pan adapter | k=2, ℓ=3; scalar u | Supplied S_ℓ = 1/9, Pan's S_ℓ = 9 (script). Scalar: `u^{n+2s}=u^{−k}=τ(u)⁻¹`. Left action: Sym^k⊗det^{−k+k}=Sym^k | True |
| `chevalley_power_congruence` | E=⟨2⟩⊂ℚ×, n=2, 3, T={2} | 2^j mod 3 = 1,2,1,2,1,2; 2^j mod 7 = 1,2,4,1,2,4 (script) | True |
| `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂=(−1)^{v₂} | Ψ = character of ℚ(√5): 2 is inert (5≡5 mod 8), so Ψ₂(2)=−1; Ψ₂ is trivial on ℤ₂× and at ∞ | True |
| `supercuspidalProjective` | trivial π; π⊗ρ with ρ(g)=(1 v(det g);0 1) | The trivial coefficient's support is G/Z, not compact. ϖI acts by ω(ϖ)(1 2;0 1), not a scalar, so hσcent excludes it | True |
| `existsQuaternionRamification_iff` | ℚ: (∅,∅), ({2},{∞}), ({2},∅); a complex place in Si | M₂ with Even 0; (−1,−1) with Even 2; odd sets: both sides false; complex place: split, so both sides false | True |
| `nonempty_quaternionAlgEquiv_of_localSplitting` | (−1,−1) against (−1,−3) | (−1,−3)₂=+1, (−1,−1)₂=−1, so hf fails | Consistent |
| `finite_projective_lift` | r trivial; r(c) a non-scalar involution | trivial lift; eigenvalues ±1 | True |
| `odd_solvable_artin_weight_one` | x³−2, p=5, 7, 31 | Roots [3], [], [4,7,20], so tr = 0, −1, 2; det = (−3/p) = −1, 1, 1 (script) | True |
| `solvable_finite_image_integral_lift` | S₃, p=2, n=2; n=0 | The reflection lattice reduces onto GL₂(𝔽₂)≅S₃; the n=0 module is not simple | True |
| `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); A₄ ⊂ SL₂(𝔽₄) upper triangular; D₅ | S₃≅D₃; A₄ is reducible; 5∣4+1 | True |
| `characteristicTwo_solvable_weight_one` | p=5, 7, 31 | a_p = 0, −1, 2 reduce to 0, 1, 0: the traces of a transposition, a 3-cycle and the identity | True |
| R16.2.7 Fixed-space comparison | (5 6;−1 0); (2 1;−1 0) | X²−5X+6; U−1=(1 1;−1 −1), with square 0 | Retain |
| R17.2.5 Stronger variant | x=k⁻¹a, y=k | gives ∫_N f(k⁻¹ank)dn = averaged condition; ⟨K,w⟩=GL₂(F_v) | Retain |
| Quaternion proof | (16.1.7) at two or more places | jl70-ubc line 16823: (iv)–(viii) vanish; line 16840: only (i)–(iii) remain; Steinberg factors (−1)^{\|S\|}=1 | Retain |
| R17.4.17 cubic monomial and all-place comparison | norm form; Deligne (8.12.1) | N(C+a,b,c)−3(C+a)=−2C+CQ+N for C=±1 on random integers (script). Gram determinant −27. sw+dim V−dim(ker N)^I equals the README form | Retain |
| R17.5.13, R17.5.15, R17.5.16 | diag(1,−1) at 3; (−1)^{v₂}; i^a on ℤ/4; L=ℚ(i), a=1+i | det −1≠1 mod 3; −1, 1, 1; i, −1, −i with χ(1)²=−1; a/σa=i, a torsion unit | Retain |
| Parabolic comparison | (a,d)=(2,3); ℙ¹×ℙ¹ with c₁=(t²,s); Δ at 2 | 3·2≥2·3, so n=2. Fixed components t=0, 1, ∞ each give χ=2, and 6 = 1+3+2. −24·2⁻⁵ = −0.75 | Retain |

**Seeded sample, verified against the cached texts this round.** Line numbers refer to those extractions.

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7) | cg20 lines 182–191 (§1.3, pp.805–806); casselman73 (OCR) lines 261–263 (Corollary to the Proof, p.306) | As stated. The cg20 slip is under Source issues |
| Ramification realization (R17.1.5) | cdn23 lines 1610–1633 (§4.1.2, (4.6), p.38) | As stated; prr23 is not readable |
| Stronger variant (R17.2.5) | proved from the definitions; jl70-ubc lines 16816–16824 | As stated |
| Quaternion proof (R17.2.6) | jl70-ubc lines 16820–16841, 16893–16905, 15824, 15852, 15928 (printed p.275 at line 16773) | As stated |
| Pan adapter (R17.3.9, revised) | pan26-global lines 3075–3086 (Definition 5.4.11(1)–(3)), 3231–3246 (§5.5.5: T_l, S_l = action of diag(l,l), T_S) | As stated, including the S_ℓ inversion |
| Whittaker-type bridge (R17.4.13b) | gj78 lines 2055 ((9.1.1)), 2151–2158 (Theorem 9.3), 2161–2166 ((9.4): S = places that are not quasi-unramified), 2209–2224 ((9.5.1)–(9.5.5): T=S or {w}) | As stated |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1515–1531 (Theorem 14.2, pp.253–254), 1587–1595 (p.255) | As stated |
| All-place comparison (R17.4.17) | henniart02 lines 122–131 (§1.5 Théorème, p.590); deligne73 lines 1287 ((5.6.2)), 1972–1977 ((8.12.1)) | As stated |
| Oddness API (R17.5.13) | bcgp21 lines 12593–12624 (Proposition 10.1.3 and its solvable case) | As stated |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–206 (Theorem 1.3 and proof, pp.182–183) | As stated |
| Construction and local finiteness (R17.5.16) | patrikis lines 1374–1380 (Lemma 2.3.1); carayol86 lines 1558–1566 (§11.2, p.450) | As stated |
| Parabolic comparison (R17.6.4) | varshavsky05 lines 629–652 (Definition 2.1.1, Theorem 2.1.3, p.17); ddt lines 3164–3186 (Theorem 3.1(a)–(e), pp.85–86), 3021 (Theorem 2.47) | As stated |
| New citation [loeffler11] (R17.3.8c) | loeffler11 lines 691–705 (Assumption 3.1.3, Proposition 3.1.4, p.15) | As stated |

**Pinned declarations opened this round.**
- Mathlib:
  - `MvPolynomial.restrictSupport` and `basisRestrictSupport` (`Mathlib/RingTheory/MvPolynomial/Basic.lean:91, 95`);
  - `MvPowerSeries.IsRestricted` (`Mathlib/RingTheory/MvPowerSeries/Restricted.lean:47`);
  - `Representation.averageMap` and `isProj_averageMap` (`Mathlib/RepresentationTheory/Invariants.lean:126, 141`);
  - `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`), with fields left_le, right_le, commensurable, le_commensurator_right;
  - `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:318`);
  - `NumberField.IsTotallyReal` (`…/InfinitePlace/TotallyRealComplex.lean:48`);
  - `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`);
  - `DoubleCoset.Quotient` (`Mathlib/GroupTheory/DoubleCoset.lean:79`);
  - `AlgHom.IsArithFrobAt.eq_of_isUnramifiedAt` (`Mathlib/RingTheory/Frobenius.lean:165`), which needs a Noetherian S and Q containing the zero divisors; this holds for `𝓞 E`.
- Tau Ceti:
  - `TauCeti.symPowerRep` (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`), with carrier `Sym[k]^d (Fin n → k)`;
  - `Representation.charTwist` (`TauCeti/RepresentationTheory/CharacterTwist.lean:86`), defined as `g ↦ χ g • ρ g`;
  - `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`), with B central simple and A finite-dimensional simple, as R17.3.8c uses it;
  - `HeckeCosetModule.single` (`TauCeti/NumberTheory/HeckeRing/Basic.lean:969`);
  - `LeftCosetModule.deg` (`TauCeti/NumberTheory/HeckeRing/Degree.lean:104`), which counts left cosets;
  - `HeckeRing.GL2.heckeT_prime_mul_heckeTDiag_one_prime_pow` (`TauCeti/NumberTheory/HeckeRing/GL2/MultiplicationTable.lean:551`). This is the global SL₂(ℤ) relation, a different group, so `gl2_hecke_T_sq` does not duplicate it;
  - `HeckeRing.GL2.Newform.satakeParameters` and `satakeParameters_eq_pair_iff` (`…/Newforms/Satake.lean:91, 108`).

**Cross-roadmap citations resolved at the heads.**
- AutomorphicFormsOnReductiveGroups (#1037):
  - §7.4 (README:1219–1245): the abstract carrier, its evaluation equivalence with no finiteness hypothesis, restriction, trace over J/J′, slash `(f|δ)(g)=f(gδ⁻¹)|δ`, the opposite-ring Hecke action and `inverseActionHeckeEquiv`;
  - §7.6 (:1267–1285): the central submodule, with the action extended to JZ_f. The README's `a|z=ψ(z)a` (`:1928`) is the right-action form of the supplier's σ(z)=ψ(z)⁻¹.
- AdelicAlgebraicGroups (#792): §5.3 *quaternion-class-sets* (:5498–5511, compact open levels, no division or definiteness hypothesis) and *definite-quaternion-stabilizers* (:5523–5541).
- RestrictedPowerSeries (main): §§0.1 and 2.2.
- HilbertModularVarietiesAndShimuraCurves (#1005): README:9 and :133 cite R17.3.8a–d with content matching this README.
- The citation resolver's leads:
  - R15.2 and R15.3 are AlgebraicModularFormsAndSerreWeights aliases (its README:16, "R15.1–R15.5 for Layers 1–5");
  - `LocallySymmetric.AutomorphicForm` is defined at ArithmeticLocallySymmetricSpaces README:996.
- Citations unchanged since the previous round were left as resolved there: the SR, PLL, AL, AST, ALS and AMFSW sections, and QuaternionArithmetic's R17.1.5 aliases, which are still at `:1511` and `:1516`.

**Ownership and overlaps.**
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id defined only by an open revision.
- For the new objects I searched by object in AutomorphicFormsOnReductiveGroups, AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors, SmoothRepresentationsOfLocalGroups, QuaternionicModularForms, QuaternionArithmetic and HilbertModularVarietiesAndShimuraCurves (R01, R05).
- `roadmaps grep` finds the local `T_v²` relation only here and in QuaternionicModularForms.
- No `Suggested.lean` name collides with a declaration in a roadmap I could read.

**Supplier gaps.** `design/plan.json` is not readable. The two README contracts at `:284–307` (`gap:weil-local-constants`, `gap:artin-functional-equation`) name ArithmeticGaloisRepresentations and are precise and minimal.

## Not verifiable

- **gross99** (Gross, Algebraic modular forms, Israel J. Math. 1999): the sources service reports it as paywalled (uncertified). Its content was not checked (R04).
- **shimura71** (book, Proposition 3.3 and Theorem 3.24): not read. These locators agree with the Tau Ceti docstrings at `Degree.lean:97` and `GL2/MultiplicationTable.lean:549`.
- **prr23**, Theorem 1.33: a Cambridge book with no legal copy. The realization inputs were checked on main through GlobalQuadraticForms §4.4 and ClassFieldTheory Layer 10.
- **jl70** (IAS retypeset) and **jl70-global** (IAS author scan) paginations: only jl70-ubc is cached.
- **bh06**, **webb16**, **artin-tate**, **tate-global** and **clozel90**: books, not read.
- Texts outside the sample and the new R17.3.8 citations were not read this round.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says an unramified irreducible representation of GL₂(ℚ_p) that is not trivial has Iwahori invariants of twice the spherical dimension; it should say infinite-dimensional, since a nontrivial unramified character of det has one-dimensional Iwahori invariants; affects nothing (an introductory remark).
