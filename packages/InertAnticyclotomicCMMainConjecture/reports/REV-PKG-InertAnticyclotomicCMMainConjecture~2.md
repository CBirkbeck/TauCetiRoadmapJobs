# Review of InertAnticyclotomicCMMainConjecture (package, round 2)

**Verdict:** needs changes

Nine findings: one P2 and eight P3. The headline statements survive the sampled source comparison. The coefficient-prime convention does not survive ramified coefficient extension, and several Checks and claims about the sources and pins need correction. No author file was edited.

## Previous findings, checked first

- **F01 — repaired.** README line 75 now says “the algebraic Hecke character of a CM abelian variety; one-dimensional CM components of the Tate module; Frobenius and infinity-type identities”. These are the titles at ComplexMultiplicationAndExplicitReciprocity §4.1, and the good-reduction title occurs at §4.3. The four nonexistent declaration names are absent throughout this package. The §1.3 route also uses the actual title.
- **F02 — repaired as to ownership.** README line 317 now says “it is defined here for every inert CM datum of the Conventions”. Its composite explicitly uses the auxiliary field K and no character evaluation. AnticyclotomicLocalUnits §4.2 supplies the arrows, not a separately stated trivial-character case. The new construction has the correct m=0 specialization of BKO21 lines 435–452. The distinct, incorrect modulus Check is R05 below.
- **F03 — not repaired as a valid source assertion; the previous finding itself was mistaken.** README line 339 now says “BKO21 prints the right-hand side as L(φχ,1)/Ω at both places”. I inspected the rendered published PDF, not just its extraction: both places print a bar on φ. The interpolation formula has a bar on φχ together. The extraction omitted these bars. Thus the requested edit was applied, but it introduced a false statement about the source. R01 reverses that edit; the mathematical formulas of §§2.2 and 2.5 remain correct.
- **F04 — repaired.** Suggested.lean lines 18–21 now names both 2-descent groups and `IsDedekindDomain.selmerGroup`; README lines 55 and 59 do likewise. All three definitions exist at the exact pins. The separate assertion that characteristic ideals are absent is incorrect (R06).

No previous finding was marked “not actionable in this package”. None is being re-raised under that rule.

## R01 (P3) — The added BKO erratum is an extraction artefact

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:339`: “BKO21 prints the right-hand side as L(φχ,1)/Ω at both places”.

**Claim:** The published source lacks conjugation and needs a convention correction.

**Witness:** BKO21 line 478, Proposition 3.3(2), p.953, and line 827, p.961: the rendered PDF shows φ̄χ. At line 841, p.961, it shows conjugate(φχ). The extraction loses overbars.

**Exact repair:** Delete the sentence beginning “BKO21 prints” through the end of that paragraph. Retain δ_χ(ξ)=L(φ̄χ,1)/Ω and the §2.5 formula with conjugate(φχ). Do not register the alleged BKO misprint as a source issue. Tested at χ(γ)=ζ₅: inverse covariance gives δ_(χ⁻¹)(L_pv)=L_p(χ)δ_(χ⁻¹)(v), and the printed numerator is L(φ̄χ⁻¹,1), exactly as required. No correction of the source is needed.

## R02 (P2) — The coefficient-prime and μ conventions exclude ramified R without saying so

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:33`: “retains the prime (π)”; line 601: “its μ-invariant over Λ_R is 1”. The same prime terminology recurs at line 589.

**Claim:** With π=−p and arbitrary finite coefficient extension R/O, (π) is a height-one prime and Λ_R/(π) has μ=1.

**Witness:** Set R=O[t]/(t²−π), already permitted by §0.4. In R⟦T⟧, (π)=(t²) is not prime: t∉(t²), t²∈(t²). Local length at (t) is 2, so μ_R(R⟦T⟧/(π))=2.

**Exact repair:** Keep π=−p for Lubin–Tate theory, and introduce a coefficient uniformizer ϖ_R and e=e(R/O), with (π)=(ϖ_R^e). Refer to the vertical height-one prime as (ϖ_R), or to the entire p-primary divisor when that is intended. In line 601 replace μ=1 by μ=e; reserve μ=1 for L_p=ϖ_R. Audit all references to the “prime (π)” and preserve the true ideal identities involving the generally nonprime ideal (π). Do not restrict R to unramified extensions. Test: e=1 gives μ=1; R=O[√π] gives μ=2 and characteristic ideal (ϖ_R²). This also agrees with the ramified base-change Check in `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2824`.

## R03 (P3) — The inert Frobenius Check uses the rational-prime trace at a norm-p² prime

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:129`: “Frobenius φ((p))=−p … whose trace over ℚ is 0”.

**Claim:** The field trace of the displayed CM Frobenius is zero.

**Witness:** Tr_(K/ℚ)(−p)=−2p; at p=5 it is −10. `packages/NonordinaryCMSpecialValues/README.md:465` states the polynomial (X+p)² and a_(p²)=−2p.

**Exact repair:** Replace the final clause by “whose characteristic polynomial over the residue field of size p² is (X+p)², with trace −2p”. If a rational-prime comparison is wanted, explicitly assume a model over ℚ and distinguish its a_p=0 from a_(p²)=−2p. Tested at p=5: (X+5)²=X²+10X+25 has trace −10, not 0. The supplier ComplexMultiplicationAndExplicitReciprocity §4.1 makes precisely this distinction.

## R04 (P3) — A basis after coefficient extension has derivative in R×, not necessarily O×

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:192`: “On a basis vector of V_R⁺ … δ(v_+) is a unit of O”.

**Claim:** Every Λ_R-basis has O-valued unit derivative.

**Witness:** Normalize an extended O-basis v so δ(v)=1. In R=O[t]/(t²−π), u=1+t is a unit outside O. Then uv is a Λ_R-basis and δ(uv)=1+t∉O.

**Exact repair:** Say “a unit of R”; add that a basis extended from Λ_O has derivative in O×. Use the displayed u=1+√π as the coefficient-extension Check. Its derivative is in R× and δ_1(uv)=(1+p⁻¹)(1+√π), so the normalization and §2.5 remain consistent.

## R05 (P3) — A cofinal p-level shift does not insert an Euler factor into ξ

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:330`: “forces an extra factor p into the modulus changes δ(ξ) by the Euler factor … 6/5”.

**Claim:** Replacing the moduli fpⁿ by fpⁿ⁺¹ changes the inverse-limit class and its ordinary derivative.

**Witness:** The towers indexed by n≥1 and n≥2 are cofinal. `packages/NonordinaryCMSpecialValues/README.md:375` gives cor(z_ap)=z_a at fixed prime support; its line 383 Check explicitly excludes an extra Euler factor at successive p-levels.

**Exact repair:** Replace this Check by: “Once p divides the modulus, increasing its exponent and shifting the cofinal indexing leaves ξ and δ(ξ) unchanged. At p=5, δ_1(ξ)=6δ(ξ)/5 instead compares two derivative normalizations on that same class.” Keep the no-auxiliary-prime construction. Tested on a compatible family (z_fp,z_fp²,z_fp³,…): dropping the first coordinate and reconstructing it by corestriction gives the identical family, with multiplier 1, not 6/5. This does not dispute the separate Euler-operator relation when a previously absent prime is introduced at a finite level.

## R06 (P3) — Characteristic ideals already exist at the pin

**Location:** `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean:16`: “characteristic ideals of modules over R⟦Γ⁻⟧”; line 17: “none of these other carriers”. Also README lines 22, 59 and 91, which send the generic characteristic-ideal inputs only to a roadmap.

**Claim:** Characteristic ideals and their generic ideal operations are unavailable in pinned Tau Ceti.

**Witness:** `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85` defines `TauCeti.Iwasawa.charIdeal`; lines 132, 154 and 198 give multiplicativity, semilinear transport and the nonzero principal-quotient formula. These files are at pin 2fd255d9.

**Exact repair:** Remove characteristic ideals from the lists of missing carriers in the module docstring (including its §4.4 bullet). In Scope and ownership and the Tau Ceti contract cite `TauCeti.Iwasawa.charIdeal`, `TauCeti.Iwasawa.charDivisor`, `TauCeti.Iwasawa.charIdeal_eq_mul_of_exact`, `LinearEquiv.charIdeal_eq_comap` and `TauCeti.Iwasawa.charIdeal_quotient_span_singleton`, with their native hypotheses and files. Repoint the generic multiplicativity/quotient/semilinear Needs citations to these declarations; retain PadicMeasuresIwasawaAlgebras for the genuinely missing coefficient-norm and character-multiplicity contracts. Test: for a noetherian UFD A and f≠0 the pinned quotient theorem returns char(A/(f))=(f), including f=ϖ_R². The four headlines still lack their arithmetic Selmer/unit/L-function carriers, so this does not require a stand-in theorem or an unused TauCeti import.

## R07 (P3) — Signed local control cannot have the claimed nonzero finite cokernel

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:646`: “The cokernel is finite, not zero in general”.

**Claim:** In the setting of §5.2, a nonzero finite cokernel is possible.

**Witness:** By §3.3, the dual of L_∞^s[ω_n^s] is Λ_R/(ι(ω_n^s)), finite free over R. Thus L_∞^s[ω_n^s] is divisible. Its finite quotient cokernel is divisible, hence zero.

**Exact repair:** Delete “not zero in general” and replace this Check with the divisibility calculation. One may retain the weaker finite-cokernel theorem, explicitly saying that it suffices for subsequent control, or strengthen it to an isomorphism using this argument. Test at p=5,n=2: the target is cofree of R-corank 20 for plus and 5 for minus. If a finite cokernel Q is killed by ϖ_R^k, divisibility gives Q=ϖ_R^kQ=0. At n=1, plus, both sides are already 0. This correction concerns local control only; it does not remove the global finite errors in §5.3.

## R08 (P3) — Global duality identifies the cokernel but does not force it nonzero

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:518`: “which is nonzero for s=−ε (§4.4)”.

**Claim:** The signed-duality and characteristic formulas always make the localization cokernel nonzero.

**Witness:** Their algebra permits H^ε=S_rel=S_ε=Λ_R, C=H^ε, X_str=X_(−ε)=0. Then S_rel→H/H^(−ε) is the identity, its cokernel is 0, and both characteristic ideals in §4.4(2) are (1).

**Exact repair:** Replace “which is nonzero” by “which may be nonzero”. State its exact identification H^ε/loc(S_rel) for the opposite sign. The two diagnostic lattice models are S_rel=H^ε, giving cokernel 0, and S_rel=T·H^ε, giving Λ_R/(T). This is an overclaim about what the cited sequence implies, not a claimed arithmetic counterexample to the main conjecture.

## R09 (P3) — A nonzero logarithm alone does not give a nonzero discrete Kummer class

**Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:224`: “has λ_χ(y)≠0 and its Kummer class is outside L_n^s”.

**Claim:** Character support and nonzero logarithm of a point suffice to detect its discrete Kummer image outside the signed submodule, with no denominator or primitivity specified.

**Witness:** At n=0,s=+,χ=1 choose primitive Q∈F(Φ) and y=[π]Q. Then λ(y)=πλ(Q)≠0, but y⊗(π⁻¹ mod O)=Q⊗(1 mod O)=0. Its Kummer image belongs to L_0⁺=0.

**Exact repair:** Specify an actual tensor class and its nonzero image in the complementary rational-character lattice modulo its integral lattice. A concrete replacement is: “At n=0 choose Q generating F(Φ)≃pO. The image of Q⊗π⁻¹ is nonzero and outside L_0⁺=0, whereas [π]Q⊗π⁻¹=0.” For higher characters use their rational orbit, then a denominator making that complementary quotient class nonzero. This also avoids claiming a nontrivial-character eigenpoint over an insufficient coefficient field. At p=5 the first class is nonzero and killed by π; the second is zero.

## Verified sound

### Scope, principles and shape

Read all 36 numbered targets, all 36 Needs lines, the conventions, supplier contracts and worked examples. There are seven layers, seven Examples endings, seven Dependencies endings and 36 Checks blocks. The substantive definitions retain API paragraphs and at least three Checks; errors in individual Checks are reported above. The organization is mathematical: local transport → primitive coordinate → global units/strict comparison → duality/main conjecture → control → rank bounds. The internal dependencies force this direction; there is no statement that the organization follows a source and no chapter-named layer.

The package keeps the full inert Gross datum over H in Layers 0–4, p≥5, p∤h_K and arbitrary finite R/O. The E/K restriction is explicitly added for the rank/control applications. It does not re-plan an existing roadmap, insert an algorithm, or claim an own backticked Lean declaration absent from Suggested.lean. No sorry'd data, set_option, machine path, PR number or process hand-off text occurs in the two author files. Comparisons of house style used the main-branch EllipticCurves and ClassFieldTheory READMEs and PadicMeasuresIwasawaAlgebras.

### Headline coverage and Lean

The headline list is §4.6 (integral main conjecture), §6.4 (finite-character ranks), and the deep intermediates §4.2 (opposite signed torsion/compact vanishing) and §4.4 (signed characteristic formula). All four are explicitly named in the module docstring. None can be stated on the pins with only a few simple definitions: the arithmetic signed Selmer conditions, primitive elliptic-unit class and Rubin L-function still require the planned constructions. R06 corrects one item of the missing-carrier explanation, not this conclusion.

Ran `lake env lean` on the absolute Suggested.lean path from the prescribed content checkout: **exit 0, no output, no warnings**. The import is exactly `import Mathlib`; the namespace is correct. There are **zero declarations and zero sorry occurrences**. Accordingly the exhaustive one-tactic probe and the `#check @name` signature comparison each have **zero cases**; no padding or disappearing section binder exists. No build or background process remains running.

### Source sample, including hypotheses and pages

All five manifest entries were present and readable in the legal cache; no new source was needed. No locator was flagged unverified. The samples below were reread this round, not inherited merely from the earlier verdict. Source adaptations over H and R are stated as targets here; AHI06's ordinary-prime arguments are templates, not imports asserting an inert theorem.

| Sample | Text inspected | Result |
|---|---|---|
| 1.1 transported Kummer conditions | BKO21 lines 860–864, p.962; AHII05 lines 110–113, p.613 | Kummer image and exact annihilator agree; R09 corrects a Check, not the definition. |
| 1.2 comparison independence | BKO21 lines 865–866, p.962 | Explicit independence assertion; multiplying a comparison by an R-unit preserves the submodule. |
| 1.4 four Selmer conditions | BKO21 lines 867–872, p.962; AHII05 lines 72–97, pp.612–613 | All away-p finite conditions are zero; strict/ordinary/relaxed kernels and limits agree. |
| 2.1 primitive class | BKO21 lines 398–416 and 435–464, pp.951–953; lines 823–836, p.961 | m=0 gives L_0=K and the correct projection; fixed-support norm compatibility contradicts the old shift Check (R05). |
| 2.4 integral coordinate | BKO21 lines 833–839, p.961 | ξ=L_pv_ε in the integral free line, with C_∞=Λξ. |
| 2.5 interpolation | BKO21 lines 291–309, p.949; lines 825–844, p.961 | Inverse covariance, nonzero denominator and conjugate(φχ) numerator agree. Visually checked the PDF's bars. |
| 3.5 strict elliptic-unit comparison | AHII05 lines 180–189, p.615; RUB91 lines 486–551, pp.36–37 and 565–571; AHI06 lines 1081–1128, pp.1028–1029, 1234–1238 and 1290–1308, pp.1032–1033 | Correct nonsplit part (ii), nontrivial decomposition character and matching correction divisor. p∤h_K and tame p²−1 give the prime-to-p finite descent. |
| 4.1 exact duality sequence | AHII05 lines 219–231, p.616 | Exact sequence, map variance and signs agree. Nonvanishing is not a consequence (R08). |
| 4.3 relaxed torsion | AHII05 lines 233–246, p.616; BIL86 lines 319–322, p.351, 366–381, p.353, 618–639, pp.364–365; AHI06 lines 415–417, p.1010 | The coprimality and Leopoldt hypotheses and involution are retained; AHI06 1.2.1 is the appropriate symmetry locator. The extension to the general datum remains a stated proof obligation. |
| 4.4 signed characteristic ideals | AHII05 lines 247–280, pp.616–617 | Both identities are present; the main-conjecture identity follows from the two torsion exact sequences. |
| 4.5 localized lattice | AHII05 lines 281–298, p.617; BKO21 lines 833–844 and 881–886, pp.961–962 | Correct primitive coordinate and integral lattice comparison; the auxiliary distribution factors must be units collectively, as the target requires. |
| 5.1 control elements | AHII05 lines 307–317, p.618 | Products, root sets and annihilation agree after translating character-set labels only. |
| 5.4 finite decomposition | AHII05 lines 392–408, p.620 | Finite kernel/cokernel; cofinite type over the finite resultant quotient is essential and holds here. |
| 5.6 strict specialization | BKO21 lines 894–908, pp.962–963; AHII05 lines 318–337, pp.618–619 | Injection suffices for the first inequality; local length bounds the second. No unjustified finite-cokernel assertion is needed. |
| 6.4 finite-character ranks | BKO21 lines 888–908, pp.962–963 | E/K hypothesis, matching parity without +1 and opposite parity with +1 agree. The least order-indexed layer r and every n≥r are handled by the control targets here. |

The repaired §2.2 was also reread against BKO21 lines 422–478 and 823–844. The printed equations agree with the mathematics of the README; R01 is solely the false description of the source. The first-round BKO source issue must not be carried forward.

### Computed adversarial table

This table records actual values, including all sampled targets and all four headlines. Algebraic lattice models test the asserted algebra and implications; they are not falsely advertised as realized elliptic curves. I also recomputed the unchanged cases below rather than relying on earlier rows without values.

| Statement | Instances tried | Values on the two sides / negative control | Result and change |
|---|---|---|---|
| Conventions; 0.1 datum | K=ℚ(√−23), p=5; p=2,3 | Reduced forms give h=3; squares mod 5={0,1,4}, −23=2 mod 5; 5∤3. p=2,3 violate p≥5. | Full class-number scope retained. |
| 0.1 Frobenius | p=5 at the K-prime | φ((5))=−5; Tr=−10 versus asserted 0; polynomial X²+10X+25. | R03. |
| 0.1 coefficient extension | T=R, L′≠L | (L′/R) surjects onto L′/L≠0, whereas R′⊗_O Φ/O is torsion of R′-corank 1. | Old-lattice wrong model excluded. |
| 0.2 towers | p=5, n=0,1 | Local degrees 1 and 5; first LT division degree 24; cγc⁻¹γ=1, whereas γ²≠1. | Correct. |
| 0.3 signs | Orders 1,5,25 | c=0,2,3 and signs +,+,−; AH sets −,−,+; point labels stay unchanged. | Correct. |
| 0.4 Cartier coefficients | R=O; R=O[√π] | Differents O and (2√π)=(√π); inverse-different quotient has 25 elements at p=5; Tr(1)=2. | Correct twist and trace. |
| 0.5 scalar kernels | a=p; a=T | a(χ⁻¹)=p≠0 for every χ; T has just the trivial-character zero. Infinitely many opposite-parity zeros force a=0. | Correct. |
| 0.5 basis covariance | δ(v)=1, u=1+√π | δ(uv)=1+√π∈R× but not O; δ_1(uv)=6(1+√π)/5 at p=5. | R04. |
| 1.1 signed image | n=0; y=[π]Q | L_0⁺=0, corank_R L_0⁻=1; λ(y)=πλ(Q)≠0 while y⊗π⁻¹=0. | Definition correct; R09 Check. |
| 1.1 transition convention | m=n+1, base point with logarithm a | Restriction logarithm a; trace logarithm pa=5a at p=5. | Maps distinguished. |
| 1.2 comparison independence | Unit u=2; nonunit π | 2L_n^s=L_n^s; π on F[π∞] has kernel of size 25 for R=O. | Unit comparison correct; nonunit excluded. |
| 1.3 away-p vanishing | Good place q=4 | Absolute values of α and q/α are both 2≠1, so H⁰=H²=0 and rational H¹=0. Integral ker(α−q) can be nonzero modulo the maximal ideal. | Rational/integral distinction correct. |
| 1.4 Selmer kernels | n=0, local condition; zero global class | Plus condition 0 gives Sel_+=Sel_str; minus condition ordinary gives Sel_−=Sel; zero class has all localizations 0 and belongs to every kernel. | Correct definitions. |
| 1.5 dual convention | χ(γ)=ζ₅ | (γf)(x)=ζ₅⁻¹f(x)=ζ₅⁴f(x), not ζ₅f(x); annihilator of away-p 0 is the full compact group. | Correct contragredient and dual condition. |
| 2.1 projection | ν=1,p=5,n=0 | L_0=K; R[Gal(K/K)]=R; evaluation=identity; tame averaging coefficient 1/24 is integral. | F02 repaired. |
| 2.1 p-level shift | (z_fp,z_fp²,…) vs its tail | Reconstruction by cor gives z_fp; every remaining coordinate is identical. Multiplier 1 versus claimed 6/5. | R05. |
| 2.2 values | χ=1; order 5 | Trivial deletion factor 1−(−5)/25=6/5; ramified-character local factor=1. PDF numerators are φ̄χ as stated. | Formula correct; R01 source description. |
| 2.3 sign/nonvanishing | ε=+, order 25; ε=−, χ=1 | (−1)³ε=−1 forces value 0; at ε=− the trivial value is 0. ξ=πv remains nonzero in the free line. | Correct sign and distinction from primitivity. |
| 2.4 coordinate | ξ=Tv; v′=(1+T)v | Coordinates T and T/(1+T); both ideals (T); ξ=0 would give coordinate 0 and is excluded by §2.3. | Correct uniqueness and unit covariance. |
| 2.5 interpolation | χ(γ)=ζ₅; ε=− at 1 | δ_(χ⁻¹)(γv)=ζ₅δ_(χ⁻¹)(v); numerator L(φ̄χ⁻¹,1). At ε=−, both derivatives are 0; model L_p=π has L_p(1)=π≠0. | Correct; no 0/0. |
| 3.1 all-auxiliary span | One generator with factor T vs full family including a unit factor | Single span TC gives an extra characteristic factor (T); adding a unit-factor generator gives C. | Correct full-family requirement. |
| 3.2 descent | h_K=3,p=5; excluded h_K=5 | 1/3∈R, 1/5∉R; tame degree 24 is a p-unit. | Hypotheses precisely exclude nonintegral averaging. |
| 3.3 local comparison | p=5; scaling by π | Tame character order 24 gives invariants 0; H has rank 2=1+1. Scaling a signed line by π gives nonzero quotient Λ_R/(π). | Integral comparison necessary and stated. |
| 3.4 global ranks | One complex place, rank-one avatar; ideal (ϖ_R,T) | Euler rank difference 1·1=1; the ideal has rank 1 but needs two generators modulo the maximal ideal. | No false freeness conclusion. |
| 3.5 strict comparison | K=ℚ(√−23),p=5; trivial vs LT character | [H(E[5]):K]=3·24=72; 5∤72; LT residual character order 24≠1, while trivial character value=1. | Correct equality component and Rubin hypotheses. |
| 4.1 duality | S_rel=H^ε vs TH^ε | Opposite-sign localization cokernels 0 and Λ_R/(T), respectively; final dual map is surjective in both. | Sequence correct; R08. |
| 4.2 opposite torsion | ε=+ and ε=− | (rank S_ε,rank X_ε)=(1,1); (S_(−ε),S_str)=(0,0), rank X_(−ε)=0. A torsion submodule of free H is 0. | Rank argument matches the source. |
| 4.3 involution | f=T−a, a=5 | ι sends its root to (1+5)⁻¹−1=−5/6≠5; for a=0 both roots are 0. | The stated symmetry obligation cannot be omitted. |
| 4.4 characteristic formula | H^ε=Λ,S_ε=(T),C=(T²), char X_str=(T) | char(S_ε/C)=(T); char X_(−ε)=(T)·(T)=(T²)=char(H^ε/C). | Correct integral identity; wrong replacement C→S_ε gives (T). |
| 4.5 primitive lattice | loc(C)=L_pΛv; smoothing α≡2 mod p | Quotient char=(L_p); distribution residue N(α)−φ(α)=4−2=2 mod 5, a unit; common factor ϖ_R instead would give (ϖ_R L_p). | Tests the required unit ideal, not merely rational equality. |
| 4.6 main conjecture | R/O degree 2, L_p=T; ramified R=O[√π], L_p=π | Restricted char=(T²); at vertical prime (√π), length=2 and char=(π)=(√π²). | Main ideal formula consistent; μ convention R02. |
| 5.1 products | p=5,n=0,1,2 | (ω⁺,ω⁻)=(1,T),(1,γ⁵−1),(Φ₂₅(γ),γ⁵−1); degrees at n=2 are 20+5=25; product γ²⁵−1. | Correct including empty product. |
| 5.2 local control | n=1,+; n=2,± | Coranks 0; then 20 and 5 on both sides. A finite quotient Q of the divisible target satisfies Q=ϖ_R^kQ=0. | R07. |
| 5.3 global control | n=0,±; inertia scalar a≠1 | Plus quotients both 0; minus uses T-coinvariants. W^(I)⊆ker(a−1), finite of length v_R(a−1). | Correct direction and finite inertia errors. |
| 5.4 finite decomposition | p=5,n=2 | Mod γ⁵−1, Φ₂₅(γ)=5. Resultant quotient is 𝔽₂₅[T]/(T⁵), size 25⁵=9,765,625; rationally it is 0. | Finite integral errors, rational isomorphism. |
| 5.5 specialization length | M=0; A/(t²); κ² | (dimension,length)=(0,0),(1,2),(2,2). For f=T−(ζ₅−1) over coefficients containing ζ₅, orders at χ and χ⁻¹ are 1 and 0. | Inequality and restricted inverse-order claim correct. |
| 5.6 strict specialization | X_str=Λ/(g²); χ=1 | Fiber dimension 1≤multiplicity 2; the strict finite-level dimension is at most 1 by injection. χ⁻¹=χ at 1. | Correct inequality and no cokernel assumption. |
| 6.1 divisor containment | char X_str=(T), complementary factor T² | (T³)⊆(T); orders 1≤3. | Containment direction correct. |
| 6.2 CM local correction | n=0; n=2,p=5 | CM local dimensions 1 and 25, each character once; underlying ℚ_p dimensions 2 and 50. | Correction bound 1, not 2. |
| 6.3 matching bound | ε=+, χ of order 5 | χ(ω_2⁻)=0; ordinary and minus χ-conditions each have local dimension 1; upper bound ord_χ L_p with no +1. | Correct. |
| 6.4 rank branches | χ=1, ε=±; order 25,ε=+ | Bounds ord_1 L_p and ord_1 L_p+1; order-25 branch gets ord_χ L_p+1. If order=0 these give ranks 0 and ≤1. | Correct inequalities; no equality claimed. |

Zero rings, characteristic-p coefficients, inseparable fields, nonabelian tower groups and q=1 do not satisfy the stated number-field/DVR/tower hypotheses. They are not silently admitted. Ramified characteristic-zero coefficients do satisfy them, which is why R02 and R04 are genuine counterchecks. All displayed denominators are nonzero under the standing assumptions; no interpolation denominator is used in the wrong parity.

### Pinned declarations actually opened

The checkout revisions equal the manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to those libraries, not machine paths.

| Declaration | File and line at the pin | Relevant content |
|---|---|---|
| `Module.length` | `Mathlib/RingTheory/Length.lean:31` | ℕ∞-valued length. |
| `Module.length_le_of_surjective` | `Mathlib/RingTheory/Length.lean:202` | `include hg` retains surjectivity. |
| `Module.length_eq_finrank` | `Mathlib/RingTheory/Length.lean:293` | Division ring, finite module; `length_eq_rank` immediately above handles the unrestricted rank. |
| `IsLocalRing.length_restrictScalars` | `Mathlib/RingTheory/LocalRing/Length.lean:54` | Scalar-tower/local-map hypotheses; residue-degree factor retained. |
| `Polynomial.cyclotomic` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227` | Native polynomial definition. |
| `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one` | same file, line 525 | CommRing and prime p; exact product identity. |
| `Module.Basis` | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | Actual representation equivalence, not a free coordinate function. |
| `Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean:100` | Requires a unit multiplier. |
| `IsGalois.normalBasis` | `Mathlib/FieldTheory/Galois/NormalBasis.lean:121` | Finite Galois normal basis. |
| `IsDedekindDomain.selmerGroup` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161` | Valuation conditions on K× modulo n-th powers. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Compatible finite-level group-algebra families; no automatic compactness for arbitrary R. |
| `TauCeti.IsCompactModule.completedGroupAlgebraModule` | corresponding `Module.lean:322` | Explicit compact-module argument and continuous action. |
| `WeierstrassCurve.Affine.selmerGroup₂` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104` | 2-descent local conditions in W.M. |
| `WeierstrassCurve.Affine.selmerGroupA` | corresponding `SelmerGroupA.lean:144` | Étale-algebra 2-Selmer construction. |
| `TauCeti.Iwasawa.charIdeal` and its three operations | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85`, 132, 154, 198 | R06; these are generic pinned inputs, not missing arithmetic carriers. |

Object searches of both libraries found the characteristic-ideal implementation above, the existing Hecke-character carrier (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70`), completed group algebra and continuous-cohomology development, but no ready-made signed anticyclotomic Selmer/Rubin-function construction. The empty Lean file introduces no duplicate fully qualified name.

### Supplier resolution, ownership and gaps

`roadmaps resolve` reported no unresolved roadmap citations or roadmap Lean names. Its output says that it does not check external library names on this host; the pinned checks above therefore matter independently.

Resolved the actual sections, not just roadmap names:

- **AnticyclotomicLocalUnits, PR #1692:** `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:148` (§0.1), 237 (§0.5), 297–361 (§§1.2–1.5), 458 (§2.4), 498–524 (§§3.1–3.2), 591 (§3.6), 647–688 (§§4.2–4.4), 1075 (§8.2), 1103 (§8.4), 1117 (§8.5). The derivative uses inverse character covariance, the formal logarithm direct covariance, and point signs kill their own character parity. This roadmap owns only the CM R-extension and global transport. The supplier's §§2.2–2.4 also supply the vanishing obstruction behind the full local comparison, not an arbitrary chosen pairing.
- **NonordinaryCMSpecialValues:** every cited NCM node is present in `packages/NonordinaryCMSpecialValues/design/plan.json`. Their mathematical content is at README §§0.4 (period), Conventions (dual Tate), 2.7–2.10 (normalised class, direct reciprocity, twist and period), 3.3–3.5 (splitting, Frobenius, Honda comparison), 1.3–1.4 (root sign and zeros), and 6.4 (nonvanishing). The earlier plan identifiers remain available. The current normalized class explicitly has fixed-prime-support corestriction, the witness for R05.
- **LubinTateFormalModulesAndQuasiCanonicalLifts:** LT.0–LT.2 and LT.8 nodes, including lt-character, reciprocity-comparison and bko-fields, exist in its package plan, with the corresponding formal-module, torsion/reciprocity and BKO layers in its README. The norm group and degrees exclude p=2,3 only for the BKO application, not for the general supplier theory.
- **ComplexMultiplicationAndExplicitReciprocity, PR #1254:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:634` (§4.1) and 684 (§4.3). Read the Hecke-character, Tate-component, Frobenius and canonical Gross targets. F01's replacements are actual titles. The field-trace/rational-prime distinction agrees with R03.
- **SelmerIwasawaCohomology, PR #869:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:343` onward (§§2.1–2.6), 591 (§2.10), 717 (§2.13), 821 (§2.19), 1329 (§3.0), 1373 (§3.1), 1426 (§3.3), 1562 (§3.10), 1582 (§3.11), 1600 (§3.12), 1758 (§3.16). Read propagation, inverse-different warning, Poitou–Tate, compact limits, Tor corrections, control and involution. In particular its local conditions propagated from rational spaces are divisible, consistent with R07.
- **ArithmeticGaloisDuality, PR #858:** `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1303`, 1401, 3118, 3436, 3505, 6232 and 6354 resolve R02.2.2–2.3, R02.4.2–4.4 and D7.7.1–7.2. The trace pairing and cor∘res=index match the computed examples.
- **EulerSystemsAndKolyvaginSystems, PR #1272:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1606`, 4558, 4983 and 5466 resolve §§2.2, 8.1, 8.11, 8.25. The anticyclotomic tower is not treated as admissible; the supplied condition (*) or the two-variable route is used.
- **On main:** `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` §§1.7, 4.3, 4.5, 4.6; `TauCetiRoadmap/EllipticCurves/README.md` Layers 1,3,4,7; `TauCetiRoadmap/ClassFieldTheory/README.md` Layers 6,11–13. Read their named interfaces. The generic PMIA section still names its targets, but several are implemented at the pin (R06); its coefficient-norm paragraph is restricted to base ℤ_p.

Read the board package index before the ownership audit. `roadmaps grep` searched objects at the indexed open heads and main. The closest-roadmap audit found no competing owner: ALU explicitly leaves global Selmer/Rubin functions downstream; EulerSystemsAndKolyvaginSystems supplies the general descent theorem; SIC supplies general Selmer/control interfaces. `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:3` (PR #1423) builds Heegner point classes and their descent, rather than these elliptic-unit classes. `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:634` (PR #1499) constructs the cyclotomic Coleman-kernel signed conditions, a different tower and construction. The supplied overlap report lists no conflicting head, dropped cited id or revision-only id; the closest scopes were checked against their actual text. No overlapping own Lean declaration exists because this file declares none.

The four declared gap slugs agree between `packages/InertAnticyclotomicCMMainConjecture/design/plan.json` and README lines 69,71,93,95:

- `elliptic-unit-euler-system`: broader auxiliary/modulus family than NCM's normalised class; owner NonordinaryCMSpecialValues NCM.1.
- `inert-two-variable-main-conjecture`: nonsplit Rubin equality on specified nontrivial decomposition components, owner NCM.1; read RUB91's precise hypotheses.
- `restriction-of-scalars-finite-extension`: arbitrary finite DVR base O, beyond PMIA §4.6's ℤ_p base; not supplied by the pinned generic ideal operations.
- `character-prime-multiplicity`: analytic order at a finite-character point versus the local-length divisor, beyond the pinned definition of that divisor.

These are precise named contracts, not unowned prerequisites. No finding asks the consumer to implement them or to wait merely because they are absent today.

The dependency check was run with the supplied name, order, movable and content arguments. Output:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. In this order the local/CM chain has positions 344 (LubinTateFormalModulesAndQuasiCanonicalLifts), 345 (NonordinaryCMSpecialValues), 347 (AnticyclotomicLocalUnits), 348 (this package). The other cited roadmaps are on main or earlier suppliers. The Downstream consumers paragraph adds no reverse supply edge.

## Not verifiable

- The future proofs of the supplier gaps are not present; they are declared contracts, not checked implementations. This review checked precision, ownership and the available mathematical source statements.
- RUB91 is OCR text. Its §4 hypotheses, sequence (5), Theorem 4.1(ii) and nonsplit remark are readable; parts of the §1 construction remain typographically garbled. I do not certify a word-for-word reading of those garbled formulas. No new source request is needed for the already certified work.
- The BKO text extraction is not reliable for overbars. The disputed pages 953 and 961 were rendered and inspected directly, resolving that issue; the extraction alone must not be used as evidence of a misprint.
- This is a roadmap review, not a proof of its deep targets. In particular the general Gross/R transport in §§3.2, 3.5 and 4.3, and the integral distribution-factor comparison in §4.5, remain implementation work explicitly stated by the roadmap. The source and algebra checks above do not assert those proofs have been formalized.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the control-element product has exponent p^k; it should be p^n, with n the level fixed in the proposition; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says its symmetry input is AHI06 Lemma 2.1.2; it should be Lemma 1.2.1; affects nothing.
- **Misprint** in BIL86 at Introduction, p.342: the source says the pseudo-isomorphism and characteristic-series results are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.
