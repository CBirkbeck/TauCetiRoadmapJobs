<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6905132415 -->
Red team round 1 pass b (claude) of d5abbd4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 1.4 claims the characteristic-two principle for `d ≤ 3` from a theorem that assumes resolution in every dimension

   - Location: `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:519` ("every such `X` detects in degree `d + 1` … Jannsen, Theorem 0.6 of arXiv v2 … for `d ≤ 4` and a given smooth projective `X`, the vanishing is also known unconditionally (Jannsen, p. 5)"), and its *Needs:* line `README.md:528`.
   - Claim: with `RS(𝔽₂)` assumed only for `d > 3`, Jannsen's Theorem 0.6 gives detection for every smooth projective `X` over `𝔽₂`, the model for `d = 2, 3` coming from Lipman and Cossart–Piltant.
   - Witness: jannsen_hasse line 191 assumes resolution "over k", which is Definition 4.18 (lines 1889–1897) in all dimensions, and the proof (lines 2183–2185) uses its second clause; cossart_piltant lines 162–167 give only the first. jannsen_hasse lines 195–197 attribute the unconditional case to another paper.
   - Repair text. In 1.4 replace the sentence "Jannsen's route compares … (Jannsen, p. 5)." by: "For `d > 3` this is Jannsen's theorem under `RS(𝔽₂)` (Theorem 0.6 of arXiv v2; its proof of Theorem 5.10, pp. 46–47, takes smooth hyperplane sections in normal crossings with the boundary after extensions of prime-power degree for two primes and returns by a trace argument, so only Bertini over infinite fields enters). For `d ≤ 3` no resolution hypothesis is available to that theorem, and the statement is Kerz–Saito's Theorem 8.1, p. 37, in its second case: `Λ = ℤ/2` with `ℓ = 2` the characteristic (their §8 fixes an arbitrary prime `ℓ` over a finite base), `X` projective, `a = d ≤ 4`, where their condition `(G)_{2, d−2}` (alterations of degree prime to `ℓ` making a closed subscheme of dimension at most `d − 2` an admissible simple normal crossings divisor, §6, p. 30) holds by embedded resolution of surfaces, as they record there." Add to the *Needs:* line of 1.4: "Kerz–Saito, Theorem 8.1 (second case) and condition `(G)_{ℓ,q}` of §6 (for `d ≤ 3`); LefschetzPencilsAndVanishingCycles §3.5 and gap:snc-bertini-over-base (the Bertini input of that route over `𝔽₂`)". Add the locators "§6, condition `(G)_{ℓ,q}`" and "Theorem 8.1, second case" to the kerz_saito line of the References. Tested on the refuting instance: `K` of characteristic two with `δ(K) = 3`, `X` Cossart–Piltant's projective model, `a = 3 ≤ 4`: kerz_saito lines 1852–1862 apply with no resolution hypothesis beyond `(G)_{2,1}`.

2. **F02** (P3) `exists_formula_isAlgebraic_primeField` is the case `n = 1` of `exists_formula_not_algebraicIndependent`

   - Location: `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean:73` ("theorem exists_formula_isAlgebraic_primeField : ∃ φ : Language.ring.Formula (Fin 1), …, φ.Realize ![x] ↔ IsAlgebraic (⊥ : Subfield K) x").
   - Claim: a separate headline.
   - Witness: it follows from `exists_formula_not_algebraicIndependent 1` (`Suggested.lean:81`) by the pinned `algebraicIndependent_unique_type_iff` (`Mathlib/RingTheory/AlgebraicIndependent/Transcendental.lean:38`); poonen_uniform line 58 says so, and so does the Check at `README.md:421`.
   - Repair: delete `exists_formula_isAlgebraic_primeField` from `Suggested.lean` and its mention in the module docstring ("uniform constant field and"); README 0.13 keeps the statement as a target, written "Prove:" instead of "State `exists_formula_isAlgebraic_primeField`:", and the name is removed from `README.md:400`.

3. **F03** (P3) 1.5 is stated for every prime `n ≠ char K`, but its groups are defined only for `n = 2` or `n` invertible

   - Location: `README.md:532` ("Let `n` be a prime different from `char K` such that `K` has no orderings") with the sequence of `README.md:535`; definitions at `README.md:474`.
   - Claim: the four-term sequence is defined and exact for all such `n`.
   - Witness: `k = ℚ`, `n = 3`: a vertical `x ∈ 𝒳₁` over the prime `3` has `char κ(x) = 3`, and 1.1 defines `H²(κ(x), ℤ/n(1))` only for `n = 2` or `n ≠ char`. pop_eei2 line 184 uses only `n = 2`, `char ≠ 2` and `n = 3`, `char = 2`.
   - Repair text: replace "Let `n` be a prime different from `char K` such that `K` has no orderings, for instance `μ_{2n} ⊆ K`." by "Let `n = 2` if `char K ≠ 2` and `n = 3` if `char K = 2`, and suppose that `K` has no orderings, for instance `μ_{2n} ⊆ K`; then every group of the sequence is one of those of 1.1 (for `n = 2` at points of residue characteristic two, Kato's group)." In 1.6(d) nothing changes. Tested on the instance: `k = ℚ`, `n = 3` is no longer in the statement; `k = ℚ`, `n = 2`, `x` over `2`: `H²(κ(x), ℤ/2(1))` is Kato's group of 1.1.

4. **F04** (P3) Poonen's Theorem 1.2 is cited but is no target

   - Location: `README.md:1448` ("Theorems 1.1–1.4, 2.2, 2.3"), and the ownership line `README.md:10` ("the characteristic sentence, the uniform constant field, uniform algebraic dependence").
   - Claim: the reference list says the roadmap uses Theorems 1.1–1.4 of poonen_uniform.
   - Witness: poonen_uniform lines 49–50 (Theorem 1.2: one formula defines the prime subfield in every infinite finitely generated field); no section of the README states it, and 0.7 omits the item it needs (poonen_uniform line 116).
   - Repair text (the roadmap owns Poonen's uniform definitions, so the theorem is added, not the citation cut). Add to 0.7 the item "(2a) a formula defining the prime subfield in every global field (Rumely, III; Poonen, Theorem 2.2(2), p. 3)". Add after 0.13: "### 0.13a The prime subfield. Prove: there is one formula `π(x)` such that in every infinite finitely generated field `K` the set defined by `π` is the prime subfield (Poonen, Theorem 1.2, p. 2, and its proof, p. 11). In characteristic zero take the fractions of the set `Z` of 0.10(e); in positive characteristic intersect the prime subfields, defined by 0.7(2a), of the members of the family of 0.12(d), which is nonempty because `K` is infinite. **Checks.** In `ℚ(√2, t)` the formula defines `ℚ`, not `ℚ(√2)`. In `𝔽₉(t)` it defines `𝔽₃`, while 0.13 defines `𝔽₉`. Finite fields are excluded: no formula defines `𝔽_p` in `𝔽_{p²}` for all `p` (Poonen, p. 2). *Needs:* 0.7, 0.10, 0.12." Tested: for `K = 𝔽₉(t)` every member of 0.12(d) contains `𝔽₉` and has prime subfield `𝔽₃`, so the intersection is `𝔽₃`.

5. **F05** (P2) the Brauer sequence of global function fields is cited to a layer that covers number fields only

   - Location: `README.md:546` ("*Needs:* 1.1; ClassFieldTheory Layer 10; KTheoryFiniteLocalFields §§3.0–3.0a"), also `README.md:489`, `README.md:565`, `README.md:575` and the Check `README.md:486`.
   - Claim: ClassFieldTheory Layer 10 supplies the Brauer–Hasse–Noether input of 1.1, 1.5 and 1.6.
   - Witness: `K = 𝔽₂(s, t)`, `k = 𝔽₂(s)`, `n = 3`: every `κ(x)`, `x ∈ 𝒳₁`, is a global function field. `TauCetiRoadmap/ClassFieldTheory/README.md:1839` restricts Layer 10 to number fields. The owner is ArithmeticGaloisDuality §R02.3.2, item 1 of its class-formation paragraph.
   - Repair text. In the *Needs:* lines of 1.1, 1.5 and 1.6 and in the Layer 1 Dependencies replace "ClassFieldTheory Layer 10" by "ClassFieldTheory Layer 10 (the Brauer sequence of a number field); ArithmeticGaloisDuality §R02.3.2 (the exact sequence `0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0` of a global function field `F`: the residue fields of the vertical points of `𝒳`, and of all its points of dimension one when `char k > 0`)". In the supplier contract `README.md:95` append to the §R02.3.2 sentence "and the exact Brauer sequence with the sum of the local invariants". In the Check `README.md:486` append "(ArithmeticGaloisDuality §R02.3.2)". Tested on the instance: for `k = 𝔽₂(s)` every term `H²(κ(x), ℤ/3(1)) = Br(κ(x))[3]` is now covered by §R02.3.2; for `k = ℚ`, `n = 2`, horizontal points use ClassFieldTheory Layer 10 and vertical ones §R02.3.2.

6. **F06** (P3) isogeny invariance of good reduction is NeronModelsAndSemistableAbelianVarieties §5.2, not §5.1

   - Location: `README.md:27` ("**NeronModelsAndSemistableAbelianVarieties** §5.1 (Néron–Ogg–Shafarevich, isogeny invariance of good reduction)"), `README.md:110`, `README.md:330`, `README.md:396`, `README.md:466`.
   - Claim: §5.1 states that good reduction is invariant under isogeny.
   - Witness: at that roadmap's open head §5.1 is "Néron–Ogg–Shafarevich" (henselian base, `ℓ ≠` residue characteristic); the statement used in 0.12(a) is "5.2 Good reduction is isogeny invariant" (`GoodIsogeny`, any discrete valuation ring, inseparable isogenies included).
   - Repair text: in the five places write "NeronModelsAndSemistableAbelianVarieties §5.2 (`GoodIsogeny`: isogenous abelian varieties over the fraction field of a discrete valuation ring have good reduction simultaneously)", and in `README.md:110` drop "the Néron–Ogg–Shafarevich criterion, so that". Tested on the use in 0.12(a): `E_u` has bad reduction at `v`, each `A_i` good reduction, so §5.2 over the local ring of `v` (not henselian) excludes an isogeny directly.

7. **F07** (P3) `denseRange_algebraMap_finiteAdeleRing` is a name the open revision of GlobalNumberFields drops; the pinned declaration has another name

   - Location: `README.md:123` ("Layer 6, `denseRange_algebraMap_finiteAdeleRing` (strong approximation with the archimedean places omitted)").
   - Claim: that is the name of the Layer 6 theorem.
   - Witness: the name occurs only in `Completed/GlobalNumberFields/Suggested.lean:355`; that roadmap's README (line 444) and the pin (`TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:476`) call it `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap`, and the open revision of GlobalNumberFields no longer declares the cited name.
   - Repair text: "GlobalNumberFields Layer 1, `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (finite and archimedean weak approximation with signs), and Layer 6, `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap` (the diagonal image of `K` is dense in the finite adeles: strong approximation with the archimedean places omitted), both proved at the pinned Tau Ceti". Add both names to "From Tau Ceti". Tested: both names resolve at the pin (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208` and the file above).

Seven findings: two P2 (R01, R05), five P3. No P1: every `Suggested.lean` statement was found true as typed at the instances tried.

## The pass: statements, instances, values

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `kroneckerDimension` (Lean, 0.1) | `𝔽₉`; `ℚ`; `𝔽_q(t)`; `ℚ(s,t)`; `𝔽₂(s,t,u)`; `ℚ̄` | `0+0`; `0+1`; `1+0`; `2+1 = 3`; `3+0`; `0+1` with `Field.FG` false | agrees with Conventions | none |
| `IsGeometricPrimeDivisor` (Lean, 0.2) | `ℤ_(p) ⊂ ℚ`; `t`-adic in `𝔽_q(t)`, `ℚ(t)`; arc valuation on `ℚ(s,t)`; `O = K`; finite `K` | char `p ≠ 0` fails; `0+1 = 1`, `1+1 = 2` hold; `1+1 ≠ 3` fails; not a DVR; no proper valuation subring | determines the object; wrong model "prime divisor" excluded by the characteristic clause | none |
| `exists_sentence_kroneckerDimension_eq` (0.8) | `n = 0`: `𝔽₄`, `ℚ`; `n = 1`: `𝔽₃(t)`; monotonicity in `m` | `⟨1,−b⟩₃` anisotropic for a non-cube, 6 > 3 variables isotropic; `(1+i)⁴ = −1`, `t̄⁴⁰ = −1` in `𝔽₈₁`; an `m`-slot form is a subform of a `δ`-slot one | true as stated | none |
| `exists_sentence_charZero` (0.10(e)) | char 2; odd `p` with `Z` additively closed; `Z = ∅`; `ℚ` | `2 = 0`; `s = 2·((p+1)/2)s` so `Z = 2Z`; `∅ = 2∅`; `ℤ ≠ 2ℤ` | second clause holds for all fields, as poonen_uniform lines 47–48 | none |
| `exists_formula_isAlgebraic_primeField` (0.13) | `𝔽₉`; `𝔽₉(t)`; `ℚ(t)`; `n = 1` of 0.14 | empty intersection `= K`; `𝔽₉`; `ℚ`; same set | true; redundant | R02 |
| `exists_formula_not_algebraicIndependent` (0.14) | `n = 0`; finite `K`, `n ≥ 1`; `(s, s²)`, `(s, t)` in `ℚ(s,t)`; slot count in (a) | empty family independent, formula false; always dependent; dependent, independent; a dependent tuple has `r ≤ n − 1`, so the `n + 1` slots satisfy `n + 1 ≥ r + 2`, the bound of 0.6(c) in both the number-field and the function-field case | true | none |
| 0.6(a) cubic descent | `q = X³ + sY²Z`, `P = (r,1,r)`, `r² = s`, char 2 | `r³ + sr = 0`; `f = Y(Y² + sX²)`; `q(0,1,0) = 0` | correct | none |
| 0.6(c) | finite `k`: `2n_k^{r+1} > n_k^{r+1}`; number field: `(r+3)`-fold Pfister, `cd₂ ≤ r+2`; `ℚ`: `8⟨1⟩` | isotropic; isotropic; anisotropic without `√−1` | bound sharp, hypothesis needed | none |
| 0.11 Checks | `y² + xy = x³ + 1` over `𝔽₂`; `y² + y = x³` | 4 points, trace `−1`; 3 points, trace `0` | correct | none |
| 0.12 Checks | `y² = x³ + x + 1` over `𝔽₅`; `P₀ = (2,1)`; `t = s²`, `b = 0` | 9 points, trace `−3`; `z(P₀) = 3`, `b = 1`; `(2s)² + s² = 0` | README's corrected test is consistent; the printed one accepts `s²` | Source issues |
| 0.12(d) maximality | `𝔽₂(s) ⊂ 𝔽₄(s, t)` | dimension one, not relatively closed, properly inside `𝔽₄(s)` | clause needed and sufficient | Source issues |
| 1.1 Check | `(−1,−1)` over `ℚ(√5)` | `2` inert, invariant `2·½ = 0`; `½` at each real place | correct | none |
| 1.3 | `d = 1` henselian; non-excellent `R` from `𝔽₃(t, b³)`; kerz_saito lines 1852–1861 | `K_{w_x} = K`; `b` purely inseparable over `Frac R`, in the completion; proper, `ℓ` invertible | hypotheses match Theorem 8.1 | none |
| 1.4 | `d = 0`; `d = 3`, char 2, general `K` | `H¹(𝔽_q) = ℤ/2 ≠ 0`; Theorem 0.6 needs both clauses of Definition 4.18 in all dimensions | `d ≤ 3` not supported by the citation | R01 |
| 1.5 | `k = ℚ`, `n = 3`, `x` over `3`; `k = 𝔽₂(s)`, `n = 3` | group undefined in 1.1; all `κ(x)` function fields | generality and supplier | R03, R05 |
| 2.1 Check | tails `(21, −1)`, `(7/3, −1)` over `ℚ` | `(−1, 21)₂ = +1`; `v₃(7/3) = −1`, odd value not a norm from `ℚ₃(i)` | niceness not an isometry invariant: correct | none |
| 2.4 Check | `a₀ = 3`, `a₁ = 145`, `v₁ = 5` | `3` nonsquare mod 5; `145 = 5·29 ≡ 1 mod 72` | nice and anisotropic over `ℚ₅` | none |
| 3.5 | all lower values zero; some `w̃(a_j) > 0` | `w̃(a_d) > 0` by §6.5; `2NΣ > N w̃(a_i)` | strict inequalities hold | none |
| 3.7 | lexicographic `w(y) = (1,0)`, `w(x) = (0,1)` | `𝔭` = positive first coordinate; coarsening `y`-adic | correct | none |
| 4.2, 4.5, 4.7 | `Stab(∅)`, `Stab({1})`, `Stab(ℤ)`, `Stab(ℤ ∪ ℤ√2)`; ball at `w(a) = 3` | `K`, `{1}`, `ℤ`, contains `√2`; `π²O_w`, stabilizer `O_w` | correct | none |
| 4.6 | `a_d = (a_dβ/τ)²(1 − 1/β)` | `a_d²(β² − β)/τ² = a_d` | identity holds | none |
| 5.1 Check | tail `⟨1, −3, −5, 15⟩` | `(5,3)₂ = +1`; `(5/3) = −1` | correct | none |
| 5.5 | `x ∗ 1`, `x ∘ 2`; char 2, `n = 3`, `c_n = 3` | `x`, `x`; threshold `2v(3) = 0` finite, `2v(6) = ∞` | README threshold usable; printed one is not | Source issues |
| 5.6(c) | `𝔽₅(s)`, `x = s`, `b = s`, `b′ = 2s` | `a = 0`; `a(1) = −1/3 = 3 ≠ 0` | targets needed: correct | none |
| `exists_formula_isGeometricPrimeDivisor` (5.7) | `d = 0`; `d = 1` number field, function field; `d = 2`, `ℚ(t)`; `d = 4` char 2 | false formula; no fibre, all places; `t`-adic and `∞` occur, `ℤ_(p)[t]_{(p)}` excluded by the characteristic clause; excluded by the hypothesis | true as typed | none |
| `exists_formula_arithmeticNormalization` (6.9) | `(d,e) = (1,0)` `ℚ`; `(1,1)` `𝔽_q(t)`; `(2,1)` `ℚ(s)`; `(0,0)` `𝔽₄`; `e ∉ {d, d−1}`; `T = (t²)` in `𝔽₂(t)` | `ℤ`; `𝔽_q[t]`; `ℤ[s]`; `𝔽₄`; vacuous; `𝔽₂[t]` | Lean equals 6.9 with `Subring.closure` | none |
| 6.3, 6.8 Checks | `k[t², t³]`; `ℚ(i)`, `5 = (2+i)(2−i)` | intersection `k[t, t⁻¹]`; `1/(2−i)` admitted by one prolongation | correct | none |
| 7.2, 7.3 Checks | `𝔽₂[t, t⁻¹]`, `s = t + t⁻¹`; `ℤ[√5, t]` | `t² − st + 1 = 0`; core `ℤ[√5]`, conductor contains 2 | correct | Source issues |
| `…_of_isDomain` (8.4) | `B = 𝔽₉`; `B = ℤ`; `S` the zero ring; `S = ℤ/4` | `θ₉`; fails in `ℤ[i]`, `ℤ × ℤ`; fails the field conjunct or `0 ≠ 1` | true; akns line 961 | none |
| `exists_sentence_realize_iff_nonempty_ringEquiv` (8.5) | `K = 𝔽₄`; `K = ℚ`; `L` of characteristic two and dimension five | `θ₄`; fails in `ℚ(i)`, `ℚ(t)`; `L` carries no hypothesis | equals dittmann_pop lines 44–46 in the unconditional cases | none |

Elaborated signatures: the worker's elaborated types of the 10 declarations were compared with the README statements one by one; no binder is lost (every theorem quantifies its fields inside the statement; the two definitions mention all their binders); nothing changed. No Lean was run in this pass.

Dependency check output: `depcheck: 239 roadmaps, 2265 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

## Verified sound

- Declarations read: 10 of 10 (2 definitions, 8 theorems). Single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, docstring names the two families of headlines that are not statable.
- Headline theorems (from the Summary and Layers 0, 5, 6, 7, 8): fixed Kronecker dimension, the characteristic sentence, the constant field, algebraic dependence, geometric prime divisors, the normalization formula, the domain sentence, the field sentence (all stated); bi-interpretability of fields and of domains with `ℤ` and the characteristic-two cases above dimension three (named as not statable). Rumely's theorems are the cases `d = 1` of the divisor and normalization headlines. The principles of Layer 1 are inputs, not end theorems.
- Targets read: 74 numbered sections, all of them, with every *Needs:* line.
- Locators verified against the cached texts: 115 (poonen_uniform 24, dittmann_pop 27, akns 16, pop_eei2 12, stacks 10 of which 9 on the Stacks project site, kerz_saito 5, jannsen_hasse 5, wittenberg_albanese 3, achter_casalaina_vial 3, poonen_bertini 3, rumely 2, pop_eei 2, cossart_piltant 1, serre_albanese 1, waterhouse 1). All agree with the README except as R01 says.
- Checks tested with computed values: 61 (the table above lists the ones that carry a number); every definition has at least three Checks.
- Sibling and main citations: 78 section or layer citations located at the cited roadmap's current head or on main (a helper located them; R05, R06, R07 and the ClassFieldTheory, ArithmeticGaloisDuality, NeronModels and GlobalNumberFields passages were read by me). All exist with the content the README ascribes to them except R05–R07. Section titles differ from the README's descriptions at AlgebraicModuliForArithmeticGeometry §7.5, ClassicalAdicEtaleCohomology §11.2, ColemanIntegrationPartII §4.0b and SieveMethodsAndPrimePatterns §5.4, where the cited statement is a paragraph of the section; the content is there.
- Pinned names: all Mathlib and Tau Ceti names of the supplier contracts resolve at the pins (`Field.FG` at `Mathlib/Algebra/Field/Subfield/Basic.lean:458`, a finite set whose subfield closure is `⊤`; the five `TauCeti.Place` lemmas with the hypotheses the README states; the three valuation-spectrum declarations). The pins have no Kronecker dimension, no interpretations and no bi-interpretations.
- Ownership against open pull requests (by object, over main and the open heads): no other roadmap states geometric prime divisors, Kerz–Saito's or Kato's principle, an Albanese torsor over a general field, the reduced-norm criterion, Rumely's or Poonen's uniform definitions, quasi-finite axiomatizability or bi-interpretability. `kroneckerDimension` has the same body as the definition of QuadraticFormInvariantsPartII (its `Suggested.lean:309`), in another namespace; a `Suggested.lean` cannot import it, and the README says it restates §5.7.
- Declared gaps: the four slugs agree between `design/plan.json` and the README; each names a supplier and a section. Not raised.
- Policy: the pull request changes only the package folder; no process words or pull-request numbers in the README or docstrings.

## Not verifiable

- kato_hasse (Corollary, p. 145; p. 149), merkurjev_suslin (Theorem 12.2), moret_bailly (Lemma 11.1) and lenstra_cm (Theorem 1(a)): uncertified, texts not read. poonen_uniform lines 144 and 326 and pop_eei2 line 257 give the same locators for the last two and for kato_hasse; nothing cached confirms the locator of merkurjev_suslin.
- The published numbering of jannsen_hasse (Theorem 0.4, Corollary 0.8, Theorem 0.10): only arXiv v2 is cached; dittmann_pop lines 158 and 223 use the published numbers the README gives.
- Whether the published version of poonen_uniform changes Lemma 4.8: only arXiv v1 is cached.
- The Annales de l'Institut Fourier volume and year of achter_casalaina_vial: only the arXiv text is cached.
- Elaboration of `Suggested.lean`: not rerun; the worker's elaborated signatures were used.
- Whether ArithmeticGaloisDuality already implies the cyclic Hasse norm theorem for function fields (the declared gap): its §R02.3.2 states reciprocity and the Brauer sequence, not the norm theorem; not raised.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, printed pp. 9–10 (arXiv v1): the source says the sums forming the second parameter set lie in the field itself and the form is tested over it; it should be sums in the quadratic extension `K_u` and the test over `K_u`, since in odd characteristic only the sum zero lies in `K`; affects a stated result.
- **Error** in poonen_uniform at the proof of Lemma 4.8, printed p. 10: the source says the pulled-back `x`-coordinate has a simple pole at the chosen point; it should be a double pole, so the slot is built from `y/x`; affects the proof.
- **Gap** in poonen_uniform at Proposition 4.10, printed p. 10: the source says that keeping the fibres that are fields of Kronecker dimension one gives exactly the relatively closed ones; it should also keep only the maximal such fibres; affects the proof.
- **Misprint** in dittmann_pop at the proof of Proposition 5.1, printed p. 16 (definition of the family of composite valuations): the source says the first valuation ranges over the rank-one set of divisors containing the basis; it should be the geometric prime `e`-divisors; affects nothing.
- **Error** in pop_eei2 at Notation/Remarks 3.5, printed p. 2102: the source says the congruence threshold is twice the valuation of `2n`; it should be twice the valuation of `n` in characteristic two, where `2n = 0`; affects the proof.
- **Gap** in akns at the proof of Theorem 3.1, printed p. 23: the source says the definable one-dimensional subring is finitely generated and therefore Dedekind; it should be so only after inverting a conductor element (it need not be normal, as for `ℤ[√5, t]`); affects the proof.

Source independence: 22 passages compared with 6 sources (dittmann_pop, poonen_uniform, jannsen_hasse, akns, pop_eei2, kerz_saito), none shared beyond statements that a formula or a list of hypotheses forces (longest run about 8 words, the hypothesis of Lemma 4.6 of poonen_uniform, line 384); largest share dittmann_pop, about 55 of 141 locators; contents compared with dittmann_pop (its §§1–5): independent. Its §2 corresponds to Layer 1 alone; §3 is divided between Layers 2 and 3, §4 between Layers 4 and 5, §5 between Layers 6, 7 and 8, and Layer 0 has no counterpart in it; the order is the one the *Needs:* lines force (3.1 needs 1.2–1.4 and 2.1; 4.6 needs 3.8; 5.2 needs 4.7; 6.4 needs 5.7; 7.6 needs 6.9; 8.5 needs 7.6).

## For the human reviewers

- **Scope.** `README.md:379–393` replaces the printed statement and proof of Lemma 4.8 of poonen_uniform by a corrected version of the roadmap's own (two changes, with a counterexample to the printed test); only arXiv v1 was read, and no refereed source states the corrected lemma.
- **Scope.** `README.md:35` excludes the non-domain cases of akns (rings with nilpotents, fibre products); the roadmap states its Theorem 3.1 and Corollary 3.2 only.
- **Not tested.** kato_hasse, merkurjev_suslin, moret_bailly and lenstra_cm are cited by locator only (`sources.toml`: uncertified); 1.5, 1.6(b), 0.9(a) and 0.11(b) rest on them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d5abbd4d133e896c70ac70295d8790b5d2d6bf45", "job": "RT-LogicAndDefinabilityInNumberTheoryPartII~1b", "model": "fable", "worker": "chris-x89"} -->
