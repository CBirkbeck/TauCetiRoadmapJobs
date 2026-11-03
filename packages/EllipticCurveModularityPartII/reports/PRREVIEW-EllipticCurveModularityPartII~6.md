# Review of EllipticCurveModularityPartII (pull request #1491 at d2cbd93)

**Verdict:** accepted

No finding. This head repairs both findings of the previous review and introduces nothing new; the gate passes, the dependency check reports no problem, and the Lean file elaborates with `sorry` as the only warning.

## Previous findings

- R01 — repaired: `packages/EllipticCurveModularityPartII/design/plan.json` now has 13 `gaps` entries; the retirement commit deletes exactly the fourteen entries named in R01 (`residual-conductor-away-from-ell`, `weight-two-reduction-alternative`, `serre-inertia-exceptional-bound`, `coefficient-bound`, `five-level-j-coordinates`, `rational-isogeny-j-tables`, `split-cartan-rational-points`, `chen-isogeny`, `integral-winding-comparison`, `cuspidal-divisor-torsion`, `modular-rank-zero`, `cyclic-isogeny-degrees`, `noncm-prime-isogeny-degrees`, `neron-torsion-specialization`) and adds nothing (85 deleted lines, one closing-bracket line changed). Each of the 13 retained slugs appears in the README with the plan's supplier.
- R02 — repaired: README lines 106–160 now read “What EllipticCurveModularity must provide (gap:elliptic-modularity), in Layers R29.3–R29.4 and R29.6: …” and likewise for the other twelve; the section citations and needs sentences are unchanged from the “From …” form reviewed before. The two Kato contracts (lines 67 and 69) keep the same form, so the README has one declaration shape.
- Settled, not re-raised: the two Kato slugs (`kato-labelled-pushforward`, `kato-labelled-reciprocity`) are still absent from the plan, as review 5 recorded under its Previous findings; a review repair adds no gap, so this stays a package-stage or human edit.

## Verified sound

:robot: Incremental AI re-review of 26 changed lines since 2a13bc7 (13 contract paragraphs rewritten, README only). I checked the thirteen rewritten paragraphs against the plan, against the six suppliers' sections at their open heads and against the README passages that consume them (lines 114, 116, 124, 138–158, 695, 707, 711, 1039 are untouched and still cite the same slugs or sections), the plan retirement commit, both previous findings, the gate, the dependency check and the elaboration. `Suggested.lean` is byte-identical to the head of review 4, so its evidence is carried.

The worker's gate passed, and my rerun passed every check:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's targeted build reported `build=0`. `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` produced 13 `declaration uses 'sorry'` warnings, no error, exit 0. The 24 elaborated signatures in the worker's inventory are those review 4 compared with the README (no binder lost); the file is unchanged, so the `#check @` comparison of review 5 stands. The dependency check returned:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. In the merge order the six gap suppliers precede this roadmap (line 182): ArithmeticGaloisRepresentations 42, NeronModelsAndSemistableAbelianVarieties 47, ModularCurvesPartII 71, SerreWeightAndLevelOptimisation 148, AutomorphicGaloisRepresentations 150, EllipticCurveModularity 154; PadicFamilies is at 156. `git diff --stat origin/main...HEAD` outside the folder is empty. No principle is touched by the diff: no shortcut, no re-planned roadmap, no copied passage, no algorithm, no sorry'd data, no `set_option`.

### The thirteen declared gaps

Each slug is in the plan with the supplier the README names; each is precise (one statement with its hypotheses) and minimal (none of the six suppliers is on main; each section cited states the contract at its open head, read with the roadmap service, lines below are of that copy):

- `elliptic-modularity`: EllipticCurveModularity Layers R29.3 (line 1020), R29.4 (1261), R29.6 (1605) build the attached newform with exact coefficients, exact conductor and the converse.
- `optimized-weight-two-lift`: SerreWeightAndLevelOptimisation Layers 2–4 (301, 610, 944) and §4.8 (1076): `ℓ≥5`, odd irreducible modular finite-flat `ρ`, weight-two witness at tame level `N(ρ)`; its Checks exclude `ℓ=2,3`, matching the contract's `ℓ≥5`.
- `deletion-level-lowering`: SerreWeightAndLevelOptimisation §6.1 (1368) defines `M₀=M/∏q` over `v_q(M)=1`, `ℓ∣v_q(Δ)`; §6.2 (1400) gives the weight-two trivial-character newform at `M₀` for `ℓ≥3`, irreducible `E[ℓ]`, with a modularity witness as input; §6.3 (1418) states the good-prime and removed-prime congruences of Bennett–Siksek Lemma 2.1(i)–(ii) with `q≠ℓ`.
- `elliptic-conductor-and-weight`: ArithmeticGaloisRepresentations Layer 3 (2375) defines conductors and `N(ρ̄)` and itself assigns the elliptic comparisons to NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3i (5.3a at 3313, 5.3h at 3496); §§6.1–6.3 (3632, 3828, 3871) give the Tate module, determinant and Tate curve; SerreWeightAndLevelOptimisation Layer 3 (610) is the weight recipe.
- `complex-conjugation-on-torsion`: ArithmeticGaloisRepresentations §4.1 (2844) defines complex conjugations and oddness; §6.2 (3828) identifies the determinant with the cyclotomic character.
- `odd-irreducible-absolutely-irreducible`: ArithmeticGaloisRepresentations §4.1, paragraph “Absolute irreducibility from oddness” (2870): irreducible odd `ρ`, `char k≠2`, is absolutely irreducible (Serre 1987, 3.3).
- `dickson-classification`: ArithmeticGaloisRepresentations §4.4 (2970) Dickson's theorem; §4.5 (2992) Serre's Propositions 15–16 over `𝔽_ℓ`.
- `newform-residual-representation`: AutomorphicGaloisRepresentations §6.2 (2494): semisimple residual attachment at `λ` compared with the semisimplified reduction of a fixed lattice.
- `modular-abelian-conductor`: AutomorphicGaloisRepresentations §6.1 (2481) `V_ℓ(A_f)` free of rank two over `K_f⊗ℚ_ℓ`; §6.4 (2568) prime-to-`ℓ` conductor equal to the prime-to-`ℓ` part of `N`; ModularCurvesPartII §§16.2–16.6 (4120–4201) the quotient and `dim A_f=[K_f:ℚ]`.
- `mixed-modular-curves`: ModularCurvesPartII §§3.8–3.12 (1111–1221), §5.2 (1666), §§5.10–5.11 (1836, 1853), §9.6 (2691, Cartan curves of degrees `ℓ(ℓ±1)` and `ℓ(ℓ±1)/2`).
- `mixed-modular-jacobians`: ModularCurvesPartII §9.1 (2561), §§13.1–13.3 (3239, 3287, 3330), §14.15 (3840).
- `newform-quotient`: ModularCurvesPartII §16.5 (4175), `A_f⁰=J₀(N)/B_f⁰` with `dim=[K_f:ℚ]`, with §§16.2–16.6 and AutomorphicGaloisRepresentations §6.2.
- `optimal-quotient-cotangents`: NeronModelsAndSemistableAbelianVarieties §6.4d (3944): `e<p−1`, `B` semistable, exact sequences of free `𝒪`-modules on Lie and cotangent sides.

The plan's `needs` sentences are the design-stage wording; where the README's sentence differs it adds a hypothesis or a qualification the supplier also states (modularity as an input in `optimized-weight-two-lift` and `deletion-level-lowering`; semisimplification and residue-field extension in `optimized-weight-two-lift`, `newform-residual-representation` and `newform-quotient`), so the README asks no more than the plan announces.

### Adversarial table: changed statements

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Line 106 `elliptic-modularity` | E=11a1, `y²+y=x³−x²−10x−20`, q=2,3 | mod 2: affine points (0,0),(0,1),(1,0),(1,1), #E(𝔽₂)=5, a₂=−2; mod 3: x=0 none, x=1 two, x=2 two, #E(𝔽₃)=5, a₃=−1; newform 11a has c₂=−2, c₃=−1; conductor 11 = level 11 | Equal traces at good primes and exact conductor as the contract states. |
| Line 108 `optimized-weight-two-lift` | E=37a1, ℓ=5; E=11a1, ℓ=5; ℓ=3 | 37a1: no rational isogeny so E[5] irreducible, good at 5 so weight 2, N(E[5])=37, witness the level-37 rational newform; 11a1: E[5] reducible (rational 5-torsion), excluded by hypothesis; ℓ=3 excluded by ℓ≥5 and by the supplier's own Check | Hypotheses match SerreWeightAndLevelOptimisation §4.8; the reducible case is correctly outside. |
| Line 110 `deletion-level-lowering`, M₀ | E=141a1 (M=3·47, Δ=3⁷·47), ℓ=3; E=19a1 (M=19, Δ=−19³), ℓ=3; E=11a1, ℓ=5 | 141a1: 3∤7, 3∤1 so M₀=141 (supplier's Check agrees); 19a1: v₁₉(M)=1 and 3∣3 so M₀=1, but E[3] reducible; 11a1: 5∣5 so M₀=1, E[5] reducible | Irreducibility is necessary: S₂(Γ₀(1))=0, so the lift at M₀=1 cannot exist for the two reducible cases; the contract carries the hypothesis. |
| Line 112 `elliptic-conductor-and-weight` | E=11a1, ℓ=5; E=37a1, ℓ=3 | 11a1: M=11, multiplicative at 11 with 5∣v₁₁(Δ)=5 so N(E[5])=1, weight 2; 37a1: M=37, 3∤v₃₇(Δ)=1 so N(E[3])=37, weight 2 | Three outputs defined with no irreducibility hypothesis, as stated. |
| Line 118 `complex-conjugation-on-torsion` | E: y²=x³−x, ℓ=3; ℓ=2 | det E[ℓ]=χ_ℓ, χ_ℓ(c)=−1; E(ℝ)[3]≅ℤ/3 so the +1-eigenspace has dimension 1 and the other eigenvalue is −1; ℓ=2: −1=1, eigenvalues not distinct | Odd ℓ needed and present. |
| Line 120 `odd-irreducible-absolutely-irreducible` | ℓ=2 image cyclic of order 3 in GL₂(𝔽₂), c=1; ℓ odd | order-3 image irreducible over 𝔽₂, reducible over 𝔽₄, and c has eigenvalues 1,1=1,−1; for ℓ odd c is nonscalar with split polynomial (T−1)(T+1) | ℓ=2 is excluded by the contract and by the supplier's char k≠2 clause. |
| Line 122 `dickson-classification` | p=3: H=SD₁₆ (order 16); H with projective image A₄ | \|GL₂(𝔽₃)\|=48, \|SL₂\|=24; SD₁₆⊉SL₂; 𝔽₉^× has order 8, its normalizer order 16 = SD₁₆: nonsplit Cartan normalizer; preimage of A₄⊂PGL₂(𝔽₃)≅S₄ is SL₂(𝔽₃), which has no subgroup of order 12, so no such H exists | Alternatives exhaustive at p=3; A₄ case vacuous there, consistent with Serre Prop. 16. |
| Line 126 `newform-residual-representation` | f=11a, λ=(5), q=2 | T²−c₂T+2=T²+2T+2; (T−1)(T−2)=T²−3T+2≡T²+2T+2 mod 5 | Semisimplification 1⊕χ₅ has the stated Frobenius polynomial; arithmetic convention kept. |
| Line 128 `modular-abelian-conductor` | f=11a (d=1); level-23 newform (K_f=ℚ(√5), d=2) | conductors 11¹=11 and 23²=529; dim A_f=1 and 2=[K_f:ℚ] | Nᵈ with d the coefficient degree. |
| Line 132 `mixed-modular-curves` | r=2, p=11, H=nonsplit normalizer; q=2,5 | degree over X(1): ψ(2)·11·10/2=3·55=165; q=5∤6·2·11 admitted, q=2 excluded | Coprime fibre product has multiplicative degree; bad primes excluded as stated. |
| Line 134 `mixed-modular-jacobians` | r=3, p=11, n=2,11 | gcd(2,11)=1 so T₂ supplied; n=11 excluded | T_n only for n prime to p. |
| Line 136 `newform-quotient` | f=11a, ℓ=5; models 11a1 and 11a3 | C=J₀(11); C[5]^ss=1⊕χ₅=ρ̄_{f,5}^ss; the isogeny 11a1→11a3 has degree 5, not prime to ℓ, yet the semisimplifications agree | The “no prime-to-ℓ hypothesis” clause is correct for the semisimplified comparison. |
| Line 160 `optimal-quotient-cotangents` | K=ℚ_q, e=1, q=2 and q=37; J=J₀(37), A=37a, B=37b | q=2: 1<1 false, excluded (Mazur's p. 138 example); q=37: 1<36; ranks 1+1=2=dim J₀(37) | Exactness of free modules with the essential bound. |
| Plan registration | README `gap:` markers; plan `gaps` | README markers 15 (13 contracts + 2 Kato); plan entries 13; common slugs 13; entries whose README owner is local or another supplier 0 | R01 repaired; the two Kato slugs remain the settled package-stage addition. |

### Adversarial table: carried rows

The diff touches no theorem, definition or Check. The rows below are carried from review 5 and, through it, from reviews 3 and 4; they cover the seeded sample and the headline theorems. Line references are those reports' heads; the statements are unchanged.

| Statement / definition | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Labelled a(A) domain and map, line 67 | p=7,N=5,m=2,A=1,c=5,d=11,S={2,7} | gcd(55,6)=gcd(11,5)=1; prime(cd)∩S=∅; prime(mA)={2}⊆S | Source domain agrees. Carried from review 5. |
| Raw versus labelled reciprocity, lines 69 and 707 | Raw (2,5); auxiliary (14,70) | {2}⊄{5}, but {2,7}⊆{2,5,7}; 7 divides 14 | Final-level extension needed. Carried from review 5. |
| Conventions: arithmetic Frobenius | E:y²=x³−x, q=5 | #E=8, a₅=−2; det(1−FT)=1+2T+5T² | Keep arithmetic convention. Carried from review 3. |
| Conventions: modular differential and path | f=e²πⁱᶻ+2e⁴πⁱᶻ; reverse path | W=i/π; 2πiW=−2; reverse +2 | Keep factor and direction. Carried from review 3. |
| Conventions: residual versus deletion level | Multiplicative exponent divisible by ℓ; additive at ℓ | Deleted exponent 1 becomes 0; additive coefficient-prime exponent positive in M₀, 0 in N(E[ℓ]) | Keep separate levels. Carried from review 3. |
| 1.1 Martin's prime-power table and 1.2 `martinValue` (sample) | N=0,1,2,3,4,11,13,30,35,121 | 0,0,0,0,0,1,0,1,3,4; integral and ≥0 for 1≤N≤2000 | N=0 is the chosen totalization. Carried from review 3. |
| 1.3 `dimension_comparison` (sample, headline) | N=1,11,35 | Formula 0,1,3; trivial-character newspace dimensions 0,1,3 | Γ₁ newspace intersected with trivial character. Carried from review 3. |
| 1.4 `martin_bound` (headline) | N=1,11,30,35,121 | 0<2/12; 1=12/12; 1<31/12; 3=36/12; 4<122/12 | Equality criterion matched. Carried from review 3. |
| 2.1 `norm_bound` (headline) | K=ℚ, I=(5), x=5, B=5; x=0 | 5≤5≤5¹; x=0 would need 5≤0 | Nonzero x needed. Carried from review 3. |
| 3.1–3.2 small-prime coefficients (sample, headline) | Level 11 | μ=12; primes through μ/6: {2}; a₄=a₂²−2=2 | Inclusive bound and recurrence agree. Carried from review 3. |
| 4.1 Kraus filters, 4.2 `integral_sturm_congruence` (sample, headline) | k=0,N=1; Δ with J=(0),(1),(6) | Bound 0, coefficient-zero difference 1∉(2); a₁=1: 1∉(0),(6), 1∈(1) | Coefficient zero kept; unit ideal vacuous. Carried from review 3. |
| 4.3 point counts mod four, 4.4 trace transfer (sample) | N=11; q=7 | μ(44)/6=12; 4√7=10.583…<G♯=19.928… | Strict gap at the largest eligible prime. Carried from review 3. |
| 4.5 Matrix selection (sample) | All of GL₂(ℤ/4) | 96 matrices; 24 fix 2e₁ with det(1−g)=0 | Exhaustive check agrees. Carried from review 3. |
| 4.7a Weight-two reduction alternative | Exponents 0,11,1 at ℓ=11 | Residues 0,0,1 mod 11 | Local target, not a gap. Carried from review 3. |
| 4.8 Conductor adapter (sample) | Good, multiplicative divisible, additive at ℓ | M₀ exponents 0,0,positive; N(E[ℓ]) exponents 0,0,0 | Residual formula is Néron §5.3h's. Carried from review 3. |
| 5.0a, 5.0b isogeny degrees (headlines) | n=1,19,20,21,25,27,37,43,67,163; CM boundary | true,true,false,true,true,true,true,true,true,true; 41 in neither list | Local targets. Carried from review 3. |
| 5.1 `HasCyclicIsogeny`, `NonCM` (sample) | Identity; [2]; y²=x³−x over ℚ(i); ℓ=2,5 | Kernel orders 1 and 4 (C₂×C₂ not cyclic); [i]²=[−1]; orders 4,25 | Native carriers. Carried from review 3. |
| 5.2 No degrees 2ℓ or 4ℓ | ℓ=5,7,11 | 20,28,44 excluded; 22 excluded; 10,14,12 allowed | Carried from review 3. |
| 5.4 `full_two_irreducible`, 5.5 `rational_two_irreducible` (sample, headlines) | ℓ=5; ℓ=11 vs 7 | Reducible would give 20; 22 excluded, 14 allowed; conjugation eigenvalues 1,−1 | Uses the complex-conjugation contract of line 118. Carried from review 3. |
| 6.0a Genus-zero coordinates | r=2, t=8; u=2t; r=7 | f₂(8)/8=1728; f₂(16)/16=2048≠1728; constant term 1³·49=49 | Carried from review 3. |
| 6.0b Rational j tables | r=11,17,37 | Cardinalities 3,2,2; −2¹⁵=−32768 | Carried from review 3. |
| 6.0c Cuspidal divisor torsion | ℙ¹; zero divisor | Pic⁰(ℙ¹)=0; degrees 0 and 1 | Imported from EisensteinIdealAndRationalTorsion §7.9. Carried from review 3. |
| 6.0d Winding lattice and period (sample) | ℤ₅² with rational x-axis; f=q, q+2q², q−2q² | Saturation ℤ₅×0; periods −1,−2,0 | Uses the cotangent contract of line 160. Carried from review 3. |
| 6.0e Rank zero | d=2; orders 5,7 | ℤ-rank 0; 35 | Carried from review 4. |
| 6.0f Split-Cartan points and isogeny bound | m=2,3; p=13,7; d=1,h=0 | 1.4·10⁷<10¹⁴; X₀⁺(49) genus 0; B=9,702,250,000,000 | Carried from review 3. |
| 6.0g Exceptional images (sample) | p=17,19 | 17>17 false; 19>17 true; orders 12,24,60 | Uses the Dickson contract of line 122. Carried from review 3. |
| 6.0h Torsion specialization | e=1, q=23; e=1, q=2 | 1<22 true; 1<1 false | Carried from review 3. |
| 6.1 `ImageInNonsplitCartanNormalizer` | p=11 | Field order 121, normalizer 240; GL₂ order 13200 | Carried from review 3. |
| 6.2 Potential good reduction | p=11; q=2,23 | 4≠1 mod 11; 23²=1; cyclotomic image order 10>2 | Carried from review 3. |
| 6.4 Cartan correspondence | p=2,3,5 | 3+1=1+3; 6+1=3+4; 15+1=10+6 | Carried from review 3. |
| 6.7 Support and cotangent comparison | p=11, q=23, f=t+2t² | ω=(11+22t)dt, cusp value 11dt≠0 mod 23 | Carried from review 3. |
| 6.9 Integrality of j away from p, 6.11 `lemos_integral_j` (sample, headline) | p=11; j=22/11, 1/11 | v₁₁(2)=0 admitted; v₁₁(1/11)=−1 excluded | Carried from review 3. |
| 6.10 `nonsplit_of_not_surjective` (sample, headline) | p=41 | SL₂ order 68880 × determinant image 40 = 2755200 | Uses the Dickson contract of line 122. Carried from review 3. |
| 6.14–6.16 j-candidate sets, five genus-zero levels, surjectivity of j, 6.18 `lemos_surjectivity` (sample, headline) | Degree 1 vs >1; p=37,41 | 1>1 false; 37>37 false; 41>37 true | Carried from review 3. |

### Pinned declarations and ownership

The pins are unchanged (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` in `lake-manifest.json`) and `Suggested.lean` is unchanged, so the seven native declaration groups opened in review 4 (`TauCeti.Isogeny`, `WeierstrassCurve.torsionGaloisAction`, `HeckeRing.GL2.Newform`, `TauCeti.cuspFormsNew`, `cuspFormCharSpace`/`modFormCharSpace`, `WeierstrassCurve.j`, `Representation.IsIrreducible`) are carried. The thirteen contracts build nothing: each names its supplier and section, and I confirmed with the roadmap service that each supplier is an open pull request earlier in the merge order whose cited sections exist at its head (the section list above). The ownership of the labelled Kato classes (PadicFamilies §§4.0.1–4.0.2) and of the three imports retired from the plan (NeronModelsAndSemistableAbelianVarieties §5.3h, EisensteinIdealAndRationalTorsion §7.9, WeightsInEtaleCohomology R34.6) is as review 5 resolved it; the lines that consume them (114, 124, 138–158) are unchanged.

### Headline coverage and form

Unchanged since review 4: thirteen statable headlines stated with `sorry`, eleven real-bodied definitions, the module docstring names the missing carriers and the two Kato contracts, no stand-in. The one-tactic padding probes of review 3 are carried; the diff adds no declaration.

## Not verifiable

- **Kenku1982, pp. 199–201:** settled uncertified citation; not read; the degree-list controls are carried from review 3.
- **Incremental scope:** the fifteen sampled targets lie outside the thirteen changed paragraphs; their locators, Checks and padding probes are carried from reviews 3–5 as marked. The supplier sections were checked for existence and for stating the contract, not re-read in full. Ownership against open pull requests was checked only for the objects of the changed lines.
- **Future proofs:** the computed witnesses test the hypotheses, conventions and degenerate cases of the contracts; they do not prove the planned lifting, conductor or cotangent theorems.

## Source issues

No source was reopened for the changed lines (the thirteen paragraphs cite suppliers, not sources). The following five items are carried from reviews 3–5 for the register.

- **Misprint** in DarmonMerel2001 at proof of Proposition 7.1, printed p. 20, line 648: the source says L(f,1) equals 2πi times the upward integral from zero to i∞; it should be minus that normalized integral; affects the proof.
- **Error** in Lemos2017 at proof of Theorem 1.1, p. 5, line 194: the source says J₀(37) has rank zero; it should be positive rank, so that rank-zero explanation cannot establish the rational-point table; affects the proof.
- **Misprint** in DarmonMerel2001 at proof of Lemma 8.2, p. 22, line 741: the source says dt/t is a basis of the cusp cotangent for t=q^(1/p); it should be dt, with the cusp-form differential evaluated using its first coefficient; affects the proof.
- **Misprint** in Chen1998 at quotient-map convention following Theorem 2, p. 2, line 66: the source says H⊂K induces X_K→X_H; it should be X_H→X_K; affects the proof.
- **Gap** in BPR2013 at proof of Proposition 3.3, p. 9, line 462: the source says to use an isogeny bound with cutoff 1000 to deduce the displayed cutoff-985 conclusion; it should use the sharper bound stated in Theorem 3.1 directly; affects the proof.
